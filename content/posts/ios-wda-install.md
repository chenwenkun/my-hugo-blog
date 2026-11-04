---
title: iOS WDA作为App独立运行
date: '2025-09-25'
tags:
  - 技术
draft: false
author: chenwenkun
toc: true
show_reading_time: true
---
## 目标

把 WebDriverAgent（WDA）**打包成可独立安装运行的 iOS App（.ipa）**，用于：

- 不依赖 Xcode 直接在真机上启动 WDA
- 远程/自动化环境更方便地拉起 WDA 服务
- iOS 17+ 也可用（按你的记录验证）
---

## 已验证情况（来自原始记录）

- iOS 16.6：运行闪退
- iOS 18.3 / 18.4：可正常安装运行
---

## 背景：WDA 与维护者

- WDA 最早来自 Facebook（现已不活跃）
- 当前常用维护版本由 Appium 维护（建议优先使用 Appium 维护分支）
（下方保留原始对象/链接块）

---

## 步骤 1：下载代码 & Xcode 首次构建

1. 下载/拉取 WebDriverAgent 代码
1. 用 Xcode 打开工程并先构建一次（确保依赖齐全）
1. 修改 `Bundle Identifier`
1. 选择并勾选你自己的 Apple ID（签名用）
（下方保留原图）

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466ZIVNX7KH%2F20261104%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261104T132655Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEOX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQC909qKpHu1wc7iK4qgFgEWftuvmvzJMRUbv5VCk7fVUwIgLiH3lx9Bb4YrwEroJwO%2FreI%2BA3287ufhMdWeGq65gOoqiAQIrv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDOPzd6WUxt9XbUj%2FmircA0PYQyl9MFI5hRcw%2BMHdFJwYbYUo%2BqI1rQSjMsFNIq5E3BzfTcj7d7r1nQFnL64YNPaCUUAA0vjwRo5WCBgcjwDVD9rEdRl6cIzA3aseyrCbCSYFU03vXDFHOKSsp8LfKJMlE2mOYuHfNsJ%2B7Tz%2Fk9KdluM5FtlxLcIjDzzga7tCXJ4AiYxWbGUiYp0ec5zDaD0l4DQ8a6R45W%2Fi7ccZLv5el53x8m6GcMcsCGqzAYnEeFLx5aeM2HsXC63kXOZ1fAd2BIGyGBxUQkE8lHIHI0Oj7fg3IYzD4zqdU8U%2BA1Cad1oXjR8sTjYuwZBH6m9BfKFNSDSxvyFUt2KNCXRyaGX4qI%2B2mIGA3t%2FUMHsNh0cxbYK7cQmiSBU54HrtAJuusPpNUn4uY%2BddQAvMDp6bpoO29Wn%2BW1U0A%2Bg0q5eWy7udlBYF3jM2cPTXWPtA3tXNJ6%2BfZSzsQbzN64rJonqLhWWIZnc8htyX4lUEwPEt%2BJmvAbPVGRXc%2FQy%2FLbSiZABLSADc7w4OHBvQZR%2BjsGm%2F0%2BzBX%2FuhAj8db9PrmlmD0xATVpasqGtRY%2FXW10oxBx8xRo%2FlQA1T%2FfwuEe%2B8fh%2FHKaFKWuvqQE5SnYzzKQkVEFouJm9vDPQugJNynC6OMITNrNcGOqUB%2B88vA2FtKe6wB%2BQO7GQ6Mp5zn2jsB5Z2oXkT0uLWW%2FmY51RlckG7UIWL86ATUqiORofI4LaMArCxyeljF1n3n7Xx5uxmFsc1grAfZW3jvGPtiwvQQqg8W8%2FZ0UhIT9G84fmHo3xo6zV611p4Uib1nfGYpVcgaDf2%2Bn27LArI52ZbMBKMu6%2B4aua6BzVEAHWXG14GJxZge3YZhflljOVKgheBBChl&X-Amz-Signature=6f0e144ed2c997e126b0efcea21c905247189e3e37e436c3bde198d88851e2c3&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 步骤 2：用 xcodebuild 产出可用于打包的构建产物

```bash
cd /Users/chenwenkun/Downloads/androidandios/iosui/WebDriverAgent/WebDriverAgent

# 使用 xcodebuild 构建 WebDriverAgentRunner 用于测试
xcodebuild build-for-testing \
  -scheme WebDriverAgentRunner \
  -sdk iphoneos \
  -configuration Release \
  -derivedDataPath /tmp/derivedDataPath

# Apple Silicon（可选）显式指定 arm64
xcodebuild build-for-testing \
  -scheme WebDriverAgentRunner \
  -sdk iphoneos \
  -configuration Release \
  -derivedDataPath /tmp/derivedDataPath \
  -arch arm64
```

---

## 步骤 3：组装 Payload 并打包 ipa

```bash
cd /tmp/derivedDataPath
cd Build/Products/Release-iphoneos

# 创建 Payload 并复制 .app
mkdir Payload && cp -r *.app Payload

# 打包 ipa
zip -r WDA.ipa Payload
```

---

## 步骤 4：清理 Frameworks（关键）

进入：

`WebDriverAgentRunner-Runner.app/Frameworks`

把 **XC 开头的文件全部删掉**（按你原记录的踩坑经验）

（下方保留原图）

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466ZIVNX7KH%2F20261104%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261104T132655Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEOX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQC909qKpHu1wc7iK4qgFgEWftuvmvzJMRUbv5VCk7fVUwIgLiH3lx9Bb4YrwEroJwO%2FreI%2BA3287ufhMdWeGq65gOoqiAQIrv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDOPzd6WUxt9XbUj%2FmircA0PYQyl9MFI5hRcw%2BMHdFJwYbYUo%2BqI1rQSjMsFNIq5E3BzfTcj7d7r1nQFnL64YNPaCUUAA0vjwRo5WCBgcjwDVD9rEdRl6cIzA3aseyrCbCSYFU03vXDFHOKSsp8LfKJMlE2mOYuHfNsJ%2B7Tz%2Fk9KdluM5FtlxLcIjDzzga7tCXJ4AiYxWbGUiYp0ec5zDaD0l4DQ8a6R45W%2Fi7ccZLv5el53x8m6GcMcsCGqzAYnEeFLx5aeM2HsXC63kXOZ1fAd2BIGyGBxUQkE8lHIHI0Oj7fg3IYzD4zqdU8U%2BA1Cad1oXjR8sTjYuwZBH6m9BfKFNSDSxvyFUt2KNCXRyaGX4qI%2B2mIGA3t%2FUMHsNh0cxbYK7cQmiSBU54HrtAJuusPpNUn4uY%2BddQAvMDp6bpoO29Wn%2BW1U0A%2Bg0q5eWy7udlBYF3jM2cPTXWPtA3tXNJ6%2BfZSzsQbzN64rJonqLhWWIZnc8htyX4lUEwPEt%2BJmvAbPVGRXc%2FQy%2FLbSiZABLSADc7w4OHBvQZR%2BjsGm%2F0%2BzBX%2FuhAj8db9PrmlmD0xATVpasqGtRY%2FXW10oxBx8xRo%2FlQA1T%2FfwuEe%2B8fh%2FHKaFKWuvqQE5SnYzzKQkVEFouJm9vDPQugJNynC6OMITNrNcGOqUB%2B88vA2FtKe6wB%2BQO7GQ6Mp5zn2jsB5Z2oXkT0uLWW%2FmY51RlckG7UIWL86ATUqiORofI4LaMArCxyeljF1n3n7Xx5uxmFsc1grAfZW3jvGPtiwvQQqg8W8%2FZ0UhIT9G84fmHo3xo6zV611p4Uib1nfGYpVcgaDf2%2Bn27LArI52ZbMBKMu6%2B4aua6BzVEAHWXG14GJxZge3YZhflljOVKgheBBChl&X-Amz-Signature=413d8302bbe639cd3a9c676e1f50a9ae511e1b54984540fb068430c114de01d7&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 步骤 5：重签名（Re-sign）

使用工具进行重签名：

- iOS App Signer / App Resigner
- 你原文参考链接（保留）：  
产物：保存为 `WDA2.ipa`

（你记录里提到：个人开发者证书可用）

---

## 步骤 6：安装到真机（tidevice）

```bash
pip install tidevice

tidevice install WDA2.ipa
```

---

## 步骤 7：启动与验证

1. 手机上点击 WDA 图标启动
1. 浏览器打开：
- http://localhost:8100/status
出现一段 JSON 即正常。

---

## 附件（保留）

---

## 国内环境补充（你的原始备注整理）

如果需要把端口映射到电脑端进行访问/调试：

```bash
brew install --HEAD libimobiledevice
iproxy 8100 8100
```

然后在电脑端访问 `http://localhost:8100/status`。

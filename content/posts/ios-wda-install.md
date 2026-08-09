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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466ZEPNGGDR%2F20260809%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260809T182330Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEMH%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCCLQcCjFfnaiVPBSNLeeJ%2Bd8W5zar1ut%2FtFFUvVH1KPQIhAOFPdGCWL16YjcHOBpX0HHK%2FPncEVbX%2FPMT89E4%2BNcrrKogECIr%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1Igy3lYiGdrhEoBJ0fvYq3ANgwtzpvHOmhmz0oBcgs4AKGVzd%2BSlkvHKVeOtr9zoUbMPc2H5F0AyV8Px0J2O5iOjgoGrZm%2BTfkAnG5XiHmqTjVehAMhSo7nZv96QH%2BSXen0gOgSBaR6nqIidMbkyCBSkA4ieUx8JhVcQ517zWa1BdQe7WL8Of9HzZuDMFj%2BZy4s%2FXqifmkzYQHJc83%2BMxMMY1F8OiWVT4kzTWJ%2FkvOK6hAtceMxyp651hU1enENSV3wgxoaB980gYjMBXXJcbNgDS9nmKOA%2F4p6XVvkrbONGFYzC1Fmnibi6g2dLH521US%2Fa2wVd%2BRuGTt4RiyDHLrk11PSybKvNuZwvtAb%2BUpvv4QoLCtVJyJAjQh%2BXegA3r0rkE9nG8pAIqwI%2FSAla4eRnqIEBiNCPyWnqbfBT%2BCKCF4iqOSM9ZYSRFYe5s6XwH1RWOPaGVWrJd0J1ePG%2BIZCYY9fvzhy8zkcko%2B3idV43yX8vuJromCpoPr3m7ZhGCtLnYqOwd4b1lojlP6%2FGDoK1QWWjZ9aJMVg0egpxoC77UTOj0DWIPQ9eKfFJM4raBjyQ6nJfD7AcEXGTGzoO5BEXV4%2Fx7SrVhW8Zv4rqrwMZ8uTNEsYVY1tNJFc7uH6h56lyVa0TL0NIB7jAdLDDF1%2BLTBjqkAdDxDPUHS%2BSer0R8TwiPThHFW5IphaLw5jB7UuSFaFo2rWLAJRyqVl1Ev83CLgTW%2Bpspypf6JNYLOvqmPrQQWv26yxe%2BFQ0Vquc3LybVS1YcTFc9mR6LMA%2B3ruQyJ9ylrhpyp8ut9571T%2Ftapa7emPn3PHzgktmbz3hM%2F1cukFdPFSI8os1yDSGdjYn95tkls9kL9k023xGGl9UJgAlrxi2qvkXH&X-Amz-Signature=7056c77327e5d5b80a80bf66dbde2943f786ba6e776f1ac293511cb3c1604620&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466ZEPNGGDR%2F20260809%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260809T182330Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEMH%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCCLQcCjFfnaiVPBSNLeeJ%2Bd8W5zar1ut%2FtFFUvVH1KPQIhAOFPdGCWL16YjcHOBpX0HHK%2FPncEVbX%2FPMT89E4%2BNcrrKogECIr%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1Igy3lYiGdrhEoBJ0fvYq3ANgwtzpvHOmhmz0oBcgs4AKGVzd%2BSlkvHKVeOtr9zoUbMPc2H5F0AyV8Px0J2O5iOjgoGrZm%2BTfkAnG5XiHmqTjVehAMhSo7nZv96QH%2BSXen0gOgSBaR6nqIidMbkyCBSkA4ieUx8JhVcQ517zWa1BdQe7WL8Of9HzZuDMFj%2BZy4s%2FXqifmkzYQHJc83%2BMxMMY1F8OiWVT4kzTWJ%2FkvOK6hAtceMxyp651hU1enENSV3wgxoaB980gYjMBXXJcbNgDS9nmKOA%2F4p6XVvkrbONGFYzC1Fmnibi6g2dLH521US%2Fa2wVd%2BRuGTt4RiyDHLrk11PSybKvNuZwvtAb%2BUpvv4QoLCtVJyJAjQh%2BXegA3r0rkE9nG8pAIqwI%2FSAla4eRnqIEBiNCPyWnqbfBT%2BCKCF4iqOSM9ZYSRFYe5s6XwH1RWOPaGVWrJd0J1ePG%2BIZCYY9fvzhy8zkcko%2B3idV43yX8vuJromCpoPr3m7ZhGCtLnYqOwd4b1lojlP6%2FGDoK1QWWjZ9aJMVg0egpxoC77UTOj0DWIPQ9eKfFJM4raBjyQ6nJfD7AcEXGTGzoO5BEXV4%2Fx7SrVhW8Zv4rqrwMZ8uTNEsYVY1tNJFc7uH6h56lyVa0TL0NIB7jAdLDDF1%2BLTBjqkAdDxDPUHS%2BSer0R8TwiPThHFW5IphaLw5jB7UuSFaFo2rWLAJRyqVl1Ev83CLgTW%2Bpspypf6JNYLOvqmPrQQWv26yxe%2BFQ0Vquc3LybVS1YcTFc9mR6LMA%2B3ruQyJ9ylrhpyp8ut9571T%2Ftapa7emPn3PHzgktmbz3hM%2F1cukFdPFSI8os1yDSGdjYn95tkls9kL9k023xGGl9UJgAlrxi2qvkXH&X-Amz-Signature=b163b1d723a74a186191842e4458e012e6a1a29c2c5f69f2b50554b2ba593565&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

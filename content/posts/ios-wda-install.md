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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466XZGXTEMW%2F20261019%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261019T175530Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEGcaCXVzLXdlc3QtMiJHMEUCIDR1R8mb2P397TvSxH%2BVmpQqxZAki7ouHqlKvcFRH77zAiEA6IPU19fvkYShKejUiUSeiga4aMETeCYZ5Yulw7RHRM0q%2FwMILxAAGgw2Mzc0MjMxODM4MDUiDPZ2NKd%2FnaLcYG4WmircA2Ve56fIN1pXNklEKfhHHxfogT83ZefXomWFXM1QTi2RvwclahpJaNFBDRcHekvdaw4xQzaX35SmFgq4Eq7oohk1rkcJGFRtWCffzwLT%2FpQZvz%2F%2BbxjaT8zY5eWUPPwLZ50ZT8ns5x9WW4c%2F17Dscv7czgTY1aplT0Xiaubmt1wvmV5zW7fX6eEwtr3RGih5TZmbeUoYqYBAVrZTexgWy6AcyxflgFmLGRJBVOqdrhlIthrkwqimElhc%2BGEEroHi%2BO9jfMzh8DQTlJGR492%2FvGlkPmssX6GAh4v2eMykJTRtnw3RPlusZ%2B1vwpFj4so0OSj%2BiqTzvGaVlh8AYVZxYk377DKCUOgrRsmn6bKD%2BYk1RkfUw0D%2Fj6jZPwsLTy7SKHjL3YelDrtrtsILJrA6xMbG%2FUKWu0cceyb%2F069mQWgD7gnFp3avCzugaXg%2FoskNTiGYqIZljCR0CuAQ%2BcHtbfa%2Bjl0PkvaefxTpABKGjDJxnjK7l1jzDnXT%2BV64%2B8btMS9XbYqlUw8c7jdjVDm8JJAt4DOu0yP1uPrfjJ9EQiifW9FPEVmU1xPclSdSNcjuMdns6HMFUPLZgu3Qf%2FVMkFotWNlztYgiid0cIeQGBps4Kt%2Bes7mpaPIHwao6MPPh2NYGOqUButqdupxY0xbFSIBRAB4zZQrDJzQWNNj13QHMZr7qRk9Y1abcoXZuljjvJL74mKe6wPlJM8S2ykHNGAPE%2BApD606za2VcngxFZhoPaGdDrjhKRe2AtNF8Zn1wRQwxgFZCg3egxwnPAHTg27%2FJGbXauAg%2FkwRYyRPw%2Bs8Bl%2BtplvaAxZxwlW7RpkuF%2Byud7s3atuRs8I3a516RcALOY94kzsAa%2FfvZ&X-Amz-Signature=e62fe72b512fbb4ed6db9053347188f09329148b510bc40c5a4150152dd5492a&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466XZGXTEMW%2F20261019%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261019T175530Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEGcaCXVzLXdlc3QtMiJHMEUCIDR1R8mb2P397TvSxH%2BVmpQqxZAki7ouHqlKvcFRH77zAiEA6IPU19fvkYShKejUiUSeiga4aMETeCYZ5Yulw7RHRM0q%2FwMILxAAGgw2Mzc0MjMxODM4MDUiDPZ2NKd%2FnaLcYG4WmircA2Ve56fIN1pXNklEKfhHHxfogT83ZefXomWFXM1QTi2RvwclahpJaNFBDRcHekvdaw4xQzaX35SmFgq4Eq7oohk1rkcJGFRtWCffzwLT%2FpQZvz%2F%2BbxjaT8zY5eWUPPwLZ50ZT8ns5x9WW4c%2F17Dscv7czgTY1aplT0Xiaubmt1wvmV5zW7fX6eEwtr3RGih5TZmbeUoYqYBAVrZTexgWy6AcyxflgFmLGRJBVOqdrhlIthrkwqimElhc%2BGEEroHi%2BO9jfMzh8DQTlJGR492%2FvGlkPmssX6GAh4v2eMykJTRtnw3RPlusZ%2B1vwpFj4so0OSj%2BiqTzvGaVlh8AYVZxYk377DKCUOgrRsmn6bKD%2BYk1RkfUw0D%2Fj6jZPwsLTy7SKHjL3YelDrtrtsILJrA6xMbG%2FUKWu0cceyb%2F069mQWgD7gnFp3avCzugaXg%2FoskNTiGYqIZljCR0CuAQ%2BcHtbfa%2Bjl0PkvaefxTpABKGjDJxnjK7l1jzDnXT%2BV64%2B8btMS9XbYqlUw8c7jdjVDm8JJAt4DOu0yP1uPrfjJ9EQiifW9FPEVmU1xPclSdSNcjuMdns6HMFUPLZgu3Qf%2FVMkFotWNlztYgiid0cIeQGBps4Kt%2Bes7mpaPIHwao6MPPh2NYGOqUButqdupxY0xbFSIBRAB4zZQrDJzQWNNj13QHMZr7qRk9Y1abcoXZuljjvJL74mKe6wPlJM8S2ykHNGAPE%2BApD606za2VcngxFZhoPaGdDrjhKRe2AtNF8Zn1wRQwxgFZCg3egxwnPAHTg27%2FJGbXauAg%2FkwRYyRPw%2Bs8Bl%2BtplvaAxZxwlW7RpkuF%2Byud7s3atuRs8I3a516RcALOY94kzsAa%2FfvZ&X-Amz-Signature=265440babad666c6f6e0bd3c493068f5f8cebfeb6f08de0c3783de98686392b6&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466ZLUOXDCL%2F20260827%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260827T053952Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEGUaCXVzLXdlc3QtMiJHMEUCIFOBrUPvmm2oFgQjV44Y3wWi6A4iY48oCK2DwNxoMCh8AiEAk7P7HMgXTZ26Jjh0CLTTAUnpmg2nXNZjsidA%2FwJJw6oq%2FwMILhAAGgw2Mzc0MjMxODM4MDUiDEkdcI357uQUIOFj9ircA%2BYOBisFYFP5KhETVkPzbHe3yOp5%2FUJsnoxw7BUZrKhv3yBk7jNPXU3g8Kolyk9JOI4aaT5ObUEc7GAb%2BoTCZgWLV6jhqyM6pG3iP1uIh8Of%2BRkWHqtdIGhH%2BliKLpg7TuMcnhEZcGgO%2Fr%2FsXmbTC6mxEzceI%2FCnlzZjiq71br4KZ2XV0gytxDBKgX0cFZfnNM7btcZeEDrI3Os2XxGNBb4rH%2BiYjpuJ5zwXGc7kO9L7JBr6V%2FINH5eKJmI%2FVsHCOcQvuCyfm2oA77zdZpErHEUw77nGfAQ640l2tB0u%2BAyB8MTuh%2Fyobh0tB5M%2FN4OimWO1laQnt6a39pWN1a8Wd65lUC%2B3NF0RNd05iJ%2B0wZFrHNX4G2Ndj0ISiqyEAxCY%2FCNB7IfPgdREMElFjYDR0WQVvaSXrH2Kd%2FcJmJjUN8nrs%2Fgv4JK12pJa5a3s28Z9E%2BGgISYx%2FeOo3x%2F1mKk7XtMsql2cfLJkTtvjmVTfhrYNHAEucIdlzqrNlZZdk1SIBTvPoQU9uvESyLNCWu70gDRMeghW3QENSNKjbGIbgE2%2BgSsNwBMWzE7GgpIIhcUbdiEEuI7Gm3V%2Bg2z53mPIjxVpIo6tNeXYUk%2FJAEa1qgfjSo74FPrHwkQyBDQLMMuDv9QGOqUBeoC%2FakXMqPMQg2CMam%2Fa3iaKoJBBiUWzq8DkaMPVN1Y9t647oR%2BQqRTs6nRhuD3Mn0ZJ8F346cU966EwkpIZqYidDRJ5FvwTwIIo4s8hvay8cooDlHgeTwOJLTLZVEqUCVPsnzPE2q9p%2BBrkGgrcnuvcZuCfqwEPxeva0Hum%2BGgrH4%2FUxyNBhjG3C%2FhOvqztlljLBQSLfQ0ML9J9fsa16LYvoX%2F%2B&X-Amz-Signature=051ee9fa8aa7fb60632c7f65fcbce27de8a993bd555eb5b545849db7d9c88762&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466ZLUOXDCL%2F20260827%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260827T053952Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEGUaCXVzLXdlc3QtMiJHMEUCIFOBrUPvmm2oFgQjV44Y3wWi6A4iY48oCK2DwNxoMCh8AiEAk7P7HMgXTZ26Jjh0CLTTAUnpmg2nXNZjsidA%2FwJJw6oq%2FwMILhAAGgw2Mzc0MjMxODM4MDUiDEkdcI357uQUIOFj9ircA%2BYOBisFYFP5KhETVkPzbHe3yOp5%2FUJsnoxw7BUZrKhv3yBk7jNPXU3g8Kolyk9JOI4aaT5ObUEc7GAb%2BoTCZgWLV6jhqyM6pG3iP1uIh8Of%2BRkWHqtdIGhH%2BliKLpg7TuMcnhEZcGgO%2Fr%2FsXmbTC6mxEzceI%2FCnlzZjiq71br4KZ2XV0gytxDBKgX0cFZfnNM7btcZeEDrI3Os2XxGNBb4rH%2BiYjpuJ5zwXGc7kO9L7JBr6V%2FINH5eKJmI%2FVsHCOcQvuCyfm2oA77zdZpErHEUw77nGfAQ640l2tB0u%2BAyB8MTuh%2Fyobh0tB5M%2FN4OimWO1laQnt6a39pWN1a8Wd65lUC%2B3NF0RNd05iJ%2B0wZFrHNX4G2Ndj0ISiqyEAxCY%2FCNB7IfPgdREMElFjYDR0WQVvaSXrH2Kd%2FcJmJjUN8nrs%2Fgv4JK12pJa5a3s28Z9E%2BGgISYx%2FeOo3x%2F1mKk7XtMsql2cfLJkTtvjmVTfhrYNHAEucIdlzqrNlZZdk1SIBTvPoQU9uvESyLNCWu70gDRMeghW3QENSNKjbGIbgE2%2BgSsNwBMWzE7GgpIIhcUbdiEEuI7Gm3V%2Bg2z53mPIjxVpIo6tNeXYUk%2FJAEa1qgfjSo74FPrHwkQyBDQLMMuDv9QGOqUBeoC%2FakXMqPMQg2CMam%2Fa3iaKoJBBiUWzq8DkaMPVN1Y9t647oR%2BQqRTs6nRhuD3Mn0ZJ8F346cU966EwkpIZqYidDRJ5FvwTwIIo4s8hvay8cooDlHgeTwOJLTLZVEqUCVPsnzPE2q9p%2BBrkGgrcnuvcZuCfqwEPxeva0Hum%2BGgrH4%2FUxyNBhjG3C%2FhOvqztlljLBQSLfQ0ML9J9fsa16LYvoX%2F%2B&X-Amz-Signature=539a88f1a90f51fea4bd1668452c6afa6626f4596b03d5458425662d17201e04&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

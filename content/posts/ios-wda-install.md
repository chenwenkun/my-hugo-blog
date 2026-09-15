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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466RD6COQ45%2F20260915%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260915T203651Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEDwaCXVzLXdlc3QtMiJGMEQCIFPtpydySwTLpT8WTkYPScvrojJc40%2FTawIvXwfhlHx1AiBtPGLuOh%2B6YwIB6Wui97swznvnAEe9Y41Q%2FerQ3gAQDCr%2FAwgFEAAaDDYzNzQyMzE4MzgwNSIMas4tkrAGQcLQaEzVKtwDV0p6GY8XNk7vltB%2B8VVtSpLgupFIamoA%2FCgl4ZoUQad9LmJ7PvsDcK4DiBrzJkcXSc4gFYyvJ8MhZClP2TlAxlOYSigWkNekqQ9QqZRNtYzRc4j6Z0hXtCUE5KA0hRs%2F20U2XO0QWPGHjoPFgZLDRYwEuPJmlkDH%2FhS0yY%2FXLMRzz4JUv78TvngCNM6n0rkKwOYIh8hrSN51%2F851eoaZhxtaMThwyn8Eebp1iw6AC7NVVvABGOaADIdORRZUMRIeWtC2kB3jida9F471%2FLNCy9cLvV5Vfnbt6Ila47EOsoksJ8eSRnd2ZMTTNpN5yuKRX6vwTQLwuAWU6Uphtlt2RLoDJeNuqT%2F5rRV28cs5R5sEClzgqYvakytJliRQzO2D5EK0GtB1tNUcuk85OVpos0s4XwZ%2B2MSXjhky%2BpuMkd3wQRgQJl%2B84nz10M3Kw%2FsNlmOH%2FwwmXRtZDSF6aQ0TMF94yYAYgmF929PlgaT8s1hlQFBAvNC%2BVmdXLaGWpBLr1yCd9m9L3OpGNi6m71wHHYCbtmbEbnKrp%2B5prrf%2FFvJ11QUNwemvYWDlDfHsSrzZEsroNdToUaxw%2FOyUZwvnDRPcDpPx%2Flpi%2BIHVAc6tKVgvWaDCAAgN3oiJTbcwmMqm1QY6pgExgkOmmvKB%2Fp1pDEKeDbuuXvsJVkhMoE0h96ktz%2FfHk3zeQ3UP3upkz3IU4Dgto6D4cOEnPDplr9THj%2BqR%2BNQ4d%2FtyhcZ7Ru%2FbMJ1NDRWN0c6773P%2FAc3trWkiHeRyJbczEiSXqYOy0%2Bez9omaDHcNx8uSzVlKyoJbkcJlZ79dkxFldv9Q%2FcHJNFQOY6%2BC8mrlek41FBKHNSDka9qoCGF9QG8G9SuV&X-Amz-Signature=41022d1fbade963910699fff1bb72397d216db1029c82b96ca0fd001e0a40219&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466RD6COQ45%2F20260915%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260915T203651Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEDwaCXVzLXdlc3QtMiJGMEQCIFPtpydySwTLpT8WTkYPScvrojJc40%2FTawIvXwfhlHx1AiBtPGLuOh%2B6YwIB6Wui97swznvnAEe9Y41Q%2FerQ3gAQDCr%2FAwgFEAAaDDYzNzQyMzE4MzgwNSIMas4tkrAGQcLQaEzVKtwDV0p6GY8XNk7vltB%2B8VVtSpLgupFIamoA%2FCgl4ZoUQad9LmJ7PvsDcK4DiBrzJkcXSc4gFYyvJ8MhZClP2TlAxlOYSigWkNekqQ9QqZRNtYzRc4j6Z0hXtCUE5KA0hRs%2F20U2XO0QWPGHjoPFgZLDRYwEuPJmlkDH%2FhS0yY%2FXLMRzz4JUv78TvngCNM6n0rkKwOYIh8hrSN51%2F851eoaZhxtaMThwyn8Eebp1iw6AC7NVVvABGOaADIdORRZUMRIeWtC2kB3jida9F471%2FLNCy9cLvV5Vfnbt6Ila47EOsoksJ8eSRnd2ZMTTNpN5yuKRX6vwTQLwuAWU6Uphtlt2RLoDJeNuqT%2F5rRV28cs5R5sEClzgqYvakytJliRQzO2D5EK0GtB1tNUcuk85OVpos0s4XwZ%2B2MSXjhky%2BpuMkd3wQRgQJl%2B84nz10M3Kw%2FsNlmOH%2FwwmXRtZDSF6aQ0TMF94yYAYgmF929PlgaT8s1hlQFBAvNC%2BVmdXLaGWpBLr1yCd9m9L3OpGNi6m71wHHYCbtmbEbnKrp%2B5prrf%2FFvJ11QUNwemvYWDlDfHsSrzZEsroNdToUaxw%2FOyUZwvnDRPcDpPx%2Flpi%2BIHVAc6tKVgvWaDCAAgN3oiJTbcwmMqm1QY6pgExgkOmmvKB%2Fp1pDEKeDbuuXvsJVkhMoE0h96ktz%2FfHk3zeQ3UP3upkz3IU4Dgto6D4cOEnPDplr9THj%2BqR%2BNQ4d%2FtyhcZ7Ru%2FbMJ1NDRWN0c6773P%2FAc3trWkiHeRyJbczEiSXqYOy0%2Bez9omaDHcNx8uSzVlKyoJbkcJlZ79dkxFldv9Q%2FcHJNFQOY6%2BC8mrlek41FBKHNSDka9qoCGF9QG8G9SuV&X-Amz-Signature=5efae25e25604618f5d065536f3474a2062e8f85fdcd090cc25caafd3fb17c37&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

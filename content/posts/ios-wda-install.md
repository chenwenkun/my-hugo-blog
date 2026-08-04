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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4664XQTFHKZ%2F20260804%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260804T081738Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjED4aCXVzLXdlc3QtMiJHMEUCIDr9XGMT4rSabEICCyj4zcB%2BqqoQ4Xor2ZJz1KEbsqHmAiEA0OopGQtrp1SI1Slp8HZ7n5Sv0AUDt%2BJbfCAY8TSSeDkq%2FwMIBxAAGgw2Mzc0MjMxODM4MDUiDEaKRszOx0pwjMwo6yrcA9MbrMSNkfB0ASDAMBvhLVNNrbPcEOhxHHWVU4wgRYYsjFGHgaxvHfi96bMet5led0Bhk6l8QYZr40ef3o4xqDrab12LkBUEZlopAHbZqeQSesVvw9fHxWmQVrMpihGOmNIpwMA%2B8hf0E91fbU7GNUGIgwqDU%2FO2uEhwaDMZuBLf%2BWU5StpHMhLI6hQwn6AtLHqRar9ztITPL67Y5%2Bxjx9b8AtCnOlAZcC6pMteyxkgE%2BfwO52Gl89qOxtmMEgQzfYY6qjwTmc%2B343Yt%2FI7INa0p1qrS4W6Yp9TEkUEJcsrbvULG6P5cCV0AYlHnCAukCWoAPxyH4aRZ7qw6l8RK0vPcPQtxXkAjEm5LHJ%2B0weAC3FZHw5CIe9O%2F36VTvcO5ubZkLRSzyRhSnnIFufJvqsI4Z9ZjkbpbdbQPx0HDrNiCP4zBNEAZ22JI1M%2FKclWJJG6CM6XzT8Dt2HBnMRUFFMRp4iUDlN%2F8%2Bf%2F2%2BgqC9UaQkjlBiEsF9nrB10IQK0L%2FjSMRqb9MmJIDzw60GMJjUOlk4p4YlmPfdMj3zu7S5HeVdN3DcyHDOvRGybUEPehJllHtsAo3R9ex5qdSQ%2BXT01SxLPi7e0VfIaF5XuhubEFU3imA6S1JN8WEhwZkMPGHxtMGOqUBumiVimhJDOeQ7NZ458%2BaYwOoFME%2Bz9yQb21B6P33ERL%2F1Q0gbf0o2%2FnkU3LHUPr481%2FsEd5uPDb6BiKMVIiXpszjUOuX5P6ncxjhAPWh%2B0iU64HDSgXpea7qfyArfGzvhTPltfov9RPyElKavp6FdRQr1UwJWA7D4r0daEI%2FwDVYmSAgo7EzfP8wFgt%2FLMtHeFjWbmH8js6U%2FO9PxTQ%2FIF5vT0Ch&X-Amz-Signature=e2af590f88e25e22ebafb865fce4821448f1f8470c1d3588b21ddfa047e6b97e&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4664XQTFHKZ%2F20260804%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260804T081738Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjED4aCXVzLXdlc3QtMiJHMEUCIDr9XGMT4rSabEICCyj4zcB%2BqqoQ4Xor2ZJz1KEbsqHmAiEA0OopGQtrp1SI1Slp8HZ7n5Sv0AUDt%2BJbfCAY8TSSeDkq%2FwMIBxAAGgw2Mzc0MjMxODM4MDUiDEaKRszOx0pwjMwo6yrcA9MbrMSNkfB0ASDAMBvhLVNNrbPcEOhxHHWVU4wgRYYsjFGHgaxvHfi96bMet5led0Bhk6l8QYZr40ef3o4xqDrab12LkBUEZlopAHbZqeQSesVvw9fHxWmQVrMpihGOmNIpwMA%2B8hf0E91fbU7GNUGIgwqDU%2FO2uEhwaDMZuBLf%2BWU5StpHMhLI6hQwn6AtLHqRar9ztITPL67Y5%2Bxjx9b8AtCnOlAZcC6pMteyxkgE%2BfwO52Gl89qOxtmMEgQzfYY6qjwTmc%2B343Yt%2FI7INa0p1qrS4W6Yp9TEkUEJcsrbvULG6P5cCV0AYlHnCAukCWoAPxyH4aRZ7qw6l8RK0vPcPQtxXkAjEm5LHJ%2B0weAC3FZHw5CIe9O%2F36VTvcO5ubZkLRSzyRhSnnIFufJvqsI4Z9ZjkbpbdbQPx0HDrNiCP4zBNEAZ22JI1M%2FKclWJJG6CM6XzT8Dt2HBnMRUFFMRp4iUDlN%2F8%2Bf%2F2%2BgqC9UaQkjlBiEsF9nrB10IQK0L%2FjSMRqb9MmJIDzw60GMJjUOlk4p4YlmPfdMj3zu7S5HeVdN3DcyHDOvRGybUEPehJllHtsAo3R9ex5qdSQ%2BXT01SxLPi7e0VfIaF5XuhubEFU3imA6S1JN8WEhwZkMPGHxtMGOqUBumiVimhJDOeQ7NZ458%2BaYwOoFME%2Bz9yQb21B6P33ERL%2F1Q0gbf0o2%2FnkU3LHUPr481%2FsEd5uPDb6BiKMVIiXpszjUOuX5P6ncxjhAPWh%2B0iU64HDSgXpea7qfyArfGzvhTPltfov9RPyElKavp6FdRQr1UwJWA7D4r0daEI%2FwDVYmSAgo7EzfP8wFgt%2FLMtHeFjWbmH8js6U%2FO9PxTQ%2FIF5vT0Ch&X-Amz-Signature=787a94eb0b19e566fc78781f26ed239388aa9f89ac01ff1892268c6bf36ddbb5&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

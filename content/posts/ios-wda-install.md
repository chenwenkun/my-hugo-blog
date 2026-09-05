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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4665XPMWJ3X%2F20260905%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260905T141104Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEEYaCXVzLXdlc3QtMiJIMEYCIQCeCIAk2rO2qqTXlHQql%2FsHQgdaW6flakN6uQ5W8dJVqQIhANtVz7zua8G2I9dZBvNgok3lHhss6a%2Bqd3Jf9%2BhIcrYOKv8DCA8QABoMNjM3NDIzMTgzODA1Igzn84ugk%2Fjk7MvPnOIq3AN1vRdHTL7eFrkGDSsgunl7ExckHbvJhQEHUdNmaa685kjEFCsBpQaYecicW8sQWmzYJK1v5SYJsNtAmr6acgW6kiWYCIUsYvlvrtCiU2XTq02cR6UB%2FmxJPU34NDdAvmhpOsD0B9RGaZfyq8x4xSus33s7xP%2BLF0V1ceGx%2BMiHT6jzeMKBY0oujur4LtLEjvFcnSzzjDfUKP0uGpxrF4uBguCXgCzB4Dr1l9VAKat6ljlU6DiLPGFKfcDyLaJnlz%2FS%2F7ilhmENq4PJnqrk6u8Y3Sx4bumkB3EYRN1%2BrXJcs48phRIock0JLU7Pm7dDG61qhFrMxeo9XPPWVdEsH%2BStWIkrxXBNndZU5arbpE3xgRnMNFJwFs2%2BLwGZY%2BNygBElmh%2FQp5SJwPBN25C5uXkT%2Blefinfdw59PZLe%2Fu0YfxVraYFErr6GHOXCd%2BF6yGf5a8rSiWFOX%2BfExnhPv54HRODp0rIlhtjxa1rPqcph3jf2ejbZGIlO3BXGgC7buWnTWApnHKHFnQ39rgjQsSdqZGyRwz2ToXdwSuA8vh5q7fmBOZsdan4AjrXCD8bLIOUF7w0Pky2p%2Bhqr1mLQwBUFBVhvl9H2zj32WewmiFvl%2Fxk%2BIjOarhxeYO53bBTDksPDUBjqkAZrQl9JK9uhHKmPps4MNuIlzZJJJnWprX8w5%2Bo0tbKLqD1FnscexaTdA%2BtucF%2Bx0sXY5CH7FnnIJupy1WtjSrsxcMu%2B58LYv9vM5zLEGvcxSKlkjFPfmBcsrQsn7iCOfNUxSx5KXdqDwadNKQY8T1tpCYgeOS56tFyrhPMZmIyILnJKmSjidbnYSp1ekIm5cxpRXFtJFtflnCzgNAZXXbj6iUJWh&X-Amz-Signature=67542f6204af017aee73e2e0fc4e94662486dd55d3a158f5da71f138041f78dd&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4665XPMWJ3X%2F20260905%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260905T141104Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEEYaCXVzLXdlc3QtMiJIMEYCIQCeCIAk2rO2qqTXlHQql%2FsHQgdaW6flakN6uQ5W8dJVqQIhANtVz7zua8G2I9dZBvNgok3lHhss6a%2Bqd3Jf9%2BhIcrYOKv8DCA8QABoMNjM3NDIzMTgzODA1Igzn84ugk%2Fjk7MvPnOIq3AN1vRdHTL7eFrkGDSsgunl7ExckHbvJhQEHUdNmaa685kjEFCsBpQaYecicW8sQWmzYJK1v5SYJsNtAmr6acgW6kiWYCIUsYvlvrtCiU2XTq02cR6UB%2FmxJPU34NDdAvmhpOsD0B9RGaZfyq8x4xSus33s7xP%2BLF0V1ceGx%2BMiHT6jzeMKBY0oujur4LtLEjvFcnSzzjDfUKP0uGpxrF4uBguCXgCzB4Dr1l9VAKat6ljlU6DiLPGFKfcDyLaJnlz%2FS%2F7ilhmENq4PJnqrk6u8Y3Sx4bumkB3EYRN1%2BrXJcs48phRIock0JLU7Pm7dDG61qhFrMxeo9XPPWVdEsH%2BStWIkrxXBNndZU5arbpE3xgRnMNFJwFs2%2BLwGZY%2BNygBElmh%2FQp5SJwPBN25C5uXkT%2Blefinfdw59PZLe%2Fu0YfxVraYFErr6GHOXCd%2BF6yGf5a8rSiWFOX%2BfExnhPv54HRODp0rIlhtjxa1rPqcph3jf2ejbZGIlO3BXGgC7buWnTWApnHKHFnQ39rgjQsSdqZGyRwz2ToXdwSuA8vh5q7fmBOZsdan4AjrXCD8bLIOUF7w0Pky2p%2Bhqr1mLQwBUFBVhvl9H2zj32WewmiFvl%2Fxk%2BIjOarhxeYO53bBTDksPDUBjqkAZrQl9JK9uhHKmPps4MNuIlzZJJJnWprX8w5%2Bo0tbKLqD1FnscexaTdA%2BtucF%2Bx0sXY5CH7FnnIJupy1WtjSrsxcMu%2B58LYv9vM5zLEGvcxSKlkjFPfmBcsrQsn7iCOfNUxSx5KXdqDwadNKQY8T1tpCYgeOS56tFyrhPMZmIyILnJKmSjidbnYSp1ekIm5cxpRXFtJFtflnCzgNAZXXbj6iUJWh&X-Amz-Signature=9024b5fffecfe83d82bdb447dc8d28d6b04a4b2725a7d692c31dcf3319770819&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

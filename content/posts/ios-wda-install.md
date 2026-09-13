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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4667G5FL6SR%2F20260913%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260913T015819Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEPn%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQDPxsjq5%2F1A2UoTQVzvHMtd5iPfbnj07QEivuUV3fpbnQIhANZD9j8ef2%2FPmFhIkzkgBTjg8U46PVuvxCIWq%2FrwiPFZKogECML%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgyQ73OMxZBIm%2FVGWpQq3AMqGB69R3Rb82cBIZrWyOD9splyAYz0qHn8T3QB2CbpwYJ3F75jChlppiAzRn6CqUE7UEOlHkNvxST9H61farkZJoAgzjb74PC3QocRVbUsL1cpbgotXMhxbdY%2BApO1INZsT2JjD3SNSuLbKGB%2B9RAwiIx186tada4Ss8t8d%2F8x1Y8wYnez2HHXZ4HCBeDtrpvbO40TzW0NVNqRChkXCSDuGFBo4FbOCvdSmnwybfq7VriR50P2BclSO6t21dFFrWbVpL%2F1CjOlDCKEGHPxsNpzif5mShnUQcFng%2BOB476PDPDdIysfZrjfNiG%2B%2FkB9z6REtTQqbIVqbrtlUQ0RVx06LWZ9L6DVsb%2FDOBzvb248Q%2FtshDUrhTF65xdczaMpFbeP2tO6Va9%2FCBLuL8hDEhAnkXJNOZtcoPh9F0%2BLBipDathIa6hQWY5H77pmmlSgMj2DHWn%2FGmIhVMfNLosx9xxW%2BqX3hMBMCrpcxgyFW7XlEfc9BZS7v5J0CX7EI9FimVpaqFyr1tsp23OX8M%2BRmcAlJjH4pbg4VCg3SuvcZPiEgHvwFvdQI3PVu9xqJAyPJGWYC8tFR9Y9O5vUWrPX4tLxFZLHI6pBmxTVxcxFWJbf0uJJNMfB0UtiDAAZ2zCG4pfVBjqkAf2SHDIuX%2BVsWk%2FJh7YZbyvDEeQThvjwOFF5q6XMmZ6CnM%2BnH3E2OIDWNjiy6ttHyXqlXsd9AoN765gk%2FeyutTmoXJ10kVITb9TsNmxUkSk74wprb8ZY%2Fr7TfX1ec7TYCcj%2BLnC9M1x35Eq3OBSxf4b1l2KHiKda2hf0KzTNsPdtX9MvqEEjdFPhBwAVvdtGSxFutCUdC%2Ba%2F10eZZdat09SCcmUJ&X-Amz-Signature=026085a9669d38e82eca37210fc736a2d1434f9a2c55dfb61f278b4736dd0086&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4667G5FL6SR%2F20260913%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260913T015819Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEPn%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQDPxsjq5%2F1A2UoTQVzvHMtd5iPfbnj07QEivuUV3fpbnQIhANZD9j8ef2%2FPmFhIkzkgBTjg8U46PVuvxCIWq%2FrwiPFZKogECML%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgyQ73OMxZBIm%2FVGWpQq3AMqGB69R3Rb82cBIZrWyOD9splyAYz0qHn8T3QB2CbpwYJ3F75jChlppiAzRn6CqUE7UEOlHkNvxST9H61farkZJoAgzjb74PC3QocRVbUsL1cpbgotXMhxbdY%2BApO1INZsT2JjD3SNSuLbKGB%2B9RAwiIx186tada4Ss8t8d%2F8x1Y8wYnez2HHXZ4HCBeDtrpvbO40TzW0NVNqRChkXCSDuGFBo4FbOCvdSmnwybfq7VriR50P2BclSO6t21dFFrWbVpL%2F1CjOlDCKEGHPxsNpzif5mShnUQcFng%2BOB476PDPDdIysfZrjfNiG%2B%2FkB9z6REtTQqbIVqbrtlUQ0RVx06LWZ9L6DVsb%2FDOBzvb248Q%2FtshDUrhTF65xdczaMpFbeP2tO6Va9%2FCBLuL8hDEhAnkXJNOZtcoPh9F0%2BLBipDathIa6hQWY5H77pmmlSgMj2DHWn%2FGmIhVMfNLosx9xxW%2BqX3hMBMCrpcxgyFW7XlEfc9BZS7v5J0CX7EI9FimVpaqFyr1tsp23OX8M%2BRmcAlJjH4pbg4VCg3SuvcZPiEgHvwFvdQI3PVu9xqJAyPJGWYC8tFR9Y9O5vUWrPX4tLxFZLHI6pBmxTVxcxFWJbf0uJJNMfB0UtiDAAZ2zCG4pfVBjqkAf2SHDIuX%2BVsWk%2FJh7YZbyvDEeQThvjwOFF5q6XMmZ6CnM%2BnH3E2OIDWNjiy6ttHyXqlXsd9AoN765gk%2FeyutTmoXJ10kVITb9TsNmxUkSk74wprb8ZY%2Fr7TfX1ec7TYCcj%2BLnC9M1x35Eq3OBSxf4b1l2KHiKda2hf0KzTNsPdtX9MvqEEjdFPhBwAVvdtGSxFutCUdC%2Ba%2F10eZZdat09SCcmUJ&X-Amz-Signature=d62522ec14522a3baa575bf5180646494076b71933a10b05fcb98d9f335209c4&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466WMYWDLVN%2F20261005%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261005T232714Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEB0aCXVzLXdlc3QtMiJIMEYCIQD7qQxrGc1uqYYQZufzzuemJO%2FI%2BWju76QequCo82efrgIhALcwHBm1kfm%2FgjqjY5tEz66lPSUqSnjZuDQ%2FJeybmNirKogECOb%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgyxtwuB0toyYLu7%2FaUq3AMbqrTEkQhIK7cMCAw9Rtt4wZATvFDx13OUmjiZx8H%2FAWMGse5jsvK1OFn%2B7XqOU4pyQA9rpLGlOoPQ4ea9A6Lix%2B3xBJfy4EBR2uo%2BBbqNEyaJCB55I2ViJ2IGJWbcwoWf1gjbZ4gETi8Iazb0LJ93LBQOiB8JkGPjtv5YIC4UG3azj%2FM%2BfM177QxERH2eqnyL3jICQu5Qd0O0utNj1lkxvyyp0TWiPrN15YLcIfiCZYQmhCMUS6OQU1eeQigMdDUuSRFUnJyyBhsdguJhhkghg2INqdGXfwHA35DublUBa7pSOXMq4Ke2TTF%2BnG%2F%2F9tSow%2BVL%2Fy0UknDTYh8A2x4yTEapBrv0FAxQHWEa2H9wUoypTQuqnXlz1HWpVRW8MQoKcT3IP0S76JTVvcMm8nLSwh3FJ4cef01oGaVwbC9QuiPrvFkPnBxcUeA3xxIoC37soUhHmN1LrkFKQKiNJdB%2BdHJUWnLjac6SBgoNwWk7CzM1YK5aNosBTw4xxFqlG9GYsjDJpe4LNGtRV9uiusJxf2C1zUXAQp9wN%2BBUOGkXK89OoWL9Hv7vhihBBrIXc9JnSx0lKeONbFSDyvKJGhUCjyuXDFQNNSebv0JfIKjNs21dWhQVjX8lU7ptYTC1mZDWBjqkAZCzftlGhZwXZrF2SgQ7L9RA6eWF27IxWY7SLanEw8yPuCbbphXTBKbNJ4uXec2ienM73pc1z8v5o58VGRKKbhFeuJiMIqlK9uds%2Fg74pW7zShVOOhNfil696dys8aXB4HlOHFJK%2FC%2BnfI3x0EDh0kgermkmD22QlxH8X7V3Qtn925vzGpP%2B2Esdjv6%2FF7LQ99%2B7nMhR3b4XwmPrfLjoIw4vmoZd&X-Amz-Signature=a2c28693414ee40dc5fa91237657cb5501fe053eb3299ed50f2f44877587ac26&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466WMYWDLVN%2F20261005%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261005T232714Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEB0aCXVzLXdlc3QtMiJIMEYCIQD7qQxrGc1uqYYQZufzzuemJO%2FI%2BWju76QequCo82efrgIhALcwHBm1kfm%2FgjqjY5tEz66lPSUqSnjZuDQ%2FJeybmNirKogECOb%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgyxtwuB0toyYLu7%2FaUq3AMbqrTEkQhIK7cMCAw9Rtt4wZATvFDx13OUmjiZx8H%2FAWMGse5jsvK1OFn%2B7XqOU4pyQA9rpLGlOoPQ4ea9A6Lix%2B3xBJfy4EBR2uo%2BBbqNEyaJCB55I2ViJ2IGJWbcwoWf1gjbZ4gETi8Iazb0LJ93LBQOiB8JkGPjtv5YIC4UG3azj%2FM%2BfM177QxERH2eqnyL3jICQu5Qd0O0utNj1lkxvyyp0TWiPrN15YLcIfiCZYQmhCMUS6OQU1eeQigMdDUuSRFUnJyyBhsdguJhhkghg2INqdGXfwHA35DublUBa7pSOXMq4Ke2TTF%2BnG%2F%2F9tSow%2BVL%2Fy0UknDTYh8A2x4yTEapBrv0FAxQHWEa2H9wUoypTQuqnXlz1HWpVRW8MQoKcT3IP0S76JTVvcMm8nLSwh3FJ4cef01oGaVwbC9QuiPrvFkPnBxcUeA3xxIoC37soUhHmN1LrkFKQKiNJdB%2BdHJUWnLjac6SBgoNwWk7CzM1YK5aNosBTw4xxFqlG9GYsjDJpe4LNGtRV9uiusJxf2C1zUXAQp9wN%2BBUOGkXK89OoWL9Hv7vhihBBrIXc9JnSx0lKeONbFSDyvKJGhUCjyuXDFQNNSebv0JfIKjNs21dWhQVjX8lU7ptYTC1mZDWBjqkAZCzftlGhZwXZrF2SgQ7L9RA6eWF27IxWY7SLanEw8yPuCbbphXTBKbNJ4uXec2ienM73pc1z8v5o58VGRKKbhFeuJiMIqlK9uds%2Fg74pW7zShVOOhNfil696dys8aXB4HlOHFJK%2FC%2BnfI3x0EDh0kgermkmD22QlxH8X7V3Qtn925vzGpP%2B2Esdjv6%2FF7LQ99%2B7nMhR3b4XwmPrfLjoIw4vmoZd&X-Amz-Signature=bf1ba8b258899c59772de581828a264a61c3281a93713ff68a3325361a7acff4&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

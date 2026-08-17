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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466RKBZO7FE%2F20260817%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260817T122029Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEHwaCXVzLXdlc3QtMiJGMEQCIE7NHQRvzGRK8yheNHdZPI3MlKZ%2Byn7nXotBQl4kpWlQAiBHVAKEkGplLRWpOtKnvMptPyyJcjlN9piqxU6sUJCUZyr%2FAwhFEAAaDDYzNzQyMzE4MzgwNSIMqWuLxK11jKuu%2F0nCKtwDXwuKLPNgIiDRfZ0Xz7fjiy4myzjPGgoCT7XX0dsO8sf4nIQJ1tERfKB8B3nu9PitfpZaiPe809cr2Xw4HQaEkqlN27VVnhFyJIGzkaGvYx6r1TKzRPvoPv121nSVf%2BZfTrwcdclSl0KnUxZuNjL5TRgLtN3K5gmKbcf10YuRwtXdDRQHgs80NPngOixh%2BTUPLsqOGuWZB79TzX2dcpwhzxwTy9SVPQ8B4mOVghLvFjSXeBhSOMkw4X995ElUWaPj2WTmjRXEOcDt7jdLvEexnezlbHdq5ga3LLacOemhtsxhyppoOSvTP12fVe9PunqkSIw%2FXYGno%2F2N7i6cil9GRDPCapUy15Z%2BDI8rPRX9BdYVLyDxh8M7Ue4unTVjtrDU16N2vJPTYli8aZiMTZXkSgqoGFR0MSWMxnpIOrQ2i4ZwwFr4MO6FIysN5v7nSXCiKLbfPUxSs7KFgALXmNnjPMWfvbN8qyi8kJhqUQLtC8T7HvAU%2Bg9A3V0EOgUCpIZG7a3mH2%2BiFAo1YWIYMNLAHQNlIlQXd%2BZKioHojDYGgfjsVRdiuWUNqktvgRyW8jwI4QBxXWk0hPG5GYFCiBl3IqpjDMTIBt%2BjgkcA7tFf7xnxJk%2FxgDxeTF7kS4ww7vaL1AY6pgHEKoPDARilBKrnNTm%2B7pFayx9m8stQV7Fqg97BqmwNNDWyu2VOATIj0lJ%2BH7QW0%2FJ7m%2BEM0vwX5XMzcuqEaxqS8wXTmb0f0UfDO5MqXen6TLzk2favIZUUIbTUbHbfm24Dhiz1%2BLtEp%2B6sheB9XSd47N43y50CM6khGIVrR%2FBDH8F%2B%2FOrxa3FfGFylvCv8mCea46UjnD0smHm0m%2FCnM6DOwOrpuFEw&X-Amz-Signature=129d65d8357f6c9baecef3f038b396dfaf677e33067ca56ab70325020a8be337&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466RKBZO7FE%2F20260817%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260817T122030Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEHwaCXVzLXdlc3QtMiJGMEQCIE7NHQRvzGRK8yheNHdZPI3MlKZ%2Byn7nXotBQl4kpWlQAiBHVAKEkGplLRWpOtKnvMptPyyJcjlN9piqxU6sUJCUZyr%2FAwhFEAAaDDYzNzQyMzE4MzgwNSIMqWuLxK11jKuu%2F0nCKtwDXwuKLPNgIiDRfZ0Xz7fjiy4myzjPGgoCT7XX0dsO8sf4nIQJ1tERfKB8B3nu9PitfpZaiPe809cr2Xw4HQaEkqlN27VVnhFyJIGzkaGvYx6r1TKzRPvoPv121nSVf%2BZfTrwcdclSl0KnUxZuNjL5TRgLtN3K5gmKbcf10YuRwtXdDRQHgs80NPngOixh%2BTUPLsqOGuWZB79TzX2dcpwhzxwTy9SVPQ8B4mOVghLvFjSXeBhSOMkw4X995ElUWaPj2WTmjRXEOcDt7jdLvEexnezlbHdq5ga3LLacOemhtsxhyppoOSvTP12fVe9PunqkSIw%2FXYGno%2F2N7i6cil9GRDPCapUy15Z%2BDI8rPRX9BdYVLyDxh8M7Ue4unTVjtrDU16N2vJPTYli8aZiMTZXkSgqoGFR0MSWMxnpIOrQ2i4ZwwFr4MO6FIysN5v7nSXCiKLbfPUxSs7KFgALXmNnjPMWfvbN8qyi8kJhqUQLtC8T7HvAU%2Bg9A3V0EOgUCpIZG7a3mH2%2BiFAo1YWIYMNLAHQNlIlQXd%2BZKioHojDYGgfjsVRdiuWUNqktvgRyW8jwI4QBxXWk0hPG5GYFCiBl3IqpjDMTIBt%2BjgkcA7tFf7xnxJk%2FxgDxeTF7kS4ww7vaL1AY6pgHEKoPDARilBKrnNTm%2B7pFayx9m8stQV7Fqg97BqmwNNDWyu2VOATIj0lJ%2BH7QW0%2FJ7m%2BEM0vwX5XMzcuqEaxqS8wXTmb0f0UfDO5MqXen6TLzk2favIZUUIbTUbHbfm24Dhiz1%2BLtEp%2B6sheB9XSd47N43y50CM6khGIVrR%2FBDH8F%2B%2FOrxa3FfGFylvCv8mCea46UjnD0smHm0m%2FCnM6DOwOrpuFEw&X-Amz-Signature=240a8f4bf4f0cef0a10f28138af2cf240e1f8d710d2eca6be9bbc8be7228fcb7&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

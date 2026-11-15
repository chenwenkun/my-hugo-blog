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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466WJ5SWLS7%2F20261115%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261115T130658Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEOz%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIAQO2xnyd0mwxVNk%2FhRV%2B7UpGCyYu5Y%2FS59%2BbzN%2FIYLEAiA6PqsjMCmKrMt96OYof5XVZ6zbQTiP5miqVPwItJ8uHiqIBAi1%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIM40%2FLbBDOtv%2FNbeFPKtwDxHYMdQRh%2FqMrFdVOBklbzBq7iKg57n0UldTEOn6zGVsV%2BUdJ0vKGHwMkc6%2BTkFzr3s0gckCjDkSMAwLkvX1rJdBUmLaif%2FlSY7GUw%2FNYELLqIg3tXeToykmcQ0oLB34LzklgWKs9DiKtToU%2BndOzG0fF5O4EcCUx7NZMKq0v2TH6rbwVhSSaqNs5lEV%2BLWDHBKazkA5lx6lqPiVLAW6Vc4%2BhWU3lnOaN13HoIQJZSwf1DVTGHjTwzV9vFdjeH4%2FGvZ6ZwBj6n59D7sDOXzXh%2F%2BEzg2J8D9V7Usd9N7bbL7MXTu2jupkj6LB51JjzgAS%2FKp0%2BVYAaxPw8i4tT%2Bsvw1MDXhotIilSqn8kPC%2F2TQBu4C7RZefMRS1PyWF9q4CP7eEgwzgLU4aDe2yBFmWspcjTsJrpIqHEZgiTq%2FQ5sbI%2FRgAgAOTJIT0X%2B2tl5gx1DlTbAtf6HjTzhdEAXW%2BuRsE7ct5%2BHFWWlFOoap29pJJQ%2BsaUnB3hd2JvMfIRV1Ld%2FC%2BGEBu4YlgNxLqQRahwMMiRh59aX2RZ72YUTk1D%2BAlb7Z7DBTdYxSMXjVYGCMAMJWE3gXqD0qvZblXMzpuYpEfx73j9nqL44HymfJgNYK0BDD2K%2F752PPqYZ5yswj77m1wY6pgGUuL9D10J9oHXKIb%2FkbA%2FEYsOrSpdKxmf82GaI7cRgZZf5dLpi0cjEA%2FfMBniRL95%2BJdY9ilgJcb7DX%2FfcjA9%2F3XX1Emj5rybJ4VNBQ9p8ckr8NBrH9Ipc%2BMzC2RV%2FLk9l9RYnl1x7bwR70h52OWy23DbtFazf%2BxIzbiknu1NQKFGZEiP8fi8h9DaWxN8L8vHOdwlN0oNcw8q4VCxtg3wvnGpxCmMW&X-Amz-Signature=3bf74fa5e29136b6ad5f954b0a7de4649fd0fbb887f191596b92f87d217952cc&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466WJ5SWLS7%2F20261115%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261115T130658Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEOz%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIAQO2xnyd0mwxVNk%2FhRV%2B7UpGCyYu5Y%2FS59%2BbzN%2FIYLEAiA6PqsjMCmKrMt96OYof5XVZ6zbQTiP5miqVPwItJ8uHiqIBAi1%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIM40%2FLbBDOtv%2FNbeFPKtwDxHYMdQRh%2FqMrFdVOBklbzBq7iKg57n0UldTEOn6zGVsV%2BUdJ0vKGHwMkc6%2BTkFzr3s0gckCjDkSMAwLkvX1rJdBUmLaif%2FlSY7GUw%2FNYELLqIg3tXeToykmcQ0oLB34LzklgWKs9DiKtToU%2BndOzG0fF5O4EcCUx7NZMKq0v2TH6rbwVhSSaqNs5lEV%2BLWDHBKazkA5lx6lqPiVLAW6Vc4%2BhWU3lnOaN13HoIQJZSwf1DVTGHjTwzV9vFdjeH4%2FGvZ6ZwBj6n59D7sDOXzXh%2F%2BEzg2J8D9V7Usd9N7bbL7MXTu2jupkj6LB51JjzgAS%2FKp0%2BVYAaxPw8i4tT%2Bsvw1MDXhotIilSqn8kPC%2F2TQBu4C7RZefMRS1PyWF9q4CP7eEgwzgLU4aDe2yBFmWspcjTsJrpIqHEZgiTq%2FQ5sbI%2FRgAgAOTJIT0X%2B2tl5gx1DlTbAtf6HjTzhdEAXW%2BuRsE7ct5%2BHFWWlFOoap29pJJQ%2BsaUnB3hd2JvMfIRV1Ld%2FC%2BGEBu4YlgNxLqQRahwMMiRh59aX2RZ72YUTk1D%2BAlb7Z7DBTdYxSMXjVYGCMAMJWE3gXqD0qvZblXMzpuYpEfx73j9nqL44HymfJgNYK0BDD2K%2F752PPqYZ5yswj77m1wY6pgGUuL9D10J9oHXKIb%2FkbA%2FEYsOrSpdKxmf82GaI7cRgZZf5dLpi0cjEA%2FfMBniRL95%2BJdY9ilgJcb7DX%2FfcjA9%2F3XX1Emj5rybJ4VNBQ9p8ckr8NBrH9Ipc%2BMzC2RV%2FLk9l9RYnl1x7bwR70h52OWy23DbtFazf%2BxIzbiknu1NQKFGZEiP8fi8h9DaWxN8L8vHOdwlN0oNcw8q4VCxtg3wvnGpxCmMW&X-Amz-Signature=4027b62f1bf61c392bbd69ec9d173c805f98e10f73e4e79d3426ab6f0d1c0d0d&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

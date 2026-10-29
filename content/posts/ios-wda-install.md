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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663PXMNCWV%2F20261029%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261029T032348Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEEsaCXVzLXdlc3QtMiJIMEYCIQDIHlfIBfXIv%2Fshc4ykfZjggtLgDOUZepwdiMRfAqmaEQIhANiy%2FzqyMX2SqO8sCDSvKD0Cp6j4FpGPkqOMX7WSzvpcKv8DCBMQABoMNjM3NDIzMTgzODA1Igx9T25IOCOJRdPNknYq3AM6o1mJq8XUE1RYk6%2BHK%2BrVy5KV0KT9n7c%2BJjpOEmgoaVo9wvMzVu8hxK2ANaJI5AZbyY0gfoAaHVR0%2B1z%2BXYUpwHMDc4csF5lLGNlZtu9D1wqLmUDlPnaCLI6DgoTfaVxlNhpu1DlsXJP%2FMJM4%2FfMrSoihu3eMfUVcWySwgtqxgngD13NgGRIZ6yxaPKnsWxNYUgW4KKWSqbw5B7yyf8iczOZqZ8PiJiTiobXr95ugzb0pI8uJeqxirNAV3UCMwE7ioMXAJjNkW4toeWEFedHRF2E8ZLPRSEoa5S%2BG5sqCbpgk7dbBDhPrnvvxSfqOnWCgepIPXREll76X7ggUCzyaWvzqIsJ%2BnmBnblP06JqpKmLWBy6wtrwPWbQTZBUna3dgbhdRsLVK40cJzewKvCVpZyaxmKeYr1fQfzHGayf%2F5lo0glGMv9G9tmzgzUCJdDjqfM4wZ8gdy67sHjiEnahh%2BhQFAgW9nggpeVcu6EIZS4gpKcjWG5BAvsoE7eqepgHXGnwYOFSmb9DSFO1Le5Z4S3Iw1tYGccuAkU%2F%2FzznOnZ72Df1qFf4XBf%2FvqU081L1XIsKXXrx6Mw47%2FYJyYV8vo3VTrqB3XxZiCzCIiTkahMmd44R5u2mFBc2wnzC04YrXBjqkATXTJM8J9aX4whtBvXOOtuYRtOmKyF28iFa37NIx1lrWg8FM8UmyLscBid6aZX%2F96%2Bkotv3duNwL4b%2FUDF0zgudrxXtS%2FfHcQ3h5RvnrlrM4Zes1laB90ZIIUhvEc3lgy58mMA5I5jyn%2FfnLRJSgS1237NHqz0zTgA2pmYX3HA6KsgTiEcZuatD3wtGt8%2BCKqjOYYy9%2Fnib0cYMmCEGn2izvkQ%2FN&X-Amz-Signature=d45b75e69ce5d7417e178a939dc66e1a06916d0fa8c79c2d9bc84ac7f18e0e1b&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663PXMNCWV%2F20261029%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261029T032348Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEEsaCXVzLXdlc3QtMiJIMEYCIQDIHlfIBfXIv%2Fshc4ykfZjggtLgDOUZepwdiMRfAqmaEQIhANiy%2FzqyMX2SqO8sCDSvKD0Cp6j4FpGPkqOMX7WSzvpcKv8DCBMQABoMNjM3NDIzMTgzODA1Igx9T25IOCOJRdPNknYq3AM6o1mJq8XUE1RYk6%2BHK%2BrVy5KV0KT9n7c%2BJjpOEmgoaVo9wvMzVu8hxK2ANaJI5AZbyY0gfoAaHVR0%2B1z%2BXYUpwHMDc4csF5lLGNlZtu9D1wqLmUDlPnaCLI6DgoTfaVxlNhpu1DlsXJP%2FMJM4%2FfMrSoihu3eMfUVcWySwgtqxgngD13NgGRIZ6yxaPKnsWxNYUgW4KKWSqbw5B7yyf8iczOZqZ8PiJiTiobXr95ugzb0pI8uJeqxirNAV3UCMwE7ioMXAJjNkW4toeWEFedHRF2E8ZLPRSEoa5S%2BG5sqCbpgk7dbBDhPrnvvxSfqOnWCgepIPXREll76X7ggUCzyaWvzqIsJ%2BnmBnblP06JqpKmLWBy6wtrwPWbQTZBUna3dgbhdRsLVK40cJzewKvCVpZyaxmKeYr1fQfzHGayf%2F5lo0glGMv9G9tmzgzUCJdDjqfM4wZ8gdy67sHjiEnahh%2BhQFAgW9nggpeVcu6EIZS4gpKcjWG5BAvsoE7eqepgHXGnwYOFSmb9DSFO1Le5Z4S3Iw1tYGccuAkU%2F%2FzznOnZ72Df1qFf4XBf%2FvqU081L1XIsKXXrx6Mw47%2FYJyYV8vo3VTrqB3XxZiCzCIiTkahMmd44R5u2mFBc2wnzC04YrXBjqkATXTJM8J9aX4whtBvXOOtuYRtOmKyF28iFa37NIx1lrWg8FM8UmyLscBid6aZX%2F96%2Bkotv3duNwL4b%2FUDF0zgudrxXtS%2FfHcQ3h5RvnrlrM4Zes1laB90ZIIUhvEc3lgy58mMA5I5jyn%2FfnLRJSgS1237NHqz0zTgA2pmYX3HA6KsgTiEcZuatD3wtGt8%2BCKqjOYYy9%2Fnib0cYMmCEGn2izvkQ%2FN&X-Amz-Signature=b3fa9e04a8a650c1e4d9d8dfb361847e154529c2e95bee521e131da8b40aa5b2&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

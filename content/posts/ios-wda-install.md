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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB46633QX5VB2%2F20261007%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261007T222433Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEE4aCXVzLXdlc3QtMiJIMEYCIQC2rT72%2Fzkbl%2Fn7AoqwwwDiAx728kMV4Tmd69as2Ft%2F9wIhAMhhzxPdm1OgJuVlG645H4w3e%2F4be%2FkD7YJ9ZiCjgpbfKv8DCBcQABoMNjM3NDIzMTgzODA1IgxMXZvVsnb43LyI7Lsq3AOyyfuVzjpVaMtjUnTprt4l3d8bj8FrIJErk%2BPHhZSiQroxyIjbBeOnvBr5jut16hwsj8Okal6EAJytHi%2FgiNBe5kCvm1tEBYOccFiBdvUGiRlZwNalX1QtHLONFhzCGNLHQK%2B4wVF6%2FEYdjLFi7QRVKX55ErPS%2Bxcii9UJ9G8FuKA6SqhfSUHfHzL64XjMGSK5wpFga%2FIdc7zzFntax6bE98OYOQAGaU5kdeauMndlc%2B0aktScOBfprkT3HK7oY7N4W1qLhaoyku02IIoRrVFXHp%2FM1B0w2A6g2rwvqWNMFs63UbTVRiVlCGUA8SgyT5Y3e1jDPEavkrlvcY1OwyWvqjyQUgK7wjPBE8R%2BsaFzWDwWCUBzyjn9tSpN12sIydVrrbKwx7moWvIu8vTN4sGMp5lo6cVzCIUCH9ALqe8OESRHxax2EIw0KysKxXFRwsakyG2wuNIJjk%2B77rKMlAVvdByQ%2F66Xe2ZnpA5k7t5lkckIJf5BIDwcdZ5qtFMuNRgHOPJPMVyQB9R3cqFf0g7uLxHFfH78SMTC1woMnTLicOfrEgybb8LaXvL%2FuJ7tppp4cJiP7yUZImOGsOJTEeyDKCCnBbrf%2BAnsyI0vDutita2qW3zEJN6SU4XwlzC%2F%2B5rWBjqkAeZCCHE5h6teGmUA3KSipN2Pvx8P79ElzvulR9U61L8Fb4Ge%2B4YsiPJgqqTvoGGyVtf%2B8BNXR7EQ1%2F1cB5BsGT67WRP2E5R4hCL6z1w%2FKsZL7RVpsm96OhsF7TRf0%2BuuxFfh0D3JCy9%2FFbbcKx8LG7o7Icr28rqBiP%2Fyrs8kOX0Uxnq7lDct5Tu%2BcKY%2FS3MVCtkjjlNFNKzctOR8cRUrhlvKhYGC&X-Amz-Signature=4fd96cb8a33a29e5f88f754d8b29745d9f83b8196d21ee55ff9e220d365866c2&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB46633QX5VB2%2F20261007%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261007T222433Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEE4aCXVzLXdlc3QtMiJIMEYCIQC2rT72%2Fzkbl%2Fn7AoqwwwDiAx728kMV4Tmd69as2Ft%2F9wIhAMhhzxPdm1OgJuVlG645H4w3e%2F4be%2FkD7YJ9ZiCjgpbfKv8DCBcQABoMNjM3NDIzMTgzODA1IgxMXZvVsnb43LyI7Lsq3AOyyfuVzjpVaMtjUnTprt4l3d8bj8FrIJErk%2BPHhZSiQroxyIjbBeOnvBr5jut16hwsj8Okal6EAJytHi%2FgiNBe5kCvm1tEBYOccFiBdvUGiRlZwNalX1QtHLONFhzCGNLHQK%2B4wVF6%2FEYdjLFi7QRVKX55ErPS%2Bxcii9UJ9G8FuKA6SqhfSUHfHzL64XjMGSK5wpFga%2FIdc7zzFntax6bE98OYOQAGaU5kdeauMndlc%2B0aktScOBfprkT3HK7oY7N4W1qLhaoyku02IIoRrVFXHp%2FM1B0w2A6g2rwvqWNMFs63UbTVRiVlCGUA8SgyT5Y3e1jDPEavkrlvcY1OwyWvqjyQUgK7wjPBE8R%2BsaFzWDwWCUBzyjn9tSpN12sIydVrrbKwx7moWvIu8vTN4sGMp5lo6cVzCIUCH9ALqe8OESRHxax2EIw0KysKxXFRwsakyG2wuNIJjk%2B77rKMlAVvdByQ%2F66Xe2ZnpA5k7t5lkckIJf5BIDwcdZ5qtFMuNRgHOPJPMVyQB9R3cqFf0g7uLxHFfH78SMTC1woMnTLicOfrEgybb8LaXvL%2FuJ7tppp4cJiP7yUZImOGsOJTEeyDKCCnBbrf%2BAnsyI0vDutita2qW3zEJN6SU4XwlzC%2F%2B5rWBjqkAeZCCHE5h6teGmUA3KSipN2Pvx8P79ElzvulR9U61L8Fb4Ge%2B4YsiPJgqqTvoGGyVtf%2B8BNXR7EQ1%2F1cB5BsGT67WRP2E5R4hCL6z1w%2FKsZL7RVpsm96OhsF7TRf0%2BuuxFfh0D3JCy9%2FFbbcKx8LG7o7Icr28rqBiP%2Fyrs8kOX0Uxnq7lDct5Tu%2BcKY%2FS3MVCtkjjlNFNKzctOR8cRUrhlvKhYGC&X-Amz-Signature=c30eb9c2eafa1f46565a88b5219ccc81fb3ed334e266ca6e6c28670d1432698a&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

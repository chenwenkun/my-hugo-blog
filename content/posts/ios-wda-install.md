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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466WNJI2EVK%2F20261013%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261013T220356Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEN7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIBRVQc4l83CS19oqgXJznM2RwgtL5pXv%2BTrXKZCwnoq5AiB1pwD3vFxm0BP4ciIFx8Jok3nQU%2BiyCFDU7WiXtQD05SqIBAim%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMFLGti7dCKEMsRAT%2FKtwDom%2FvqioCryMOapKEG7HUpobS%2F17fvO%2B2omb1DyJEZTaKWqbTzo4GdeMifKN7abpnntrH8VLqU6aeLkMBrpv4%2FQquDVEOLkOt5LodSs1nIvCz0KkH9ZvFKokKGO4Wo7qOpOJPckhmu12%2Bnd38qWswAicBxAsZEEAm0Omw%2FSefXijj3Z0X8QnDsz4jZKU3k1cZf1pqn8KUWBu2KYYbLK7SKB4FOYJ6W1v0Qi%2FBR9t752m7W1G%2B8XKJz%2FBlNXeg5NtEeefBar3qrGJklD51OVAY58C2LMYBIXs%2Fh3sd2q4gxuEbW9%2F16M9wP9ybpxN3BHpnsl75W4fTkBJf20E%2BMSdIRJF%2BGrXEevd%2FcxhsUy7nWsZeiVPbMWyoC7PijTm9MkTRzMP7x0bk6u2%2BQTmX2ToMUx2kKb8oTjRO%2FEI7wySC1ft7efeaqqNe4SBsm%2BsI5Rbrp3MTQxsiMi93fqpPC4oU5Io%2Fmtma8A7wX1ffaCm5vUiB7JBTU9qpIlB%2ByFfqO7crmoKNV7iy5aDG6HcVw%2BaGbeuSGmR1vq%2BnGeJTwDneHWOrtTXqhGikIqcOKzxt%2BtrXws%2B2UtfX%2FSgE5uxrOQGe1mNVIfo0kx0kc3ojL98PrJryn5IiPSQAvNPQB5Ywt9O61gY6pgG418RDmnouXld3egTbMWgYKmczExbd5bBfYy2Zwn6FXjBfeC4WKUPwtdTLrSNFJ3%2Bx%2Bla8zW9026NSwvLP3SkKwbx%2FwqxjVpOoHmiBZIv4VOf4%2BJ1AqvZfO3EMPMEUsg03%2FMBiBfmgET3gCq4i09ZV2gRL5tAjcHSaC140Ih2e2UN%2FZMZnuqprLrHp0I2PRN6mhlvSu%2F0IH2jSZSY4HqHYc1%2BZxyzg&X-Amz-Signature=b0e9fbe399704dad2612eeeb4bbe2fe5271f976a7ee1af6c504e0e26ad3b56cf&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466WNJI2EVK%2F20261013%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261013T220356Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEN7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIBRVQc4l83CS19oqgXJznM2RwgtL5pXv%2BTrXKZCwnoq5AiB1pwD3vFxm0BP4ciIFx8Jok3nQU%2BiyCFDU7WiXtQD05SqIBAim%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMFLGti7dCKEMsRAT%2FKtwDom%2FvqioCryMOapKEG7HUpobS%2F17fvO%2B2omb1DyJEZTaKWqbTzo4GdeMifKN7abpnntrH8VLqU6aeLkMBrpv4%2FQquDVEOLkOt5LodSs1nIvCz0KkH9ZvFKokKGO4Wo7qOpOJPckhmu12%2Bnd38qWswAicBxAsZEEAm0Omw%2FSefXijj3Z0X8QnDsz4jZKU3k1cZf1pqn8KUWBu2KYYbLK7SKB4FOYJ6W1v0Qi%2FBR9t752m7W1G%2B8XKJz%2FBlNXeg5NtEeefBar3qrGJklD51OVAY58C2LMYBIXs%2Fh3sd2q4gxuEbW9%2F16M9wP9ybpxN3BHpnsl75W4fTkBJf20E%2BMSdIRJF%2BGrXEevd%2FcxhsUy7nWsZeiVPbMWyoC7PijTm9MkTRzMP7x0bk6u2%2BQTmX2ToMUx2kKb8oTjRO%2FEI7wySC1ft7efeaqqNe4SBsm%2BsI5Rbrp3MTQxsiMi93fqpPC4oU5Io%2Fmtma8A7wX1ffaCm5vUiB7JBTU9qpIlB%2ByFfqO7crmoKNV7iy5aDG6HcVw%2BaGbeuSGmR1vq%2BnGeJTwDneHWOrtTXqhGikIqcOKzxt%2BtrXws%2B2UtfX%2FSgE5uxrOQGe1mNVIfo0kx0kc3ojL98PrJryn5IiPSQAvNPQB5Ywt9O61gY6pgG418RDmnouXld3egTbMWgYKmczExbd5bBfYy2Zwn6FXjBfeC4WKUPwtdTLrSNFJ3%2Bx%2Bla8zW9026NSwvLP3SkKwbx%2FwqxjVpOoHmiBZIv4VOf4%2BJ1AqvZfO3EMPMEUsg03%2FMBiBfmgET3gCq4i09ZV2gRL5tAjcHSaC140Ih2e2UN%2FZMZnuqprLrHp0I2PRN6mhlvSu%2F0IH2jSZSY4HqHYc1%2BZxyzg&X-Amz-Signature=c16dd293c75a6e22a6f8eaf4505bfd5e05fbeed49d564871bb2879de1408c646&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

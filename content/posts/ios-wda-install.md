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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB46652VDZSAQ%2F20261021%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261021T205954Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJz%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIFOLwX92nAhrHdKqmK%2F5uX6mzlA2MManIcDVMtd%2FPbVNAiBE5OUWr1dND40iWoUNMt1jlyMKwAdDbKnNbYvGGhGKbir%2FAwhkEAAaDDYzNzQyMzE4MzgwNSIM7wHs7QZ6EtHBl33%2FKtwD7iINt%2BL1TGcT%2BPJrPnoY6FRHF9TL66vC%2B3prKCIp4A78ylsf0UT0milw9sWtgonQCIfGoW2TRrG%2BWv9OCOg5ubmefZzpp1zrX%2Fx7sasY9rKd2hoyptYb4v1lF%2FiY1UO9qLsBrbw4RyylfQb5dBVHw56l8CCT2GfdBfJG5I6s0Fkd8V2czFGkivH1IeMdO8WAfAcXhY68qiJV96jVJ4HaT7emPKUuN9vrwGGvakKYNQOLqhF%2F6g8XcTDCZ%2F6G6TSZbazShOiU8PEzWX3DOVP3LCtu1K8GV%2Fbn65wy7W9biDMOzbOtPNZuNDTVyre3Y8iXHuSbzTRAt8CZ78usrmabfaFDiipGscMRMAXpd9ZNA%2BlqyphBaRgm6cB9pkpNNBZZsoQkM8ODhnH75EFyXW0rJO%2FOFQf9KEoHpkjaukp%2By5nQx%2BZqqyhRByWZ005autmJ88eibKrZDF0KCOdsPUWqfCDSA9PNKgsarvJD%2F02h4rgcad8IZveOpTuloTnDBVaWsZPT1JV5eFji2y4PWfFIfHdUWolDD6K6R8Jw%2BHg2sD38HOlkK3L%2Fc9b%2BO%2Fr3a8tAA3ErnBTU%2FL5HH4L%2FqDyhrH59GAmfWohUJ8Hd6hw50b6wATx9i2S00MINDrUwgaPk1gY6pgGc4%2FN%2FsAuWhB8WY3YsU7jLQsFII4XomocMZYIuA4mlBwRQ66qbMfdoSnT3BwnJ57NgVa%2FdbHxDm2y1e4oVwK16ELN4nWpQitdkpvXiIW0GuoDbxry%2B86h%2BfE9Im4YEKoGVaU1uzrKl4%2BBI6tE295SMH6rCnX0S65nSGhAwL8knobEfhr9wNGDs%2BpCeRgzL2J5V3yC%2Bymmi2HdscUZenjfKZCXxFiFL&X-Amz-Signature=b449a06e4b7c8906ad6d3284b7739ee2c4e8d6344226041f4c0b853eef21c618&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB46652VDZSAQ%2F20261021%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261021T205955Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJz%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIFOLwX92nAhrHdKqmK%2F5uX6mzlA2MManIcDVMtd%2FPbVNAiBE5OUWr1dND40iWoUNMt1jlyMKwAdDbKnNbYvGGhGKbir%2FAwhkEAAaDDYzNzQyMzE4MzgwNSIM7wHs7QZ6EtHBl33%2FKtwD7iINt%2BL1TGcT%2BPJrPnoY6FRHF9TL66vC%2B3prKCIp4A78ylsf0UT0milw9sWtgonQCIfGoW2TRrG%2BWv9OCOg5ubmefZzpp1zrX%2Fx7sasY9rKd2hoyptYb4v1lF%2FiY1UO9qLsBrbw4RyylfQb5dBVHw56l8CCT2GfdBfJG5I6s0Fkd8V2czFGkivH1IeMdO8WAfAcXhY68qiJV96jVJ4HaT7emPKUuN9vrwGGvakKYNQOLqhF%2F6g8XcTDCZ%2F6G6TSZbazShOiU8PEzWX3DOVP3LCtu1K8GV%2Fbn65wy7W9biDMOzbOtPNZuNDTVyre3Y8iXHuSbzTRAt8CZ78usrmabfaFDiipGscMRMAXpd9ZNA%2BlqyphBaRgm6cB9pkpNNBZZsoQkM8ODhnH75EFyXW0rJO%2FOFQf9KEoHpkjaukp%2By5nQx%2BZqqyhRByWZ005autmJ88eibKrZDF0KCOdsPUWqfCDSA9PNKgsarvJD%2F02h4rgcad8IZveOpTuloTnDBVaWsZPT1JV5eFji2y4PWfFIfHdUWolDD6K6R8Jw%2BHg2sD38HOlkK3L%2Fc9b%2BO%2Fr3a8tAA3ErnBTU%2FL5HH4L%2FqDyhrH59GAmfWohUJ8Hd6hw50b6wATx9i2S00MINDrUwgaPk1gY6pgGc4%2FN%2FsAuWhB8WY3YsU7jLQsFII4XomocMZYIuA4mlBwRQ66qbMfdoSnT3BwnJ57NgVa%2FdbHxDm2y1e4oVwK16ELN4nWpQitdkpvXiIW0GuoDbxry%2B86h%2BfE9Im4YEKoGVaU1uzrKl4%2BBI6tE295SMH6rCnX0S65nSGhAwL8knobEfhr9wNGDs%2BpCeRgzL2J5V3yC%2Bymmi2HdscUZenjfKZCXxFiFL&X-Amz-Signature=7f930da8bff1c658c085d8b9dc68f177cc7f5d12818495202026b75b70f5917f&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4664ODXL2BM%2F20260818%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260818T003618Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEIf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIBGoP3xMVSSKTu9W%2B4hJGewrzMqPhoNTFMAp911%2BFv9qAiEAkH%2FEIz4WfV5tUD%2FWyGXtJxmWCCfOdxMpqfZW8aDSxhYq%2FwMIUBAAGgw2Mzc0MjMxODM4MDUiDMv%2F80DI9T5yPQLkTCrcA7qvSCfryv8km0qL%2BfNkUzwdSnanGIHkOtklEF51AelAP1L%2F39T2kq3TNja0AnMurdh5Oe0pXyJYg4nxn68Q3HXLNvMN5f1IqcmRG%2FlTLuxb7GBZzuFW8HK6fIjJpV4F%2Fdw22F%2BEWyQgoRbNKUnkpTDQiwLDjm1Hcs5RVpCNLXvkpzPgwiOzSXat0dEIX13FZ4StAIRqB9AHd834y99cMZQmcCVwxCPf7a4eC2UuBEcFNcGB2rJtojt0dNA4H%2FIiFSZT1w%2BN70fFM2uVtOgV3i6k8Eh7cLJwrofGpHJaCfUxX6KzMMxJHXYWJ17R3vkmCb%2BTWu65WUOMcuTB%2B1k%2FlQGwbK86mdz3u1iIo7kfpCEMfBHWfMte66ptk2X9rWrPsnU8zhH6axBfOWiouA9H7zuiLJCF7cFxAvrXUXLhc7tpve5OT6MMopZA%2Bp4L37WsT%2FXHB4wI8%2FF6bbmPrsU5YFaYZ6ej6EwAEga5zhceMG9brDS2%2FQudrUyDJqzxXXkdmghSI8tWKG%2Fp5hAQj%2FnetYlXakjUUSmRrd31iRNN2Pjg2qJsYP0FIypAgzDOlqvixnHRQlLAhaj%2BCD%2BJocj1JgBi2MyFX95FhmPN19S%2F7TGAb3QRQ9c%2B6HhtYgbCMKeejtQGOqUBFwytVYESLnZiKeZwdlpBb8qu9Jt1KWaDbwaffYEBnsJ%2BUiR6hJN1zgaw3ZZliyaYLVbFhLOhDumBhLTv55lFQkbt0yX2A%2Bgd5j0ac9BBH10%2F7KV3kYYmufBF%2BXjshPs290g8ZawecAvNRBcLL2TdK5CPY0YmlVdRnG01fg2G5UPT2C1CrDANmPQDlIWY5PS8Xb8BPgRfU513FJxqSlvGB8apmwNC&X-Amz-Signature=df4b9231a39d853a3ae6cd610657e6a53d52ab4836d5da7c7086ba4ba6097346&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4664ODXL2BM%2F20260818%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260818T003618Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEIf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIBGoP3xMVSSKTu9W%2B4hJGewrzMqPhoNTFMAp911%2BFv9qAiEAkH%2FEIz4WfV5tUD%2FWyGXtJxmWCCfOdxMpqfZW8aDSxhYq%2FwMIUBAAGgw2Mzc0MjMxODM4MDUiDMv%2F80DI9T5yPQLkTCrcA7qvSCfryv8km0qL%2BfNkUzwdSnanGIHkOtklEF51AelAP1L%2F39T2kq3TNja0AnMurdh5Oe0pXyJYg4nxn68Q3HXLNvMN5f1IqcmRG%2FlTLuxb7GBZzuFW8HK6fIjJpV4F%2Fdw22F%2BEWyQgoRbNKUnkpTDQiwLDjm1Hcs5RVpCNLXvkpzPgwiOzSXat0dEIX13FZ4StAIRqB9AHd834y99cMZQmcCVwxCPf7a4eC2UuBEcFNcGB2rJtojt0dNA4H%2FIiFSZT1w%2BN70fFM2uVtOgV3i6k8Eh7cLJwrofGpHJaCfUxX6KzMMxJHXYWJ17R3vkmCb%2BTWu65WUOMcuTB%2B1k%2FlQGwbK86mdz3u1iIo7kfpCEMfBHWfMte66ptk2X9rWrPsnU8zhH6axBfOWiouA9H7zuiLJCF7cFxAvrXUXLhc7tpve5OT6MMopZA%2Bp4L37WsT%2FXHB4wI8%2FF6bbmPrsU5YFaYZ6ej6EwAEga5zhceMG9brDS2%2FQudrUyDJqzxXXkdmghSI8tWKG%2Fp5hAQj%2FnetYlXakjUUSmRrd31iRNN2Pjg2qJsYP0FIypAgzDOlqvixnHRQlLAhaj%2BCD%2BJocj1JgBi2MyFX95FhmPN19S%2F7TGAb3QRQ9c%2B6HhtYgbCMKeejtQGOqUBFwytVYESLnZiKeZwdlpBb8qu9Jt1KWaDbwaffYEBnsJ%2BUiR6hJN1zgaw3ZZliyaYLVbFhLOhDumBhLTv55lFQkbt0yX2A%2Bgd5j0ac9BBH10%2F7KV3kYYmufBF%2BXjshPs290g8ZawecAvNRBcLL2TdK5CPY0YmlVdRnG01fg2G5UPT2C1CrDANmPQDlIWY5PS8Xb8BPgRfU513FJxqSlvGB8apmwNC&X-Amz-Signature=589d1a7ec978b36572a764dca9c5044b89397980c28d433791056a3e49456dc4&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

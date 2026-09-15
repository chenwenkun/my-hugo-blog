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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466WAVK7LX4%2F20260915%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260915T103903Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEDIaCXVzLXdlc3QtMiJGMEQCIDbwlfWQQIHKdozYzkW2Bj7NZAlRH%2BFfYEWA4%2BheefqXAiAds2SDluEniHsDUBfCGCdYDO27Ahy9D2gWlQCnkyX34CqIBAj7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMrcnbyEKV3zyb50SxKtwDRV%2B6EZfj6KmcGTlkwo4j5S8wx7dHuDT7efBvQe%2Fn2cDCvQs9Oja1L32m0oB48Jg3%2FCi1kJ8w1Wznm1WSO3WQbiEUOI8JO9RF5BMiRpp4ZP41ILlD4HiZw3PQaLXnWicdfHCjYmixcpz88GyNcvUwNDp53X01SomwBKnFjChjnv6gX1kuqC3fAgfVSesDoHMiBcpUsPtsHB9ToWU0F6OiEnZjNaDtzd43LhPKpWvZPCeQwzAHJp%2BmF8HbC6X1zrSnPGsW6XaYjUaNrzN%2BwxhBG7TZqdZ3iBrBEbeuQiKmcEkxt7b45XV0IwLfN%2Bs14IrgtUOx6FutVfNEDuNKxC3n6k0%2FW%2BLgf%2Fb0SkzGzxPNRwv6cNw3SSCjejCCQkF8Y4xcXfK0Wmt7nLagwKt66jLXKf7vH6Kkxyh2GAu5RN8XKE13RiO4Pt9a3sgwDWKyDdLW865vEi1mG0Wi73SB32QrtVhfzmxTawEKYg5aIl3tnch1F17kaSbdB5uFaMOVJOmZ0k1oCTgCJ1bdId37Wdko%2BJW2%2BVxVEkqk%2Be33taFaARdtmFcLixovU4czjL95GpHFEyKRhRi1tl74y7jKQZ6XSHT6WD87DkkX3iE0ZnlyWUN9qv1gnvr2zsc5W4sw1qOk1QY6pgEmuXpEZDHdqPb7eYxw%2FlH4EraqXP5oAlIl1DE6NG6vzm9te7K9eWWdEaKm2nYATJY4GfFb2x3jYXyzjpG9j9MMEH3vokwVVgEp2HkKK1NGv4xiEHQMMSapigZ%2F0h52GqGwpjM7s6U4I9jSnrL7184AVAGaxl%2FHUGgYz3hExEKunYKRX8cSNQ78oRRVD3bHS%2FLM7J5ZcZXjUpK0ongCKM3HqGQcQuQK&X-Amz-Signature=aeb8d8a24337ea4df60f82b99a136c6d1a7364f8b0dd9dd1dd7a2aabff71a023&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466WAVK7LX4%2F20260915%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260915T103904Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEDIaCXVzLXdlc3QtMiJGMEQCIDbwlfWQQIHKdozYzkW2Bj7NZAlRH%2BFfYEWA4%2BheefqXAiAds2SDluEniHsDUBfCGCdYDO27Ahy9D2gWlQCnkyX34CqIBAj7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMrcnbyEKV3zyb50SxKtwDRV%2B6EZfj6KmcGTlkwo4j5S8wx7dHuDT7efBvQe%2Fn2cDCvQs9Oja1L32m0oB48Jg3%2FCi1kJ8w1Wznm1WSO3WQbiEUOI8JO9RF5BMiRpp4ZP41ILlD4HiZw3PQaLXnWicdfHCjYmixcpz88GyNcvUwNDp53X01SomwBKnFjChjnv6gX1kuqC3fAgfVSesDoHMiBcpUsPtsHB9ToWU0F6OiEnZjNaDtzd43LhPKpWvZPCeQwzAHJp%2BmF8HbC6X1zrSnPGsW6XaYjUaNrzN%2BwxhBG7TZqdZ3iBrBEbeuQiKmcEkxt7b45XV0IwLfN%2Bs14IrgtUOx6FutVfNEDuNKxC3n6k0%2FW%2BLgf%2Fb0SkzGzxPNRwv6cNw3SSCjejCCQkF8Y4xcXfK0Wmt7nLagwKt66jLXKf7vH6Kkxyh2GAu5RN8XKE13RiO4Pt9a3sgwDWKyDdLW865vEi1mG0Wi73SB32QrtVhfzmxTawEKYg5aIl3tnch1F17kaSbdB5uFaMOVJOmZ0k1oCTgCJ1bdId37Wdko%2BJW2%2BVxVEkqk%2Be33taFaARdtmFcLixovU4czjL95GpHFEyKRhRi1tl74y7jKQZ6XSHT6WD87DkkX3iE0ZnlyWUN9qv1gnvr2zsc5W4sw1qOk1QY6pgEmuXpEZDHdqPb7eYxw%2FlH4EraqXP5oAlIl1DE6NG6vzm9te7K9eWWdEaKm2nYATJY4GfFb2x3jYXyzjpG9j9MMEH3vokwVVgEp2HkKK1NGv4xiEHQMMSapigZ%2F0h52GqGwpjM7s6U4I9jSnrL7184AVAGaxl%2FHUGgYz3hExEKunYKRX8cSNQ78oRRVD3bHS%2FLM7J5ZcZXjUpK0ongCKM3HqGQcQuQK&X-Amz-Signature=d5f5393081b16ed3dfce232cc834acd282831fcffe45b46796f514e171ce88c4&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

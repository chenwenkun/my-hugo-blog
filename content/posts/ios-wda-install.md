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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466REB4P3FN%2F20260810%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260810T124221Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjENT%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIAKwRGESnHKx%2FMhq8Z%2Fjjeh2660GAtCvDrU9y1l3kceYAiAZqXFsqb8DQI3u9uF5s9vEHCfxJ6B2BKbAARqfPvS%2BrCqIBAid%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMM7Dqw%2FUOPIPnlBtrKtwDDrGmAZ5qXFuqB12Y2Lcs66EIz5SQwUOUcYb0KjR4KSkWhWjtsHBqlCXrguMdwcHPJ%2BkBh%2FG7MWdllwsXAz6kMfefia1tSrIbXv0CrATTUHX%2F8xXBg0uVw5V7EiL1P3x%2F%2BXVVx7ouP%2BiqVoowlJzuL3P%2FUzrUtI4rGz3yztqEsN6fTkOFClC49jqhud%2BmKg%2BYPkeg%2FyN4ITgtRDFDZAofbdFt5T3JBtWepVJcPdXqoNtffEMaH9zVukVd471ka6%2Bry%2BQS3HfozzKTTONAFf7NAIFCKPEHa6HXoNS3vUn1WbXNhrDMwJMRGSrmcNToOmeEDRd2ulBj36c%2FpbHkyG8b1IuYUkTKsQjoY8xif3umfHzw48sOEZy8SRZga5DUtU3XgplaaEmi9DSZ3e3XyB0v2O%2BSn0PyzK8bOg7vIdymJXLJaWlgYhmLNy6KnUjX3RGDSGDlxF4HCHEtVYLKKrpL1jM4ipeMQu3QSMo2pEozRvO11O4Ox9UPkv6AY14XmNBjUJh4xTRmUw35LMqiOzmHGMAe446FnhRj3VoxZ38PHH8c567detah5z7oX2ScsNmXEjWpvEJ66mI5JEM30OQ7BX7g5dkEWkZ1Y6X9mkLSQ6uC%2F7h2fWQEKLMJpPAwm%2FDm0wY6pgEd6xLE1hgZONREVufMha59xGBVhQ%2FJEbtZQNO0GiCxUA2j9cyO5EjkgF2b03K1qOa%2FwiIWeuU%2BzMH%2BDaSGfHVuty%2F6S3I0UIbr%2BHe5%2BQz34mApmTImWalTuSSI1dZd2Y00KNOep4YFhIcLw3jDUCaFLjTP32SSM867Y%2Fkq0j49D9oJvdYwC1QPUovQ29YrfvnT9wvZYY6UaUpcS2fWc8Cd%2FQ3njpgc&X-Amz-Signature=93e71e636decf3a0a89309ac59a2468ddae4b6719c242cf65a6f7edb3c60ae4d&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466REB4P3FN%2F20260810%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260810T124221Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjENT%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIAKwRGESnHKx%2FMhq8Z%2Fjjeh2660GAtCvDrU9y1l3kceYAiAZqXFsqb8DQI3u9uF5s9vEHCfxJ6B2BKbAARqfPvS%2BrCqIBAid%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMM7Dqw%2FUOPIPnlBtrKtwDDrGmAZ5qXFuqB12Y2Lcs66EIz5SQwUOUcYb0KjR4KSkWhWjtsHBqlCXrguMdwcHPJ%2BkBh%2FG7MWdllwsXAz6kMfefia1tSrIbXv0CrATTUHX%2F8xXBg0uVw5V7EiL1P3x%2F%2BXVVx7ouP%2BiqVoowlJzuL3P%2FUzrUtI4rGz3yztqEsN6fTkOFClC49jqhud%2BmKg%2BYPkeg%2FyN4ITgtRDFDZAofbdFt5T3JBtWepVJcPdXqoNtffEMaH9zVukVd471ka6%2Bry%2BQS3HfozzKTTONAFf7NAIFCKPEHa6HXoNS3vUn1WbXNhrDMwJMRGSrmcNToOmeEDRd2ulBj36c%2FpbHkyG8b1IuYUkTKsQjoY8xif3umfHzw48sOEZy8SRZga5DUtU3XgplaaEmi9DSZ3e3XyB0v2O%2BSn0PyzK8bOg7vIdymJXLJaWlgYhmLNy6KnUjX3RGDSGDlxF4HCHEtVYLKKrpL1jM4ipeMQu3QSMo2pEozRvO11O4Ox9UPkv6AY14XmNBjUJh4xTRmUw35LMqiOzmHGMAe446FnhRj3VoxZ38PHH8c567detah5z7oX2ScsNmXEjWpvEJ66mI5JEM30OQ7BX7g5dkEWkZ1Y6X9mkLSQ6uC%2F7h2fWQEKLMJpPAwm%2FDm0wY6pgEd6xLE1hgZONREVufMha59xGBVhQ%2FJEbtZQNO0GiCxUA2j9cyO5EjkgF2b03K1qOa%2FwiIWeuU%2BzMH%2BDaSGfHVuty%2F6S3I0UIbr%2BHe5%2BQz34mApmTImWalTuSSI1dZd2Y00KNOep4YFhIcLw3jDUCaFLjTP32SSM867Y%2Fkq0j49D9oJvdYwC1QPUovQ29YrfvnT9wvZYY6UaUpcS2fWc8Cd%2FQ3njpgc&X-Amz-Signature=d334df986e078245383d50a9486f82a3578c32e46d048832368cc7b5bebfed8f&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

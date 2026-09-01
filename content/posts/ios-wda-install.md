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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB46647H2F5UH%2F20260901%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260901T154346Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEOj%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIACBS1AVw4GwVqgDtGpPeC0y1b5YlmgULzCIjEKLGCdKAiBtJpPbaiSUzXaAEsCvAjypN1ib16exaEJBtdoGgHqJpSqIBAix%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIM1c3YNRSGu%2BIxZk4iKtwDB3PvOaGxCwjKJKeFaFGCG4H4uDm2c4ul%2Fdn1yHAmBctxBKQM6wFyk4ieC9yMGnPYuu6SbJ0lslrSYcJCjWV1qr8UM0M5eHmt38lbzhMKarNfRcgwayeMSBSR4Xb%2F9j4%2FctWIBlTtqKebwUqJDqVyn%2F43aye0RRSmc3%2BBLkiIjC2j0%2FMgA44UU7TdaaTmaF1JbekJi5uNZZhm9DxthECND5bIvsxdwCR%2F25lDvZMItCtq6zp0AiEUgXwiLtZR8cdxSF%2FcsU0qEvaOMLbo9S1qRfkbaaSTR2w6%2BaZNuFm7gnBDpg2X0sPq94C6t%2FVjquGfH%2BKGfBQAoFC2LslZZ2M2jXmd8SNCYA9%2FdGON8dbGkJ646U8Pkj9SftmYpxGBr1x4qeU2AxwV6BZw7GbWgiDSYeu2V0iDqJRCF%2B4k8eCf5kHq5XcX7Vi%2B%2B3nN9fEERUodVXqr8uLA1K0ajq1rndIR9T1Al1iimzXX1rGQISi%2BCIDAQQ8mi6lAwwDVTP8JDwHeHzaC7j8RNHUvLLRNKUEb01LNKfKgnVYCibwbuQb0ESWTwIFN6Xxrs7I7V9%2FA2EjD3y%2B5E7BUH%2FR6uvxXe0qNd6TeUVzxp6jF%2BExCIbuTZh2cg3aTB%2FFr6zdVzyYwieDb1AY6pgEZCBxX3duec7eLWaJMonLwPAf76uPP0CyV5I2vC%2FM0zKkaKqSXWAicdgUkh3UIid5j0TXXW%2Bf%2Fg77JQFidgEEIRxLXbyKMRyuHhLkR1WNegQgp%2F658LtQ8UJzz5Ywv1mKqpJJM4AB2CwYqt2qaE1ZRQ4s14NxJnn8bT3aSPp8Y%2BU18nP3Lt%2FmWiey8W5Wucg6Poe0r7KzAr4Jb3IQzYJJ3MN0qdWHq&X-Amz-Signature=3b757aa0ac660ca2f48d0a94db32e74d23d541284e79bb4c491bb5326d9359ab&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB46647H2F5UH%2F20260901%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260901T154346Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEOj%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIACBS1AVw4GwVqgDtGpPeC0y1b5YlmgULzCIjEKLGCdKAiBtJpPbaiSUzXaAEsCvAjypN1ib16exaEJBtdoGgHqJpSqIBAix%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIM1c3YNRSGu%2BIxZk4iKtwDB3PvOaGxCwjKJKeFaFGCG4H4uDm2c4ul%2Fdn1yHAmBctxBKQM6wFyk4ieC9yMGnPYuu6SbJ0lslrSYcJCjWV1qr8UM0M5eHmt38lbzhMKarNfRcgwayeMSBSR4Xb%2F9j4%2FctWIBlTtqKebwUqJDqVyn%2F43aye0RRSmc3%2BBLkiIjC2j0%2FMgA44UU7TdaaTmaF1JbekJi5uNZZhm9DxthECND5bIvsxdwCR%2F25lDvZMItCtq6zp0AiEUgXwiLtZR8cdxSF%2FcsU0qEvaOMLbo9S1qRfkbaaSTR2w6%2BaZNuFm7gnBDpg2X0sPq94C6t%2FVjquGfH%2BKGfBQAoFC2LslZZ2M2jXmd8SNCYA9%2FdGON8dbGkJ646U8Pkj9SftmYpxGBr1x4qeU2AxwV6BZw7GbWgiDSYeu2V0iDqJRCF%2B4k8eCf5kHq5XcX7Vi%2B%2B3nN9fEERUodVXqr8uLA1K0ajq1rndIR9T1Al1iimzXX1rGQISi%2BCIDAQQ8mi6lAwwDVTP8JDwHeHzaC7j8RNHUvLLRNKUEb01LNKfKgnVYCibwbuQb0ESWTwIFN6Xxrs7I7V9%2FA2EjD3y%2B5E7BUH%2FR6uvxXe0qNd6TeUVzxp6jF%2BExCIbuTZh2cg3aTB%2FFr6zdVzyYwieDb1AY6pgEZCBxX3duec7eLWaJMonLwPAf76uPP0CyV5I2vC%2FM0zKkaKqSXWAicdgUkh3UIid5j0TXXW%2Bf%2Fg77JQFidgEEIRxLXbyKMRyuHhLkR1WNegQgp%2F658LtQ8UJzz5Ywv1mKqpJJM4AB2CwYqt2qaE1ZRQ4s14NxJnn8bT3aSPp8Y%2BU18nP3Lt%2FmWiey8W5Wucg6Poe0r7KzAr4Jb3IQzYJJ3MN0qdWHq&X-Amz-Signature=33568f3c6357583608477ce378bb8f7842c827b811029b4fd8440a4bb41b0e61&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

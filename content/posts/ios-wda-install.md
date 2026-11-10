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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466TT55OA4G%2F20261110%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261110T223813Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEHoaCXVzLXdlc3QtMiJGMEQCIH6ZKo3TvZ%2BRmMd4urynm0UAnv4fCm1yN6ZfYGvknaU8AiABDsf8UTHSj%2FEKYcPG5gtFP16E7%2B6v3s6BtFYryMr1Hir%2FAwhDEAAaDDYzNzQyMzE4MzgwNSIM51zZfKTQP%2FzGFQo6KtwDOpcfU7nRKly7Yk1Z%2BPcej%2FJe66WEul1HZqHwolYekP92NUnJHeULMFYBVWzWvlUkZUdSiYf38l6E9yXOjoXT8bnxdP1jluQjYUg3UegdT8g0OPGfkwrSE1FmjdRceop5EVI9diACzIBQqoE0tYggHZsZy3Q6YRhb3jGkaOuocJHbnFsBr8AJWAdSSJ8J%2B3MCQSAaDqEHeC%2F3bt6O5YAVkYm1D3VLAPnIR2SKZRs0GAXTzmlWfTU3vCveI%2F%2F1mSCDwRLvCFMuG1KLqU%2FgXPHNj2K3esTTsuUCnfjLsuGYkztdNAWjYzUZyKu%2FTs6nng8o%2BicH9E4ivQUmE%2Bctn2bWsiC9gE7s%2B2wz6%2Bg8qP4zUOR0p%2BvG%2B1xONPGD0n3Yr5TNmIBwSzL17o0ipx1%2FZPKIl12ybCLCI1nC5YW%2B6HStmdqe%2FWculwrY1pvwSGZBDFPY2jOsENQOyRBVJSTymTOK0PE%2FDHLNxScY53khPW8nHXzABxwlCQdH7uyyKQ%2FSMBTgGjBbDFz5XH7tnOpqeRW98EWkfCBVdXNwX%2F9npxEka2Zrhh3T%2FGcS%2Bdmp5QkOC6op%2BYS7YtMq1%2B%2FTxn37FesuKqjL4%2FCQJ4WGfG0ZDQ08coesUEyp9ZMeaoPjrPIw0LHN1wY6pgEdJhwN7efkTmkQmotgnb2XcxoBN4Bw05pgKR9KVkKpFRCBZrqf2GRrcJX59GZyJhTAAoqTAIvrIQ5K0nan0Y9d9UnLsSHBDwo57YuPdOyHoYKTJxGdxAPsrBCVwSLW1Dy9M6XPQW0Qp5Z8J3mnUU5AWFWaLlAlHiSOUsyZIFW9zenEtiSLkUttnZ1Z97o3yg97yZuJHtAUsMWITwz2QS3ABCGHZBdv&X-Amz-Signature=96acb33d5944abc58079eb0c66a707282a60ec9808214c46871d207929911911&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466TT55OA4G%2F20261110%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261110T223813Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEHoaCXVzLXdlc3QtMiJGMEQCIH6ZKo3TvZ%2BRmMd4urynm0UAnv4fCm1yN6ZfYGvknaU8AiABDsf8UTHSj%2FEKYcPG5gtFP16E7%2B6v3s6BtFYryMr1Hir%2FAwhDEAAaDDYzNzQyMzE4MzgwNSIM51zZfKTQP%2FzGFQo6KtwDOpcfU7nRKly7Yk1Z%2BPcej%2FJe66WEul1HZqHwolYekP92NUnJHeULMFYBVWzWvlUkZUdSiYf38l6E9yXOjoXT8bnxdP1jluQjYUg3UegdT8g0OPGfkwrSE1FmjdRceop5EVI9diACzIBQqoE0tYggHZsZy3Q6YRhb3jGkaOuocJHbnFsBr8AJWAdSSJ8J%2B3MCQSAaDqEHeC%2F3bt6O5YAVkYm1D3VLAPnIR2SKZRs0GAXTzmlWfTU3vCveI%2F%2F1mSCDwRLvCFMuG1KLqU%2FgXPHNj2K3esTTsuUCnfjLsuGYkztdNAWjYzUZyKu%2FTs6nng8o%2BicH9E4ivQUmE%2Bctn2bWsiC9gE7s%2B2wz6%2Bg8qP4zUOR0p%2BvG%2B1xONPGD0n3Yr5TNmIBwSzL17o0ipx1%2FZPKIl12ybCLCI1nC5YW%2B6HStmdqe%2FWculwrY1pvwSGZBDFPY2jOsENQOyRBVJSTymTOK0PE%2FDHLNxScY53khPW8nHXzABxwlCQdH7uyyKQ%2FSMBTgGjBbDFz5XH7tnOpqeRW98EWkfCBVdXNwX%2F9npxEka2Zrhh3T%2FGcS%2Bdmp5QkOC6op%2BYS7YtMq1%2B%2FTxn37FesuKqjL4%2FCQJ4WGfG0ZDQ08coesUEyp9ZMeaoPjrPIw0LHN1wY6pgEdJhwN7efkTmkQmotgnb2XcxoBN4Bw05pgKR9KVkKpFRCBZrqf2GRrcJX59GZyJhTAAoqTAIvrIQ5K0nan0Y9d9UnLsSHBDwo57YuPdOyHoYKTJxGdxAPsrBCVwSLW1Dy9M6XPQW0Qp5Z8J3mnUU5AWFWaLlAlHiSOUsyZIFW9zenEtiSLkUttnZ1Z97o3yg97yZuJHtAUsMWITwz2QS3ABCGHZBdv&X-Amz-Signature=883ab850c85fc04d2b7501442785597f5c4abee8c6a0d424ea7ab47808510c80&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

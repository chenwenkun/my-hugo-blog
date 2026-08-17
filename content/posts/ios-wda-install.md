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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466YLP4O2KV%2F20260817%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260817T003638Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEHEaCXVzLXdlc3QtMiJHMEUCIEQqqPYj%2FpPCk36DooimOHAU%2FhtuFoxSCop5%2FxwoZayTAiEA1mAy5P1phPIkRVIR6IC74XNKP0BjGnHlwgqeRCsPylYq%2FwMIOhAAGgw2Mzc0MjMxODM4MDUiDPpLD21H%2FsKzBCPpsircA11IGd%2FJfHRLu5y2KIvz6wCW%2BKTHLXx05cuNnS7eNT98u%2FnyCt70tcuCirUvzpzg3duyyajTT0FhNJsiimoDKfHESWsWwXh2QCZoX7bhvkYSeTekdYwqisuwiyCLcQxR22jarEp1DK19zmUgYYJ1B9ow1%2FdIRN0KMGriymyXocUNJ7aO9Q8NfQh3yRLtuW5fQEOuSjoxEcEjj82ytLUCjLbRzYyUyd%2Bk1jqyvr%2FsX8NWWHR4FisTWUbKDVHGbCWYc1QUH9Q5uxMi3rfnlDZhBzc8iJow8hSS9ngeeWKKgEiDsA07QOJKSjBhkIxn4BzY7TdPMFLTj2QpUP8lSpaMeckjmNPmf3Z7dCx%2BKM%2BSAUkXJ9bUxD0B%2F3eBTNHBevB3ROkTR%2FUcRVsoOkww6KRMYU196I8AqhN2hCUNMt1AI3StTg4xeME%2BxhqcisDZ2p8HBzV6w91An4aqwpHsnNRMciSDTAT%2Fw%2FWEqtZLkrVhHeaWqXaput80b4RRAuIXidIgvZ1AeHcxDuV4dQXD0KsId4Qyeha5nDzYGVW1UTDKMXil0NoCoHSGhpYuUN%2FKaykw4IRpseVDcpW6rUSUtNP%2B%2BkcV0CkPU9Jz6Z91NJqBEVJbuzaJMHquIOoqIEzRMLutidQGOqUBTSZEGPclE%2BP5qgS%2Bve3%2BzefxMGDV0TBZZ93EA5V5I9YxqAtzt%2B8UCa5nVWLt2nvIlyPyMi02JIHS3DUGzRzI4Fq5NTy9lavP8uzdLcITSX7oPaARJ3O3St0Ge5QAPcVPXhb5tHpeD%2Fga%2FbYp4niX4SwCJDE7D3Po8nvsm58uwMYeHKB9Wkr%2B5ESJP%2BWrYfXwilViBp3cDnR8S4iu3knXHcLHEFyf&X-Amz-Signature=1b5cef3be5c61f1a9bdd54e8f3f24e1af6893794cb3058d2e4c13629bc5e5ff8&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466YLP4O2KV%2F20260817%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260817T003638Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEHEaCXVzLXdlc3QtMiJHMEUCIEQqqPYj%2FpPCk36DooimOHAU%2FhtuFoxSCop5%2FxwoZayTAiEA1mAy5P1phPIkRVIR6IC74XNKP0BjGnHlwgqeRCsPylYq%2FwMIOhAAGgw2Mzc0MjMxODM4MDUiDPpLD21H%2FsKzBCPpsircA11IGd%2FJfHRLu5y2KIvz6wCW%2BKTHLXx05cuNnS7eNT98u%2FnyCt70tcuCirUvzpzg3duyyajTT0FhNJsiimoDKfHESWsWwXh2QCZoX7bhvkYSeTekdYwqisuwiyCLcQxR22jarEp1DK19zmUgYYJ1B9ow1%2FdIRN0KMGriymyXocUNJ7aO9Q8NfQh3yRLtuW5fQEOuSjoxEcEjj82ytLUCjLbRzYyUyd%2Bk1jqyvr%2FsX8NWWHR4FisTWUbKDVHGbCWYc1QUH9Q5uxMi3rfnlDZhBzc8iJow8hSS9ngeeWKKgEiDsA07QOJKSjBhkIxn4BzY7TdPMFLTj2QpUP8lSpaMeckjmNPmf3Z7dCx%2BKM%2BSAUkXJ9bUxD0B%2F3eBTNHBevB3ROkTR%2FUcRVsoOkww6KRMYU196I8AqhN2hCUNMt1AI3StTg4xeME%2BxhqcisDZ2p8HBzV6w91An4aqwpHsnNRMciSDTAT%2Fw%2FWEqtZLkrVhHeaWqXaput80b4RRAuIXidIgvZ1AeHcxDuV4dQXD0KsId4Qyeha5nDzYGVW1UTDKMXil0NoCoHSGhpYuUN%2FKaykw4IRpseVDcpW6rUSUtNP%2B%2BkcV0CkPU9Jz6Z91NJqBEVJbuzaJMHquIOoqIEzRMLutidQGOqUBTSZEGPclE%2BP5qgS%2Bve3%2BzefxMGDV0TBZZ93EA5V5I9YxqAtzt%2B8UCa5nVWLt2nvIlyPyMi02JIHS3DUGzRzI4Fq5NTy9lavP8uzdLcITSX7oPaARJ3O3St0Ge5QAPcVPXhb5tHpeD%2Fga%2FbYp4niX4SwCJDE7D3Po8nvsm58uwMYeHKB9Wkr%2B5ESJP%2BWrYfXwilViBp3cDnR8S4iu3knXHcLHEFyf&X-Amz-Signature=97e4b52ef147b8abef581faf5310a666b9453af6182a55f529fa9173bcfbfa8f&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

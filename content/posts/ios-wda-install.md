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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466YYBSQOYD%2F20260816%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260816T181243Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEGkaCXVzLXdlc3QtMiJGMEQCICLygMTDbvDNvpiMojF8m2Ehl98dPeN4lY0MBtS3fCfoAiAHx9tckhZaSozfzzw2wYl3tlpQK3xl3ab2CTDCDB1O9yr%2FAwgyEAAaDDYzNzQyMzE4MzgwNSIMU8t6YOMAHLBKxNYEKtwDnAhZqxLGu4q7hZvBPdk7InSlIGqZ9eFyAq9C0O%2FHRhk4Usidu2i5bV6AGOfstm9YD5sVenJQmV9yNRomeMrzRtR7RNquF6NsN40onYM25no4xs2Xd5gn%2F2tKNikxQ735g6hge%2Bi6TFRjB%2FofHs%2BnEKpI9U57diSMgRucDaYldErY7BXNFwm8M5a9rbpACXiN5NmkUOz4ZzEE7NnYqc8RdGOOqeLmyETG9nU%2BS0jjj4AJWK%2BqYfvwTksKVpGV7CfxNHpODxIINMv08N7Ngfi4s5kMlyayynC%2BSQMVtITcWgHfez3ibzkYuBs0G2eN8JvwTy4V9L4JPI4OOYX6Motfc5gwsrReZSWbItf4xNYx12Vks3eM0VqhJ%2FgEk5xWwsJyD2esl%2F1TLtG4Os4FVDFCHpNUIEoi7fkKGG2JQ6XMXsMN1YhXWUpQwkJtDrLrier%2BLigvdWhRcqntbnGgYSIU%2F7aQHGojRejfUicabTWjVbgqbDBmarvUHobCDSoAFcC1AtKhw16XoQSCVALkck4mWIgng7e%2F1QVwxUfPzvzfxTIbEMH8sOrr00LunG6lSPafGwUsc0WZk8Jxdv24Ub1ogsq8M2xgzIJLHDOqLEyYrFyKFtCRQouSq9QYa9Ew3M6H1AY6pgHsdmiTHacEUWtXdYPm6A7WFw2o9jsmsfHeZdLjHlNRJYZZNl6HlRHPsU7DMSPmp%2Bdq5YBeATVxIgg9VSjK4wzmhx1MNHbXyC12I87v%2B6S%2B32fWGT2J0LaXjd%2FC6DcqvDj9HFMksM7A6Lr9fbEuXsD5FIbZURJalH3w%2BpqHsljcJEyO91lhlyLAnkaDp4l4CaFrkrikFYgKpexdtBK2y%2F7MD1G%2Fuq2P&X-Amz-Signature=ac004744ad701f56aaf9b74a0fff5c0265a496770714dc2de3619e25af432356&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466YYBSQOYD%2F20260816%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260816T181243Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEGkaCXVzLXdlc3QtMiJGMEQCICLygMTDbvDNvpiMojF8m2Ehl98dPeN4lY0MBtS3fCfoAiAHx9tckhZaSozfzzw2wYl3tlpQK3xl3ab2CTDCDB1O9yr%2FAwgyEAAaDDYzNzQyMzE4MzgwNSIMU8t6YOMAHLBKxNYEKtwDnAhZqxLGu4q7hZvBPdk7InSlIGqZ9eFyAq9C0O%2FHRhk4Usidu2i5bV6AGOfstm9YD5sVenJQmV9yNRomeMrzRtR7RNquF6NsN40onYM25no4xs2Xd5gn%2F2tKNikxQ735g6hge%2Bi6TFRjB%2FofHs%2BnEKpI9U57diSMgRucDaYldErY7BXNFwm8M5a9rbpACXiN5NmkUOz4ZzEE7NnYqc8RdGOOqeLmyETG9nU%2BS0jjj4AJWK%2BqYfvwTksKVpGV7CfxNHpODxIINMv08N7Ngfi4s5kMlyayynC%2BSQMVtITcWgHfez3ibzkYuBs0G2eN8JvwTy4V9L4JPI4OOYX6Motfc5gwsrReZSWbItf4xNYx12Vks3eM0VqhJ%2FgEk5xWwsJyD2esl%2F1TLtG4Os4FVDFCHpNUIEoi7fkKGG2JQ6XMXsMN1YhXWUpQwkJtDrLrier%2BLigvdWhRcqntbnGgYSIU%2F7aQHGojRejfUicabTWjVbgqbDBmarvUHobCDSoAFcC1AtKhw16XoQSCVALkck4mWIgng7e%2F1QVwxUfPzvzfxTIbEMH8sOrr00LunG6lSPafGwUsc0WZk8Jxdv24Ub1ogsq8M2xgzIJLHDOqLEyYrFyKFtCRQouSq9QYa9Ew3M6H1AY6pgHsdmiTHacEUWtXdYPm6A7WFw2o9jsmsfHeZdLjHlNRJYZZNl6HlRHPsU7DMSPmp%2Bdq5YBeATVxIgg9VSjK4wzmhx1MNHbXyC12I87v%2B6S%2B32fWGT2J0LaXjd%2FC6DcqvDj9HFMksM7A6Lr9fbEuXsD5FIbZURJalH3w%2BpqHsljcJEyO91lhlyLAnkaDp4l4CaFrkrikFYgKpexdtBK2y%2F7MD1G%2Fuq2P&X-Amz-Signature=0882065b9eab067252b30098529a599f7723c0bec8da30e8f8fb54152d69a0ce&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

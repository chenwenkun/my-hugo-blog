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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4665JUA7SH5%2F20261112%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261112T044941Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQCID4cMhyY5riTWCvHOYpcn3%2F1VKuKiTWYwft0UJg%2BT5AIgBphJZJ8iW%2BQ7DN0HDiDTC2wMM87ibPdZvtMBDGp7qYkq%2FwMIYxAAGgw2Mzc0MjMxODM4MDUiDMbhXz5W2l4%2F31f0bCrcA1WXGqIcs4yt7fxWVyrxoakaL4jI%2FKcLaTGxOKO9VKoqi7wgrEB3lqyeAXWx68NK33RcPYR47iSXUQcqFJuuOvuG0zerDusnY67FsDz%2B6vAWT0DHrtn6J0Du8Foz0kqxYXXi566LxrjCvE1fHMa9WaepvaU5J2rA2NqtwIvnp4Z3%2BhHuFOSlIYqqtSGXLmFc4thlbT9o6m8Np2fYhobPyYxZKWcgR%2BTIjFpxhcvll7sAVk%2BZAmqlheKfvKZqtkZPwNdFB%2FhXNT28gUt%2B7M1cEtUGKn8%2BtWrHz9wHXQXkuoKED0zsg6WUO4oThhHBxedV7EfuipbX5hiBqcasDhJenNC1TLWgMGarNEye7y9AaFU8JVRSjomU4yFMINK0VdtvkgsMXPWjPA11HAd9lYnj%2FnuDI7duDQdptpKcfj7P2Y%2BfKTnqWGZswEQR7aOD4v3iQIxUzt%2ByyBwMi9Jtg9fa8YRfkhYtm0tr6bgc8Y5MIZrJrDiHyf6mOJxUz3u4YbxBYcghqq2mYnpTzqe8%2Bb0EvsqQyJfg1geq5dsW3pqrW5F0g5e5rrETr%2BBrObK0Mm0xprsrElrxwUENjZQmJmhmT19ULVHXF3Nw5eKbQab6GvvTtLrPIHtlHPQcJBiTMKLd1NcGOqUBVh4vCQGEmTtmo0cDsfNqfw%2BHjANnC2ngMFDh5Ze14qgmnTdKbVTD5u2iMmTO354J9idtHZwVWdK4dOeDLDxi8RZCcN9Oj%2FSBfmjoD6%2BpKHUrNwFFhPtLx3QWmInFcLuNDIoN1WZ0HVC1ooAsH9ot1pGxXauimx87at58jf3CH5Ih0K7vYdpYJ1Mdcnh4AKnG3YNiJVB6%2FAv2MtUnnomHZ88mai%2BF&X-Amz-Signature=d9f318623eb90f2c05ca678dfb9ccaf813f82edde512b03af6e426d6097f387e&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4665JUA7SH5%2F20261112%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261112T044941Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQCID4cMhyY5riTWCvHOYpcn3%2F1VKuKiTWYwft0UJg%2BT5AIgBphJZJ8iW%2BQ7DN0HDiDTC2wMM87ibPdZvtMBDGp7qYkq%2FwMIYxAAGgw2Mzc0MjMxODM4MDUiDMbhXz5W2l4%2F31f0bCrcA1WXGqIcs4yt7fxWVyrxoakaL4jI%2FKcLaTGxOKO9VKoqi7wgrEB3lqyeAXWx68NK33RcPYR47iSXUQcqFJuuOvuG0zerDusnY67FsDz%2B6vAWT0DHrtn6J0Du8Foz0kqxYXXi566LxrjCvE1fHMa9WaepvaU5J2rA2NqtwIvnp4Z3%2BhHuFOSlIYqqtSGXLmFc4thlbT9o6m8Np2fYhobPyYxZKWcgR%2BTIjFpxhcvll7sAVk%2BZAmqlheKfvKZqtkZPwNdFB%2FhXNT28gUt%2B7M1cEtUGKn8%2BtWrHz9wHXQXkuoKED0zsg6WUO4oThhHBxedV7EfuipbX5hiBqcasDhJenNC1TLWgMGarNEye7y9AaFU8JVRSjomU4yFMINK0VdtvkgsMXPWjPA11HAd9lYnj%2FnuDI7duDQdptpKcfj7P2Y%2BfKTnqWGZswEQR7aOD4v3iQIxUzt%2ByyBwMi9Jtg9fa8YRfkhYtm0tr6bgc8Y5MIZrJrDiHyf6mOJxUz3u4YbxBYcghqq2mYnpTzqe8%2Bb0EvsqQyJfg1geq5dsW3pqrW5F0g5e5rrETr%2BBrObK0Mm0xprsrElrxwUENjZQmJmhmT19ULVHXF3Nw5eKbQab6GvvTtLrPIHtlHPQcJBiTMKLd1NcGOqUBVh4vCQGEmTtmo0cDsfNqfw%2BHjANnC2ngMFDh5Ze14qgmnTdKbVTD5u2iMmTO354J9idtHZwVWdK4dOeDLDxi8RZCcN9Oj%2FSBfmjoD6%2BpKHUrNwFFhPtLx3QWmInFcLuNDIoN1WZ0HVC1ooAsH9ot1pGxXauimx87at58jf3CH5Ih0K7vYdpYJ1Mdcnh4AKnG3YNiJVB6%2FAv2MtUnnomHZ88mai%2BF&X-Amz-Signature=c062173dd06dec1335e02163123fb18ef11a4324c8733debb486fde66b27d215&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

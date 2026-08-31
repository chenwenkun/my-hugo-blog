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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466TS52NNXK%2F20260831%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260831T120540Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEMv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQDLGl%2BvZ6fBESPgFZBEwIzzZAeIVMXUqUro8honnG309gIgGCEcZW7TWLOrdvwOHeh0NDwc%2BA9wMhR7zXmtn0iPxSQqiAQIlP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDJAw4r1fMPjHQLtWrircA4pLnCYNWS38s0It4mQDpcPX3mSXB3jMIHsc9vCTfhO2JFrWNgjiWTP8OJcVctlmKDxIqVq8euyhFk2KnY%2FLRZJyeuteg5DNTND3eBXIwXLQePSKKxJe%2B%2BxfkIei6pdfzjYNafiUSx1U%2FYp9zI7VXvJFQHJvWaRWx4Dt2jcp2QRaCyWS64teUrBtkhwTVdUYETLzFMeFbU8h99ztYfCYEPCcHWvraic1fgUyiLaNHFPuGcLy6ReswOOcY47kXknfPYUNxZ5CBAuJkELY5ch0mI8SQK7NYKI47363ZHF7bbfH0c5a1vwErA7rt44MYAcKagB0vt9crZ6QZvm2tCQEMGUfNQAtvq8ikAfV9ri0eBJ5Dg0yYFOrlqFAB5DJsfhko80TeRkHpTN%2FlSmbLWqB2coewnyfveWTDgrcwOn205b%2BBlPEcrOnUQBuug%2FRTt9cCBAQA5KAX7%2FrYwUlT1yis9rh%2FYnGeQZtiILd1NRffoQPKIudhLP9cn%2BF%2BBsYWOo14QfDaLOqcAzLDLRf5ZIHT%2BSEs0ZAGNfIN7sMYdZXKB4XvnmH51Cdl%2FJTY3HhB%2FEYmf1xK7W5mGuzyvJxAWd2F8LvsYySHM41zua0ixjt8aShJrIy7JTbONJ5BWP%2BMKq71dQGOqUBFKOb%2FVUFC3wHpPt%2BFCBTktz9bDaInCwvXRI2T06MaJAGe%2FhxU5Zy5R4qE0zWqlfg7iB6J43W3QfrbmqSEmBMlXAHSq3FAxaNAuf6iC1Zzu7Ld4BY2Irupw%2FpS5SbO7%2BXJaPPFSp2V0WmPu92DFVrD48mFF0MPqE7X%2Bb93gXLnhyOvwD1LjBZ%2BfUh6gXFSMf1Wz8tRUhHprIC6Sqr%2BmvxG3k9E7P%2F&X-Amz-Signature=6f8c43cda95e2a858017db7edcbf3405196a7fcbe94a35eef4c8281f29095c29&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466TS52NNXK%2F20260831%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260831T120540Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEMv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQDLGl%2BvZ6fBESPgFZBEwIzzZAeIVMXUqUro8honnG309gIgGCEcZW7TWLOrdvwOHeh0NDwc%2BA9wMhR7zXmtn0iPxSQqiAQIlP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDJAw4r1fMPjHQLtWrircA4pLnCYNWS38s0It4mQDpcPX3mSXB3jMIHsc9vCTfhO2JFrWNgjiWTP8OJcVctlmKDxIqVq8euyhFk2KnY%2FLRZJyeuteg5DNTND3eBXIwXLQePSKKxJe%2B%2BxfkIei6pdfzjYNafiUSx1U%2FYp9zI7VXvJFQHJvWaRWx4Dt2jcp2QRaCyWS64teUrBtkhwTVdUYETLzFMeFbU8h99ztYfCYEPCcHWvraic1fgUyiLaNHFPuGcLy6ReswOOcY47kXknfPYUNxZ5CBAuJkELY5ch0mI8SQK7NYKI47363ZHF7bbfH0c5a1vwErA7rt44MYAcKagB0vt9crZ6QZvm2tCQEMGUfNQAtvq8ikAfV9ri0eBJ5Dg0yYFOrlqFAB5DJsfhko80TeRkHpTN%2FlSmbLWqB2coewnyfveWTDgrcwOn205b%2BBlPEcrOnUQBuug%2FRTt9cCBAQA5KAX7%2FrYwUlT1yis9rh%2FYnGeQZtiILd1NRffoQPKIudhLP9cn%2BF%2BBsYWOo14QfDaLOqcAzLDLRf5ZIHT%2BSEs0ZAGNfIN7sMYdZXKB4XvnmH51Cdl%2FJTY3HhB%2FEYmf1xK7W5mGuzyvJxAWd2F8LvsYySHM41zua0ixjt8aShJrIy7JTbONJ5BWP%2BMKq71dQGOqUBFKOb%2FVUFC3wHpPt%2BFCBTktz9bDaInCwvXRI2T06MaJAGe%2FhxU5Zy5R4qE0zWqlfg7iB6J43W3QfrbmqSEmBMlXAHSq3FAxaNAuf6iC1Zzu7Ld4BY2Irupw%2FpS5SbO7%2BXJaPPFSp2V0WmPu92DFVrD48mFF0MPqE7X%2Bb93gXLnhyOvwD1LjBZ%2BfUh6gXFSMf1Wz8tRUhHprIC6Sqr%2BmvxG3k9E7P%2F&X-Amz-Signature=bf34c8137533648b8265acbfea5da99c78687e30e7489875bb5f9d64d9fd87ad&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB46634C3NBVL%2F20260925%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260925T205052Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjECsaCXVzLXdlc3QtMiJGMEQCID0meVpVxXA0AH%2F1QPhrpUyQ95spLSeXT0KUcD%2BC03XUAiBJfg6Tc02GChUuZDBoJZKFs64o53abqJOnpA%2FBi%2Fm56yqIBAj0%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMFdBRnW3CeAlyrLatKtwD4z38qXUBjS2PTlwAIhtqeSQxbYNm0uQBzBPkbHfoI68B96SPjnaMdN%2Be20U%2BWM0tV2uYAxCC8nPanOcD%2FGn3fOaBvY4c2thzQUF4GQJl3%2BiXfCjPnreovVZR1aIT1%2BdeUDTrSuIex3P9BFMA4VHgna0WvQ41%2FVFrpyAMQ7IgLo9q8c%2Fby8cRzZZ2Kb2hQAX%2BgP0FSoxqBHLEUVC4endA8m9fKFfiXdblFAlVlq89I9bSACC0Emyp8LcWQ4jtguwc%2FMpw1zbo9W%2B1hu6l%2FgZN4mj0R4aUk5bB5juNx1T0HJAb2ULtFN0tDbMe3kRwIScInfhE20GciJ8p2Rpt%2F0nM7k8rSizYQQcous6LlTq%2FPvh0anBvSFOWHkcvDOioZv4HpB21V1SmEAV%2B3%2BiHzhT%2B4zf8PlktE%2Ftn1t%2B5%2FQhpfj8TuEJPt3FAJfstb%2BaIXy%2BNeyLf26w9wmQTBHPjf07qRvm%2B6pS%2BxxyU8gLlUgFYixbo%2B4oZXRlbGTXUBAUHujAEJL1C3XhI%2F8KsaFABgxaMwAUYgszslsrM%2B0XbghpSFBUI0RVUJJfpLmN%2B%2FQrs6Efhfp4BegtCvULgiarIRqdtH9p9N8smDNlSW7HFXzZ%2BOEBlh%2F2r%2FLwWNv3OP7YwvoTb1QY6pgGXMXtbWovBQhd%2FL%2B8nMSgFits%2B7cR5JFWeZ1h%2FN7utPx3dxIbQQ2Shbf2eOT5zaJzOnEYjljc0enVVKdW1dfmBAubg1EEkAbcaGvnJdosoBrG5uJy5zB1n1l%2B2JRcW1Isg9uU6aBJbNP6Btdt3CKnBHONxXu4QKm%2BS6vwdvQPpdyIp35MaVyUw9XTep8JO%2BTJOqMckS%2BtdpYCi4vNCiLk8irgMBGRu&X-Amz-Signature=6eb4457a605278aec0918fd6fc3bd9222832a97879eae29f3fc96a0e07b13a53&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB46634C3NBVL%2F20260925%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260925T205052Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjECsaCXVzLXdlc3QtMiJGMEQCID0meVpVxXA0AH%2F1QPhrpUyQ95spLSeXT0KUcD%2BC03XUAiBJfg6Tc02GChUuZDBoJZKFs64o53abqJOnpA%2FBi%2Fm56yqIBAj0%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMFdBRnW3CeAlyrLatKtwD4z38qXUBjS2PTlwAIhtqeSQxbYNm0uQBzBPkbHfoI68B96SPjnaMdN%2Be20U%2BWM0tV2uYAxCC8nPanOcD%2FGn3fOaBvY4c2thzQUF4GQJl3%2BiXfCjPnreovVZR1aIT1%2BdeUDTrSuIex3P9BFMA4VHgna0WvQ41%2FVFrpyAMQ7IgLo9q8c%2Fby8cRzZZ2Kb2hQAX%2BgP0FSoxqBHLEUVC4endA8m9fKFfiXdblFAlVlq89I9bSACC0Emyp8LcWQ4jtguwc%2FMpw1zbo9W%2B1hu6l%2FgZN4mj0R4aUk5bB5juNx1T0HJAb2ULtFN0tDbMe3kRwIScInfhE20GciJ8p2Rpt%2F0nM7k8rSizYQQcous6LlTq%2FPvh0anBvSFOWHkcvDOioZv4HpB21V1SmEAV%2B3%2BiHzhT%2B4zf8PlktE%2Ftn1t%2B5%2FQhpfj8TuEJPt3FAJfstb%2BaIXy%2BNeyLf26w9wmQTBHPjf07qRvm%2B6pS%2BxxyU8gLlUgFYixbo%2B4oZXRlbGTXUBAUHujAEJL1C3XhI%2F8KsaFABgxaMwAUYgszslsrM%2B0XbghpSFBUI0RVUJJfpLmN%2B%2FQrs6Efhfp4BegtCvULgiarIRqdtH9p9N8smDNlSW7HFXzZ%2BOEBlh%2F2r%2FLwWNv3OP7YwvoTb1QY6pgGXMXtbWovBQhd%2FL%2B8nMSgFits%2B7cR5JFWeZ1h%2FN7utPx3dxIbQQ2Shbf2eOT5zaJzOnEYjljc0enVVKdW1dfmBAubg1EEkAbcaGvnJdosoBrG5uJy5zB1n1l%2B2JRcW1Isg9uU6aBJbNP6Btdt3CKnBHONxXu4QKm%2BS6vwdvQPpdyIp35MaVyUw9XTep8JO%2BTJOqMckS%2BtdpYCi4vNCiLk8irgMBGRu&X-Amz-Signature=148433d265cd01be7d3ef044ac2f7b1d4d09ea6e29ccaff2d74f5363d589fcb7&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

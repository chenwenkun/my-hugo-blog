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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466SPTSGEVU%2F20261028%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261028T025743Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEDEaCXVzLXdlc3QtMiJIMEYCIQCeX0fYXtsyqojf4GdZoo4aPDHtYyG9Zm9smdTcz%2FORMAIhAKjgpb0thHz%2FzaAQNo6glyAaG5aQTw4CWFz6VlX1CWIAKogECPr%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1Igz24ps4yzk7Jwqcexkq3AMOAIXg5GRop32Ld9HrY3O0ZvmMjUj3hQyIDkb8jae%2BRezYqpeke%2FABwC1pwTqGpQfBj6Z66FdEDGNTeeP7ler5074vdp36YN0ngdHyV1tPjofxK24csAl%2FG6nWIoXVjTxr6xlOFyGbcEKYcPzBuPrhsu%2B3lmq%2FZ7urP4Ge5KjGQcUC9%2BX3EzXDmGdJt9lGpTvsRrPYRFrR8892SAilmn4XAttFOZRCYCpXV6PfkVEN7sE7LCrf3s1odc96pxfa0VPSKAbTDzpldq6QW0WUUBR0DHaUmx28GCJVs%2BzSxYYJWhzSVTHhUjCgtU4aDe7mYRJqABVvvBdGaywdaqYc1vQV9TLiXWTe1o9kEm1IHTi6CP9wEnTZRlOF3h7iq6EfrCgEIRwZ%2B3ULczjjzh%2F%2FhWWfz8P883CHpYSVWoDM6%2F9XfO7wKqpJtWG4EDKz%2FcH2LYGlNNusJ%2Bfbmrcu2Lan%2FUSzclP%2BEHPYI2DlcimSNM5YU3OaOhvIHBv1b11eRj0vTHtJ9SnkH9RSL%2BRvTGMO8VHKzct2ykON8RmGUM%2B2H%2Bu7yPqMqwW4MjtRgBOAN%2BR%2FbS1q2n6Eww%2BQGc2qoMLf%2FzL5v%2Fe2xjXuV4lY2ammR70Qu8NDDPAOpwNdu%2BxPMDCnj4XXBjqkAQ6QvfckS%2BpSp3XtbQNFXSJsOZNI%2BCBzdEXlm%2FssgUE89i%2BLyJaez%2Be9KsVzjz9rn7sdmzYZ5Q7EVrfiKQlk3EAO%2FknqCeFhsmbKP605QiCeHpwLtg2PtL9gqNnjl5ut%2BdFH7%2Bu1G568ivQSoMjMv72XuG6PHieIpN2g4xCaDvi1Jxh5BZulVmCO24tq7cVPe02GTo3NxNyB2jJ2P2eLe4diT2Os&X-Amz-Signature=96ee51e8935fde8c24e0454d34b8389e4035b67a4fbfc676850123a695a26cd0&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466SPTSGEVU%2F20261028%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261028T025743Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEDEaCXVzLXdlc3QtMiJIMEYCIQCeX0fYXtsyqojf4GdZoo4aPDHtYyG9Zm9smdTcz%2FORMAIhAKjgpb0thHz%2FzaAQNo6glyAaG5aQTw4CWFz6VlX1CWIAKogECPr%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1Igz24ps4yzk7Jwqcexkq3AMOAIXg5GRop32Ld9HrY3O0ZvmMjUj3hQyIDkb8jae%2BRezYqpeke%2FABwC1pwTqGpQfBj6Z66FdEDGNTeeP7ler5074vdp36YN0ngdHyV1tPjofxK24csAl%2FG6nWIoXVjTxr6xlOFyGbcEKYcPzBuPrhsu%2B3lmq%2FZ7urP4Ge5KjGQcUC9%2BX3EzXDmGdJt9lGpTvsRrPYRFrR8892SAilmn4XAttFOZRCYCpXV6PfkVEN7sE7LCrf3s1odc96pxfa0VPSKAbTDzpldq6QW0WUUBR0DHaUmx28GCJVs%2BzSxYYJWhzSVTHhUjCgtU4aDe7mYRJqABVvvBdGaywdaqYc1vQV9TLiXWTe1o9kEm1IHTi6CP9wEnTZRlOF3h7iq6EfrCgEIRwZ%2B3ULczjjzh%2F%2FhWWfz8P883CHpYSVWoDM6%2F9XfO7wKqpJtWG4EDKz%2FcH2LYGlNNusJ%2Bfbmrcu2Lan%2FUSzclP%2BEHPYI2DlcimSNM5YU3OaOhvIHBv1b11eRj0vTHtJ9SnkH9RSL%2BRvTGMO8VHKzct2ykON8RmGUM%2B2H%2Bu7yPqMqwW4MjtRgBOAN%2BR%2FbS1q2n6Eww%2BQGc2qoMLf%2FzL5v%2Fe2xjXuV4lY2ammR70Qu8NDDPAOpwNdu%2BxPMDCnj4XXBjqkAQ6QvfckS%2BpSp3XtbQNFXSJsOZNI%2BCBzdEXlm%2FssgUE89i%2BLyJaez%2Be9KsVzjz9rn7sdmzYZ5Q7EVrfiKQlk3EAO%2FknqCeFhsmbKP605QiCeHpwLtg2PtL9gqNnjl5ut%2BdFH7%2Bu1G568ivQSoMjMv72XuG6PHieIpN2g4xCaDvi1Jxh5BZulVmCO24tq7cVPe02GTo3NxNyB2jJ2P2eLe4diT2Os&X-Amz-Signature=b86a4a3366cf6a70d32c1d99fefd18d527e6fde75fa2ffca882b989cd0faf4b0&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466X7KBEX6Q%2F20260910%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260910T101309Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjELn%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIHVMHHZX%2Fk26nVp8LAXTEZsawVzRsr%2Bnj%2F685GSXXwYzAiBy2hcDsTD7WgVLvsQWN3FutH7ok4vIrctv8x1Td0yiWiqIBAiC%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIM04sV9%2BdHhLVT0EgmKtwD%2BAWfzzCEBEKUtiMpFMPYKX7EEzo7qPa6asoOIuefYWj9x5ZbBLKCmApGaIbLF37kEXXGi3TWDwnwEOXTNccJJ7xpCC8IZwTO47cp%2B0T2h508GNuEK7tlUHL1c5yU5c%2FLfTr8hRjMp7Fxl7d7lis5s3lW%2BR%2FpMTYIZttWuiSUGochIqZhpj%2BnVODaR45jcAWrWnJwRsfEJvIvlxh%2BdPXPlGwNfu5wLlWC5yPWhay834OyyiMXz6stOwsFG8t3sBXDQ1KDbT7%2FBp242CfvCqwnFUwhkJhVFoo7hwVkmuMPEqPEZQAc30pzFsyd9%2Bo1zHi4gHNVrvNq9%2B%2FP8O%2BMS%2FKW9Gm%2BdgJUxfqqgPxqt%2BqCIsoIi7gei6vPVDnfCmQ7%2BLbYMzS9whtyVXmq0fqhe2PNbk7QLJadFvSl7Dm6YtfV7hK8uKAMoix%2FWSVgEkHXRM2jQhdX%2B1%2BfZmOw23iGizTVFqYIMGWtx%2F8FBrf3aB2xNlkp%2B6sXX95lrLkXq%2FedTaRgO%2FcxBKujWkVAH1nwMueemSnKVfD9Ik9yd5flTJvi0hHriRaXrs27%2BVpsYCgHJ7v3GgDrOEsQOSXr2xhywclOqQvsy8TJap22rkA5O6ZA5KGcrZG8yVDaVLhaDlcwwOGJ1QY6pgGtYa5NfRPhAO7H2OkOAOB7%2BxrEP%2FlFxpT8nk9OZms1PfMZ1lHLepsO8g6a0p6fb1RpceiWl3wSS4QltZc0kkLTF%2BDTrGwEoKIAppKcWkh14bzv45WlP59rXZvNSXYasacOPoltVjKLuWVmNss6R%2B5CIoAKNIQ6s65f2gqnMcfndIugisd2ymY50NpDzKbXGA8s7NbBt5dKoYJFtIHvwCGVzfBTfCFy&X-Amz-Signature=9d79a70f67a07cc7f8f4e35ae7714c577d7f93dbea46018820437e6f5320938f&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466X7KBEX6Q%2F20260910%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260910T101310Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjELn%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIHVMHHZX%2Fk26nVp8LAXTEZsawVzRsr%2Bnj%2F685GSXXwYzAiBy2hcDsTD7WgVLvsQWN3FutH7ok4vIrctv8x1Td0yiWiqIBAiC%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIM04sV9%2BdHhLVT0EgmKtwD%2BAWfzzCEBEKUtiMpFMPYKX7EEzo7qPa6asoOIuefYWj9x5ZbBLKCmApGaIbLF37kEXXGi3TWDwnwEOXTNccJJ7xpCC8IZwTO47cp%2B0T2h508GNuEK7tlUHL1c5yU5c%2FLfTr8hRjMp7Fxl7d7lis5s3lW%2BR%2FpMTYIZttWuiSUGochIqZhpj%2BnVODaR45jcAWrWnJwRsfEJvIvlxh%2BdPXPlGwNfu5wLlWC5yPWhay834OyyiMXz6stOwsFG8t3sBXDQ1KDbT7%2FBp242CfvCqwnFUwhkJhVFoo7hwVkmuMPEqPEZQAc30pzFsyd9%2Bo1zHi4gHNVrvNq9%2B%2FP8O%2BMS%2FKW9Gm%2BdgJUxfqqgPxqt%2BqCIsoIi7gei6vPVDnfCmQ7%2BLbYMzS9whtyVXmq0fqhe2PNbk7QLJadFvSl7Dm6YtfV7hK8uKAMoix%2FWSVgEkHXRM2jQhdX%2B1%2BfZmOw23iGizTVFqYIMGWtx%2F8FBrf3aB2xNlkp%2B6sXX95lrLkXq%2FedTaRgO%2FcxBKujWkVAH1nwMueemSnKVfD9Ik9yd5flTJvi0hHriRaXrs27%2BVpsYCgHJ7v3GgDrOEsQOSXr2xhywclOqQvsy8TJap22rkA5O6ZA5KGcrZG8yVDaVLhaDlcwwOGJ1QY6pgGtYa5NfRPhAO7H2OkOAOB7%2BxrEP%2FlFxpT8nk9OZms1PfMZ1lHLepsO8g6a0p6fb1RpceiWl3wSS4QltZc0kkLTF%2BDTrGwEoKIAppKcWkh14bzv45WlP59rXZvNSXYasacOPoltVjKLuWVmNss6R%2B5CIoAKNIQ6s65f2gqnMcfndIugisd2ymY50NpDzKbXGA8s7NbBt5dKoYJFtIHvwCGVzfBTfCFy&X-Amz-Signature=b20ba7fbd9a5d7b2d7ab83d935073ecbb91b70fcf09d93fa251dde4be476c9c1&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

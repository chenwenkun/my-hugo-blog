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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466VWRXCGJO%2F20261109%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261109T143902Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEF0aCXVzLXdlc3QtMiJIMEYCIQCH3ghrp64PB%2FJ0k4R9%2Bp2EvD5PjOVWhGgXS65CNp55CQIhAKrMBuIQb7a6RgrPEbSZdgjag8OEaR5UCh%2BQoLTadbBaKv8DCCYQABoMNjM3NDIzMTgzODA1IgxdvveMWzX9N5zBU9Uq3AMtmTFrR%2BRJehh%2FahQvB0nQ859zeo7Sug7YvM90gKe0s4X5KnjFr55TSlUmpaprBLDkhla5LZiDSQzD12CJT2VdOaIM%2Fd0eyEu49Dzlgq74%2FXjsrJ%2Fa%2Bmv3VclKBWdFF2pXzIXNbHWgwrLI%2FyXh4GulxG1LN6bwYonI4aP6FunPJLDK%2BSWtRifDPue1S9mwPbTSaaB6KYN6WoDaqCG9D1E8qCxK%2F36Jh5jrASE8de1sfGu5StXKfgIUo3I0AY5Z9Gnk%2F%2F8KipTu3lvIfma4Frr7Afz9OigduJPwcnlEpFDHMxw3X3OPkjSiiM%2FLwLmSB97DWfdKw0v0U%2BmJLuodDQpIHAJZjqS7%2B9mxoKnNveIY%2BtOSUuiO8vkfnZcpd5Jd8OW4KpB9j3jsgOQu6n5WvFh7ig5jPZXaHHuJuat0Isk2stx5Zy2nbazXcVPvWZDHb9CgMWeb6eiKPkmGLlhflu%2BlaQs7dzq%2BXNGPcBNRcQVw7ghSpHzY4gXeQL7ygQMk5epNfWoznAGrK3TlqTX90x5JLHWr%2B08yisW4DAqp9nQVXEDMnS4BIsmb2YlA%2FfUAG7R4L3x6qx%2BSAlNocH%2F1amXSKyzcQZEseTNfKVvljc8dlNjS7PVma55MM1egVDCe%2FMbXBjqkAXhzp5su3ivYokGRLoibYJc%2BEaDXhadOBjmQa8ZKa6Zfd9WsCZA0T%2FVm4lK5b1kJcfXRmCS9M2mtWGPJv9DDytwnDzu3JVX8kZtyDsuBtVUGG%2B%2BWufQj%2BcoferX8BVfOZNExri6jquv0fuDCSQrsuOTpQAdgibQCtbvOJ2libA5C%2Bb%2FOKkfrmt39e2kB04RhIiVDu326DD5MzCNxwfWsp9V1p7kh&X-Amz-Signature=91bc503e9630c2e4bec1c619985b3550e438d036d184a1a4c12100a38590cfac&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466VWRXCGJO%2F20261109%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261109T143902Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEF0aCXVzLXdlc3QtMiJIMEYCIQCH3ghrp64PB%2FJ0k4R9%2Bp2EvD5PjOVWhGgXS65CNp55CQIhAKrMBuIQb7a6RgrPEbSZdgjag8OEaR5UCh%2BQoLTadbBaKv8DCCYQABoMNjM3NDIzMTgzODA1IgxdvveMWzX9N5zBU9Uq3AMtmTFrR%2BRJehh%2FahQvB0nQ859zeo7Sug7YvM90gKe0s4X5KnjFr55TSlUmpaprBLDkhla5LZiDSQzD12CJT2VdOaIM%2Fd0eyEu49Dzlgq74%2FXjsrJ%2Fa%2Bmv3VclKBWdFF2pXzIXNbHWgwrLI%2FyXh4GulxG1LN6bwYonI4aP6FunPJLDK%2BSWtRifDPue1S9mwPbTSaaB6KYN6WoDaqCG9D1E8qCxK%2F36Jh5jrASE8de1sfGu5StXKfgIUo3I0AY5Z9Gnk%2F%2F8KipTu3lvIfma4Frr7Afz9OigduJPwcnlEpFDHMxw3X3OPkjSiiM%2FLwLmSB97DWfdKw0v0U%2BmJLuodDQpIHAJZjqS7%2B9mxoKnNveIY%2BtOSUuiO8vkfnZcpd5Jd8OW4KpB9j3jsgOQu6n5WvFh7ig5jPZXaHHuJuat0Isk2stx5Zy2nbazXcVPvWZDHb9CgMWeb6eiKPkmGLlhflu%2BlaQs7dzq%2BXNGPcBNRcQVw7ghSpHzY4gXeQL7ygQMk5epNfWoznAGrK3TlqTX90x5JLHWr%2B08yisW4DAqp9nQVXEDMnS4BIsmb2YlA%2FfUAG7R4L3x6qx%2BSAlNocH%2F1amXSKyzcQZEseTNfKVvljc8dlNjS7PVma55MM1egVDCe%2FMbXBjqkAXhzp5su3ivYokGRLoibYJc%2BEaDXhadOBjmQa8ZKa6Zfd9WsCZA0T%2FVm4lK5b1kJcfXRmCS9M2mtWGPJv9DDytwnDzu3JVX8kZtyDsuBtVUGG%2B%2BWufQj%2BcoferX8BVfOZNExri6jquv0fuDCSQrsuOTpQAdgibQCtbvOJ2libA5C%2Bb%2FOKkfrmt39e2kB04RhIiVDu326DD5MzCNxwfWsp9V1p7kh&X-Amz-Signature=49394b13748067fbab7289b1f823f3c1257c52a293d0c74efd8e60f9c677f42a&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

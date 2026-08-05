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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4664434VT6O%2F20260805%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260805T012945Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEFEaCXVzLXdlc3QtMiJGMEQCIAQRXYif10vokXCMylrNI1tBDGWLHDIZ4BcI9If%2F%2BxL%2BAiABQe6t5p5%2B5Z9MbnpUxLvQL0VTbIcBPx%2BCBFH163ah8Cr%2FAwgaEAAaDDYzNzQyMzE4MzgwNSIMjcz%2F85ynCboOrgNEKtwDBvWv39vuB9ImwEjz8ek1m2FqQPq7i8nWd7ZnCX28bjS1EYcdw4mqL2gm%2F3K8oYkmoDFsQNJeAtkyUHsRSMB3ePkhBGcAAlcyiPxOMchfG7QZOA1YXDyHvBbqWfbLcj6QHAqX9LR6V57EcOOA61QfEknGHXtPDxrXS4SZb0xvMUW1gLVL0fMIQwwUTFth3Cv29nyVpi0OfZP%2Br9iDIw3y978NrNGP%2B3jnjTmgMxeoqGvjVGHANHPl7ih2hZwJ3wQuux%2F1fpV7bHAGXXdnZagXtei9G3vEqUygAwUlkgYyvYELPbvq1gmDIrYurn5RC94iQG%2FIcNsmaLdnfGEa8QUbZFZq6JvCVs3T5jacPrAMjptkSJRRiPekHScH3LrZLqF7kebuGFnp44GRHTQBjZcoxKuQ0L4yf9kEILo4VUs7yOgtCAhUZ%2B96s7tf0GQ%2FP6eyLva16uDtqk4vXhUOTi1B6UpAIxBDJsNV8Nzbiht9Cng2%2FojRHlft4pTDdknB09R%2FbZ%2FRAIBz6yOcrIPRjD79XhcKMwkPeOQz8Dh27oWfWdvyeV1NXektJmel5xpIqz1mNam0JhGZ%2FvpZ6Lcn%2FEL8ju55MlFDM3bavtoyVddyk%2FiOOQR6VPTUYM8ZUpYw6JTK0wY6pgEe9R0mzuaAL%2BTeTgP27jkiSLPDiGaXGNGJnOlURw8NjunhBl0hDryM4A9CfX4Knbh5cYGlwFqvuHkKTE1V91J%2FgM7bjPpNTedaUO4qLDiOe%2B%2FO63gsynleX8VW7lcwzLbH9Yix%2FOGgAIu1q4HFzLlxj35V%2FyzGaKLUtroBxnQ%2FlcAY6AOhmbyQCYMdJJDTJ3xH4T8HDPimWqn4Oudu3kcWhHQj38Dy&X-Amz-Signature=6e7829c0612e6b5adc3193ddf6a0b595eb86ef6e60c85e2d7f36d9008892277c&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4664434VT6O%2F20260805%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260805T012945Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEFEaCXVzLXdlc3QtMiJGMEQCIAQRXYif10vokXCMylrNI1tBDGWLHDIZ4BcI9If%2F%2BxL%2BAiABQe6t5p5%2B5Z9MbnpUxLvQL0VTbIcBPx%2BCBFH163ah8Cr%2FAwgaEAAaDDYzNzQyMzE4MzgwNSIMjcz%2F85ynCboOrgNEKtwDBvWv39vuB9ImwEjz8ek1m2FqQPq7i8nWd7ZnCX28bjS1EYcdw4mqL2gm%2F3K8oYkmoDFsQNJeAtkyUHsRSMB3ePkhBGcAAlcyiPxOMchfG7QZOA1YXDyHvBbqWfbLcj6QHAqX9LR6V57EcOOA61QfEknGHXtPDxrXS4SZb0xvMUW1gLVL0fMIQwwUTFth3Cv29nyVpi0OfZP%2Br9iDIw3y978NrNGP%2B3jnjTmgMxeoqGvjVGHANHPl7ih2hZwJ3wQuux%2F1fpV7bHAGXXdnZagXtei9G3vEqUygAwUlkgYyvYELPbvq1gmDIrYurn5RC94iQG%2FIcNsmaLdnfGEa8QUbZFZq6JvCVs3T5jacPrAMjptkSJRRiPekHScH3LrZLqF7kebuGFnp44GRHTQBjZcoxKuQ0L4yf9kEILo4VUs7yOgtCAhUZ%2B96s7tf0GQ%2FP6eyLva16uDtqk4vXhUOTi1B6UpAIxBDJsNV8Nzbiht9Cng2%2FojRHlft4pTDdknB09R%2FbZ%2FRAIBz6yOcrIPRjD79XhcKMwkPeOQz8Dh27oWfWdvyeV1NXektJmel5xpIqz1mNam0JhGZ%2FvpZ6Lcn%2FEL8ju55MlFDM3bavtoyVddyk%2FiOOQR6VPTUYM8ZUpYw6JTK0wY6pgEe9R0mzuaAL%2BTeTgP27jkiSLPDiGaXGNGJnOlURw8NjunhBl0hDryM4A9CfX4Knbh5cYGlwFqvuHkKTE1V91J%2FgM7bjPpNTedaUO4qLDiOe%2B%2FO63gsynleX8VW7lcwzLbH9Yix%2FOGgAIu1q4HFzLlxj35V%2FyzGaKLUtroBxnQ%2FlcAY6AOhmbyQCYMdJJDTJ3xH4T8HDPimWqn4Oudu3kcWhHQj38Dy&X-Amz-Signature=1f4691010f9994020bc9a5bb7fcc503a57de4c8b99abe4c0601d2ea2c5fa717a&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

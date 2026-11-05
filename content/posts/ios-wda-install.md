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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466WP4EJYGL%2F20261105%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261105T225955Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEAQaCXVzLXdlc3QtMiJIMEYCIQDFWc%2Fm9UftLbjlZfTn0i9SPppmpp29iI3zqt8UB4ioDAIhAMkzo5s4%2FzE25JG4t7XuRF46uGPPSX2TcIARJd4djLFEKogECM3%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgwZTqiyE8let%2FojZoUq3APsThSESZTIQFSvz28kDAnnBWs9f9%2Bnf1X6UBQXH32gwat%2BjMPK4ZyCBdPnuboSes4KdDYjS06qnrqyOnFRtlFjNLDlQTwZPfln08%2FhMdhwmw%2BciqM%2F2oj1zpwcv48QF5BAOwGtD3%2BzreT3sFX9Nd%2FvZlAMSXtvkNx4F%2BlLe1nQIRq4pCLE5K7ivexTYEc5e2dFFDoQy%2BgAdzDp57TtxAKjhg0uPvAdZOwSiR9k%2B5UyYFpGe3wsrN0XOQJZ5Y7oQd%2FHTZe5QL%2F8tveaXKleZSG0d%2FRI%2BEhiRJvLryulRt7YkI9DP7LaXmERKg9Rod1PAKOmLioQXN%2BjVVDKD5wGg%2BXf%2BlrvpUZIJFyiW5FsjJDsTSle3tVDp0h2S2IZg3sKXH%2F%2BG8E2ORh9kWJbdub5ZW48cmi1EwWFkYFVUmb%2FDrl7%2FT7es8LKhOF%2BqNhjtDNPZX%2FdlqSV7yI6werpNuIxKg9ol6YUjqTiGduSgVQodpjYbC9zMpA4O5Fgk8EaWW3etSIEeEsF54Az8thUOux49I2kmH0nWyC51%2BQVPaWGNdJDf8OopFfaM9JP7czjNoZIQxQY7RAWC2eH6nBYPFFtYkZEOCyXwuAXRwGOMes%2BbKI8yleg10hpng5PRKBg1zC9wLPXBjqkAeRK3JcbKu2GEYBzSgYsDREv%2FVIGR9F74vcP6RNisiWpqz2YU2V%2B4NE07gf5l9FcSXAnqX3wmnda%2B554y2jWplLTd8qZ6Gxa5DEyDFO9MBkRil31mzhlPf9FXV%2F1P66sabxAGdrdUC%2BSBPfR9pHr6T4%2BU5MyIFK5RS4%2F8PWLkpybtZSBMIHwz0DlG%2BnfzvR9nTGZcDif8vDYh%2BaUm9tQVtTrDvSP&X-Amz-Signature=a75e80bfa6542c4fea350495c45446cfbb46562931a1b792f70801651f87edae&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466WP4EJYGL%2F20261105%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261105T225955Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEAQaCXVzLXdlc3QtMiJIMEYCIQDFWc%2Fm9UftLbjlZfTn0i9SPppmpp29iI3zqt8UB4ioDAIhAMkzo5s4%2FzE25JG4t7XuRF46uGPPSX2TcIARJd4djLFEKogECM3%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgwZTqiyE8let%2FojZoUq3APsThSESZTIQFSvz28kDAnnBWs9f9%2Bnf1X6UBQXH32gwat%2BjMPK4ZyCBdPnuboSes4KdDYjS06qnrqyOnFRtlFjNLDlQTwZPfln08%2FhMdhwmw%2BciqM%2F2oj1zpwcv48QF5BAOwGtD3%2BzreT3sFX9Nd%2FvZlAMSXtvkNx4F%2BlLe1nQIRq4pCLE5K7ivexTYEc5e2dFFDoQy%2BgAdzDp57TtxAKjhg0uPvAdZOwSiR9k%2B5UyYFpGe3wsrN0XOQJZ5Y7oQd%2FHTZe5QL%2F8tveaXKleZSG0d%2FRI%2BEhiRJvLryulRt7YkI9DP7LaXmERKg9Rod1PAKOmLioQXN%2BjVVDKD5wGg%2BXf%2BlrvpUZIJFyiW5FsjJDsTSle3tVDp0h2S2IZg3sKXH%2F%2BG8E2ORh9kWJbdub5ZW48cmi1EwWFkYFVUmb%2FDrl7%2FT7es8LKhOF%2BqNhjtDNPZX%2FdlqSV7yI6werpNuIxKg9ol6YUjqTiGduSgVQodpjYbC9zMpA4O5Fgk8EaWW3etSIEeEsF54Az8thUOux49I2kmH0nWyC51%2BQVPaWGNdJDf8OopFfaM9JP7czjNoZIQxQY7RAWC2eH6nBYPFFtYkZEOCyXwuAXRwGOMes%2BbKI8yleg10hpng5PRKBg1zC9wLPXBjqkAeRK3JcbKu2GEYBzSgYsDREv%2FVIGR9F74vcP6RNisiWpqz2YU2V%2B4NE07gf5l9FcSXAnqX3wmnda%2B554y2jWplLTd8qZ6Gxa5DEyDFO9MBkRil31mzhlPf9FXV%2F1P66sabxAGdrdUC%2BSBPfR9pHr6T4%2BU5MyIFK5RS4%2F8PWLkpybtZSBMIHwz0DlG%2BnfzvR9nTGZcDif8vDYh%2BaUm9tQVtTrDvSP&X-Amz-Signature=29db171c2e57c98f84e28dcd10da4927622ecd3c5b5c5eb60a1d517d10f9ce34&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

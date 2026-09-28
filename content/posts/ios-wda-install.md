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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663DDO2BDR%2F20260928%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260928T224351Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEHIaCXVzLXdlc3QtMiJHMEUCIQDfS9XuZAWALha2iNUpDMsX7Ony33B%2BEVR1sMtsANm3GgIgH0Vo8wFIvvi%2BbRZt5t8LEdcTY1uw6%2BQ7fTKE5vYlldIq%2FwMIOxAAGgw2Mzc0MjMxODM4MDUiDFECkk6Ta0QRKLRZISrcA3nYAcCHA5kmoc9nrl5PcSo%2FToIo%2FTlIbzaAlSswhB2G6zsnshwpMpwX43Vo1al0cJRARm2cB2Dy2B4SwtztZXso9PW4Vrv4hYxHTsQusazFrVGdx0%2BRzUC%2F2JGSNsBc31n8K2IYFYp6IdDCBpytxakKJ7f7YGxdcMkjIiaWCP7Ns5z37qcw%2B8xe5gCyGUPXxsZ3eYY9LjmkL1PJsfsgKMgfEyQW7YIj%2BtOcZyHdEviLU1YdgTRuOpBAMHgi%2FYi5thCfKY%2FIowxlPoLvXm%2FgSM9uKIGQo2hm%2Fla87%2BmEgISv8j7Oa1zXoXDPPRoSms7sYs7loxturbyheqcXXMSzT3rIizAj%2BJmXlRnRN80cR3Q2rNrnCdAvimkFnaFOvg4gneihfRtpdyeiSNrC2nhicikKpbNdt6kWpol80KnfKZ2%2B88nfxBRzBhkRKl25M%2BV3AA2oiT%2BOT1tv%2FnHQwkUkHE9JBlKEPIDpxlOYnAwSp0eze%2Bls0sRsnx%2FJWI%2BU93TWQQ4W%2BKaP1%2FAPc%2F47N1cKFJSLak6%2B8xcZzwL1L6i5wuVGvkjrchDykIrMMhlUm3D%2FKSdQLb8yn4WJrConDd4LZBIHPFj0Ztgop4S%2BU%2FCav9cNVWylyh3xaScsMaihMLnW6tUGOqUBO1sLNiRNKJ2o8AFvOzSSrREpY0GccIOq2SCKOWiqVDzrswzXrpCsHQj7Y5hXqbKZIOzkARRmuLIGFaBCTAVweg77PgAPvKRE%2Bj1MTf8hn%2B2NwzpDGeEvRwruBpxAZVXSGCHlXDhRBOscT1jyClQeDH%2BIK95gf1kMDrrkIHdvf%2Bb9kbs16Znf0qjc43vM%2BemZUa6AtOLXTkDzqMrJLf78exJ2OLlo&X-Amz-Signature=d2ad28b89135bdb85fdfb5d568879718891e85621dfecfe0ba657dc724a8b81c&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663DDO2BDR%2F20260928%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260928T224351Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEHIaCXVzLXdlc3QtMiJHMEUCIQDfS9XuZAWALha2iNUpDMsX7Ony33B%2BEVR1sMtsANm3GgIgH0Vo8wFIvvi%2BbRZt5t8LEdcTY1uw6%2BQ7fTKE5vYlldIq%2FwMIOxAAGgw2Mzc0MjMxODM4MDUiDFECkk6Ta0QRKLRZISrcA3nYAcCHA5kmoc9nrl5PcSo%2FToIo%2FTlIbzaAlSswhB2G6zsnshwpMpwX43Vo1al0cJRARm2cB2Dy2B4SwtztZXso9PW4Vrv4hYxHTsQusazFrVGdx0%2BRzUC%2F2JGSNsBc31n8K2IYFYp6IdDCBpytxakKJ7f7YGxdcMkjIiaWCP7Ns5z37qcw%2B8xe5gCyGUPXxsZ3eYY9LjmkL1PJsfsgKMgfEyQW7YIj%2BtOcZyHdEviLU1YdgTRuOpBAMHgi%2FYi5thCfKY%2FIowxlPoLvXm%2FgSM9uKIGQo2hm%2Fla87%2BmEgISv8j7Oa1zXoXDPPRoSms7sYs7loxturbyheqcXXMSzT3rIizAj%2BJmXlRnRN80cR3Q2rNrnCdAvimkFnaFOvg4gneihfRtpdyeiSNrC2nhicikKpbNdt6kWpol80KnfKZ2%2B88nfxBRzBhkRKl25M%2BV3AA2oiT%2BOT1tv%2FnHQwkUkHE9JBlKEPIDpxlOYnAwSp0eze%2Bls0sRsnx%2FJWI%2BU93TWQQ4W%2BKaP1%2FAPc%2F47N1cKFJSLak6%2B8xcZzwL1L6i5wuVGvkjrchDykIrMMhlUm3D%2FKSdQLb8yn4WJrConDd4LZBIHPFj0Ztgop4S%2BU%2FCav9cNVWylyh3xaScsMaihMLnW6tUGOqUBO1sLNiRNKJ2o8AFvOzSSrREpY0GccIOq2SCKOWiqVDzrswzXrpCsHQj7Y5hXqbKZIOzkARRmuLIGFaBCTAVweg77PgAPvKRE%2Bj1MTf8hn%2B2NwzpDGeEvRwruBpxAZVXSGCHlXDhRBOscT1jyClQeDH%2BIK95gf1kMDrrkIHdvf%2Bb9kbs16Znf0qjc43vM%2BemZUa6AtOLXTkDzqMrJLf78exJ2OLlo&X-Amz-Signature=a59ed281e2ae88277561c823dd69c6f572dd545d90e61681afc1221dd0b4f77b&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

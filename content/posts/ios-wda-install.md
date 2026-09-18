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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4666TYKM73U%2F20260918%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260918T152422Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEH4aCXVzLXdlc3QtMiJHMEUCIGTi0DtGgIE3ZkjnbVDxpLzCIe%2FOOxILG1dYzxb1WViiAiEAqFYI2tdVZISo2kHC7TEv4ZHfBJXBzPzAb2YtrPTDw5cq%2FwMIRxAAGgw2Mzc0MjMxODM4MDUiDDiot8Sfxd6IUftGiyrcA0uhvgJLg80D79b8x5Ry%2B6hzNbaWW4%2BEdIgwai7RwfHLvl7FzPGGCsBHh5H2j2dzhpDkmzE45ShhrzJ3NJhDraOSTM1J6No%2FT9aBTGE%2FExbF32zm3OVW91wS%2BEWWNiJIIjcgXP2N850LYTojasECrPmX8yNIOctWKm%2FcTg83%2BV0N4g4VV3Xo4izxY%2FWL9IeQTxXvwIS1BKpkpGzcji6uNbkInnN2KeAa2tIuBzUYM%2Bjes%2BmH9OQEnnsSAuB3q9b7maxgkMMO%2B7qkbI7M9drEgE48ROoNBh2C5xeRzYZyhDbaFHXpTurYo6uW9DjDfimg%2Fx%2BL2ciSmGyVJ8SpKtH6pArbERt5I%2F0d1DA7x5%2By7H9w%2FZ6tk4FkZ8qx%2BKqN3zMsAObrKpqS36sZ1pEygUqggZ4IO8V9UEz9Mho%2BJtIfxL%2BkBTlZYccBzDRDr0NKmRT5Bd5SWXwdAIfx0vChGjV2kzXfc8TssGdGGn8vyAXBkMrN6PQO%2BajUWOhoe1jNstMtxfBL%2FwJH8nSdTbh9PwiyPSxtDmlp9%2B037TebCsxZdA6LF%2Fr2Wof%2FC0jGeH5v7sv5QxK8PuRn165Cy1WIKo7r4dl0J%2BJqR1SiTwK1UVCeli%2BYqbujAU%2FWZPG5r4rRMIWFtdUGOqUBTY9WGM0CS8a7NKZjaJXTDC6WK%2FCAtsIMknCPKyTLWhBSCE%2B5Uuv3UFSLe2v0yZeEV9ZIQaMOQ0LUxov2QQZaDLWrDqebXrgwzNdIf64FJ5R4jcEkOcB63xuC%2BnVving8zZ4OkzexYOS8BkcwmeJ%2BZq9aBtMZmYdoljNjBdrenESLmlFB8RVb7pC6ih2wHpirKsyvoddPjZAI7O8hVIfFokjfBUbO&X-Amz-Signature=5b44979a4ff3c7a4899733c291c9f2f40aca4fb282aea65241f7212760d2dc97&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4666TYKM73U%2F20260918%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260918T152422Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEH4aCXVzLXdlc3QtMiJHMEUCIGTi0DtGgIE3ZkjnbVDxpLzCIe%2FOOxILG1dYzxb1WViiAiEAqFYI2tdVZISo2kHC7TEv4ZHfBJXBzPzAb2YtrPTDw5cq%2FwMIRxAAGgw2Mzc0MjMxODM4MDUiDDiot8Sfxd6IUftGiyrcA0uhvgJLg80D79b8x5Ry%2B6hzNbaWW4%2BEdIgwai7RwfHLvl7FzPGGCsBHh5H2j2dzhpDkmzE45ShhrzJ3NJhDraOSTM1J6No%2FT9aBTGE%2FExbF32zm3OVW91wS%2BEWWNiJIIjcgXP2N850LYTojasECrPmX8yNIOctWKm%2FcTg83%2BV0N4g4VV3Xo4izxY%2FWL9IeQTxXvwIS1BKpkpGzcji6uNbkInnN2KeAa2tIuBzUYM%2Bjes%2BmH9OQEnnsSAuB3q9b7maxgkMMO%2B7qkbI7M9drEgE48ROoNBh2C5xeRzYZyhDbaFHXpTurYo6uW9DjDfimg%2Fx%2BL2ciSmGyVJ8SpKtH6pArbERt5I%2F0d1DA7x5%2By7H9w%2FZ6tk4FkZ8qx%2BKqN3zMsAObrKpqS36sZ1pEygUqggZ4IO8V9UEz9Mho%2BJtIfxL%2BkBTlZYccBzDRDr0NKmRT5Bd5SWXwdAIfx0vChGjV2kzXfc8TssGdGGn8vyAXBkMrN6PQO%2BajUWOhoe1jNstMtxfBL%2FwJH8nSdTbh9PwiyPSxtDmlp9%2B037TebCsxZdA6LF%2Fr2Wof%2FC0jGeH5v7sv5QxK8PuRn165Cy1WIKo7r4dl0J%2BJqR1SiTwK1UVCeli%2BYqbujAU%2FWZPG5r4rRMIWFtdUGOqUBTY9WGM0CS8a7NKZjaJXTDC6WK%2FCAtsIMknCPKyTLWhBSCE%2B5Uuv3UFSLe2v0yZeEV9ZIQaMOQ0LUxov2QQZaDLWrDqebXrgwzNdIf64FJ5R4jcEkOcB63xuC%2BnVving8zZ4OkzexYOS8BkcwmeJ%2BZq9aBtMZmYdoljNjBdrenESLmlFB8RVb7pC6ih2wHpirKsyvoddPjZAI7O8hVIfFokjfBUbO&X-Amz-Signature=3eac269cda7976fd086ef0b0dcb2987d57d9236ffd1a04e2c2e4920236bf2b86&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

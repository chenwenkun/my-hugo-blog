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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4667ZPDTJFV%2F20260820%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260820T003627Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjELf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQCInVjtZUF8A2F7wdMLoYrq9YmxE%2BvXtzyf9v893XaVqQIgZ0P2y%2Bc2fmCo0BvJJZ482tziuOvdphN5GDX9lCt2ucQqiAQIgP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDFDuwiXsBjLeAPaFEircA4V%2BnSw5IIK5b1x0Vzw3KjyI5MzlXrlWU99LgCoMhH7p7%2FnGELQcOldPMvLfLKerXdQS76kbyMvowYrTweCp%2FNiY%2BSE6gHQac%2BEY5Wr1hs9M1Livu5jKfiIhV3bWyNC5g2T13sce4S%2FWrC9ozWT7UdXGqq7u6V7Uab5413F5oMMHuU5aulj6moyhm8zRk%2FyPP9aXhYLXVSg4B4beVeQmkqxubt5nWoW1Vx6XRAX9wGlEyK3QiOsHF00nyEX1hapO2lJjUb611jHxs3Ter02t%2FeagJ5aby9AT2vcjrqvOpe2kLVV43bIP4OhKhKOVtvnl4HlsHDx%2FP3zH2f461jtEaGL351C6P%2FuNCOGYF7FOoJQp4n%2FwupRJUIPb4mCG%2BC3%2BVV7mYhbhXv%2FLmcsiU%2B4BEIGGGF9cPJYKwUMK7WyJtrlmz7PzYIhVOlz7LxMQ0SOt4H4Om0om8RAuq%2F%2BsCngLaP24bH0fxBsOjpw1tNnMmVPDIbG6ifWkgUxJyYj6%2B3eaVh1cLWJdArPVvYUtgXzrRBBQNSGxyvZ6VBuZUIoLpQDBX4itpmt6GGnE6SHr2ofnMXtF7tw81HU7UV%2FeaA6bn7ECm2lk8LD%2BearObyEYm8Lh%2FyUE0o5XRpInIxFYMLzrmNQGOqUB8TwJ6WmuKR5WA%2FjJAQECK70fziSntGLJGFaOmAuyGRfC%2B7ks4399RQf1vzlOHXQl7ODxOn1rcXXmpwPJn1Ps6cE%2FbYnb%2FnlDyyzQ3wu3fvalcHB6zY66f1EX62X8kUj1uN2dZUEd%2FhGTeECzwR9f%2BIpBDdnq%2BvHsyNHUJTh5BOxIjjeAfWwlNzN%2B8uxAYEZ90idkuoOOYFNCq5GqpI%2BikFEFCN58&X-Amz-Signature=6af3319f320387ea5236591f8cd8cc10cca5598a5dcfdc75748ef91f427a29c8&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4667ZPDTJFV%2F20260820%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260820T003627Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjELf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQCInVjtZUF8A2F7wdMLoYrq9YmxE%2BvXtzyf9v893XaVqQIgZ0P2y%2Bc2fmCo0BvJJZ482tziuOvdphN5GDX9lCt2ucQqiAQIgP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDFDuwiXsBjLeAPaFEircA4V%2BnSw5IIK5b1x0Vzw3KjyI5MzlXrlWU99LgCoMhH7p7%2FnGELQcOldPMvLfLKerXdQS76kbyMvowYrTweCp%2FNiY%2BSE6gHQac%2BEY5Wr1hs9M1Livu5jKfiIhV3bWyNC5g2T13sce4S%2FWrC9ozWT7UdXGqq7u6V7Uab5413F5oMMHuU5aulj6moyhm8zRk%2FyPP9aXhYLXVSg4B4beVeQmkqxubt5nWoW1Vx6XRAX9wGlEyK3QiOsHF00nyEX1hapO2lJjUb611jHxs3Ter02t%2FeagJ5aby9AT2vcjrqvOpe2kLVV43bIP4OhKhKOVtvnl4HlsHDx%2FP3zH2f461jtEaGL351C6P%2FuNCOGYF7FOoJQp4n%2FwupRJUIPb4mCG%2BC3%2BVV7mYhbhXv%2FLmcsiU%2B4BEIGGGF9cPJYKwUMK7WyJtrlmz7PzYIhVOlz7LxMQ0SOt4H4Om0om8RAuq%2F%2BsCngLaP24bH0fxBsOjpw1tNnMmVPDIbG6ifWkgUxJyYj6%2B3eaVh1cLWJdArPVvYUtgXzrRBBQNSGxyvZ6VBuZUIoLpQDBX4itpmt6GGnE6SHr2ofnMXtF7tw81HU7UV%2FeaA6bn7ECm2lk8LD%2BearObyEYm8Lh%2FyUE0o5XRpInIxFYMLzrmNQGOqUB8TwJ6WmuKR5WA%2FjJAQECK70fziSntGLJGFaOmAuyGRfC%2B7ks4399RQf1vzlOHXQl7ODxOn1rcXXmpwPJn1Ps6cE%2FbYnb%2FnlDyyzQ3wu3fvalcHB6zY66f1EX62X8kUj1uN2dZUEd%2FhGTeECzwR9f%2BIpBDdnq%2BvHsyNHUJTh5BOxIjjeAfWwlNzN%2B8uxAYEZ90idkuoOOYFNCq5GqpI%2BikFEFCN58&X-Amz-Signature=12b9a6ead5b512277f788bd60ff329bc2349db77bbbf510102c36ee6a2c86dd6&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

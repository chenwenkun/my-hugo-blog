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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4664VIOF5S6%2F20261114%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261114T214711Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEN7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCICt%2BHasYtsoYnppTKu0vjDBCLndd9KJoAfLevEd13bm2AiAOcNjX8TKC2zfVLoWFxrwsyANfwrs0J36vybojhHakzyqIBAim%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMuqsh8I4IfdJAFFrXKtwDhJk5aJFU7sqLvG0Lyx95%2BiWxG9EoZjHLntMNKZY1O39oSrff3cKuJiKB93BPbzDj9YtU5SRmgvWMAdySwba3rPWdlSvTG3lSQrc0PWByrBA0mcxSV1cuUntK%2FjY%2BG3Eg8TUUwArajFIjARO0FiKiXzYs7pqB0i2jKKmssLaslVX19cS6466cFsQlDfS6duaO3DlPAhstsG3C450VRS4zcEEGmFLEaoywTUPyGxv5lNc3UQQh9FidMp76I0L0VAngd6Tm%2FTd23GuvcWdPlFsQoM5m2qYwW9yMtBcVMfE%2FI3GnpYOHAMzuPK6T6phwz9v6a3tjPgYbZn7h%2FXmi5o%2FcZN2DHSa0jahnA4ywFOERca56QTANAgmZKepOxDo3LTHQLuklKxDyRVvHn3NmZofItB0AYZWyDcqikTd2lZ8jSuO0mKTHLGeTbc4TSzfsIOYyOh2dzOi40Z4ft%2BnfHbUEVk4Ja74X25zeb3ujPIzUiNmjhWY9K86Om1U%2FBUjFNlX1Sr07zMr4Z2Xyo3oa%2FBJ4QlzIXJZTi6aZorNci6Zjmt%2BgVgvvb6p%2FhffNilVvP0itZbBQhw5nFY4p7uZiAhXlEiJlVevOwRbGtBneWzPfwa%2Buz1mLCs7WPTk3OU0w9aDj1wY6pgHNn7uPQg1XGqpdiXe61YpGhAn5RBcxaQYuPn3nwxel3iKLGqW7O6jVj8w0k7x3VQmOWeyW4C9lK9J5iscBl8Q7V62ik9gYlkA8tk7Ms2Fc9ssWA04prKhCipBCU6jTr5KGlrrDf9d5z3BPIQtINoxZbrPm%2BRQT3fBJ2eYTuHFIlTrzMbfTGQLV2LdjsVZRDmHyJkyx3bOCVRN5cgjDmwjEmS8SOmaK&X-Amz-Signature=7cf8deb5d93ac97931990e2bb33d763e609a82f75b5ed3718caa6d2cb4aac581&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4664VIOF5S6%2F20261114%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261114T214711Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEN7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCICt%2BHasYtsoYnppTKu0vjDBCLndd9KJoAfLevEd13bm2AiAOcNjX8TKC2zfVLoWFxrwsyANfwrs0J36vybojhHakzyqIBAim%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMuqsh8I4IfdJAFFrXKtwDhJk5aJFU7sqLvG0Lyx95%2BiWxG9EoZjHLntMNKZY1O39oSrff3cKuJiKB93BPbzDj9YtU5SRmgvWMAdySwba3rPWdlSvTG3lSQrc0PWByrBA0mcxSV1cuUntK%2FjY%2BG3Eg8TUUwArajFIjARO0FiKiXzYs7pqB0i2jKKmssLaslVX19cS6466cFsQlDfS6duaO3DlPAhstsG3C450VRS4zcEEGmFLEaoywTUPyGxv5lNc3UQQh9FidMp76I0L0VAngd6Tm%2FTd23GuvcWdPlFsQoM5m2qYwW9yMtBcVMfE%2FI3GnpYOHAMzuPK6T6phwz9v6a3tjPgYbZn7h%2FXmi5o%2FcZN2DHSa0jahnA4ywFOERca56QTANAgmZKepOxDo3LTHQLuklKxDyRVvHn3NmZofItB0AYZWyDcqikTd2lZ8jSuO0mKTHLGeTbc4TSzfsIOYyOh2dzOi40Z4ft%2BnfHbUEVk4Ja74X25zeb3ujPIzUiNmjhWY9K86Om1U%2FBUjFNlX1Sr07zMr4Z2Xyo3oa%2FBJ4QlzIXJZTi6aZorNci6Zjmt%2BgVgvvb6p%2FhffNilVvP0itZbBQhw5nFY4p7uZiAhXlEiJlVevOwRbGtBneWzPfwa%2Buz1mLCs7WPTk3OU0w9aDj1wY6pgHNn7uPQg1XGqpdiXe61YpGhAn5RBcxaQYuPn3nwxel3iKLGqW7O6jVj8w0k7x3VQmOWeyW4C9lK9J5iscBl8Q7V62ik9gYlkA8tk7Ms2Fc9ssWA04prKhCipBCU6jTr5KGlrrDf9d5z3BPIQtINoxZbrPm%2BRQT3fBJ2eYTuHFIlTrzMbfTGQLV2LdjsVZRDmHyJkyx3bOCVRN5cgjDmwjEmS8SOmaK&X-Amz-Signature=64a95c1a9a411bf5b252bc773e1e58ab485ae6e818b1512d51d9a9e29e425a33&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

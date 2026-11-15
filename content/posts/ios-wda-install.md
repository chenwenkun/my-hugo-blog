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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4666A7HGTPH%2F20261115%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261115T034322Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEOP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIC3loFrd2sTuvbv1UzEWtuXSiZ%2FxZZkOzsZXRGrbTQKvAiBi3wKtPHq0cZ0wyKbcsBl0Tn6A8xRv1mup%2Bn%2F5QpWrsCqIBAis%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMyVbtKGQwgDMbI96QKtwDbFuGLAcVEcRbPr8GAGjYX9S4wWDu9hfS55Q2dZABQmiIWiHmEashszx8yOv5gmwYcRsIjD7h%2FW1s%2B5N3yS4LG3a%2FqZ2o%2Bi7ueG4AzUQ1ftHBAg9Io46O0U6nfclcE%2BXbRH0C%2Fny4CUzenPv6Wa0kAv3jwC54Bq6InfXERdW8B71gItT3j%2FRyrXjqr6%2B9sHJrk4g2fBrWjHB9PyaD%2FOOdSmSDHZz759CBpJlPEF%2FgmhKZ3jh9OCV0Yb5sCEqGbbKz0r9B4olIxStT2tBTh10AkIpEx3Oyek3mW%2BxZSH47aiJpbjcG6ESjFDnyqkJSo7qv5ngQ1YcyMIkvRCEaM1orOMfTUz5mdJCTMgE%2FxsIBifakfROhbv8VPbWK95UqSIaTSFebRc6y4oUozwMgFFCI%2B9Yu0MIfpoVK3Z%2FwOFPQQmH7y87YWedU3kW7y%2BKW%2Bij0%2BCZS4ibUj6PEn4pvGye82uKfBr8T8twWzPumm0ikCSq5iZluMuv64Ncvs2WbKIi6r70dFPWehMrZXnXJKrpxW3q3oV9MD2o55RYoDTsBnczwHcGXf2jGI%2BILIG6VMhFufEzWcjdCiuYByjk%2BizKLBLoo7mZeacoiLjTKiMgndGFqpRDEqIes7JoDbVswscfk1wY6pgHBfVWuxiz4EGUkzt25qcoN8021w6b9aWogw0WzZBGXxjANTZB%2F21L3L3RCAzeR5KmXzfZSScWatu2pg8tk8zl3pW5pbFHn9WnPaniLQzKY6yAHySL1doVPWBfuKkVO30nfpYBdAsTQ5sVebIhvEmV2nE219%2BWwAQxyHJHQTuBX5SC70RPyGJKF8mnzxw8SDgcvXtrAf5YfdMB%2FFdftVG2pgIPK1JML&X-Amz-Signature=df691b8324d116df1aeb1316166b7ed1e3bb1cc1e7161cadb08391aed90f1e1e&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4666A7HGTPH%2F20261115%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261115T034323Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEOP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIC3loFrd2sTuvbv1UzEWtuXSiZ%2FxZZkOzsZXRGrbTQKvAiBi3wKtPHq0cZ0wyKbcsBl0Tn6A8xRv1mup%2Bn%2F5QpWrsCqIBAis%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMyVbtKGQwgDMbI96QKtwDbFuGLAcVEcRbPr8GAGjYX9S4wWDu9hfS55Q2dZABQmiIWiHmEashszx8yOv5gmwYcRsIjD7h%2FW1s%2B5N3yS4LG3a%2FqZ2o%2Bi7ueG4AzUQ1ftHBAg9Io46O0U6nfclcE%2BXbRH0C%2Fny4CUzenPv6Wa0kAv3jwC54Bq6InfXERdW8B71gItT3j%2FRyrXjqr6%2B9sHJrk4g2fBrWjHB9PyaD%2FOOdSmSDHZz759CBpJlPEF%2FgmhKZ3jh9OCV0Yb5sCEqGbbKz0r9B4olIxStT2tBTh10AkIpEx3Oyek3mW%2BxZSH47aiJpbjcG6ESjFDnyqkJSo7qv5ngQ1YcyMIkvRCEaM1orOMfTUz5mdJCTMgE%2FxsIBifakfROhbv8VPbWK95UqSIaTSFebRc6y4oUozwMgFFCI%2B9Yu0MIfpoVK3Z%2FwOFPQQmH7y87YWedU3kW7y%2BKW%2Bij0%2BCZS4ibUj6PEn4pvGye82uKfBr8T8twWzPumm0ikCSq5iZluMuv64Ncvs2WbKIi6r70dFPWehMrZXnXJKrpxW3q3oV9MD2o55RYoDTsBnczwHcGXf2jGI%2BILIG6VMhFufEzWcjdCiuYByjk%2BizKLBLoo7mZeacoiLjTKiMgndGFqpRDEqIes7JoDbVswscfk1wY6pgHBfVWuxiz4EGUkzt25qcoN8021w6b9aWogw0WzZBGXxjANTZB%2F21L3L3RCAzeR5KmXzfZSScWatu2pg8tk8zl3pW5pbFHn9WnPaniLQzKY6yAHySL1doVPWBfuKkVO30nfpYBdAsTQ5sVebIhvEmV2nE219%2BWwAQxyHJHQTuBX5SC70RPyGJKF8mnzxw8SDgcvXtrAf5YfdMB%2FFdftVG2pgIPK1JML&X-Amz-Signature=09d0a19211d452403a499416bea49f33b87689dc0874a844ac19f546a9ab70a5&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

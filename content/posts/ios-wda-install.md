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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466RUBMWDVG%2F20261125%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261125T162437Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEN%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIEbpieD0KNRxuomlazaWRI1RYF%2BCVImhXleo9itRRBQ%2FAiBMd8TX0mzyj%2BQDXQ0T0FutuGHXruSx5AxVcPOg3HfLvCqIBAin%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMDv9O5wlzQOu4YErsKtwD6pbBwvDYpcNDvWlNuTvkcwticaYdpV7EP5Cmb37kiUa1gU0eJtOYwQu3CtlcrzjPCGDPfYlvBRRL0kzvoXnI7c4U0EdBu1%2FlcC3f7iUXLjBoRolsmDA0xvvTywHJ2c9KOiaFiWhIO0mf6zcIgaUcDwuhGEjFtWhRbZxg077S38ARzGCBXlTyvRYg0%2F8OCvfldF%2BhYa57YzLA8Rjm2GLqlB3jNmviqm0JtcdLooC%2FEdA8FGfaLz8m2dTYmu8sW32ABFcnJ6sPfPm43Z%2FwIt9a8NgXflrxzYHYX6U7O4WEbYsfvrk9P8gDutgXa1WF%2BnloWZw%2FS9NkkMiuvzVatOpYr1X1hJ5QjO%2FVQRCh2914bIEQ0dfdH%2B8EQm%2BPJfVXxmzmAzyJ98DGwXMhZ75ro8xy%2Fuvn2GSQu1sT4zySeEKanPoCdNf%2FU46UIPfy%2BVOwpWxJ2Fs3LbkJ8oi2dko3sNfD20FrGm2krSDc0VWDu7piDsbKKDsE6LYBttbZRmFDzBSTX4ZlgLz7EJADNnNaOgDV1p8prEY9jJxQd6YrJMo9QBeyNg%2BAEFQehtK6ZWSssdZoiH3KM7659e98oMg2mMmi7NHzdicUxri2qZvQlUEc09hOKM8UlftiYFndmQAwqfOb2AY6pgFb1CnOfmP1RBYu2nRtX9DqbB2DNQ1WmorB5jtuXnIAZHRXbyDH3%2Ft4OBlyhRn9fdUoFvESICfDkT0o7MiENhjeEXwXl3wagfWBTxcVLLhyGFz7nfg4YCK4h86m%2FCAjE1hSSyHiB79%2Be7EHucqidCKowcTxS%2BimBUq9r61GS5613YqyMNpWtEYLWEAa52Q%2BNfGhADn%2FWxCJtq5qMnjCI7mA0IPLYBHU&X-Amz-Signature=0cc54a6601337411e2c1175b051f40279b1f54043f740e0b8107b1f068311004&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466RUBMWDVG%2F20261125%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261125T162437Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEN%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIEbpieD0KNRxuomlazaWRI1RYF%2BCVImhXleo9itRRBQ%2FAiBMd8TX0mzyj%2BQDXQ0T0FutuGHXruSx5AxVcPOg3HfLvCqIBAin%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMDv9O5wlzQOu4YErsKtwD6pbBwvDYpcNDvWlNuTvkcwticaYdpV7EP5Cmb37kiUa1gU0eJtOYwQu3CtlcrzjPCGDPfYlvBRRL0kzvoXnI7c4U0EdBu1%2FlcC3f7iUXLjBoRolsmDA0xvvTywHJ2c9KOiaFiWhIO0mf6zcIgaUcDwuhGEjFtWhRbZxg077S38ARzGCBXlTyvRYg0%2F8OCvfldF%2BhYa57YzLA8Rjm2GLqlB3jNmviqm0JtcdLooC%2FEdA8FGfaLz8m2dTYmu8sW32ABFcnJ6sPfPm43Z%2FwIt9a8NgXflrxzYHYX6U7O4WEbYsfvrk9P8gDutgXa1WF%2BnloWZw%2FS9NkkMiuvzVatOpYr1X1hJ5QjO%2FVQRCh2914bIEQ0dfdH%2B8EQm%2BPJfVXxmzmAzyJ98DGwXMhZ75ro8xy%2Fuvn2GSQu1sT4zySeEKanPoCdNf%2FU46UIPfy%2BVOwpWxJ2Fs3LbkJ8oi2dko3sNfD20FrGm2krSDc0VWDu7piDsbKKDsE6LYBttbZRmFDzBSTX4ZlgLz7EJADNnNaOgDV1p8prEY9jJxQd6YrJMo9QBeyNg%2BAEFQehtK6ZWSssdZoiH3KM7659e98oMg2mMmi7NHzdicUxri2qZvQlUEc09hOKM8UlftiYFndmQAwqfOb2AY6pgFb1CnOfmP1RBYu2nRtX9DqbB2DNQ1WmorB5jtuXnIAZHRXbyDH3%2Ft4OBlyhRn9fdUoFvESICfDkT0o7MiENhjeEXwXl3wagfWBTxcVLLhyGFz7nfg4YCK4h86m%2FCAjE1hSSyHiB79%2Be7EHucqidCKowcTxS%2BimBUq9r61GS5613YqyMNpWtEYLWEAa52Q%2BNfGhADn%2FWxCJtq5qMnjCI7mA0IPLYBHU&X-Amz-Signature=84a3e831050a5a58923af8f42f1e209e22c2ac676b9f52f5450d5f836b89ab83&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4665DM32WT3%2F20261026%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261026T175112Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEBIaCXVzLXdlc3QtMiJGMEQCIEEhHiGpo56y7JxJ8wAUGq4eV9wnK1403c2GITMifvqkAiBbIUstEVXdc%2BCevoO1mVaZLknRmUfEPCdg8LU1Qy2YIyqIBAja%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIM4WltTKZJm8jZfe1%2BKtwDCI2K4LV7NFtpLOtoicHP4sFTLOKzGtjNQeX7jmg48zSTwmqZqkgu1c%2FpFbtBQ0LLNO8igDOPS64zQAVuAvSub%2BBP3nGr70IPzOQgZmpUXeYpIo1c56Gh9vn1lVt%2Fgb%2BrFuDJe9YnHdR9L7pEapCQ53dQz4meV8%2BuTeJ0G4KJATdcRfCr581t02XUbZnneDFAIGM8t6vjQX%2BaBLTBwekvdUzYAND3hxuGa%2FlwMbE2QxQCcnN1ZCOfw5G3c2jXeMvZhtbP4mQaAD8OfdggzopnGrXFj%2BXFUy6goWBbc6t%2B368sViSzciFnmcpz0Q0X8d2LDVT%2B82ZEAJUCoJC6uOTJG4B47YNsYaqUQcy3wn%2F2oSPqD99cQSnLJFkTugoqAaRIjbyfkMZj6AxJZsr0V9%2FU8AykXfkiHiFynTeWvrG8dRYF38hL0KL%2FS9hkHFGA%2BkJoxk%2FByAO9OBDjEjTcQegk%2F6tWX0AmDTiDPLXhM8AesMttuJU%2BWlxf6im71w1dSKqnFHGJRB97lqvjaoUz7kg9xsZ2sDt%2BHR3oDSOQMsAl304Mvmn5pYd4Ppf70H%2FWPI5oxnxpJxskr4H5rfta5UO31Nhs6fh%2FhryfJ49W%2Bq%2BodC9EcHkKmhxWUDFpXK0wlJv%2B1gY6pgHv0EUIRBeF9PiYPG7vf0fXGaESR7L7joxA%2Bq3LGdrRRHfyjdANQu0PDE5OuCkZaJL8Yee1VxZYVhaEcPuY01OHDRiMJQV182G2PIutMID5ETZrQ86RruWp2hmoKbrxOCGZfFIQrAPJ9xnzBxqfILpqPsOI7uDWLpE%2BKh3wvNG%2FLqgiCm1j46QmOVL50gSeRgwhiiO487aBvPtAt3a%2Bt6DnWVmaRRQ%2F&X-Amz-Signature=5fb594dc1edb2d1417a0a82d070290d067e0336c209fa6f4eb4f07c348b3f103&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4665DM32WT3%2F20261026%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261026T175112Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEBIaCXVzLXdlc3QtMiJGMEQCIEEhHiGpo56y7JxJ8wAUGq4eV9wnK1403c2GITMifvqkAiBbIUstEVXdc%2BCevoO1mVaZLknRmUfEPCdg8LU1Qy2YIyqIBAja%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIM4WltTKZJm8jZfe1%2BKtwDCI2K4LV7NFtpLOtoicHP4sFTLOKzGtjNQeX7jmg48zSTwmqZqkgu1c%2FpFbtBQ0LLNO8igDOPS64zQAVuAvSub%2BBP3nGr70IPzOQgZmpUXeYpIo1c56Gh9vn1lVt%2Fgb%2BrFuDJe9YnHdR9L7pEapCQ53dQz4meV8%2BuTeJ0G4KJATdcRfCr581t02XUbZnneDFAIGM8t6vjQX%2BaBLTBwekvdUzYAND3hxuGa%2FlwMbE2QxQCcnN1ZCOfw5G3c2jXeMvZhtbP4mQaAD8OfdggzopnGrXFj%2BXFUy6goWBbc6t%2B368sViSzciFnmcpz0Q0X8d2LDVT%2B82ZEAJUCoJC6uOTJG4B47YNsYaqUQcy3wn%2F2oSPqD99cQSnLJFkTugoqAaRIjbyfkMZj6AxJZsr0V9%2FU8AykXfkiHiFynTeWvrG8dRYF38hL0KL%2FS9hkHFGA%2BkJoxk%2FByAO9OBDjEjTcQegk%2F6tWX0AmDTiDPLXhM8AesMttuJU%2BWlxf6im71w1dSKqnFHGJRB97lqvjaoUz7kg9xsZ2sDt%2BHR3oDSOQMsAl304Mvmn5pYd4Ppf70H%2FWPI5oxnxpJxskr4H5rfta5UO31Nhs6fh%2FhryfJ49W%2Bq%2BodC9EcHkKmhxWUDFpXK0wlJv%2B1gY6pgHv0EUIRBeF9PiYPG7vf0fXGaESR7L7joxA%2Bq3LGdrRRHfyjdANQu0PDE5OuCkZaJL8Yee1VxZYVhaEcPuY01OHDRiMJQV182G2PIutMID5ETZrQ86RruWp2hmoKbrxOCGZfFIQrAPJ9xnzBxqfILpqPsOI7uDWLpE%2BKh3wvNG%2FLqgiCm1j46QmOVL50gSeRgwhiiO487aBvPtAt3a%2Bt6DnWVmaRRQ%2F&X-Amz-Signature=f7227414bdaca7fdddbec7c50a432f1e155f675e5cc9b02dd4dc311eee6d5f36&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466U7DEJVJS%2F20261006%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261006T122322Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjECsaCXVzLXdlc3QtMiJGMEQCIAkQ6W80yhIm9qJ7Swfn9ikLNYigw9LqjL3mIXcKx%2B5OAiBB5VYfih3%2BfbxyNwdV3dWfYdn2aE7zxB9DIotd60%2BL1CqIBAj0%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMaI8CtqNlCy0hZCUcKtwDkBRe4u0E6bNm8kwXPa%2F%2By%2BQcFvOOpQ5mcAYlF2ZUDPTwq99cxP%2F0uN7Ur12qlVzN7BW93GOrEK0Mwx8o9Gdt85rwp4OdBOe0oYP1mVB012dt84MzkE3ZyccTabRMc3uY6NES5LXxpQLMoULnWzMPwpEUcxrbMPrAMnvM7TTr3LA5EYOubuCc%2BEXocHw1pDa3WBpGYAFWJdNaY4zIZAuqg3xwrLX1PSz8cmKHsPByLQi%2BBKdyaW3eEjfZ1C%2FKX6O%2FHNzqYvR0H5h08t%2FU8bNb5sB8IFJNQg9xP2MPRHKELJMb%2FhCVuVLgj28%2BSfs0234igQFGgwSREL3j%2BAyWTNeIeF8qnd7AuxX9lEHyR%2F4hECRkiJszFaA0dPYYMeeoFXtg%2B65KZmRuc9vNdR4XdTkmJ9Li8gFDpz4sCBohm%2Bza%2FQGwf6xvHCeMPUqmIpLOE%2BwTamJn%2ByOnclHq3%2BfP4opzy7QPawImcqHIszUxRVYDspYr8FhnS9EOoCTuAZpZox2DL0ll1JlpW1c4pOu6rh6quZeSPsAJqWNMehbF1KpaNANApB%2B%2BNggTzeQp8oslf0HV6QZYgF9p4F18FpfQwbpbldlj12fiMwarP650DtYp%2BJT08YjOsuV4mPjn9x0w0JmT1gY6pgHgf1lmWOuUyNf%2FmZJLAlSdoNUiUgSxGzd5M2poDqt4gAK9Qidgi0b0eG4%2BKKUJEPKhCnkzniNj3n3WVduxt9D3CaO8RGxHwRCn3uaocwSpsxDKqeviNB7Ws1V%2F9xBeKHuur2GNL2pDvsJtXgMiekqSmL3cCatqO6GdzgBfEc5oPFFAxnTj8PmileA3GwHUabOMR4IZBZpEi4MDajI%2Ba2QKat82hvXc&X-Amz-Signature=102a46c4d7e145640b6a5792ed560a6b39167c5b4af1a495a55efb18f01417be&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466U7DEJVJS%2F20261006%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261006T122322Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjECsaCXVzLXdlc3QtMiJGMEQCIAkQ6W80yhIm9qJ7Swfn9ikLNYigw9LqjL3mIXcKx%2B5OAiBB5VYfih3%2BfbxyNwdV3dWfYdn2aE7zxB9DIotd60%2BL1CqIBAj0%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMaI8CtqNlCy0hZCUcKtwDkBRe4u0E6bNm8kwXPa%2F%2By%2BQcFvOOpQ5mcAYlF2ZUDPTwq99cxP%2F0uN7Ur12qlVzN7BW93GOrEK0Mwx8o9Gdt85rwp4OdBOe0oYP1mVB012dt84MzkE3ZyccTabRMc3uY6NES5LXxpQLMoULnWzMPwpEUcxrbMPrAMnvM7TTr3LA5EYOubuCc%2BEXocHw1pDa3WBpGYAFWJdNaY4zIZAuqg3xwrLX1PSz8cmKHsPByLQi%2BBKdyaW3eEjfZ1C%2FKX6O%2FHNzqYvR0H5h08t%2FU8bNb5sB8IFJNQg9xP2MPRHKELJMb%2FhCVuVLgj28%2BSfs0234igQFGgwSREL3j%2BAyWTNeIeF8qnd7AuxX9lEHyR%2F4hECRkiJszFaA0dPYYMeeoFXtg%2B65KZmRuc9vNdR4XdTkmJ9Li8gFDpz4sCBohm%2Bza%2FQGwf6xvHCeMPUqmIpLOE%2BwTamJn%2ByOnclHq3%2BfP4opzy7QPawImcqHIszUxRVYDspYr8FhnS9EOoCTuAZpZox2DL0ll1JlpW1c4pOu6rh6quZeSPsAJqWNMehbF1KpaNANApB%2B%2BNggTzeQp8oslf0HV6QZYgF9p4F18FpfQwbpbldlj12fiMwarP650DtYp%2BJT08YjOsuV4mPjn9x0w0JmT1gY6pgHgf1lmWOuUyNf%2FmZJLAlSdoNUiUgSxGzd5M2poDqt4gAK9Qidgi0b0eG4%2BKKUJEPKhCnkzniNj3n3WVduxt9D3CaO8RGxHwRCn3uaocwSpsxDKqeviNB7Ws1V%2F9xBeKHuur2GNL2pDvsJtXgMiekqSmL3cCatqO6GdzgBfEc5oPFFAxnTj8PmileA3GwHUabOMR4IZBZpEi4MDajI%2Ba2QKat82hvXc&X-Amz-Signature=285ff2f2b28d9c71cc4bb80bc08e9a6cca2d2fac757a08b9130e0139b96f6170&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB46646CC6Y36%2F20260923%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260923T102619Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEPL%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCID1AWSCjsaNrEyHMKQPIvjbD4GNWaxemEUBl8nB20xPuAiAiy0PnrVtaa7UPF9pA2k%2F%2Fo0GH5dEwTmrxgThN09UPniqIBAi7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIM6DdB1nWfzwg8Wp3UKtwDh1BDJ7ZLgRcNmqeUmary%2FhwGZFwoj4HyvniL3uvbhGyGaloflh0gcXbto5LgXbEtxdrW5kfn0TRRzLZwYGA66VlbJr%2BEqUrDM3VuLV%2FQ4lhBL38rgvNp2POyZF44jQNBLKcjx9DZfLbrvkgqE086%2BDW3jctDah7ABcuj0weVd9Z%2BATxxdnDgO1h3YAn4uVKIeLOqJrLntVnH8RqH2wsev1Bj%2BH2%2FZzFAQDj23gvn6bt%2BZ80PGYofFTJF09LNFn6r3it0KRuKUKd3Lmlgy4MJM4MhYDAVNiHmozCjStM6%2F7u8H2w4KTp%2FT3PKJsp3GKBSpPfsYLzo6Zy8oJ0lPdEQ8QdtTg%2BpySCMad%2B4WjGpGByPqt994nViR4%2Fjvnq3axyd9mP7WZFO2uc8YpoUeidM4TUNmGl1BSAavJ0RY7w6aHXHbc6vS8g9SvcxVrZW19ckeWv4JGtYTTq0BlHympp1fnGjSdv0%2BjfbaNk0nnHB38hkQVI7S2t6uO5dMf1%2BZlID3en4qaKXxaNywZV61WnQbaKTl29%2BeNC5udKSTJQLw0%2BkaI9uf%2FxzLTgwYUtHMowTK9nN4uDcDdInhSaP1Y%2FBezxvY%2FjjRsaoLMXh11iNnYilfVYeI6gw81LennMwtsHO1QY6pgGmfdG9CYsYPZQuIYnBbc2Vdbu%2BAMpBmFvrsyVyFxvMqRRWNFPGcqOeXCh4yknw9fYC7ULyTJpWw63eR%2ByJSWmczKE8v%2BcCYa7PN5tnpJXn%2BTBKcloruZOh2YrFibb5mq9ftsQRaYotvCNffEn2jKd4AjWa1GFIPvQfCf0eiQ7a30Do0hQEWe1ziSsHZsfFuMklpuBAjwdQMpA1El5doayOnGDeU0T8&X-Amz-Signature=0a461a6f9b5c03fc7a40d16be260efc005ce525c087dafe1b24e4f2d91eb873a&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB46646CC6Y36%2F20260923%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260923T102619Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEPL%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCID1AWSCjsaNrEyHMKQPIvjbD4GNWaxemEUBl8nB20xPuAiAiy0PnrVtaa7UPF9pA2k%2F%2Fo0GH5dEwTmrxgThN09UPniqIBAi7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIM6DdB1nWfzwg8Wp3UKtwDh1BDJ7ZLgRcNmqeUmary%2FhwGZFwoj4HyvniL3uvbhGyGaloflh0gcXbto5LgXbEtxdrW5kfn0TRRzLZwYGA66VlbJr%2BEqUrDM3VuLV%2FQ4lhBL38rgvNp2POyZF44jQNBLKcjx9DZfLbrvkgqE086%2BDW3jctDah7ABcuj0weVd9Z%2BATxxdnDgO1h3YAn4uVKIeLOqJrLntVnH8RqH2wsev1Bj%2BH2%2FZzFAQDj23gvn6bt%2BZ80PGYofFTJF09LNFn6r3it0KRuKUKd3Lmlgy4MJM4MhYDAVNiHmozCjStM6%2F7u8H2w4KTp%2FT3PKJsp3GKBSpPfsYLzo6Zy8oJ0lPdEQ8QdtTg%2BpySCMad%2B4WjGpGByPqt994nViR4%2Fjvnq3axyd9mP7WZFO2uc8YpoUeidM4TUNmGl1BSAavJ0RY7w6aHXHbc6vS8g9SvcxVrZW19ckeWv4JGtYTTq0BlHympp1fnGjSdv0%2BjfbaNk0nnHB38hkQVI7S2t6uO5dMf1%2BZlID3en4qaKXxaNywZV61WnQbaKTl29%2BeNC5udKSTJQLw0%2BkaI9uf%2FxzLTgwYUtHMowTK9nN4uDcDdInhSaP1Y%2FBezxvY%2FjjRsaoLMXh11iNnYilfVYeI6gw81LennMwtsHO1QY6pgGmfdG9CYsYPZQuIYnBbc2Vdbu%2BAMpBmFvrsyVyFxvMqRRWNFPGcqOeXCh4yknw9fYC7ULyTJpWw63eR%2ByJSWmczKE8v%2BcCYa7PN5tnpJXn%2BTBKcloruZOh2YrFibb5mq9ftsQRaYotvCNffEn2jKd4AjWa1GFIPvQfCf0eiQ7a30Do0hQEWe1ziSsHZsfFuMklpuBAjwdQMpA1El5doayOnGDeU0T8&X-Amz-Signature=55fafbaa5154fe5803c9509d39c303335b8b1142d23093ab882e9e328e964866&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

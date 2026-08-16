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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466XWZCMT6Z%2F20260816%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260816T121702Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEGMaCXVzLXdlc3QtMiJHMEUCIQCkBRFAYeSH470ZRoJux%2F%2FI2S7r%2BgSq%2B8X778C5x6fzWgIgdtlKfUt2hVrLN64aVTYCEzMDMxMknBZqQ%2Bxafpr9cBgq%2FwMILBAAGgw2Mzc0MjMxODM4MDUiDGmE8popxWMp8iNPJyrcA95lABAZONmh2qZ1NnNrBCHcFz44N1bp4wlSF8GIoWoPV7ahyVIyupaGV9Vi2fZ9vMs6X4ysnaEm1DGKfcOFHHzRX2yye50TUeM5Fi8d2choRVbp2zTSyKS%2FmwSAvRoZmPevYaXegtma0jqXfE7gLRTsV23fJshkpAuY699cmIsnoptnNL2xttWi1%2BWIJsX1uIcIxlNlDhCtsb0vNC6Ox1cGH5%2FsT7qaV5g4M53xiTLXZWFge0nYlft8OIe7vhm4zQM1mVfPNbgPW4WAXkUzGhRvFqp9aysqrQ320P2sC29Hd8jtw%2B7ocqMTZveNJ0xEYnW6%2FRIDQqG1ZD63%2FzRn8qri2BghZKKjdPWRSCniDoISAUKn9jYT0sROFo7m8NFFOni4t6P9VLlmXpTJ3sy8E0zGomQ780D8EjQmmw%2FCGsrT1eiTpcwPQ8o%2BmPE8XObaEne6Zp1g2cNPZFBfy4h5nNL4WTsjfrNGlMCHSFuShjAXp%2BQuhDSXpNyBUpqwHORePLHTEj6kBzkyjAdA%2BSPCQTKhrXoI2khj1CKqOPjGtxhhTKAer2bHCzjOidGR85V7V90KEUHG0U5g4qAURFTTpyiUJol7HzlIPlPI5ZzyDnu7dmElU7cVfto%2BcptTMI2jhtQGOqUBXIrcRfX%2B8gF5gVA5jxPrx0Q1zgMSClzf0F6tdc73HZwaQMSOw9V%2B5MsHCojzdY7m2u5g4aWwR0M58MHR91epFTWFPNrb1cCZW5%2FSdiDNOWFvPmLH0TY5P8kMukD9nAqFJJn4%2Biz6jmWTF9yCBbouG0xR2pdWWa4ePXMD%2Fr52myEmZbQsL6xo9FEo9kyVes3idFQ%2B2XSNz9os6OjVnnUEFRpLjwqU&X-Amz-Signature=a254ac78c83378a13586949dc92a73baffc1f3efd769118d2b5fe076e0e0023f&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466XWZCMT6Z%2F20260816%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260816T121702Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEGMaCXVzLXdlc3QtMiJHMEUCIQCkBRFAYeSH470ZRoJux%2F%2FI2S7r%2BgSq%2B8X778C5x6fzWgIgdtlKfUt2hVrLN64aVTYCEzMDMxMknBZqQ%2Bxafpr9cBgq%2FwMILBAAGgw2Mzc0MjMxODM4MDUiDGmE8popxWMp8iNPJyrcA95lABAZONmh2qZ1NnNrBCHcFz44N1bp4wlSF8GIoWoPV7ahyVIyupaGV9Vi2fZ9vMs6X4ysnaEm1DGKfcOFHHzRX2yye50TUeM5Fi8d2choRVbp2zTSyKS%2FmwSAvRoZmPevYaXegtma0jqXfE7gLRTsV23fJshkpAuY699cmIsnoptnNL2xttWi1%2BWIJsX1uIcIxlNlDhCtsb0vNC6Ox1cGH5%2FsT7qaV5g4M53xiTLXZWFge0nYlft8OIe7vhm4zQM1mVfPNbgPW4WAXkUzGhRvFqp9aysqrQ320P2sC29Hd8jtw%2B7ocqMTZveNJ0xEYnW6%2FRIDQqG1ZD63%2FzRn8qri2BghZKKjdPWRSCniDoISAUKn9jYT0sROFo7m8NFFOni4t6P9VLlmXpTJ3sy8E0zGomQ780D8EjQmmw%2FCGsrT1eiTpcwPQ8o%2BmPE8XObaEne6Zp1g2cNPZFBfy4h5nNL4WTsjfrNGlMCHSFuShjAXp%2BQuhDSXpNyBUpqwHORePLHTEj6kBzkyjAdA%2BSPCQTKhrXoI2khj1CKqOPjGtxhhTKAer2bHCzjOidGR85V7V90KEUHG0U5g4qAURFTTpyiUJol7HzlIPlPI5ZzyDnu7dmElU7cVfto%2BcptTMI2jhtQGOqUBXIrcRfX%2B8gF5gVA5jxPrx0Q1zgMSClzf0F6tdc73HZwaQMSOw9V%2B5MsHCojzdY7m2u5g4aWwR0M58MHR91epFTWFPNrb1cCZW5%2FSdiDNOWFvPmLH0TY5P8kMukD9nAqFJJn4%2Biz6jmWTF9yCBbouG0xR2pdWWa4ePXMD%2Fr52myEmZbQsL6xo9FEo9kyVes3idFQ%2B2XSNz9os6OjVnnUEFRpLjwqU&X-Amz-Signature=1a6f5a540ced93e037b4769d47069a559897887153c49c96ceb61a2ad73875e5&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

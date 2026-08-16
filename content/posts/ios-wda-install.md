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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663F2WGBAK%2F20260816%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260816T003848Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEFgaCXVzLXdlc3QtMiJGMEQCICoyaCzOR5Gok%2Fal9S%2FfKPFwvzFbY1NiOVF3oiNI7ayLAiAKqSnK%2FRRwdjyT%2FY6Y9TEGGEUwpuIxrjU%2BmqX1e0DLsyr%2FAwghEAAaDDYzNzQyMzE4MzgwNSIMoFTZUu2N24Mp79VLKtwDQ0OlSyDXJsqXMolYlY4oeGrrGxzi7sAG5xQfQreIR2zsbp5vIUE2vAaZQoakb3STttNsbjLtf9whed0eHKfXvdh0sbsOgwvvIdVBmZm1BQ077qt%2FFs9wMqnkOefqaYVfGjMpO1RLT9wIJPceyV%2FQtRyoY%2BMdlnNQy9pBKh%2FAkU2gAD7hhzmoL4q31BaT%2FTJr5xO9jC60SnwsADeBC5eQSnwT1aQ1uyMfZyawbi%2FjUZyhhqHP74WgHxumzb8mYUCnIjkDqf3rXyKU4Ao2NPsQ9Ns%2Bn95S8bEyUUda46n%2FLToJNcscNaKQLDpyz2xyrqE00OC53ZA0UVqlueBKEMk7IsLm%2FU9mUIRrwsg1mg2TOjXTueOTasBzP4L1CxxbkvemrSHvBtjaRvQOkIIJJGmjbayFRKy2nkY998ob3ysXKkz1EBB1xwHM6J550168mXD8uCz%2FsIFm1R7lcT8Fp9Qp7yylK6EutTlxeBeVVWCrkbWKvOmzL1DlnuC5qXosXIBl%2Fcoz00t79OQG%2BzyC4SaALNyvZjCcMwpfFCq1ZWKWHXfqotIha4Vq7CcWR7R%2FdERIL0YBvvjALgw2kByNaG526ydLBgXo0oKeWCGgypCsW7LVMxCtZooI2cFmaNcw4OuD1AY6pgG6uiAUjrVqX%2BJ%2FdAmhyqoEPRuZyXeTXLdU2wegOa8%2BNk9b5lovepJsUC3GqoXk%2BqVHZwJcc6ydBeCpGMR48m7BcBTGuNSNU%2FI1O08p93KWsUcmr1i7bBG1iegQTP8WR%2B%2FGNNaOfwc9Baxx0mI%2Fh9j1p92iV8yW%2F5okeJ6lH8NUQozf9%2BSBGG4Kv5MfES4rdypDFR8HbaovjUDTkWoPtj%2BIza7e5Oxl&X-Amz-Signature=83f8d4bd5c8af196d0718946c84e98c1ba8f7761db6b4b37cae3337d3ca88342&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663F2WGBAK%2F20260816%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260816T003848Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEFgaCXVzLXdlc3QtMiJGMEQCICoyaCzOR5Gok%2Fal9S%2FfKPFwvzFbY1NiOVF3oiNI7ayLAiAKqSnK%2FRRwdjyT%2FY6Y9TEGGEUwpuIxrjU%2BmqX1e0DLsyr%2FAwghEAAaDDYzNzQyMzE4MzgwNSIMoFTZUu2N24Mp79VLKtwDQ0OlSyDXJsqXMolYlY4oeGrrGxzi7sAG5xQfQreIR2zsbp5vIUE2vAaZQoakb3STttNsbjLtf9whed0eHKfXvdh0sbsOgwvvIdVBmZm1BQ077qt%2FFs9wMqnkOefqaYVfGjMpO1RLT9wIJPceyV%2FQtRyoY%2BMdlnNQy9pBKh%2FAkU2gAD7hhzmoL4q31BaT%2FTJr5xO9jC60SnwsADeBC5eQSnwT1aQ1uyMfZyawbi%2FjUZyhhqHP74WgHxumzb8mYUCnIjkDqf3rXyKU4Ao2NPsQ9Ns%2Bn95S8bEyUUda46n%2FLToJNcscNaKQLDpyz2xyrqE00OC53ZA0UVqlueBKEMk7IsLm%2FU9mUIRrwsg1mg2TOjXTueOTasBzP4L1CxxbkvemrSHvBtjaRvQOkIIJJGmjbayFRKy2nkY998ob3ysXKkz1EBB1xwHM6J550168mXD8uCz%2FsIFm1R7lcT8Fp9Qp7yylK6EutTlxeBeVVWCrkbWKvOmzL1DlnuC5qXosXIBl%2Fcoz00t79OQG%2BzyC4SaALNyvZjCcMwpfFCq1ZWKWHXfqotIha4Vq7CcWR7R%2FdERIL0YBvvjALgw2kByNaG526ydLBgXo0oKeWCGgypCsW7LVMxCtZooI2cFmaNcw4OuD1AY6pgG6uiAUjrVqX%2BJ%2FdAmhyqoEPRuZyXeTXLdU2wegOa8%2BNk9b5lovepJsUC3GqoXk%2BqVHZwJcc6ydBeCpGMR48m7BcBTGuNSNU%2FI1O08p93KWsUcmr1i7bBG1iegQTP8WR%2B%2FGNNaOfwc9Baxx0mI%2Fh9j1p92iV8yW%2F5okeJ6lH8NUQozf9%2BSBGG4Kv5MfES4rdypDFR8HbaovjUDTkWoPtj%2BIza7e5Oxl&X-Amz-Signature=d55c2f16161996469cd99690b02c77e3860d511bee182c367d2f8e1615124433&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

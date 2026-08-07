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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466SGZCXKEA%2F20260807%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260807T020445Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEIH%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQDGksQ6bVsJ6QRRbkEyMuRIu6srlvR8nAuxhrCIxOp5CQIhAO0a4rrqs4OeLs0ODpb8T4gHxn2YylRmPiMAPNBV9eCUKv8DCEoQABoMNjM3NDIzMTgzODA1Igwjymi4kqAM7QokR%2BAq3AOJjTBWDjc9OepiVctIQd8X9gCjUlm6IoVdf0ivJt5eBmeKVBitVNUIpSBPY975IhM9shNKKRrWJYfB3lQ3i68wEtmtUUAGqfKf8U5cRLgsj%2Bp7XBh4G0ck0R54EI4j1GxFmLGHFb0KxkRPa2FdGlEHlHCbYIpkgwrMG19tUe876uepdd7ODYhYld6WjTgN1QfyCZ0iC0tTvpcIXj%2FyfI%2F4NUVEOFQ6UsfKuhRpDQtJknB%2FMWnc2RjmRvjPXbHkTjK4Jp5Rf3L3YA45DF5xCB4ySegrki9FhrvKiXPITkr0FRLRyaG5aNmfJYZ29vN7rTLV%2B4y%2F%2BUh%2B3LVS8dogaGHKmI41oy1rsKDBMyoHTHmEZmJvu3clkSKguKBcgdVVBUAWpG%2FTwrisFT2w4sAAoZ1rZcguUulMrqD7ojyH2Zx3H6gkcFXdeuqRqPLJ8p3V3IwJjrMVIBGgPtiOKCck0344SwyOR60zqw1jusLTjNzxUj0E3m9P6m%2F5xAVpDP7JCPcTK8xEwLmYtIBs0TEkQgnF58jQbt7HQjUTUE%2BJv6eUQ5tY0QZ0Bty6fCm4y0zq1R3lcADL3y%2FAf06mp7%2FBER9unYmu7KmE8ufOkZP6Yz7%2BfNEDkYhLdU8fLB09qjDZ1dTTBjqkAeeDDgNYDw7sscjIE6Y%2FwibiBkOV88AMn2U5SP7jDXM7%2F0LRrMjJzJrHIGJ1EdbH71Qbf8U0xbjGGOVnrGKovBi5TvgW0Yj3JsCBOnk8NcDlK2GvyZd3U%2BYeuffKJlnbXSaOeHrZVDjRa%2BdVGbSojd0nV1Z8IdkInAfFYlpAvOgVLi6R3XSQQKOMXGRP72RySN%2FSrF3UFof8AdG6BzH3Dao4fzEM&X-Amz-Signature=88f89df7ea4ddce775fcc670354c0eb3e39e7f53b29b91e9cd7b90c23e460789&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466SGZCXKEA%2F20260807%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260807T020445Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEIH%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQDGksQ6bVsJ6QRRbkEyMuRIu6srlvR8nAuxhrCIxOp5CQIhAO0a4rrqs4OeLs0ODpb8T4gHxn2YylRmPiMAPNBV9eCUKv8DCEoQABoMNjM3NDIzMTgzODA1Igwjymi4kqAM7QokR%2BAq3AOJjTBWDjc9OepiVctIQd8X9gCjUlm6IoVdf0ivJt5eBmeKVBitVNUIpSBPY975IhM9shNKKRrWJYfB3lQ3i68wEtmtUUAGqfKf8U5cRLgsj%2Bp7XBh4G0ck0R54EI4j1GxFmLGHFb0KxkRPa2FdGlEHlHCbYIpkgwrMG19tUe876uepdd7ODYhYld6WjTgN1QfyCZ0iC0tTvpcIXj%2FyfI%2F4NUVEOFQ6UsfKuhRpDQtJknB%2FMWnc2RjmRvjPXbHkTjK4Jp5Rf3L3YA45DF5xCB4ySegrki9FhrvKiXPITkr0FRLRyaG5aNmfJYZ29vN7rTLV%2B4y%2F%2BUh%2B3LVS8dogaGHKmI41oy1rsKDBMyoHTHmEZmJvu3clkSKguKBcgdVVBUAWpG%2FTwrisFT2w4sAAoZ1rZcguUulMrqD7ojyH2Zx3H6gkcFXdeuqRqPLJ8p3V3IwJjrMVIBGgPtiOKCck0344SwyOR60zqw1jusLTjNzxUj0E3m9P6m%2F5xAVpDP7JCPcTK8xEwLmYtIBs0TEkQgnF58jQbt7HQjUTUE%2BJv6eUQ5tY0QZ0Bty6fCm4y0zq1R3lcADL3y%2FAf06mp7%2FBER9unYmu7KmE8ufOkZP6Yz7%2BfNEDkYhLdU8fLB09qjDZ1dTTBjqkAeeDDgNYDw7sscjIE6Y%2FwibiBkOV88AMn2U5SP7jDXM7%2F0LRrMjJzJrHIGJ1EdbH71Qbf8U0xbjGGOVnrGKovBi5TvgW0Yj3JsCBOnk8NcDlK2GvyZd3U%2BYeuffKJlnbXSaOeHrZVDjRa%2BdVGbSojd0nV1Z8IdkInAfFYlpAvOgVLi6R3XSQQKOMXGRP72RySN%2FSrF3UFof8AdG6BzH3Dao4fzEM&X-Amz-Signature=e7dcef79e6568c485ad751ff3bf1ee2b0b7de05774940800fe8bb55deef7529d&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

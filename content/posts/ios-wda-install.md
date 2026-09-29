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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4667VQI3RC6%2F20260929%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260929T213737Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEIz%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIGwwijC7fX%2BtWcI6CByoSLvEGe8bnul38elkqaG%2BZ%2FjEAiEAve0%2BxvXNpVQ1nmzgvMjn5y%2FZHvdXSqlT%2F5FArBipmn0q%2FwMIVBAAGgw2Mzc0MjMxODM4MDUiDJGs7MDYkoNkhMBrhSrcA6XFmyqhCdFo1%2BwtLjdaOHpeZHtogVLfkwf%2Fg03oJ7Lh%2FShOdqHPveH4WT1Y1S9mDR6Axu2KHrpJdGa8rG2hZd0PrZjgBH7K%2BN4APvtuQupCNySx1eHWTwf7bYcUIQiK8uezEhgAYg%2BAwr6eMwYAqxivwxb8fTy2mB2SCmcGDVT1da79XY3gZvPqCJm5R0JDlO3hlXycValGQ9BVMyNyGsW14ak4aOEUN46DeZF%2Fn6XQ%2F2lLU23%2BQAlQ%2BQ1uG91xTq9Sq9DEbhO5AsB1cHqpoAFr9gau5lM%2B%2BEMYoSDrXBdXdrCHYlowl9BfDR%2BoHefli%2BRWD%2FfUNcTG0%2BzKWe4PYi7NLtfkbvogK5WdXt5tQMKkIwqEfRWvQHhzAC6VIULl8fpPMsUDF0P4lYDmjfnjDGKosdrrW4uD0DqABQ9e6z%2BX7B6sDE%2BUPlzQf2x2%2BDCSmCqtSDd%2ByTripYeuzZYF1BBfpJFB6YE0hSlAKOABKfDkwqkQeES8zD7S%2FHafXGiXgbIWgJZ10w%2ByVybyeFnMiBj0Fc639bU3CK9aVYEoqQdDgXKiGrQnA1MbbBKlEsru5p%2Fu1ucpSjyy%2FUUCZp2LNj3obpCsoVLXnX3iTxRwSWEGfDwNmKEPRLUCwf%2FBMJqw8NUGOqUBKXAz9vXiJqZ%2BrNIiJRW%2FmXT5SkJzzVI1DvZhwacPou3UQxU2gjNyK%2FbJn3Nxr3hPxWyzYi%2B11VODBrPr%2FaCjms8eYyGfOezugYlWVRyQXiKh5g%2BwgohkNSKLwBEqTwh2A3P6ZGEKMGazZBYJN9A8%2FIWj4xbmYKDkjajpe2C80R6RlYLU6neV61aPNalmpvwssN8IGZVBe0Wfb99oKUG41sNBbpkg&X-Amz-Signature=72307c2ceaeff55f36780ea672c90bb2bc404a1dd2abb32d27e3e062917373e7&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4667VQI3RC6%2F20260929%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260929T213737Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEIz%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIGwwijC7fX%2BtWcI6CByoSLvEGe8bnul38elkqaG%2BZ%2FjEAiEAve0%2BxvXNpVQ1nmzgvMjn5y%2FZHvdXSqlT%2F5FArBipmn0q%2FwMIVBAAGgw2Mzc0MjMxODM4MDUiDJGs7MDYkoNkhMBrhSrcA6XFmyqhCdFo1%2BwtLjdaOHpeZHtogVLfkwf%2Fg03oJ7Lh%2FShOdqHPveH4WT1Y1S9mDR6Axu2KHrpJdGa8rG2hZd0PrZjgBH7K%2BN4APvtuQupCNySx1eHWTwf7bYcUIQiK8uezEhgAYg%2BAwr6eMwYAqxivwxb8fTy2mB2SCmcGDVT1da79XY3gZvPqCJm5R0JDlO3hlXycValGQ9BVMyNyGsW14ak4aOEUN46DeZF%2Fn6XQ%2F2lLU23%2BQAlQ%2BQ1uG91xTq9Sq9DEbhO5AsB1cHqpoAFr9gau5lM%2B%2BEMYoSDrXBdXdrCHYlowl9BfDR%2BoHefli%2BRWD%2FfUNcTG0%2BzKWe4PYi7NLtfkbvogK5WdXt5tQMKkIwqEfRWvQHhzAC6VIULl8fpPMsUDF0P4lYDmjfnjDGKosdrrW4uD0DqABQ9e6z%2BX7B6sDE%2BUPlzQf2x2%2BDCSmCqtSDd%2ByTripYeuzZYF1BBfpJFB6YE0hSlAKOABKfDkwqkQeES8zD7S%2FHafXGiXgbIWgJZ10w%2ByVybyeFnMiBj0Fc639bU3CK9aVYEoqQdDgXKiGrQnA1MbbBKlEsru5p%2Fu1ucpSjyy%2FUUCZp2LNj3obpCsoVLXnX3iTxRwSWEGfDwNmKEPRLUCwf%2FBMJqw8NUGOqUBKXAz9vXiJqZ%2BrNIiJRW%2FmXT5SkJzzVI1DvZhwacPou3UQxU2gjNyK%2FbJn3Nxr3hPxWyzYi%2B11VODBrPr%2FaCjms8eYyGfOezugYlWVRyQXiKh5g%2BwgohkNSKLwBEqTwh2A3P6ZGEKMGazZBYJN9A8%2FIWj4xbmYKDkjajpe2C80R6RlYLU6neV61aPNalmpvwssN8IGZVBe0Wfb99oKUG41sNBbpkg&X-Amz-Signature=d509e02bf356f30b6198a951262046589984e1511c992f68751e7fd3d6a797b8&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

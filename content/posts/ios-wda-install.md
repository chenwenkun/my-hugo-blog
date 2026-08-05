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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4665WHRVAUR%2F20260805%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260805T081430Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEFgaCXVzLXdlc3QtMiJGMEQCIF4kvyEgrJPq2SlvpBCxJ644uUFvbLLL1ZzQBY1KqbGoAiATob66OHHCWsjjcdfGn%2BKDrNye6MZoXNVKy1fGJvFi1ir%2FAwghEAAaDDYzNzQyMzE4MzgwNSIM3fKiv9NTykEvK41GKtwDD5aVZc9UxNET6VXlxGp3jJu0yg6Lu9iL1yMWYszg5L%2B80TFtCf%2BhraAs%2BZ4iXi2lh0Ujfd7VYlASrNkAT2Lz2HIp2eDd4jVX5nhP2IYjDAJLL4J6B3JHdS9ykSgMZwejz03WwgbELzZje3UA3RJvWxWJcdLDsJGeuu17OcJxwDEXReFMuxZ%2FM9Q0Noa90l9tYqDGXnbOhmnYfACYZGsFphagcvtdnpG%2B%2B%2F7vYD%2F6cD4aEYKJuhqDfOcSWAGMD8FSJrISL%2Bv0I3nAQwVAeyEahec%2Fils%2Bbx7uA0saQbI7MiD6DN%2Bp0puTEPywOcgLcwNvtv7vNmA%2BTUrBiciZ%2FLXKvWFnMZCJEwExBOrwN1C1LnNQkayzGYQldZMxo99pAGHDMxxtIqrKialoZWDXo08XlDb6Fy2teB3fDmisE1DnS95%2B0e2iJXvNUMNoAwFpBO%2FO%2FCKGjnHjPQoes6uqm4VuUDVP0t%2BPgCkr9tbSqpRddX8WCQDsiCSCw%2B2Rw8HbeHZvEpBKO1l70r%2Fsgbhajm3OpTOKOp%2ByJDnBKvRsJ%2BC5lg0m4OytoCWqp9Jzce45DlhdvWE%2ByUuYdzwy56muNu2xyF7SFwmTOlQNkkOXTgC%2F8hBVid8mmvcw0tKBxf4wxNzL0wY6pgEjDL64baaroytwIUyrvsbqE8W161gaI89YCHoyOgJVgayPP0e%2Fb6CCqOkMRLSuLsn%2BxiiN9xNkBV%2BF4TvIh8Hl4xL76vWX5ulR0M3lkY90NVDpNboPVv7GccC9rSdaYVLl%2FlaOJ6gruultQ4UPPB%2BxBCGlM6AeNtsXsn%2FtSa5BwQ%2F4TbSKpSV%2BouaK%2FWGXWGPsq7hwdwWpZ6CSYAlQ%2F%2FkSMHNuzXrB&X-Amz-Signature=fcdc09d998526fe1425f5704712abdc2b906b517b7deba4af0bb81d876cf264b&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4665WHRVAUR%2F20260805%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260805T081430Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEFgaCXVzLXdlc3QtMiJGMEQCIF4kvyEgrJPq2SlvpBCxJ644uUFvbLLL1ZzQBY1KqbGoAiATob66OHHCWsjjcdfGn%2BKDrNye6MZoXNVKy1fGJvFi1ir%2FAwghEAAaDDYzNzQyMzE4MzgwNSIM3fKiv9NTykEvK41GKtwDD5aVZc9UxNET6VXlxGp3jJu0yg6Lu9iL1yMWYszg5L%2B80TFtCf%2BhraAs%2BZ4iXi2lh0Ujfd7VYlASrNkAT2Lz2HIp2eDd4jVX5nhP2IYjDAJLL4J6B3JHdS9ykSgMZwejz03WwgbELzZje3UA3RJvWxWJcdLDsJGeuu17OcJxwDEXReFMuxZ%2FM9Q0Noa90l9tYqDGXnbOhmnYfACYZGsFphagcvtdnpG%2B%2B%2F7vYD%2F6cD4aEYKJuhqDfOcSWAGMD8FSJrISL%2Bv0I3nAQwVAeyEahec%2Fils%2Bbx7uA0saQbI7MiD6DN%2Bp0puTEPywOcgLcwNvtv7vNmA%2BTUrBiciZ%2FLXKvWFnMZCJEwExBOrwN1C1LnNQkayzGYQldZMxo99pAGHDMxxtIqrKialoZWDXo08XlDb6Fy2teB3fDmisE1DnS95%2B0e2iJXvNUMNoAwFpBO%2FO%2FCKGjnHjPQoes6uqm4VuUDVP0t%2BPgCkr9tbSqpRddX8WCQDsiCSCw%2B2Rw8HbeHZvEpBKO1l70r%2Fsgbhajm3OpTOKOp%2ByJDnBKvRsJ%2BC5lg0m4OytoCWqp9Jzce45DlhdvWE%2ByUuYdzwy56muNu2xyF7SFwmTOlQNkkOXTgC%2F8hBVid8mmvcw0tKBxf4wxNzL0wY6pgEjDL64baaroytwIUyrvsbqE8W161gaI89YCHoyOgJVgayPP0e%2Fb6CCqOkMRLSuLsn%2BxiiN9xNkBV%2BF4TvIh8Hl4xL76vWX5ulR0M3lkY90NVDpNboPVv7GccC9rSdaYVLl%2FlaOJ6gruultQ4UPPB%2BxBCGlM6AeNtsXsn%2FtSa5BwQ%2F4TbSKpSV%2BouaK%2FWGXWGPsq7hwdwWpZ6CSYAlQ%2F%2FkSMHNuzXrB&X-Amz-Signature=9bc6da41202f89e901e0140d5b21546c9c271d48fe8d4eb888edd57e2a121b14&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

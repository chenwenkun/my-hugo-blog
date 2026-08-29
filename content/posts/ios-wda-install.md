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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4667IGSVGWH%2F20260829%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260829T155735Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJ7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIEUN%2FFmEcKysWkoHE0A6ILS7JKpfr1gKey39tuFSqNf3AiEAyTLZcWtgr2F9V7THWKJKHx1lFdtybEu7Ro%2BxhbwhOewq%2FwMIZhAAGgw2Mzc0MjMxODM4MDUiDKXOOz5wkB17677RgSrcAz3fi9D6X9%2BvGbXcBwIYS4BderfMPNmv3keEWoiicZx5UWM8sI8YkMSkmGE1eMF6gx1Ng3FTkbfRw1rpQDWJy3HZCME%2Fzmis46e%2FmxeK2%2FzOWmB7Q4mkft1FBNCG6MQMJiT13%2B1sZt6Y4v7VPINfsqhXIA7rqb0gmxXbsB%2BLggGUWzf0IAm%2FC3QI2Xxha%2Bo0Nz1IxydiAdjfyHJ2IQVOeKeUxFjic5PxA8TGa7TerIBWa0bgvwzwj%2FX%2F8%2B6LxfITdLWxsY1rjW4TxrPBm%2FUvb89PctAtX2Afwy%2B5LX5Zx0AhDeidaDULCzAp8ZurBPQw%2FBHA9Jf4dhn75Rly%2Bcdb7w%2BFLsues4nAWEehCZjByK31jRt6irN6b9%2FmirsBrnitz9lCnW2MT4eCteUb5dX5nrkCO%2FntQ9lzfgnpgOeijh%2B7cjdZKoX4281RssJiW%2Fl6VxISAYhx3iVpo1dmcNEbreLlEYsWWHVsSc1ih6%2BE003UFsug2T2COxzu0X9ix3tttaPLbZGgdY9gXTzs6xGhOe4S3MEUH7w6fIKyNh24FnWCrQkRvLVmvJYHbZhZfRB3Thh2swrf7gceMPHbCQXrc%2F1eGJy0kwsf0lzEOZty5UvLv1Coz9xY2hcSH9fGMIm6y9QGOqUBWyAWzHQqIP2Z6tLHAhhxVNzSPo6UFBdxNJd7mJyB4%2BQcyYT7rR4OZ4DZPKBrFel8f960TytgJyrplb9OT5wGRJ7BVqspnTGV7abqBEqfIh32Pia1OmO8EVBiNu2BI6FrEztLx%2FjKmHoM9%2B9FeCXTpiTq%2Fycj6Oqlo9D8a77ptUjxsU3RH7Gl9q3rkxb8D%2FwL8QGK9tAg3sjLuQ%2Bjv5nT9sgzI8Z5&X-Amz-Signature=9d30dc1f57d988e34496bf4ae7ffea2990aaa350ca24ba24491833bf460e9aec&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4667IGSVGWH%2F20260829%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260829T155735Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJ7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIEUN%2FFmEcKysWkoHE0A6ILS7JKpfr1gKey39tuFSqNf3AiEAyTLZcWtgr2F9V7THWKJKHx1lFdtybEu7Ro%2BxhbwhOewq%2FwMIZhAAGgw2Mzc0MjMxODM4MDUiDKXOOz5wkB17677RgSrcAz3fi9D6X9%2BvGbXcBwIYS4BderfMPNmv3keEWoiicZx5UWM8sI8YkMSkmGE1eMF6gx1Ng3FTkbfRw1rpQDWJy3HZCME%2Fzmis46e%2FmxeK2%2FzOWmB7Q4mkft1FBNCG6MQMJiT13%2B1sZt6Y4v7VPINfsqhXIA7rqb0gmxXbsB%2BLggGUWzf0IAm%2FC3QI2Xxha%2Bo0Nz1IxydiAdjfyHJ2IQVOeKeUxFjic5PxA8TGa7TerIBWa0bgvwzwj%2FX%2F8%2B6LxfITdLWxsY1rjW4TxrPBm%2FUvb89PctAtX2Afwy%2B5LX5Zx0AhDeidaDULCzAp8ZurBPQw%2FBHA9Jf4dhn75Rly%2Bcdb7w%2BFLsues4nAWEehCZjByK31jRt6irN6b9%2FmirsBrnitz9lCnW2MT4eCteUb5dX5nrkCO%2FntQ9lzfgnpgOeijh%2B7cjdZKoX4281RssJiW%2Fl6VxISAYhx3iVpo1dmcNEbreLlEYsWWHVsSc1ih6%2BE003UFsug2T2COxzu0X9ix3tttaPLbZGgdY9gXTzs6xGhOe4S3MEUH7w6fIKyNh24FnWCrQkRvLVmvJYHbZhZfRB3Thh2swrf7gceMPHbCQXrc%2F1eGJy0kwsf0lzEOZty5UvLv1Coz9xY2hcSH9fGMIm6y9QGOqUBWyAWzHQqIP2Z6tLHAhhxVNzSPo6UFBdxNJd7mJyB4%2BQcyYT7rR4OZ4DZPKBrFel8f960TytgJyrplb9OT5wGRJ7BVqspnTGV7abqBEqfIh32Pia1OmO8EVBiNu2BI6FrEztLx%2FjKmHoM9%2B9FeCXTpiTq%2Fycj6Oqlo9D8a77ptUjxsU3RH7Gl9q3rkxb8D%2FwL8QGK9tAg3sjLuQ%2Bjv5nT9sgzI8Z5&X-Amz-Signature=2034a6e9f9571273a877af422018e99ece944f9e58a214713b497630a8f89fbe&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

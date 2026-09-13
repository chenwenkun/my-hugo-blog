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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466QBKXVQNM%2F20260913%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260913T195847Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEAoaCXVzLXdlc3QtMiJGMEQCIH2BW6D8A81vFY8bZgTdNhkoChsI1eDcWYMKBr7SJRDOAiA%2BJBV%2BHrK%2BCLPQ4vTQPDI4UXdlTXJ5NFMETItXPYnQXiqIBAjT%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMtZXGqiGCGh6BEqFbKtwDE9%2BlNaFUZgY8gLRN8Ytdqog7Mmc7QsUo7O9eAyC5NL2U1%2BG05GjFljHzbtGS0Weuo5wMe5BBDGrWqNVN%2B0eey7EnwlHq%2ByaiNWoR93hJ5GljWFljLqZQ%2B%2FwtRinih33YafUcgQp1xuebxWMIlFZmqEVzOVYfHIflY5XP9blz9mGyDstI0KczXL7I68cHmzlBblGP8TBfWo2b1jAkHAj%2BNMFH45AuTji1A55tLPpAj%2B%2FJFojuGC0oiSG1g9U8QkhfwjraAV57s%2FBkZ5P7Na6JYW1wOi%2FeavNmLMfnx020P50fv8gQuYe1NuvR9ogSuYZY7vtsUjzHuY59kXnT0vMwz%2FEkQb8XzoSi1DKihaosVPtYRbbJtJFenIYXn3v9Z5C%2Bjwy0iNHe6pWu8gONXzqahH4%2Flkefj6EfZ3VG274J3x4BPkOd8LyJYLjMW%2FhwFK1kwLx%2BZ7706Om1askhq5uH6%2F0WG5xUqNfJ8Czn8Qs5rW%2BrEWW5TNZsxAtfH%2Fao0PbhR6BsJ2x9FWmz6wD2jekd3Fi1pv0gDQi2OqhasxBfac1HN9BbDqSDR3U6URJAP28%2BSoJycmiYrnXKs2sU9pEJedWs7T5KNlRlrmkHxzBrIxytBG8YPBgdfjbfezIw3syb1QY6pgH8HxZ0mhcQwxaG92njpgRWodu0IsNNHo2wCK%2BWHiwy7b4OWRM9iQkkmRe2RUFvodARWdkuEGO0lXUc1P0SqEL%2BmLeb5cbQMTufKYDF%2Ff4zkeAuo2axIodAxqcS8kKh2D84T65E6HJq97c1TfBgUmPLAcS0ystvjJ%2B415B0IfT0CVmNFhIywdwn07OCj1vSxrqU8sy5f5kxqXt2icimwq0b3N4OP2pf&X-Amz-Signature=fcb04b7bde2c8f6476ed906333312562d45bcba61dd566fc7b49a753f38b6c8c&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466QBKXVQNM%2F20260913%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260913T195848Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEAoaCXVzLXdlc3QtMiJGMEQCIH2BW6D8A81vFY8bZgTdNhkoChsI1eDcWYMKBr7SJRDOAiA%2BJBV%2BHrK%2BCLPQ4vTQPDI4UXdlTXJ5NFMETItXPYnQXiqIBAjT%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMtZXGqiGCGh6BEqFbKtwDE9%2BlNaFUZgY8gLRN8Ytdqog7Mmc7QsUo7O9eAyC5NL2U1%2BG05GjFljHzbtGS0Weuo5wMe5BBDGrWqNVN%2B0eey7EnwlHq%2ByaiNWoR93hJ5GljWFljLqZQ%2B%2FwtRinih33YafUcgQp1xuebxWMIlFZmqEVzOVYfHIflY5XP9blz9mGyDstI0KczXL7I68cHmzlBblGP8TBfWo2b1jAkHAj%2BNMFH45AuTji1A55tLPpAj%2B%2FJFojuGC0oiSG1g9U8QkhfwjraAV57s%2FBkZ5P7Na6JYW1wOi%2FeavNmLMfnx020P50fv8gQuYe1NuvR9ogSuYZY7vtsUjzHuY59kXnT0vMwz%2FEkQb8XzoSi1DKihaosVPtYRbbJtJFenIYXn3v9Z5C%2Bjwy0iNHe6pWu8gONXzqahH4%2Flkefj6EfZ3VG274J3x4BPkOd8LyJYLjMW%2FhwFK1kwLx%2BZ7706Om1askhq5uH6%2F0WG5xUqNfJ8Czn8Qs5rW%2BrEWW5TNZsxAtfH%2Fao0PbhR6BsJ2x9FWmz6wD2jekd3Fi1pv0gDQi2OqhasxBfac1HN9BbDqSDR3U6URJAP28%2BSoJycmiYrnXKs2sU9pEJedWs7T5KNlRlrmkHxzBrIxytBG8YPBgdfjbfezIw3syb1QY6pgH8HxZ0mhcQwxaG92njpgRWodu0IsNNHo2wCK%2BWHiwy7b4OWRM9iQkkmRe2RUFvodARWdkuEGO0lXUc1P0SqEL%2BmLeb5cbQMTufKYDF%2Ff4zkeAuo2axIodAxqcS8kKh2D84T65E6HJq97c1TfBgUmPLAcS0ystvjJ%2B415B0IfT0CVmNFhIywdwn07OCj1vSxrqU8sy5f5kxqXt2icimwq0b3N4OP2pf&X-Amz-Signature=f3ddcb02b46ca0d84233b40b646648bb668f17d7fc70578ab508ba0db9829b00&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

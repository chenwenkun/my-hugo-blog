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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466T2RWNQ3N%2F20260818%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260818T122205Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQCH7oTKb4rAVHyMZb1fY8QaKa0nmKXCg5Qyj0WRfHhwqQIgcvKP79X7fX%2Fvfdgy8DwgfbiAmAjVuc1jnrArFcNfqEwq%2FwMIXBAAGgw2Mzc0MjMxODM4MDUiDEk7o%2BoBgcLIjuqWjSrcA%2BadTLqa7vlNvBC4H3%2FOeph2Dz6yKbh7OC9K7%2F4WxeXxyq9xsbZgVEE3XzdU92JT9s6lfMiklzJwCkqHJRljcayHMmW%2Blfa5fTFwr0Jh3UB2dVY%2FbRznor6Qum8qeN7MiB%2BGkQ8znDHAdS%2BBrats1bgeJVqipCPT3vhODSCLHAwW5JEB6Q0M0A9MvKWHrN5LcH1H7NNR7DbbL5okaJbhw55wMTo%2FVYJxhDRlPsekRIxDJyhgRt10RgzQWwstbH%2BkqmipH%2Fc7wGeD%2B0qZP3RXbR%2Bn%2F57Y%2FnLFv6GwCSAN6TIIe4QNKNOVl3qMYTsa6dHb4J9u%2BOFOCBmCfzFCJLVDwF3Pv9MQ6TdQGMm2JrMxzFMa%2BDhyAW6lZ12V8fBAPStNr5a%2Fk%2FdfWA0gbi66GrL0Q0pKhxam65QdCa98uncZ%2F8aCo4o1QO8VBnTReZnqVzpmUG2xEDxCafJecRzwm2YRgK%2BLEFCv5LQzyT9VUu3atJ%2FEp2TYRFJfzCXdfxRvGxTy%2F9Ngxwcc4QbCoif%2FYQg899CBNyBU0GF8ozmWmV%2FbtPD7AdNO9h45CshEt%2Bu4GQVjDrBxG2wk0Q9AKu2qQLB5kzCJB7%2F8e6KjvqDJyoXtLhEzaV8jo779eSHMuPzOMJH8kNQGOqUB1OiC%2F5MO3BAVBIks8pfZal%2FNAZh6p5cSmQgCVlOEHQxEUrBgCd6L497DQBJE0VEqpJzcmWq3fiskRUmMjpufyKAke0xEA7E4i9E%2BLkv0e9sNJwH8FV6cHdV9W0GHtMTm%2F%2BJar8ZjG581e3eEY532R6Hfh8T55McDMj9wwUpJtWFyGdns6Q8y%2FsjgFORNCN7RjHQwujjj9PSLXonji940d8g1LZEZ&X-Amz-Signature=daf879effd4c8b15a9d99d5266ddfcb2f78a6ca6ba8d8dd99c764f8ac247dea7&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466T2RWNQ3N%2F20260818%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260818T122205Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQCH7oTKb4rAVHyMZb1fY8QaKa0nmKXCg5Qyj0WRfHhwqQIgcvKP79X7fX%2Fvfdgy8DwgfbiAmAjVuc1jnrArFcNfqEwq%2FwMIXBAAGgw2Mzc0MjMxODM4MDUiDEk7o%2BoBgcLIjuqWjSrcA%2BadTLqa7vlNvBC4H3%2FOeph2Dz6yKbh7OC9K7%2F4WxeXxyq9xsbZgVEE3XzdU92JT9s6lfMiklzJwCkqHJRljcayHMmW%2Blfa5fTFwr0Jh3UB2dVY%2FbRznor6Qum8qeN7MiB%2BGkQ8znDHAdS%2BBrats1bgeJVqipCPT3vhODSCLHAwW5JEB6Q0M0A9MvKWHrN5LcH1H7NNR7DbbL5okaJbhw55wMTo%2FVYJxhDRlPsekRIxDJyhgRt10RgzQWwstbH%2BkqmipH%2Fc7wGeD%2B0qZP3RXbR%2Bn%2F57Y%2FnLFv6GwCSAN6TIIe4QNKNOVl3qMYTsa6dHb4J9u%2BOFOCBmCfzFCJLVDwF3Pv9MQ6TdQGMm2JrMxzFMa%2BDhyAW6lZ12V8fBAPStNr5a%2Fk%2FdfWA0gbi66GrL0Q0pKhxam65QdCa98uncZ%2F8aCo4o1QO8VBnTReZnqVzpmUG2xEDxCafJecRzwm2YRgK%2BLEFCv5LQzyT9VUu3atJ%2FEp2TYRFJfzCXdfxRvGxTy%2F9Ngxwcc4QbCoif%2FYQg899CBNyBU0GF8ozmWmV%2FbtPD7AdNO9h45CshEt%2Bu4GQVjDrBxG2wk0Q9AKu2qQLB5kzCJB7%2F8e6KjvqDJyoXtLhEzaV8jo779eSHMuPzOMJH8kNQGOqUB1OiC%2F5MO3BAVBIks8pfZal%2FNAZh6p5cSmQgCVlOEHQxEUrBgCd6L497DQBJE0VEqpJzcmWq3fiskRUmMjpufyKAke0xEA7E4i9E%2BLkv0e9sNJwH8FV6cHdV9W0GHtMTm%2F%2BJar8ZjG581e3eEY532R6Hfh8T55McDMj9wwUpJtWFyGdns6Q8y%2FsjgFORNCN7RjHQwujjj9PSLXonji940d8g1LZEZ&X-Amz-Signature=2989c5ab6e16c106eb4453bf3ad2432b556e827d9d533501138af8897eb3acfb&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB46655AYMPTU%2F20260906%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260906T014942Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEFIaCXVzLXdlc3QtMiJGMEQCIA7D1fnHanwAZMMFtPEBNPyd1HkcKv7TZmtlcYsK%2BTAAAiBs3e0HK7WvDtdPeEewZl6pYxu7aPZMFCMkrymGHgfatSr%2FAwgaEAAaDDYzNzQyMzE4MzgwNSIME3P3dawS4cDo%2FDZSKtwDYfZCn%2FmCNizSNCVFgrPBIFVACwEL8rfhRzJncl8f3bzE8aN2N8LL6tpNvSTOguruGJliNJlv4q0fYqiSTVDsCnFyYKT3p606ukEJF2SuDY6PUnePb7NcoJudI4TFOIfc7GoDn2IFbTMprVY%2FYeLS2YX7rZvEPsRvTZrMu%2FdQby1u2ChvyU%2FO9DxiQGIYEYnZSsdUThP36%2BKi%2FTh7YSweB8KvVTDQA6Fza3zXdEIwcjLfp1Tm4esZL6iEWDWGXi8t9o1VudAopTTBotJgHP5oBucxzfmg0UMxe%2B80AFRVLULH4ekSAHw0w6771rHAHTbzoSsgPYeKcVcEu%2BEIfP9sTPhpkFHQxyUJrLCt3w6sViG5UYs4fAhsY2K2TLVH0GjpVmMku7JIiePOOEX9A7mkgyNQn9i%2BC6w7CIzpjuI477MN24Wq3g5YLJ2PAXgaOIZTFq7S40wTESAwclfR7P0NAXm5lj8bVlUdqfV0yIlFuJc0JUVxfQb3twTObtdUV79kQgsKmBuSaqh0pBKb%2FCcevIsls%2FNwJKkEeLM4stPiHL2BiGosX92aj7gB%2FyDkNOecYshubWKL6mWKRJsX3ya7k%2FajZi0mpRDAU1hcxrFbZzpF28qfMG50hxm5kLAwhYbz1AY6pgGGBUlt8z7To7EQwrmHWaBoufw%2B9ebKmu17GMdkOwubFIt%2B29wrbiJLh4my4zLzhfadNytOsFqvHKXW3xOc%2FViSLtagTL%2BGbOkTqgxFEgGcZfsRF%2BtodQfLa8DUGMATjoNDlx0x5IiWsdweMJeBe1xOwJLxfEnfYChe3BID9qX%2BOopA84OzTV6ig9lT017E%2BBCbNBoZ4Qs6CWWN4jvtLtmO%2BTOWWxtJ&X-Amz-Signature=49d090559564dabfffe597b472b74aaad5595c36598cb0ccd2609e03a36ed056&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB46655AYMPTU%2F20260906%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260906T014943Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEFIaCXVzLXdlc3QtMiJGMEQCIA7D1fnHanwAZMMFtPEBNPyd1HkcKv7TZmtlcYsK%2BTAAAiBs3e0HK7WvDtdPeEewZl6pYxu7aPZMFCMkrymGHgfatSr%2FAwgaEAAaDDYzNzQyMzE4MzgwNSIME3P3dawS4cDo%2FDZSKtwDYfZCn%2FmCNizSNCVFgrPBIFVACwEL8rfhRzJncl8f3bzE8aN2N8LL6tpNvSTOguruGJliNJlv4q0fYqiSTVDsCnFyYKT3p606ukEJF2SuDY6PUnePb7NcoJudI4TFOIfc7GoDn2IFbTMprVY%2FYeLS2YX7rZvEPsRvTZrMu%2FdQby1u2ChvyU%2FO9DxiQGIYEYnZSsdUThP36%2BKi%2FTh7YSweB8KvVTDQA6Fza3zXdEIwcjLfp1Tm4esZL6iEWDWGXi8t9o1VudAopTTBotJgHP5oBucxzfmg0UMxe%2B80AFRVLULH4ekSAHw0w6771rHAHTbzoSsgPYeKcVcEu%2BEIfP9sTPhpkFHQxyUJrLCt3w6sViG5UYs4fAhsY2K2TLVH0GjpVmMku7JIiePOOEX9A7mkgyNQn9i%2BC6w7CIzpjuI477MN24Wq3g5YLJ2PAXgaOIZTFq7S40wTESAwclfR7P0NAXm5lj8bVlUdqfV0yIlFuJc0JUVxfQb3twTObtdUV79kQgsKmBuSaqh0pBKb%2FCcevIsls%2FNwJKkEeLM4stPiHL2BiGosX92aj7gB%2FyDkNOecYshubWKL6mWKRJsX3ya7k%2FajZi0mpRDAU1hcxrFbZzpF28qfMG50hxm5kLAwhYbz1AY6pgGGBUlt8z7To7EQwrmHWaBoufw%2B9ebKmu17GMdkOwubFIt%2B29wrbiJLh4my4zLzhfadNytOsFqvHKXW3xOc%2FViSLtagTL%2BGbOkTqgxFEgGcZfsRF%2BtodQfLa8DUGMATjoNDlx0x5IiWsdweMJeBe1xOwJLxfEnfYChe3BID9qX%2BOopA84OzTV6ig9lT017E%2BBCbNBoZ4Qs6CWWN4jvtLtmO%2BTOWWxtJ&X-Amz-Signature=8537315291007e407d89ecf2f10be4613a34e1925856181ddb2da8aad794f21d&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466RYNWX4V5%2F20260919%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260919T020919Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEIr%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQC6bgc%2FaPqKa0tz78%2Baumad6MRccNF2GrlyMNlv4oCHBQIhAP%2BYHpFrMgxvTEUEJMrWUY%2BgqNgJNqiObeGWIBH4qJICKv8DCFMQABoMNjM3NDIzMTgzODA1Igy6N8N2X9sL0Gp7dJYq3AOiyEoV3kO7%2BR0P5JEOR3FRgDSBc7pKMyFgtYGUFWUpWmxy0g0mOVEt6%2BmmTVoxHR2ABriCiTmm1%2BB5tJs363gRmZwN6o%2BsMpTj9kY5vlIQsmn9v3X9e9OaLn%2BonWTfEoC3zgmjSKZTQ5KirxxOzwbukEC9h8m6D%2FWL7OqnbZuxkD98O%2BxHuEPVOOnQrKnMLnuYXXfM3kdYHsJcnRYQWYO3S%2FZacGrjYzGzEPheH6OguyQ%2B5pyfD7sN62Lr7rG6vEQN9CONM1WWj%2B5qeYM9%2FfC628q7Z1j4kD8Nh7R2zgZ%2BjDWcTHl%2B%2BWgDCPa%2FPQK1mpkTg%2FfAhOULtOWmwuuK%2B29M6dv8qYIGoGwEWkBwUlQYjYVt0kJOEyexpfriqsZSWKN%2FSPMwpq%2Fqjc07Usm2m5VQyABmPq3tOe0hTSas5EnQfgWyOY8N3L3bbHf94lbeI84VMYcRQbYOzvIFHPf%2BGzGDFQR4olc%2FeaO3gfAxrk6Y4toPCCqMFWQcYYj6DAiK66z3GL45pxw%2BXRWZgn948wtASjCuyXjTxQnUC5yq1rmmu5R3Lkn2Axvom0HRrbKL5R9rJiqWwOZhlfm%2BUSul2%2Fq%2FQG89%2Fr2dLehB6T55OV7ARZkk8Lno6jp9STFrYzCTzLfVBjqkAS%2BoWlE344HjK18A3pE%2FjK%2BvHRJs66i1L7PdHBtBT2Ak8iXMv4wLZ3Ly12ZGAE1Ox7V7n56THgMoQhEiRhV%2FgVo0VfakPtaNQIBWrflhtzJF%2BeHbJBtwhlzFC8G%2B4sVKlQCA3D3zvx5ZrU5%2F0npLJo%2F0SUY42DclhM%2BGIFxCQS3GrmguhAYOfbrDuG0Fh8PrT8rmQzgQE%2FfXG4ICk2Ss9f6bz4Em&X-Amz-Signature=3bb132b12bf39c636bdfc0a872cfb094c78a685677a65995507aa87228a47641&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466RYNWX4V5%2F20260919%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260919T020919Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEIr%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQC6bgc%2FaPqKa0tz78%2Baumad6MRccNF2GrlyMNlv4oCHBQIhAP%2BYHpFrMgxvTEUEJMrWUY%2BgqNgJNqiObeGWIBH4qJICKv8DCFMQABoMNjM3NDIzMTgzODA1Igy6N8N2X9sL0Gp7dJYq3AOiyEoV3kO7%2BR0P5JEOR3FRgDSBc7pKMyFgtYGUFWUpWmxy0g0mOVEt6%2BmmTVoxHR2ABriCiTmm1%2BB5tJs363gRmZwN6o%2BsMpTj9kY5vlIQsmn9v3X9e9OaLn%2BonWTfEoC3zgmjSKZTQ5KirxxOzwbukEC9h8m6D%2FWL7OqnbZuxkD98O%2BxHuEPVOOnQrKnMLnuYXXfM3kdYHsJcnRYQWYO3S%2FZacGrjYzGzEPheH6OguyQ%2B5pyfD7sN62Lr7rG6vEQN9CONM1WWj%2B5qeYM9%2FfC628q7Z1j4kD8Nh7R2zgZ%2BjDWcTHl%2B%2BWgDCPa%2FPQK1mpkTg%2FfAhOULtOWmwuuK%2B29M6dv8qYIGoGwEWkBwUlQYjYVt0kJOEyexpfriqsZSWKN%2FSPMwpq%2Fqjc07Usm2m5VQyABmPq3tOe0hTSas5EnQfgWyOY8N3L3bbHf94lbeI84VMYcRQbYOzvIFHPf%2BGzGDFQR4olc%2FeaO3gfAxrk6Y4toPCCqMFWQcYYj6DAiK66z3GL45pxw%2BXRWZgn948wtASjCuyXjTxQnUC5yq1rmmu5R3Lkn2Axvom0HRrbKL5R9rJiqWwOZhlfm%2BUSul2%2Fq%2FQG89%2Fr2dLehB6T55OV7ARZkk8Lno6jp9STFrYzCTzLfVBjqkAS%2BoWlE344HjK18A3pE%2FjK%2BvHRJs66i1L7PdHBtBT2Ak8iXMv4wLZ3Ly12ZGAE1Ox7V7n56THgMoQhEiRhV%2FgVo0VfakPtaNQIBWrflhtzJF%2BeHbJBtwhlzFC8G%2B4sVKlQCA3D3zvx5ZrU5%2F0npLJo%2F0SUY42DclhM%2BGIFxCQS3GrmguhAYOfbrDuG0Fh8PrT8rmQzgQE%2FfXG4ICk2Ss9f6bz4Em&X-Amz-Signature=65d9e291f1292d87f411327e929f800d47121c8d3314b34590239de2939a6885&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

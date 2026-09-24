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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466ZDZO6L5T%2F20260924%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260924T160545Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEA4aCXVzLXdlc3QtMiJIMEYCIQDHBE0BpRvoUVEHGy7Y8jfUlygpo%2BUADzDFq4vftpt9wAIhAMJqPASvaSd7dqsgKcN0laAKsl0V8A1SmugxkGeT8B3xKogECNf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgwcK6iaRQyyJ8R5Wm0q3AMcvdXrY06UGzjo6R9cJJ1Zm5yEx9gzPwUtchPThTTxslbsJ7hW00PJGDyTWeB6Oxx8U3wcEW1geqajYNi1Mx8dd03uIkWuyxX75lnYE%2FliAOXJ7WElDaf05Tp6AU0seVtBIg7WtSN9nqbJ99Du45OGwMtbMB0gqIlDULtjLNr0tDoRyppSq1bLD5WFToxyWxYDUlgTnAi3P1ZgwqVbZkBozm4R2X2MwUqQPrIt3q7%2BlwvXHJhVg6c%2BoIdsz99942LLBobX35csHa5qLisY92f6kluPzbBdIHE0sxFs8DRtMiRQLWovGs4M8xgR9SVre5aeC9jPx27cSjF%2FT5M%2BAn09CAQUzLVJc0JPWd%2FICB2fRFfaUeupWaHubblKUSbC0KJIDuQEopUZhrcyMGsykhHpSq2rh99AkMsD5NNgeOS%2Bj5fFb4RAIdQh%2Bhu7TBPLkTBQNtxJuENpnDLIYUNjBosiN5WPaEV5POMQEnuLhKoKo73mpYyASIwl37%2FYYBrXtbFqrfGjVLyneIP2NQag1d4NHrx5AiWydyP80IJwyyuQBjHShhuDUbAlFiwggfBnKRxumG%2FHowT4%2B8fh6ukSv9L1dvGCaIBm3BmBhRlUr45GEETNFyqOzD0TRbGD5DD%2F4NTVBjqkAa8a5dle6VwFsUUaifylXXS1swLQM0h8ncugYo2h2Ijmou%2BWZP5BxbkmgJFd9gI0y2NxYvj%2BkQvcQRAprseycfsMhkOUSUJT80uG%2Bj6hjEL8IRk3bomy4CM4BrRKoHIfXMlVkwO7LLjbT4bHVo223QcUsTzswvwChwVew8iRYuvidK0M%2BxyxIyUtl9vqCZ61WEXqgMCH7l20LTm7YfXu23A7KM5L&X-Amz-Signature=0139c48b82e14b392391460f86bd0e06339dccd607ff83290b6d12c2c9d30115&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466ZDZO6L5T%2F20260924%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260924T160545Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEA4aCXVzLXdlc3QtMiJIMEYCIQDHBE0BpRvoUVEHGy7Y8jfUlygpo%2BUADzDFq4vftpt9wAIhAMJqPASvaSd7dqsgKcN0laAKsl0V8A1SmugxkGeT8B3xKogECNf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgwcK6iaRQyyJ8R5Wm0q3AMcvdXrY06UGzjo6R9cJJ1Zm5yEx9gzPwUtchPThTTxslbsJ7hW00PJGDyTWeB6Oxx8U3wcEW1geqajYNi1Mx8dd03uIkWuyxX75lnYE%2FliAOXJ7WElDaf05Tp6AU0seVtBIg7WtSN9nqbJ99Du45OGwMtbMB0gqIlDULtjLNr0tDoRyppSq1bLD5WFToxyWxYDUlgTnAi3P1ZgwqVbZkBozm4R2X2MwUqQPrIt3q7%2BlwvXHJhVg6c%2BoIdsz99942LLBobX35csHa5qLisY92f6kluPzbBdIHE0sxFs8DRtMiRQLWovGs4M8xgR9SVre5aeC9jPx27cSjF%2FT5M%2BAn09CAQUzLVJc0JPWd%2FICB2fRFfaUeupWaHubblKUSbC0KJIDuQEopUZhrcyMGsykhHpSq2rh99AkMsD5NNgeOS%2Bj5fFb4RAIdQh%2Bhu7TBPLkTBQNtxJuENpnDLIYUNjBosiN5WPaEV5POMQEnuLhKoKo73mpYyASIwl37%2FYYBrXtbFqrfGjVLyneIP2NQag1d4NHrx5AiWydyP80IJwyyuQBjHShhuDUbAlFiwggfBnKRxumG%2FHowT4%2B8fh6ukSv9L1dvGCaIBm3BmBhRlUr45GEETNFyqOzD0TRbGD5DD%2F4NTVBjqkAa8a5dle6VwFsUUaifylXXS1swLQM0h8ncugYo2h2Ijmou%2BWZP5BxbkmgJFd9gI0y2NxYvj%2BkQvcQRAprseycfsMhkOUSUJT80uG%2Bj6hjEL8IRk3bomy4CM4BrRKoHIfXMlVkwO7LLjbT4bHVo223QcUsTzswvwChwVew8iRYuvidK0M%2BxyxIyUtl9vqCZ61WEXqgMCH7l20LTm7YfXu23A7KM5L&X-Amz-Signature=bd4bcee0405d95f73b932c0b602390a190f77fa054cca97be5eae8ddc8429b52&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

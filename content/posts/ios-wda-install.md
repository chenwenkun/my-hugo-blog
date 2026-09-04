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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4667VM5GL2I%2F20260904%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260904T015816Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjECEaCXVzLXdlc3QtMiJIMEYCIQC0ZGAsbUYYAnECXuyDFvbpHonDaX6PdlOVxRpveLZYLQIhALTTLhHsPLRAeGF1U8%2FDwNV1Xb89a7YI4946CL8%2F5XltKogECOr%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgwKz076D1U0GdlL3Iwq3ANkswbVUbqxB3TLKr1bdX8TVqYSjahs044hSFr88%2BL3EguESijub%2BnIFzvc5GCZE8cyST%2BfpAp8AFBH4nEVXzXUDH8BDw%2F3OLsVufLNRF5TOVtPJ5I5ExQd8hvk4jC6JQc%2B8R0CeDAIm6Lu6m8pSxksGporfkPoCHHB66dpaoY4KK3biTGzXJWPwdcDcxQV4nmOCINOeuQhg16OVhd9Ayny5TBf1rhuIlRz3J4Z%2FKRwbbzLo0cvqUXJ0rFrnvlOhnBMRD%2FgGK5TKEe9xJxMZH4S%2FOYWf7T1Qa6Yinl7Ky4DHiXgGLifYEJ%2BkBeyD1z2hJ1vDJ6UNOg0xmwCZ844n3Rjj7bkZ%2FN5ezUfGZBBPEiN0sFtgcMAaIqswy9TuHSdzfYX9CTJwH7gy1yATZq%2BRyKkX%2FXIuZ9qNLQwOSgxBQQzNZ5ps80vv96V%2BfIYONKAH4Tk17NH%2BFRG9Nq2iA4DFEGWg90BfnEXmnrma%2BEpRbImANMJg5CSTp3kJm6FjNbkLBEkvODdJ5PvYfbWDaZWFzUXJeAStiGm6YXUN38gDhXNUZa%2F%2B16KdybPE5pWJW1mXlvQ%2FM2mDq0l%2Fauf5hUSgFFAzelroMga1axIkMmkEQVgQZMiwfg6hWIvAcbmljC9o%2BjUBjqkARTLwuV%2FjBli2jPt5z%2BHWVbP4kFMwPYzKA9RIvdVh2AOo8wpeZeQYgNVA6V2MmcqY6GojxW4XEIqcwuouBTlsqK%2BiVlVM1gWmH%2FZWE2w3U%2Fdg4nLfs4rSyeQu03VtQjPrjiMWrhtr268OhByuhHzokiyVHMYvSCpW3XcYs1Pgi3a6qjoCg0B3IFnR8BUfWzEsY3QsklTDaPjILLZp3uFjNd0lkQ8&X-Amz-Signature=9bd569c1843dd34e19d52c8c41f9bde4ab4efeb537fcd8f153576a47ffaf6a0e&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4667VM5GL2I%2F20260904%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260904T015816Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjECEaCXVzLXdlc3QtMiJIMEYCIQC0ZGAsbUYYAnECXuyDFvbpHonDaX6PdlOVxRpveLZYLQIhALTTLhHsPLRAeGF1U8%2FDwNV1Xb89a7YI4946CL8%2F5XltKogECOr%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgwKz076D1U0GdlL3Iwq3ANkswbVUbqxB3TLKr1bdX8TVqYSjahs044hSFr88%2BL3EguESijub%2BnIFzvc5GCZE8cyST%2BfpAp8AFBH4nEVXzXUDH8BDw%2F3OLsVufLNRF5TOVtPJ5I5ExQd8hvk4jC6JQc%2B8R0CeDAIm6Lu6m8pSxksGporfkPoCHHB66dpaoY4KK3biTGzXJWPwdcDcxQV4nmOCINOeuQhg16OVhd9Ayny5TBf1rhuIlRz3J4Z%2FKRwbbzLo0cvqUXJ0rFrnvlOhnBMRD%2FgGK5TKEe9xJxMZH4S%2FOYWf7T1Qa6Yinl7Ky4DHiXgGLifYEJ%2BkBeyD1z2hJ1vDJ6UNOg0xmwCZ844n3Rjj7bkZ%2FN5ezUfGZBBPEiN0sFtgcMAaIqswy9TuHSdzfYX9CTJwH7gy1yATZq%2BRyKkX%2FXIuZ9qNLQwOSgxBQQzNZ5ps80vv96V%2BfIYONKAH4Tk17NH%2BFRG9Nq2iA4DFEGWg90BfnEXmnrma%2BEpRbImANMJg5CSTp3kJm6FjNbkLBEkvODdJ5PvYfbWDaZWFzUXJeAStiGm6YXUN38gDhXNUZa%2F%2B16KdybPE5pWJW1mXlvQ%2FM2mDq0l%2Fauf5hUSgFFAzelroMga1axIkMmkEQVgQZMiwfg6hWIvAcbmljC9o%2BjUBjqkARTLwuV%2FjBli2jPt5z%2BHWVbP4kFMwPYzKA9RIvdVh2AOo8wpeZeQYgNVA6V2MmcqY6GojxW4XEIqcwuouBTlsqK%2BiVlVM1gWmH%2FZWE2w3U%2Fdg4nLfs4rSyeQu03VtQjPrjiMWrhtr268OhByuhHzokiyVHMYvSCpW3XcYs1Pgi3a6qjoCg0B3IFnR8BUfWzEsY3QsklTDaPjILLZp3uFjNd0lkQ8&X-Amz-Signature=7d47cb1dc3a7c67f81b1edac6070dbeb2e8d0c174eae3f03ca69e5a0f43c373a&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

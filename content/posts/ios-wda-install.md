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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466Z7VG3KHD%2F20261001%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261001T220613Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEL7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCICoXtLWOOaRDhZle4oaOiglmc5WvmjvJh119wrFQj1ILAiASaNEITHnNrVqambhuUZJ0xAcFfiT4cfTfWajMTA3ZtiqIBAiG%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIME%2FmvOxPbQ8u7l%2FT%2BKtwD5UkhBSY8E%2FkSzol9%2BHzkK71m56RGJCgNwzM75yOAYDGYAAzpsxrV6S0o6RNS%2F8qunUGPNiEP1%2BwA1EGmg66%2FJ0k4XHLLrcsO4fgh9KB%2FViLkuLRT9ENHer2L7mP1DtekPhMJ4ylY0to6f%2BZhobwXuE86Sm%2FXhlFBhy4Za2hsMOVd5pkrRFXzzc%2B7i7ED1cgpTDpHQbJPSWffGdUnh%2Fv3vrgkpkk4mFdckxnR96FGzKWknGsEOVFA4j%2BtNE%2BkIL96mcXzkxxQC645AGvHDQ0sqjYYp1h2225QpiBtN0jb0OK6Gnh%2BP4NXJwx7mlXVTeIo8cL%2BmpXYSO7Bwq7vk8uCh2uwWWZc7uaZvDnNGampq5GeiWAPB2s9YBQvMwWkGhO97mfEQ8MgvJCUuVozzEcrlT32WrUbXj7gaRAcr%2B9fdsonJpUnbbFEGRKbuC5%2BUF6aRbucnM2rxdWtKg28pMtWUoeUvZm19AqZOxXyp6p5rXD8vrYU2PebgI6Vay6dVz3M3Iy0UrsaC3wShRELxKYib9eZAjLtWi3BjT559TGXlyjt%2FPycJ3IgD7yLkRzMUvD3NTij%2BNxMWs6jpIX5GzHKS%2FP%2FcZDYyYB2%2BjRjfu5d%2FZq4s%2F7Cc4840GiKQzUw%2FaD71QY6pgHvgFDfVLphi%2BjKVqY%2FAy1t1w3jnfzdBK%2FbQivLeFgYywI6oPqoLLkTr2SKJSvwGrfIbx6tOqmD29vQ%2F8Fa4xviNsnOQ297LG9VNf%2BMr%2BUeigENzW%2BRujbkh9EsxfAZe%2BiLdE9mpZyCPx%2BEEShXn7%2FYpmCT3RZP392Yq99m5bwlVZ%2FAhDpxZpdhhKvU3wPfeDneKRsJld2ylCHfvgwz3c%2FqgkYvvE9d&X-Amz-Signature=088020e3ae10d96e28460c88eae4564c651ffb4c4e931bec6215c9b5868fcf16&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466Z7VG3KHD%2F20261001%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261001T220613Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEL7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCICoXtLWOOaRDhZle4oaOiglmc5WvmjvJh119wrFQj1ILAiASaNEITHnNrVqambhuUZJ0xAcFfiT4cfTfWajMTA3ZtiqIBAiG%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIME%2FmvOxPbQ8u7l%2FT%2BKtwD5UkhBSY8E%2FkSzol9%2BHzkK71m56RGJCgNwzM75yOAYDGYAAzpsxrV6S0o6RNS%2F8qunUGPNiEP1%2BwA1EGmg66%2FJ0k4XHLLrcsO4fgh9KB%2FViLkuLRT9ENHer2L7mP1DtekPhMJ4ylY0to6f%2BZhobwXuE86Sm%2FXhlFBhy4Za2hsMOVd5pkrRFXzzc%2B7i7ED1cgpTDpHQbJPSWffGdUnh%2Fv3vrgkpkk4mFdckxnR96FGzKWknGsEOVFA4j%2BtNE%2BkIL96mcXzkxxQC645AGvHDQ0sqjYYp1h2225QpiBtN0jb0OK6Gnh%2BP4NXJwx7mlXVTeIo8cL%2BmpXYSO7Bwq7vk8uCh2uwWWZc7uaZvDnNGampq5GeiWAPB2s9YBQvMwWkGhO97mfEQ8MgvJCUuVozzEcrlT32WrUbXj7gaRAcr%2B9fdsonJpUnbbFEGRKbuC5%2BUF6aRbucnM2rxdWtKg28pMtWUoeUvZm19AqZOxXyp6p5rXD8vrYU2PebgI6Vay6dVz3M3Iy0UrsaC3wShRELxKYib9eZAjLtWi3BjT559TGXlyjt%2FPycJ3IgD7yLkRzMUvD3NTij%2BNxMWs6jpIX5GzHKS%2FP%2FcZDYyYB2%2BjRjfu5d%2FZq4s%2F7Cc4840GiKQzUw%2FaD71QY6pgHvgFDfVLphi%2BjKVqY%2FAy1t1w3jnfzdBK%2FbQivLeFgYywI6oPqoLLkTr2SKJSvwGrfIbx6tOqmD29vQ%2F8Fa4xviNsnOQ297LG9VNf%2BMr%2BUeigENzW%2BRujbkh9EsxfAZe%2BiLdE9mpZyCPx%2BEEShXn7%2FYpmCT3RZP392Yq99m5bwlVZ%2FAhDpxZpdhhKvU3wPfeDneKRsJld2ylCHfvgwz3c%2FqgkYvvE9d&X-Amz-Signature=b3a621bfc60b86d876310c05f302ff2a421d1c48d9fc8ec7dca71cabf4959ff2&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

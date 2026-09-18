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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4662IUH3HYN%2F20260918%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260918T020517Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEHIaCXVzLXdlc3QtMiJHMEUCIQCIMnHWweNF6GJTzmCsVSjuvsUlAa71rkDPa2BNkhdoNQIgbUcWP7Z7iYizIlw6E3ulsPag%2Fvtqrj%2BA6a%2FhUDqT75sq%2FwMIOxAAGgw2Mzc0MjMxODM4MDUiDJITfAr5F9IZJcx4zyrcA8x%2BVR7JVcpcyr1UcerHs5fJHnUlmylwokAjyvY9Qs4ye68ArOersDpqpsTrOwd2ghx5QJ0NosSoc%2BGHaZWvpkUVbdauyu8QGKdLkYrF2sLqWcz1etxjIwrlpNEoZ4Nl9P2BhVhAwTavhSN1xck2XLWTsU04hRl4JMw7eOz25pqAhiJXGGpXtm9ifaPdKQeocKBemc0yWiLFMMR1FHSo0iS%2FqH6gdD3%2F%2BtkKxyjZo0FFbVYA8B9EYtI6CcIQ5pyQ1TgO49FkFLD%2FGY2U4KmaqFKRUYc6wc3WHyFY4CsBzsQiEfQhOVYSASLlIGuTRbpnPrqyscr9cQhR0v1%2BO8ZitTp4hvd9yKrOmUsw1%2BnvPw80WNLuxSLXnFzkeilz06rgRTdhN90%2FPbUEuw8BkE%2B7t%2BYRNLebYupHE6X%2Fr3Xem%2BnlsNJuWpYXyCrCyil26miwUvQqp0B5H6YzCvHb05Kj1aQ%2BqaVzrrgrBtEsssjpvzdduEk6POO2I1ZPIH5xCqB8tY8G6P1vqfmVR5tK4K8yh4VzV1QFGZui5raJPPgVd062lSXzFB6YndI%2FbAhzmMK6VcL0rBIBuPZAHUBCpe%2BdZVnRDjqpnZZ6z4mmRubCTt4wSBp7xMXrJF2hr23FMPqzstUGOqUB2kBLdKsEyFENV0plMnlOMh%2Fojs5ktJeL1DbelzkvfdeXXGxy9PKN6UxA3zvxcRMwM39u%2B9Kdj55YdEsbjX%2F8NQ8a0Mbf4M3wPNe9otU7PL5%2BMzoWmZgA0SDE7B6AAz43dRPTlKZ49dOhGpNYDMii%2FqDQzweq7ktCceD0kGpwAHtm1qwrMNQXG6v2LNulDLeernGKPZ2OclRTUZMqGX6k9POwRdi8&X-Amz-Signature=6f2894559a8e32cedd9d435cfed1d3278c3225e0efba0173ed87e23c91937d00&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4662IUH3HYN%2F20260918%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260918T020517Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEHIaCXVzLXdlc3QtMiJHMEUCIQCIMnHWweNF6GJTzmCsVSjuvsUlAa71rkDPa2BNkhdoNQIgbUcWP7Z7iYizIlw6E3ulsPag%2Fvtqrj%2BA6a%2FhUDqT75sq%2FwMIOxAAGgw2Mzc0MjMxODM4MDUiDJITfAr5F9IZJcx4zyrcA8x%2BVR7JVcpcyr1UcerHs5fJHnUlmylwokAjyvY9Qs4ye68ArOersDpqpsTrOwd2ghx5QJ0NosSoc%2BGHaZWvpkUVbdauyu8QGKdLkYrF2sLqWcz1etxjIwrlpNEoZ4Nl9P2BhVhAwTavhSN1xck2XLWTsU04hRl4JMw7eOz25pqAhiJXGGpXtm9ifaPdKQeocKBemc0yWiLFMMR1FHSo0iS%2FqH6gdD3%2F%2BtkKxyjZo0FFbVYA8B9EYtI6CcIQ5pyQ1TgO49FkFLD%2FGY2U4KmaqFKRUYc6wc3WHyFY4CsBzsQiEfQhOVYSASLlIGuTRbpnPrqyscr9cQhR0v1%2BO8ZitTp4hvd9yKrOmUsw1%2BnvPw80WNLuxSLXnFzkeilz06rgRTdhN90%2FPbUEuw8BkE%2B7t%2BYRNLebYupHE6X%2Fr3Xem%2BnlsNJuWpYXyCrCyil26miwUvQqp0B5H6YzCvHb05Kj1aQ%2BqaVzrrgrBtEsssjpvzdduEk6POO2I1ZPIH5xCqB8tY8G6P1vqfmVR5tK4K8yh4VzV1QFGZui5raJPPgVd062lSXzFB6YndI%2FbAhzmMK6VcL0rBIBuPZAHUBCpe%2BdZVnRDjqpnZZ6z4mmRubCTt4wSBp7xMXrJF2hr23FMPqzstUGOqUB2kBLdKsEyFENV0plMnlOMh%2Fojs5ktJeL1DbelzkvfdeXXGxy9PKN6UxA3zvxcRMwM39u%2B9Kdj55YdEsbjX%2F8NQ8a0Mbf4M3wPNe9otU7PL5%2BMzoWmZgA0SDE7B6AAz43dRPTlKZ49dOhGpNYDMii%2FqDQzweq7ktCceD0kGpwAHtm1qwrMNQXG6v2LNulDLeernGKPZ2OclRTUZMqGX6k9POwRdi8&X-Amz-Signature=fc3a455cc455fee3dedbe808f0e73cfc27543cb27147e80d1e9b32d9ac0cf1b7&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

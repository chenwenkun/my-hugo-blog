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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4664RDOUDJE%2F20261110%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261110T135540Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEHUaCXVzLXdlc3QtMiJIMEYCIQDCQnEMEXYzd%2FpIBf7GXTFWFmxgg3tYYRFm%2B%2FmjFuSHLQIhAKeRnSALwRTwtjLnf0IvPL61j9aOJgVvDnPM1wXNf9EVKv8DCD4QABoMNjM3NDIzMTgzODA1IgwY5sXuxGzWxqolvD8q3ANndAN3dXMBDrPDLfNgCZdpf50T3zaYSYBz0bSbnPINYOqs9Dlf8zdKJnLFUnjgvogHFOulxnL%2BPovUGji%2FB4LMP%2FRuoBNKoCld%2BVjXl4Qt%2BpRwNPtbCgexileLPcDKtaXORusSoJ5d5FuRWla%2FHcyVteptV5zsb%2B0FkSVWId1rEvesush3FhcfWZ%2F2zHyqiUn8h49rl6r7%2F4JnYvc0Zlz57zxws7se5OLTyTY%2B4Ne6pFid6R%2FOgqz7N9iT4RN24wVI4xQg8VMjGRyZ7cutnRTdY%2FxWBYdjQjcnAwigD4H75gmQH9yUUQo97xtgtyfs9I%2BvUJry0eQJil362NvKNY9T%2FaJU7k%2Fh5o1NPnGMD%2BAjerceAQ3CWXblUeGUXXEO2%2BxEM2hSB5xRbcwKbLB0yh7d10byTvn4t9gWvmm9GkQfgYDaV8Isa86xCQVAS%2BwnHvbdKXnblh3cjqUvAJ7bqwo5nPXX6LBFht1cjUCkQGnAb5aY4VA7h4BZBz3VIVxwdtDGEzwimFiQ9QfBg2AFDn4xAJ3DOOO8A10BcXg0L4k5KyXwU%2FaKtwVkV%2BVh4odKqPqoxTGAtE96ojJCrvj5qQTD4jOkaBZNYZQ4SEQvbrm5YqLmOfO6uBH%2FQL8IdTCCr8zXBjqkAVKCrZ7AbdnTIaML3ummwhYBVOkCKHydksZlLEJAFAy%2FBoFWV2TXj2kx5u8oFBCUdOTcY8764WZlw9I%2FjlwPaHf9y%2BBgx6%2Bmf9Mv69dShLaYrqzZEO1OmkESAAraBND6SfQ8GYv83C8pTChLfnnSi7Zh%2FVkTXF4uKatBzH3RAmEsrklEFahxt0SDaK2nHkm2Y0pf1jheU0Vh9GJhfhHO2o156Ijw&X-Amz-Signature=beaa7e49ed8c891e24494b3d83c856b977c99c640338b5b22d442c979988a0d8&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4664RDOUDJE%2F20261110%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261110T135540Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEHUaCXVzLXdlc3QtMiJIMEYCIQDCQnEMEXYzd%2FpIBf7GXTFWFmxgg3tYYRFm%2B%2FmjFuSHLQIhAKeRnSALwRTwtjLnf0IvPL61j9aOJgVvDnPM1wXNf9EVKv8DCD4QABoMNjM3NDIzMTgzODA1IgwY5sXuxGzWxqolvD8q3ANndAN3dXMBDrPDLfNgCZdpf50T3zaYSYBz0bSbnPINYOqs9Dlf8zdKJnLFUnjgvogHFOulxnL%2BPovUGji%2FB4LMP%2FRuoBNKoCld%2BVjXl4Qt%2BpRwNPtbCgexileLPcDKtaXORusSoJ5d5FuRWla%2FHcyVteptV5zsb%2B0FkSVWId1rEvesush3FhcfWZ%2F2zHyqiUn8h49rl6r7%2F4JnYvc0Zlz57zxws7se5OLTyTY%2B4Ne6pFid6R%2FOgqz7N9iT4RN24wVI4xQg8VMjGRyZ7cutnRTdY%2FxWBYdjQjcnAwigD4H75gmQH9yUUQo97xtgtyfs9I%2BvUJry0eQJil362NvKNY9T%2FaJU7k%2Fh5o1NPnGMD%2BAjerceAQ3CWXblUeGUXXEO2%2BxEM2hSB5xRbcwKbLB0yh7d10byTvn4t9gWvmm9GkQfgYDaV8Isa86xCQVAS%2BwnHvbdKXnblh3cjqUvAJ7bqwo5nPXX6LBFht1cjUCkQGnAb5aY4VA7h4BZBz3VIVxwdtDGEzwimFiQ9QfBg2AFDn4xAJ3DOOO8A10BcXg0L4k5KyXwU%2FaKtwVkV%2BVh4odKqPqoxTGAtE96ojJCrvj5qQTD4jOkaBZNYZQ4SEQvbrm5YqLmOfO6uBH%2FQL8IdTCCr8zXBjqkAVKCrZ7AbdnTIaML3ummwhYBVOkCKHydksZlLEJAFAy%2FBoFWV2TXj2kx5u8oFBCUdOTcY8764WZlw9I%2FjlwPaHf9y%2BBgx6%2Bmf9Mv69dShLaYrqzZEO1OmkESAAraBND6SfQ8GYv83C8pTChLfnnSi7Zh%2FVkTXF4uKatBzH3RAmEsrklEFahxt0SDaK2nHkm2Y0pf1jheU0Vh9GJhfhHO2o156Ijw&X-Amz-Signature=9c34f31d642d224db0cefe2e59a9890132134d90c08e1e576e93bf70bf22a67d&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

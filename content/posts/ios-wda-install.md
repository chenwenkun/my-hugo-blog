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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4664QVTBXZD%2F20261005%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261005T125757Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEBIaCXVzLXdlc3QtMiJHMEUCIFByywjp7atpzZMTxgCNwW9W6ldgOgHHtB2srSTu0%2BSnAiEApD%2BEJEiDryRVUdDsfuFl5maCbCTjoOzPhgCkBhhentYqiAQI2v%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDC4GnDOgrr7C19Fi3CrcA4934Bhy4eEauk%2FREOqIQ7xqY8%2Beu6AE2sT%2Fp64oXUaslVLw0yDiL3CD4aYzWhnyPhHs4lhd0G68NXgikud278H72UalHlB9Sgh5UzIhrNUzczMmTlF8j5MIGN6Fe9Or3ZqjO6DXPmX3CLA4JIbmdN8bqq66xVe%2Bbm4XqzLYKR48RFoUq5AGaXwwQs1FE4jwrcIqN8meDHCCHLHqYbfcyFomCktD%2Be6GQKqGhUYFdtbiexbzrQOj5KkUky8LObbBOYplssUXp4b4UlcDFuhdFa4UsvUPsJzMyDCZprMVBoc45jem7SSIfUOy5XaxcZMEv8Y1AmQZVAR0JQUhY6fOqD83jG1a6riYo5s6K9vsvVe04iGo9hL80A3hlbSK9%2BMANnCTf2CN6cMJew8zIZEj0CObLEX%2F4lOoPnljSoMHWSzNxkYJ1Nbaw5EowNnPDQL%2BNdTp%2FmF2QBoYqAfSNDryMKpLY2XeKz16cl1%2FwV5WXFSsmC0y5BGCJ5sbtrc6lFzKI8%2B58muC%2FQv3Cbh6sn2ygQHa%2BARbdLR3ojxGrq8JQrAPGG5BS3iPBi9%2Frq7%2BLmkM6LFvJm0yddgkKg95PwR%2Frv%2BWeZ4%2BlqiQChex%2BvZZ%2Fen5ukkLxO93QfBJJFE2MPffjdYGOqUBVJD4mSLRRWOwTrLdTvtcOcES61MMT1bapDu4NqYHJZDQJULSwkZgokmT2Sw72XOfShr9mWRR%2FjizqjycZFFFmh4oCldwEYX8Rh6x6714PAot2598S4SUCRr10v%2B2LEM6%2FpR%2B7ibvZsoRgnf%2BBLIujmZ5OP9htmOr0yJaaizsoUM9falRNiTlo6jNE1D2BYOC2Tg2Hs8LL4VnYOnmV1GGL%2FO%2Fy2Zi&X-Amz-Signature=e2ef4b98c99d9d9543aa8f5a7d05ad2d0e72359d7dc2a635a7b2339ae7f32f5a&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4664QVTBXZD%2F20261005%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261005T125757Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEBIaCXVzLXdlc3QtMiJHMEUCIFByywjp7atpzZMTxgCNwW9W6ldgOgHHtB2srSTu0%2BSnAiEApD%2BEJEiDryRVUdDsfuFl5maCbCTjoOzPhgCkBhhentYqiAQI2v%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDC4GnDOgrr7C19Fi3CrcA4934Bhy4eEauk%2FREOqIQ7xqY8%2Beu6AE2sT%2Fp64oXUaslVLw0yDiL3CD4aYzWhnyPhHs4lhd0G68NXgikud278H72UalHlB9Sgh5UzIhrNUzczMmTlF8j5MIGN6Fe9Or3ZqjO6DXPmX3CLA4JIbmdN8bqq66xVe%2Bbm4XqzLYKR48RFoUq5AGaXwwQs1FE4jwrcIqN8meDHCCHLHqYbfcyFomCktD%2Be6GQKqGhUYFdtbiexbzrQOj5KkUky8LObbBOYplssUXp4b4UlcDFuhdFa4UsvUPsJzMyDCZprMVBoc45jem7SSIfUOy5XaxcZMEv8Y1AmQZVAR0JQUhY6fOqD83jG1a6riYo5s6K9vsvVe04iGo9hL80A3hlbSK9%2BMANnCTf2CN6cMJew8zIZEj0CObLEX%2F4lOoPnljSoMHWSzNxkYJ1Nbaw5EowNnPDQL%2BNdTp%2FmF2QBoYqAfSNDryMKpLY2XeKz16cl1%2FwV5WXFSsmC0y5BGCJ5sbtrc6lFzKI8%2B58muC%2FQv3Cbh6sn2ygQHa%2BARbdLR3ojxGrq8JQrAPGG5BS3iPBi9%2Frq7%2BLmkM6LFvJm0yddgkKg95PwR%2Frv%2BWeZ4%2BlqiQChex%2BvZZ%2Fen5ukkLxO93QfBJJFE2MPffjdYGOqUBVJD4mSLRRWOwTrLdTvtcOcES61MMT1bapDu4NqYHJZDQJULSwkZgokmT2Sw72XOfShr9mWRR%2FjizqjycZFFFmh4oCldwEYX8Rh6x6714PAot2598S4SUCRr10v%2B2LEM6%2FpR%2B7ibvZsoRgnf%2BBLIujmZ5OP9htmOr0yJaaizsoUM9falRNiTlo6jNE1D2BYOC2Tg2Hs8LL4VnYOnmV1GGL%2FO%2Fy2Zi&X-Amz-Signature=bb667047e34a70bcf25c0f97a7c492f87bcef3a991bf5ab7fce4b07d2350d56a&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

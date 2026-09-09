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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466UXIVORAB%2F20260909%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260909T201012Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEKv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIGzGGazFCcpuHx1YljTPXUV9orNkYDuaq5i8TF3o6VqEAiAzw7GnJSF3jjaUEgCNFScoSQi55QHpcNdouO29OBJIXir%2FAwh0EAAaDDYzNzQyMzE4MzgwNSIMHPbctv7Ekk5yD4kzKtwDJ%2F7FhTrYpJ%2FIs4XbtN2L%2BGRusJ98fAd1HL%2BdFkH2PDy%2BouSh3lqplogZRgWF51bBcUo%2BEOsYCIZM%2B%2F3%2BMDyd8tHfOkQoiYzEmV3rfczFDHQVFaop7swkzxJVSlfQgxPfuR%2BRWphNpi%2FAhR6cjO1DjkgFKHSAB9mE%2BkF7JHaiJWkrGRHTAaVhY7QLiCCmbx1G%2FScynjAYgW0jsHA%2FPLgFC7E2CfRu0BMpVqe2KYLkICagdpWMPrpbzh0QmpK%2Fdg1RBX2vDCMH9OBrBwUuCmOKJm1wA6w5VnbEODp83hx0D%2BEyhQ6wYR3MYPuE%2BamFfuTzJ0FMTqueMaYDoeu7B0xzjQLli62Mzr2IAt4Z7%2FclmCc0%2Bu%2B3g4DJW4nV34lzocCflB6uDNBXw2bKP95XU4TZogmM2b9WpqUf5pG1R%2FFjoFvnCNVtSTi1HicCS5vo5KycBHEW8yAwn%2BThwYujltLv6LmIVjQzYWF1MetTS3TokV5vVMnhQQ6FICT%2BMppKPrIsgsXCeRJvCIOwK%2FeFbxWpVIG9jCs%2BHAyXmKPl%2BWmSBDjIssCoXaDRWq9UtsfPfv6307VX4CRVRTm0eDDiK1xX8QyJAnowpoez9f%2FjaCptuf5eEAdgalVHNCBO1LEw%2F%2BCG1QY6pgFnHRSAna8fcjZPa5WQol6%2FSEtYnzwdy%2BsuMCLGni5UpnHzbNT0nfeGuUHNXGBf9j8DEYAX6uxuqoo1OLSVO4Tso7DUVKa2Uj5IFIp830xNmXqXkO8pycNLvV6tqiH4e1Q%2B%2FMu6Ku9nDTnUMbwxffzTjaUK3%2F6cYux28ExAFSdE6zpPRsy8yRstlvovJy4GejJ4%2Fro5qDnxuo0%2FW2WvftWl3BDTgzfE&X-Amz-Signature=2840c99ff488b499cc060bc2df7eeae8cf89f08405976b52135e7b48d283be0f&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466UXIVORAB%2F20260909%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260909T201012Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEKv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIGzGGazFCcpuHx1YljTPXUV9orNkYDuaq5i8TF3o6VqEAiAzw7GnJSF3jjaUEgCNFScoSQi55QHpcNdouO29OBJIXir%2FAwh0EAAaDDYzNzQyMzE4MzgwNSIMHPbctv7Ekk5yD4kzKtwDJ%2F7FhTrYpJ%2FIs4XbtN2L%2BGRusJ98fAd1HL%2BdFkH2PDy%2BouSh3lqplogZRgWF51bBcUo%2BEOsYCIZM%2B%2F3%2BMDyd8tHfOkQoiYzEmV3rfczFDHQVFaop7swkzxJVSlfQgxPfuR%2BRWphNpi%2FAhR6cjO1DjkgFKHSAB9mE%2BkF7JHaiJWkrGRHTAaVhY7QLiCCmbx1G%2FScynjAYgW0jsHA%2FPLgFC7E2CfRu0BMpVqe2KYLkICagdpWMPrpbzh0QmpK%2Fdg1RBX2vDCMH9OBrBwUuCmOKJm1wA6w5VnbEODp83hx0D%2BEyhQ6wYR3MYPuE%2BamFfuTzJ0FMTqueMaYDoeu7B0xzjQLli62Mzr2IAt4Z7%2FclmCc0%2Bu%2B3g4DJW4nV34lzocCflB6uDNBXw2bKP95XU4TZogmM2b9WpqUf5pG1R%2FFjoFvnCNVtSTi1HicCS5vo5KycBHEW8yAwn%2BThwYujltLv6LmIVjQzYWF1MetTS3TokV5vVMnhQQ6FICT%2BMppKPrIsgsXCeRJvCIOwK%2FeFbxWpVIG9jCs%2BHAyXmKPl%2BWmSBDjIssCoXaDRWq9UtsfPfv6307VX4CRVRTm0eDDiK1xX8QyJAnowpoez9f%2FjaCptuf5eEAdgalVHNCBO1LEw%2F%2BCG1QY6pgFnHRSAna8fcjZPa5WQol6%2FSEtYnzwdy%2BsuMCLGni5UpnHzbNT0nfeGuUHNXGBf9j8DEYAX6uxuqoo1OLSVO4Tso7DUVKa2Uj5IFIp830xNmXqXkO8pycNLvV6tqiH4e1Q%2B%2FMu6Ku9nDTnUMbwxffzTjaUK3%2F6cYux28ExAFSdE6zpPRsy8yRstlvovJy4GejJ4%2Fro5qDnxuo0%2FW2WvftWl3BDTgzfE&X-Amz-Signature=afddee9f91130c3e9021cb5a88b9358619405cdc88c3ca142e91d143ca4d35f1&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

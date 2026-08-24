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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466VPYJUTW6%2F20260824%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260824T063432Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEB4aCXVzLXdlc3QtMiJHMEUCIQD4VMKHuSfpBoLo6iwQBW4oMkj4XvPT%2FzREWSJH6oaQmwIgaBA%2F3Rkrgbvz37HMtCRb%2BnyRBA%2B8tdiMewDfxA4KQOYqiAQI5%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDEw67fg6w8mkTeiGJSrcAxa2%2BGmsu%2FH%2B0%2B1ItfSPXmGnVB7SJC5VzHSb6YsPTtMEt5bBX41LxwIeWqwTjlWwuMdOB6UuaBCr%2BRzCTAZUPMdwhL%2FGMkQGEvSW4OthL%2FRCa1rspqUOol8w5sUshwzwVuUdfI5MP5Wmukt2zfzrTP8gXRSXSEwcH%2BHLuZmL1k5ERlqGJRFoai0L9M4ZU%2FhTWZ0Onow6Di4kZSezWu07JZ%2BD77Ei6bOivDORO45KvklGkCRSRPHfxVrj9JalO6W7mQ9pPJ0TVvZQT%2B8drT2swNlaU5n22B6b61NUC%2Bh1hGoNfo1GYXC3F1XehWLnokW%2BSsAS5kYRIiGjIj9ir%2BtmB2NcsySuk34J0D4zIChdnXrDgiA%2FpSR27BFjSpMutrJtUwduS%2B3wne7EBTX5yF2uRizwn9JUSl7%2Fj2wuc2hQpnS9JFBxx8DAGAQfynm8qOXgHsgFAOZG3TVredvxOnE7kZiunxqQ%2FEScwvWwRU6V%2BAWgfMe7ft%2B4IjeMm%2FXZiOWIDJdHt5Yu7HlktCZhvssZSUyMKIu4jihdSI55sDcWs0zPk90Unk7rnFHj6kplgYBD1dUgQw7ygF3pa%2BOsODGMkmfIi7p7y7hPBxgz4ferfcu7wV1ZxyPlvhJpoyRjMN%2B1r9QGOqUBDLTgUd6uW2Q0inamOLl2pPCmJGWqKosPyyQdeZApdOlhf38c2ZNfJl8ht%2F72Lf60Z1aE%2BL5efsF1ENZj13DKBlLHFUzG95mg7M2gIMVYvCN9%2B6mcLEnfwao6OaNN7smTpNC%2BZLL0noRooafAC%2B7l08xdxgx5AG2tu3Eu5dlWG%2BEu9kNZNVFN6O9dSQpyCarvalupqN1hZY1b%2FtUBn4aE6yX5njh%2B&X-Amz-Signature=14a7b406014d5ead189d204a915bc93823e238d2039619d9684b9ab69b33869b&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466VPYJUTW6%2F20260824%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260824T063432Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEB4aCXVzLXdlc3QtMiJHMEUCIQD4VMKHuSfpBoLo6iwQBW4oMkj4XvPT%2FzREWSJH6oaQmwIgaBA%2F3Rkrgbvz37HMtCRb%2BnyRBA%2B8tdiMewDfxA4KQOYqiAQI5%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDEw67fg6w8mkTeiGJSrcAxa2%2BGmsu%2FH%2B0%2B1ItfSPXmGnVB7SJC5VzHSb6YsPTtMEt5bBX41LxwIeWqwTjlWwuMdOB6UuaBCr%2BRzCTAZUPMdwhL%2FGMkQGEvSW4OthL%2FRCa1rspqUOol8w5sUshwzwVuUdfI5MP5Wmukt2zfzrTP8gXRSXSEwcH%2BHLuZmL1k5ERlqGJRFoai0L9M4ZU%2FhTWZ0Onow6Di4kZSezWu07JZ%2BD77Ei6bOivDORO45KvklGkCRSRPHfxVrj9JalO6W7mQ9pPJ0TVvZQT%2B8drT2swNlaU5n22B6b61NUC%2Bh1hGoNfo1GYXC3F1XehWLnokW%2BSsAS5kYRIiGjIj9ir%2BtmB2NcsySuk34J0D4zIChdnXrDgiA%2FpSR27BFjSpMutrJtUwduS%2B3wne7EBTX5yF2uRizwn9JUSl7%2Fj2wuc2hQpnS9JFBxx8DAGAQfynm8qOXgHsgFAOZG3TVredvxOnE7kZiunxqQ%2FEScwvWwRU6V%2BAWgfMe7ft%2B4IjeMm%2FXZiOWIDJdHt5Yu7HlktCZhvssZSUyMKIu4jihdSI55sDcWs0zPk90Unk7rnFHj6kplgYBD1dUgQw7ygF3pa%2BOsODGMkmfIi7p7y7hPBxgz4ferfcu7wV1ZxyPlvhJpoyRjMN%2B1r9QGOqUBDLTgUd6uW2Q0inamOLl2pPCmJGWqKosPyyQdeZApdOlhf38c2ZNfJl8ht%2F72Lf60Z1aE%2BL5efsF1ENZj13DKBlLHFUzG95mg7M2gIMVYvCN9%2B6mcLEnfwao6OaNN7smTpNC%2BZLL0noRooafAC%2B7l08xdxgx5AG2tu3Eu5dlWG%2BEu9kNZNVFN6O9dSQpyCarvalupqN1hZY1b%2FtUBn4aE6yX5njh%2B&X-Amz-Signature=0aeb887ae614e72a375b3660710cce80e2813db6b082f685e84cfff0b9a3306c&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

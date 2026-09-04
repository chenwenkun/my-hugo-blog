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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466RIWE4JBR%2F20260904%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260904T152324Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEC8aCXVzLXdlc3QtMiJHMEUCICTwV2DOn2zum3I2FEYpe%2FIXRkVZ6G9BggyC%2Bfp3qpmUAiEAwSAaettSdJoWFiCVtF6RnoQOavXBRXIFGH9jd85xv90qiAQI%2BP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDKIX8brcioywFU7XFyrcAxa1%2BdvVBrEfMHOqNSZZBQEv3esxV0RnJ6you%2Fu4K4LtevzIUEwH3evGqwBLEfjt2xT3EUgPTBumvZ3nEQdHHXoNfodD16mKyv163Lm8ASoNFbzcbmQemx2j%2BP3VYotdywt59MSOajQ550aHToObfSJml1KLzaoYC%2F%2B0BaH7QKryt3pM9sEmVFnD47hqlN1v970Loih2pIvdxCWbj9mKbX0hlCVWiBfnuYNPmNiOIGUEjuwpdnH8mmyE7KcqaFBup15LWsZdToDcgF60q0bHCvTEwMsxsZPranf6Sn9dxJo2%2FZzJEq1gglZpofc2VNfMPgjSpzJyUWVbRem2V1JynCp2XdTSAAz3hsTlWNpwrlWIVhyFAWLnrPAc1tM0xcA85W%2BxejuYWEsaAcgZyibO2cPR%2BffQOuzdDznzFVM%2B1mpX1W%2B9KLJRtRoNn5YXnkCUy9Tq734ef9Hp088u1rKen2mlyw1nt4qsGsKbrW9%2BlPDhuyQqCkgUAQ6jdHUlqNFFTrUIF007zXdmtN4Z%2Bboid5OAdRL23OG%2F9In78t2Lgu8xC%2FpNwyE5%2BlVItFiwcmUniHUheP8sG6uq%2FLjMU7%2BQWQTUuDGW1bYi9xgFKOLJjlkwJciUoS5DFdJFBsBpMIe269QGOqUBkGNwEv5jAEgNciwmzK4wF6cPo9DRMwIDNcakfQKK5WU3aXQF4HESq1UEiXCNzRhFrPjXQAgli6w93NC7gCCKnMx%2F1OtLx1bYMvuEptPoqlnSC4F2gW0sCwuVgF8VbaBvST6kWJFdwL8ul%2BPbbB6qOcjeP%2B1jwG38RDySwAbsCvvsfZf0XzVXORgCRZ5CbgPFfC7tJ%2FEz9wNvD6ugcxnU8JtE1hBr&X-Amz-Signature=e59300b398f894542a82316fe780b5f9166d153d4dff700f355544829990d6b9&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466RIWE4JBR%2F20260904%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260904T152324Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEC8aCXVzLXdlc3QtMiJHMEUCICTwV2DOn2zum3I2FEYpe%2FIXRkVZ6G9BggyC%2Bfp3qpmUAiEAwSAaettSdJoWFiCVtF6RnoQOavXBRXIFGH9jd85xv90qiAQI%2BP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDKIX8brcioywFU7XFyrcAxa1%2BdvVBrEfMHOqNSZZBQEv3esxV0RnJ6you%2Fu4K4LtevzIUEwH3evGqwBLEfjt2xT3EUgPTBumvZ3nEQdHHXoNfodD16mKyv163Lm8ASoNFbzcbmQemx2j%2BP3VYotdywt59MSOajQ550aHToObfSJml1KLzaoYC%2F%2B0BaH7QKryt3pM9sEmVFnD47hqlN1v970Loih2pIvdxCWbj9mKbX0hlCVWiBfnuYNPmNiOIGUEjuwpdnH8mmyE7KcqaFBup15LWsZdToDcgF60q0bHCvTEwMsxsZPranf6Sn9dxJo2%2FZzJEq1gglZpofc2VNfMPgjSpzJyUWVbRem2V1JynCp2XdTSAAz3hsTlWNpwrlWIVhyFAWLnrPAc1tM0xcA85W%2BxejuYWEsaAcgZyibO2cPR%2BffQOuzdDznzFVM%2B1mpX1W%2B9KLJRtRoNn5YXnkCUy9Tq734ef9Hp088u1rKen2mlyw1nt4qsGsKbrW9%2BlPDhuyQqCkgUAQ6jdHUlqNFFTrUIF007zXdmtN4Z%2Bboid5OAdRL23OG%2F9In78t2Lgu8xC%2FpNwyE5%2BlVItFiwcmUniHUheP8sG6uq%2FLjMU7%2BQWQTUuDGW1bYi9xgFKOLJjlkwJciUoS5DFdJFBsBpMIe269QGOqUBkGNwEv5jAEgNciwmzK4wF6cPo9DRMwIDNcakfQKK5WU3aXQF4HESq1UEiXCNzRhFrPjXQAgli6w93NC7gCCKnMx%2F1OtLx1bYMvuEptPoqlnSC4F2gW0sCwuVgF8VbaBvST6kWJFdwL8ul%2BPbbB6qOcjeP%2B1jwG38RDySwAbsCvvsfZf0XzVXORgCRZ5CbgPFfC7tJ%2FEz9wNvD6ugcxnU8JtE1hBr&X-Amz-Signature=2bac86e9f7427eef956e47f26a9caa0e118c19aa8fa6194140339c2f1171800a&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

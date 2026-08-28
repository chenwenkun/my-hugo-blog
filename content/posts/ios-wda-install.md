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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4664VWX26MX%2F20260828%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260828T015306Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEHYaCXVzLXdlc3QtMiJHMEUCIQC0lN6sNMN8wA%2BqcbBx02bzJZYGamucSB9g%2BmdJZmM7PwIgFm3cy5HhDyVv5FOxzMtn%2Bn9E69NJrafmuNGUhxRBv1oq%2FwMIPxAAGgw2Mzc0MjMxODM4MDUiDHHPnu8FNn2WLhlD3ircA7r7q5ahpoiT1araKLVca3HKFg88UO7c6%2F5f%2FmvZ2Al8Ac0Q5X9b1N3Gri%2F0QNRu0gZwXCRLVivxCjDM6u7MbS7tVYr%2Fgkz4A%2FGGSGxST%2BOdYhokQQ21vtgcKrKq%2BZAK8cqdh6jCg9mYfDEmjY0Y2JhtsgUW4zE0o1D2MzfllfCK0FDPMaFiA9UDT%2Bd2iOXIM5WJE3IH3G%2FGM5OwTlrRAKI8ofsrjFQ8OTK0vmkVKBtbF8mAdzIC7jkcxuclSy01JhZrmV9RDp8ni7q75eiHw3%2F4NtjjJIhIf1RV%2FIigs1GzomUoLLJ74X%2FAIeTDS5eC3t8frSqapfIxhJnvIm2avsARHYb5EL1KwbSPkagO%2B0bMmnK3aDFYFDQxMBBtHKXd71YpDs6vcHJdmgH%2FMqfyFxa67FcxUtGRpmj4rF2dZPosSs4c77sjUR232TON07%2BZrBOxbaHXBSc7Cio1Zk3NjnCTElfvVKuj4ZDQsU%2BKUWlNm8ih1U8LqTC9174JaSisAgJIq5QNYedVzh7whQAPsxT160khn4QAjAOcKBZAH4n6%2F9b%2F440pUeIYW8BQ%2FnwzgWtElfDw27%2F3H%2FTmKxTE7HMW9wjMkCM6ti162eM5Ur2Ss1%2FGtULR8ls3CJCvMJrZwtQGOqUB8roPV0NfnomttJIIXI0w3DVgo0MMfQZU1GBDwcNFkciaBD1Xx%2BJt7rZud%2FDe0wkfv7qzZpbK2wjA24rwYMdWYC2%2BrbuSoLvGmowLWalKFVLbCb9m4MvAPs7rs%2Fc3qEuwe9Zv3BAn%2BAAb67qRZkn47jbT0%2FOvl%2BMmEzFvvi0b%2BRz5Pdx5M8%2FDgM8PA4lIfSvCSSFy9t3yBgdXfTHXILpMsZFJDyIy&X-Amz-Signature=433b9064d6bf377e8ad1b4fb60b5786768c92c1900cad14d4d91794c1bad55ac&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4664VWX26MX%2F20260828%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260828T015306Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEHYaCXVzLXdlc3QtMiJHMEUCIQC0lN6sNMN8wA%2BqcbBx02bzJZYGamucSB9g%2BmdJZmM7PwIgFm3cy5HhDyVv5FOxzMtn%2Bn9E69NJrafmuNGUhxRBv1oq%2FwMIPxAAGgw2Mzc0MjMxODM4MDUiDHHPnu8FNn2WLhlD3ircA7r7q5ahpoiT1araKLVca3HKFg88UO7c6%2F5f%2FmvZ2Al8Ac0Q5X9b1N3Gri%2F0QNRu0gZwXCRLVivxCjDM6u7MbS7tVYr%2Fgkz4A%2FGGSGxST%2BOdYhokQQ21vtgcKrKq%2BZAK8cqdh6jCg9mYfDEmjY0Y2JhtsgUW4zE0o1D2MzfllfCK0FDPMaFiA9UDT%2Bd2iOXIM5WJE3IH3G%2FGM5OwTlrRAKI8ofsrjFQ8OTK0vmkVKBtbF8mAdzIC7jkcxuclSy01JhZrmV9RDp8ni7q75eiHw3%2F4NtjjJIhIf1RV%2FIigs1GzomUoLLJ74X%2FAIeTDS5eC3t8frSqapfIxhJnvIm2avsARHYb5EL1KwbSPkagO%2B0bMmnK3aDFYFDQxMBBtHKXd71YpDs6vcHJdmgH%2FMqfyFxa67FcxUtGRpmj4rF2dZPosSs4c77sjUR232TON07%2BZrBOxbaHXBSc7Cio1Zk3NjnCTElfvVKuj4ZDQsU%2BKUWlNm8ih1U8LqTC9174JaSisAgJIq5QNYedVzh7whQAPsxT160khn4QAjAOcKBZAH4n6%2F9b%2F440pUeIYW8BQ%2FnwzgWtElfDw27%2F3H%2FTmKxTE7HMW9wjMkCM6ti162eM5Ur2Ss1%2FGtULR8ls3CJCvMJrZwtQGOqUB8roPV0NfnomttJIIXI0w3DVgo0MMfQZU1GBDwcNFkciaBD1Xx%2BJt7rZud%2FDe0wkfv7qzZpbK2wjA24rwYMdWYC2%2BrbuSoLvGmowLWalKFVLbCb9m4MvAPs7rs%2Fc3qEuwe9Zv3BAn%2BAAb67qRZkn47jbT0%2FOvl%2BMmEzFvvi0b%2BRz5Pdx5M8%2FDgM8PA4lIfSvCSSFy9t3yBgdXfTHXILpMsZFJDyIy&X-Amz-Signature=f007c7da79f25d58874cb42776ab3ec222b4bae0b33c996cd26783eb5704486a&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

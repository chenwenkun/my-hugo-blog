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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466QT2CMQYF%2F20260906%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260906T194342Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEGMaCXVzLXdlc3QtMiJGMEQCIDWKIqj%2BVOlKHhc7TT9bQG1RQAVt2%2F4tAslNLngYYqfDAiA1T%2BP1t%2F4Nr6qfxwDTj9Zz5Cub2e5Hccp%2BvRhnLsG%2BfCr%2FAwgsEAAaDDYzNzQyMzE4MzgwNSIMmwdXdFf54DRAFWJkKtwDpCAWpFDpFZb8mifKmVydwQ0nLDlEwJGbqr3%2FKjSSVeDRQPgsfpO20YhlxjYwQ6LbQjRrmX2bdxfwsdEO8pWkN%2FpC3XpWVUCQpIBCugSLptPjnyuA%2FeNG0KHny3B1cWUPCsbKz7FbsewveyQ41QHpTsT%2BZ3ZE8HButTYOs1j9aJuLRwikAiVIT75ZibmJnaN2I%2BvIHN4P%2Brw%2FoEUxrN%2BDv2P4XrE8Luj284kTn0amE8lJ5Fc2ZL3RcbxLAvJxTF4Dt9%2BplhfYaY0AIySn7bCcy%2B6QyPmasI4VYasbzU1r0YO97jczsKq56ZBq80%2Fsh4CQS6BRmzzMB9aEAo5CCTETT%2FJkhybhXrDVguY7xvDiNEgNtWmixhAWSzd7VY9%2F16DeuxtFUcC8HaWt7rOIro80xx%2BdprBM00ugeL5udKG5sYfskQCy3g417Ua5PwuZE3zaVB7dbgo6wg%2BOWgq8YIcBXQqSZZSpUaXPJgY2%2BK6aVpvYtt8jzVbMTKBMUKdwWhQx%2BagmSZnpT5ITSaY4Iu5iCweq0Etn3qLaDp1O2kQPw1rIPWLkv38G2S9OOyHZHCBQDVfAuX7d72CtZ%2FJSCthXcnuj0wqM8bOlXXs1pHT0tnYTFlPLOnXjwA23nzgwuu321AY6pgEk3MZejf7A2gNXL1uKIdjBsrP9Pkcj%2F6Z0YLB0WU1%2BNKWKzmf5vVeHqC2TAH1CVG5W8BU7gbx7vVwGkKiKb54IGfrRZgEx4DNKtonp2aav2saVrPwwcdGLYXpFOo03Olcsa712J9BhI2AbNb8bug3XYnEa6o7j7dZC0Lo6FLgLAmMyXNZdRAiQ7rP7M77zdFj6%2B4tqCRMSxBcUTJAN%2BRT1RLL2YGlO&X-Amz-Signature=4c4dcc8eaeb1133f96da5ad85c2c6e09117d8ccee87edcf2fb033c75f4a609b7&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466QT2CMQYF%2F20260906%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260906T194342Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEGMaCXVzLXdlc3QtMiJGMEQCIDWKIqj%2BVOlKHhc7TT9bQG1RQAVt2%2F4tAslNLngYYqfDAiA1T%2BP1t%2F4Nr6qfxwDTj9Zz5Cub2e5Hccp%2BvRhnLsG%2BfCr%2FAwgsEAAaDDYzNzQyMzE4MzgwNSIMmwdXdFf54DRAFWJkKtwDpCAWpFDpFZb8mifKmVydwQ0nLDlEwJGbqr3%2FKjSSVeDRQPgsfpO20YhlxjYwQ6LbQjRrmX2bdxfwsdEO8pWkN%2FpC3XpWVUCQpIBCugSLptPjnyuA%2FeNG0KHny3B1cWUPCsbKz7FbsewveyQ41QHpTsT%2BZ3ZE8HButTYOs1j9aJuLRwikAiVIT75ZibmJnaN2I%2BvIHN4P%2Brw%2FoEUxrN%2BDv2P4XrE8Luj284kTn0amE8lJ5Fc2ZL3RcbxLAvJxTF4Dt9%2BplhfYaY0AIySn7bCcy%2B6QyPmasI4VYasbzU1r0YO97jczsKq56ZBq80%2Fsh4CQS6BRmzzMB9aEAo5CCTETT%2FJkhybhXrDVguY7xvDiNEgNtWmixhAWSzd7VY9%2F16DeuxtFUcC8HaWt7rOIro80xx%2BdprBM00ugeL5udKG5sYfskQCy3g417Ua5PwuZE3zaVB7dbgo6wg%2BOWgq8YIcBXQqSZZSpUaXPJgY2%2BK6aVpvYtt8jzVbMTKBMUKdwWhQx%2BagmSZnpT5ITSaY4Iu5iCweq0Etn3qLaDp1O2kQPw1rIPWLkv38G2S9OOyHZHCBQDVfAuX7d72CtZ%2FJSCthXcnuj0wqM8bOlXXs1pHT0tnYTFlPLOnXjwA23nzgwuu321AY6pgEk3MZejf7A2gNXL1uKIdjBsrP9Pkcj%2F6Z0YLB0WU1%2BNKWKzmf5vVeHqC2TAH1CVG5W8BU7gbx7vVwGkKiKb54IGfrRZgEx4DNKtonp2aav2saVrPwwcdGLYXpFOo03Olcsa712J9BhI2AbNb8bug3XYnEa6o7j7dZC0Lo6FLgLAmMyXNZdRAiQ7rP7M77zdFj6%2B4tqCRMSxBcUTJAN%2BRT1RLL2YGlO&X-Amz-Signature=cb7a617a715a2459d58d9f43f0c096d58ec706305e84a7882f939b18ba43d2cc&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

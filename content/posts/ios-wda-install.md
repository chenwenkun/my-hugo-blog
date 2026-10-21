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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466YSD4BWW4%2F20261021%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261021T161614Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIGqJUGFpUJmS%2Fju8qys5AviFlk%2BRKWXRXd1KdwsYr3CbAiAMEMdSIujnLQsi8b4MkWlRE55HfdkTBDc0X%2BK%2BAIi2lir%2FAwhfEAAaDDYzNzQyMzE4MzgwNSIM5vkiaS14obZ1atAtKtwDnDBrRENG7gHBVaXZcQP722eln4RtkZfKQDZCv7qR4aOZ9R4Sfs%2Fjs3bEZ2sFhM%2BYCl5TMNhm1%2FthhhWaJCmI2dc3xe0YKzkQ1wjWIdyGvmROgBnT6UX%2B7UO8kw25ACE%2FT1ZZBVBqGrGcwlOWFEPj6Td3xiXdsBgw%2Fq%2Fj%2FyCemc8f8sWcfrZteLDCVLxN17CSOzj2imJJCDaru0tb0y8L1%2Fb4xnUWN0hgsFRhQvx9LKNCHm6cmsqkdpr7tmz7AM%2BAEa1WghXHY6E9PW8k8jlRAhvGIPpEsBmOAd3T4fHxNlcY9PHKDY%2BdeHnXo66Ot%2Brv76JDZE%2Fst6L0FxUxIzGZdpPhlp1dM9s5DTTHXGJibttO8LEZwQckkhLdqIzZtLzhZMZX8EDGUB54kN%2FwAtnm3SkMaTtnpGu7%2Fxo7wIHZ7UWXCBT4TcobxUL0JjDF0NfOFrXTzbQ9YfGjAIByA4RVjNWkugHKaMATCiHVaIuVMMhlNAG8u7r8rhEiGrrD%2BruyG%2B8chqg2x9jcKUtD9jn9weObF3Y3jr14hUbf2jwwmV0%2Bqs5C7pD9Ep5bG4XfI4s9Yb2PSYLInUmkTPNTzrWuaX20zXbH7B9U%2FvBryvk3r5%2F5KwLju%2F4pwoW5Z3Iw3p7j1gY6pgHIQzIUOJe98bqBanT1M2AhsOvijwzaqbhR9Rxs7gdNexLTRCWybXrHabpMO7lIv%2BHBpKoYC%2FxnORzrwi4jhJSbDdDAlBuXF%2FEYjN9zA3Hrv3eDN47B320k04W8PRDL%2FGRk4Xw52%2BA4qhSQasDEueVLBty7EoKmZfmwJaRy9QmrQPaCUJfCYLZyZZIrUzkKy%2B0FMTo6JpB15zOip2F8IbZklC9YOn7n&X-Amz-Signature=5d1f445a4def3994bfafa5a50ad44bac24453a06562aeb7b87d223798a9bb301&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466YSD4BWW4%2F20261021%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261021T161614Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIGqJUGFpUJmS%2Fju8qys5AviFlk%2BRKWXRXd1KdwsYr3CbAiAMEMdSIujnLQsi8b4MkWlRE55HfdkTBDc0X%2BK%2BAIi2lir%2FAwhfEAAaDDYzNzQyMzE4MzgwNSIM5vkiaS14obZ1atAtKtwDnDBrRENG7gHBVaXZcQP722eln4RtkZfKQDZCv7qR4aOZ9R4Sfs%2Fjs3bEZ2sFhM%2BYCl5TMNhm1%2FthhhWaJCmI2dc3xe0YKzkQ1wjWIdyGvmROgBnT6UX%2B7UO8kw25ACE%2FT1ZZBVBqGrGcwlOWFEPj6Td3xiXdsBgw%2Fq%2Fj%2FyCemc8f8sWcfrZteLDCVLxN17CSOzj2imJJCDaru0tb0y8L1%2Fb4xnUWN0hgsFRhQvx9LKNCHm6cmsqkdpr7tmz7AM%2BAEa1WghXHY6E9PW8k8jlRAhvGIPpEsBmOAd3T4fHxNlcY9PHKDY%2BdeHnXo66Ot%2Brv76JDZE%2Fst6L0FxUxIzGZdpPhlp1dM9s5DTTHXGJibttO8LEZwQckkhLdqIzZtLzhZMZX8EDGUB54kN%2FwAtnm3SkMaTtnpGu7%2Fxo7wIHZ7UWXCBT4TcobxUL0JjDF0NfOFrXTzbQ9YfGjAIByA4RVjNWkugHKaMATCiHVaIuVMMhlNAG8u7r8rhEiGrrD%2BruyG%2B8chqg2x9jcKUtD9jn9weObF3Y3jr14hUbf2jwwmV0%2Bqs5C7pD9Ep5bG4XfI4s9Yb2PSYLInUmkTPNTzrWuaX20zXbH7B9U%2FvBryvk3r5%2F5KwLju%2F4pwoW5Z3Iw3p7j1gY6pgHIQzIUOJe98bqBanT1M2AhsOvijwzaqbhR9Rxs7gdNexLTRCWybXrHabpMO7lIv%2BHBpKoYC%2FxnORzrwi4jhJSbDdDAlBuXF%2FEYjN9zA3Hrv3eDN47B320k04W8PRDL%2FGRk4Xw52%2BA4qhSQasDEueVLBty7EoKmZfmwJaRy9QmrQPaCUJfCYLZyZZIrUzkKy%2B0FMTo6JpB15zOip2F8IbZklC9YOn7n&X-Amz-Signature=fa5b575b418b60332fd3a645e463af5c498a8b7fa1da27df5966a32ba66931df&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466XJGYTLOS%2F20261025%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261025T151322Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEPT%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQC4TZ5NGoSZpBB5NDqvFkm6llUfIcjIfgX%2FGKX7GPZ48gIhAJfQ5Gjz0QCszA7AY4uiWLC1zZdNhb2HLjsnXbFKEnSUKogECLz%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgxqRQRdk3myOPJy3rkq3AOBwI5xog5mcZx%2FdLD8i4K6R6fcOJIdCjh%2B%2BwvxfwhitgF%2BVh2hk9Ihvwwy6axgGmg5Mke5RsjR%2FDyUoDQCG3eJ9dm7CESV5IOURR6TDEuOyK6BQyL8gzcxaoMLAz54%2Bx0TFWIlAWNRaTarjeCBXDfUVGnVshjpTfjJpIMNVF041fea9wLFmCxPoxeykexcVeL9CtWNJ%2BpJDOB137o2Kf908M5qju5miT%2BH8cKxxlmBFLix8L3E5BvtFykrwkUNEnZGVT%2B7toraZW1YhwK4l7KEfUfgQoX6q8%2B4TEJe9ddEnu7Jj90FXDZ5VM4wMRidi4SSTrmSj%2Bu5vHYdc8lElmsrLkMMP8Wlg337UOqneHlF7UWvmZkjer8IIg0Xmy1rdtRVN2utzg5W12E1ExL3VuQgCpG7Rem%2Fh3RFhmDom4OMPlCCwhitzREUWdbQ%2Ba7FXuPjVATepVNj96J%2F%2Bej8tblxQAvhjiAwJJM23XNDD%2BWU%2FXLXofbMtIlKMH0gXWvyExiFBuZ5l2SeiM%2FG68%2FZi0Rriw%2BN17%2FtaVirxhPVP9lBoeN6KUFJI0HUqopaFQwAUOYIAhvBkhH8hH1KUY%2FDX8Pe4ec9rMlbFzMuQppxY4Ph4f7tkG4K3e7GJFzrLTCh1vfWBjqkAYSi0sIM7RBaXhEN%2BECdIhI6KbAMvUqprV%2FAvNEdVPhSfQ5SVGsH2dSe9Uxx%2Fufuc2TR%2FZGfgvTdzFL3V4knrC%2FIpVAHDi%2Fyhgad%2By1U76UiLpGlAQW35SgcWljVTNVpUK6roifhypHQCHyBukG3%2BTQiWWxf0oIaWJ5l%2BpKQzt0z95XZ90yicvkaTkwdJIlADBQMNMJAoKldUKqIGSEbznsmP0sz&X-Amz-Signature=dca2631c6de5425bd89bb4b8c22c116ae9962bf50b68ceb7c157934b19fcf057&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466XJGYTLOS%2F20261025%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261025T151322Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEPT%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQC4TZ5NGoSZpBB5NDqvFkm6llUfIcjIfgX%2FGKX7GPZ48gIhAJfQ5Gjz0QCszA7AY4uiWLC1zZdNhb2HLjsnXbFKEnSUKogECLz%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgxqRQRdk3myOPJy3rkq3AOBwI5xog5mcZx%2FdLD8i4K6R6fcOJIdCjh%2B%2BwvxfwhitgF%2BVh2hk9Ihvwwy6axgGmg5Mke5RsjR%2FDyUoDQCG3eJ9dm7CESV5IOURR6TDEuOyK6BQyL8gzcxaoMLAz54%2Bx0TFWIlAWNRaTarjeCBXDfUVGnVshjpTfjJpIMNVF041fea9wLFmCxPoxeykexcVeL9CtWNJ%2BpJDOB137o2Kf908M5qju5miT%2BH8cKxxlmBFLix8L3E5BvtFykrwkUNEnZGVT%2B7toraZW1YhwK4l7KEfUfgQoX6q8%2B4TEJe9ddEnu7Jj90FXDZ5VM4wMRidi4SSTrmSj%2Bu5vHYdc8lElmsrLkMMP8Wlg337UOqneHlF7UWvmZkjer8IIg0Xmy1rdtRVN2utzg5W12E1ExL3VuQgCpG7Rem%2Fh3RFhmDom4OMPlCCwhitzREUWdbQ%2Ba7FXuPjVATepVNj96J%2F%2Bej8tblxQAvhjiAwJJM23XNDD%2BWU%2FXLXofbMtIlKMH0gXWvyExiFBuZ5l2SeiM%2FG68%2FZi0Rriw%2BN17%2FtaVirxhPVP9lBoeN6KUFJI0HUqopaFQwAUOYIAhvBkhH8hH1KUY%2FDX8Pe4ec9rMlbFzMuQppxY4Ph4f7tkG4K3e7GJFzrLTCh1vfWBjqkAYSi0sIM7RBaXhEN%2BECdIhI6KbAMvUqprV%2FAvNEdVPhSfQ5SVGsH2dSe9Uxx%2Fufuc2TR%2FZGfgvTdzFL3V4knrC%2FIpVAHDi%2Fyhgad%2By1U76UiLpGlAQW35SgcWljVTNVpUK6roifhypHQCHyBukG3%2BTQiWWxf0oIaWJ5l%2BpKQzt0z95XZ90yicvkaTkwdJIlADBQMNMJAoKldUKqIGSEbznsmP0sz&X-Amz-Signature=17ac561811d4ff4b9e4ec09a194779d62535cc61d8ee939a337a07fd6af19fa9&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

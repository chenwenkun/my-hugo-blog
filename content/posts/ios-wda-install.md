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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466TE6LYWRL%2F20261030%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261030T032548Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEGIaCXVzLXdlc3QtMiJHMEUCIEhn9fGOy8WQuk5YMex27dC8cxgiCAfFlulnb9VH8nNWAiEA1Vkovr2%2Bs76lHXGCkLt%2BNEmGM32E8y%2BY6KRn5rJg2Rwq%2FwMIKxAAGgw2Mzc0MjMxODM4MDUiDB1BwB4tyOo%2Fhi2paSrcA5zqqTNklc46JN2CmLdq1XAp3nXbsjMfr6ajUhrIRINXPg1qJot%2BcCfoAKDVLt7zh8FhFXT5oO8OWhcWAog0TDNScTf35R5fL%2FosYo6R%2Fq%2FQvJrHGByhBuUeEpGi9xgqY6e%2F7knYCDb8QCR19lpl9iyijSOtIS1blAnkMWQram275kDRhULluegdLcRhGpafc5uJUH9K8orj8mtHusMnA0e8dvNWiueW3jJcZR7OxVgkYvXvncPu9biqMUcisnlefgi4nO60X8B0KSM4XBK3eKRFMk7cqwG0tgyyzEwRxbatOxSAx2W16tw%2B9msEukUkiwYlmSQddubD5bfTWmleZ1BZCR9huIs73VZrs9QaxQ4lL2wLj0XKiUbuJ4rCb%2BwA4ygCYPjSIkTNPlvMacsrE3iFYwvdXELbEGWYJwB8tkGci2rBiUQu54m97eHFJFzLXGTlLTwUxHLcKp9tAy5kVwHjGsNdEAvdRx4fb%2BiDEU2EvN7b%2FWUbI7nYiB6aNjpae3UgD1SwiLRfuWp%2BtuA9RsHD9Mwdc%2BhwAXgq7gIwPD7GT6kXGnlt%2BGuUJUyI5Xe67I5FdnmSQoU28i1va%2B4BdzI540Q%2FUPbkOo2pHXsNyHloDAcKrhIJitGbx7BaMLTrj9cGOqUBym0F9U%2B4ENMJxfEoPcIcRj%2BpGig%2B%2Fsbb3Gd6SbKj%2FHh9FsMK8KhBXTtuEL1X0WpEWIexwvaFXYHC8ZdRRtziLUr1poJMkXQ9uG0UTNlMnrMGvumeDP7xXPzd0MLuvk9B4P496seMlMVdDxMlbosT7kU2An4h0KJso%2FLRmQobxHj9PaMZa99psY2rOPzYTKhv0EHvHOUmcvlK%2F%2FxOv7pmRKf2Dupd&X-Amz-Signature=3fcf6c62dcfed4f08608c7a7bad78aa3362a095974384fa5428b8b4cab15074e&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466TE6LYWRL%2F20261030%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261030T032548Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEGIaCXVzLXdlc3QtMiJHMEUCIEhn9fGOy8WQuk5YMex27dC8cxgiCAfFlulnb9VH8nNWAiEA1Vkovr2%2Bs76lHXGCkLt%2BNEmGM32E8y%2BY6KRn5rJg2Rwq%2FwMIKxAAGgw2Mzc0MjMxODM4MDUiDB1BwB4tyOo%2Fhi2paSrcA5zqqTNklc46JN2CmLdq1XAp3nXbsjMfr6ajUhrIRINXPg1qJot%2BcCfoAKDVLt7zh8FhFXT5oO8OWhcWAog0TDNScTf35R5fL%2FosYo6R%2Fq%2FQvJrHGByhBuUeEpGi9xgqY6e%2F7knYCDb8QCR19lpl9iyijSOtIS1blAnkMWQram275kDRhULluegdLcRhGpafc5uJUH9K8orj8mtHusMnA0e8dvNWiueW3jJcZR7OxVgkYvXvncPu9biqMUcisnlefgi4nO60X8B0KSM4XBK3eKRFMk7cqwG0tgyyzEwRxbatOxSAx2W16tw%2B9msEukUkiwYlmSQddubD5bfTWmleZ1BZCR9huIs73VZrs9QaxQ4lL2wLj0XKiUbuJ4rCb%2BwA4ygCYPjSIkTNPlvMacsrE3iFYwvdXELbEGWYJwB8tkGci2rBiUQu54m97eHFJFzLXGTlLTwUxHLcKp9tAy5kVwHjGsNdEAvdRx4fb%2BiDEU2EvN7b%2FWUbI7nYiB6aNjpae3UgD1SwiLRfuWp%2BtuA9RsHD9Mwdc%2BhwAXgq7gIwPD7GT6kXGnlt%2BGuUJUyI5Xe67I5FdnmSQoU28i1va%2B4BdzI540Q%2FUPbkOo2pHXsNyHloDAcKrhIJitGbx7BaMLTrj9cGOqUBym0F9U%2B4ENMJxfEoPcIcRj%2BpGig%2B%2Fsbb3Gd6SbKj%2FHh9FsMK8KhBXTtuEL1X0WpEWIexwvaFXYHC8ZdRRtziLUr1poJMkXQ9uG0UTNlMnrMGvumeDP7xXPzd0MLuvk9B4P496seMlMVdDxMlbosT7kU2An4h0KJso%2FLRmQobxHj9PaMZa99psY2rOPzYTKhv0EHvHOUmcvlK%2F%2FxOv7pmRKf2Dupd&X-Amz-Signature=a4be49fe0c25c3d548043b819dbe11ac8a18115e9d57d9663f2800b30773be35&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

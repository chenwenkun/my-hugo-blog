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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466SYRZZJJ4%2F20261122%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261122T035744Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEIz%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQC2%2FxRKrS3F05WNkYl35GiV0snwfXlk0CIlLOPYDV6F%2FAIgVIdd2LPHF7Z8bXeSy6sSV5R88yRIWezOHpNv4fRb7Mwq%2FwMIVBAAGgw2Mzc0MjMxODM4MDUiDE9WXd7dok3i3V4bPSrcAyhB485s1GL8SLsWXWt8k2mqU0gzYSVkTJbFgo08ay7DcvJPy2NNmgKb4EwkQjdjFzR0NdVexDrhGENabg7Nx%2FqjdNLNo6bsUTbGBySffmSBILAxOMXya5%2FRLW2lyj3ddY7gDMcysmZytBVcasZlWcMAGsl21dIJ5v4KKZgjaqGyJ1CrYqAGkH2aJaoZ%2BTq9V%2FO0eWdaDrP%2BZMOaT42ggd8IFGSBmoKG%2FoieonPArtU2t8zV7P%2B7x7Lxryn347qx1A4z8fksBQwHumHl3HGKO8pIoowdnpew4Ito3q1SmXgh4pCVze%2FbAIkvLvYz%2BFZ2xm5q2B0l0dgO4zDV4qXm8SthgUpXUghwlk488Wh0zQgEtbHvW4qiENWNw8O3m%2FfMR2dTy4mrBip6zVqKR%2Fh9xUPZt41jbjYVE5B2A2bhyHC%2F7IvRLJecrwNlHgD7pCgiOwK5P9KOO1QbWEmuP5lReegoAj4k%2Fr8QCqkSODg1sWCPSerhvqzXa1PFAcCpsHkVEsNpn3z1uD2rC3ZgyWOgEN7JLqgmxJuXWxeTS4jz%2FM3Nhq5cr%2BrLrqr8UonqM%2FW5dyBLvtDGAKxxHUsJLgsNWh4hkAevS2OJ8iqQ19BBODExdB9Wdt9cbVg9jO0jMPC%2BidgGOqUBkyK8FRx4qJyyuSJ9po69OibXmz9gAmAYfVPCtwkdDpW2qPFLVUfMssJAFOpFCmOZ56d9266i%2BUi4ueXMfKvkG0V9nVVUJytNpMVq28UibThKFKdDgyJdF3IwL2RFTcs4ktFaOktbDuO1aH3Gc5LuYDri644FEawMHaNKHow3sjEUXXqbHbz22jn7TIhOeRXwJ%2FAgAnv31MHzOftCT1mRLWcYRx7g&X-Amz-Signature=fc60fd46c663b139111be47661538b327660e52a3cc714f566ea0c53226aedab&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466SYRZZJJ4%2F20261122%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261122T035744Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEIz%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQC2%2FxRKrS3F05WNkYl35GiV0snwfXlk0CIlLOPYDV6F%2FAIgVIdd2LPHF7Z8bXeSy6sSV5R88yRIWezOHpNv4fRb7Mwq%2FwMIVBAAGgw2Mzc0MjMxODM4MDUiDE9WXd7dok3i3V4bPSrcAyhB485s1GL8SLsWXWt8k2mqU0gzYSVkTJbFgo08ay7DcvJPy2NNmgKb4EwkQjdjFzR0NdVexDrhGENabg7Nx%2FqjdNLNo6bsUTbGBySffmSBILAxOMXya5%2FRLW2lyj3ddY7gDMcysmZytBVcasZlWcMAGsl21dIJ5v4KKZgjaqGyJ1CrYqAGkH2aJaoZ%2BTq9V%2FO0eWdaDrP%2BZMOaT42ggd8IFGSBmoKG%2FoieonPArtU2t8zV7P%2B7x7Lxryn347qx1A4z8fksBQwHumHl3HGKO8pIoowdnpew4Ito3q1SmXgh4pCVze%2FbAIkvLvYz%2BFZ2xm5q2B0l0dgO4zDV4qXm8SthgUpXUghwlk488Wh0zQgEtbHvW4qiENWNw8O3m%2FfMR2dTy4mrBip6zVqKR%2Fh9xUPZt41jbjYVE5B2A2bhyHC%2F7IvRLJecrwNlHgD7pCgiOwK5P9KOO1QbWEmuP5lReegoAj4k%2Fr8QCqkSODg1sWCPSerhvqzXa1PFAcCpsHkVEsNpn3z1uD2rC3ZgyWOgEN7JLqgmxJuXWxeTS4jz%2FM3Nhq5cr%2BrLrqr8UonqM%2FW5dyBLvtDGAKxxHUsJLgsNWh4hkAevS2OJ8iqQ19BBODExdB9Wdt9cbVg9jO0jMPC%2BidgGOqUBkyK8FRx4qJyyuSJ9po69OibXmz9gAmAYfVPCtwkdDpW2qPFLVUfMssJAFOpFCmOZ56d9266i%2BUi4ueXMfKvkG0V9nVVUJytNpMVq28UibThKFKdDgyJdF3IwL2RFTcs4ktFaOktbDuO1aH3Gc5LuYDri644FEawMHaNKHow3sjEUXXqbHbz22jn7TIhOeRXwJ%2FAgAnv31MHzOftCT1mRLWcYRx7g&X-Amz-Signature=b72e7be291b148963445a428266966a8e4f6411dbad980c8287f5bfe8866ab63&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4667PCXRFYB%2F20260824%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260824T122428Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjECQaCXVzLXdlc3QtMiJHMEUCIFxr3FtA0IPz8cGA3MaRddd1PAG8LFd2ko54ndeiyjsIAiEA0UjAGa4XtMHlIB0tH4fCTeLaYIT1hWrw%2Fu%2BihwSiwIoqiAQI7f%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDEK4Io1T2A0wC9wmsyrcA06Vywsi%2FmA4Mt9JaIDf%2BxxU%2BxBMtQmrqMv0jSpdEK44ldTLZEA5%2FFvcKS6dzQvL0Nxr6qixRCCOKYlRGVQC3%2B7P04Qi3ELERApdPN1YW4u5JImxvU6wzIDuAmoo3TB%2F796Ix69RWCmoXZkEVRMOJoW9UWbeaY7Ezf%2BJZb504BClOJmcxcgrLbJdhuMgOkBpBGG%2FLyq1EhQRIhBIF9sP2KQzJKhH8Zo3xcAeGVqa5XL79hJXGTa5crJd0bbXSaRoo%2Bwc6l%2B3kKO0EqOeVCoBydCEmdcrcxHnr9rnJwoob0%2Bn09qPYwupsfSO9TcTy7BZE78%2BbMaJVySD13tZXW7pE0LP7B0HPIzBQC1ONtmPytT2HPaFWKdALyATZvDbtZdd2gkYMFXMX1Zlu5o0GoB6e5xyTgvt08pik2vnZRfr8tZIqlxIozhWd7lNZaSU1wgnd0tpSTYP9DhsKd7XJKgjh0sSny4G9%2BN0uhHSspu6uAYvOi7LF2vjGvUGsFPhk74Z%2FXWz8iSCiUXOW5kK6jc0zkbLhPaxAm3DfBWufgOIIwScS%2Fi%2FrelfzAWoPGWveRhj6fZMx0pN0jBwuPph85Ro4kLxAr9b0M8LLIN%2BsD9WfaWTRb7YsebaWxDxnIUXMNDssNQGOqUBCZKVOwH%2B%2BcgCvP%2B5yreDHYVScvii%2B1BUd7l6rQ3STFvhX62UzCeCkMfn8or%2BrNpU5sw1LZFKcuU%2FXaLj6dgRxUI0DDnUDXmmg36GfICHVzSoFn597J0jKkta4QQsQ2RykE4SHf7wcyaYj1qdPDHxA75mpgKw8DAIk3lOzJyvqJ9nTDZNaSG2Lmk0PzSfzYxFLd5XVDDXW9I0LHY8pkhkYZ4u91ZO&X-Amz-Signature=4e854262b22f6657a947525c896f59a6e3a798095123c8ce5451a5cbac705b07&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4667PCXRFYB%2F20260824%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260824T122428Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjECQaCXVzLXdlc3QtMiJHMEUCIFxr3FtA0IPz8cGA3MaRddd1PAG8LFd2ko54ndeiyjsIAiEA0UjAGa4XtMHlIB0tH4fCTeLaYIT1hWrw%2Fu%2BihwSiwIoqiAQI7f%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDEK4Io1T2A0wC9wmsyrcA06Vywsi%2FmA4Mt9JaIDf%2BxxU%2BxBMtQmrqMv0jSpdEK44ldTLZEA5%2FFvcKS6dzQvL0Nxr6qixRCCOKYlRGVQC3%2B7P04Qi3ELERApdPN1YW4u5JImxvU6wzIDuAmoo3TB%2F796Ix69RWCmoXZkEVRMOJoW9UWbeaY7Ezf%2BJZb504BClOJmcxcgrLbJdhuMgOkBpBGG%2FLyq1EhQRIhBIF9sP2KQzJKhH8Zo3xcAeGVqa5XL79hJXGTa5crJd0bbXSaRoo%2Bwc6l%2B3kKO0EqOeVCoBydCEmdcrcxHnr9rnJwoob0%2Bn09qPYwupsfSO9TcTy7BZE78%2BbMaJVySD13tZXW7pE0LP7B0HPIzBQC1ONtmPytT2HPaFWKdALyATZvDbtZdd2gkYMFXMX1Zlu5o0GoB6e5xyTgvt08pik2vnZRfr8tZIqlxIozhWd7lNZaSU1wgnd0tpSTYP9DhsKd7XJKgjh0sSny4G9%2BN0uhHSspu6uAYvOi7LF2vjGvUGsFPhk74Z%2FXWz8iSCiUXOW5kK6jc0zkbLhPaxAm3DfBWufgOIIwScS%2Fi%2FrelfzAWoPGWveRhj6fZMx0pN0jBwuPph85Ro4kLxAr9b0M8LLIN%2BsD9WfaWTRb7YsebaWxDxnIUXMNDssNQGOqUBCZKVOwH%2B%2BcgCvP%2B5yreDHYVScvii%2B1BUd7l6rQ3STFvhX62UzCeCkMfn8or%2BrNpU5sw1LZFKcuU%2FXaLj6dgRxUI0DDnUDXmmg36GfICHVzSoFn597J0jKkta4QQsQ2RykE4SHf7wcyaYj1qdPDHxA75mpgKw8DAIk3lOzJyvqJ9nTDZNaSG2Lmk0PzSfzYxFLd5XVDDXW9I0LHY8pkhkYZ4u91ZO&X-Amz-Signature=f8e44b235cb8baa451381bf4b232dd5fc7fcd0fd3c8e447790fc0fb2dfaa87f4&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

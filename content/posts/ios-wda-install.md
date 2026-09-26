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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466SUGTEGQV%2F20260926%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260926T151939Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjED8aCXVzLXdlc3QtMiJGMEQCIDS%2FbI8GX6lNF08sFHmCpjFduFwYVHN%2Fk5sGN5SkJ6PAAiAu2CEeDezyEybPERdmiOzK07dspJ%2BjXa0QsLVKZFaUeyr%2FAwgIEAAaDDYzNzQyMzE4MzgwNSIMPuGNamTfZXvIoAZrKtwDcz1HIKBDK%2F19FYnt1Ybw3gR7h2jd62rhCFTJOIWb3WWFKfCfZGZrrfeZdKGVadwjXRfX1snL39VZc6i89jbTWGHDZCuYkgo6EHVMRaUnncHNetY3mestblguVpAAMcDRlQ33bXc1SRbUfg75TXciWvTSdmpD17y7kz6BxvWnte3VWlu2UWZ62ECs%2F7E8QWM45rSLQtrpmID6bp9WWK9jlY3oyG5JR753JbFk5t2vWwhRfS8tpuU8yYPREWq0ratEwo%2BiIzkrOSO5WlC1bIiBXtpw3QeQije45bnMeGcV6huqqB7pMEL9kiccin9RZHO1%2FscBBCApK4sIbRZjMC2ZglRxrNv9LdmUw7rJXE20kqY2MAhmtjUhsiE1M%2FE5nyJjXn5UIm6K5TvnpHxeoaRE2heqnHIDSsyRks%2BCVVQt6r6Du%2Fi3swhC%2FZPoFOmyvAqv3F9gUnCPiQ4Cd%2BTmGSzV%2FQtDnXLQWoXazZIslLbC%2F%2BBkxlE3i2fmqWxsll775T2IyCWAtTuQjszYy5ydul6pPzub5fwwlRG%2FhpY2%2FglDfFvfwpbjtejkEqrahQwbyjjDubICIz8H1DPoeLilpSwS7A2V5FyBdVi8xp2VFMs90jwWyG8MaU8KuXDoZXIw8bjf1QY6pgEblQxAy5Qwu1O12RP9oPrXbpHuZT6RRpD6w5KII%2FzNl2SYdGfiw7TlIkBD6sBPnG7TIzXLA%2FQ0ZtqEEuAeEvvxHfzlxscD28fqKS4lL7bugW0Czowe3Qthqj36FQ3b8gB%2BP7IGspSTf6COHHTKnOtNsb%2BoyALq5fZSE%2B%2BJZk7tEEOA4GrfplIoVvj2yJrh3%2BwGdChQv0TAG3HYJyBQ9kTEX%2FRnwvPS&X-Amz-Signature=5aa4723f34f32e34b9702c644ed21e58a31363d1d444fbc06afb70ddab6c1bd3&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466SUGTEGQV%2F20260926%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260926T151939Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjED8aCXVzLXdlc3QtMiJGMEQCIDS%2FbI8GX6lNF08sFHmCpjFduFwYVHN%2Fk5sGN5SkJ6PAAiAu2CEeDezyEybPERdmiOzK07dspJ%2BjXa0QsLVKZFaUeyr%2FAwgIEAAaDDYzNzQyMzE4MzgwNSIMPuGNamTfZXvIoAZrKtwDcz1HIKBDK%2F19FYnt1Ybw3gR7h2jd62rhCFTJOIWb3WWFKfCfZGZrrfeZdKGVadwjXRfX1snL39VZc6i89jbTWGHDZCuYkgo6EHVMRaUnncHNetY3mestblguVpAAMcDRlQ33bXc1SRbUfg75TXciWvTSdmpD17y7kz6BxvWnte3VWlu2UWZ62ECs%2F7E8QWM45rSLQtrpmID6bp9WWK9jlY3oyG5JR753JbFk5t2vWwhRfS8tpuU8yYPREWq0ratEwo%2BiIzkrOSO5WlC1bIiBXtpw3QeQije45bnMeGcV6huqqB7pMEL9kiccin9RZHO1%2FscBBCApK4sIbRZjMC2ZglRxrNv9LdmUw7rJXE20kqY2MAhmtjUhsiE1M%2FE5nyJjXn5UIm6K5TvnpHxeoaRE2heqnHIDSsyRks%2BCVVQt6r6Du%2Fi3swhC%2FZPoFOmyvAqv3F9gUnCPiQ4Cd%2BTmGSzV%2FQtDnXLQWoXazZIslLbC%2F%2BBkxlE3i2fmqWxsll775T2IyCWAtTuQjszYy5ydul6pPzub5fwwlRG%2FhpY2%2FglDfFvfwpbjtejkEqrahQwbyjjDubICIz8H1DPoeLilpSwS7A2V5FyBdVi8xp2VFMs90jwWyG8MaU8KuXDoZXIw8bjf1QY6pgEblQxAy5Qwu1O12RP9oPrXbpHuZT6RRpD6w5KII%2FzNl2SYdGfiw7TlIkBD6sBPnG7TIzXLA%2FQ0ZtqEEuAeEvvxHfzlxscD28fqKS4lL7bugW0Czowe3Qthqj36FQ3b8gB%2BP7IGspSTf6COHHTKnOtNsb%2BoyALq5fZSE%2B%2BJZk7tEEOA4GrfplIoVvj2yJrh3%2BwGdChQv0TAG3HYJyBQ9kTEX%2FRnwvPS&X-Amz-Signature=9f5540e72659c64c7832b0706833707f4d72597045d6aafba7753b0e00b7070d&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

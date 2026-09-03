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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB46667EORXNL%2F20260903%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260903T201533Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEBoaCXVzLXdlc3QtMiJHMEUCIQDYcK4KF9t0p3tMW5MSKa9cVAU38cknowU0gWXGVRTAjQIgUUxanCTukbW8JDwZ1dX4OOpCge32rf6J%2FRMizTJSILMqiAQI4%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDD%2BOoyDS%2BlE%2Fnuqk9ircAxHQg1krL3IxQGPnODFlsBJ0hQqWee8LZjna%2Be7%2FwoQ%2B8ebauybV9Mjn4n%2BU6HeaGw5FAUJc0Z%2B4o3qzuTSJZCy%2F9XoLkyoPrDz3mJYAexl4yFNF3aRyFMyu0I0EYaY733FOQjje71aOOeHV9KhuIuueosBVx3q7Q7k3cIFMg5TKyrHmM%2F5zX4fGpwpWSsZvuoMJO75rBK6WgaQ94jVQ4MpszCV7QxfpQv6mNKYXCzwwkO46HxZ%2BLghMTSsZuxsbJUxortQVYHMLUdofbuTNrIWge8yYASxhDRv9XC2Iw2lOwx5bKnrJJynBZI1lM9cUGydOKPqF%2FVTL9ASTA0Xn8tVD1nhuNvSuwZroxjAp1SG3uJEFfMiW23KDSsgQYiMOn2D5KnkCoP%2Fiif2nWeYixISkeqZRctPnuzztXjeP3lDz1LYpSiTNZerDUDEXBU1qVxejn%2FeCUBhARarQzw9SOAT6Vl6DdUgPsSJU%2FnisVmAZT6wQGCCHyBDx3BzHCXIsB2j9orJ8wam7Iq9n8bzhOnNpDQKYpgWxNA1ioPuoJlFgosZ5xUfsTp%2FBBpBiZdtWTdWyS28dEI0vJ0MARSczLBptFnjNDmL3H8ubtU1iMZizy9DWnlvkBHlMH2svMODn5tQGOqUB3GFzmgnvT2bpDGihylx6YnmOKc82%2BzuPX0gE1uX2e%2BE9ApBQVQV1KZM9v0JIcvHnHo6nZzEMeL%2BcLJxvyqSN9GgFxrGpwZTkOcieoh2toN1zIsOKbmZPSBOCl0zPjLb22bLjbW2lYtR8USqB%2BIgqOHPH61tfsnGMXgVODug8oV5QL3mG3xUIzgPCen8vncgRhoxUz745bXBpNX6wPzwub1h3jCBK&X-Amz-Signature=1aee034a97002999147744d0e072ee09efdc8a285c7a3145e2f3855794a6d469&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB46667EORXNL%2F20260903%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260903T201533Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEBoaCXVzLXdlc3QtMiJHMEUCIQDYcK4KF9t0p3tMW5MSKa9cVAU38cknowU0gWXGVRTAjQIgUUxanCTukbW8JDwZ1dX4OOpCge32rf6J%2FRMizTJSILMqiAQI4%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDD%2BOoyDS%2BlE%2Fnuqk9ircAxHQg1krL3IxQGPnODFlsBJ0hQqWee8LZjna%2Be7%2FwoQ%2B8ebauybV9Mjn4n%2BU6HeaGw5FAUJc0Z%2B4o3qzuTSJZCy%2F9XoLkyoPrDz3mJYAexl4yFNF3aRyFMyu0I0EYaY733FOQjje71aOOeHV9KhuIuueosBVx3q7Q7k3cIFMg5TKyrHmM%2F5zX4fGpwpWSsZvuoMJO75rBK6WgaQ94jVQ4MpszCV7QxfpQv6mNKYXCzwwkO46HxZ%2BLghMTSsZuxsbJUxortQVYHMLUdofbuTNrIWge8yYASxhDRv9XC2Iw2lOwx5bKnrJJynBZI1lM9cUGydOKPqF%2FVTL9ASTA0Xn8tVD1nhuNvSuwZroxjAp1SG3uJEFfMiW23KDSsgQYiMOn2D5KnkCoP%2Fiif2nWeYixISkeqZRctPnuzztXjeP3lDz1LYpSiTNZerDUDEXBU1qVxejn%2FeCUBhARarQzw9SOAT6Vl6DdUgPsSJU%2FnisVmAZT6wQGCCHyBDx3BzHCXIsB2j9orJ8wam7Iq9n8bzhOnNpDQKYpgWxNA1ioPuoJlFgosZ5xUfsTp%2FBBpBiZdtWTdWyS28dEI0vJ0MARSczLBptFnjNDmL3H8ubtU1iMZizy9DWnlvkBHlMH2svMODn5tQGOqUB3GFzmgnvT2bpDGihylx6YnmOKc82%2BzuPX0gE1uX2e%2BE9ApBQVQV1KZM9v0JIcvHnHo6nZzEMeL%2BcLJxvyqSN9GgFxrGpwZTkOcieoh2toN1zIsOKbmZPSBOCl0zPjLb22bLjbW2lYtR8USqB%2BIgqOHPH61tfsnGMXgVODug8oV5QL3mG3xUIzgPCen8vncgRhoxUz745bXBpNX6wPzwub1h3jCBK&X-Amz-Signature=c7e2828f79fe9e554c56fe948d881b539f04c95ba5953dc16ecef657f6f97632&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4666LEWEVT6%2F20260812%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260812T070627Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEP7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIHlX2oq5u7Go4U9VxvOyogP4MVmr1sIw8RhiJ9evJHu5AiEA7YKSnm7CHk4WWxZvdwLCwifWVWenmzEW5UBrBJlHX%2FQqiAQIx%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDJp52dCFwjYVcHTwmCrcAwB2G3YUgyBjlsbwgzCc46IAfanYZJDT5IkDjB3Ap2zyNC3OhdqY%2Fvr%2Bxx%2B11iJNZeB0TsnjVcdnXsITtKFWA1eIcvoyeRDelgdrx3zA81KfEzsxrZmiVubPHCKz398pO3SbARPvMibn1WeUGttyFv74XrExEK0w152CbmtoFmerp%2FHLOZAAdTmFybm2waRM353vEoACm0skyzkfc%2FB2U4zTUAh%2BUSGscmQnjBhP%2F7wlTEMZwhEIOfQXzpU%2FbUIuCwEHNGG7qeb8NW9PgKUoiCXh%2B1OAlIZd%2BzV%2FmalYq0%2FYJECXRPgrozSK4igtk16ezQOOGCwvVtD5jmoobfVHI7cvMWE9ULksYzmis4MQ4tnqr%2Fua4hEYFpf%2F4ipqkBqvrYjCeMbX4j5IzCgvWIVEZ36PUpYZNJiFYyGFu28mnV%2B88ae4WCXRzFjRzCgfMEv3GC2k96mlOx7BlAfR54%2BWh%2Fn5eSibwk2uv1EEqOKP06soIHC%2Fx6uQEW7jj3WEZSL6JFXefX1Of6p6Y5gH%2FXrqDHxGI3MtFep1KjW9%2BrjDlPSLwTYnryNFukM9D4b%2BUTQQluNoaep7l7tOq6curoAiOkI3C9jIlvWXtCQPYZ2lRhDgO5v86KIsvEBosAJ2MLOR8NMGOqUBoFCqZncHbflrLYXEgMDgYXHMnnJVfsY88hlukiW%2F%2FJ6XDrshLek5nd0qArXMpXSOdetwGJpFXmQiJOH1fk9OKqNWeYy4vafx4mkaEZ60czLKsAKkPU%2FANCGAUuxtrGWBnu6qVsabuU034PeYjUVNooFCFYU44C%2BS699IrCsPH3g8FP8h1WyPDf8y37ZUGIHilnNlTVJ9QkK87XuTHtz08%2FMqXEgI&X-Amz-Signature=7c97caed2e10ddd78cded0073486eef9db3f78cd36578e466dae54d0b1bcd0d3&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4666LEWEVT6%2F20260812%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260812T070627Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEP7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIHlX2oq5u7Go4U9VxvOyogP4MVmr1sIw8RhiJ9evJHu5AiEA7YKSnm7CHk4WWxZvdwLCwifWVWenmzEW5UBrBJlHX%2FQqiAQIx%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDJp52dCFwjYVcHTwmCrcAwB2G3YUgyBjlsbwgzCc46IAfanYZJDT5IkDjB3Ap2zyNC3OhdqY%2Fvr%2Bxx%2B11iJNZeB0TsnjVcdnXsITtKFWA1eIcvoyeRDelgdrx3zA81KfEzsxrZmiVubPHCKz398pO3SbARPvMibn1WeUGttyFv74XrExEK0w152CbmtoFmerp%2FHLOZAAdTmFybm2waRM353vEoACm0skyzkfc%2FB2U4zTUAh%2BUSGscmQnjBhP%2F7wlTEMZwhEIOfQXzpU%2FbUIuCwEHNGG7qeb8NW9PgKUoiCXh%2B1OAlIZd%2BzV%2FmalYq0%2FYJECXRPgrozSK4igtk16ezQOOGCwvVtD5jmoobfVHI7cvMWE9ULksYzmis4MQ4tnqr%2Fua4hEYFpf%2F4ipqkBqvrYjCeMbX4j5IzCgvWIVEZ36PUpYZNJiFYyGFu28mnV%2B88ae4WCXRzFjRzCgfMEv3GC2k96mlOx7BlAfR54%2BWh%2Fn5eSibwk2uv1EEqOKP06soIHC%2Fx6uQEW7jj3WEZSL6JFXefX1Of6p6Y5gH%2FXrqDHxGI3MtFep1KjW9%2BrjDlPSLwTYnryNFukM9D4b%2BUTQQluNoaep7l7tOq6curoAiOkI3C9jIlvWXtCQPYZ2lRhDgO5v86KIsvEBosAJ2MLOR8NMGOqUBoFCqZncHbflrLYXEgMDgYXHMnnJVfsY88hlukiW%2F%2FJ6XDrshLek5nd0qArXMpXSOdetwGJpFXmQiJOH1fk9OKqNWeYy4vafx4mkaEZ60czLKsAKkPU%2FANCGAUuxtrGWBnu6qVsabuU034PeYjUVNooFCFYU44C%2BS699IrCsPH3g8FP8h1WyPDf8y37ZUGIHilnNlTVJ9QkK87XuTHtz08%2FMqXEgI&X-Amz-Signature=90ccbde5b18bd32af1302461eb80dec4b3e80f53c6f5c3523b9e2899f4e08d86&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

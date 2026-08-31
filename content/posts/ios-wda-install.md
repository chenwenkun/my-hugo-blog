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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466VFCHUSCO%2F20260831%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260831T220924Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjENb%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIGljZ4p3cVBjgrMDs4iLxRtye6jo7DD4MlYI1Q9pPw%2BJAiBG%2Fpe18xjeC7miyFpxkvnNoInIin8rrNSuBjVkVTUiZSqIBAif%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMm9lkPqvXOA%2BBHDcoKtwDYgRVjysu4t6rodAtHZf16PB9AdtJChkXWo0OMCo4wcNZeCPUQL5p5iE5vYBlaF3jMtTeMHQRy%2F8P0urDZZ5TsiLr4VJSkmB2SjrAlQS2n5VftaQYqUatW2p6b5PRJXEVKIJ8L6FbQZjujbee%2B8pPdNir8%2F18Onh5j8RVR25rpVpF%2B3QRhK55PlbKUqIeqyuKm%2FJZ2QatOI%2BCpR2%2FffPpjIv%2FO29sWO336qSTK%2B7t3dW0F0KTQhaWFVnccdH6JCAQeSJSpSIZm3ovih6Ed%2BqSOrBMp0hBiqDYAG3l2thF0kGxN6OqBivDIxQ3NKzmCr0DoQz8g24ss1ujNFUTr2dWCu%2FzNETcfAWJIq3pmtcFDrphFOvKLvWZiRL0xGrPUgLXtx3bfRfnis4mkPWuqTA5mXNSvE0QBxqJQ1KH3gL3lb6ed6gUOfv1rCcK%2FdZqBVhl9MudWCkOt86wMM6pRhteoT2IQwSywKL89oT802HIGRRP1MvgOBQqe8LtR9uUXuWm5plkPcsCgL8hUju68%2F5CX84aWyHbzVUXrzrRDSZ%2BjH151XVG0z13l%2Bh2nBf9rTLhrNIgYu7DTHlL8tTTMGjpS7cyJ99%2BOYrEHxZ9qYBFASx3HpmDUVJiLax0rlow%2FvHX1AY6pgE3GpOfYvoCEQvpgoPisJkiWUgvG99f87HptG5WwcIytsw5mRQcxZl4QS9ROLvcBq0mlhW%2FraMhFdJ80STYtCzITNy6cSaJBhxBnKWjvolYiOOWa7ShwU4n6BeCZxt3H2W2hAu%2BXPrNivzm83Q11Wh7XE%2BqwHRvi20A6y%2B0CSkCcomCGeOJ%2FptRRsMu4gP8sY89sZiwLSAlODRlqptl%2B%2B6kYmrQPa8H&X-Amz-Signature=782755a40e65bbf42e047662a24e5e7da55e12f48a1c179decc757b04ecf687f&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466VFCHUSCO%2F20260831%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260831T220925Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjENb%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIGljZ4p3cVBjgrMDs4iLxRtye6jo7DD4MlYI1Q9pPw%2BJAiBG%2Fpe18xjeC7miyFpxkvnNoInIin8rrNSuBjVkVTUiZSqIBAif%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMm9lkPqvXOA%2BBHDcoKtwDYgRVjysu4t6rodAtHZf16PB9AdtJChkXWo0OMCo4wcNZeCPUQL5p5iE5vYBlaF3jMtTeMHQRy%2F8P0urDZZ5TsiLr4VJSkmB2SjrAlQS2n5VftaQYqUatW2p6b5PRJXEVKIJ8L6FbQZjujbee%2B8pPdNir8%2F18Onh5j8RVR25rpVpF%2B3QRhK55PlbKUqIeqyuKm%2FJZ2QatOI%2BCpR2%2FffPpjIv%2FO29sWO336qSTK%2B7t3dW0F0KTQhaWFVnccdH6JCAQeSJSpSIZm3ovih6Ed%2BqSOrBMp0hBiqDYAG3l2thF0kGxN6OqBivDIxQ3NKzmCr0DoQz8g24ss1ujNFUTr2dWCu%2FzNETcfAWJIq3pmtcFDrphFOvKLvWZiRL0xGrPUgLXtx3bfRfnis4mkPWuqTA5mXNSvE0QBxqJQ1KH3gL3lb6ed6gUOfv1rCcK%2FdZqBVhl9MudWCkOt86wMM6pRhteoT2IQwSywKL89oT802HIGRRP1MvgOBQqe8LtR9uUXuWm5plkPcsCgL8hUju68%2F5CX84aWyHbzVUXrzrRDSZ%2BjH151XVG0z13l%2Bh2nBf9rTLhrNIgYu7DTHlL8tTTMGjpS7cyJ99%2BOYrEHxZ9qYBFASx3HpmDUVJiLax0rlow%2FvHX1AY6pgE3GpOfYvoCEQvpgoPisJkiWUgvG99f87HptG5WwcIytsw5mRQcxZl4QS9ROLvcBq0mlhW%2FraMhFdJ80STYtCzITNy6cSaJBhxBnKWjvolYiOOWa7ShwU4n6BeCZxt3H2W2hAu%2BXPrNivzm83Q11Wh7XE%2BqwHRvi20A6y%2B0CSkCcomCGeOJ%2FptRRsMu4gP8sY89sZiwLSAlODRlqptl%2B%2B6kYmrQPa8H&X-Amz-Signature=f04da0c8d5932e0cc8c8af7b8f71a11fc04bd1a241ae0d9f8c18cfcf2a5a74a5&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

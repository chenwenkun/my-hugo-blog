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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466VKGMNRNA%2F20260811%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260811T064537Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEOX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCx4OR7zYSErleMlWLHQJ29O%2Bz4Xf2nvuUO1c2RrwPk6wIhAO3Jon15SnOVR2fwlQp7oQprAXera%2Bw%2BttocQNt3nxlrKogECK7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgxPHD4uU%2FaBa23oG9Uq3ANw2EfEY2KBaf6M5DuZ9OfIQ%2FUGMn%2BQ4S%2B2nybv1yM0ihXiwhhdRzSMLPa%2BDQKcB4dpecyRSejPtVJgPup%2FWwiwacwc6DtiGQI1xB1k7rdHq8fGVagV0GKedeXGVglnIHb0Kt5epu6iwmWF5%2FEVtfU0fVCbmQn5YU1ojEGjQtpOt45oFKVICb2lec9dixsj9nPduMtxW%2Bx3M%2BOg6D6PVs9xbuOTF%2FepGqi36eOLE9glM11uBgKrWuAc6BQvesOObcHSwNJ2Qa5tFEAOKpeLsD6Lif1ACrZaGItSMdgRuMZ6A86xDTvy9tK4MkshIEytJs14FqJZuV5QBeS0Xg22Z6PImf2sMgQN%2BVaNjGeFRMPNc11%2BEnl9nnnQd0WqPHvChmAZ8%2B1uTursTwqtZ3uZ6scUx88iT00YLbKXgFG9B%2FGVhbxciXjADpLsLhO2auJdzMxUVyKsy%2BGFYe7KHBcTuDuhKYQUOBlgQ7dzEKar3bdLQgecx40xVHAJ%2FsIjH86H%2Be3Nz17yiR9eHHya%2BpbmrnsND3139ijaCcmW3Czdk82KQ4n2PhYQBODxXAD0xmK1fjNz6MnLNDiO8sKRofOMF4Lt82%2BCEkUErGwt71q0XjydUM%2Beg5GOztsvLMScXDCa0OrTBjqkAaH9pt16GBHe3PHbopSz7cHkZsHAKj96J0xQmiWC4LkxIHl5QxrQXKmAY6AEtwgnnNMUpybf9KNoYblyMMW4A2elnqTFLxIQ4Ibj3nq2Oy1w4C6VvPx7BZFjF%2FYpOda9w0ytogS3oJtKikkpz9G6O%2B6AUpTLWD2z8VDBjUXB7YmALndxUqRy%2Ftl%2F8tj2hpKfjyWc5%2FMEgTY8PRy%2BxTqa3jn9zQyu&X-Amz-Signature=20c60339bd815cd842b0e27673c916cdea61b999620ceab73cc8d4b2aaa930fc&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466VKGMNRNA%2F20260811%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260811T064537Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEOX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCx4OR7zYSErleMlWLHQJ29O%2Bz4Xf2nvuUO1c2RrwPk6wIhAO3Jon15SnOVR2fwlQp7oQprAXera%2Bw%2BttocQNt3nxlrKogECK7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgxPHD4uU%2FaBa23oG9Uq3ANw2EfEY2KBaf6M5DuZ9OfIQ%2FUGMn%2BQ4S%2B2nybv1yM0ihXiwhhdRzSMLPa%2BDQKcB4dpecyRSejPtVJgPup%2FWwiwacwc6DtiGQI1xB1k7rdHq8fGVagV0GKedeXGVglnIHb0Kt5epu6iwmWF5%2FEVtfU0fVCbmQn5YU1ojEGjQtpOt45oFKVICb2lec9dixsj9nPduMtxW%2Bx3M%2BOg6D6PVs9xbuOTF%2FepGqi36eOLE9glM11uBgKrWuAc6BQvesOObcHSwNJ2Qa5tFEAOKpeLsD6Lif1ACrZaGItSMdgRuMZ6A86xDTvy9tK4MkshIEytJs14FqJZuV5QBeS0Xg22Z6PImf2sMgQN%2BVaNjGeFRMPNc11%2BEnl9nnnQd0WqPHvChmAZ8%2B1uTursTwqtZ3uZ6scUx88iT00YLbKXgFG9B%2FGVhbxciXjADpLsLhO2auJdzMxUVyKsy%2BGFYe7KHBcTuDuhKYQUOBlgQ7dzEKar3bdLQgecx40xVHAJ%2FsIjH86H%2Be3Nz17yiR9eHHya%2BpbmrnsND3139ijaCcmW3Czdk82KQ4n2PhYQBODxXAD0xmK1fjNz6MnLNDiO8sKRofOMF4Lt82%2BCEkUErGwt71q0XjydUM%2Beg5GOztsvLMScXDCa0OrTBjqkAaH9pt16GBHe3PHbopSz7cHkZsHAKj96J0xQmiWC4LkxIHl5QxrQXKmAY6AEtwgnnNMUpybf9KNoYblyMMW4A2elnqTFLxIQ4Ibj3nq2Oy1w4C6VvPx7BZFjF%2FYpOda9w0ytogS3oJtKikkpz9G6O%2B6AUpTLWD2z8VDBjUXB7YmALndxUqRy%2Ftl%2F8tj2hpKfjyWc5%2FMEgTY8PRy%2BxTqa3jn9zQyu&X-Amz-Signature=ec7979385e9a1923c9c6f048e5260b722be846454f35d7ab97a23e30719b9610&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

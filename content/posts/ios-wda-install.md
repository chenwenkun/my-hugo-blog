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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466WDZGH3NL%2F20261017%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261017T095219Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEDIaCXVzLXdlc3QtMiJGMEQCIDgrIWtQrMY0twW%2Fl%2BevZKOfzhaRsnSjgjWK%2B5nM8V01AiBNIbRoT5M9pSXnB8K2XXcmRjdb6NwA2TGd0ArsrPRtlyqIBAj6%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIM5okcB1wEQMT3oOJkKtwDLoGICm4L4uqy5wPuHAFq7CTAy4i2idPBKRXdWIAd4Ij6yv54WPfPj671gWHL7HjOMpkqXGX%2FFfAhpMFwJRFEBaCqAl%2FluD92Z8F76xM6WfclIzAikMpp5L1tmDWn8MJCYs1OY%2F6P3aJjG3v%2BixWQN1lrwzZlvMrL3yr%2Bxici2U5%2BtLXSsxZGJh9NXe9yzEO84oLieUkzJ99hleB4Gf4pZd3g1q6qkPWuuck4fUGKYjPVz%2FdB6SVHbadSTvv%2BQ1DbZ5GfsWM9PT3xBHnqTO59b57dqJqJ%2By%2FZqWw37PVZNI7fdwcvb5x0mTq2pDMTR%2B9877uuVuX3HF0oDR6B3JmofRBjgvGX1xl1bghcGKKC00sVUtJzOR6mrWEN4v4nXYTB5LJ0vDNB4VUaiZYJx%2FcW4NHE6S7OkigL1MMxWAZ6LCKsS69Ezl9zbFIbRhPLUvjmcT2K8FbE1nxDtg%2Fgs7E%2FNRd4L%2BVuzobsETd%2BHpUwVN547dp1nZLuiE6vKaN%2B2pczpwBjM4LwYZMWsdyq922ACG7E8ybinvHtRP88FT1KRhIGp3tPNM6DcF4VElBGmmG%2FVtNkSEKXGzp0Jd8vZq4VV253f%2BT7nZ6TTBL70nYelteHfxYIHnB3f0kEw2kwoIjN1gY6pgFLvyb5TdBFmtDyr8mikOA9Ijp3ejaCIACXgNZrJ%2BY6QFIzGAIyyZlRo38jTCEkBPK4Hf4gGVna9Sdr4RWmEWTvlC7%2FzApoEL15Yfp6Pifzr2jrP3ynlqgJsbcKmdbVy4nbn1%2B4YvEp00ezyEjDsA0MIqULYdr5trcBauz6sDYTDt0IGqpchSwnCX8ujuEYZiflu2gu9WdJd3zir6FGm1DxQf8UwnLw&X-Amz-Signature=cd78c9e63a2abe843f9e1ce18f849d7b7471a4ab2998f110fe4e0952e7b42d9a&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466WDZGH3NL%2F20261017%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261017T095219Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEDIaCXVzLXdlc3QtMiJGMEQCIDgrIWtQrMY0twW%2Fl%2BevZKOfzhaRsnSjgjWK%2B5nM8V01AiBNIbRoT5M9pSXnB8K2XXcmRjdb6NwA2TGd0ArsrPRtlyqIBAj6%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIM5okcB1wEQMT3oOJkKtwDLoGICm4L4uqy5wPuHAFq7CTAy4i2idPBKRXdWIAd4Ij6yv54WPfPj671gWHL7HjOMpkqXGX%2FFfAhpMFwJRFEBaCqAl%2FluD92Z8F76xM6WfclIzAikMpp5L1tmDWn8MJCYs1OY%2F6P3aJjG3v%2BixWQN1lrwzZlvMrL3yr%2Bxici2U5%2BtLXSsxZGJh9NXe9yzEO84oLieUkzJ99hleB4Gf4pZd3g1q6qkPWuuck4fUGKYjPVz%2FdB6SVHbadSTvv%2BQ1DbZ5GfsWM9PT3xBHnqTO59b57dqJqJ%2By%2FZqWw37PVZNI7fdwcvb5x0mTq2pDMTR%2B9877uuVuX3HF0oDR6B3JmofRBjgvGX1xl1bghcGKKC00sVUtJzOR6mrWEN4v4nXYTB5LJ0vDNB4VUaiZYJx%2FcW4NHE6S7OkigL1MMxWAZ6LCKsS69Ezl9zbFIbRhPLUvjmcT2K8FbE1nxDtg%2Fgs7E%2FNRd4L%2BVuzobsETd%2BHpUwVN547dp1nZLuiE6vKaN%2B2pczpwBjM4LwYZMWsdyq922ACG7E8ybinvHtRP88FT1KRhIGp3tPNM6DcF4VElBGmmG%2FVtNkSEKXGzp0Jd8vZq4VV253f%2BT7nZ6TTBL70nYelteHfxYIHnB3f0kEw2kwoIjN1gY6pgFLvyb5TdBFmtDyr8mikOA9Ijp3ejaCIACXgNZrJ%2BY6QFIzGAIyyZlRo38jTCEkBPK4Hf4gGVna9Sdr4RWmEWTvlC7%2FzApoEL15Yfp6Pifzr2jrP3ynlqgJsbcKmdbVy4nbn1%2B4YvEp00ezyEjDsA0MIqULYdr5trcBauz6sDYTDt0IGqpchSwnCX8ujuEYZiflu2gu9WdJd3zir6FGm1DxQf8UwnLw&X-Amz-Signature=850f5a5653fa89446a14f9329266b47318083646dcf8af4bf8bf08525aaa37f2&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

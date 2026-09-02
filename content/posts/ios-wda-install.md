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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4662F74I3WB%2F20260902%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260902T015340Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEPL%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIFhHSGgyU0Zx47p435APUbFzxuYheVA%2B1LiMFBgRqCxIAiB9yjPfEnLSYpAA%2BmpKs9oOo9uw5b3NR5Wh7dz7xwdR8yqIBAi7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMEmfLPuBS4X7UGO0RKtwDUqSxg85dQD5LMvMKds%2BVe9qlWcaVBZJ1kfewJAPQUi5i1455zwax9UjZVYKrs6Q4eelYwwzJWaWc3cVsUbEMgnnmAVMFdAbQLByz0Nzf1XiMRH%2B5aq0gsX9rDcKaZZN4FVDv%2FWIAMXLNDoh1nXYuTOu2ZiWFMOHuzwGYd2WGrErBR%2ByAyRX%2FqJZLJY87ul%2BLP37DjjtVlFHLF97V8RkCMThCbmUCwNgQQUcSK83ebDP%2BLZR4KBpOFldLu%2BVK3o3Hy09v3%2FayQ1E1VJ0qHeFh6JHmO7XxYaSov9fXBzcV237%2BAQ0R3zZ5xRZQ%2FFynDfMZI5MsDRfEs%2BS8WRwgpzeUxYdL%2FZCH4qoVd16uknjNXS7L8DjFY4XD5AqXG4r01Io7yVOGKjy0hesIFTwO3zRb2LvyPelZXx02BhmQz4gLl3cM%2F5rN71bIGC6SRafbT5eimZKSA%2Bim2gFRvZPm1JL10zKouU6Y2XvGpFvdwyShD7X7u4XwfmNN4EIomqiavIOk9OylXDc1o%2BqTlIs%2BVLPaS7nb2LDrNW7t2%2BTeAmGl3xeyXdPq7zPn5IWxwjgYjrBQyuAdTAGaWp3bM%2BFC6RUWZHoAJiWpLmCVPdXOxiiCjxubYQ8S3Rnb3PXZkVIwiYHe1AY6pgFVHpL%2Bx2DDy0tRsBv32vYGd%2FJtA7BPxJ0FpNyZJcQjUwo6nSh6aB07D2uQ5KkMcAM%2F9eKBsHXm9KLMuKfwXigrRRuUKmy3LvuKMCqqpYG0H%2FVp9IZaHE92SU1ckmisaAOXX%2BYUhcjogi5Rvjh4Lv2cwfaflqwsjHYjD4nLWMXG43JD5qEsj%2FO1LGNYxYWJ%2FHFYtl6fg%2BVSyTnx19oUeKKnXewookOi&X-Amz-Signature=e6c46fab1914111e265a1793e8c8a302db4b3fd6a37bfaf3cb4b86a8d6ad894d&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4662F74I3WB%2F20260902%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260902T015340Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEPL%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIFhHSGgyU0Zx47p435APUbFzxuYheVA%2B1LiMFBgRqCxIAiB9yjPfEnLSYpAA%2BmpKs9oOo9uw5b3NR5Wh7dz7xwdR8yqIBAi7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMEmfLPuBS4X7UGO0RKtwDUqSxg85dQD5LMvMKds%2BVe9qlWcaVBZJ1kfewJAPQUi5i1455zwax9UjZVYKrs6Q4eelYwwzJWaWc3cVsUbEMgnnmAVMFdAbQLByz0Nzf1XiMRH%2B5aq0gsX9rDcKaZZN4FVDv%2FWIAMXLNDoh1nXYuTOu2ZiWFMOHuzwGYd2WGrErBR%2ByAyRX%2FqJZLJY87ul%2BLP37DjjtVlFHLF97V8RkCMThCbmUCwNgQQUcSK83ebDP%2BLZR4KBpOFldLu%2BVK3o3Hy09v3%2FayQ1E1VJ0qHeFh6JHmO7XxYaSov9fXBzcV237%2BAQ0R3zZ5xRZQ%2FFynDfMZI5MsDRfEs%2BS8WRwgpzeUxYdL%2FZCH4qoVd16uknjNXS7L8DjFY4XD5AqXG4r01Io7yVOGKjy0hesIFTwO3zRb2LvyPelZXx02BhmQz4gLl3cM%2F5rN71bIGC6SRafbT5eimZKSA%2Bim2gFRvZPm1JL10zKouU6Y2XvGpFvdwyShD7X7u4XwfmNN4EIomqiavIOk9OylXDc1o%2BqTlIs%2BVLPaS7nb2LDrNW7t2%2BTeAmGl3xeyXdPq7zPn5IWxwjgYjrBQyuAdTAGaWp3bM%2BFC6RUWZHoAJiWpLmCVPdXOxiiCjxubYQ8S3Rnb3PXZkVIwiYHe1AY6pgFVHpL%2Bx2DDy0tRsBv32vYGd%2FJtA7BPxJ0FpNyZJcQjUwo6nSh6aB07D2uQ5KkMcAM%2F9eKBsHXm9KLMuKfwXigrRRuUKmy3LvuKMCqqpYG0H%2FVp9IZaHE92SU1ckmisaAOXX%2BYUhcjogi5Rvjh4Lv2cwfaflqwsjHYjD4nLWMXG43JD5qEsj%2FO1LGNYxYWJ%2FHFYtl6fg%2BVSyTnx19oUeKKnXewookOi&X-Amz-Signature=6d9759b2bd11dbb36b40f5a24c3df3fc72d75330d05b8629b1248f477a74c853&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

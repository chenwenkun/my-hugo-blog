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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB46657NP6TLZ%2F20261004%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261004T203749Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEAQaCXVzLXdlc3QtMiJIMEYCIQC9%2FhsswcerpxD16YhNr%2BWAD6KSkpoFTvHQj7zYuIOoEwIhAOI7kVrbDhK8haBvU8h3oLp8fN7SaKUox%2B9HJFCYhRWtKogECMz%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgyfEuZQfXUEE25GioMq3AP7Ix%2FNHoGv8uU8cH%2BgQtXbBWAVcGKZXgGFqi%2FFtoX4BnJyapo%2BxNRVrTzRG82vBiHUWqAd4R4roYwq3V30lIk9VgZ7xfxcrlKDeWFMHz0CPIo6P0v0wpXNDczyzcp6sJu2pA4qENTJEgQErY9yXhFz3HXIPJkqKZUul3t2sOLR6MWx95WJJV5ZT1MNk1UEDk%2B1%2B7ZLy6h0HwLkjNB0kOd3W2NbNFlEWVTtQgu%2B1Cykx1iE9w7a25L%2FpFwsA%2BOcX8mRr6BVI51mC23sm9Xz%2BNCIgH4kXYVLdpyPB8oPVdy8XKO5VgMCbAMyPtI4izdzXv9R2W2%2F7WDU7t1zHtwpBYca9XHABDGyW%2B%2FGOxkwUetn%2BWzyxJE%2BJfxDOL1GJal%2BuMIlNWZL7Oa%2FQkxQ38TDhBfQ2DYkWL49WQMrKIYS2YLckAURQWp%2BYhxXfwZdT4R5%2BftcTO3IBeFKEj6BWRi2IaX84F%2BdJMnSp2PJbTXvrR5bZdIO%2Bhv%2FDrdGNv9EqOhSmm5u8RG6iBgeKnBIMmG6x7dgdKmKlj5X%2Fr1d3MkoqneU%2Ft%2BJdjmOw7yAf44GcDgD7AUneNcJ3UmqnyGCviCz2foY70nhc%2B2vMQL%2FYy3F2BD2NMruk34Izm11F%2BsZpzC034rWBjqkAflrNU8OawnndK1bIlH6Gf2HFUy5Gx7%2FfKRhMvR2ldNaEqYYJFmyIviTFgCLMKUc4cDuy1Xa4r8AjiYBoekyFE7ad43vkCN4hOr%2B7v3A9wpLnlU3vOg0RA9MY7vSfyDiX6pnM4Y5HJJwARACrOkIgVBt%2B0A%2Bgyq48v3%2BAjBRcGS%2FT3ogZeep0POWKcBlOwExMwPrKkU%2BqMr2Sy80ZCdqYC3KzM6u&X-Amz-Signature=eb3189b10bfb56747f920d5d447f6d8611b380f4df2d312c8e219545fb95e571&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB46657NP6TLZ%2F20261004%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261004T203749Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEAQaCXVzLXdlc3QtMiJIMEYCIQC9%2FhsswcerpxD16YhNr%2BWAD6KSkpoFTvHQj7zYuIOoEwIhAOI7kVrbDhK8haBvU8h3oLp8fN7SaKUox%2B9HJFCYhRWtKogECMz%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgyfEuZQfXUEE25GioMq3AP7Ix%2FNHoGv8uU8cH%2BgQtXbBWAVcGKZXgGFqi%2FFtoX4BnJyapo%2BxNRVrTzRG82vBiHUWqAd4R4roYwq3V30lIk9VgZ7xfxcrlKDeWFMHz0CPIo6P0v0wpXNDczyzcp6sJu2pA4qENTJEgQErY9yXhFz3HXIPJkqKZUul3t2sOLR6MWx95WJJV5ZT1MNk1UEDk%2B1%2B7ZLy6h0HwLkjNB0kOd3W2NbNFlEWVTtQgu%2B1Cykx1iE9w7a25L%2FpFwsA%2BOcX8mRr6BVI51mC23sm9Xz%2BNCIgH4kXYVLdpyPB8oPVdy8XKO5VgMCbAMyPtI4izdzXv9R2W2%2F7WDU7t1zHtwpBYca9XHABDGyW%2B%2FGOxkwUetn%2BWzyxJE%2BJfxDOL1GJal%2BuMIlNWZL7Oa%2FQkxQ38TDhBfQ2DYkWL49WQMrKIYS2YLckAURQWp%2BYhxXfwZdT4R5%2BftcTO3IBeFKEj6BWRi2IaX84F%2BdJMnSp2PJbTXvrR5bZdIO%2Bhv%2FDrdGNv9EqOhSmm5u8RG6iBgeKnBIMmG6x7dgdKmKlj5X%2Fr1d3MkoqneU%2Ft%2BJdjmOw7yAf44GcDgD7AUneNcJ3UmqnyGCviCz2foY70nhc%2B2vMQL%2FYy3F2BD2NMruk34Izm11F%2BsZpzC034rWBjqkAflrNU8OawnndK1bIlH6Gf2HFUy5Gx7%2FfKRhMvR2ldNaEqYYJFmyIviTFgCLMKUc4cDuy1Xa4r8AjiYBoekyFE7ad43vkCN4hOr%2B7v3A9wpLnlU3vOg0RA9MY7vSfyDiX6pnM4Y5HJJwARACrOkIgVBt%2B0A%2Bgyq48v3%2BAjBRcGS%2FT3ogZeep0POWKcBlOwExMwPrKkU%2BqMr2Sy80ZCdqYC3KzM6u&X-Amz-Signature=02378a1ac00efebcc8452ebdda5d30af55b46012e99f452570a1859b97602307&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

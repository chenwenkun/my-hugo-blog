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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466XEYG4MTJ%2F20260804%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260804T134520Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEEUaCXVzLXdlc3QtMiJHMEUCIGkpJ336UA9nJGuhkKltOUnimm6ep%2BshuvOz%2BUDYk1AkAiEA7luW6HYDmvI9z5vGN4Xrr5LGTsz9g6obOa2p1NvygSEq%2FwMIDhAAGgw2Mzc0MjMxODM4MDUiDDqQ9QNiu%2BOes5SBOCrcA28Q8iJeMB3%2BCuf3xyty%2BunERqkovtbOLdfD9GYyvbfG9oeGiUCL3LJlo7bfPMnyElDoTaPre75pqIm2zj0qWtz61XVkHcep2cs6DGXVJZkoGKHI7c9RuLErc20mTcX38%2FAWgC8nYk2WoAyXpcDlOSL7YkR3D3p3yjBh3SPBan%2BvFVr1gA%2Bb9FB6mRb4IfYGrW26hlyw5WywAhUFLz7wNPS9zSpVHPVoCt2jssI8WB%2BG9pA5UyawS14LheGh2rGFiMpYHbYdi8SZfH0zEphNd0L%2BrJ2CtuEaWpuQus6rddAog19xa9dWKkoE9Gpf7KvFbLVIk6Mg1fY7FCTqYRiAKA2q6l6ZkXGaNgbNkKZYE6nOAVMlqfkwmcQLehK8zdpjnyz2xIy7kVdsnLR%2B9aLZk%2BYtwTP7iuSZnMkIcvOG5Rut4FfJJ2Yx%2Bngr2y7ZaytN4i2rUhqiGEhRBYb7fdnkthM7Yo10d2ml1DI39y%2F5xucCfqVljGonNR99Yt1dxGZu9TKmGdsqtQrpkiwnVFzDKRvkUAasGK61Ymy8pWZZvYWfPMvCDYEkJTlxRo447cQt69qhR1P1hlwbug8NuiDcD6MmHU8zBNFIgF55aI1%2B5y8d3YC6fy3RodzamyJCMILDx9MGOqUBoA3DFtPffWJ3yiKnzcXwkXkTrAKW%2FQrfvGUusNL%2F1yAyYG6dWkQEssSuFg8T1AT%2FA9K4T15CUGBOclExwOgf4AQ2xe7%2BwOf0xLhMJlPsBuJUU5ivbJNuYNUBZw4x2xENob0g99sz6IgET2N8eLmjiNmxYzVEFHo4bAR2YuR9n%2B832OxdFwbbwo%2FYIWLzOl5OSI5q%2FfNFaesGQy%2BcAG2AlsClbhrY&X-Amz-Signature=6e03940adc9929ed8a67d1bd4ba45b191fca94b9f59f450c0e520ab5ac6c8523&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466XEYG4MTJ%2F20260804%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260804T134520Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEEUaCXVzLXdlc3QtMiJHMEUCIGkpJ336UA9nJGuhkKltOUnimm6ep%2BshuvOz%2BUDYk1AkAiEA7luW6HYDmvI9z5vGN4Xrr5LGTsz9g6obOa2p1NvygSEq%2FwMIDhAAGgw2Mzc0MjMxODM4MDUiDDqQ9QNiu%2BOes5SBOCrcA28Q8iJeMB3%2BCuf3xyty%2BunERqkovtbOLdfD9GYyvbfG9oeGiUCL3LJlo7bfPMnyElDoTaPre75pqIm2zj0qWtz61XVkHcep2cs6DGXVJZkoGKHI7c9RuLErc20mTcX38%2FAWgC8nYk2WoAyXpcDlOSL7YkR3D3p3yjBh3SPBan%2BvFVr1gA%2Bb9FB6mRb4IfYGrW26hlyw5WywAhUFLz7wNPS9zSpVHPVoCt2jssI8WB%2BG9pA5UyawS14LheGh2rGFiMpYHbYdi8SZfH0zEphNd0L%2BrJ2CtuEaWpuQus6rddAog19xa9dWKkoE9Gpf7KvFbLVIk6Mg1fY7FCTqYRiAKA2q6l6ZkXGaNgbNkKZYE6nOAVMlqfkwmcQLehK8zdpjnyz2xIy7kVdsnLR%2B9aLZk%2BYtwTP7iuSZnMkIcvOG5Rut4FfJJ2Yx%2Bngr2y7ZaytN4i2rUhqiGEhRBYb7fdnkthM7Yo10d2ml1DI39y%2F5xucCfqVljGonNR99Yt1dxGZu9TKmGdsqtQrpkiwnVFzDKRvkUAasGK61Ymy8pWZZvYWfPMvCDYEkJTlxRo447cQt69qhR1P1hlwbug8NuiDcD6MmHU8zBNFIgF55aI1%2B5y8d3YC6fy3RodzamyJCMILDx9MGOqUBoA3DFtPffWJ3yiKnzcXwkXkTrAKW%2FQrfvGUusNL%2F1yAyYG6dWkQEssSuFg8T1AT%2FA9K4T15CUGBOclExwOgf4AQ2xe7%2BwOf0xLhMJlPsBuJUU5ivbJNuYNUBZw4x2xENob0g99sz6IgET2N8eLmjiNmxYzVEFHo4bAR2YuR9n%2B832OxdFwbbwo%2FYIWLzOl5OSI5q%2FfNFaesGQy%2BcAG2AlsClbhrY&X-Amz-Signature=d0f62f646b02d47d6ab4f0c29236223c9b6a6624fae5e0f0c4c073a5ff2526f2&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

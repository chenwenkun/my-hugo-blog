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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466VBJHMDKP%2F20260906%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260906T143437Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEFwaCXVzLXdlc3QtMiJHMEUCIQDnwe5IxxwvjoOZCDHoqVCxb6w4eFz2zz5uF3Zv%2BK4JUwIgB59pcQ0vZm6Z%2B2Y7o%2B1MFjHqQT%2FfebHG6qgGfEBham8q%2FwMIJRAAGgw2Mzc0MjMxODM4MDUiDNhzNRC9EsRRM9D4BSrcA4JfVo3UVcY69EEQqsD%2BwsPYAi1YiAPDaoAhM890Bx6UYewWLdI23OWVduj%2FmlW5H%2FYVectC3x87RSPDn5%2BWbywHlfz4OaKitjz1eEhsXKaGCNwv7CEksKJAmbjwHpusLakhgK8%2BPigVkY1OE50LuhdIs2kECYj8doPSEtpN2NbBRQzUQu1jgQMaZ4yE2r1rxBPM6HXa75ees36OrxaLBi1KsGF6e2heF%2BgS%2FEJmNSqoKJF93US2SaXzDXxkY2ZgaO3Ev%2FLbuEmeff4af02LRirNPow7l%2FgKUGJsR8uLW%2FacUr9TDUrg%2BSEQTLn0daTP7FlxkfwBzJAOdUqdazVqU%2FzFMOi7JLo92RGbYjfZL7eAh1dOWMfIHZ2%2BpxOcT%2Bs2x%2F%2BMdyRSt0qe3%2FtEH15BCnxTROL3Ks2tmBF6teWS2Aj7kbSLcLwFsclCV4Fm9B5koxg3ZwJo3HQoY73Ieb8e1A72uDSojZCp1U%2F2nHWNsLLjnPDSrjqyVejd6WGWlyOOQZapMwhNcFwkz22Aj7cbqO4uWrbRhyojzXtc%2B%2Bs56qaa0bZtivAXQI8qhRgkDUmrcFQYHUV%2BGGRxjG0eNxe7qg4%2FTYyIokOc%2FlQhxqLCqNuRvzHQWCrSvlghk%2FuJMIer9dQGOqUBfxMmLul%2FVKqNICf3tBanmwirT%2BCVZv0TCKqlHSY5O0bN14zegH0Z1Tb1OT1tzBsif8y%2F%2FtfuHWlCdpG6auZe7lv3wJelYrG6nkmfHw2fPtuz0O8weJSUDx%2BxT7mOFHVQ3FVd2vEAyWFBg41iU%2FIQcOkchzT2sFSTk6XthUld%2FLAC%2FDlrMTD4kg%2F3jks9UNQMDKpdcGH75RCvN7jzalJAqL1YcHfL&X-Amz-Signature=886149face6c3ad6f4406587a39935728e27ebc8d02b25fcfdcbea42bac246de&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466VBJHMDKP%2F20260906%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260906T143437Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEFwaCXVzLXdlc3QtMiJHMEUCIQDnwe5IxxwvjoOZCDHoqVCxb6w4eFz2zz5uF3Zv%2BK4JUwIgB59pcQ0vZm6Z%2B2Y7o%2B1MFjHqQT%2FfebHG6qgGfEBham8q%2FwMIJRAAGgw2Mzc0MjMxODM4MDUiDNhzNRC9EsRRM9D4BSrcA4JfVo3UVcY69EEQqsD%2BwsPYAi1YiAPDaoAhM890Bx6UYewWLdI23OWVduj%2FmlW5H%2FYVectC3x87RSPDn5%2BWbywHlfz4OaKitjz1eEhsXKaGCNwv7CEksKJAmbjwHpusLakhgK8%2BPigVkY1OE50LuhdIs2kECYj8doPSEtpN2NbBRQzUQu1jgQMaZ4yE2r1rxBPM6HXa75ees36OrxaLBi1KsGF6e2heF%2BgS%2FEJmNSqoKJF93US2SaXzDXxkY2ZgaO3Ev%2FLbuEmeff4af02LRirNPow7l%2FgKUGJsR8uLW%2FacUr9TDUrg%2BSEQTLn0daTP7FlxkfwBzJAOdUqdazVqU%2FzFMOi7JLo92RGbYjfZL7eAh1dOWMfIHZ2%2BpxOcT%2Bs2x%2F%2BMdyRSt0qe3%2FtEH15BCnxTROL3Ks2tmBF6teWS2Aj7kbSLcLwFsclCV4Fm9B5koxg3ZwJo3HQoY73Ieb8e1A72uDSojZCp1U%2F2nHWNsLLjnPDSrjqyVejd6WGWlyOOQZapMwhNcFwkz22Aj7cbqO4uWrbRhyojzXtc%2B%2Bs56qaa0bZtivAXQI8qhRgkDUmrcFQYHUV%2BGGRxjG0eNxe7qg4%2FTYyIokOc%2FlQhxqLCqNuRvzHQWCrSvlghk%2FuJMIer9dQGOqUBfxMmLul%2FVKqNICf3tBanmwirT%2BCVZv0TCKqlHSY5O0bN14zegH0Z1Tb1OT1tzBsif8y%2F%2FtfuHWlCdpG6auZe7lv3wJelYrG6nkmfHw2fPtuz0O8weJSUDx%2BxT7mOFHVQ3FVd2vEAyWFBg41iU%2FIQcOkchzT2sFSTk6XthUld%2FLAC%2FDlrMTD4kg%2F3jks9UNQMDKpdcGH75RCvN7jzalJAqL1YcHfL&X-Amz-Signature=49839d8a39d3fce211d602bee40bef520e72e139604a19d3480a8356d63362e1&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

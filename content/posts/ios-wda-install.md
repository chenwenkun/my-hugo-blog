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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4665TFUEGIR%2F20260821%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260821T182043Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEOH%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIAG0p%2FJkzJyk8DN%2FWFklPSNQ3AEeZBUSkf0vn87%2FEDcaAiEAoQfIthRTvQ%2BLrnl43%2F6tj8QfJ7HUeh8ioYW3AThMSWcqiAQIqv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDBOJ63ig2K3IRl5RHircA6sl04A%2B3SJURBBCklrRGKTdwfp4LQTvz0I8Wx%2FJNYq1jNm3R0o6mhl8JwoYHDkMSobmTqlz7UBLzBp16xwi4KHomQtBs6VNM2dmlr3RLQIiJZiie%2BoiCEdNsCMtXlRk0GPZRC9S29nbKkQmiBh7z0SALa2I5PvPFvDXhOr4iis2DO3%2B3BlrxPbmlYMJrxRFGxt2rfp17wdo%2Fyw%2B1PJ0TplzrHrqsn5DLFIZW8NZ0nvwZMr6KUNi7c1Rre03HF52e1%2FcOGckxLQyMCjUd9woJYFgAJ6ldpyb9vFimcYhXy%2BI3oM%2F%2BE5a8%2BChlPWg6HVDWs%2B8mbuiTqXRhwBQGA7C0mP3RoBi6Ah0BJ2vpe9poL%2B8kZ%2FGePFlqLqifeRs7XVVwJ1YmMd%2Bg3hyAC8vygYPOlohjlk2yuQsowGPLiJRtpPJ%2FAt6deOeC8f49kBDszY4lMT9hT99Cnk6DAj0MwjIpHsUXVN1fRCAwBga9%2BadgfU47enWhQ3uxkrTGodNipx1%2BVgUJtHvE6TZ2aN3j6BPVPAsI9%2BCMqOp062guKMO951gvKkcQszzP6AanrPbXPna134jnzc8nJAoH8wWcNKXjukLDIiDfYVqLU9VfARqpzX%2Bw6biFW9IlluCU3VxMM75odQGOqUB78vuYh1nIGLADfp%2Be%2FNDuUS%2FjPBIY4kGWcGRVerKZP5%2BxJ2YBsvmkd2MKyzvLk1LLI1aN%2Fl4uMRIjbT11B9sjbaceSNZnK2PJhUBpWNa5VMntV22nw%2B%2FXOFj%2Bt47Z%2BlZuxtMnx%2Bzwg3kCbmCxCfawDap9Bl4lHVuu5I9%2FuMP5ZfRxjSCWq1D7KrBpulcva8xbNBzM86mcNya0yXjJxe%2BSg%2BVhntE&X-Amz-Signature=cffeeabe1e081c019a8feb139db93c62439d23fafdf62e2512cf0de70683d3ef&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4665TFUEGIR%2F20260821%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260821T182043Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEOH%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIAG0p%2FJkzJyk8DN%2FWFklPSNQ3AEeZBUSkf0vn87%2FEDcaAiEAoQfIthRTvQ%2BLrnl43%2F6tj8QfJ7HUeh8ioYW3AThMSWcqiAQIqv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDBOJ63ig2K3IRl5RHircA6sl04A%2B3SJURBBCklrRGKTdwfp4LQTvz0I8Wx%2FJNYq1jNm3R0o6mhl8JwoYHDkMSobmTqlz7UBLzBp16xwi4KHomQtBs6VNM2dmlr3RLQIiJZiie%2BoiCEdNsCMtXlRk0GPZRC9S29nbKkQmiBh7z0SALa2I5PvPFvDXhOr4iis2DO3%2B3BlrxPbmlYMJrxRFGxt2rfp17wdo%2Fyw%2B1PJ0TplzrHrqsn5DLFIZW8NZ0nvwZMr6KUNi7c1Rre03HF52e1%2FcOGckxLQyMCjUd9woJYFgAJ6ldpyb9vFimcYhXy%2BI3oM%2F%2BE5a8%2BChlPWg6HVDWs%2B8mbuiTqXRhwBQGA7C0mP3RoBi6Ah0BJ2vpe9poL%2B8kZ%2FGePFlqLqifeRs7XVVwJ1YmMd%2Bg3hyAC8vygYPOlohjlk2yuQsowGPLiJRtpPJ%2FAt6deOeC8f49kBDszY4lMT9hT99Cnk6DAj0MwjIpHsUXVN1fRCAwBga9%2BadgfU47enWhQ3uxkrTGodNipx1%2BVgUJtHvE6TZ2aN3j6BPVPAsI9%2BCMqOp062guKMO951gvKkcQszzP6AanrPbXPna134jnzc8nJAoH8wWcNKXjukLDIiDfYVqLU9VfARqpzX%2Bw6biFW9IlluCU3VxMM75odQGOqUB78vuYh1nIGLADfp%2Be%2FNDuUS%2FjPBIY4kGWcGRVerKZP5%2BxJ2YBsvmkd2MKyzvLk1LLI1aN%2Fl4uMRIjbT11B9sjbaceSNZnK2PJhUBpWNa5VMntV22nw%2B%2FXOFj%2Bt47Z%2BlZuxtMnx%2Bzwg3kCbmCxCfawDap9Bl4lHVuu5I9%2FuMP5ZfRxjSCWq1D7KrBpulcva8xbNBzM86mcNya0yXjJxe%2BSg%2BVhntE&X-Amz-Signature=4df8c62d92098f6b69f8d633a46bfc713d0337a998d1261c38d6bd35e3cbdf6c&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

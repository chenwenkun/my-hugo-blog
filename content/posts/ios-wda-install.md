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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4662J734WJ4%2F20261025%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261025T102059Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEO7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQDZmBRwvNxmzy270nwhN43%2BdA%2B14%2BnvpOH4Nu1q%2FAQQpAIhAMp2jE8ysRmaUvGAepBr4RtgyiAGtWhE3u4nXEi%2BuZ1pKogECLf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgwPTJ8GFnpEsUGADWUq3AN3yX71qEIDV52v7I7ZaG24FUn3HKdfMH3oSk4YmcdSLFMD6%2FzFkQjUY7ZHxFIaJwXVFHR1eR7MD448lniWH7JimobkQxIsjuoPIFCOVYaRky51%2FJocmLjNoxvfsrFg78m8II6BXPMmWRU8l2LkG7HO%2FB5oOKIjsbNC8%2BIIlHKRtltwf7w38YwR5%2FE5IAyrACJ04W0cof1loqYZWmMms%2BELySmJiT8McXUxFS0%2FAeUvL4yP15UcN%2BE%2F6cucfheYh3%2FjLwb7%2FhVDXaXKAwTH0JYWN8HytBr8IRXSdEBAfIy0PUWQSyDyelmzsxb6ojC%2BF0M%2BDKjmJgDzUXxIOLYyb8Mv%2F8KQM01C8cg%2B4OS69osUVYCiKVhCFeNvMiEot1JlZyzaQUc8qWEnINd9kX6vdXyIaVJRSsUhls0m7ZHL6QKI%2FyTWa1gLevkvALiB1ymBpN83IUoPBXEEfkP6yP2F02%2B0hiyP6WnxGq1mRMeeysXvWCKVleva6eJVCDkPZWioy7ASRor%2FNn67GgD0FZjboOkPX2uC4EEf%2BvbJfnl24FY5W9nkzsTNHh990zUQM9Tf6vhyDiyDfrEI0nt6QJflfr38JcO88mfbvLEldwSiV%2FoiooQZQYJFx0Ew5iuXbDCEtPbWBjqkAWJc4bYL4T3B36kIIqRYadgpOyHGxQIhtgnp2a%2BALFBgoUeNW51FFz%2FiSK2VkN2Yq7%2BlFUSgE%2FPnz5MsMEeVDeRD0GoRpjnQk6n%2BzXrgDeUoXxVcTlGCkw8DJPL1Uo4IalgOR%2BMriLCM1sbZVs%2BdhAL8QRy08cebAyhxYnzeO8kgb0NtqYStVyoFJSGBnx0YQSSWj9v2aTgainp%2FsImtEHAAnxAM&X-Amz-Signature=bf4d4374ba41fa92b80afdcc0d357ae40df61e1e12533d5e719c74785c06638b&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4662J734WJ4%2F20261025%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261025T102059Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEO7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQDZmBRwvNxmzy270nwhN43%2BdA%2B14%2BnvpOH4Nu1q%2FAQQpAIhAMp2jE8ysRmaUvGAepBr4RtgyiAGtWhE3u4nXEi%2BuZ1pKogECLf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgwPTJ8GFnpEsUGADWUq3AN3yX71qEIDV52v7I7ZaG24FUn3HKdfMH3oSk4YmcdSLFMD6%2FzFkQjUY7ZHxFIaJwXVFHR1eR7MD448lniWH7JimobkQxIsjuoPIFCOVYaRky51%2FJocmLjNoxvfsrFg78m8II6BXPMmWRU8l2LkG7HO%2FB5oOKIjsbNC8%2BIIlHKRtltwf7w38YwR5%2FE5IAyrACJ04W0cof1loqYZWmMms%2BELySmJiT8McXUxFS0%2FAeUvL4yP15UcN%2BE%2F6cucfheYh3%2FjLwb7%2FhVDXaXKAwTH0JYWN8HytBr8IRXSdEBAfIy0PUWQSyDyelmzsxb6ojC%2BF0M%2BDKjmJgDzUXxIOLYyb8Mv%2F8KQM01C8cg%2B4OS69osUVYCiKVhCFeNvMiEot1JlZyzaQUc8qWEnINd9kX6vdXyIaVJRSsUhls0m7ZHL6QKI%2FyTWa1gLevkvALiB1ymBpN83IUoPBXEEfkP6yP2F02%2B0hiyP6WnxGq1mRMeeysXvWCKVleva6eJVCDkPZWioy7ASRor%2FNn67GgD0FZjboOkPX2uC4EEf%2BvbJfnl24FY5W9nkzsTNHh990zUQM9Tf6vhyDiyDfrEI0nt6QJflfr38JcO88mfbvLEldwSiV%2FoiooQZQYJFx0Ew5iuXbDCEtPbWBjqkAWJc4bYL4T3B36kIIqRYadgpOyHGxQIhtgnp2a%2BALFBgoUeNW51FFz%2FiSK2VkN2Yq7%2BlFUSgE%2FPnz5MsMEeVDeRD0GoRpjnQk6n%2BzXrgDeUoXxVcTlGCkw8DJPL1Uo4IalgOR%2BMriLCM1sbZVs%2BdhAL8QRy08cebAyhxYnzeO8kgb0NtqYStVyoFJSGBnx0YQSSWj9v2aTgainp%2FsImtEHAAnxAM&X-Amz-Signature=c8ef9c98a09cbd643f7a530b6316d6ae5fb67410d0f3b4d5a1f0ce6287d5a991&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466XE3X3QHA%2F20261011%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261011T165832Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEKn%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIFS4K1TfjwLndtb0Kps9LcUI63z38H5NPOZD2YBouBvkAiAush3Rbg27W0ssleNoo8%2BqswAktlMPSZz7A%2FbeUygesCr%2FAwhxEAAaDDYzNzQyMzE4MzgwNSIMgP0lvuStMLjFlVpdKtwDDP4Hpe%2BcFmQsOVLzo5XIm9cZHeuIlhNQII7F3eJGKbHFIJ%2BwrYleD0SatTPXLvEPvVzMR4ArUAAahJXJiJwI478gho%2BJac8vuYBZ94gjK0z6am2%2B99vVLJ%2BkYd%2F%2B9iYrxhA6TT2R90nCckB3llaDOheLPJJkPbb4UI%2BPCYPX8TD6Rsi0A9777OpeoBvMAHhfF%2Fw%2B19r2YUB0NDLZfHpsWqfcGUzEda%2B9sRo5ePYNT5N4piIL3x%2B%2B1ZwqI6aSb2a7Xz%2BRBpLq0REmT9whVPr4Ba3GDZux41c25kZ1bzdh5J4Prjm3Pc2SD4mlQ7PBWI44rQkviiyk8n3%2Bwc6faIOQvnFH%2BtKu%2Fr1Xc8wRz761hWT%2Bph3ReHQJ2UuE925e98sHiSkRgdsNahXIJNh10oXdpRYwuQI4EeZdJjYZSqXEfHcOdn60dNblM5%2BEjcw9VI3JLYU1M1%2FZhtuI3FxxAINB%2B7s0FVdqf03hxnZg%2FKDnAgQdbDrn9hoFH0Aco74DMriT3kBP6RZrDvmgpNZkI0nVHQE9HSx9I2%2F3%2FUYkj3Tt6KJtRurmNm1E05s8QFzWJrGELbIqXnZWTg6mcdimFErVuBWA%2BnNMGdsncb9BODCp8M0TO4c0T3tMm7JYGp0w7O%2Bu1gY6pgHlC%2FngxGCyvPC9H%2F0zdb00haVOYStJcLw9xqll621brwRBzo56MOKTZCyvkce0yFsdmuvCEFUdEo0din48ox5TVybpwUUeklqvMeBHEpF9aow627POZddk1P2Qxeg5bxx60mY6BF5UwrPj7UDdf9Fv5hn2rH9g4rZP23WQ8WXalB77U0B%2F%2BFzHZrig83AcKkQOKlYGgBovvQK7YgF4xQq4REgts0mT&X-Amz-Signature=50d28e29fb9f698758162a4b3612ff322e7fa6aa1dc47b1c30d9c8946fbde875&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466XE3X3QHA%2F20261011%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261011T165832Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEKn%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIFS4K1TfjwLndtb0Kps9LcUI63z38H5NPOZD2YBouBvkAiAush3Rbg27W0ssleNoo8%2BqswAktlMPSZz7A%2FbeUygesCr%2FAwhxEAAaDDYzNzQyMzE4MzgwNSIMgP0lvuStMLjFlVpdKtwDDP4Hpe%2BcFmQsOVLzo5XIm9cZHeuIlhNQII7F3eJGKbHFIJ%2BwrYleD0SatTPXLvEPvVzMR4ArUAAahJXJiJwI478gho%2BJac8vuYBZ94gjK0z6am2%2B99vVLJ%2BkYd%2F%2B9iYrxhA6TT2R90nCckB3llaDOheLPJJkPbb4UI%2BPCYPX8TD6Rsi0A9777OpeoBvMAHhfF%2Fw%2B19r2YUB0NDLZfHpsWqfcGUzEda%2B9sRo5ePYNT5N4piIL3x%2B%2B1ZwqI6aSb2a7Xz%2BRBpLq0REmT9whVPr4Ba3GDZux41c25kZ1bzdh5J4Prjm3Pc2SD4mlQ7PBWI44rQkviiyk8n3%2Bwc6faIOQvnFH%2BtKu%2Fr1Xc8wRz761hWT%2Bph3ReHQJ2UuE925e98sHiSkRgdsNahXIJNh10oXdpRYwuQI4EeZdJjYZSqXEfHcOdn60dNblM5%2BEjcw9VI3JLYU1M1%2FZhtuI3FxxAINB%2B7s0FVdqf03hxnZg%2FKDnAgQdbDrn9hoFH0Aco74DMriT3kBP6RZrDvmgpNZkI0nVHQE9HSx9I2%2F3%2FUYkj3Tt6KJtRurmNm1E05s8QFzWJrGELbIqXnZWTg6mcdimFErVuBWA%2BnNMGdsncb9BODCp8M0TO4c0T3tMm7JYGp0w7O%2Bu1gY6pgHlC%2FngxGCyvPC9H%2F0zdb00haVOYStJcLw9xqll621brwRBzo56MOKTZCyvkce0yFsdmuvCEFUdEo0din48ox5TVybpwUUeklqvMeBHEpF9aow627POZddk1P2Qxeg5bxx60mY6BF5UwrPj7UDdf9Fv5hn2rH9g4rZP23WQ8WXalB77U0B%2F%2BFzHZrig83AcKkQOKlYGgBovvQK7YgF4xQq4REgts0mT&X-Amz-Signature=db800d96f42bf9aa9a2bcc903993035ddee24bbbf71d596bee245477adb1c636&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

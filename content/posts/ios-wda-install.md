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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4665PHJXMZW%2F20261014%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261014T023650Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEOP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIDPfwAVJ7GfIeI4SvmyoEs2ETNOspH5zfGOhdlN35Bw9AiA6T2F6ERdtBoIeuN5N93B7i4w86Gm0vhuRezgn5lbMSSqIBAir%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMCbdk%2ByIf%2FxotorIeKtwDrVL%2FMiS%2BpnvuRK9JwAjXZnqizXbb%2Bu8V2pLYIGxOCLIJz2KFUpc6J5BsZONr1BNkHyWIQ7REZ%2Fwx95Ze%2Bw4ZDV%2Fmnj9z0bl7O4pYlXMUhDwbQJ0ksgd1BZoK8ESR3%2F2JyQpKaruhT0qbf%2B24gKxH2YR%2BwDAcPjUhUW42R4ppAFIJCfwzEuanNQRKQuC0srVf26bAicizPFfWie14a%2BHMPA0Kl5C9w3lAD%2FdNZD8SB8CAvnAUlbn8cWPOkJIRVaflKjYI4Id2c5bJUew%2B3MSdf8WR%2F1kurueOSAvApygBTuqXMZ9AxGv8I3eb4p2haCY8oZAIWA4DR2xIEnpAqj2F7NOHW%2BivC1qlm2Dnc0z4FRPEjdW9CT8ya3CzpiYfPFquy1nYepPfputjavkzDnGUc7u%2BzoXvSgh8N5ft3OzPNQYE%2F2Ir7v4cLZlg%2Bafyssg3VsQAePKfXazgBUb83GXJ4xIp7y%2BvzLf9M62R%2F%2BsGHrQ13SuB66r9wzqWBX44Hi%2BUKOk487QD6xiDq1bxe77CkRr8lGeIc5bBQZVCeqitWxoOIhpnF6H%2F5bojktlFJd4jPUFTMkH9nZhUqGt0mKwBFJID3zzoNp3zEcQXtOyyQkCM8495AFgipvgx3%2B0w5c671gY6pgG8WBxOZuLMvt8Kz1%2FLq9fhGiyWbsAiYNxGm9bP5nmKUwZGGfO8lyXMzW3HY7y3lZudRBYrmDn0wwzuUx%2FvEMvBKDfphY6WJvqV9ZcJmYyPM8bve8SCn1UxL9INmNwn305EmIDLTqHbdO5hI6vaVsFx2zSnvWYVxHMYmB3b3CaITzKflsmnr88Enw0vTz6be4hswzWYkq1%2BxkN%2BwuH%2Bp82OZAFQwz1a&X-Amz-Signature=d664f8ed82cde857dc6a688ed8479e4a2a49f2d0299e78c9c8e761cb4339ca09&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4665PHJXMZW%2F20261014%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261014T023650Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEOP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIDPfwAVJ7GfIeI4SvmyoEs2ETNOspH5zfGOhdlN35Bw9AiA6T2F6ERdtBoIeuN5N93B7i4w86Gm0vhuRezgn5lbMSSqIBAir%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMCbdk%2ByIf%2FxotorIeKtwDrVL%2FMiS%2BpnvuRK9JwAjXZnqizXbb%2Bu8V2pLYIGxOCLIJz2KFUpc6J5BsZONr1BNkHyWIQ7REZ%2Fwx95Ze%2Bw4ZDV%2Fmnj9z0bl7O4pYlXMUhDwbQJ0ksgd1BZoK8ESR3%2F2JyQpKaruhT0qbf%2B24gKxH2YR%2BwDAcPjUhUW42R4ppAFIJCfwzEuanNQRKQuC0srVf26bAicizPFfWie14a%2BHMPA0Kl5C9w3lAD%2FdNZD8SB8CAvnAUlbn8cWPOkJIRVaflKjYI4Id2c5bJUew%2B3MSdf8WR%2F1kurueOSAvApygBTuqXMZ9AxGv8I3eb4p2haCY8oZAIWA4DR2xIEnpAqj2F7NOHW%2BivC1qlm2Dnc0z4FRPEjdW9CT8ya3CzpiYfPFquy1nYepPfputjavkzDnGUc7u%2BzoXvSgh8N5ft3OzPNQYE%2F2Ir7v4cLZlg%2Bafyssg3VsQAePKfXazgBUb83GXJ4xIp7y%2BvzLf9M62R%2F%2BsGHrQ13SuB66r9wzqWBX44Hi%2BUKOk487QD6xiDq1bxe77CkRr8lGeIc5bBQZVCeqitWxoOIhpnF6H%2F5bojktlFJd4jPUFTMkH9nZhUqGt0mKwBFJID3zzoNp3zEcQXtOyyQkCM8495AFgipvgx3%2B0w5c671gY6pgG8WBxOZuLMvt8Kz1%2FLq9fhGiyWbsAiYNxGm9bP5nmKUwZGGfO8lyXMzW3HY7y3lZudRBYrmDn0wwzuUx%2FvEMvBKDfphY6WJvqV9ZcJmYyPM8bve8SCn1UxL9INmNwn305EmIDLTqHbdO5hI6vaVsFx2zSnvWYVxHMYmB3b3CaITzKflsmnr88Enw0vTz6be4hswzWYkq1%2BxkN%2BwuH%2Bp82OZAFQwz1a&X-Amz-Signature=e22c49c65ff68251c6a590be39f13f07664c0bcf6a3232a45db2119f6ef4352f&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB46633QC54EG%2F20260908%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260908T153718Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEI%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIC5BsnsVx0vZ6vG8KPN6FY7CrvKhkBtqvFNozDZBr%2FwIAiEAkCp3NfAMsHqby0umfNIpLy2KES3bS51OpjfUqUGX1eQq%2FwMIWBAAGgw2Mzc0MjMxODM4MDUiDJuLE0BxfW7eU7PGsSrcA7kT%2BebA3028o11TE%2BaEp2O0o6F%2BmEYvXDHJ1PFUyzS12nt%2BpU0ZCBdexp%2FD4rCrl%2Fome%2BopJqCWk08GJXsLUZoXbOdsgL7p004S2knm0pWt%2FmP878LX3uN29Y26KN9%2FuZaqfzipmlmSXOsBu3PxITPDQqm7cTw%2Fwb9Erl8A6NLpSvKd3PBU3d7xm%2BhDDWxrIJhUa0n1AFNk21AfBy0EenOK%2BOXFvIdE5g5AZ0W3%2Ff%2BNG4UflhwAymYncxHd7xAp4BSXuU5xjiAYSN52ACnuaOvd5KKbAq1ouGfYP7bJrp9xEUztdt9ywIgJ7sWTIGtZOWlxz4G9b9kjSB9YX66XEvlXiVgvW9iBVvfJeEYKQEgbA1WrV5fnVLiEzCaJcTrsfJ2cBmT0BM4sVGvSxTYdfNMfzMsXxMavqp6ejXbo2nwzt38Xdyak2cfniuVM0s3%2B8%2FWXFNO0OLjko%2FcY9xqmVD2B5IF9lWU3lVXzTWvmUFWpUGlekVADWUuEpaH3YaxZv0Wy%2BkJ5geauXorYXw7qxllb%2BaG3HRAqEGb8aYg574VlzZeOKrk2WE7%2BK6R9XMptg6XGmU0K1svYQMBkgjEAnAn9INfgGs2oDIeRVKQYx3vYrdIWlzRhjCQnkI0MMKzFgNUGOqUByqBOKKdHKUkgLuoptxsnenDQSSXAli0gc%2FNOqVStm%2B6vJsEU24JTB6Lcn%2BWF%2FAcjcpPu8QnTNsiJqvw5iB1TXCKXul4Q797P6%2FG45ioZgTAn64fhbYN911YvErk5FfngS5w4lQ9VKlQZ5fnt%2BypG7XCPpVT534B%2BGCiphX5vJMYGAh%2BJ7Fz8kV7Hc0wUedoJFgaZCi11xgBOV3hOirK84vCgKBGg&X-Amz-Signature=e081e6df3f0695017184d948903f2b97eb562a355b9a553ef77751925ed7b2d6&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB46633QC54EG%2F20260908%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260908T153718Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEI%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIC5BsnsVx0vZ6vG8KPN6FY7CrvKhkBtqvFNozDZBr%2FwIAiEAkCp3NfAMsHqby0umfNIpLy2KES3bS51OpjfUqUGX1eQq%2FwMIWBAAGgw2Mzc0MjMxODM4MDUiDJuLE0BxfW7eU7PGsSrcA7kT%2BebA3028o11TE%2BaEp2O0o6F%2BmEYvXDHJ1PFUyzS12nt%2BpU0ZCBdexp%2FD4rCrl%2Fome%2BopJqCWk08GJXsLUZoXbOdsgL7p004S2knm0pWt%2FmP878LX3uN29Y26KN9%2FuZaqfzipmlmSXOsBu3PxITPDQqm7cTw%2Fwb9Erl8A6NLpSvKd3PBU3d7xm%2BhDDWxrIJhUa0n1AFNk21AfBy0EenOK%2BOXFvIdE5g5AZ0W3%2Ff%2BNG4UflhwAymYncxHd7xAp4BSXuU5xjiAYSN52ACnuaOvd5KKbAq1ouGfYP7bJrp9xEUztdt9ywIgJ7sWTIGtZOWlxz4G9b9kjSB9YX66XEvlXiVgvW9iBVvfJeEYKQEgbA1WrV5fnVLiEzCaJcTrsfJ2cBmT0BM4sVGvSxTYdfNMfzMsXxMavqp6ejXbo2nwzt38Xdyak2cfniuVM0s3%2B8%2FWXFNO0OLjko%2FcY9xqmVD2B5IF9lWU3lVXzTWvmUFWpUGlekVADWUuEpaH3YaxZv0Wy%2BkJ5geauXorYXw7qxllb%2BaG3HRAqEGb8aYg574VlzZeOKrk2WE7%2BK6R9XMptg6XGmU0K1svYQMBkgjEAnAn9INfgGs2oDIeRVKQYx3vYrdIWlzRhjCQnkI0MMKzFgNUGOqUByqBOKKdHKUkgLuoptxsnenDQSSXAli0gc%2FNOqVStm%2B6vJsEU24JTB6Lcn%2BWF%2FAcjcpPu8QnTNsiJqvw5iB1TXCKXul4Q797P6%2FG45ioZgTAn64fhbYN911YvErk5FfngS5w4lQ9VKlQZ5fnt%2BypG7XCPpVT534B%2BGCiphX5vJMYGAh%2BJ7Fz8kV7Hc0wUedoJFgaZCi11xgBOV3hOirK84vCgKBGg&X-Amz-Signature=9ef91f58bd714677ec621cae664a3f3c3d3d65615e2faa771c46d07a85c53693&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

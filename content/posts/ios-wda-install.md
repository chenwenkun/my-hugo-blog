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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4667MOTM5ZK%2F20260907%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260907T205345Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEH0aCXVzLXdlc3QtMiJIMEYCIQDK8yOciYfDZHosENIcGBTGNUZLe%2F3e0%2BnBekkM2eYMOgIhAJRJr3J0OhiQdGccWibssxTYQBmUO31ZhxiXonxocBNRKv8DCEYQABoMNjM3NDIzMTgzODA1IgwNCinY7vMjsAUu77Uq3APc3GHtgoA2ud6AOVoYX2go6r0pfhg1%2FwtTljMhXTW8G7k0buIVQ0M6FaoFTrjkDGMg0HNpxHsXaFpyNQDWu5ozGG%2Ff1A4ujxtJM1xdProKtf4ZEndz9pRKomNuzLZYJl%2FqNkxRXO%2FKkcgRAuz33xOpL87Tn4%2BzLGPxr38Tb9cYtqDWeJQEsXk34oPjsqv%2BWvANxgiwY8YP2FCFzgW%2BYefXn7OpYIF2lAsFfIBeXs5Xnj%2F%2FUSJWNK%2BOt3tDW7HkB0DosFMk13fQEV%2BQOQerwCCWiv8pELH60ELtpSdts7asD7SPwOzXfWtKC4IjLaLgP99DUztiqcfB6h6KCfmLYSnZ8Kxedviimhal%2BtVjK7uNqa8ktgWWBliB7SO0FcUhG%2FtbaBu6H4WaDEHUi3CvnuU0siuxW5e%2BUkFBjWSK4iqB%2FsibiVnSP9gokXi5wZ4nPxAr4hB4B5Kf8SPrR7TPNq2nldUwZ54CNJVDNEBxUZ47VaP6GhHysvNMn8xUqZf0bDbAj6tO%2B41azzlE2%2FFHkGIYUG910lJRAvpQr%2F0JgBfgKHeS7dthRXMruZ74g2A6E9F5CGeuEiCNA9N5ky6MgWNWHyScahox8XwVUTt8jxCyAX1%2FLAHwt9ypl5rQCzC5vfzUBjqkAY1p0LytaqkmweSNGVmlbUmQdH4qb2CCGR4i8EVAJuY31Hb09%2FQM%2BYTEpX3RpugZMPpEmwbcbK8a%2BOC85gycheU5P1vZgOAvlW7cjgYm3p2sw9ueqwGrgqIRFEgZGAww1eRjTIy7t0iQpMdpaR7L5RTx7j96duGeJTcMV14DQVciTFERzeSq0JaT4xJtu4HTP6UeuU7%2F%2FhTh9d3bswyK0pCASsj%2F&X-Amz-Signature=8b14e5426e5883c8d26f717557c182f9f9a4eecb77f8b94e8976bdd045b826f1&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4667MOTM5ZK%2F20260907%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260907T205345Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEH0aCXVzLXdlc3QtMiJIMEYCIQDK8yOciYfDZHosENIcGBTGNUZLe%2F3e0%2BnBekkM2eYMOgIhAJRJr3J0OhiQdGccWibssxTYQBmUO31ZhxiXonxocBNRKv8DCEYQABoMNjM3NDIzMTgzODA1IgwNCinY7vMjsAUu77Uq3APc3GHtgoA2ud6AOVoYX2go6r0pfhg1%2FwtTljMhXTW8G7k0buIVQ0M6FaoFTrjkDGMg0HNpxHsXaFpyNQDWu5ozGG%2Ff1A4ujxtJM1xdProKtf4ZEndz9pRKomNuzLZYJl%2FqNkxRXO%2FKkcgRAuz33xOpL87Tn4%2BzLGPxr38Tb9cYtqDWeJQEsXk34oPjsqv%2BWvANxgiwY8YP2FCFzgW%2BYefXn7OpYIF2lAsFfIBeXs5Xnj%2F%2FUSJWNK%2BOt3tDW7HkB0DosFMk13fQEV%2BQOQerwCCWiv8pELH60ELtpSdts7asD7SPwOzXfWtKC4IjLaLgP99DUztiqcfB6h6KCfmLYSnZ8Kxedviimhal%2BtVjK7uNqa8ktgWWBliB7SO0FcUhG%2FtbaBu6H4WaDEHUi3CvnuU0siuxW5e%2BUkFBjWSK4iqB%2FsibiVnSP9gokXi5wZ4nPxAr4hB4B5Kf8SPrR7TPNq2nldUwZ54CNJVDNEBxUZ47VaP6GhHysvNMn8xUqZf0bDbAj6tO%2B41azzlE2%2FFHkGIYUG910lJRAvpQr%2F0JgBfgKHeS7dthRXMruZ74g2A6E9F5CGeuEiCNA9N5ky6MgWNWHyScahox8XwVUTt8jxCyAX1%2FLAHwt9ypl5rQCzC5vfzUBjqkAY1p0LytaqkmweSNGVmlbUmQdH4qb2CCGR4i8EVAJuY31Hb09%2FQM%2BYTEpX3RpugZMPpEmwbcbK8a%2BOC85gycheU5P1vZgOAvlW7cjgYm3p2sw9ueqwGrgqIRFEgZGAww1eRjTIy7t0iQpMdpaR7L5RTx7j96duGeJTcMV14DQVciTFERzeSq0JaT4xJtu4HTP6UeuU7%2F%2FhTh9d3bswyK0pCASsj%2F&X-Amz-Signature=d812b40ff7868c8df8663ab52b98a3e76a933dc07635c36edbfddaf8b15d8eb2&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

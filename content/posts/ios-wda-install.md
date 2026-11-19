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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4667CMEF5UV%2F20261119%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261119T235940Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEFcaCXVzLXdlc3QtMiJIMEYCIQCTr08R5tUWzi0tLGHZr1dj2WxKWyUcEAy5tFZuhMtmIgIhAN8wGgvJcEa66tIDQY4TuiEuD6HANjrfC3QbB7HnMMb3Kv8DCB8QABoMNjM3NDIzMTgzODA1IgzLh%2B85Pp5CjrTkEZAq3ANbqnp3D7fTFzxsPdfdAQVv1uKYITSc3wS0UzulSJvbH0fi%2B1LULF0khkXa2DYa3jw17usXpULsD5xwmD%2FFBkIiSKR2%2B47NEUEw3HhqvRzbaa40BgZUKDQwXnDCLiQG0V5tfFvydR1MfnzSCSFjW5fodPwDYHng1ysvGDQiY33hKglNfNBsQ0aM94FB3mcZrEnUKDy1zG0B7IL14vEl7b%2F1xAa849XzTCagSTK2VHzmA7T8dBUbpfXVlbbLYCmKDFlyS20eSyY5B%2FAGYiVN0%2FSrOJK8QpiInomdINZgpZQD2mHV3z%2BSHjMfIjTEBf0dMLORoCK8%2F9fIY8wRuq8Zp2VbxxCaLEJG1px%2B6V4uQjc61WP3bP0eOz1G4bSBWf1ej%2BII6FoB%2Bbv57%2FkpUCKFz607zVLI9YkOQ3JFppB77tCs6h2jYtIjuC7bcZ2WBrxCd%2FmHFdmnzNsHswy9TvtqWq43E1aTNlQa4QbBHZq9HzGRKcE4N2%2B8xn5JcAU%2Fqxscx0NM%2FtPlcbeK9mv%2BAot35KUWgKNFGt9tU1QF47U1ATpgZ53gncuGkpyMajRhBkbNs18Pm100aSgZ2NPozsZ260T03%2BXCbB7O21brumAlDSLmAQRlQ7frJ7NISXu3pzDS%2Ff3XBjqkAatTqWQ%2BQ7l3RFNy2Wxd7YJL1NDLI0EbX%2FRCY13txrL8rNFint%2BKR%2BUqP5S51bbVSVfqyKJLgHbRHjFCJ7Wnmh%2BpNvXl4KyxksMKzZwTnHXj%2B4mabLhacFqQTXNyENDe%2BM2H8eEXsmoBptziyWk5yqQWfchnhxK%2B8YHxzbBdPOPWhxQn7GQ5ipP9hXWdFW7Mwj1HTLT1cOqehko6euOI3im2hCux&X-Amz-Signature=d3ef1c710945efe81d19807081573d61dfaf451b7a0e144a1bf9e29f2a915ef3&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4667CMEF5UV%2F20261119%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261119T235940Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEFcaCXVzLXdlc3QtMiJIMEYCIQCTr08R5tUWzi0tLGHZr1dj2WxKWyUcEAy5tFZuhMtmIgIhAN8wGgvJcEa66tIDQY4TuiEuD6HANjrfC3QbB7HnMMb3Kv8DCB8QABoMNjM3NDIzMTgzODA1IgzLh%2B85Pp5CjrTkEZAq3ANbqnp3D7fTFzxsPdfdAQVv1uKYITSc3wS0UzulSJvbH0fi%2B1LULF0khkXa2DYa3jw17usXpULsD5xwmD%2FFBkIiSKR2%2B47NEUEw3HhqvRzbaa40BgZUKDQwXnDCLiQG0V5tfFvydR1MfnzSCSFjW5fodPwDYHng1ysvGDQiY33hKglNfNBsQ0aM94FB3mcZrEnUKDy1zG0B7IL14vEl7b%2F1xAa849XzTCagSTK2VHzmA7T8dBUbpfXVlbbLYCmKDFlyS20eSyY5B%2FAGYiVN0%2FSrOJK8QpiInomdINZgpZQD2mHV3z%2BSHjMfIjTEBf0dMLORoCK8%2F9fIY8wRuq8Zp2VbxxCaLEJG1px%2B6V4uQjc61WP3bP0eOz1G4bSBWf1ej%2BII6FoB%2Bbv57%2FkpUCKFz607zVLI9YkOQ3JFppB77tCs6h2jYtIjuC7bcZ2WBrxCd%2FmHFdmnzNsHswy9TvtqWq43E1aTNlQa4QbBHZq9HzGRKcE4N2%2B8xn5JcAU%2Fqxscx0NM%2FtPlcbeK9mv%2BAot35KUWgKNFGt9tU1QF47U1ATpgZ53gncuGkpyMajRhBkbNs18Pm100aSgZ2NPozsZ260T03%2BXCbB7O21brumAlDSLmAQRlQ7frJ7NISXu3pzDS%2Ff3XBjqkAatTqWQ%2BQ7l3RFNy2Wxd7YJL1NDLI0EbX%2FRCY13txrL8rNFint%2BKR%2BUqP5S51bbVSVfqyKJLgHbRHjFCJ7Wnmh%2BpNvXl4KyxksMKzZwTnHXj%2B4mabLhacFqQTXNyENDe%2BM2H8eEXsmoBptziyWk5yqQWfchnhxK%2B8YHxzbBdPOPWhxQn7GQ5ipP9hXWdFW7Mwj1HTLT1cOqehko6euOI3im2hCux&X-Amz-Signature=a180c9dbb67d16b6b9ba5d14ce3f16957e63735d1bb698083d7ec26bfaafbebe&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

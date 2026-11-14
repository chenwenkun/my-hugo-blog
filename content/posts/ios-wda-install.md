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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4667O4FU7IR%2F20261114%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261114T035824Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEMr%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCOUJMF2xjKMeuGbl7%2BsAwzC1cF0yRcebeakuUTPTHOswIhALLBlsGq%2B5WPcXfZUzy6lc%2BqRKemVI4eUfgRB0SY5Z2qKogECJL%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1Igyzc1KjtJCXdrzDl%2Fkq3ANKsV5GBYG35fExtFQz0PAiNFaK95jvdM86WNnhqzBL%2BfdmHLd8tv8ai7MT8ciIrHtrCokSLrcXQcqN459d6JcvGjDIDtVN6chYu7RspXSHvuGNjlHPKPZl3gtBko47OuaWIc%2BSpZINpl27AkflMPd2YyJ5VJ6OiOVnUTKk0mr3MqQYrLpzke399Ll6yPo9GeT7mBpTIhMJ8DbsEM0oNgtpNyt3gRjeCY2KOwfB0Y2jFSQUqsEPCQHbKuK5MIt5LDcTQuNmT6Ev1xd2A0b2cvN0S%2FbUz3sH1bvQrkHbzLj6XkqI0bnthzg9jelHOiobmhXh9jidzG3pULMKazAVN%2BlBf42wOrttDY9MzGM19Yc%2FDCb7Jdpw%2BNz%2FcTyTz1YkHbI2yOf4u9UZC%2F9DXopHHD8RUydqTz%2FMs6duG6s9VCO%2F6lY2X%2B86klDznOhR%2BgAYKE0jCcjmGcB0s6VslTViIBRV9C%2FIcgkGotT7ylDGELbP2eBDhUubj7EeTJlhJVU%2BQoFVTIKf4nVeR4Nd49%2Fy%2FGDTPH9jjVdTTeBXUTHFdMFDjpzAZTWqBVrdCA7z6HPza2bnbOJYE5bMGtVxbuGrcAdm55CBiWJUgMx2xs0kAhImBItjTxSf6q7u61rEZDCa%2BN7XBjqkAZEIDbmOYkl1QeMjbdRRibwGaeahNZp%2BQFgfEpTwHHSxSARH9L%2FsQv1%2B%2FlKbKRQ1iiuen1eMJqGVPXsc74iMuQ%2Fb%2FrvtWKqHFw3cDpxB5lGT9XQGhRzharQsp91PooAwm0GKiQLNSlkWF6RpcZjVRmD6eMy5PSUFf6%2F6%2BJ24uRQXtsYHB8xT5At06edA36kze3b0O3j25xKYKbSHFJe8P3AqhTS1&X-Amz-Signature=1c5db2439ced063d9d8660a88b5973c7f0683c4815e4f36265cd4fa2340e36c0&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4667O4FU7IR%2F20261114%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261114T035824Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEMr%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCOUJMF2xjKMeuGbl7%2BsAwzC1cF0yRcebeakuUTPTHOswIhALLBlsGq%2B5WPcXfZUzy6lc%2BqRKemVI4eUfgRB0SY5Z2qKogECJL%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1Igyzc1KjtJCXdrzDl%2Fkq3ANKsV5GBYG35fExtFQz0PAiNFaK95jvdM86WNnhqzBL%2BfdmHLd8tv8ai7MT8ciIrHtrCokSLrcXQcqN459d6JcvGjDIDtVN6chYu7RspXSHvuGNjlHPKPZl3gtBko47OuaWIc%2BSpZINpl27AkflMPd2YyJ5VJ6OiOVnUTKk0mr3MqQYrLpzke399Ll6yPo9GeT7mBpTIhMJ8DbsEM0oNgtpNyt3gRjeCY2KOwfB0Y2jFSQUqsEPCQHbKuK5MIt5LDcTQuNmT6Ev1xd2A0b2cvN0S%2FbUz3sH1bvQrkHbzLj6XkqI0bnthzg9jelHOiobmhXh9jidzG3pULMKazAVN%2BlBf42wOrttDY9MzGM19Yc%2FDCb7Jdpw%2BNz%2FcTyTz1YkHbI2yOf4u9UZC%2F9DXopHHD8RUydqTz%2FMs6duG6s9VCO%2F6lY2X%2B86klDznOhR%2BgAYKE0jCcjmGcB0s6VslTViIBRV9C%2FIcgkGotT7ylDGELbP2eBDhUubj7EeTJlhJVU%2BQoFVTIKf4nVeR4Nd49%2Fy%2FGDTPH9jjVdTTeBXUTHFdMFDjpzAZTWqBVrdCA7z6HPza2bnbOJYE5bMGtVxbuGrcAdm55CBiWJUgMx2xs0kAhImBItjTxSf6q7u61rEZDCa%2BN7XBjqkAZEIDbmOYkl1QeMjbdRRibwGaeahNZp%2BQFgfEpTwHHSxSARH9L%2FsQv1%2B%2FlKbKRQ1iiuen1eMJqGVPXsc74iMuQ%2Fb%2FrvtWKqHFw3cDpxB5lGT9XQGhRzharQsp91PooAwm0GKiQLNSlkWF6RpcZjVRmD6eMy5PSUFf6%2F6%2BJ24uRQXtsYHB8xT5At06edA36kze3b0O3j25xKYKbSHFJe8P3AqhTS1&X-Amz-Signature=9e031c14bab0e4d6ac31f8bb5148d532a9d237c9ed09179446a1f39a22d99d72&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

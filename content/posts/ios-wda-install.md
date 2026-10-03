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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466U6IYUWKW%2F20261003%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261003T024955Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjENn%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQDk87DzNSfzW1J108bAP9jpzT5JsPKZUvehO1faoO3jSAIhAIuKcGqdi9D9Ew%2Fr7iQzyaRoxJygNHgBirDVU01HAru8KogECKH%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1Igzona%2Fpkp2pAfMz1YMq3APMDOcmXMFEobDHtVtogkk9bFOpwdxyHcunwm9Rdt0fXWU5xye%2FLqeo82B0ywUOe4m%2BVcXxyZ9MK4oDrhc%2FUtykv00bN31nrBh5eSF9KOxo2vKvDDftowJcUdJAmL4XPD4SbMMBLEDji9VA3HO95volcqWYnIL11YFQYgjsCGt4CPMFCUVx3UHcW4DH0f7wQkDOAnbkUvIS2%2F9lXPjnXL2uU%2F%2FO62HsTwwLAOGO4ps7biNSiXfqYyl%2FdXM3o1fgyXcokVv3dISF3BD8WiG0O8b0UVXuIZoFKy9ohaGvJGWkYlxtu4O1NTIZn4UFhebbM0FS6L64XfslH1sAuUkjB4pYbTGT01DhbV4ofJr4flyQvWXyRvn%2FncfJMy8ylUUUBg00QD2U6MGrB3UfoMxGc4w23e7Zwdt%2FD8Y%2B1rn6I6oIxGg2v8Qdn6NIm4cR6q7m644OFjqK%2FEY2eAoZw58KMzppuidwmBPFAyeT3W%2BbgCA91FDFcM5VcqT3VBfaBjBt2iT3KuZofTcVj8onNAFXmMsUkuJWfI8l5%2B5OJHPAPri52wCd%2BErDYs%2FXj9AhLZSy23w%2BuVhETe8wshjB9XloN1tcOGBSfo1C%2FDmLieFtFrbBxvAs7AjWDEqNciv%2FjDDGpIHWBjqkAdRGZwjvaWsRWTFY0CQGV81OEmXcqIBJ7qzWQ0GEstyyL%2BPepc49ZagkixlBOFJpzhiSDLv7Zl1Xw%2Brw9aZOHDcLt9rZOUJ%2Fuj66NRer5tmxREWw0jK9mSnO2ZYM7zKMX%2BfHCM6pplAWSYPxGAhTPAj%2FRCyuqa6wtbrWHoo0vXw5pikxbHob6o5Ok9ul2OaPAOqV9uvwe6LkMtKZPuAgKK2%2Bj%2B9h&X-Amz-Signature=5d5f56094026424b66488e3236b057647d46f6c87afa30f40c3733554349f446&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466U6IYUWKW%2F20261003%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261003T024955Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjENn%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQDk87DzNSfzW1J108bAP9jpzT5JsPKZUvehO1faoO3jSAIhAIuKcGqdi9D9Ew%2Fr7iQzyaRoxJygNHgBirDVU01HAru8KogECKH%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1Igzona%2Fpkp2pAfMz1YMq3APMDOcmXMFEobDHtVtogkk9bFOpwdxyHcunwm9Rdt0fXWU5xye%2FLqeo82B0ywUOe4m%2BVcXxyZ9MK4oDrhc%2FUtykv00bN31nrBh5eSF9KOxo2vKvDDftowJcUdJAmL4XPD4SbMMBLEDji9VA3HO95volcqWYnIL11YFQYgjsCGt4CPMFCUVx3UHcW4DH0f7wQkDOAnbkUvIS2%2F9lXPjnXL2uU%2F%2FO62HsTwwLAOGO4ps7biNSiXfqYyl%2FdXM3o1fgyXcokVv3dISF3BD8WiG0O8b0UVXuIZoFKy9ohaGvJGWkYlxtu4O1NTIZn4UFhebbM0FS6L64XfslH1sAuUkjB4pYbTGT01DhbV4ofJr4flyQvWXyRvn%2FncfJMy8ylUUUBg00QD2U6MGrB3UfoMxGc4w23e7Zwdt%2FD8Y%2B1rn6I6oIxGg2v8Qdn6NIm4cR6q7m644OFjqK%2FEY2eAoZw58KMzppuidwmBPFAyeT3W%2BbgCA91FDFcM5VcqT3VBfaBjBt2iT3KuZofTcVj8onNAFXmMsUkuJWfI8l5%2B5OJHPAPri52wCd%2BErDYs%2FXj9AhLZSy23w%2BuVhETe8wshjB9XloN1tcOGBSfo1C%2FDmLieFtFrbBxvAs7AjWDEqNciv%2FjDDGpIHWBjqkAdRGZwjvaWsRWTFY0CQGV81OEmXcqIBJ7qzWQ0GEstyyL%2BPepc49ZagkixlBOFJpzhiSDLv7Zl1Xw%2Brw9aZOHDcLt9rZOUJ%2Fuj66NRer5tmxREWw0jK9mSnO2ZYM7zKMX%2BfHCM6pplAWSYPxGAhTPAj%2FRCyuqa6wtbrWHoo0vXw5pikxbHob6o5Ok9ul2OaPAOqV9uvwe6LkMtKZPuAgKK2%2Bj%2B9h&X-Amz-Signature=7206bb037aa2c75d903aa8f659b569ee06acc1db4dfc01fee0810d95da512a5d&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

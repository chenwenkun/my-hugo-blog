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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4665AMJCZ4K%2F20261112%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261112T225719Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEK%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQDtkl8Ckkg5%2Bg8xFn%2Fw%2FRqmHONE5cv1Wnh%2FMSSFVvrVDAIhAMUqYiPvUPwGjOXU96araXO8lLHf28QryKK%2F%2FACCe6orKv8DCHcQABoMNjM3NDIzMTgzODA1Igydm%2BiqdLquRQNdTYwq3APHrlc%2BHKjTrVQTCOzIw3vMTG6dR%2FJPY%2BEkTNTGdMum4kAcVzEZilgCsNtXLHm7B%2FwdLkAdPLCVoq37WaP0WTJ3BY68oK09mqaz3opXjggSa0KHFRaio7oztMMNpegnRKWLOSghcj63ooqVAyHB9bJFrEcbt73KnZbQbnEsybM7Po72O8ziShjR2kHb4wvKL3GpBbzChLjL3kYhYHXgZYgS7bdxBQZDuga4F8utBuGHpv7zx2yrNFA6Ommx7YCgcaicIX%2FoyF4evC2a7zetyKt1YxnpJaib6d9Y%2B6gVz59ImXCyX0jIkqnYYBL%2FJPutlSOnTvE50e6hQtaL9VCwdiU1V8A9JxfVa2theUbG8p1Xf9mySVfdROyL90Ani7N0az0E79LoLf%2FqEUv%2BtfDOcg4eTOrtW7UARM4rZSKabK2a1%2FZSk5Iwg3npijr2I%2BngXb8RrH%2FSAOW%2FwnI4%2BKh2kUyG2VSGLeUKj4WGSAkdCVvlKFYkHWsYrucnxh%2BB0Gji28FAXzzi8hHWlCaPT%2F%2B55LYkHhiWPFd1gsSrjv1Z12wpVmSyK4vjcglpjgFObp5i5HOXQhTqaGAxO58iGrL9Oq3zwjd%2BKMZc8AHRr7LMw%2FQIrg21%2B9hPbcuqT%2BT9kzCx%2FNjXBjqkAY%2FcS98mqZEOoXikR%2B4OvJOw1NHdpNEuESeDuq1pnGvGdkkdj%2BiY0XEljHcOfi7w3qncEjOQs0SEQJtw1NgDOrUEz9jeaqEMs39uU0hLtdj3hrCpYykMJO4%2BfKInUs6nJJIcJPuXIFxb3c%2FQVqGqTbq460ahc7HXcY9w5kHqZgyxDbTWleC7gFGaIS3QYk7Bpkk9qsXPtGQYOTQ0BKxBYslvLi5i&X-Amz-Signature=1b9df13d9a20e0a211e5d1b09143c17964002bfd956a328bc1611a9e612b728c&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4665AMJCZ4K%2F20261112%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261112T225719Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEK%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQDtkl8Ckkg5%2Bg8xFn%2Fw%2FRqmHONE5cv1Wnh%2FMSSFVvrVDAIhAMUqYiPvUPwGjOXU96araXO8lLHf28QryKK%2F%2FACCe6orKv8DCHcQABoMNjM3NDIzMTgzODA1Igydm%2BiqdLquRQNdTYwq3APHrlc%2BHKjTrVQTCOzIw3vMTG6dR%2FJPY%2BEkTNTGdMum4kAcVzEZilgCsNtXLHm7B%2FwdLkAdPLCVoq37WaP0WTJ3BY68oK09mqaz3opXjggSa0KHFRaio7oztMMNpegnRKWLOSghcj63ooqVAyHB9bJFrEcbt73KnZbQbnEsybM7Po72O8ziShjR2kHb4wvKL3GpBbzChLjL3kYhYHXgZYgS7bdxBQZDuga4F8utBuGHpv7zx2yrNFA6Ommx7YCgcaicIX%2FoyF4evC2a7zetyKt1YxnpJaib6d9Y%2B6gVz59ImXCyX0jIkqnYYBL%2FJPutlSOnTvE50e6hQtaL9VCwdiU1V8A9JxfVa2theUbG8p1Xf9mySVfdROyL90Ani7N0az0E79LoLf%2FqEUv%2BtfDOcg4eTOrtW7UARM4rZSKabK2a1%2FZSk5Iwg3npijr2I%2BngXb8RrH%2FSAOW%2FwnI4%2BKh2kUyG2VSGLeUKj4WGSAkdCVvlKFYkHWsYrucnxh%2BB0Gji28FAXzzi8hHWlCaPT%2F%2B55LYkHhiWPFd1gsSrjv1Z12wpVmSyK4vjcglpjgFObp5i5HOXQhTqaGAxO58iGrL9Oq3zwjd%2BKMZc8AHRr7LMw%2FQIrg21%2B9hPbcuqT%2BT9kzCx%2FNjXBjqkAY%2FcS98mqZEOoXikR%2B4OvJOw1NHdpNEuESeDuq1pnGvGdkkdj%2BiY0XEljHcOfi7w3qncEjOQs0SEQJtw1NgDOrUEz9jeaqEMs39uU0hLtdj3hrCpYykMJO4%2BfKInUs6nJJIcJPuXIFxb3c%2FQVqGqTbq460ahc7HXcY9w5kHqZgyxDbTWleC7gFGaIS3QYk7Bpkk9qsXPtGQYOTQ0BKxBYslvLi5i&X-Amz-Signature=3e7bd631d09fd10793b0fdf5a82a834816afa99c7db05355847fecdcb2bbf7c7&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

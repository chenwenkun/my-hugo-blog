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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB46647VH5CWC%2F20260927%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260927T203414Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEFsaCXVzLXdlc3QtMiJHMEUCIGCUXPCuz5%2BrCduEvMpPra%2Bge%2BSQUXmrUFjVhZ0Vh8%2BMAiEA2gR5Dt51xn7fpXSQWbGjDWhlckxkyTT5pTro%2FYuaG%2BQq%2FwMIJBAAGgw2Mzc0MjMxODM4MDUiDOh98Uq4zUz9SqteXCrcA%2BbB1DTIdOkXjELMQVLaRAR3PlB7Axkn8Z7DlRnq2Nfo43atLP3Xj1ED%2F2IJyZajUX0TYJg6lGd58Hb030F7gZW%2BJZO%2FsQRRa9Mk9NgVbPRZGnbPax0s%2Bjm8nMy386P1FIZZN1Whe7yABH8CbqpfHBDoPIzS0y%2FkZReMR7%2FBu0PbrfeicmJeEnF9HAe4vIXdprK6JKBACf8Frnck1gQnT4%2F4iGyKbXwa5QBROxM61j5UZBjgflG4YeDzJYZ6KWQSaGFEvdM37JZpp91J7XCmg6%2BmSOvKUhWgA8oX4HA4ShjmVJeyHhmyH27WY5e%2BZYpavBiIQwwFiLG%2BYq6KOpmj5ihylgGttCFeISh2ER3ULO11crQj1j3eUWsgca%2BlFK8DeBU7JQrciLiQG5aKyuDFpHVxShodI9a7eZvtv411SI3QAn5B30432qpRB4hqBwpFl8877UbC%2FLrDGVzxoU6bHHnP%2BOuD1lbXudCdBZOq5eVxH7v6htgDTJ2mPTH86v4mttkKK0q6gAj1sfuRciarFQq78FTJxAwp9059j4p0ANYknRJqpChvm6ix%2FCSM6Cd5nxS6%2B3qMG6tlzXyMpk2Brqass2s7gemhu6%2FR0I1ArXAdjlCZLu%2Bfyvj9EHYWMP3I5dUGOqUB3heNL%2FRyq1vbVCyr5zGqHlrc%2FVW0oBOA%2B6AIMxrN%2F3tsgMW8Az46tgSFWS6YQUJ623ghlzn6YzdaPk%2F5lXd2s7rxpI4pfBw%2BS%2B2FMumdyKK5j88OI4TGUxul14jXKAIb5Auk79CW7TxOSZFmAqSzW1YRQropDDb2hak2QcOyQ%2FKa%2FyntF6QN9HTlidYS3ERgoW%2BKLwVgoOYzgK52hSQmcjPGPWQc&X-Amz-Signature=b6efdbb87e571a8df23fa1cb5e494c9f86141020c7c888a9a2b16350cf6007c3&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB46647VH5CWC%2F20260927%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260927T203414Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEFsaCXVzLXdlc3QtMiJHMEUCIGCUXPCuz5%2BrCduEvMpPra%2Bge%2BSQUXmrUFjVhZ0Vh8%2BMAiEA2gR5Dt51xn7fpXSQWbGjDWhlckxkyTT5pTro%2FYuaG%2BQq%2FwMIJBAAGgw2Mzc0MjMxODM4MDUiDOh98Uq4zUz9SqteXCrcA%2BbB1DTIdOkXjELMQVLaRAR3PlB7Axkn8Z7DlRnq2Nfo43atLP3Xj1ED%2F2IJyZajUX0TYJg6lGd58Hb030F7gZW%2BJZO%2FsQRRa9Mk9NgVbPRZGnbPax0s%2Bjm8nMy386P1FIZZN1Whe7yABH8CbqpfHBDoPIzS0y%2FkZReMR7%2FBu0PbrfeicmJeEnF9HAe4vIXdprK6JKBACf8Frnck1gQnT4%2F4iGyKbXwa5QBROxM61j5UZBjgflG4YeDzJYZ6KWQSaGFEvdM37JZpp91J7XCmg6%2BmSOvKUhWgA8oX4HA4ShjmVJeyHhmyH27WY5e%2BZYpavBiIQwwFiLG%2BYq6KOpmj5ihylgGttCFeISh2ER3ULO11crQj1j3eUWsgca%2BlFK8DeBU7JQrciLiQG5aKyuDFpHVxShodI9a7eZvtv411SI3QAn5B30432qpRB4hqBwpFl8877UbC%2FLrDGVzxoU6bHHnP%2BOuD1lbXudCdBZOq5eVxH7v6htgDTJ2mPTH86v4mttkKK0q6gAj1sfuRciarFQq78FTJxAwp9059j4p0ANYknRJqpChvm6ix%2FCSM6Cd5nxS6%2B3qMG6tlzXyMpk2Brqass2s7gemhu6%2FR0I1ArXAdjlCZLu%2Bfyvj9EHYWMP3I5dUGOqUB3heNL%2FRyq1vbVCyr5zGqHlrc%2FVW0oBOA%2B6AIMxrN%2F3tsgMW8Az46tgSFWS6YQUJ623ghlzn6YzdaPk%2F5lXd2s7rxpI4pfBw%2BS%2B2FMumdyKK5j88OI4TGUxul14jXKAIb5Auk79CW7TxOSZFmAqSzW1YRQropDDb2hak2QcOyQ%2FKa%2FyntF6QN9HTlidYS3ERgoW%2BKLwVgoOYzgK52hSQmcjPGPWQc&X-Amz-Signature=aeb76052323eea279be8790570cb5c77e17387c8adf6b3f1d7f82af98e36ed11&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4664JOPW3XI%2F20260818%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260818T182038Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJr%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIDX3fYcraWlC%2BzPGHO9veY%2BktQIwICDwo%2BPR7lC1KcoSAiAO9tJEMXch6QymdmDAJP3PVnaa9e9v9PB2OtOzGzLl3Cr%2FAwhjEAAaDDYzNzQyMzE4MzgwNSIM8oCxlYIxbudaxiTXKtwD1KAbIsXoYiBYaa7B8h72OXeDW3iwSPtcYTO0sk9s9xHzW9YmYQj3s2QdLdK%2BzWEByyKQySnKvPrGLHBUJ%2Ftrh6jF%2FZDSjgtXHtYCbR5OaIuvthGWrr6FkOCA7Ng8sW5SUYDJnwNsQeWHjCLYOADJKSrXLjFJ%2BR034Z4vEaBKIZ1u%2FFhhEKhoqHY07esi3svMuF5fDhbdEul95q7u9Pd6Y0vjoOqMNNu9QnEMZ3v3OaeeeZcEOTDATYO5nVRWgrzrKUTFhvZ1BhCGwcT9rxGc4Y9uLQM2hi7Kewjavyze6pk86NnoI%2FTBbk2cJM3EikNxpvzCtt2A9BLf5j4YxaDQ5X4EDnONVkuF8Xsri9vFfl1%2FX6yNzvluL5JlpCBZ7tmxVq%2FSMVPtW9S9xGZj3MtttYh8l%2B06Qc1nmN5CEQLSGi1Bgwofqe7ndW1RdOc%2FLUhomroCnM4S7Vc1ttDD2zEWwH5N1%2BGQQ38AVyvnsGWB3XUMq6AoEndVrJ9PgWzSkuk%2BhYtOiP1lTkVlbj3utCp5fd%2BrXAKwdebnM1FLJDBTfZbHLweHMn4iHsJ%2F3S%2BlwuDNIt5AC6TdKFoaxVHYnnZSiN79H1WQocy8nwt5E%2Bj%2FP3rbGXbHI0RLnZwHka4wwrqS1AY6pgEULUVPzhnseuujoPQOBsmw7N5BUZwunxuKYtOa3YmPhhp0yob98Jhz2Lm9sDsJXbXUsbZqPqpkGNd%2BAbP8NMNu9tE1iXzFxaq2Y3lUhTfyYqBK7UMn3zxIEb58npJsA20VoGIeG%2FbsgkcSEiYcIh8tgaQ9DG0x9NapF8iBpnFnF%2FP%2BIMNsmGyBRekX2kRNiGOvlLbeETg2%2BlM0OCoQ8kOjQtSwvxiE&X-Amz-Signature=25685912d2f1c33a0133fcf25ad0f7438c233dcb283878246e66e7a649c2d359&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4664JOPW3XI%2F20260818%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260818T182038Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJr%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIDX3fYcraWlC%2BzPGHO9veY%2BktQIwICDwo%2BPR7lC1KcoSAiAO9tJEMXch6QymdmDAJP3PVnaa9e9v9PB2OtOzGzLl3Cr%2FAwhjEAAaDDYzNzQyMzE4MzgwNSIM8oCxlYIxbudaxiTXKtwD1KAbIsXoYiBYaa7B8h72OXeDW3iwSPtcYTO0sk9s9xHzW9YmYQj3s2QdLdK%2BzWEByyKQySnKvPrGLHBUJ%2Ftrh6jF%2FZDSjgtXHtYCbR5OaIuvthGWrr6FkOCA7Ng8sW5SUYDJnwNsQeWHjCLYOADJKSrXLjFJ%2BR034Z4vEaBKIZ1u%2FFhhEKhoqHY07esi3svMuF5fDhbdEul95q7u9Pd6Y0vjoOqMNNu9QnEMZ3v3OaeeeZcEOTDATYO5nVRWgrzrKUTFhvZ1BhCGwcT9rxGc4Y9uLQM2hi7Kewjavyze6pk86NnoI%2FTBbk2cJM3EikNxpvzCtt2A9BLf5j4YxaDQ5X4EDnONVkuF8Xsri9vFfl1%2FX6yNzvluL5JlpCBZ7tmxVq%2FSMVPtW9S9xGZj3MtttYh8l%2B06Qc1nmN5CEQLSGi1Bgwofqe7ndW1RdOc%2FLUhomroCnM4S7Vc1ttDD2zEWwH5N1%2BGQQ38AVyvnsGWB3XUMq6AoEndVrJ9PgWzSkuk%2BhYtOiP1lTkVlbj3utCp5fd%2BrXAKwdebnM1FLJDBTfZbHLweHMn4iHsJ%2F3S%2BlwuDNIt5AC6TdKFoaxVHYnnZSiN79H1WQocy8nwt5E%2Bj%2FP3rbGXbHI0RLnZwHka4wwrqS1AY6pgEULUVPzhnseuujoPQOBsmw7N5BUZwunxuKYtOa3YmPhhp0yob98Jhz2Lm9sDsJXbXUsbZqPqpkGNd%2BAbP8NMNu9tE1iXzFxaq2Y3lUhTfyYqBK7UMn3zxIEb58npJsA20VoGIeG%2FbsgkcSEiYcIh8tgaQ9DG0x9NapF8iBpnFnF%2FP%2BIMNsmGyBRekX2kRNiGOvlLbeETg2%2BlM0OCoQ8kOjQtSwvxiE&X-Amz-Signature=aabfc9fbb16294a9ad3e2ea0d635302d91890449e85bb3d93558fdd80fb54afd&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

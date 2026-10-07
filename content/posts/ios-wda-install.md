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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466WH2DEZLR%2F20261007%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261007T121557Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEEQaCXVzLXdlc3QtMiJHMEUCIAMqGoorzsS9%2FyZkEvuj%2BtK0jM9oKB0Lj1koGJBO8mzfAiEAkQXOEpqZQ4tUG6u%2F35xzlezlsPEG%2B8A7f2OxfL%2BBmZQq%2FwMIDBAAGgw2Mzc0MjMxODM4MDUiDNYhPRmBuezPpO%2BxnyrcA19U7V%2FBMq23bqmela8815JqczdbswV4iIqn1UQe7t%2FztztvwVAnU9%2BLHHlOhAkEQWKL0LsVSvdzUCYoD4RQiiCkx5qbbwW8RHMlemh4r7dYPEEC3h4VIEn6z9tz%2FMgpGhTFrKQ9csUgyXx27ubsvneioTeiCtPzu%2FRCuRKVX0PwOVGZ8Knl2lcYMDKYCHbF75BmjqHcLZdM52Aas8P3B%2BGantmOU1HqBI1R51ghpVYk%2BMIGGJwjy7YhVN1Vr7fNTzkq7%2BKYYG2LQE5cUkb41QvWKHDwSyCrjCpDiJ7Pp6YAirB%2FOvDkrv8JI0QTBWZrrKZ3eCwPH%2FmfpJg8%2FZap9bL36ouSwSYNKHpvpOQX0Qlnlj3Fq0j6wX7m6nJ8cUFI2hXECn4wwmjgDDp%2FXO0ayK%2F28e9MTEJXBEe8mOpgieO1rgARLJOqYA3sCnwF1yvFNrZboaEgnYWi%2FLjvsnITnnbPsvxFJSc4N04Miu42FJ51tFsRQ1GhQ7OS7lva9F14VFZr7okOA3ripKqdpTxFpGrl1CXrDQbv8sN4WbGcycYWE4cRXnheWKZdEW0D2LgXtCpT0qXbCNddFrJizDh6uP2im44iHSQsC49xxIDR6cq94ugtmVVGgDrZBwkZMIjemNYGOqUBRhAQEs2gqNLieLV0t2y2rNa44BPS%2FRtZrnO7jDMLz4RHXEIBwxWB0GP%2B%2Fo%2BXi821PzDmKVDslSNjT%2B6JN1gqYsmK3l9hodeXsX9rVOAUaFp6x%2BuaKfY0kMQR9dtC228%2BgI%2B7z9gDsRYpXWs8JdjFWQitc0qzfNNfwBsgZp5xe08yiuELuRsuDfgK3hg7yuclmyJO7f9v2aHvcI5K5TYooBUTFAwy&X-Amz-Signature=422091f7549ea8e1ff1aad85853d22ff6b7e93fe46d029e084c7b88c948e8a56&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466WH2DEZLR%2F20261007%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261007T121557Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEEQaCXVzLXdlc3QtMiJHMEUCIAMqGoorzsS9%2FyZkEvuj%2BtK0jM9oKB0Lj1koGJBO8mzfAiEAkQXOEpqZQ4tUG6u%2F35xzlezlsPEG%2B8A7f2OxfL%2BBmZQq%2FwMIDBAAGgw2Mzc0MjMxODM4MDUiDNYhPRmBuezPpO%2BxnyrcA19U7V%2FBMq23bqmela8815JqczdbswV4iIqn1UQe7t%2FztztvwVAnU9%2BLHHlOhAkEQWKL0LsVSvdzUCYoD4RQiiCkx5qbbwW8RHMlemh4r7dYPEEC3h4VIEn6z9tz%2FMgpGhTFrKQ9csUgyXx27ubsvneioTeiCtPzu%2FRCuRKVX0PwOVGZ8Knl2lcYMDKYCHbF75BmjqHcLZdM52Aas8P3B%2BGantmOU1HqBI1R51ghpVYk%2BMIGGJwjy7YhVN1Vr7fNTzkq7%2BKYYG2LQE5cUkb41QvWKHDwSyCrjCpDiJ7Pp6YAirB%2FOvDkrv8JI0QTBWZrrKZ3eCwPH%2FmfpJg8%2FZap9bL36ouSwSYNKHpvpOQX0Qlnlj3Fq0j6wX7m6nJ8cUFI2hXECn4wwmjgDDp%2FXO0ayK%2F28e9MTEJXBEe8mOpgieO1rgARLJOqYA3sCnwF1yvFNrZboaEgnYWi%2FLjvsnITnnbPsvxFJSc4N04Miu42FJ51tFsRQ1GhQ7OS7lva9F14VFZr7okOA3ripKqdpTxFpGrl1CXrDQbv8sN4WbGcycYWE4cRXnheWKZdEW0D2LgXtCpT0qXbCNddFrJizDh6uP2im44iHSQsC49xxIDR6cq94ugtmVVGgDrZBwkZMIjemNYGOqUBRhAQEs2gqNLieLV0t2y2rNa44BPS%2FRtZrnO7jDMLz4RHXEIBwxWB0GP%2B%2Fo%2BXi821PzDmKVDslSNjT%2B6JN1gqYsmK3l9hodeXsX9rVOAUaFp6x%2BuaKfY0kMQR9dtC228%2BgI%2B7z9gDsRYpXWs8JdjFWQitc0qzfNNfwBsgZp5xe08yiuELuRsuDfgK3hg7yuclmyJO7f9v2aHvcI5K5TYooBUTFAwy&X-Amz-Signature=eb2981204a409664fcc7d980a2b1b301e7beffd7d7355550926090009329899e&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

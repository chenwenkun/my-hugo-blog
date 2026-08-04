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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4664PI2BUQY%2F20260804%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260804T191707Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEEgaCXVzLXdlc3QtMiJGMEQCIGJqii1GSWGZKHdlnxHelEl6Tacr4PH8LsjhyNH11zb%2FAiAVBhmT1o39VWEeF9nXZYJTTrmE%2FBTaa%2BcvvqvQqtColir%2FAwgREAAaDDYzNzQyMzE4MzgwNSIM6pdgv1AJXug5PboYKtwD0gWKzLlo41VB1rgWqcqNMM%2FSLC1EyfP3boEMoKA43Pnjn0%2FacRTJoehFspilTdi8o8bEMBhTsbOd9iUT74sqq8R6ployyMpu235tRKSFLRHhN1mSAc0e%2Bi4n%2BP%2FmI8saq0I%2FvmFgMSf1HrV6CvQE49ssCXuvHXA8LslVUiOdA18xN7VcNQpSJ4tyUbRi9fpW%2BL1ptvU8p3MiBp7HE%2FmkGrYf84znJNwX4crY%2FeGG0lflsPXHxUNM0bm37CmYSWdi5dKFs7G7SGLAN2gWmIIX4z9t3oGPzo%2BZE6lav%2BnIocQvwMvx6RTgIvpFxLFu8L9Jr2d24kluGXOmZqWBZigtVRjCdRCD35WZOQcFPgNIr7GUuh6guais9cRyo9jC5mT37kGGCGS2CJdIKdMZgOkzVboiHUOf2%2FORUAOeJ3lvQvvnos7TuQzxfmQY7aXhym5T%2Fot12q11u3YmtyAG0KUPoHKxmTWotB9tAdGqpANYeqIkJVzxpF7QErSRhyTbsYlnQd6eqbHY0wZ94Md%2B19gqYYllYgEDWWsd2yNipUp%2FZ6RtUBvYdFMTSt2TQlYiXbsE1XfU%2Buc%2F0MlPFUhS8XWfMDf%2Fw8QWSpDJyK5%2FhOmj%2BOvqXiIGeS%2FDwPLCMFcw6ZDI0wY6pgHGqIoUbSi8cqGwZlUwesZNEC7xOC6Kuer7Z5j3X1B5QanNheSf%2F0UXETKcMQdtPKW2V4n%2FDvrqLsY%2F5k78AeqbMXxcJovYi5FR91D146tn0U5p3vib6%2FZxN4cgoLlWyTv0IRhdPa7ay9DWxjs1M8p83y%2BR%2BydbN%2BwXRnJfMD3gdHYdkZStZc2vt9AUJ5zCJaFGfb1ffPh1XGym3FreswdntVYfgMew&X-Amz-Signature=84575ef0766ca52a8d3c8b4134104ce8a194288074f7bd750d3728aa09a467a2&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4664PI2BUQY%2F20260804%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260804T191708Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEEgaCXVzLXdlc3QtMiJGMEQCIGJqii1GSWGZKHdlnxHelEl6Tacr4PH8LsjhyNH11zb%2FAiAVBhmT1o39VWEeF9nXZYJTTrmE%2FBTaa%2BcvvqvQqtColir%2FAwgREAAaDDYzNzQyMzE4MzgwNSIM6pdgv1AJXug5PboYKtwD0gWKzLlo41VB1rgWqcqNMM%2FSLC1EyfP3boEMoKA43Pnjn0%2FacRTJoehFspilTdi8o8bEMBhTsbOd9iUT74sqq8R6ployyMpu235tRKSFLRHhN1mSAc0e%2Bi4n%2BP%2FmI8saq0I%2FvmFgMSf1HrV6CvQE49ssCXuvHXA8LslVUiOdA18xN7VcNQpSJ4tyUbRi9fpW%2BL1ptvU8p3MiBp7HE%2FmkGrYf84znJNwX4crY%2FeGG0lflsPXHxUNM0bm37CmYSWdi5dKFs7G7SGLAN2gWmIIX4z9t3oGPzo%2BZE6lav%2BnIocQvwMvx6RTgIvpFxLFu8L9Jr2d24kluGXOmZqWBZigtVRjCdRCD35WZOQcFPgNIr7GUuh6guais9cRyo9jC5mT37kGGCGS2CJdIKdMZgOkzVboiHUOf2%2FORUAOeJ3lvQvvnos7TuQzxfmQY7aXhym5T%2Fot12q11u3YmtyAG0KUPoHKxmTWotB9tAdGqpANYeqIkJVzxpF7QErSRhyTbsYlnQd6eqbHY0wZ94Md%2B19gqYYllYgEDWWsd2yNipUp%2FZ6RtUBvYdFMTSt2TQlYiXbsE1XfU%2Buc%2F0MlPFUhS8XWfMDf%2Fw8QWSpDJyK5%2FhOmj%2BOvqXiIGeS%2FDwPLCMFcw6ZDI0wY6pgHGqIoUbSi8cqGwZlUwesZNEC7xOC6Kuer7Z5j3X1B5QanNheSf%2F0UXETKcMQdtPKW2V4n%2FDvrqLsY%2F5k78AeqbMXxcJovYi5FR91D146tn0U5p3vib6%2FZxN4cgoLlWyTv0IRhdPa7ay9DWxjs1M8p83y%2BR%2BydbN%2BwXRnJfMD3gdHYdkZStZc2vt9AUJ5zCJaFGfb1ffPh1XGym3FreswdntVYfgMew&X-Amz-Signature=40720f6f5900d63641718d081b319941c9d6d2ed368a1f6057b228326d0df350&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

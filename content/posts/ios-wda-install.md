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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466VBXLI64R%2F20260902%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260902T100828Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEPj%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQD4021hTE%2Fp9XsNC%2BFAdmLeyA48gQKcdt8Xu15hL1ktZwIgS4LUZsyWQjmPFiQm3cBz65V0xc0GbwunTr1oiw9ryuEqiAQIwf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDLDO4ASSPxMCS8HjhCrcAy96t8UbzJO6COCqeRMQdRGPTgOJlwG5tJzpeUliW7QVIyjr66C7Psus%2F3v2UbLOG22%2BzQURQWmYy4uI0WDcyBtTUVhubT6a49e8gW%2B%2FLUbgivfQbHroAMR89cgfdYS4tV%2FvPXzZoRmqHNLCUuPc7LZrgadEluihnEkh9sq8mWdfUP6sg3eVHnJ%2BQnBHwDRqyGrYelAVlMj2DEZCUOewmkouEZ%2Bl9In21YyKpSjKEgtyGb9fMGX0OiZ%2FPjR3uQ8Nx7f2em8DNkJJe%2FON15STt9lDwNt2Yuhn7dsEOrttbBN7vASFj4cKDJ3yHpP%2FwtHa29N0Gzn%2FTZlge3%2FDR7nhrSkE55MpHV4zd%2Bpc3DLL9Whk37%2BwGa4Owom9JOhaTDDNW78zWnC1z4AAGk9Oxk0qK%2F5TbpEmzzpeo2aNXFNnW27ESeEJ%2BhkP5t4PIifhsNqqIWR8JGRiooHrkgpmlL1453LKleQI4f2H4275%2FNbxs4mracwtOSsd9a4HopJqLCWYQFIUVl57wwBsFlNOHnwckNPKSf6%2FxnHwllB7QTAj9ng%2FLx0pxREfQ0GfS9F1GJO74zD6HmGBK4KzZm1JIYUJDCVQc6KlpJKUe0I8XzwfWbdAXXYQPNeloiNFQjvUMISt39QGOqUBCtMgtzAZU6YqeDxdpiJEGZ8g87Fgq77wh0WBU70Nbt%2FJvvcoBKsASRP4tfI9IOD8xNj77IBfY%2BjcKHAPlfLmGV8w1rKgPclRNE7ZcQiDLhZfJJGgjV%2FtcgjJ12H5iPUvhODt9twXB2oza2AqmjP2iQpWDxdQPpVMeQXRz%2FXPOD1er94t%2FkdUzJvDLrEuWRGNHYS7Ogb2eXnvTyRFgUtdUV7ckRo9&X-Amz-Signature=fd274c453b450f3efe141c21452f9ae86759edeed00043f6d6470eb666703622&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466VBXLI64R%2F20260902%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260902T100828Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEPj%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQD4021hTE%2Fp9XsNC%2BFAdmLeyA48gQKcdt8Xu15hL1ktZwIgS4LUZsyWQjmPFiQm3cBz65V0xc0GbwunTr1oiw9ryuEqiAQIwf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDLDO4ASSPxMCS8HjhCrcAy96t8UbzJO6COCqeRMQdRGPTgOJlwG5tJzpeUliW7QVIyjr66C7Psus%2F3v2UbLOG22%2BzQURQWmYy4uI0WDcyBtTUVhubT6a49e8gW%2B%2FLUbgivfQbHroAMR89cgfdYS4tV%2FvPXzZoRmqHNLCUuPc7LZrgadEluihnEkh9sq8mWdfUP6sg3eVHnJ%2BQnBHwDRqyGrYelAVlMj2DEZCUOewmkouEZ%2Bl9In21YyKpSjKEgtyGb9fMGX0OiZ%2FPjR3uQ8Nx7f2em8DNkJJe%2FON15STt9lDwNt2Yuhn7dsEOrttbBN7vASFj4cKDJ3yHpP%2FwtHa29N0Gzn%2FTZlge3%2FDR7nhrSkE55MpHV4zd%2Bpc3DLL9Whk37%2BwGa4Owom9JOhaTDDNW78zWnC1z4AAGk9Oxk0qK%2F5TbpEmzzpeo2aNXFNnW27ESeEJ%2BhkP5t4PIifhsNqqIWR8JGRiooHrkgpmlL1453LKleQI4f2H4275%2FNbxs4mracwtOSsd9a4HopJqLCWYQFIUVl57wwBsFlNOHnwckNPKSf6%2FxnHwllB7QTAj9ng%2FLx0pxREfQ0GfS9F1GJO74zD6HmGBK4KzZm1JIYUJDCVQc6KlpJKUe0I8XzwfWbdAXXYQPNeloiNFQjvUMISt39QGOqUBCtMgtzAZU6YqeDxdpiJEGZ8g87Fgq77wh0WBU70Nbt%2FJvvcoBKsASRP4tfI9IOD8xNj77IBfY%2BjcKHAPlfLmGV8w1rKgPclRNE7ZcQiDLhZfJJGgjV%2FtcgjJ12H5iPUvhODt9twXB2oza2AqmjP2iQpWDxdQPpVMeQXRz%2FXPOD1er94t%2FkdUzJvDLrEuWRGNHYS7Ogb2eXnvTyRFgUtdUV7ckRo9&X-Amz-Signature=7ddaf1de6ac89afd4a47d557a15d6b0a347560306c313ae509415c700dd8f9df&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

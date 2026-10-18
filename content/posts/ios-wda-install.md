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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466SPVJZMVA%2F20261018%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261018T020155Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEEEaCXVzLXdlc3QtMiJIMEYCIQD9OYlZ%2BceZlTbnrYCWUkc2Z9aI9VGbZ7bWX8NgGJzPXQIhAK3Doj7Fnb1ohkGntQ0Dl6jp%2BXfBZ2cBVOQddbLBC8CaKv8DCAoQABoMNjM3NDIzMTgzODA1Igzhyt6%2FqPCk5Uz3Y0Eq3AMDC9sNC%2BsgmKmMubYfGUGHrGBz72vFSxUsv%2FUczaIjiU8uy3xLoUwgdgF7zdN40DHwIRskN1EkPGf3%2BHjihGObToh%2BPSpCHiF0pDee8l96zGpOXfPv5J6b%2FyBtMb1oOkgLn1cHbug6nzveQM7JWyos2tujZPHEFiEncuFYMA7D0MyJ2ajzCtf%2Fe%2FkwiaJWIEslI8Xb%2FvM90W4c6z5dnM%2FerUm0%2BwHyw%2Bf5dnli7jgGPq85XeUKNe6tt3If%2FNxmdQYGjgmT8EL3MwMsVV2DOK7aVTr4Z0EFk5fk1jZ8LFz9teoZ%2FC34V1WMm1rk%2BxNuzW6p1JuYueUc5UKwumISi7cqq9UOve%2BZaeJk2ffFMPNK%2BzzIDROV284mNFYm5nXe7LGFYiztL9Xttt%2FUmGuUApyz1RMRD9J0m%2B2JPpBoO7rZGfyLBko1e5krNuSVpuBxZhisAyo8bUaoIV2fD5bRlbbwIMs%2FzYu%2Bt9Wmo4wmW88jXIvKOj8Kex9kyJxgYoH%2BcG2Es2rr0ZEoYLkpX8v0PKrfx6lshlfizdrRLqzZUDHOijndu%2B3KP4Pb74I7qBOUlrKEA6OR2woSrFuEIbgV0TXN%2B1vEUwoHt60EHli6ELaeqM05BT4LtP01B5CuuTDPuNDWBjqkAYccvkzx1mjcyFFugJtH7P3tF6kzV%2B67YvoOEXnMRynaqy5%2BVN5HjIJqfpEoQMA4G%2FQmyGgB8WV3uubNX%2B67%2FCzLiLGWgOvGRj5Xe5gBiCr%2FIM1XMbyCaLLF9Q146N5Aqm48MMTo0L2rAKgy%2BYdrnU16mLhtd9IjLfgci70cq8ZviyQ%2BUtoECxZl%2BmqX87xb%2BCnj7Js%2FAPJR107%2B9%2F4adPdX5bMQ&X-Amz-Signature=dc668fc7af22e98c725833d62dd35ad52db2268bfe7717f3ba232d12e2bb4bf8&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466SPVJZMVA%2F20261018%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261018T020155Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEEEaCXVzLXdlc3QtMiJIMEYCIQD9OYlZ%2BceZlTbnrYCWUkc2Z9aI9VGbZ7bWX8NgGJzPXQIhAK3Doj7Fnb1ohkGntQ0Dl6jp%2BXfBZ2cBVOQddbLBC8CaKv8DCAoQABoMNjM3NDIzMTgzODA1Igzhyt6%2FqPCk5Uz3Y0Eq3AMDC9sNC%2BsgmKmMubYfGUGHrGBz72vFSxUsv%2FUczaIjiU8uy3xLoUwgdgF7zdN40DHwIRskN1EkPGf3%2BHjihGObToh%2BPSpCHiF0pDee8l96zGpOXfPv5J6b%2FyBtMb1oOkgLn1cHbug6nzveQM7JWyos2tujZPHEFiEncuFYMA7D0MyJ2ajzCtf%2Fe%2FkwiaJWIEslI8Xb%2FvM90W4c6z5dnM%2FerUm0%2BwHyw%2Bf5dnli7jgGPq85XeUKNe6tt3If%2FNxmdQYGjgmT8EL3MwMsVV2DOK7aVTr4Z0EFk5fk1jZ8LFz9teoZ%2FC34V1WMm1rk%2BxNuzW6p1JuYueUc5UKwumISi7cqq9UOve%2BZaeJk2ffFMPNK%2BzzIDROV284mNFYm5nXe7LGFYiztL9Xttt%2FUmGuUApyz1RMRD9J0m%2B2JPpBoO7rZGfyLBko1e5krNuSVpuBxZhisAyo8bUaoIV2fD5bRlbbwIMs%2FzYu%2Bt9Wmo4wmW88jXIvKOj8Kex9kyJxgYoH%2BcG2Es2rr0ZEoYLkpX8v0PKrfx6lshlfizdrRLqzZUDHOijndu%2B3KP4Pb74I7qBOUlrKEA6OR2woSrFuEIbgV0TXN%2B1vEUwoHt60EHli6ELaeqM05BT4LtP01B5CuuTDPuNDWBjqkAYccvkzx1mjcyFFugJtH7P3tF6kzV%2B67YvoOEXnMRynaqy5%2BVN5HjIJqfpEoQMA4G%2FQmyGgB8WV3uubNX%2B67%2FCzLiLGWgOvGRj5Xe5gBiCr%2FIM1XMbyCaLLF9Q146N5Aqm48MMTo0L2rAKgy%2BYdrnU16mLhtd9IjLfgci70cq8ZviyQ%2BUtoECxZl%2BmqX87xb%2BCnj7Js%2FAPJR107%2B9%2F4adPdX5bMQ&X-Amz-Signature=93c129feb2e29a41c3e0f3e8b5b955a24a6dbc202da413e6ce4d8bcf8c41d5b7&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

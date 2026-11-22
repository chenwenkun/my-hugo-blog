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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466ZI3AGCYI%2F20261122%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261122T134449Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQCT6cFywSJL85Vj179H2xDcGfj9lNRpMi04uJgkghAbpwIgI%2FjSGHe21idL66GRk8od%2BGplzL3Vy0P0bIBwjKuyJEcq%2FwMIXhAAGgw2Mzc0MjMxODM4MDUiDDdmh%2BnN6VvsG8IG2yrcAzJL%2Fg7ebt%2BIOOQlbeBdiFIRH0%2BBlzvB7WD7PLiE8pIcOz82996d9Tbxhv9RCGUpBjV7fbt%2BJXsrfgI%2F%2FDLgaqI5UKvdq%2BPTWDB%2Fs3jB6uMnjb9w5Hfk%2Fe8d%2BeE5dfmFcN2Yw9v6we4iiCdwZmcEz7B3%2BxAzZXFyP%2FXch4YmFZQWG2%2F9r7IF824W%2F3H05%2FPI9nKvhVUOYacEUsNPZ8HKELbeSro5%2Bv4poRLzcgjYkV3sxFqeV9wTphvv5IR30gi1MaiWYmg6BmHCCfqEoGU7HEjoXrhqqk79cInnGmZ62uoYabIXYtPIr%2B2Eo4qqSKa4PKC%2BZ0QzdD1tH%2FVgL4U%2FBg1oR%2BJdmjpmoKSKHcbCvea0tt6ClDZg0to2ViX77DeQuldShHTOwTZcqBcstPHwali%2BxdIT9ix0VORm38%2BgcNEFRDtxq0yazVxtQv8cEEIGHJULTXa%2FpEK36%2FsXzCf06PGkM4xq13yJutcN9aFLu0lmgdHIVUG%2B8FpjdzVecDqLESvdDIRCeW57HkH2l%2F%2B9VnoU1BbFxzYhKYGdloFajsJ%2FkJRziM3pDGGZLS1fzd9V3ZLR2M56f5ey4QGL7Xa5A%2Fr66%2F%2FsPxNgkIEXvbLf34mRfzC3%2Fgq8voyDNAd3MPXRi9gGOqUB4LU%2FOoSngzcNJpTqHdmV%2FN0FqIHHAMbZ41dymxM1Hp4CVAqSFZ7HpvgKRuv6NWyKplgZl1D3myu4m4Hvr4FPlW6pqQ0TX7QwDdHsVUWXZnOoxm6A5D3stIFHNSi%2BMZr8Bbkd35Dc4AFpHWQGXz0eKML%2Fp4mIO53zli3a666BhMzaZPB9p0YGOJhxJ15RzSEZ1zX%2BQKl0nyenb9Y1Vy6ldr2nzU7K&X-Amz-Signature=16c19d689cbad5f83dd5f8b1d2916060ef146dd574bd58a56a7f2f204428c3a3&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466ZI3AGCYI%2F20261122%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261122T134449Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQCT6cFywSJL85Vj179H2xDcGfj9lNRpMi04uJgkghAbpwIgI%2FjSGHe21idL66GRk8od%2BGplzL3Vy0P0bIBwjKuyJEcq%2FwMIXhAAGgw2Mzc0MjMxODM4MDUiDDdmh%2BnN6VvsG8IG2yrcAzJL%2Fg7ebt%2BIOOQlbeBdiFIRH0%2BBlzvB7WD7PLiE8pIcOz82996d9Tbxhv9RCGUpBjV7fbt%2BJXsrfgI%2F%2FDLgaqI5UKvdq%2BPTWDB%2Fs3jB6uMnjb9w5Hfk%2Fe8d%2BeE5dfmFcN2Yw9v6we4iiCdwZmcEz7B3%2BxAzZXFyP%2FXch4YmFZQWG2%2F9r7IF824W%2F3H05%2FPI9nKvhVUOYacEUsNPZ8HKELbeSro5%2Bv4poRLzcgjYkV3sxFqeV9wTphvv5IR30gi1MaiWYmg6BmHCCfqEoGU7HEjoXrhqqk79cInnGmZ62uoYabIXYtPIr%2B2Eo4qqSKa4PKC%2BZ0QzdD1tH%2FVgL4U%2FBg1oR%2BJdmjpmoKSKHcbCvea0tt6ClDZg0to2ViX77DeQuldShHTOwTZcqBcstPHwali%2BxdIT9ix0VORm38%2BgcNEFRDtxq0yazVxtQv8cEEIGHJULTXa%2FpEK36%2FsXzCf06PGkM4xq13yJutcN9aFLu0lmgdHIVUG%2B8FpjdzVecDqLESvdDIRCeW57HkH2l%2F%2B9VnoU1BbFxzYhKYGdloFajsJ%2FkJRziM3pDGGZLS1fzd9V3ZLR2M56f5ey4QGL7Xa5A%2Fr66%2F%2FsPxNgkIEXvbLf34mRfzC3%2Fgq8voyDNAd3MPXRi9gGOqUB4LU%2FOoSngzcNJpTqHdmV%2FN0FqIHHAMbZ41dymxM1Hp4CVAqSFZ7HpvgKRuv6NWyKplgZl1D3myu4m4Hvr4FPlW6pqQ0TX7QwDdHsVUWXZnOoxm6A5D3stIFHNSi%2BMZr8Bbkd35Dc4AFpHWQGXz0eKML%2Fp4mIO53zli3a666BhMzaZPB9p0YGOJhxJ15RzSEZ1zX%2BQKl0nyenb9Y1Vy6ldr2nzU7K&X-Amz-Signature=44065a64f67a2655d62dc23a70d24f9665b38190a29f40621c93960ee08024e2&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

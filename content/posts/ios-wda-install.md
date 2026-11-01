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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466X3PJAQU2%2F20261101%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261101T030704Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJH%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQDbiCR9MyQhD7Mo0D5ptCmFzXwA%2BulYNv36sApCj6jdxAIhAOhyA%2FehVs8aX%2BOH%2F%2B5vyujrRHgO%2FZjotjyURQH4mRonKv8DCFoQABoMNjM3NDIzMTgzODA1IgwbhvpbY0s8IVFEIq8q3AMgfTPfE1hQIz2qiPnoMFCWzPHOEDQUFBHBPm6bMnZIO7EGFnsz9bhoNOPKH%2FxVF4osOCEjYHzL3ZJKC%2FOW03VTXZ2udCT78WtP%2FanZx8oHe%2FTGy3N%2BFaM4YUsiLcKQAcHlt9xylzgVZy4oEVHwImzDgjnHkEe37Q%2F7wUvm4OzDX3zeLy0mp9LUqKJI0IaHAAS6BsWzANpPX%2FhzFmQZxB9jqgLZjC9EWPY6tv%2FpD2H49MI%2FEj6CWA3rQJe2h%2FVgdOXY4oWCC7Jc6vh9rwdA2h1wwPqGPVetUdskXBuUYiMclhh%2BjBy0j6HKVmrXBU3lmRmla1erVIxb8n3vB5%2FtF%2FrIdgO5WmG7spEwX5a91q2ePTSA%2F%2FcUB%2BKWGwb1NDDxfK6d1BpHghgyFJ8kU6ZuxIaoUu%2BO42lZzIi%2BNnpL9Mk%2Fjl9jDCAQvmeCT3iK8RZ2omxS9KIQX8OQwvygOC3IxXFHEnogrHEr0YcpcBDoj5HlS1fam4XFDRcZvmpf27hcoHF0LoVV1Y9Ug8bMM276Li8vxWXdE2ogcF1r5fwG0rCgtA%2BV7He71Qr2ac9DnVYL5Ky%2B1ytrK%2FM0OxUJkU%2FGLyqW1euWOtwTZQlOUVscsDsyu7xqYKDYSWmfOpMVSTC8mJrXBjqkAf5zx2aqiUD2elu8WJg6snXe%2Fqei3A%2F%2BbfyvmaMMLm7Y1%2BuQWAOLrFWNFkfMdLzbNoRBUSTjdCCuZQrljk1FBnC8TEKtAykZRn2lmmoGWjspw%2FU%2BQBix1TPcu30dnRZdrp9BsT6TiUZZ3NJ1D7aQpYxpS%2BZD%2BOanHaWZK52bZLJu%2FuH7KwO1sRfIVjcwx%2F5xL77w8D20bhLgdUAE8sbD9J8aY0qx&X-Amz-Signature=40720d6419127276cadc1caf349176e142d26664d67b009eb6d4ed2e550bf88a&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466X3PJAQU2%2F20261101%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261101T030704Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJH%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQDbiCR9MyQhD7Mo0D5ptCmFzXwA%2BulYNv36sApCj6jdxAIhAOhyA%2FehVs8aX%2BOH%2F%2B5vyujrRHgO%2FZjotjyURQH4mRonKv8DCFoQABoMNjM3NDIzMTgzODA1IgwbhvpbY0s8IVFEIq8q3AMgfTPfE1hQIz2qiPnoMFCWzPHOEDQUFBHBPm6bMnZIO7EGFnsz9bhoNOPKH%2FxVF4osOCEjYHzL3ZJKC%2FOW03VTXZ2udCT78WtP%2FanZx8oHe%2FTGy3N%2BFaM4YUsiLcKQAcHlt9xylzgVZy4oEVHwImzDgjnHkEe37Q%2F7wUvm4OzDX3zeLy0mp9LUqKJI0IaHAAS6BsWzANpPX%2FhzFmQZxB9jqgLZjC9EWPY6tv%2FpD2H49MI%2FEj6CWA3rQJe2h%2FVgdOXY4oWCC7Jc6vh9rwdA2h1wwPqGPVetUdskXBuUYiMclhh%2BjBy0j6HKVmrXBU3lmRmla1erVIxb8n3vB5%2FtF%2FrIdgO5WmG7spEwX5a91q2ePTSA%2F%2FcUB%2BKWGwb1NDDxfK6d1BpHghgyFJ8kU6ZuxIaoUu%2BO42lZzIi%2BNnpL9Mk%2Fjl9jDCAQvmeCT3iK8RZ2omxS9KIQX8OQwvygOC3IxXFHEnogrHEr0YcpcBDoj5HlS1fam4XFDRcZvmpf27hcoHF0LoVV1Y9Ug8bMM276Li8vxWXdE2ogcF1r5fwG0rCgtA%2BV7He71Qr2ac9DnVYL5Ky%2B1ytrK%2FM0OxUJkU%2FGLyqW1euWOtwTZQlOUVscsDsyu7xqYKDYSWmfOpMVSTC8mJrXBjqkAf5zx2aqiUD2elu8WJg6snXe%2Fqei3A%2F%2BbfyvmaMMLm7Y1%2BuQWAOLrFWNFkfMdLzbNoRBUSTjdCCuZQrljk1FBnC8TEKtAykZRn2lmmoGWjspw%2FU%2BQBix1TPcu30dnRZdrp9BsT6TiUZZ3NJ1D7aQpYxpS%2BZD%2BOanHaWZK52bZLJu%2FuH7KwO1sRfIVjcwx%2F5xL77w8D20bhLgdUAE8sbD9J8aY0qx&X-Amz-Signature=300ff269f02f313771662acdc54d2d3b1e658aedad565a08b5064fb0680f1362&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

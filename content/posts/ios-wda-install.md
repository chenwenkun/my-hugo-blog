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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466WASRHNNC%2F20261012%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261012T031118Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjELP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQC7uQ%2FM8Tl%2FWs%2B9ZZOnPls8rEDYlIyva9sjs%2FZybYu0HAIhAMCl12co9ENmpM00WnXk5%2BVX5LhN8zDHxk3s1fn6%2BooIKv8DCHsQABoMNjM3NDIzMTgzODA1IgyowH96%2F1XL3lmztvcq3AOfWI3tsjaAun9kNbvIA9YrJA5%2FUcdrB1qNM39t9SnohZws6H15f98xjAX6AdEUfQwT8QHf9jjfQbTsfveYRgOPkibZ354TznV2wd3NdQ0w5IvWN2Lr%2Fguj4eWwvy5C%2BxcjQwkv4z0cEVuGjICqbK8YgfyQWHaxoOrgNxTJUUTvJ7uyfSihZyBDtv8IRPUtUizilfdTGSTn1BYwcrbivk94Gcbu4ckCMYNsiulXpxWbya7uN%2BfZWFKsxC67iBBVLXR0R1HUqgimhPmxd3FIwjAHv4Xtwea7gW2WCaLu0%2BsNuUrHS8ZtiVRzuvCMfcsMQq9vL3%2F8nTEJwxkH5b6%2BUTXZPOCKN2T0xd27B8jxs5g%2BWxBdDWsuBturYCVI7IzAj1TNK0gACvhBu%2FaH2MyRShSbhQvw1tjf27A385ibCezlkF9F2bxCJSTAxtxZqx2m%2F4RdKuT8hsUsgits4OYjV8Z8uvlurFmm9Be8HnSnpPTE3sNGyyuno7kvHSAddPHhiqgqU9fSDpmHhVzxqWwc3fES%2FNSePHsS8ZnDTGEUA04bhfS2EgadJA90u1zn96x0p0XsYInY7vgeHvhNTOCDrzy9NwWNQYQ1STAuWuuCkgv5i6UhBVVP6oww3Lb%2FIDCEjrHWBjqkAaRELCDrTdtXuI%2FzxwQsaw1%2BUCtNVfKDFWGhjw0zgrJHNNvvAYmdelZEbD80N0EmBj0skNfp%2FcPZ%2F6GvpeXZmXFcz20TahMTBLj8yqTvDsmWwt5SMVIia2UR4Rv6iPf6aFc6rltcGZ%2BN4vasbJnV9muIT%2BKoC6EX30%2BXuM5P0xWI%2Binn5Ft48Jiaqzj0m8b%2FV%2Flzrj0V6sedg0RFQudRO8A1Jws%2B&X-Amz-Signature=6452d84babdd165cfe248629c94fee9fbb839e22bf55524ad3bd029343e24b3d&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466WASRHNNC%2F20261012%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261012T031118Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjELP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQC7uQ%2FM8Tl%2FWs%2B9ZZOnPls8rEDYlIyva9sjs%2FZybYu0HAIhAMCl12co9ENmpM00WnXk5%2BVX5LhN8zDHxk3s1fn6%2BooIKv8DCHsQABoMNjM3NDIzMTgzODA1IgyowH96%2F1XL3lmztvcq3AOfWI3tsjaAun9kNbvIA9YrJA5%2FUcdrB1qNM39t9SnohZws6H15f98xjAX6AdEUfQwT8QHf9jjfQbTsfveYRgOPkibZ354TznV2wd3NdQ0w5IvWN2Lr%2Fguj4eWwvy5C%2BxcjQwkv4z0cEVuGjICqbK8YgfyQWHaxoOrgNxTJUUTvJ7uyfSihZyBDtv8IRPUtUizilfdTGSTn1BYwcrbivk94Gcbu4ckCMYNsiulXpxWbya7uN%2BfZWFKsxC67iBBVLXR0R1HUqgimhPmxd3FIwjAHv4Xtwea7gW2WCaLu0%2BsNuUrHS8ZtiVRzuvCMfcsMQq9vL3%2F8nTEJwxkH5b6%2BUTXZPOCKN2T0xd27B8jxs5g%2BWxBdDWsuBturYCVI7IzAj1TNK0gACvhBu%2FaH2MyRShSbhQvw1tjf27A385ibCezlkF9F2bxCJSTAxtxZqx2m%2F4RdKuT8hsUsgits4OYjV8Z8uvlurFmm9Be8HnSnpPTE3sNGyyuno7kvHSAddPHhiqgqU9fSDpmHhVzxqWwc3fES%2FNSePHsS8ZnDTGEUA04bhfS2EgadJA90u1zn96x0p0XsYInY7vgeHvhNTOCDrzy9NwWNQYQ1STAuWuuCkgv5i6UhBVVP6oww3Lb%2FIDCEjrHWBjqkAaRELCDrTdtXuI%2FzxwQsaw1%2BUCtNVfKDFWGhjw0zgrJHNNvvAYmdelZEbD80N0EmBj0skNfp%2FcPZ%2F6GvpeXZmXFcz20TahMTBLj8yqTvDsmWwt5SMVIia2UR4Rv6iPf6aFc6rltcGZ%2BN4vasbJnV9muIT%2BKoC6EX30%2BXuM5P0xWI%2Binn5Ft48Jiaqzj0m8b%2FV%2Flzrj0V6sedg0RFQudRO8A1Jws%2B&X-Amz-Signature=6ecf40ff20b1ff5481c93a75ef7d42753e7bcb8aafb4c6da8232febc34d9a644&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

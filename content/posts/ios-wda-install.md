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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466R2MZC77N%2F20260806%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260806T133910Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEHUaCXVzLXdlc3QtMiJHMEUCIDo%2BDlUVccukc9zQU%2FleykGQ3PNxWzXFhmUcBL01%2FSKLAiEAkCPZB70TNxLXV7IGs1EyCfy7sykXhyagcszQnJI20WQq%2FwMIPhAAGgw2Mzc0MjMxODM4MDUiDJU19mfA26cnOoayFSrcA8%2Fy3Z1zmYeqOV97jgr%2FPaGzNXoZbi6ufS8%2BJi2b6%2FuMslLNP2MDgP90MML9S3tX5wC905p%2FP%2B0EMmlR30Sw68mNb0T9pu%2F8KI7f2mhFr2wbdYg%2BBx%2BzTmoLLZVi3aspJVGcDGbNwbE6C12ZpDOdaGVAd4sYHSpOcn7su%2FTwJqkX0rTgX8pzeswfvnil1ItDr9VQKhr915Ho6JWMQSr%2BD7AsDokIGpaOq33dpmQxSprNDq4FuMbEXnJ9U0A5kbK7nneOSMso%2F1xL9UVui9g4PlIGg%2F0AsCsw%2F7K6Ha5u3L9wUPAy9fo1llp9eE7zxArS3GfJsrQ7ahQ9sbxHm3fqIPN2Y7T2iYG2ik2K7Cjs3wm2BcPSuB8LbtegSwrlwmOguBQODPPNwBO%2Bz%2Fre%2Fzmhh%2Fh1TuC2XnW6zyAuiN6j%2FAceKjR4%2BEe%2FW5gBP7r0xlF0FpOvIM6ybEiWWztVBsIu4dCqIbex%2F9ZTrM8fW7BYJCcCnZMBbpkGkY9tQiqtH500gNLFdoTGSMotTaKuX1y28TIgeQEGGW3lzwB%2BO12kTQaY55ME4O3vntMgB4hefBbfy08uMW0EU0XYMwFF9COJAuLHsBbY%2FUcjnhsp02g8M7xObaLGNzJGOwJtlh%2FqMPOJ0tMGOqUBgJJ1fXq%2BLp0AAjrlOfdWEhkU7aJ34yCqTRcEPG1Wyy2oOztqWTlrqy%2FBMNbanTTPsZTaxOrqIbAJGj9nOO8WQkobDPObKfZ4JXXTxgV3ZuP%2Bz7KCs7qNdyHgqUWnvFhjx4iFT%2BVz29wFeSGVvNE7uolYRJNn6lLzk9qh6UaEoa1GyLolPxZTr9%2BzGsAXvtqcCzBCbAqVOMSb62A4hnkzt3QYz9iW&X-Amz-Signature=42cf2e1589c519d0176293d198f371415757f81e45961865457a0f909fd17cde&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466R2MZC77N%2F20260806%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260806T133910Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEHUaCXVzLXdlc3QtMiJHMEUCIDo%2BDlUVccukc9zQU%2FleykGQ3PNxWzXFhmUcBL01%2FSKLAiEAkCPZB70TNxLXV7IGs1EyCfy7sykXhyagcszQnJI20WQq%2FwMIPhAAGgw2Mzc0MjMxODM4MDUiDJU19mfA26cnOoayFSrcA8%2Fy3Z1zmYeqOV97jgr%2FPaGzNXoZbi6ufS8%2BJi2b6%2FuMslLNP2MDgP90MML9S3tX5wC905p%2FP%2B0EMmlR30Sw68mNb0T9pu%2F8KI7f2mhFr2wbdYg%2BBx%2BzTmoLLZVi3aspJVGcDGbNwbE6C12ZpDOdaGVAd4sYHSpOcn7su%2FTwJqkX0rTgX8pzeswfvnil1ItDr9VQKhr915Ho6JWMQSr%2BD7AsDokIGpaOq33dpmQxSprNDq4FuMbEXnJ9U0A5kbK7nneOSMso%2F1xL9UVui9g4PlIGg%2F0AsCsw%2F7K6Ha5u3L9wUPAy9fo1llp9eE7zxArS3GfJsrQ7ahQ9sbxHm3fqIPN2Y7T2iYG2ik2K7Cjs3wm2BcPSuB8LbtegSwrlwmOguBQODPPNwBO%2Bz%2Fre%2Fzmhh%2Fh1TuC2XnW6zyAuiN6j%2FAceKjR4%2BEe%2FW5gBP7r0xlF0FpOvIM6ybEiWWztVBsIu4dCqIbex%2F9ZTrM8fW7BYJCcCnZMBbpkGkY9tQiqtH500gNLFdoTGSMotTaKuX1y28TIgeQEGGW3lzwB%2BO12kTQaY55ME4O3vntMgB4hefBbfy08uMW0EU0XYMwFF9COJAuLHsBbY%2FUcjnhsp02g8M7xObaLGNzJGOwJtlh%2FqMPOJ0tMGOqUBgJJ1fXq%2BLp0AAjrlOfdWEhkU7aJ34yCqTRcEPG1Wyy2oOztqWTlrqy%2FBMNbanTTPsZTaxOrqIbAJGj9nOO8WQkobDPObKfZ4JXXTxgV3ZuP%2Bz7KCs7qNdyHgqUWnvFhjx4iFT%2BVz29wFeSGVvNE7uolYRJNn6lLzk9qh6UaEoa1GyLolPxZTr9%2BzGsAXvtqcCzBCbAqVOMSb62A4hnkzt3QYz9iW&X-Amz-Signature=934df1b4afee32dd3adfb73d759f9887a23057e4491f66a43990264a134e2354&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

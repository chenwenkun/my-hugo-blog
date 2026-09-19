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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4665I5BDDJH%2F20260919%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260919T145957Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQClzayqE%2FZkNfp%2B02LFoouXSVmPB9UtTqrJJY0woFHzpAIgEfm%2BCX810%2F%2BLh1FnZYSRTUAz4FyvJiaFa1oNsp1YoOYq%2FwMIXhAAGgw2Mzc0MjMxODM4MDUiDBUPePSVxMvVnrkVYyrcA%2FEpZ86XS4zwCaFkEF8YwnLVd39fVxR6wbUg2ncDmfTEkFhj5FlBxObTGCVU07Xzk2ElPKQzN7pr9SGx9eHA6A2HrZh0Y4FYnZsLzIKOIXum7Pj71J313C0hWZDM6X6l8O0mXGMM58pPCiag6h%2B790wnXA8x9tTL5SQ7cq0tH0cHzXkl6TCfUCAZOdohrmG392S18niV634u%2BO7Cb0Tc5KUx030EyD7npnTn%2FudhE%2FZP3Buznu4JYeyuQlGkcFcTl0UeezttEfnGk3u7UHBlY3KM5GE5tb8AnX3%2FlqS%2BNTszmAwo8ABaqIL0Sm7Du7cD0vSvnAz%2Bxy6%2FeKsSgKds7wZ8Ab8h1TwxE6eWaBZndKIMO22tC1ppIPiGzEBMrljfu6GCxkZP0f94zEoChg0Q53Le84UQ3hLYOiAyIpTkE8teQR9Me5osCb1Gc4G7CAjhPxebX9sTZ1%2Fk10te8JIgON1HUe9i09xzJeAnlorO2KkESjriidtlFmL3iqC18CvRCEskWNp%2FEnlXF5gcWuRQHAgh6nZVC2mSQ%2FmeB39QNEzEl155BygkKOVT%2By%2FTo8boy5pVBCHxXiqK7HZKU4tkYnQxCCT7pBxyrGH8eOdUJs58H0lj4v0nMObwC1ThMOyJutUGOqUB9Rudpnqj%2FVTb0lkXJ5YwVAst3ccVXXtAx1DEaBv7FIUvHyqKeTqeJNtMXo15DDxlIVQRTiuu%2B2HWdBU0HxqGT6oCy%2FC6foLX305MfV6s0gC5Y6S%2B%2FjIgYqds%2F6JmXCY0DI4mb9ZgUUepi27bcNBAyQ1FkhY1ve88on9632pPMvECepXpaqbXbrWZATxSiQP%2BoHPvtHao6z0XVnKMCD3dmZaNpBsT&X-Amz-Signature=4d00716695429c12ee0934b9afe043f490217aa2ec9e333c2abc8e55164b1828&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4665I5BDDJH%2F20260919%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260919T145957Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQClzayqE%2FZkNfp%2B02LFoouXSVmPB9UtTqrJJY0woFHzpAIgEfm%2BCX810%2F%2BLh1FnZYSRTUAz4FyvJiaFa1oNsp1YoOYq%2FwMIXhAAGgw2Mzc0MjMxODM4MDUiDBUPePSVxMvVnrkVYyrcA%2FEpZ86XS4zwCaFkEF8YwnLVd39fVxR6wbUg2ncDmfTEkFhj5FlBxObTGCVU07Xzk2ElPKQzN7pr9SGx9eHA6A2HrZh0Y4FYnZsLzIKOIXum7Pj71J313C0hWZDM6X6l8O0mXGMM58pPCiag6h%2B790wnXA8x9tTL5SQ7cq0tH0cHzXkl6TCfUCAZOdohrmG392S18niV634u%2BO7Cb0Tc5KUx030EyD7npnTn%2FudhE%2FZP3Buznu4JYeyuQlGkcFcTl0UeezttEfnGk3u7UHBlY3KM5GE5tb8AnX3%2FlqS%2BNTszmAwo8ABaqIL0Sm7Du7cD0vSvnAz%2Bxy6%2FeKsSgKds7wZ8Ab8h1TwxE6eWaBZndKIMO22tC1ppIPiGzEBMrljfu6GCxkZP0f94zEoChg0Q53Le84UQ3hLYOiAyIpTkE8teQR9Me5osCb1Gc4G7CAjhPxebX9sTZ1%2Fk10te8JIgON1HUe9i09xzJeAnlorO2KkESjriidtlFmL3iqC18CvRCEskWNp%2FEnlXF5gcWuRQHAgh6nZVC2mSQ%2FmeB39QNEzEl155BygkKOVT%2By%2FTo8boy5pVBCHxXiqK7HZKU4tkYnQxCCT7pBxyrGH8eOdUJs58H0lj4v0nMObwC1ThMOyJutUGOqUB9Rudpnqj%2FVTb0lkXJ5YwVAst3ccVXXtAx1DEaBv7FIUvHyqKeTqeJNtMXo15DDxlIVQRTiuu%2B2HWdBU0HxqGT6oCy%2FC6foLX305MfV6s0gC5Y6S%2B%2FjIgYqds%2F6JmXCY0DI4mb9ZgUUepi27bcNBAyQ1FkhY1ve88on9632pPMvECepXpaqbXbrWZATxSiQP%2BoHPvtHao6z0XVnKMCD3dmZaNpBsT&X-Amz-Signature=fe975db62f710eb779274666d3ac1f8c5cc39eaf26bd5d5dfcce8745fdadd683&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

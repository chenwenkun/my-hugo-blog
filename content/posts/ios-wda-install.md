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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466VZ32J2AD%2F20260806%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260806T081332Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEHAaCXVzLXdlc3QtMiJGMEQCIA3jITttzPd0OzJGCuU8TiEAzqAJf%2FFuCuhnzysmSsd3AiB95aImT4WOOWkE8fzVG7VRGpO0M1hs%2BxTLMPaZ6nu8eCr%2FAwg5EAAaDDYzNzQyMzE4MzgwNSIMbTt%2Bk49ZQ8S4md07KtwD7lJjFmDxvnZttnOfb53mInVGBDaeQhbaFA1LOrMOZOe%2FJ18ei%2BsXXLSqkTS%2B%2B8T1lCSxcGczeOY7nJHDnLRY5AvnuFs73bgTpSyxr%2BiANE1JOkPPdkL%2BfA04Z%2FnV%2Bv0rYmF8A4UPBYdNAW%2F5lGUScUNLrszZXwAhbSm5DjlapJcLKWtsfnqTYAJmJtaSPPu4fovoDzb2WAPI%2F0dUrW65DGLLpKkSLHd37IuXcBoYH50ekQVS7BXm0AjycBjMiPf3z4xTMHq46%2BDNjLegBBl2Iz7R%2B4v%2BgRDosKvuqBibrc1T3Yv85Hf%2BTpOMdI5pO5RAaBdRBSGfQ1KKMZ%2FOUs%2FiTK4Fb0SBPb%2FuEk6YH%2B3tkz%2BwBGDa%2F7dBv4olZq7hPNq1OgduYLwrzsDsZsFXnt%2FG8Jsu6hBVlCL75yRW3eBfPN%2Fj98ZyaaPwqsyVLJyjK0U30dACavNeYjte9bLDuqW4UV9xrrDnvuQuHZI6V1R267fgDw%2FeXuQB4FqdeIMJikbgaJvrKs82e0PLGON8jFqmHV17fV%2BZYAvHH2Ag4betDlgZZdFF5CwKGq1yZ48jKYxTfUUJBCV8C5OthIJVBgMYTjOOwSnjodvk3VYOR7dhCXdEjMPvGwMgd8Btk5Yw2vrQ0wY6pgEZ5hE2xWbLqN69qVXHaqPpajyWCtUujQ3efm5QhkSoxsHmB0f7mZIFiSXk5yXVRtEPg1akMzNh3KRpOusxs5JROwXVI4AXO8DYUXsrXsAXSFy26IMPS89aWPwgJxwGTsCrkz6qq4YElsxIXtZpSR80ZW8%2FStKKwI7eck136V1Z%2Fmyz0VeQT7JpQfuNeHo%2FQQBBV6qBdGlaOmeICebcD6s8%2B5joIXhz&X-Amz-Signature=168ba5789f4b4cc6792322704b88063d66533dda9586b4129a08d7fcd91c99ca&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466VZ32J2AD%2F20260806%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260806T081332Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEHAaCXVzLXdlc3QtMiJGMEQCIA3jITttzPd0OzJGCuU8TiEAzqAJf%2FFuCuhnzysmSsd3AiB95aImT4WOOWkE8fzVG7VRGpO0M1hs%2BxTLMPaZ6nu8eCr%2FAwg5EAAaDDYzNzQyMzE4MzgwNSIMbTt%2Bk49ZQ8S4md07KtwD7lJjFmDxvnZttnOfb53mInVGBDaeQhbaFA1LOrMOZOe%2FJ18ei%2BsXXLSqkTS%2B%2B8T1lCSxcGczeOY7nJHDnLRY5AvnuFs73bgTpSyxr%2BiANE1JOkPPdkL%2BfA04Z%2FnV%2Bv0rYmF8A4UPBYdNAW%2F5lGUScUNLrszZXwAhbSm5DjlapJcLKWtsfnqTYAJmJtaSPPu4fovoDzb2WAPI%2F0dUrW65DGLLpKkSLHd37IuXcBoYH50ekQVS7BXm0AjycBjMiPf3z4xTMHq46%2BDNjLegBBl2Iz7R%2B4v%2BgRDosKvuqBibrc1T3Yv85Hf%2BTpOMdI5pO5RAaBdRBSGfQ1KKMZ%2FOUs%2FiTK4Fb0SBPb%2FuEk6YH%2B3tkz%2BwBGDa%2F7dBv4olZq7hPNq1OgduYLwrzsDsZsFXnt%2FG8Jsu6hBVlCL75yRW3eBfPN%2Fj98ZyaaPwqsyVLJyjK0U30dACavNeYjte9bLDuqW4UV9xrrDnvuQuHZI6V1R267fgDw%2FeXuQB4FqdeIMJikbgaJvrKs82e0PLGON8jFqmHV17fV%2BZYAvHH2Ag4betDlgZZdFF5CwKGq1yZ48jKYxTfUUJBCV8C5OthIJVBgMYTjOOwSnjodvk3VYOR7dhCXdEjMPvGwMgd8Btk5Yw2vrQ0wY6pgEZ5hE2xWbLqN69qVXHaqPpajyWCtUujQ3efm5QhkSoxsHmB0f7mZIFiSXk5yXVRtEPg1akMzNh3KRpOusxs5JROwXVI4AXO8DYUXsrXsAXSFy26IMPS89aWPwgJxwGTsCrkz6qq4YElsxIXtZpSR80ZW8%2FStKKwI7eck136V1Z%2Fmyz0VeQT7JpQfuNeHo%2FQQBBV6qBdGlaOmeICebcD6s8%2B5joIXhz&X-Amz-Signature=668b241a8f78530ec640afa04656b374488d18d00878c3f4889ff8c6717d8de1&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

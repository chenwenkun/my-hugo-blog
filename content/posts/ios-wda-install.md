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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB46662VAG2VQ%2F20260907%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260907T164911Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEHkaCXVzLXdlc3QtMiJIMEYCIQCAdvo9WTDsos3g8ZrjO%2BGwya0Wms3jlQI2856dGgnwjAIhAMSOi2dC0%2FglwHbj5O5LR%2F7ELuTEAYiUVw9koA6yX1R4Kv8DCEEQABoMNjM3NDIzMTgzODA1IgxZYiOAdUGMjuYr16Qq3AOcw5AMd2CN6%2Bfcl0tUmebBGWbvzsolnGcbzhEwfHOZO3U6vN3YPJ%2Bb%2FMl87zyKguD8wofpO3fvOwW4Yn3tc%2FEuB9ytCkCT2ETtcCsiCqdmKCj5tOGWKijbRhOAalFAYcR8cg2d8zupw3KhHmY1rhoSYcB9SVOK5%2BQlHSB2AbvUiHPMA9RnWO0OJcuREFSzK0mmF9I3zOj1DmvqsadOLWT5XV0zyTInaYN41gUJFfhD%2BXN39SXGilegWpj0S3%2Fvb%2Fai2TstGEJRzO201NbU1QoTrn4jfVuHDSx0a9dd1XYKgiK1s1T2sRBpniavyAo8VEpIiMo2hph0F4tSjXfzvbkZcjsPEs2gJNC0ulwJ14GxcHmeGcqXNRrDyX7sMk8N9hFV8x9ZVwoKF6nFaZD6pRlTrEVJYDMkikIbrEND6V6cOgsqfi6tujCnNP9rINZiPsK%2BjG3szhHV839SCx6aZ%2BCUxcbMMkaDMnE%2BAGdimNuXS4gfbjiBix8l66Kp9FmXk5cZF3gD0tkveA47oQyymI6Gt2DebUfvem8w%2B1%2F3467ZvxEc%2FWuc1D9F%2BhwQZkGucU2qORbGrcZiOmyPBvTHv8wXeL%2FNc7%2FUhmXzrsGVMLJ9P7EiA8XL0J1vXNG0qzD2yPvUBjqkAeXUFwdTIXzPqQPXc%2BOFVrLSmd0OUHGXDqHYsgcknfuieFtAbqAJ%2FTmF%2Fkn4dKdK03bgGUKQ9kModmSm%2F7vLLZalMHjMpwE7OpiupUW7E%2FIYJHDuwb8AWjAdbfW9Q1E7orDQlJjc9CIGubUleNW3SSYpGhbuwf6qdmS2xga6BB8Y2m20qG%2BrfgPmdwt5Ddjxo8XTNaNOO0HJW%2BH4AvapC5ZhNtvF&X-Amz-Signature=6069a2ff04eb20af1110cd188cfaba826fc524847c54f45fe98d03e947c9a9ed&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB46662VAG2VQ%2F20260907%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260907T164911Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEHkaCXVzLXdlc3QtMiJIMEYCIQCAdvo9WTDsos3g8ZrjO%2BGwya0Wms3jlQI2856dGgnwjAIhAMSOi2dC0%2FglwHbj5O5LR%2F7ELuTEAYiUVw9koA6yX1R4Kv8DCEEQABoMNjM3NDIzMTgzODA1IgxZYiOAdUGMjuYr16Qq3AOcw5AMd2CN6%2Bfcl0tUmebBGWbvzsolnGcbzhEwfHOZO3U6vN3YPJ%2Bb%2FMl87zyKguD8wofpO3fvOwW4Yn3tc%2FEuB9ytCkCT2ETtcCsiCqdmKCj5tOGWKijbRhOAalFAYcR8cg2d8zupw3KhHmY1rhoSYcB9SVOK5%2BQlHSB2AbvUiHPMA9RnWO0OJcuREFSzK0mmF9I3zOj1DmvqsadOLWT5XV0zyTInaYN41gUJFfhD%2BXN39SXGilegWpj0S3%2Fvb%2Fai2TstGEJRzO201NbU1QoTrn4jfVuHDSx0a9dd1XYKgiK1s1T2sRBpniavyAo8VEpIiMo2hph0F4tSjXfzvbkZcjsPEs2gJNC0ulwJ14GxcHmeGcqXNRrDyX7sMk8N9hFV8x9ZVwoKF6nFaZD6pRlTrEVJYDMkikIbrEND6V6cOgsqfi6tujCnNP9rINZiPsK%2BjG3szhHV839SCx6aZ%2BCUxcbMMkaDMnE%2BAGdimNuXS4gfbjiBix8l66Kp9FmXk5cZF3gD0tkveA47oQyymI6Gt2DebUfvem8w%2B1%2F3467ZvxEc%2FWuc1D9F%2BhwQZkGucU2qORbGrcZiOmyPBvTHv8wXeL%2FNc7%2FUhmXzrsGVMLJ9P7EiA8XL0J1vXNG0qzD2yPvUBjqkAeXUFwdTIXzPqQPXc%2BOFVrLSmd0OUHGXDqHYsgcknfuieFtAbqAJ%2FTmF%2Fkn4dKdK03bgGUKQ9kModmSm%2F7vLLZalMHjMpwE7OpiupUW7E%2FIYJHDuwb8AWjAdbfW9Q1E7orDQlJjc9CIGubUleNW3SSYpGhbuwf6qdmS2xga6BB8Y2m20qG%2BrfgPmdwt5Ddjxo8XTNaNOO0HJW%2BH4AvapC5ZhNtvF&X-Amz-Signature=e2e54bc4363d1d6a01f47d0d8ce1a2d4f80db7e43353a3029bc8ed499af94760&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

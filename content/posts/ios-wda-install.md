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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466VQFYECCL%2F20261022%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261022T022559Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEKH%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQD%2BKk3CEWXu4bCU7IMWSAJD8g2i72yjlBlAngjPakFfogIhAJKevYH4sn%2FVs%2BWLxaOk1yV9Prw6hCXgq6rocJZVzpjgKv8DCGkQABoMNjM3NDIzMTgzODA1IgxEL6V7PZCVvEXrnFIq3AN4hObtfrAbA3zwgZPrhYNT17SaRixFOf3FNBA67qkdCEQCJ0qANQnrHdzC9YI%2FJNbZNBL8FXGqohcF8nuyzY4IAPsQgeoUjGXNJDfEQG5D1yTP6DhuABwBbTYT1rZ7cUVwy0N2DA5muyNi5VIjXV6MxeURWZHPgr13mM%2Bgd3w9GzvOoPyNusbBGmjFOBGiLDrIIf6Wn5K80UgJwxXcPz6lET3qf0Q6d0SAImQc4mrGMw3PmEesrXBgQPktFGBkKdNN%2FJ%2BX%2FzOTMSEQg0IoG%2Fnlvz89tBZPZ4E31VVLs%2FoJsAQYvEkX0CJ9vusex4ZCyV%2FFxUDio%2BMCVpPWr4ka3BGttU7%2FDdxDuJiAMTmiFxb%2BE1GbxnFNZCAOtByC0hetJJyQa6I51U6J0N3BWwJoCDO81FtFdKc9FUzr6sl45S2sCgODLYKiwaL7VyYnBi8p7KKqy6Xi%2FsjSm4rV288L0QVb1qMRWBjk6KEUYDirpHNJsQ1RAhUkShpLY5lRMGyqLCZKNvTTxjV0jfEJAEVVX4KXpS4FXvkYlexCqXZ6CayhJky3iD97q%2BYgfd2FuUNS8LHSRea0zDWqsBIhvBLi8ZSWqep%2BeQKJKQs5qeTovHGE2fMiRyKXF%2FAdwMysrjCNuuXWBjqkAS%2BcEPXRAjpC7M2OXe70Wcsk7%2BKILUidCA%2BkD1cr%2BrhrWYD2Dr11Tjf4K%2FNKH3H6OI8xvn3BMP9w5B9FS14G6DYMV%2FwpIRImt59GJlTylZmlE8hTZDEQpQ4MR2Ub0P9SSKJ5lf18En6FZrjZqP%2FNcPyMXkhiHq9ZHEh46oFPo043wSHWIOHKWbFOUJEcQQCHorjUObslSfw4JtqamZ%2FSTvsxchRD&X-Amz-Signature=4df75a3c1ede9eaa5d36eddcb56308833f40dace812908b6673463b5cac64b2e&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466VQFYECCL%2F20261022%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261022T022559Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEKH%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQD%2BKk3CEWXu4bCU7IMWSAJD8g2i72yjlBlAngjPakFfogIhAJKevYH4sn%2FVs%2BWLxaOk1yV9Prw6hCXgq6rocJZVzpjgKv8DCGkQABoMNjM3NDIzMTgzODA1IgxEL6V7PZCVvEXrnFIq3AN4hObtfrAbA3zwgZPrhYNT17SaRixFOf3FNBA67qkdCEQCJ0qANQnrHdzC9YI%2FJNbZNBL8FXGqohcF8nuyzY4IAPsQgeoUjGXNJDfEQG5D1yTP6DhuABwBbTYT1rZ7cUVwy0N2DA5muyNi5VIjXV6MxeURWZHPgr13mM%2Bgd3w9GzvOoPyNusbBGmjFOBGiLDrIIf6Wn5K80UgJwxXcPz6lET3qf0Q6d0SAImQc4mrGMw3PmEesrXBgQPktFGBkKdNN%2FJ%2BX%2FzOTMSEQg0IoG%2Fnlvz89tBZPZ4E31VVLs%2FoJsAQYvEkX0CJ9vusex4ZCyV%2FFxUDio%2BMCVpPWr4ka3BGttU7%2FDdxDuJiAMTmiFxb%2BE1GbxnFNZCAOtByC0hetJJyQa6I51U6J0N3BWwJoCDO81FtFdKc9FUzr6sl45S2sCgODLYKiwaL7VyYnBi8p7KKqy6Xi%2FsjSm4rV288L0QVb1qMRWBjk6KEUYDirpHNJsQ1RAhUkShpLY5lRMGyqLCZKNvTTxjV0jfEJAEVVX4KXpS4FXvkYlexCqXZ6CayhJky3iD97q%2BYgfd2FuUNS8LHSRea0zDWqsBIhvBLi8ZSWqep%2BeQKJKQs5qeTovHGE2fMiRyKXF%2FAdwMysrjCNuuXWBjqkAS%2BcEPXRAjpC7M2OXe70Wcsk7%2BKILUidCA%2BkD1cr%2BrhrWYD2Dr11Tjf4K%2FNKH3H6OI8xvn3BMP9w5B9FS14G6DYMV%2FwpIRImt59GJlTylZmlE8hTZDEQpQ4MR2Ub0P9SSKJ5lf18En6FZrjZqP%2FNcPyMXkhiHq9ZHEh46oFPo043wSHWIOHKWbFOUJEcQQCHorjUObslSfw4JtqamZ%2FSTvsxchRD&X-Amz-Signature=dc71481089fad7dd84be692db908fb65d8dfdec4d92ab6d1d597c8be98bc2792&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

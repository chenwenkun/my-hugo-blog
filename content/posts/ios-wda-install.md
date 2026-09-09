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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466QIYR62AK%2F20260909%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260909T153106Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEKf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIDAJoltj5Z4hE0O4u%2FWhSHWGiskkj%2FYJLTSoWlF6Xk8wAiEAioi1mB0aHFjnc2Yv6JlG%2B8AN59in9DPhcAb1cJP66qMq%2FwMIcBAAGgw2Mzc0MjMxODM4MDUiDBVTpeYA6mnFYl0D9ircA%2FE1IYNupangMvLeIop1gF9UzuBHY7PVS4De0RImdq6Qk8xlXVpyUatjod4wk9248EWK4HYaH8w5Ap71vX7Fvb2ZcLcylE1KHXpGJ7pbCqIn%2FZPadJVWcL82I9KuiwdpyMltjJhkSCoNCRP%2B3Ow3Z%2BJCCAqCUwROaStftVmN%2FfTZU%2B11UHjdt6lqedxuh3gviV5tU3%2BPNMDQLjDGzLydIjSTKBd7wmY0PokCFERveaegMWNOiWt%2BnEzNYcgTPO7wJhsLyL5Kzm0ZCII9Ab10wCvQURv0ix1KTmxvD%2FB%2FiS6aZryEYVpiFORhvI5xYtzRBf0yBEfdcN%2B4snbz0Ifcdu%2BXDnPdHfWw2XNhtpq4RKuHpu6cfH0%2FSczKZ8lK16xmhWRSJBDu8I146TEfXNoFWOxb8hZ7XjGfOS1g4nsEyde7Jk6HXqmGwAbTp4GeBsW40IuMjkJFKeI7JLwsdxbFZwb35XZndLaXnTmxpv2cVU9N4Sm%2ByzBCaTmLFPzcptZAq9Rh9vhM%2BIvO7EX96nT%2BPA4kfWF6LU8C45Oa9Fx5WkmBaIrHQBMta9smh%2F9xhHx0LILGfrNpxGv2jHJLyFYkQV%2FXQswdy1mACfIxcBN1hux0BAGuMPXDu95xbf8AMLrnhdUGOqUBY7UgBUio7ucwZ2muKFpzlUvsjoYcdKQpUOy41QddnvaXuVzZCP55E2bmKwqIXDsFkv984mKlR5qZ%2B8teBSGBxv9aiDjVKZ%2FS%2BQUrYm5ul1yNm3yoK7fBwnk3tNJUB52YNyHpHVKJq3GeiJLbvAJgXYEq9NSjoojsqepSszN36zxxLJqccPFfHs5xpxQpoEGs0EikCyN5mlf8OqdDWgLdMswOPXkr&X-Amz-Signature=7ab37b07f8cf5ae0a07ef379910892271180130a96fa1563c65c82b4a8e1e6e4&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466QIYR62AK%2F20260909%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260909T153106Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEKf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIDAJoltj5Z4hE0O4u%2FWhSHWGiskkj%2FYJLTSoWlF6Xk8wAiEAioi1mB0aHFjnc2Yv6JlG%2B8AN59in9DPhcAb1cJP66qMq%2FwMIcBAAGgw2Mzc0MjMxODM4MDUiDBVTpeYA6mnFYl0D9ircA%2FE1IYNupangMvLeIop1gF9UzuBHY7PVS4De0RImdq6Qk8xlXVpyUatjod4wk9248EWK4HYaH8w5Ap71vX7Fvb2ZcLcylE1KHXpGJ7pbCqIn%2FZPadJVWcL82I9KuiwdpyMltjJhkSCoNCRP%2B3Ow3Z%2BJCCAqCUwROaStftVmN%2FfTZU%2B11UHjdt6lqedxuh3gviV5tU3%2BPNMDQLjDGzLydIjSTKBd7wmY0PokCFERveaegMWNOiWt%2BnEzNYcgTPO7wJhsLyL5Kzm0ZCII9Ab10wCvQURv0ix1KTmxvD%2FB%2FiS6aZryEYVpiFORhvI5xYtzRBf0yBEfdcN%2B4snbz0Ifcdu%2BXDnPdHfWw2XNhtpq4RKuHpu6cfH0%2FSczKZ8lK16xmhWRSJBDu8I146TEfXNoFWOxb8hZ7XjGfOS1g4nsEyde7Jk6HXqmGwAbTp4GeBsW40IuMjkJFKeI7JLwsdxbFZwb35XZndLaXnTmxpv2cVU9N4Sm%2ByzBCaTmLFPzcptZAq9Rh9vhM%2BIvO7EX96nT%2BPA4kfWF6LU8C45Oa9Fx5WkmBaIrHQBMta9smh%2F9xhHx0LILGfrNpxGv2jHJLyFYkQV%2FXQswdy1mACfIxcBN1hux0BAGuMPXDu95xbf8AMLrnhdUGOqUBY7UgBUio7ucwZ2muKFpzlUvsjoYcdKQpUOy41QddnvaXuVzZCP55E2bmKwqIXDsFkv984mKlR5qZ%2B8teBSGBxv9aiDjVKZ%2FS%2BQUrYm5ul1yNm3yoK7fBwnk3tNJUB52YNyHpHVKJq3GeiJLbvAJgXYEq9NSjoojsqepSszN36zxxLJqccPFfHs5xpxQpoEGs0EikCyN5mlf8OqdDWgLdMswOPXkr&X-Amz-Signature=f21ad6ec5febcc0d5828c3b4c2395ff4bc658789bacfe71302a6862741e46297&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

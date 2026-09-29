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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466R7ZDM6GX%2F20260929%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260929T114607Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEIL%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIB7aiPrCUut6vQyvBLg2J3MWIZQDOFYSyXnR7zMLSWA9AiBZVr0dxvDkwzs5BEBTV5lMYroIXM%2BtIVdcWw4vqW9Adir%2FAwhLEAAaDDYzNzQyMzE4MzgwNSIMVlrcL3Rm0BVAz0hBKtwDavIy2QB24rXKUthnrUFG0CPqpEAxOMIIS3HSMXZU73RJk4JwJCcDHIitESHwWuBbgf6HyNRRnLGlDXQkbQ7HDe7Ubl0IyRbpvjXgloX5HS7EqfSVfSdQ2fonKClUxL61IKLejYBqtIs4qnEzmuVbkIZM3r%2FDtS1o0UPmkGIKwwxPPz19u72oulL0%2F0nQgffXga38qO3wzqp7fuqCtE2Ozh6Qb7QI78nBYDRJUpBD6ne8Cd9SB674z8quszBfTXRzyNYwHvWIbZpk%2BBvLU2b90oxHTFMCEU6dukUJ9SOiZEsMh9se7JqADZRnyhW1VEWb%2BzJsrXYY98FKodvNarkmxs3VnTS9WBx5LED%2B4RhvJd07yHLbDffv%2B6gwAkzIFr2Jur7%2BYLWgw6YxMQaMc1gHqVScnfhcwVOtbAR8BxmcP8z3Uui3SxI%2FkYxS6KfwUAFJ%2B6%2FlJCPbWlafGBhugM%2BKXIPGB888bBFkgJGQJXxAm7WG4GLnB7wYQCCdNHKtuTyGKZkbc7d6vCvaMRcqXkb40GenB5mZ%2FrvlpdE06DMtVG%2B5rijSuv%2FECBMGZhtUKCERxntxSsqDzcpfcqi9%2FOLMBkTSM1pw%2Fv4U6IGqFfzl%2Fja3XaU0yLdBuWAbbbowpZDu1QY6pgHXNOxD6jr8oPpGurSu0gy7DdQJ7bk7XNI%2BbZrwamX1I%2BtGsDFxhwoE7XxuPkQSS%2FnNberCEHHgW9Ax%2Fy4QxPmUHIjM9tPdTqgrjKQLdzrhaehf9rXjZcg5%2FzQOj%2FIqxZjGmdBbQY3SvK5qd%2FXlTBckd0gPKE6wM2aKCd8jiC6Dns6Wm2XedE%2FV9fscWo3NJ0v7YQjMjttMEFfdE2usdPal6SSKaKhm&X-Amz-Signature=6fe304288ef37c0946abb4eb2aedcd4b9f581ff6619da992c22e8162db1f20c6&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466R7ZDM6GX%2F20260929%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260929T114607Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEIL%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIB7aiPrCUut6vQyvBLg2J3MWIZQDOFYSyXnR7zMLSWA9AiBZVr0dxvDkwzs5BEBTV5lMYroIXM%2BtIVdcWw4vqW9Adir%2FAwhLEAAaDDYzNzQyMzE4MzgwNSIMVlrcL3Rm0BVAz0hBKtwDavIy2QB24rXKUthnrUFG0CPqpEAxOMIIS3HSMXZU73RJk4JwJCcDHIitESHwWuBbgf6HyNRRnLGlDXQkbQ7HDe7Ubl0IyRbpvjXgloX5HS7EqfSVfSdQ2fonKClUxL61IKLejYBqtIs4qnEzmuVbkIZM3r%2FDtS1o0UPmkGIKwwxPPz19u72oulL0%2F0nQgffXga38qO3wzqp7fuqCtE2Ozh6Qb7QI78nBYDRJUpBD6ne8Cd9SB674z8quszBfTXRzyNYwHvWIbZpk%2BBvLU2b90oxHTFMCEU6dukUJ9SOiZEsMh9se7JqADZRnyhW1VEWb%2BzJsrXYY98FKodvNarkmxs3VnTS9WBx5LED%2B4RhvJd07yHLbDffv%2B6gwAkzIFr2Jur7%2BYLWgw6YxMQaMc1gHqVScnfhcwVOtbAR8BxmcP8z3Uui3SxI%2FkYxS6KfwUAFJ%2B6%2FlJCPbWlafGBhugM%2BKXIPGB888bBFkgJGQJXxAm7WG4GLnB7wYQCCdNHKtuTyGKZkbc7d6vCvaMRcqXkb40GenB5mZ%2FrvlpdE06DMtVG%2B5rijSuv%2FECBMGZhtUKCERxntxSsqDzcpfcqi9%2FOLMBkTSM1pw%2Fv4U6IGqFfzl%2Fja3XaU0yLdBuWAbbbowpZDu1QY6pgHXNOxD6jr8oPpGurSu0gy7DdQJ7bk7XNI%2BbZrwamX1I%2BtGsDFxhwoE7XxuPkQSS%2FnNberCEHHgW9Ax%2Fy4QxPmUHIjM9tPdTqgrjKQLdzrhaehf9rXjZcg5%2FzQOj%2FIqxZjGmdBbQY3SvK5qd%2FXlTBckd0gPKE6wM2aKCd8jiC6Dns6Wm2XedE%2FV9fscWo3NJ0v7YQjMjttMEFfdE2usdPal6SSKaKhm&X-Amz-Signature=312b5e769b47fe185a4750ac566a16d9ac814bdd4d7b058c9ea33e46f95ad854&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

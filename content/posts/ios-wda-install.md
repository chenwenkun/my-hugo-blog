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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4667LVWUQSW%2F20261124%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261124T164053Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEMf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQD1COoEsQY0eXWCRlvMXV2HndAFcVFv2AnSVX2EJ%2B3adwIgDihxqdnwTqbrO%2BuI6zPOnsw6Q3y0Be3SpkdKDMCW250qiAQIkP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDB4M5YSf%2BW8iBE5vRCrcAz3e3fpE55eya8GQsaWZ9c965HXS1LYzyFXFhDeqJD8%2FBmtKFYSrc3PKsFSh1TRcPuBxDnaQPjtH%2FncR504ZthFp5bjZxsLvOCyNcN9VDPQOdG%2F9LddatB4HLL9TjuFnI7e9o%2BiVJjYvm6%2BUYwVf8f%2FUg%2BqOdTDSCpzbAF5hImFH%2BkDTgbMM75rA9Y07FoNVMYJyosBbS6J5yxlkC%2FS6dQ9zE74SSzupSi6XOUCnm1RTRD0rcH2%2BYzfpiXfDG4BXO0l5UuaZ4PwW7C%2Bv4%2BrqdDzdxVZjpBSO3DD%2F4ceZMXA1seiLzTqYzZlBRjOZ1Lk0PFBqvMlYA%2FUAKHdc3YWYHDZso1C5HRhgsJspsU63hZBzN8rPaapZ5L1WnEoP6LOIySbwxDwSYrQnAdfKc2JB90ZENrmh%2BIpbf7H3Bt2CxJJJZF3hGcqUuBofOGmTMYbYLv%2BGg7obFrNbjpNAN7uDjwc9CXBVMTa1HFuYHnN5DjhyWssEBihTHUBWZ%2FtRXmA9tZ6Gl7k2BFG%2F4SsfP41Agz1cQ5t0TpWkuv%2F5rUgfrViFFtlDW9PHhHFga64HMbOp0TQrIjPadl51twfDTy5UgAqipkkxwRjzENYcwceUjuxPWrf%2FRvtye7bnwqhIMIrNltgGOqUBfziGbqexJMz75W06XIiy1Z1BzlEX5cdOj5CFzekIvuE5nk10LlO5rKlavNKwGUIyH0u9tU%2Fhtd4XJM%2FdDQwz4aFUigQhvJDMJRvHOroS00%2F%2FBEpXCRPxJ44Z0MWAF6cGBpzrRuh0IkmesqVieYtTvKyOZFkQbROZI1f3P5JQkbFScOYW4ztyTCJUrhrAUwEp%2FnvBy3w9LwG%2Fjc23RyFBdGXpiq9V&X-Amz-Signature=cd429aa54a823feff6b9aa21abeab0f2cecee3e29a271e729ea43b5bfc4f247b&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4667LVWUQSW%2F20261124%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261124T164053Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEMf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQD1COoEsQY0eXWCRlvMXV2HndAFcVFv2AnSVX2EJ%2B3adwIgDihxqdnwTqbrO%2BuI6zPOnsw6Q3y0Be3SpkdKDMCW250qiAQIkP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDB4M5YSf%2BW8iBE5vRCrcAz3e3fpE55eya8GQsaWZ9c965HXS1LYzyFXFhDeqJD8%2FBmtKFYSrc3PKsFSh1TRcPuBxDnaQPjtH%2FncR504ZthFp5bjZxsLvOCyNcN9VDPQOdG%2F9LddatB4HLL9TjuFnI7e9o%2BiVJjYvm6%2BUYwVf8f%2FUg%2BqOdTDSCpzbAF5hImFH%2BkDTgbMM75rA9Y07FoNVMYJyosBbS6J5yxlkC%2FS6dQ9zE74SSzupSi6XOUCnm1RTRD0rcH2%2BYzfpiXfDG4BXO0l5UuaZ4PwW7C%2Bv4%2BrqdDzdxVZjpBSO3DD%2F4ceZMXA1seiLzTqYzZlBRjOZ1Lk0PFBqvMlYA%2FUAKHdc3YWYHDZso1C5HRhgsJspsU63hZBzN8rPaapZ5L1WnEoP6LOIySbwxDwSYrQnAdfKc2JB90ZENrmh%2BIpbf7H3Bt2CxJJJZF3hGcqUuBofOGmTMYbYLv%2BGg7obFrNbjpNAN7uDjwc9CXBVMTa1HFuYHnN5DjhyWssEBihTHUBWZ%2FtRXmA9tZ6Gl7k2BFG%2F4SsfP41Agz1cQ5t0TpWkuv%2F5rUgfrViFFtlDW9PHhHFga64HMbOp0TQrIjPadl51twfDTy5UgAqipkkxwRjzENYcwceUjuxPWrf%2FRvtye7bnwqhIMIrNltgGOqUBfziGbqexJMz75W06XIiy1Z1BzlEX5cdOj5CFzekIvuE5nk10LlO5rKlavNKwGUIyH0u9tU%2Fhtd4XJM%2FdDQwz4aFUigQhvJDMJRvHOroS00%2F%2FBEpXCRPxJ44Z0MWAF6cGBpzrRuh0IkmesqVieYtTvKyOZFkQbROZI1f3P5JQkbFScOYW4ztyTCJUrhrAUwEp%2FnvBy3w9LwG%2Fjc23RyFBdGXpiq9V&X-Amz-Signature=c8dc098686d87bb32cb238e19054a31ede240ecaedaea5774ff07477f139fef1&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

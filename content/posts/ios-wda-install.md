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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4666VE3C4J7%2F20261007%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261007T031326Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEDkaCXVzLXdlc3QtMiJHMEUCIQCxrL7R%2Byz6B1b4M%2FdFUOgsomWa4cRRGWFdfEiV8E2VYAIgN38svOA4uij5xezWWuwvNP6Ugq5ZUbbXZqRGVASOwxYq%2FwMIAhAAGgw2Mzc0MjMxODM4MDUiDBQ1uIHrilBKVEBdNCrcA%2F%2FvoQQpMtw%2BzpYMBgBdKywxxw2nbhc7I%2Fd43P4D%2Fggf%2FFAsX00LYpsy44Q2OP80apzhK7WW%2BVIQsGBO30xozpyHqinIa0d26Oy4Mh%2Fd%2BTBM8cI8Wwg%2BmjtouxmRWF1wsBxKIdHUeNI%2BqFwA9T7xPm%2FAvzdXwcYF4GDClefGMl%2Fpr4IILfBijRUbrTOcUB7Mfld0SfZ0T80cZzir75k8XLB%2B3%2BwWgDhnLpt%2B8Q%2Fw6Z1%2BFVeFql7hHuLkLZz5GOrpzCKYUjHoY1od47q40NEpi9A1%2BGyOXQcHk0ME4EbZgNAHSRGiaL9ggBgxvZR7%2FAEqij698iJGFFyrvIBgVYxG1oRT%2FCpogw%2F1g%2BXR9RQvawqq0OngPioK5cv4vFQNtMoy73BAp1L99JAlOZUhsIhTX%2F%2F1syQ1ehPS%2FH%2B%2FyhBIHaMTggRkUMCll2ZiZz09lr1KRPxHd4vViNSW7UM4rNRCubHwfmF5AN3TSlXtGLWQZgYp5HaFyciAAFSUv0Y1YMvNMFCfL5608nERu5%2FYyh35nvJammcqE9Egw1bjTUSGg0Dtq2KyJaSLun4Wg08o%2BgLlTGgP62Mozu8Qh%2Bs1fBVXWYATIKgImFJmO6qPcaedrO2i737cFn5ax9%2BmkgUeMIWvltYGOqUBN7t8%2BikyMzN5Y6xgxjUllpt%2F%2Fa8Fir6BmDQjmrl%2B01oF36fswWY2aTtnIx6uvGX59q6EFXr%2FXcE9CIfM3SWuof%2FsjRuvkmjBWvLeGVMIw0VHrleQKVjPrznNukEGO5k9ngpzJVy6WiyxCcyA8SgUZA6maIPvNeqUMc6s8upnNSqYlgN7g0cB%2BIGoZjRj3n909tqyZDbEvDrbMSBx%2BrttE9g5uyVB&X-Amz-Signature=69050a24d6e1ade56eefcbeb42e06687115fbfde0f3f8c7f4b50722c43844e30&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4666VE3C4J7%2F20261007%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261007T031326Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEDkaCXVzLXdlc3QtMiJHMEUCIQCxrL7R%2Byz6B1b4M%2FdFUOgsomWa4cRRGWFdfEiV8E2VYAIgN38svOA4uij5xezWWuwvNP6Ugq5ZUbbXZqRGVASOwxYq%2FwMIAhAAGgw2Mzc0MjMxODM4MDUiDBQ1uIHrilBKVEBdNCrcA%2F%2FvoQQpMtw%2BzpYMBgBdKywxxw2nbhc7I%2Fd43P4D%2Fggf%2FFAsX00LYpsy44Q2OP80apzhK7WW%2BVIQsGBO30xozpyHqinIa0d26Oy4Mh%2Fd%2BTBM8cI8Wwg%2BmjtouxmRWF1wsBxKIdHUeNI%2BqFwA9T7xPm%2FAvzdXwcYF4GDClefGMl%2Fpr4IILfBijRUbrTOcUB7Mfld0SfZ0T80cZzir75k8XLB%2B3%2BwWgDhnLpt%2B8Q%2Fw6Z1%2BFVeFql7hHuLkLZz5GOrpzCKYUjHoY1od47q40NEpi9A1%2BGyOXQcHk0ME4EbZgNAHSRGiaL9ggBgxvZR7%2FAEqij698iJGFFyrvIBgVYxG1oRT%2FCpogw%2F1g%2BXR9RQvawqq0OngPioK5cv4vFQNtMoy73BAp1L99JAlOZUhsIhTX%2F%2F1syQ1ehPS%2FH%2B%2FyhBIHaMTggRkUMCll2ZiZz09lr1KRPxHd4vViNSW7UM4rNRCubHwfmF5AN3TSlXtGLWQZgYp5HaFyciAAFSUv0Y1YMvNMFCfL5608nERu5%2FYyh35nvJammcqE9Egw1bjTUSGg0Dtq2KyJaSLun4Wg08o%2BgLlTGgP62Mozu8Qh%2Bs1fBVXWYATIKgImFJmO6qPcaedrO2i737cFn5ax9%2BmkgUeMIWvltYGOqUBN7t8%2BikyMzN5Y6xgxjUllpt%2F%2Fa8Fir6BmDQjmrl%2B01oF36fswWY2aTtnIx6uvGX59q6EFXr%2FXcE9CIfM3SWuof%2FsjRuvkmjBWvLeGVMIw0VHrleQKVjPrznNukEGO5k9ngpzJVy6WiyxCcyA8SgUZA6maIPvNeqUMc6s8upnNSqYlgN7g0cB%2BIGoZjRj3n909tqyZDbEvDrbMSBx%2BrttE9g5uyVB&X-Amz-Signature=a9177233d9fd98310f8f05210991608e0f66f0a0678f722ce6cbe827f12fe415&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

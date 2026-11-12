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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663T5CTKWT%2F20261112%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261112T141212Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEKX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIFHNxs2wmrVjeoHbK4n1aB5w%2BV7ukn38gYF67yFrzzdzAiEA6uf7dUbUKm1pYgwYPQEsw8Z6itHR3ZQOw8l1BKLCcqwq%2FwMIbhAAGgw2Mzc0MjMxODM4MDUiDAFNrhdNZiF59AIGqCrcA1%2FqLGDqaOvSslNIwA7J6%2BMvHvj5i58EEAF4S4%2Fb1%2F24Z2TenEk6c%2F4qZowKQ4ZDt1WXpyMNg5bdDEi2Kyi01ShbMnL%2BxQvGfwd6tDOrroZW9CG8eEE6nW8X77D2l6keSNIqnBOQWMrckBqY5dK3AMFTltRLMAjQzaQDY%2FTVWVQ8Egq6I3UrFDzKvG6Kk3QXuoVJsH2iMCVOgZnlzxN%2B%2BbEu8czJHrttPlWnXmi2zPtzPRxlazwnYC8Lxsm%2BnJCSB1jXXZ02KVbz3JrfaxzHANeoZ1K3Uoih6Yw9vjlwPTwg06MOb2a50APzHBvFgOYqEaEo1OvWoeKZTyXiCdhuQbBu34J8MbNZOtKGFZIqACgW5JUbAvDtW0dT8PzCKsc%2FtKY25LxNcWUIHkneFYNKQsqkLFLZNnmfi0d0qkmaW19AchLqeMBx%2FN%2BfuzTUb9C%2BdJAkLYwvYCsg8HCHG%2FQAwdc9burw4Ra89wLLn6DfMXA24UpVs07DNTGAPerlY%2F%2BY0jOVMFV%2BSHYmc5BjlXCFYr7UGeuTiIsBnm6072Kn5DQ%2By3uLt9DYuHucxubiC3HQVhdnuxuTgatp9uyjBqnbHld7nEuwU%2BPvcGgLWokYwlSCO%2BZK0pXvbPWlLNHiMPDz1tcGOqUBFwJ2SVAV%2FgQTsjESgvkgNVUIVObRZ%2FDu%2BIq2wEnL5TfgK6iF1IJgS9VItIPBsAnWpE9Uer7TAypgeBpvv8XYSUM4r1jMgErgcNyGUc%2BAulb90BWwFZ5OMhKLt0aoJBHJqtmwLisxJDmPCSVKk9%2FkFTbJkygQoND4ms0sRXPJMhEaBQiH3Wva1B8oFvKtV5CSp0XqZ1QAC7ST14MGJLhzh%2FIOi%2FeT&X-Amz-Signature=5a760cbf73b6cde52e4e0bd9b050be9e4c275e8e858c8fcdfdec0737ff75d89d&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663T5CTKWT%2F20261112%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261112T141212Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEKX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIFHNxs2wmrVjeoHbK4n1aB5w%2BV7ukn38gYF67yFrzzdzAiEA6uf7dUbUKm1pYgwYPQEsw8Z6itHR3ZQOw8l1BKLCcqwq%2FwMIbhAAGgw2Mzc0MjMxODM4MDUiDAFNrhdNZiF59AIGqCrcA1%2FqLGDqaOvSslNIwA7J6%2BMvHvj5i58EEAF4S4%2Fb1%2F24Z2TenEk6c%2F4qZowKQ4ZDt1WXpyMNg5bdDEi2Kyi01ShbMnL%2BxQvGfwd6tDOrroZW9CG8eEE6nW8X77D2l6keSNIqnBOQWMrckBqY5dK3AMFTltRLMAjQzaQDY%2FTVWVQ8Egq6I3UrFDzKvG6Kk3QXuoVJsH2iMCVOgZnlzxN%2B%2BbEu8czJHrttPlWnXmi2zPtzPRxlazwnYC8Lxsm%2BnJCSB1jXXZ02KVbz3JrfaxzHANeoZ1K3Uoih6Yw9vjlwPTwg06MOb2a50APzHBvFgOYqEaEo1OvWoeKZTyXiCdhuQbBu34J8MbNZOtKGFZIqACgW5JUbAvDtW0dT8PzCKsc%2FtKY25LxNcWUIHkneFYNKQsqkLFLZNnmfi0d0qkmaW19AchLqeMBx%2FN%2BfuzTUb9C%2BdJAkLYwvYCsg8HCHG%2FQAwdc9burw4Ra89wLLn6DfMXA24UpVs07DNTGAPerlY%2F%2BY0jOVMFV%2BSHYmc5BjlXCFYr7UGeuTiIsBnm6072Kn5DQ%2By3uLt9DYuHucxubiC3HQVhdnuxuTgatp9uyjBqnbHld7nEuwU%2BPvcGgLWokYwlSCO%2BZK0pXvbPWlLNHiMPDz1tcGOqUBFwJ2SVAV%2FgQTsjESgvkgNVUIVObRZ%2FDu%2BIq2wEnL5TfgK6iF1IJgS9VItIPBsAnWpE9Uer7TAypgeBpvv8XYSUM4r1jMgErgcNyGUc%2BAulb90BWwFZ5OMhKLt0aoJBHJqtmwLisxJDmPCSVKk9%2FkFTbJkygQoND4ms0sRXPJMhEaBQiH3Wva1B8oFvKtV5CSp0XqZ1QAC7ST14MGJLhzh%2FIOi%2FeT&X-Amz-Signature=6759d83756d9f03227c40d2ef038af315c41c7d6d6bf0f831fbcb995bb6e0439&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

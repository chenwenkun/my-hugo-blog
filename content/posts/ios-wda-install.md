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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466U7Y6WY74%2F20261011%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261011T114628Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEKP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQDsvWCUmIGzoMFNAAIuYLYVVnSSVUhBq%2Blo3z1Xb8i0tQIhAPaWOzeLVqUMb5UEbFaM6v9%2FPJuhIM0uH2HRB%2Bg4aAaZKv8DCGwQABoMNjM3NDIzMTgzODA1Igz4xG2f9ov9YVByakEq3APTOBwDgjSWyVZ9p47KfJlAqzgio9cF1Cg3SJ5p6xL387iqWAYjYBMT5%2BW6sCzze89lJdFwxMGOsFPsBxiwYTxWjrBKYHiybliVG4Ht7Y9%2BxXkIANrAFel9cFqEpqaNqA2kym%2BOhXYdVgApwidRvM6q4X5RlA2%2BQI8lIqL4d%2FPPqdqDHzHRN7oLlSzil3anw9gE0P%2BmLHKUhus7r3YJu61UTAHEGxdBtt65VOZ0TONkhrP2a%2BCHKTkOqIDbJg%2FAAw2oYT9Wp8%2F7p0QClLX3A0Z0RpfS%2BtjLOn1dwBLYuPMTRDDFwBck1mBdwuBMFQ%2FG2w%2FA5WwH9kIAhSFplz0ySpkK85HAR7X63aYV8%2B59aIId39lUo5Ofw7nCG05UC8%2FQKjBZrQR6vNsmCkcA%2FldjO8pnSnioltz0rPxy8PupVTuXN8vsjx74mSrNapIq8G7f6TbruDFvuYt1JnBjAh0TgO5hZ2rpyaNLCVxJrZb%2Fb6WPh3SqnSjZ2XD82JDrz6gnb9jREcDmBKjspQqDDb6aXkttMBoco2VqIcTxj5230C%2BdL8bCv%2F%2FwAabZT8PnaBIyQnu2ZAXGpuNy1mofKYtq6LVz7677E4sN8VhFPEYo1T7o9RyUYBzW2BYTNsNr2TCf1a3WBjqkAdT67v6cUDW1P1kOYhugjUBQ9NAV7qthGPYDkKAHWFFmIYfkP97wO8VcNcHSyGHRw%2Bsv3r6i%2B2ahy%2FyLKFuiaSyWN%2BcfB6SwdcBqho6q3jH7xIR9dpP4ahmvLLTXsBNc%2BaSZ3NPVSKMF6FrymB0Zo8sYFNTrNLdR0TvVDQQ3uCtsz6EXEcB7dPB5Xk96nAjVphkrLlbPzvv7UHb17ZovEwrmgQ5U&X-Amz-Signature=bbd846e8c1cc50e6dd93f1d3a69c9e09c3f30b5985c45c0cce8a080d93e58b05&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466U7Y6WY74%2F20261011%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261011T114628Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEKP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQDsvWCUmIGzoMFNAAIuYLYVVnSSVUhBq%2Blo3z1Xb8i0tQIhAPaWOzeLVqUMb5UEbFaM6v9%2FPJuhIM0uH2HRB%2Bg4aAaZKv8DCGwQABoMNjM3NDIzMTgzODA1Igz4xG2f9ov9YVByakEq3APTOBwDgjSWyVZ9p47KfJlAqzgio9cF1Cg3SJ5p6xL387iqWAYjYBMT5%2BW6sCzze89lJdFwxMGOsFPsBxiwYTxWjrBKYHiybliVG4Ht7Y9%2BxXkIANrAFel9cFqEpqaNqA2kym%2BOhXYdVgApwidRvM6q4X5RlA2%2BQI8lIqL4d%2FPPqdqDHzHRN7oLlSzil3anw9gE0P%2BmLHKUhus7r3YJu61UTAHEGxdBtt65VOZ0TONkhrP2a%2BCHKTkOqIDbJg%2FAAw2oYT9Wp8%2F7p0QClLX3A0Z0RpfS%2BtjLOn1dwBLYuPMTRDDFwBck1mBdwuBMFQ%2FG2w%2FA5WwH9kIAhSFplz0ySpkK85HAR7X63aYV8%2B59aIId39lUo5Ofw7nCG05UC8%2FQKjBZrQR6vNsmCkcA%2FldjO8pnSnioltz0rPxy8PupVTuXN8vsjx74mSrNapIq8G7f6TbruDFvuYt1JnBjAh0TgO5hZ2rpyaNLCVxJrZb%2Fb6WPh3SqnSjZ2XD82JDrz6gnb9jREcDmBKjspQqDDb6aXkttMBoco2VqIcTxj5230C%2BdL8bCv%2F%2FwAabZT8PnaBIyQnu2ZAXGpuNy1mofKYtq6LVz7677E4sN8VhFPEYo1T7o9RyUYBzW2BYTNsNr2TCf1a3WBjqkAdT67v6cUDW1P1kOYhugjUBQ9NAV7qthGPYDkKAHWFFmIYfkP97wO8VcNcHSyGHRw%2Bsv3r6i%2B2ahy%2FyLKFuiaSyWN%2BcfB6SwdcBqho6q3jH7xIR9dpP4ahmvLLTXsBNc%2BaSZ3NPVSKMF6FrymB0Zo8sYFNTrNLdR0TvVDQQ3uCtsz6EXEcB7dPB5Xk96nAjVphkrLlbPzvv7UHb17ZovEwrmgQ5U&X-Amz-Signature=0d1f307cec507ea53cc917188257474439299e09a81d2a2f7ed1645734d3be37&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

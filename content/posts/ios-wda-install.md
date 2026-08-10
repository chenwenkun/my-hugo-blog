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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466XPVXVGJQ%2F20260810%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260810T070823Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEM7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQD80p%2BJrSBjCPgr7i7hxjJI4FHgs9hpCxAxt0%2Bvxl337gIgcgyzLZsRb5%2BykcJhJCUAXYwFoU30aQ6af8aiaQ5SjAwqiAQIl%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDBG26n%2BtxmIEja9dYyrcA0LaFEadE4u5L5WPrX6Pegh1m0lMOXXPenUidBf8gAl5NaCXRS9QN3cYjOkosMbBqN66MNtGQGhG%2B%2Bo%2FCDG7GyddtuIMNLLm1JyniyzQpsxWoX7BaPH%2Fi13BNqrxlhhEKPQChFdKfgU1FbaWzFBjBv9kmNviWOvaqwSN%2FBEG4jWcbqI9sUS6Ksk7f8pp781EApv8gn1llFM41RKwOmHZXkUEmIIrOnEXAOk3T%2BpRkDnxujJ4FRxn%2B9kmZ%2FHeREVytQPcaTfF9DL7VDn%2BQ0Xw7tvkyZtW5GiGJXhkpHex1VjRcOmycWGzzsNUVsIGi%2BEaCDzZ3C2wGTuQtl1uTo7KfK%2Bc7tWQDrCcFJdDuXIxI3iFHH%2FgomI2IAmadrQ0ARrbjf4ngE0wK37m%2B%2FXaTozfCY5jOGUvSQXJBhPtmTfnR%2FxO3EKBgpRMMO5vbk4cV%2BtwilbyBzoKaQFo9YvI28GZQwh7NXE4LE6aouRGEIiRVL4TUC%2Fn498jerJqC%2FgL9eZqiUFj6oLG6P8KMHzX9Y9zneh4p1Bz1eOwgaVk3fiJ9BNDfn%2FKjc%2B2XNbCbmgPhU7%2BnEc%2FIt%2BTL%2BeuwXLNdF03K3PGWLlGO52Z8bp640ceye1icnJJTJWBjrHdKsoxMNXL5dMGOqUByjUDGBA6J3%2BkS8PpYKH5TaOepUpjCmjOqjkXRRJtSeF5FRC%2F5Y%2FmJVUQAKb8szfBjmcr53zYNaaodN0zgXzrgm4w0NOjcvffeGYnc%2BCBzzdpy7r8xnHLrSWZtE8qCsKLCQR5Q2Itp4pmM%2FsMJv9ayRmLzpkNJBq2d2McWLJi4Ci5%2FHTMRSBAktXv5IZ0nEX4h6GfRWtvnEAZaokJIf%2FGkptNnYfZ&X-Amz-Signature=4324690ca77632824a4b661770bc315dc2d80e995ffc5123b96a6e85cecde6a1&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466XPVXVGJQ%2F20260810%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260810T070823Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEM7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQD80p%2BJrSBjCPgr7i7hxjJI4FHgs9hpCxAxt0%2Bvxl337gIgcgyzLZsRb5%2BykcJhJCUAXYwFoU30aQ6af8aiaQ5SjAwqiAQIl%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDBG26n%2BtxmIEja9dYyrcA0LaFEadE4u5L5WPrX6Pegh1m0lMOXXPenUidBf8gAl5NaCXRS9QN3cYjOkosMbBqN66MNtGQGhG%2B%2Bo%2FCDG7GyddtuIMNLLm1JyniyzQpsxWoX7BaPH%2Fi13BNqrxlhhEKPQChFdKfgU1FbaWzFBjBv9kmNviWOvaqwSN%2FBEG4jWcbqI9sUS6Ksk7f8pp781EApv8gn1llFM41RKwOmHZXkUEmIIrOnEXAOk3T%2BpRkDnxujJ4FRxn%2B9kmZ%2FHeREVytQPcaTfF9DL7VDn%2BQ0Xw7tvkyZtW5GiGJXhkpHex1VjRcOmycWGzzsNUVsIGi%2BEaCDzZ3C2wGTuQtl1uTo7KfK%2Bc7tWQDrCcFJdDuXIxI3iFHH%2FgomI2IAmadrQ0ARrbjf4ngE0wK37m%2B%2FXaTozfCY5jOGUvSQXJBhPtmTfnR%2FxO3EKBgpRMMO5vbk4cV%2BtwilbyBzoKaQFo9YvI28GZQwh7NXE4LE6aouRGEIiRVL4TUC%2Fn498jerJqC%2FgL9eZqiUFj6oLG6P8KMHzX9Y9zneh4p1Bz1eOwgaVk3fiJ9BNDfn%2FKjc%2B2XNbCbmgPhU7%2BnEc%2FIt%2BTL%2BeuwXLNdF03K3PGWLlGO52Z8bp640ceye1icnJJTJWBjrHdKsoxMNXL5dMGOqUByjUDGBA6J3%2BkS8PpYKH5TaOepUpjCmjOqjkXRRJtSeF5FRC%2F5Y%2FmJVUQAKb8szfBjmcr53zYNaaodN0zgXzrgm4w0NOjcvffeGYnc%2BCBzzdpy7r8xnHLrSWZtE8qCsKLCQR5Q2Itp4pmM%2FsMJv9ayRmLzpkNJBq2d2McWLJi4Ci5%2FHTMRSBAktXv5IZ0nEX4h6GfRWtvnEAZaokJIf%2FGkptNnYfZ&X-Amz-Signature=37ee52c34e92f911a7c9e7b637d7c5b661c57d38e8f2c177ce1a1944990f3c6c&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

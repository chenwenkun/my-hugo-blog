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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4662FZPGOLQ%2F20260829%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260829T011708Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJH%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCICBkdRNVwgPl7wA6lBt5eAuJ7d6b4POgCN3EAwYZLokLAiA62WX%2FXkAzYo5IgGxJnKWIPkBpDfYNwzadRJHqcFPnzir%2FAwhaEAAaDDYzNzQyMzE4MzgwNSIMO6VKoDMeftHrFLs9KtwD4djoMEf7yFlY3oBbyKvOeo1Qg8qIiShky%2FOyEeXdZ25P%2FtxIP%2BbvKMlyMVW1Eg8YIHOWNveHYfPNhS4tV1vQNnJlKuuBZIPmwaJZ8ISHjnH9eazot11KJ8II0ZWX8hAlwDl3ON0KyCGHX2%2F3%2Byzto9moka%2FHsTCEH3Xb8ti%2BU3DwJUJG2LUBiD3jshJ8aRl5nycpQ0ldWR3dDMxy4vLYB%2FDdvIyGtkmkLW%2BPKfowv1ppZDlDNBbqzuBDjbXrXPppwTjvQhH23pLl98NJ%2FyEgpvokFO%2FdVUKXXjo%2Fe2%2BRHxo%2FHPkB6YQjUTNJaW5wLga85njKViSRH0KdaBbCkfl1i9WBGWuQCbwbLgJykqrK6GAI3wNFJOmGJPgsPNa1g2IkScoOX%2BwCF28rBrPF2lstx8fAFCXhzWrM8BszbC%2BgQ4hG6zTQNnkGMwH6j81Gbz8hoDt%2F1DVqWh2h%2BRgkq8dfyREjm9H9LQrgQ8oYVx51mgnROAckBqZNBmXQ6lq9wy4Jg%2BlT9tiAk%2BiT%2FbXzT91Rm%2BeymxCuBRYzVx8NjDXpzYwMGfxZ4fwEDEomEP0m9RNcdx2Jrnn5Nmf0dOAX3wlfnuXa6D9G%2Frf9PReWGDgnVpi%2FRFUpGGGoEM7RiicwttrI1AY6pgFa2a%2FSxuqyx4CRAFOsijcmXgUx%2BaDqkB%2F8WPCg2X6qFGIXuzyaHWgrUwkUw967hAfLXXc0%2BY%2Fb1E1zCQQ5WaZgLj5rBGmaQFfjl6aildGgGWJOvCm3THNWGugqJW2KNRScdIyedlbob8%2BthI4lmONiLzh4trDT8C1TG52CjBOqLpJkUK9EdsO8eLUHII%2BcN4m3yyDjChxglRvMi1xh7lh9tEEXKiba&X-Amz-Signature=a2a6d63011d4b35ff207f0124c98d8498f87c5ddf5f92a60ff46aa5fed8eca02&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4662FZPGOLQ%2F20260829%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260829T011708Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJH%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCICBkdRNVwgPl7wA6lBt5eAuJ7d6b4POgCN3EAwYZLokLAiA62WX%2FXkAzYo5IgGxJnKWIPkBpDfYNwzadRJHqcFPnzir%2FAwhaEAAaDDYzNzQyMzE4MzgwNSIMO6VKoDMeftHrFLs9KtwD4djoMEf7yFlY3oBbyKvOeo1Qg8qIiShky%2FOyEeXdZ25P%2FtxIP%2BbvKMlyMVW1Eg8YIHOWNveHYfPNhS4tV1vQNnJlKuuBZIPmwaJZ8ISHjnH9eazot11KJ8II0ZWX8hAlwDl3ON0KyCGHX2%2F3%2Byzto9moka%2FHsTCEH3Xb8ti%2BU3DwJUJG2LUBiD3jshJ8aRl5nycpQ0ldWR3dDMxy4vLYB%2FDdvIyGtkmkLW%2BPKfowv1ppZDlDNBbqzuBDjbXrXPppwTjvQhH23pLl98NJ%2FyEgpvokFO%2FdVUKXXjo%2Fe2%2BRHxo%2FHPkB6YQjUTNJaW5wLga85njKViSRH0KdaBbCkfl1i9WBGWuQCbwbLgJykqrK6GAI3wNFJOmGJPgsPNa1g2IkScoOX%2BwCF28rBrPF2lstx8fAFCXhzWrM8BszbC%2BgQ4hG6zTQNnkGMwH6j81Gbz8hoDt%2F1DVqWh2h%2BRgkq8dfyREjm9H9LQrgQ8oYVx51mgnROAckBqZNBmXQ6lq9wy4Jg%2BlT9tiAk%2BiT%2FbXzT91Rm%2BeymxCuBRYzVx8NjDXpzYwMGfxZ4fwEDEomEP0m9RNcdx2Jrnn5Nmf0dOAX3wlfnuXa6D9G%2Frf9PReWGDgnVpi%2FRFUpGGGoEM7RiicwttrI1AY6pgFa2a%2FSxuqyx4CRAFOsijcmXgUx%2BaDqkB%2F8WPCg2X6qFGIXuzyaHWgrUwkUw967hAfLXXc0%2BY%2Fb1E1zCQQ5WaZgLj5rBGmaQFfjl6aildGgGWJOvCm3THNWGugqJW2KNRScdIyedlbob8%2BthI4lmONiLzh4trDT8C1TG52CjBOqLpJkUK9EdsO8eLUHII%2BcN4m3yyDjChxglRvMi1xh7lh9tEEXKiba&X-Amz-Signature=bcf7326837cce66ba59bc94fb430c7dd868d1735ced695e3b073e72fd58b3b89&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

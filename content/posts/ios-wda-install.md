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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663O3PAE25%2F20261002%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261002T165959Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjENH%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQDxcnF9KdhMnNs07OqvYdfaSFIHKKKnmVJc4yc6pKvKJwIhALZQ%2BbGtcYwqOkiGFd6P8vbWoe6fZ4Ksebs%2F4RjHN00zKogECJn%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgwV2w3o6%2BLLg%2Bbw4qoq3APoKm4xfdtbWqONhGDtl5eW6h2lzW26%2Bgq5ITBfy01v20TifR%2Bd61zoT0FROzCQxFclCVNsC%2Flhy4Rn3RzI4LP3pvpf5yFJclApk7XE%2F837UKh4xYtB0T50MyuTjymN7VqED6w7aGCASpARhHBRWtgpW1Cyn3yn7hBKt2xgtPmWCPndWFqjnb10xoy7j27DQT0jYKD2CRlMLhjzBkkhmJM%2BKqA%2FGyUuWLWVoRyf9efwYihLgr8XAWF6o4bCW2aqoXRWqO8ANqGoWhd6%2F1J69dX2c9aR2vZIxcF65er29e2rwtUSHAcxYR%2Ffu9Y%2FbFh3VXfibO4FYWJWrjOk%2BGjxxZA45M%2BOo6yzj6vvHifz3bvPaNascwOIX%2BZ4Sg%2BK97vTPrZ1S6ri5390%2FtmcvcCXLyQ01mAAOjvjv768SaNWlcnMjn7q4F%2FI99Q7Py%2BZAqUtAMwQTlEYr9FkPM3h8CaQHnJsEdrC9G8FlF%2FUxD05rhKna3YXzgdnDylNTl8W8hlNPXLM63bguWIEtmvPPaEXgta6WPhLaeGEvrjsgGaQqJTOXcDBxfFFoaK3L6HLLucxpAyVjQgEbZTwRd%2BY7dUt3xO1UlAXQndfqiBNxBc1jUNjU%2FL2Ybk9GdnTZsNRqzCgtf%2FVBjqkAREDntD1NF9tmB22BayTY7wiCmR7ECYnZrPQXlhuIsK031wIjj3zuQBMV%2FsmgKqayk91K5qDDfc6LU%2FBgffaV1J4CkYv2kzulHjD19xVDLkryxrdaDHvnrPO0g6vV3iMRaMPPUS0q%2FzfmRe25i9WKaLfDAUS12Y%2FxWa0axCxj1FiPga5IA8UzI9%2B%2BmQLgjN7h0%2FNFP2MpQhh6z0ufXrI8WU0KoSs&X-Amz-Signature=cef950ca381d82708cccf974db929dfab03368a5052532c2b450a35c08bc004d&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663O3PAE25%2F20261002%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261002T165959Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjENH%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQDxcnF9KdhMnNs07OqvYdfaSFIHKKKnmVJc4yc6pKvKJwIhALZQ%2BbGtcYwqOkiGFd6P8vbWoe6fZ4Ksebs%2F4RjHN00zKogECJn%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgwV2w3o6%2BLLg%2Bbw4qoq3APoKm4xfdtbWqONhGDtl5eW6h2lzW26%2Bgq5ITBfy01v20TifR%2Bd61zoT0FROzCQxFclCVNsC%2Flhy4Rn3RzI4LP3pvpf5yFJclApk7XE%2F837UKh4xYtB0T50MyuTjymN7VqED6w7aGCASpARhHBRWtgpW1Cyn3yn7hBKt2xgtPmWCPndWFqjnb10xoy7j27DQT0jYKD2CRlMLhjzBkkhmJM%2BKqA%2FGyUuWLWVoRyf9efwYihLgr8XAWF6o4bCW2aqoXRWqO8ANqGoWhd6%2F1J69dX2c9aR2vZIxcF65er29e2rwtUSHAcxYR%2Ffu9Y%2FbFh3VXfibO4FYWJWrjOk%2BGjxxZA45M%2BOo6yzj6vvHifz3bvPaNascwOIX%2BZ4Sg%2BK97vTPrZ1S6ri5390%2FtmcvcCXLyQ01mAAOjvjv768SaNWlcnMjn7q4F%2FI99Q7Py%2BZAqUtAMwQTlEYr9FkPM3h8CaQHnJsEdrC9G8FlF%2FUxD05rhKna3YXzgdnDylNTl8W8hlNPXLM63bguWIEtmvPPaEXgta6WPhLaeGEvrjsgGaQqJTOXcDBxfFFoaK3L6HLLucxpAyVjQgEbZTwRd%2BY7dUt3xO1UlAXQndfqiBNxBc1jUNjU%2FL2Ybk9GdnTZsNRqzCgtf%2FVBjqkAREDntD1NF9tmB22BayTY7wiCmR7ECYnZrPQXlhuIsK031wIjj3zuQBMV%2FsmgKqayk91K5qDDfc6LU%2FBgffaV1J4CkYv2kzulHjD19xVDLkryxrdaDHvnrPO0g6vV3iMRaMPPUS0q%2FzfmRe25i9WKaLfDAUS12Y%2FxWa0axCxj1FiPga5IA8UzI9%2B%2BmQLgjN7h0%2FNFP2MpQhh6z0ufXrI8WU0KoSs&X-Amz-Signature=ec3c0aafdfee6f28376bcec027bec3bb22affb91cc9f0c76083b3671a3e33c32&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

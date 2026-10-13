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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466TS23ZZLJ%2F20261013%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261013T043507Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEMz%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIF2Yx8Q%2B1lwYutM9NmHfzFLy%2F1Z8yd9X8wxAomJxgLD%2FAiAQ8zHiYMLtBTiREZUchFXhRr1K53Zv9SDzkbpRCmShwCqIBAiV%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMZ4KFf%2BtlLVa%2BKMRpKtwD%2F%2FAKJ3lY6OcsfvRu5oNlmuGrSDJ0hHufN5OgY0gSmf%2FrGzCs92rDgJpSQYZNaSltLZ9KVhVRTjUA3CsqVFypXyo7eZTnxIS1haz94TXPLEW55UczIaacdSIiL%2FdrDHPCfVyejaVuGa3Gc2TLrYL5r3NN%2FonPVI2t6BVfG98FWGt07cY8sPr%2FdiepNNvpj28G3zWS%2FKhP89Kl2eucVBOfUey6QBgR9fQIP15vgt25YkadWi7EUNHRSPQux69oh6f4TQpLWzeHmKq8qAJSK%2B8Kqm1lIXCCf1SMLrnNk3iT25LHZ6YAPlNEl1IamKi3fqUSNn5aTo4wKIKSLZTx4rHqLwA31H9aGcU3qTkSNYR8u4bmjnWyxi8dcKPvW54yMV4IFsxEwvtmjoWyw23SbNyVUHd2rkaFHow6Bl%2BdhWm2BwQYPIJS7WonLJLfS6UBiZf%2FG8%2B6RqdD9eeccu%2FXk8vfta7ajzM84CZmE8%2Bn%2FzQRj72zSMoPEgy96z8qlykIWGrVGsekWwLtVCe1cBzPDHEGPm92fN7GBmzTYosMj7GzZIOe06fg6rW%2BouoOviv1iU%2BT5x%2FcahD%2BBB%2BKn7sjGXpsdPd1xCIuIGlQKtN4lzRs4YJBoialtEnnWbfnYREw%2B%2BC21gY6pgFG1Ux59St6LzfG0w5jJDoQf%2FM1c%2FvuJMLHz4JCLo8Hlu1KD%2B8KZIX8yQl6cigxwxEHnCMV4u1PkbjdkDpXw1%2Ba5FdeLutzhnahKOSIxCt4KntYUH6TJQNVa1VuBlDRxF5%2B%2FaTWX%2BPRVWnqEeCByU6gktkDjnTNhMlnQ0UejPxzL64Js0oOOKBbe6ErDFu0lLXpXXvuW9S5WlcqUYzPVCC%2BCOaiWTxG&X-Amz-Signature=3848387a061e72334b1fe7c68ca9919617025f91cc7f397c36574c09a331b187&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466TS23ZZLJ%2F20261013%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261013T043507Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEMz%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIF2Yx8Q%2B1lwYutM9NmHfzFLy%2F1Z8yd9X8wxAomJxgLD%2FAiAQ8zHiYMLtBTiREZUchFXhRr1K53Zv9SDzkbpRCmShwCqIBAiV%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMZ4KFf%2BtlLVa%2BKMRpKtwD%2F%2FAKJ3lY6OcsfvRu5oNlmuGrSDJ0hHufN5OgY0gSmf%2FrGzCs92rDgJpSQYZNaSltLZ9KVhVRTjUA3CsqVFypXyo7eZTnxIS1haz94TXPLEW55UczIaacdSIiL%2FdrDHPCfVyejaVuGa3Gc2TLrYL5r3NN%2FonPVI2t6BVfG98FWGt07cY8sPr%2FdiepNNvpj28G3zWS%2FKhP89Kl2eucVBOfUey6QBgR9fQIP15vgt25YkadWi7EUNHRSPQux69oh6f4TQpLWzeHmKq8qAJSK%2B8Kqm1lIXCCf1SMLrnNk3iT25LHZ6YAPlNEl1IamKi3fqUSNn5aTo4wKIKSLZTx4rHqLwA31H9aGcU3qTkSNYR8u4bmjnWyxi8dcKPvW54yMV4IFsxEwvtmjoWyw23SbNyVUHd2rkaFHow6Bl%2BdhWm2BwQYPIJS7WonLJLfS6UBiZf%2FG8%2B6RqdD9eeccu%2FXk8vfta7ajzM84CZmE8%2Bn%2FzQRj72zSMoPEgy96z8qlykIWGrVGsekWwLtVCe1cBzPDHEGPm92fN7GBmzTYosMj7GzZIOe06fg6rW%2BouoOviv1iU%2BT5x%2FcahD%2BBB%2BKn7sjGXpsdPd1xCIuIGlQKtN4lzRs4YJBoialtEnnWbfnYREw%2B%2BC21gY6pgFG1Ux59St6LzfG0w5jJDoQf%2FM1c%2FvuJMLHz4JCLo8Hlu1KD%2B8KZIX8yQl6cigxwxEHnCMV4u1PkbjdkDpXw1%2Ba5FdeLutzhnahKOSIxCt4KntYUH6TJQNVa1VuBlDRxF5%2B%2FaTWX%2BPRVWnqEeCByU6gktkDjnTNhMlnQ0UejPxzL64Js0oOOKBbe6ErDFu0lLXpXXvuW9S5WlcqUYzPVCC%2BCOaiWTxG&X-Amz-Signature=cd2d2325a8dbc87a9e8a65718d847a958bca2e3aec6ddc8cf9c1fff0841e2cb3&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

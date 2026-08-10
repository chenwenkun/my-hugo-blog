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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466YVCMDGUX%2F20260810%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260810T184051Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjENn%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIEK4tNu8N4xd8abZ6wY0TweL6wm4qSeENFT3RojyHcTqAiBygZfHXMe05ztI9LB3sWsS1TouSYFD8nmd6%2B04RtcWySqIBAih%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMWN53%2FToLgqQqirPOKtwDQoCrvWWXfiiFRLLz4DBEk1XEbxHjNBk9tAey1rS%2BRJNkmVKVO0ZbkamEThiangjQjmVQOznFkkTlL5V9FD%2BrjxORZ1FLNfqDKG1cN4Z4BVzZTBONdYyQYnMB6P5bJuvGWIEabsZMgnAV4xoO%2Fn5bhpIZ5UyBGReItq6AKeAue6CAwGKXATAmQ4UC%2F6eX4pimjfpSIw1LSd0Anlj8aHCSmljj4u%2Bbok6%2FO2h025PlyrPU35XRudW%2BmEqt%2F4Cohaio2nQPA9YBjTUHVYC%2BoNsnJa4BGb28J3NXv%2BAPkOdTv2OpohnZS6uxp3tyfGof0LIXMZ3IpNnp5jFLbd3TN8KfRFA6sjORgXDcZy7UnXGfgP0XIzmm%2FXiIfc2OKloE2kSaNAsFL6%2BFmW3tEpBOAGaSdvtjYEEBO9iG8%2FEB7eowtIs1FUehnEC02ThvqEVyzCew2ZMRnLg5lu9E57%2BAgY8mDlD%2Fxxmr%2FlJ4LasMr3N5mB%2F%2F9sN1X%2FQ%2FnzW7geyXPx2cZBtlv99evltLrG8BJ7i0ZyHJJ8kGhpy8ZaQBYKn859n1jPuawVzUz4S4zaewmby0J5nsplUWPRBk%2F9KlLnN46PWkmyJsyDgfpOsApwvgZ3dZ5FXwtcDKfqO43fMwpfTn0wY6pgFkaVtDk2Rcc4TsC9iLQAg2NL6aY3kPSYZ9LRf3E%2FErAfzza9kDikI6sbWBGUgDfDPHhrkJRP%2FrPnNPjQs2CwcnFyJPU84JcL9Td7cnzh9CSpYeIydSjegAX4xAtihQC%2F8p4VK4udjb%2Fm3%2FpsPlOfYj%2BQpQlOc0EmbBT7JjdWnhC1S2%2BUnJQtnleIEhG8pZzamWaFWbgpzlhTTsHizzNe5%2BffQKzDHu&X-Amz-Signature=36016bb2627379295b68c92825f4367c16922a61d644e81203107872a89ae7f2&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466YVCMDGUX%2F20260810%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260810T184052Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjENn%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIEK4tNu8N4xd8abZ6wY0TweL6wm4qSeENFT3RojyHcTqAiBygZfHXMe05ztI9LB3sWsS1TouSYFD8nmd6%2B04RtcWySqIBAih%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMWN53%2FToLgqQqirPOKtwDQoCrvWWXfiiFRLLz4DBEk1XEbxHjNBk9tAey1rS%2BRJNkmVKVO0ZbkamEThiangjQjmVQOznFkkTlL5V9FD%2BrjxORZ1FLNfqDKG1cN4Z4BVzZTBONdYyQYnMB6P5bJuvGWIEabsZMgnAV4xoO%2Fn5bhpIZ5UyBGReItq6AKeAue6CAwGKXATAmQ4UC%2F6eX4pimjfpSIw1LSd0Anlj8aHCSmljj4u%2Bbok6%2FO2h025PlyrPU35XRudW%2BmEqt%2F4Cohaio2nQPA9YBjTUHVYC%2BoNsnJa4BGb28J3NXv%2BAPkOdTv2OpohnZS6uxp3tyfGof0LIXMZ3IpNnp5jFLbd3TN8KfRFA6sjORgXDcZy7UnXGfgP0XIzmm%2FXiIfc2OKloE2kSaNAsFL6%2BFmW3tEpBOAGaSdvtjYEEBO9iG8%2FEB7eowtIs1FUehnEC02ThvqEVyzCew2ZMRnLg5lu9E57%2BAgY8mDlD%2Fxxmr%2FlJ4LasMr3N5mB%2F%2F9sN1X%2FQ%2FnzW7geyXPx2cZBtlv99evltLrG8BJ7i0ZyHJJ8kGhpy8ZaQBYKn859n1jPuawVzUz4S4zaewmby0J5nsplUWPRBk%2F9KlLnN46PWkmyJsyDgfpOsApwvgZ3dZ5FXwtcDKfqO43fMwpfTn0wY6pgFkaVtDk2Rcc4TsC9iLQAg2NL6aY3kPSYZ9LRf3E%2FErAfzza9kDikI6sbWBGUgDfDPHhrkJRP%2FrPnNPjQs2CwcnFyJPU84JcL9Td7cnzh9CSpYeIydSjegAX4xAtihQC%2F8p4VK4udjb%2Fm3%2FpsPlOfYj%2BQpQlOc0EmbBT7JjdWnhC1S2%2BUnJQtnleIEhG8pZzamWaFWbgpzlhTTsHizzNe5%2BffQKzDHu&X-Amz-Signature=b158a854a3e2354e8b54c0a636400621427b998dc17c405b5120d63735dc11ee&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

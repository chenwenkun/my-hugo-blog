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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466SJHEZC4X%2F20261008%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261008T122559Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEFsaCXVzLXdlc3QtMiJIMEYCIQC0Hlbas10uYH5erpvdv5jwPGb23mg2vsePgZwfQyXoNgIhAIy9yIX%2B2J4AN0Ev2Lnz2UZaB2crCLoUojqf6XD8kF31Kv8DCCMQABoMNjM3NDIzMTgzODA1IgwqSAA0%2BKIhcxLgoB0q3APxHSY8R45fONK8epo7wKnyxUXaeHmcMpYF%2BDVazk9ELQUEEzBwhj06KBHNkdgu6WN9j1uHab9vAGt2RbplP65q3ERdwHD1%2F6ntDDwiMB%2FKBkMUCgIU30nD%2F6vyREnWVMVw23RvSrZelC4gfnbZnLwx6crR1BUdFBvQDNaXPb6Hcm5Up6WtY8ea7diJJuHY%2FtS6Z4rs7GlOHJkctVZg6LPuZfmfDNiX6mdzM0L8PxZGhBfpoII8qtY1rx1qODwJoo%2Fe7UVJKQx8Q4HD7pI2LEN9VhdZTFPvneh7BDyXgwYRonc%2Fdhx6JO7dNsrOJrIToFuJUmHAYeNOmWD%2BehzYkt6qSQPaGAIMAoNg3P5%2BBYGdl%2FuPG4DtnmpM1Q3iXcLHfotpGmioXNlHKacvAZod%2FV2GLssbUNzgdhYF%2Bh4sDga9QyYNieW7qHI%2FaBnUQhLkdGUPDPzf04GjooRC%2FJw8RQ7FL5O%2BdWrfx%2BJb%2BsiksbfCAkhuUpEE24JtIBJZlOeJJ73ATjR8LcgmhxkSCnBlFZJmYWiFVMIUABvXQE5IdpX3GVVAbuHQdb6Jcky70i2bEXApK5fEqsvnRbWPj2WX7WkP2WMFCuw6SWdYFd%2B%2BE3DxPyoDiX%2BhnGH%2FILZnCzDp7J3WBjqkASv8HcLmiyX9Kwj0y8D2TIv8Cabw2Kwx0gr3hQ06K%2F%2BPSfwIeRtz99dYdKOAdgkvdmKFTuCCLJMK2wKIiC75xsF0rzEyPcgR4XrUSukm9z%2FwpYNHRuKQ6e6AGBoulhlM9Dqta%2BpPqudELvoUFba%2FlOIOf8tNi2m4hNnuOeF8BiE4RDisRfgbOavI8ub%2BIDP1YojM8%2FLQyZGoDRBqh5b1VXi8jU6s&X-Amz-Signature=e53b83d3c7ceb24984e60191e6bcc6edd7401fc6eb2421a81dff82613589be8a&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466SJHEZC4X%2F20261008%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261008T122559Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEFsaCXVzLXdlc3QtMiJIMEYCIQC0Hlbas10uYH5erpvdv5jwPGb23mg2vsePgZwfQyXoNgIhAIy9yIX%2B2J4AN0Ev2Lnz2UZaB2crCLoUojqf6XD8kF31Kv8DCCMQABoMNjM3NDIzMTgzODA1IgwqSAA0%2BKIhcxLgoB0q3APxHSY8R45fONK8epo7wKnyxUXaeHmcMpYF%2BDVazk9ELQUEEzBwhj06KBHNkdgu6WN9j1uHab9vAGt2RbplP65q3ERdwHD1%2F6ntDDwiMB%2FKBkMUCgIU30nD%2F6vyREnWVMVw23RvSrZelC4gfnbZnLwx6crR1BUdFBvQDNaXPb6Hcm5Up6WtY8ea7diJJuHY%2FtS6Z4rs7GlOHJkctVZg6LPuZfmfDNiX6mdzM0L8PxZGhBfpoII8qtY1rx1qODwJoo%2Fe7UVJKQx8Q4HD7pI2LEN9VhdZTFPvneh7BDyXgwYRonc%2Fdhx6JO7dNsrOJrIToFuJUmHAYeNOmWD%2BehzYkt6qSQPaGAIMAoNg3P5%2BBYGdl%2FuPG4DtnmpM1Q3iXcLHfotpGmioXNlHKacvAZod%2FV2GLssbUNzgdhYF%2Bh4sDga9QyYNieW7qHI%2FaBnUQhLkdGUPDPzf04GjooRC%2FJw8RQ7FL5O%2BdWrfx%2BJb%2BsiksbfCAkhuUpEE24JtIBJZlOeJJ73ATjR8LcgmhxkSCnBlFZJmYWiFVMIUABvXQE5IdpX3GVVAbuHQdb6Jcky70i2bEXApK5fEqsvnRbWPj2WX7WkP2WMFCuw6SWdYFd%2B%2BE3DxPyoDiX%2BhnGH%2FILZnCzDp7J3WBjqkASv8HcLmiyX9Kwj0y8D2TIv8Cabw2Kwx0gr3hQ06K%2F%2BPSfwIeRtz99dYdKOAdgkvdmKFTuCCLJMK2wKIiC75xsF0rzEyPcgR4XrUSukm9z%2FwpYNHRuKQ6e6AGBoulhlM9Dqta%2BpPqudELvoUFba%2FlOIOf8tNi2m4hNnuOeF8BiE4RDisRfgbOavI8ub%2BIDP1YojM8%2FLQyZGoDRBqh5b1VXi8jU6s&X-Amz-Signature=2c029f9e9f0d1b5629897fb794e2aeb6c7a4586d9b8978fa1154defb797f82eb&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

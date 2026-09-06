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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466UERPCHDM%2F20260906%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260906T095238Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEFcaCXVzLXdlc3QtMiJGMEQCIBVbsYr%2BybAA4qBf1nciD6hxfp5Ou09xFhetUsW%2BZNEjAiBf3lqu9j7MShNQW1Af9oL0Aje%2B9QJcTvAvbmJyvN87USr%2FAwggEAAaDDYzNzQyMzE4MzgwNSIM3Ji3PVsaVWvH35EZKtwDnbZbz2tpv85zgE5FMb0q4ptdNPZYXDQeLUZB0P%2Ba6fXdZR52rLyjQq%2Bqy5SXbHjo2iuf579s0IPGxtEKt%2BD%2Fmcg0lDO7SIdBS6dJHtwGm1G2gkM5Atjm%2BDBU4%2F3X9Wl9CSLnHiSpJQYoUO4TTbdqUQ9psTRfiHXu7mho80zuwzah47aq9eITRXn13DFoL0SoqL%2FESpnRUNUZqCZPQwF2rq4hhZ4%2Bbj4dsQT6MDvgCB1eaabpv7Vfs53SqedogWW%2FzdiVNT2aDJgevY8kyeYdV4UdI4GJjw29cw4%2FnaHLW7SKFisQwPVsqTfBwBFX6Td42C%2F8Q461bgW4ZQZdHttKhqRYT4I%2FmmI89Flkl2Qw3ZadFXRyr2Io4SU5IBz6U1sXd9RFJcK6HsuGIS3%2B2tUYeBFZuHELrYdnM%2Fam9IJXv5DLQ%2FPIcBH4JGT4R9vvf8j%2BE8jT3Kblf6dZDxJbPM8lfbPSwZbuUrABfZQeW7pL%2BDn9vQBb%2BvZ929Oh29N96Sql7ClUM5%2FOEz5JTAzTwAa5aiZD8N01SB8rDBpyDhRGXAYwbgUbRCSqyQq92618Z2BU19YgR9gttpd7AYLuYg1EisfRIhE7JvcAa8VvkiO4gyC9MqULH5RNajJ%2FZncw%2FKH01AY6pgEcRbVnBEm7xp0QrU%2FI8nRhhPZsj21jYuQVhYvG%2Fzqwe07MPiyIV2rO4M1uyIU47SRnE%2Fgt8C4jjXKX0l2RMACB%2BgW5Nr134d%2FmHYsMutuC4jCmyGod4X%2FcV7NbLTzdrCs28y%2F7hpX9JO0Y7PC7xxbAhEJpflzgtwEQfjC2DLiT8Zl8mmkagh0CBMras2ds%2BHSM%2F%2FYER1eLs0cGPgfhhb45IVml2OLK&X-Amz-Signature=c0d39b39a4c2f695cd5266e56188357794ed9f585f53de1efd3c4e8d9deedbdc&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466UERPCHDM%2F20260906%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260906T095238Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEFcaCXVzLXdlc3QtMiJGMEQCIBVbsYr%2BybAA4qBf1nciD6hxfp5Ou09xFhetUsW%2BZNEjAiBf3lqu9j7MShNQW1Af9oL0Aje%2B9QJcTvAvbmJyvN87USr%2FAwggEAAaDDYzNzQyMzE4MzgwNSIM3Ji3PVsaVWvH35EZKtwDnbZbz2tpv85zgE5FMb0q4ptdNPZYXDQeLUZB0P%2Ba6fXdZR52rLyjQq%2Bqy5SXbHjo2iuf579s0IPGxtEKt%2BD%2Fmcg0lDO7SIdBS6dJHtwGm1G2gkM5Atjm%2BDBU4%2F3X9Wl9CSLnHiSpJQYoUO4TTbdqUQ9psTRfiHXu7mho80zuwzah47aq9eITRXn13DFoL0SoqL%2FESpnRUNUZqCZPQwF2rq4hhZ4%2Bbj4dsQT6MDvgCB1eaabpv7Vfs53SqedogWW%2FzdiVNT2aDJgevY8kyeYdV4UdI4GJjw29cw4%2FnaHLW7SKFisQwPVsqTfBwBFX6Td42C%2F8Q461bgW4ZQZdHttKhqRYT4I%2FmmI89Flkl2Qw3ZadFXRyr2Io4SU5IBz6U1sXd9RFJcK6HsuGIS3%2B2tUYeBFZuHELrYdnM%2Fam9IJXv5DLQ%2FPIcBH4JGT4R9vvf8j%2BE8jT3Kblf6dZDxJbPM8lfbPSwZbuUrABfZQeW7pL%2BDn9vQBb%2BvZ929Oh29N96Sql7ClUM5%2FOEz5JTAzTwAa5aiZD8N01SB8rDBpyDhRGXAYwbgUbRCSqyQq92618Z2BU19YgR9gttpd7AYLuYg1EisfRIhE7JvcAa8VvkiO4gyC9MqULH5RNajJ%2FZncw%2FKH01AY6pgEcRbVnBEm7xp0QrU%2FI8nRhhPZsj21jYuQVhYvG%2Fzqwe07MPiyIV2rO4M1uyIU47SRnE%2Fgt8C4jjXKX0l2RMACB%2BgW5Nr134d%2FmHYsMutuC4jCmyGod4X%2FcV7NbLTzdrCs28y%2F7hpX9JO0Y7PC7xxbAhEJpflzgtwEQfjC2DLiT8Zl8mmkagh0CBMras2ds%2BHSM%2F%2FYER1eLs0cGPgfhhb45IVml2OLK&X-Amz-Signature=920c49422d9655e25154bf18a9eee6de861b3207298494b91dd78079c501d317&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

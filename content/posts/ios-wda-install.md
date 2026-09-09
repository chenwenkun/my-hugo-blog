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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466WUTB6WT2%2F20260909%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260909T102028Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEKH%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIEXybbygJkzCN1IcrCMcU8zkF1MhGm9wAWz2lcGVus%2BYAiB0D40QcnVT22YIbGFwZcwIB8EOk06omrjQv4BUnhpBSSr%2FAwhqEAAaDDYzNzQyMzE4MzgwNSIMzjWIQC6wwDFztnLGKtwDWGSN08%2BMKP5HBRx2JSqJSSR5jl%2B7cqrDi3OCR0XiIi3cBd5qvsGq6tnNLnldUEA9FI7uWm%2FEjPq5yastLov69zN2BK0yovEWqY52LEDwjpEj1ELQEp8043gKc9PBjpXUXgtx6s3WPfdm%2BW%2Ba02VjUEGwhB88DqzLVwtfw%2B82clzfA6U2gaCsSRuNqrWVw6EIhH5BTgL20yJsz2FbOCNCA7GiiJSZBwGv9fwQh3VDlTM4V0kSEx6KkwYNVj%2BEL%2F4Hcus3kgDQIyY2Ph39rOTechwkQS4oaah1LhPtTOuhOx%2BWymKugLOaiPGyphSw2keMDlSkl3z2TxT8VzDj9jnFNaSIi%2F23N7YRNaZRCbEoCR8M%2B4ntlto%2B89npo79pwD6sIJvzDhSlF2E2ONUdV0TBtbWbrsh6stPwHeYlhTdNN9ksDUT7ULfD8Hp0IAe1PdQUw3JZ4JED75Lw6BATCKO8M9XriaTP9%2ByfsKxWeoCOfovG53Y7DN8M8kCO9tbUBowAHoQa5Uh4kPdpfmZqh%2F%2FVyhq6GT9p9wwVPkALNSgSTIH4szsVu9p1F1fWJYM0kTPvDTROfo1ZLXWOC%2FfmyWTJ70sohaPdoXPT81uJdG4u4lSjs6VbX%2B2ZTSqMUJww5L6E1QY6pgGNsK8PCZoHZjNu1X3%2FrONs%2FbBrldZsOFsqg3WzE2zJkfE5%2B0ssh9yXV5fpJVl%2B24VHak1RUK84jx357EWwfcJ1W06pd2XdFYN98yScLxdsza8zYwAV%2FhRUJJ%2BGh8tQvXSt0DeTCKmsG04GVAnCWnerQ8ymPggtvNJLJ80vp1obtVyxuA6agtZKLq4HTX6vcArUIP2lhdC6N54dAYl92xUDoiHt%2FJ%2Fc&X-Amz-Signature=6d3cb07ff7b5bfcedd6c8b7fee355afdf2e88831fd4755204a4389f5ed3ec6c9&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466WUTB6WT2%2F20260909%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260909T102028Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEKH%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIEXybbygJkzCN1IcrCMcU8zkF1MhGm9wAWz2lcGVus%2BYAiB0D40QcnVT22YIbGFwZcwIB8EOk06omrjQv4BUnhpBSSr%2FAwhqEAAaDDYzNzQyMzE4MzgwNSIMzjWIQC6wwDFztnLGKtwDWGSN08%2BMKP5HBRx2JSqJSSR5jl%2B7cqrDi3OCR0XiIi3cBd5qvsGq6tnNLnldUEA9FI7uWm%2FEjPq5yastLov69zN2BK0yovEWqY52LEDwjpEj1ELQEp8043gKc9PBjpXUXgtx6s3WPfdm%2BW%2Ba02VjUEGwhB88DqzLVwtfw%2B82clzfA6U2gaCsSRuNqrWVw6EIhH5BTgL20yJsz2FbOCNCA7GiiJSZBwGv9fwQh3VDlTM4V0kSEx6KkwYNVj%2BEL%2F4Hcus3kgDQIyY2Ph39rOTechwkQS4oaah1LhPtTOuhOx%2BWymKugLOaiPGyphSw2keMDlSkl3z2TxT8VzDj9jnFNaSIi%2F23N7YRNaZRCbEoCR8M%2B4ntlto%2B89npo79pwD6sIJvzDhSlF2E2ONUdV0TBtbWbrsh6stPwHeYlhTdNN9ksDUT7ULfD8Hp0IAe1PdQUw3JZ4JED75Lw6BATCKO8M9XriaTP9%2ByfsKxWeoCOfovG53Y7DN8M8kCO9tbUBowAHoQa5Uh4kPdpfmZqh%2F%2FVyhq6GT9p9wwVPkALNSgSTIH4szsVu9p1F1fWJYM0kTPvDTROfo1ZLXWOC%2FfmyWTJ70sohaPdoXPT81uJdG4u4lSjs6VbX%2B2ZTSqMUJww5L6E1QY6pgGNsK8PCZoHZjNu1X3%2FrONs%2FbBrldZsOFsqg3WzE2zJkfE5%2B0ssh9yXV5fpJVl%2B24VHak1RUK84jx357EWwfcJ1W06pd2XdFYN98yScLxdsza8zYwAV%2FhRUJJ%2BGh8tQvXSt0DeTCKmsG04GVAnCWnerQ8ymPggtvNJLJ80vp1obtVyxuA6agtZKLq4HTX6vcArUIP2lhdC6N54dAYl92xUDoiHt%2FJ%2Fc&X-Amz-Signature=fe1f1aafc1923efa3a9bfc4d4a6aaacc3c732f3d435efe763ced77d291abdb5a&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

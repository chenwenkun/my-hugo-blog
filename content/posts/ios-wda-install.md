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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466ZZJON467%2F20261030%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261030T172540Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEHEaCXVzLXdlc3QtMiJHMEUCIQDdX02G8augLhwbAFtswOQimrzoMDWPy7ylXZ50nMJWTwIgKIX57q2T5dT1vMnqZUAcpJOt61jSOm8JCbCiuNGJdFYq%2FwMIORAAGgw2Mzc0MjMxODM4MDUiDIcdlP5KVo59tzToyircA3JoAZvav5yDsCYzs2vh7uzGC5ex8ctc7K3ncgZal%2FAdFKp0lBPKszI0oiqf0HpCLT0CUJBiBrriWjAM4%2FUrZ4myXPv7uLVBup2klGHX6JRgmXE70FIGWcbmCaCIbPg3wl7DnJIzG1PV%2FIE38NqTI3ZSYuvzYsYKUcfquCJrc%2BSysQKZL1BCEimeCczgZFT5VQhC2sns%2FycSXo%2BJpvqDBhZ92UWHmoOTuLX8gc716EyfhUa%2FBY27PkYYU5%2Fj6Gt75Cpi1nA5KOlrDt8KjO2VnFPqljam7j7Udq1lHeOYckL6eI%2BYsAIzMtkj%2BZc7Akp5YDFaRLBNTbhq2QuuDWEcobVS6dFZdOA3r86SoVmoSTW3wFucz%2BbUrw3os%2BCzdQLp5hazChZ37TmasVSuYr9RjZ34pv2t%2BpmzvKOZ5K0pqMyhi9maN4ojdN90lQYAXtZefUWN9jrLY1bmgYvnbxX4GyG6qdl6WhuwVgT6B03zbOAxtWhpq6FCX8rLcTYqAU36vaxknIPgGxaODJAjOKeYhMCHp4ZbFu79nWWwwd2l4WZAikiQXLVJCZhysrxMlj8iTdF0TErYisQedECRMTvvsUCvkj572KEfQCMs%2Bs%2FNL4FQrxu851olyBT8ldlNMIeJk9cGOqUBuMwpinnL6%2Bn1zJfi8BaIpBWK2TcE899hOYEhkPfm%2BSx8fau5NXjvDWOevoR9ubXWAOOYE%2F9KW1p412o5nsmnXSR7El0%2Fc9lZHk9S%2BJhGXdpvCCmx2LnkL3HzI3CM3gUZ%2B3U9RBknxl0m18OtjXav68tzAfYmZ9SMGyuWDR%2B9DkDGJHYsi8OYah4iWHB2vvBV8pJpOrAfNsgVaJAd9s%2Ffngn0wt1D&X-Amz-Signature=6ef9f984cc152649b2bb6ae678f8aa717210cb39f62a8f07fe38cb1264553b75&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466ZZJON467%2F20261030%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261030T172540Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEHEaCXVzLXdlc3QtMiJHMEUCIQDdX02G8augLhwbAFtswOQimrzoMDWPy7ylXZ50nMJWTwIgKIX57q2T5dT1vMnqZUAcpJOt61jSOm8JCbCiuNGJdFYq%2FwMIORAAGgw2Mzc0MjMxODM4MDUiDIcdlP5KVo59tzToyircA3JoAZvav5yDsCYzs2vh7uzGC5ex8ctc7K3ncgZal%2FAdFKp0lBPKszI0oiqf0HpCLT0CUJBiBrriWjAM4%2FUrZ4myXPv7uLVBup2klGHX6JRgmXE70FIGWcbmCaCIbPg3wl7DnJIzG1PV%2FIE38NqTI3ZSYuvzYsYKUcfquCJrc%2BSysQKZL1BCEimeCczgZFT5VQhC2sns%2FycSXo%2BJpvqDBhZ92UWHmoOTuLX8gc716EyfhUa%2FBY27PkYYU5%2Fj6Gt75Cpi1nA5KOlrDt8KjO2VnFPqljam7j7Udq1lHeOYckL6eI%2BYsAIzMtkj%2BZc7Akp5YDFaRLBNTbhq2QuuDWEcobVS6dFZdOA3r86SoVmoSTW3wFucz%2BbUrw3os%2BCzdQLp5hazChZ37TmasVSuYr9RjZ34pv2t%2BpmzvKOZ5K0pqMyhi9maN4ojdN90lQYAXtZefUWN9jrLY1bmgYvnbxX4GyG6qdl6WhuwVgT6B03zbOAxtWhpq6FCX8rLcTYqAU36vaxknIPgGxaODJAjOKeYhMCHp4ZbFu79nWWwwd2l4WZAikiQXLVJCZhysrxMlj8iTdF0TErYisQedECRMTvvsUCvkj572KEfQCMs%2Bs%2FNL4FQrxu851olyBT8ldlNMIeJk9cGOqUBuMwpinnL6%2Bn1zJfi8BaIpBWK2TcE899hOYEhkPfm%2BSx8fau5NXjvDWOevoR9ubXWAOOYE%2F9KW1p412o5nsmnXSR7El0%2Fc9lZHk9S%2BJhGXdpvCCmx2LnkL3HzI3CM3gUZ%2B3U9RBknxl0m18OtjXav68tzAfYmZ9SMGyuWDR%2B9DkDGJHYsi8OYah4iWHB2vvBV8pJpOrAfNsgVaJAd9s%2Ffngn0wt1D&X-Amz-Signature=501f02a368108d28f9525544fec9ad2cb83a218c425827eda17d04cf4be1fe94&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

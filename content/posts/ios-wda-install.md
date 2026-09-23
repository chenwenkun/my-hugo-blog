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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466VWZSFEIJ%2F20260923%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260923T154431Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEPX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQDkZEKA1suEZJ4FcTL6FARHdrEEZx%2FkDK6FXjKj%2FFLOtQIhANOZ7RX7XrfHNWfYT7sbUe9ceq4ZtnSy5nBzejTwdMyUKogECL3%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1Igz9wD79OvCuZLKJ4tQq3AMAsQG%2F0v4pcsvrLEzbxghLDtmigFFxufXpj1sBQoK4dXjoolXMBdB9yB8BGwo3mk8mfznBZn2T7V5kL8q2jTvWo3N4fHDo19S2S4n6%2F7DS0R8ZHRG89cs4eRV1ES6ywb5bOM4dDBTxR4IrLbC9JHSrlrckjziQXb8rUc8B3%2BhbkvijWBdC3zC0QSAoauJF6x1H2MDOVRDEr%2FQWRJ2524H0hiI4hEOITUThaDNTwDoB5T0mONLtHFB7707MfCrTFWQuKr3b4%2FjxM6PcYAlu46awGX1MnFLdV9p71F7T%2Bjii9jboUHw0IFjPXXWar6JovWp3Q0DY5mDqFjldAweF1UEl%2B%2B2rhVoKPvBb4iOBOweT6N5u6umaElWPJv%2BgJklIMfp%2B0UDJkxSs4HbK0SZ%2ByWTdp4k2x6oMk0kqbcNk%2FBxCqGZi%2F1A0N2hHEkLU%2Fxn8BF6OYDpj7o9ZhbVpP8sP9HY0THxRbImyDCJ1ujHKu1ubQWgX7KXDS7b2UPQsOA7%2FAZ6RVk%2BeXoFyB7nXPu%2BSdcgbdMDROuCgi%2F1m%2F5loRyj9BkYZYMdtWztGlLDSOoJSnRzaVwQgxsPPY3W9%2FyANOEGdcZNaKnpmFeG%2BrbtFNE5VKhsvi8wsUkxii%2FqDmTC3h8%2FVBjqkASKU3%2BWpE3wXVsQpHf%2FqP2IeDgNZHcH6mJ%2FIsW3cztYXR0ggTXPLDx3KqbG9NW0pD8rWEDzVqsiN0p%2BZE18UFLihdhk9KnVIQkwPzIEdL588rxogkNY%2FtKU50Phf3ul%2BmM9jkht8xmzf2ePdrw7%2FuBf5RRHxLy7l86acFcC72%2Ftiq8A8sOQby%2Fl%2FzPnB84otpVuabkHoXVjOt9T4xT%2Fl%2F4sxhVLT&X-Amz-Signature=9ff9d5e2b78884c0afbe48eb254b465e5d0f84708b82dc910a44e6e66c303743&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466VWZSFEIJ%2F20260923%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260923T154431Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEPX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQDkZEKA1suEZJ4FcTL6FARHdrEEZx%2FkDK6FXjKj%2FFLOtQIhANOZ7RX7XrfHNWfYT7sbUe9ceq4ZtnSy5nBzejTwdMyUKogECL3%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1Igz9wD79OvCuZLKJ4tQq3AMAsQG%2F0v4pcsvrLEzbxghLDtmigFFxufXpj1sBQoK4dXjoolXMBdB9yB8BGwo3mk8mfznBZn2T7V5kL8q2jTvWo3N4fHDo19S2S4n6%2F7DS0R8ZHRG89cs4eRV1ES6ywb5bOM4dDBTxR4IrLbC9JHSrlrckjziQXb8rUc8B3%2BhbkvijWBdC3zC0QSAoauJF6x1H2MDOVRDEr%2FQWRJ2524H0hiI4hEOITUThaDNTwDoB5T0mONLtHFB7707MfCrTFWQuKr3b4%2FjxM6PcYAlu46awGX1MnFLdV9p71F7T%2Bjii9jboUHw0IFjPXXWar6JovWp3Q0DY5mDqFjldAweF1UEl%2B%2B2rhVoKPvBb4iOBOweT6N5u6umaElWPJv%2BgJklIMfp%2B0UDJkxSs4HbK0SZ%2ByWTdp4k2x6oMk0kqbcNk%2FBxCqGZi%2F1A0N2hHEkLU%2Fxn8BF6OYDpj7o9ZhbVpP8sP9HY0THxRbImyDCJ1ujHKu1ubQWgX7KXDS7b2UPQsOA7%2FAZ6RVk%2BeXoFyB7nXPu%2BSdcgbdMDROuCgi%2F1m%2F5loRyj9BkYZYMdtWztGlLDSOoJSnRzaVwQgxsPPY3W9%2FyANOEGdcZNaKnpmFeG%2BrbtFNE5VKhsvi8wsUkxii%2FqDmTC3h8%2FVBjqkASKU3%2BWpE3wXVsQpHf%2FqP2IeDgNZHcH6mJ%2FIsW3cztYXR0ggTXPLDx3KqbG9NW0pD8rWEDzVqsiN0p%2BZE18UFLihdhk9KnVIQkwPzIEdL588rxogkNY%2FtKU50Phf3ul%2BmM9jkht8xmzf2ePdrw7%2FuBf5RRHxLy7l86acFcC72%2Ftiq8A8sOQby%2Fl%2FzPnB84otpVuabkHoXVjOt9T4xT%2Fl%2F4sxhVLT&X-Amz-Signature=d979c68a72aed7812c8fcb14a04142b2cca73b4de3c30c37943c9f7d053c8ddc&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

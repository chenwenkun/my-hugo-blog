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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB46637AQBBHT%2F20261003%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261003T104710Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEOP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIGSZFGK6MGnEdv1kWKSX4WT2iDgHPpkQuFol1pKU3i6MAiEA3FrJTRwO%2B4zgC2%2FcuK%2BuqeTZITwYDGuWJz6X%2FypiwGgqiAQIq%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDL40%2BISTrliHC6PgXircA0sqp9JxkkfeMHo%2FsmwxDz8O%2FB%2Batg7x8pk1nvrspi8VelnRdoSKf0BNpvDheXRZpo6mHLMEVVtFcaFIy9IDdPh099W2XDSo7XD5DBi8qmd5ipGuT7YOrgTAURK2CYbBQLWekarmUE%2B6Dxu2GqoTYw66ZIjtykgd5tfkIqrED3yOncMlHHhdRpViLeDiSWi%2FgGJ85oo6dHN3HqHfYOFeMTBczleia6MvSMa2AgdBdU58l4nW7RoTgCXUKhQ7VkP8vJqjm1a7CuFrT7CgzSCqsUScQLe69AuJkMMvraOEFTRzUh3DSXuvuh%2FVmMEn1ce8rZxsNKmSuchxUBmGGg7bPi74UrvQqM4AOyw5WLcswzs26GdYBxonL1xt5yw1CTMXWJWHmdw24616ctKw7viVJ8fmPL8O2E9VKK9wl2PwR%2BZpQ4oHZ0CaX%2B0UwsUvcGGNI8A0BIYpDU%2BWV8okB3r2ZJncpBn7hd%2F%2BfTx60pp6IuAdEagMf0hF7XvLRrUALejVIs6SN2aTwXPJhf1YB1t1RLXSufCm7BBkUABJoHYxEyXnpfJvMO4zbL%2FrEPTXJLM0%2B7KcadrqyxW2fSBu9rfOzzI19s%2F6fGuPB%2FvbyVBENDfmUBKrjkvnGZfFdjCuMPyxg9YGOqUBI3iyl98hgMMblt8B8v8tgFr0acemwrjMTE%2F5MwkwwpiJqkOgJtV9aBCmy0BodhQrfuBwkhFtr08QBoNrww6nl53BtNcosBAIg9biFTI7WAwErEeTVI3W7bTuvjiGhY0%2FrgIhUzms8aQElxQ75uAHEJez9BVQ0FnqG9Q97FFutefdtYWXotUyCvhy2ELBxiRcwklXD2Y82L9gN8y5tKXsVOuxB3o5&X-Amz-Signature=8f6bf14f4a895be995f2aefef14eabd24ea47a07fe75f7a5c28c74de905abc5a&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB46637AQBBHT%2F20261003%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261003T104710Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEOP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIGSZFGK6MGnEdv1kWKSX4WT2iDgHPpkQuFol1pKU3i6MAiEA3FrJTRwO%2B4zgC2%2FcuK%2BuqeTZITwYDGuWJz6X%2FypiwGgqiAQIq%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDL40%2BISTrliHC6PgXircA0sqp9JxkkfeMHo%2FsmwxDz8O%2FB%2Batg7x8pk1nvrspi8VelnRdoSKf0BNpvDheXRZpo6mHLMEVVtFcaFIy9IDdPh099W2XDSo7XD5DBi8qmd5ipGuT7YOrgTAURK2CYbBQLWekarmUE%2B6Dxu2GqoTYw66ZIjtykgd5tfkIqrED3yOncMlHHhdRpViLeDiSWi%2FgGJ85oo6dHN3HqHfYOFeMTBczleia6MvSMa2AgdBdU58l4nW7RoTgCXUKhQ7VkP8vJqjm1a7CuFrT7CgzSCqsUScQLe69AuJkMMvraOEFTRzUh3DSXuvuh%2FVmMEn1ce8rZxsNKmSuchxUBmGGg7bPi74UrvQqM4AOyw5WLcswzs26GdYBxonL1xt5yw1CTMXWJWHmdw24616ctKw7viVJ8fmPL8O2E9VKK9wl2PwR%2BZpQ4oHZ0CaX%2B0UwsUvcGGNI8A0BIYpDU%2BWV8okB3r2ZJncpBn7hd%2F%2BfTx60pp6IuAdEagMf0hF7XvLRrUALejVIs6SN2aTwXPJhf1YB1t1RLXSufCm7BBkUABJoHYxEyXnpfJvMO4zbL%2FrEPTXJLM0%2B7KcadrqyxW2fSBu9rfOzzI19s%2F6fGuPB%2FvbyVBENDfmUBKrjkvnGZfFdjCuMPyxg9YGOqUBI3iyl98hgMMblt8B8v8tgFr0acemwrjMTE%2F5MwkwwpiJqkOgJtV9aBCmy0BodhQrfuBwkhFtr08QBoNrww6nl53BtNcosBAIg9biFTI7WAwErEeTVI3W7bTuvjiGhY0%2FrgIhUzms8aQElxQ75uAHEJez9BVQ0FnqG9Q97FFutefdtYWXotUyCvhy2ELBxiRcwklXD2Y82L9gN8y5tKXsVOuxB3o5&X-Amz-Signature=54a336701b28540480834f6257163a6f5a91fe63253ea2b1cfe5d9aab04db254&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

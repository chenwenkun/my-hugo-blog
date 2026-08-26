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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466YOQYL4F7%2F20260826%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260826T003832Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEEgaCXVzLXdlc3QtMiJGMEQCIA1%2BUZW8q9qwZ5uakKFNIxUF8Hq9rHiYojmc8W5U%2FdX%2FAiAd2XKX4tN9agvg6uKZKDl9GcgXte4%2Bdv04y%2BDKQMmheSr%2FAwgREAAaDDYzNzQyMzE4MzgwNSIMDw613Sw1KhYiW81mKtwD1a9FLyT8W9eFV1z%2B8gazQnqyYxqPFHhG57FJTSz%2FOtDWnUAS2Izy950nqjcV%2F3nKvUBMLJkVZcO0lVxo9lNStBawckPQ0tZK9XwcFyKNApV5m%2BD8kjvgJcWgLx%2FZHQ8M83x2ioeCCZZ26LoDlZi2o6xGrO4fmt2dwkk4QuA8YJS1kiP5%2Ff3JlQJYoI%2FCDI3qMVwTOW4BnSMO7yjQKmpV7y1d%2FgfrMaTxEPrqhtQqvo%2FKac%2BkyCY7TSa3Nlx49uHrTLh66gpTCw4qLIEwZgxeSKyo60NRPDW8AIWE%2BjAeUoBV3Qi%2BMRxP%2FrVyAS4%2FN1EW0V%2F7zkEFmSszoOR9wtuV%2FSwCrK0UF9ShMtWgxtRT76%2FvLhp1DSpHnPg9p41BpL41quSjsGD5JjZ%2FVx2ujum0jPpAmb25NQxVnWQ51uOQuzqxk7l6d8W8t6pvuSqp4FGeEK93NNLPrh39baQeguaMvl%2BZfMnFUSSK%2B1zAP1Hz7OyO04%2BEOcY0MtS5TS%2FBvq6zma3U0HRprdH4f5938VkrS6QeoJM7sb%2F6M%2FHuEPVr%2BputChoI%2Bj%2B5EVV9vcSapIb6mSdl9csVR68j5AWCSX2Qt07REQX8RQOBNYPG5eNKb9ojGlQPjhskvZJsmvIwita41AY6pgEGNkg7xfzk1mc4kTMQgXIrbK6GmAtqWtXSAJOh0puJ20cUWdDmKvMCuzKrwyHAkwnEjAVRZIHl2xgZD8l0WasIWuBex7CEDb%2Be0UIyojRG7bXLixtxskUog7ieJq4KSqgMqqNiv5tB8MOLSLG78i9Ltkefd0Q2fKhsfXuIu0hR5Zqs0W8RwghmL0BTVtYZaw0Sx9o8Qv1bdL1sNby73zXFhl0u20NW&X-Amz-Signature=1db2f7612529a6922ce13a61aaffb6b1c2101ed170dcdfa368935534da67adbd&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466YOQYL4F7%2F20260826%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260826T003832Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEEgaCXVzLXdlc3QtMiJGMEQCIA1%2BUZW8q9qwZ5uakKFNIxUF8Hq9rHiYojmc8W5U%2FdX%2FAiAd2XKX4tN9agvg6uKZKDl9GcgXte4%2Bdv04y%2BDKQMmheSr%2FAwgREAAaDDYzNzQyMzE4MzgwNSIMDw613Sw1KhYiW81mKtwD1a9FLyT8W9eFV1z%2B8gazQnqyYxqPFHhG57FJTSz%2FOtDWnUAS2Izy950nqjcV%2F3nKvUBMLJkVZcO0lVxo9lNStBawckPQ0tZK9XwcFyKNApV5m%2BD8kjvgJcWgLx%2FZHQ8M83x2ioeCCZZ26LoDlZi2o6xGrO4fmt2dwkk4QuA8YJS1kiP5%2Ff3JlQJYoI%2FCDI3qMVwTOW4BnSMO7yjQKmpV7y1d%2FgfrMaTxEPrqhtQqvo%2FKac%2BkyCY7TSa3Nlx49uHrTLh66gpTCw4qLIEwZgxeSKyo60NRPDW8AIWE%2BjAeUoBV3Qi%2BMRxP%2FrVyAS4%2FN1EW0V%2F7zkEFmSszoOR9wtuV%2FSwCrK0UF9ShMtWgxtRT76%2FvLhp1DSpHnPg9p41BpL41quSjsGD5JjZ%2FVx2ujum0jPpAmb25NQxVnWQ51uOQuzqxk7l6d8W8t6pvuSqp4FGeEK93NNLPrh39baQeguaMvl%2BZfMnFUSSK%2B1zAP1Hz7OyO04%2BEOcY0MtS5TS%2FBvq6zma3U0HRprdH4f5938VkrS6QeoJM7sb%2F6M%2FHuEPVr%2BputChoI%2Bj%2B5EVV9vcSapIb6mSdl9csVR68j5AWCSX2Qt07REQX8RQOBNYPG5eNKb9ojGlQPjhskvZJsmvIwita41AY6pgEGNkg7xfzk1mc4kTMQgXIrbK6GmAtqWtXSAJOh0puJ20cUWdDmKvMCuzKrwyHAkwnEjAVRZIHl2xgZD8l0WasIWuBex7CEDb%2Be0UIyojRG7bXLixtxskUog7ieJq4KSqgMqqNiv5tB8MOLSLG78i9Ltkefd0Q2fKhsfXuIu0hR5Zqs0W8RwghmL0BTVtYZaw0Sx9o8Qv1bdL1sNby73zXFhl0u20NW&X-Amz-Signature=3478442b3c382a4b6868c58f78746e1a55b60e49491c47355f0d2a8e825c6f55&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

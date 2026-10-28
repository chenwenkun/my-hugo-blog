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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466WGOQ7AUJ%2F20261028%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261028T114745Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEDsaCXVzLXdlc3QtMiJHMEUCIEKHDHj2tVKHm5eX0BXMonEx2BnrmwnFSMFlSQvcv8JmAiEAm4%2FnqWQ9ayvDbQjsscwR1MdkE861WeG%2BkYW6AaeDDP4q%2FwMIBBAAGgw2Mzc0MjMxODM4MDUiDGMbxRt1IAiU5Q0TKCrcA4%2F3evj62OeRGbKiGqA8bTmwpeCoO8R%2FOPTWUg6%2BoJS7%2BXRph36bxW86jsFumGEcAe5ddTAYvcYfw0aCvbaYdGa%2BRuy5LWM9MXA0uqZxSAwfHuPEDo9OPmNC7j%2BR6C1FcTLGQpnrF4GgF6%2FS3IXD5eqlN0jvRlJufDp0bbPoX47BpEJoRk%2FokoyqvryHm9zrCUkt4SronD6NEsde19BeLeA7DENXHM4Ar1YPbU1AgBMbTVTn%2BIQjG%2BLdF%2BelEJy7hJcA2xVY3fplo4wWa6SnKYo3nybhvbNNZAMKAoAPgCF5m35I7ETcVmCOh3T71KucKNj%2BGl96GjcfbVZNgp5baYa%2B0L0pfdWzgITXjWqcysFmq08LKWSh0ZC%2BosKSvYn0P94AxBEos3bphBVtAq29J43E5J8v38O%2BOkWI9yV9GCJT1GLvNi2DD6j0OVJfiTlUZHCTYczhLDapPnWguWqVUCxdAlZiOkGtjqaOwouldguIOdtW%2Bmhf8w41nQSfLBZ2Rt15ffGS9n7UCdE%2BCj4C165ZIoxCntr2LGhb9xl2NH0RYuEoEe71KextPwPiFcnvHRGB%2Fi81tGhn7VK1DRxmNM2DH3rsgZrAydv6zobkEpCcCwIfYpAl58cEpJ3aMOajh9cGOqUBnjDnnU7kwTwYA4i%2FIQbhtD9RreFRsAlJz8itbx9PxgWaMcvjnsISwSg7XoDHYwE6uS5jcgKVfPUv31RrA6H6cPvUfBqABEnXnmBu%2B6%2BgaOyJ4y5aezUf0pygl7bdCBjwkgWcogqw6p8hWeevU5BSet2LlF%2FOVykmu%2BJ2HxxQn7Me68r9d6KWZEXzHekiPvmgxx54eotNHfPlv7cbLEJmw6ZB4unk&X-Amz-Signature=38e38484e9628d966762f6ed3e875348de122983bf8748f593fbcfcdf80b3243&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466WGOQ7AUJ%2F20261028%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261028T114745Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEDsaCXVzLXdlc3QtMiJHMEUCIEKHDHj2tVKHm5eX0BXMonEx2BnrmwnFSMFlSQvcv8JmAiEAm4%2FnqWQ9ayvDbQjsscwR1MdkE861WeG%2BkYW6AaeDDP4q%2FwMIBBAAGgw2Mzc0MjMxODM4MDUiDGMbxRt1IAiU5Q0TKCrcA4%2F3evj62OeRGbKiGqA8bTmwpeCoO8R%2FOPTWUg6%2BoJS7%2BXRph36bxW86jsFumGEcAe5ddTAYvcYfw0aCvbaYdGa%2BRuy5LWM9MXA0uqZxSAwfHuPEDo9OPmNC7j%2BR6C1FcTLGQpnrF4GgF6%2FS3IXD5eqlN0jvRlJufDp0bbPoX47BpEJoRk%2FokoyqvryHm9zrCUkt4SronD6NEsde19BeLeA7DENXHM4Ar1YPbU1AgBMbTVTn%2BIQjG%2BLdF%2BelEJy7hJcA2xVY3fplo4wWa6SnKYo3nybhvbNNZAMKAoAPgCF5m35I7ETcVmCOh3T71KucKNj%2BGl96GjcfbVZNgp5baYa%2B0L0pfdWzgITXjWqcysFmq08LKWSh0ZC%2BosKSvYn0P94AxBEos3bphBVtAq29J43E5J8v38O%2BOkWI9yV9GCJT1GLvNi2DD6j0OVJfiTlUZHCTYczhLDapPnWguWqVUCxdAlZiOkGtjqaOwouldguIOdtW%2Bmhf8w41nQSfLBZ2Rt15ffGS9n7UCdE%2BCj4C165ZIoxCntr2LGhb9xl2NH0RYuEoEe71KextPwPiFcnvHRGB%2Fi81tGhn7VK1DRxmNM2DH3rsgZrAydv6zobkEpCcCwIfYpAl58cEpJ3aMOajh9cGOqUBnjDnnU7kwTwYA4i%2FIQbhtD9RreFRsAlJz8itbx9PxgWaMcvjnsISwSg7XoDHYwE6uS5jcgKVfPUv31RrA6H6cPvUfBqABEnXnmBu%2B6%2BgaOyJ4y5aezUf0pygl7bdCBjwkgWcogqw6p8hWeevU5BSet2LlF%2FOVykmu%2BJ2HxxQn7Me68r9d6KWZEXzHekiPvmgxx54eotNHfPlv7cbLEJmw6ZB4unk&X-Amz-Signature=c75e2d8d482b579e95508d6482ac8e80d96bcb3905d6c5836015413930446d14&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

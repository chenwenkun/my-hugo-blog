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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466VB2QAGJC%2F20260919%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260919T194439Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIBeXloQlnHhd4a32h6wJSyC%2FuMrtEZ87%2F57tdNm2lW3lAiAddZOURmR9rVPDYvMdpGhMJ%2Bg5J%2FRmIJrwciWWy8uwGir%2FAwhkEAAaDDYzNzQyMzE4MzgwNSIMR%2BmqejsAy7vZ4CUQKtwD8juPG9pAjN4fy3EQeB0LTbrwJX9b5qL8TM5mb9mP3bDlPcKKSvpPXzlU%2FK9MhyfQpR85GEVsMzYVeGwJ%2FBOD0ouDzhPV1XmJyH3dzIdjn4SSNNakwdJWUgNP%2BxmfGK%2FHJSEnxojYazDCk84MKYFaKMNwO2ClcPcZ6EoUUKdOwtwtW0FBjeb8qheUcdnkgn%2FU7XWM5lXMDG%2BvC6vzYmhpsFDp1Nr0kZDQWbz7hQnHu3R8Pp0pNdk2HkmhICXkj60cYSK%2FxTa48k6PmxkF05Gcgx81IgjaooZ3MLHvH6SdP5%2BVJpqVeYGyQdhV%2FWj5YkK65BSWLcvjUUCFd3OlZUfolms0Jjmcqn6MTTRYXuRTylba%2Blauk5814nX5%2BsVcANlmgFZWVQbUpXG9vksWOwo3B%2Fxf8O9xLmzmUi5DgIEtPuKFLtD%2BycEeR9LAZv9da1mNE1k6xZhtLZCxmVSxXVslaosk4vMW%2BcWlADstlvYMg6%2BXrUM8SnlYkjvCuWbYIX1%2BGtVwxNjSglqVbz7i01Y6cizurBqDPPVGKIuKy2TBzPgkL%2BDABlA8Os0k6HMlygrt27AC%2BzuSy1RDPPoJVo338q3gzGf7WQRMyXoQBmCE8LacUY7wbA%2BBhXNlf7AwqKm71QY6pgFlRaG8MzpCIqG88qvPj2eQPPPPB25JeH5wU3FhpbLQ0wLgeZ%2FkUQ03pm%2BLZ8AfT%2FbyNFnprBfGbqJVLlMvb1WbUjS5XsGQmG3pKIsYKJgtw7czdwSfj0KcXB6U87nzauuYN2xcUPlkg2zjtmTshEG1dSi2Hjaq4hCde7CoXf5v%2FjO3nBdTmUeQJpbRRfKI9%2BvRTzfaPz9ypNPgARk%2BKPXTdKhRyp6Z&X-Amz-Signature=e10e4c7ccdd767efae2e1308055c0be0f198fdd02650aabcb68c9edbb58c5e50&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466VB2QAGJC%2F20260919%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260919T194439Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIBeXloQlnHhd4a32h6wJSyC%2FuMrtEZ87%2F57tdNm2lW3lAiAddZOURmR9rVPDYvMdpGhMJ%2Bg5J%2FRmIJrwciWWy8uwGir%2FAwhkEAAaDDYzNzQyMzE4MzgwNSIMR%2BmqejsAy7vZ4CUQKtwD8juPG9pAjN4fy3EQeB0LTbrwJX9b5qL8TM5mb9mP3bDlPcKKSvpPXzlU%2FK9MhyfQpR85GEVsMzYVeGwJ%2FBOD0ouDzhPV1XmJyH3dzIdjn4SSNNakwdJWUgNP%2BxmfGK%2FHJSEnxojYazDCk84MKYFaKMNwO2ClcPcZ6EoUUKdOwtwtW0FBjeb8qheUcdnkgn%2FU7XWM5lXMDG%2BvC6vzYmhpsFDp1Nr0kZDQWbz7hQnHu3R8Pp0pNdk2HkmhICXkj60cYSK%2FxTa48k6PmxkF05Gcgx81IgjaooZ3MLHvH6SdP5%2BVJpqVeYGyQdhV%2FWj5YkK65BSWLcvjUUCFd3OlZUfolms0Jjmcqn6MTTRYXuRTylba%2Blauk5814nX5%2BsVcANlmgFZWVQbUpXG9vksWOwo3B%2Fxf8O9xLmzmUi5DgIEtPuKFLtD%2BycEeR9LAZv9da1mNE1k6xZhtLZCxmVSxXVslaosk4vMW%2BcWlADstlvYMg6%2BXrUM8SnlYkjvCuWbYIX1%2BGtVwxNjSglqVbz7i01Y6cizurBqDPPVGKIuKy2TBzPgkL%2BDABlA8Os0k6HMlygrt27AC%2BzuSy1RDPPoJVo338q3gzGf7WQRMyXoQBmCE8LacUY7wbA%2BBhXNlf7AwqKm71QY6pgFlRaG8MzpCIqG88qvPj2eQPPPPB25JeH5wU3FhpbLQ0wLgeZ%2FkUQ03pm%2BLZ8AfT%2FbyNFnprBfGbqJVLlMvb1WbUjS5XsGQmG3pKIsYKJgtw7czdwSfj0KcXB6U87nzauuYN2xcUPlkg2zjtmTshEG1dSi2Hjaq4hCde7CoXf5v%2FjO3nBdTmUeQJpbRRfKI9%2BvRTzfaPz9ypNPgARk%2BKPXTdKhRyp6Z&X-Amz-Signature=4b023d3059f7984a2b171f7da24525c5ad45cd9ee4fe85818e6821ec01e6ed12&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

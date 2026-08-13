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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466S2R5XQHB%2F20260813%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260813T184614Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjECAaCXVzLXdlc3QtMiJIMEYCIQDcaoPRnBn4a1MVlDEKne88okv68rnGzXCFLYb6xgT57gIhALlihAQAK08mcsw6aAvVW03YcukJ6Efhe6SNW7UaVXARKogECOn%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgyNPXsm5dqs4jKhS5Eq3ANLKtQhUqeIBJJdqiCcfbg8zjxeMKdEz%2BrjqBzTXuEX7sa3zyjy7a%2FyeFmymNVesKXueKe1Vi9TdLhlxurbPuFnQfZUfmlpF9wngy3lk8MSVMk2vpGYn4Jg1JfWMusjJotUMYFSjcMHj8TvkipswkXBXzL%2Fr%2BPr26QVffJ%2BCY4BDmM21CccMEFM8m0U0QA2uUaQylf%2BlPoKTFw2M18%2FjEgZCYpzU5Pi%2F39ZIjri12e6xXHb7SpeQunq5j%2Biy5kChDfuqsCoWe1O4Hd%2FVxdl44wf0onfvJl5xJ7O8RpfJvLcq7bwI0s7AZns25CUF5GL0nFWkO4EWY21UojxUyIGY2Cg69W3mTm01ikbqxBc9l7CtBEIPmRpOjys6CtWBjphc%2FnReJatIr8C%2FTz%2BYEww4O5zt24cCB3WBSLFuMfUgk%2FkYDsZB0sBcGBDBm043twsqJ1SQlkgpJKC04b1WK767U5E3W3IWFbdmqD7Xb0zESK8P3QEo%2BlshdIoCOGN4klfAw0pyXwhfSIlRsIZZYGomTFomuPDtqui72XaIiKXi%2B918qE4I4BtxrTfHEdpOyVNRzm%2FQXtKHRsuNj5Uhako86ZPBlPFzD0zZyA4h717yVoBmsSZzGvxTXO0sIwmdDDf2%2FfTBjqkAWHW88Gt%2FUC7flpEIRkRZKluvi9gprbdBgiAacFnTif73n7YKbSg%2F0DXHtCFfYwR6z%2B6VRJ23SbERLbfABPcFc15P%2FGYvDbr%2B5lnM397E%2B7O075tNV%2BW9ud%2BHAdGQYOBOMn4ytxcWh%2FHsyglMQdxeJ856qZdioyq90foosincgbW1ew9uqh1ASMLfrsYlQkOErUDaP8xM%2FUPNtjZGGv00R5stVRa&X-Amz-Signature=58e395c905c442294b6301cffd464ed7e4d600133e53cc841579672e7441326c&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466S2R5XQHB%2F20260813%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260813T184614Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjECAaCXVzLXdlc3QtMiJIMEYCIQDcaoPRnBn4a1MVlDEKne88okv68rnGzXCFLYb6xgT57gIhALlihAQAK08mcsw6aAvVW03YcukJ6Efhe6SNW7UaVXARKogECOn%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgyNPXsm5dqs4jKhS5Eq3ANLKtQhUqeIBJJdqiCcfbg8zjxeMKdEz%2BrjqBzTXuEX7sa3zyjy7a%2FyeFmymNVesKXueKe1Vi9TdLhlxurbPuFnQfZUfmlpF9wngy3lk8MSVMk2vpGYn4Jg1JfWMusjJotUMYFSjcMHj8TvkipswkXBXzL%2Fr%2BPr26QVffJ%2BCY4BDmM21CccMEFM8m0U0QA2uUaQylf%2BlPoKTFw2M18%2FjEgZCYpzU5Pi%2F39ZIjri12e6xXHb7SpeQunq5j%2Biy5kChDfuqsCoWe1O4Hd%2FVxdl44wf0onfvJl5xJ7O8RpfJvLcq7bwI0s7AZns25CUF5GL0nFWkO4EWY21UojxUyIGY2Cg69W3mTm01ikbqxBc9l7CtBEIPmRpOjys6CtWBjphc%2FnReJatIr8C%2FTz%2BYEww4O5zt24cCB3WBSLFuMfUgk%2FkYDsZB0sBcGBDBm043twsqJ1SQlkgpJKC04b1WK767U5E3W3IWFbdmqD7Xb0zESK8P3QEo%2BlshdIoCOGN4klfAw0pyXwhfSIlRsIZZYGomTFomuPDtqui72XaIiKXi%2B918qE4I4BtxrTfHEdpOyVNRzm%2FQXtKHRsuNj5Uhako86ZPBlPFzD0zZyA4h717yVoBmsSZzGvxTXO0sIwmdDDf2%2FfTBjqkAWHW88Gt%2FUC7flpEIRkRZKluvi9gprbdBgiAacFnTif73n7YKbSg%2F0DXHtCFfYwR6z%2B6VRJ23SbERLbfABPcFc15P%2FGYvDbr%2B5lnM397E%2B7O075tNV%2BW9ud%2BHAdGQYOBOMn4ytxcWh%2FHsyglMQdxeJ856qZdioyq90foosincgbW1ew9uqh1ASMLfrsYlQkOErUDaP8xM%2FUPNtjZGGv00R5stVRa&X-Amz-Signature=7dd7f1d10d74ea6ac629ab7f53af821c4cfad28e9c89530926eeca519fecbaec&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

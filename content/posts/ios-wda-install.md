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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466WJDDFEL3%2F20260912%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260912T094500Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEOn%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQC4rtapO5QBCGUJIu0bdgndLA6Qim1NzOH%2Ff8ieAgFi8wIhAJtCmyJTv7RF9%2Fhj%2BvMQcjqPTQw%2Fgoc5%2Fa4sAGnlfmLOKogECLL%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgzSRvVU%2B8FoivKCSdoq3AOC%2FWQqhShHRI8BbxDqXUCjH7GhS0eBHaRS7u3CgTKsNQV%2BIMkl8S1ynAfV%2Ft2HezyXYXfyJrEFJMjR3cNfqsFNEXE1AoUBONbSpatv51HtT96bcuFup5XLmSYKghCRDNTV4cP%2BlurHwUHIpdFdTuBmOo49N9opPHxiAdpNJ%2B%2Bpk0kGOq31f3BkBMp99n5j0LuLmejTRQCtBQx60J9AX9YZ1oIxSsnX%2B7m9CBnA43eZJEVEeI4gXLL7g%2F27I%2FZUn4SzKNVwUR19BO1sA1MiMWRDGIdhxihjMj0H6A2WCd36L6ZDLejTsToYwU6MNK6f2L%2Fu3MpvAdD4YcWd1wnACDTv6gLZS9cLz8DUi%2Fo1nLqTKfU50zAJxqXFJZ9C%2Fx2W6frOjeFFrjJWXd6yWioo%2Ft3XiocMYfFsCA6upicdUjpWlp9fHnPprvEL%2BZ59euH3Kl9LuOY9FGYaw4VWBQDsDnCXNp3s3fw2J%2BJNPsaN0STYy8dRhNnXpSqLHxIzsDbhoIB87dqX%2FSZ346R3ZD73Trwr9uOdtVdriCStqzcEvLSZqXZ6rQtGTmbWeeL%2BQxtvoJbEMFVhN7RHyQq0nIAhyCSZrdiJa%2FECzLHaVogx81i5Efin23yLDanLwy6QBjC5nZTVBjqkAUnZFgKad%2BlJWZsBNc8qS87E2hfpHKneBPCOFexdbtSc1ZTYC7zMymVax8caayqijVjBZZkDeH%2B4%2Bqd6JnqGKEfyvHRxfT33joQvymDb36Bqk%2FRLK%2BtNOOlTiJmKB%2BOYH65ZwPRrXuCqz%2FAhGZuqulHqhkXs14393mLuiKwA%2FnDvLVpo6mKCSkkeVz0O9zsZcVfURXRjHbCOHTlZyiROwa0zM5nj&X-Amz-Signature=a6fefa60fd22eac323fbc7d370b6e9b02f8fb5b3060e3d436cec492c591f51fa&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466WJDDFEL3%2F20260912%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260912T094500Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEOn%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQC4rtapO5QBCGUJIu0bdgndLA6Qim1NzOH%2Ff8ieAgFi8wIhAJtCmyJTv7RF9%2Fhj%2BvMQcjqPTQw%2Fgoc5%2Fa4sAGnlfmLOKogECLL%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgzSRvVU%2B8FoivKCSdoq3AOC%2FWQqhShHRI8BbxDqXUCjH7GhS0eBHaRS7u3CgTKsNQV%2BIMkl8S1ynAfV%2Ft2HezyXYXfyJrEFJMjR3cNfqsFNEXE1AoUBONbSpatv51HtT96bcuFup5XLmSYKghCRDNTV4cP%2BlurHwUHIpdFdTuBmOo49N9opPHxiAdpNJ%2B%2Bpk0kGOq31f3BkBMp99n5j0LuLmejTRQCtBQx60J9AX9YZ1oIxSsnX%2B7m9CBnA43eZJEVEeI4gXLL7g%2F27I%2FZUn4SzKNVwUR19BO1sA1MiMWRDGIdhxihjMj0H6A2WCd36L6ZDLejTsToYwU6MNK6f2L%2Fu3MpvAdD4YcWd1wnACDTv6gLZS9cLz8DUi%2Fo1nLqTKfU50zAJxqXFJZ9C%2Fx2W6frOjeFFrjJWXd6yWioo%2Ft3XiocMYfFsCA6upicdUjpWlp9fHnPprvEL%2BZ59euH3Kl9LuOY9FGYaw4VWBQDsDnCXNp3s3fw2J%2BJNPsaN0STYy8dRhNnXpSqLHxIzsDbhoIB87dqX%2FSZ346R3ZD73Trwr9uOdtVdriCStqzcEvLSZqXZ6rQtGTmbWeeL%2BQxtvoJbEMFVhN7RHyQq0nIAhyCSZrdiJa%2FECzLHaVogx81i5Efin23yLDanLwy6QBjC5nZTVBjqkAUnZFgKad%2BlJWZsBNc8qS87E2hfpHKneBPCOFexdbtSc1ZTYC7zMymVax8caayqijVjBZZkDeH%2B4%2Bqd6JnqGKEfyvHRxfT33joQvymDb36Bqk%2FRLK%2BtNOOlTiJmKB%2BOYH65ZwPRrXuCqz%2FAhGZuqulHqhkXs14393mLuiKwA%2FnDvLVpo6mKCSkkeVz0O9zsZcVfURXRjHbCOHTlZyiROwa0zM5nj&X-Amz-Signature=75555934a6d8edb8f2f46d49240f7056cb2c4286cf9714aeaa8972447c4e3c18&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4662LZSCMEV%2F20260809%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260809T063634Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjELX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIBUx%2FRpQZ6x3SBw7iJ%2BZKyryMFuY6YX1jXFW2gB1i%2FKGAiEA8znMQuJiZUJ5EB%2BtLPr72lSX11voF2msswsYVSK8C7Iq%2FwMIfhAAGgw2Mzc0MjMxODM4MDUiDHQSYhzUasJYsvNmlCrcA1q1n33mXbnPCl%2FqQXz%2F77xXk0%2BU6kFzIgva2Nyf5I5hUB2MPZt3acnx1%2BE4sWf2sz5EyF%2BT4sm42H8XmwyHBSxZHJHMz1xTqOvA%2BNgrSVYswmYYQZxgxLyEFG%2FMf4Mh%2FxJOnB8bJOkSYUQQUYHDltOE%2BXNqoHuktbTVN5gT%2BCEJFCTuI3QyDU49Biv7NHrsjZJQAChddut%2FZ0SgjvThtDKawqrzbeI6stG0ihIBX3p70tdVZNHPRkv0DuuQXoL%2BAgmNN7PsCnZx5r2mgrCAGXaJv1hlI6nfvWYjTSYf33Rfw9f5YvfhEhXVTzdj%2BQecNIxo2YyTCzdIi%2Bo1DTS56bbJ8TLP4JIpb7lW1N9nDuhRLqIw99NKe%2B7D4Dl0zTNJHqL7TOFjQXh4JyE7xG6sVqpSOUU0fYsUuqiM1Or3kR5Udc0PxZL1142%2FVinqaAptrTV5VwJxRNPLVwBs4yz%2Bz6rlPGC6fVaq%2BWGZtOq2vUz2P0RBPE%2BwvaS7iN%2B5yLw1FNtRY94EjiqmjtFSR%2BHMjMZLPAQG%2B8SBnqGPHkjbl1GBpEPdYZuF9%2FbAPah0xaIjNeakpO2EQn7LXbDlsQoVLyswbFsjGLkGyf5h5ClMWtnM5FfP8s5nY%2FuoQDxEMPKB4NMGOqUBwvBmgiXd7%2BOGuJpSF4g40OZfZG4yLZ%2FSwbsIEXjqGwZooRwWNYRC0gEGWYSz2znDVIwzGFQf7QybG4pJIvq3TAWG%2FU2d4spWPVe0npSssG5gd%2B3Q3hT29Epu5TRnEGyVLAH9jcxQN8bHiNmRpMPDFPP2JJCJeGjvZhekpXU8kuEMTpAI39oMwPj9ztudeVG3H4y05lX61BB3cdF1r9tntp8%2BP0RZ&X-Amz-Signature=923bfc9e2d2d40b1153645e83b46a6d89e230b9c91b6214f8eab9eec824424dc&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4662LZSCMEV%2F20260809%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260809T063634Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjELX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIBUx%2FRpQZ6x3SBw7iJ%2BZKyryMFuY6YX1jXFW2gB1i%2FKGAiEA8znMQuJiZUJ5EB%2BtLPr72lSX11voF2msswsYVSK8C7Iq%2FwMIfhAAGgw2Mzc0MjMxODM4MDUiDHQSYhzUasJYsvNmlCrcA1q1n33mXbnPCl%2FqQXz%2F77xXk0%2BU6kFzIgva2Nyf5I5hUB2MPZt3acnx1%2BE4sWf2sz5EyF%2BT4sm42H8XmwyHBSxZHJHMz1xTqOvA%2BNgrSVYswmYYQZxgxLyEFG%2FMf4Mh%2FxJOnB8bJOkSYUQQUYHDltOE%2BXNqoHuktbTVN5gT%2BCEJFCTuI3QyDU49Biv7NHrsjZJQAChddut%2FZ0SgjvThtDKawqrzbeI6stG0ihIBX3p70tdVZNHPRkv0DuuQXoL%2BAgmNN7PsCnZx5r2mgrCAGXaJv1hlI6nfvWYjTSYf33Rfw9f5YvfhEhXVTzdj%2BQecNIxo2YyTCzdIi%2Bo1DTS56bbJ8TLP4JIpb7lW1N9nDuhRLqIw99NKe%2B7D4Dl0zTNJHqL7TOFjQXh4JyE7xG6sVqpSOUU0fYsUuqiM1Or3kR5Udc0PxZL1142%2FVinqaAptrTV5VwJxRNPLVwBs4yz%2Bz6rlPGC6fVaq%2BWGZtOq2vUz2P0RBPE%2BwvaS7iN%2B5yLw1FNtRY94EjiqmjtFSR%2BHMjMZLPAQG%2B8SBnqGPHkjbl1GBpEPdYZuF9%2FbAPah0xaIjNeakpO2EQn7LXbDlsQoVLyswbFsjGLkGyf5h5ClMWtnM5FfP8s5nY%2FuoQDxEMPKB4NMGOqUBwvBmgiXd7%2BOGuJpSF4g40OZfZG4yLZ%2FSwbsIEXjqGwZooRwWNYRC0gEGWYSz2znDVIwzGFQf7QybG4pJIvq3TAWG%2FU2d4spWPVe0npSssG5gd%2B3Q3hT29Epu5TRnEGyVLAH9jcxQN8bHiNmRpMPDFPP2JJCJeGjvZhekpXU8kuEMTpAI39oMwPj9ztudeVG3H4y05lX61BB3cdF1r9tntp8%2BP0RZ&X-Amz-Signature=364283799a605563b31bb37620e87c8f0cbd1ffb0963d07e1a951d1af8fdf914&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

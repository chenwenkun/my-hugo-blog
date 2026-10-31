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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466ZSLLLYZ4%2F20261031%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261031T112329Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEIP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQDkKpQzniNh%2Fci4B9tMqjvSzTQZhtgOZdyMERZ%2FUbns6gIgL4imsKlY9Rl7HdIvowcOJCD26N5ljXtGFqzCaKdSz0wq%2FwMISxAAGgw2Mzc0MjMxODM4MDUiDJmU%2BX86FGC3dT6UDyrcA3rVAAYqZ%2FkZsWEs4LCnxox2fW4oQkN4%2BCVp3XDYYhoehXLF6yR3H0CHtp61eFeRJzl9DcWH3%2Bkj8OeeTsRM%2BVyaG8BeDkhTlpW5D3OO0jdNzp9KJ6NNThe03%2F%2FTuD8klxYTU2UAXWBudWut0qVSL2D%2FAP43s6rPt2umdaI8E3fW5jjnONnPxeygM5qcoqSN1s7P%2FBWgUti1YtMkovvxcKZP4Wn0l%2Fd11l1uC6B2LTqrNIkZxYcrHoxjj8qqR5wpKMAgiN73v%2FHGlg4JggpDaiBHywl2F4yhTXNP98pS%2BzACV4109YbtDSNmMuVYo7f7lsSwBfrNwJKZUQ11aEkwbM4CcybNja26eG9SWcZB%2Fni1t9zu8u0Q6hxP3Z8D1LYIS%2BghuooQsIRxgaSs1y4XUyD822RM9%2BjSAE%2Bd2YjSRKWePZbNkUdnrZa7s8fLNbmxPDZnETXDNGqwcf3dExBX90tOdR52LWOz9r%2Bnn9vE3zVj0t6TmHop9rvLjpfyPmob%2Bt0n6%2B4FBbi3piLVS8PUlQ%2BvzKH0kCTw7ks%2F6bCvDFqa73eZaUSZ3lM7zEJ0RcnZRrwQ%2FQEDIYltW5gd3fFDdJ%2FQmMw1PqFf0zQpJNTdINeovxt9QaiS%2F1LkW1KMMKyKl9cGOqUBzWRCHm%2BqUo0VhsZGoIueP8DFU%2BraFVxKIs5pAKgTkfwpPvxxkVaMxu072Jp3QtAnz3CgNa9UgIlD0SAERbdmTkFUrPUWinIFlyfpEuI1p0S2exkCJRN7QkodysDhTfXk2HG7YoHu%2Fu%2BN36lticEiyAIfCBK4s8v3lcvbcPyr5PpJ8N0BPuBP5EVJkVA3z%2B8ZIkr%2BLKEXH5odgq87oqAtnZ1PIaSX&X-Amz-Signature=f9757e171dcf8664eec346575fcbd0f501cca392c1b4ae45479e86f5cfbd5b3d&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466ZSLLLYZ4%2F20261031%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261031T112329Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEIP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQDkKpQzniNh%2Fci4B9tMqjvSzTQZhtgOZdyMERZ%2FUbns6gIgL4imsKlY9Rl7HdIvowcOJCD26N5ljXtGFqzCaKdSz0wq%2FwMISxAAGgw2Mzc0MjMxODM4MDUiDJmU%2BX86FGC3dT6UDyrcA3rVAAYqZ%2FkZsWEs4LCnxox2fW4oQkN4%2BCVp3XDYYhoehXLF6yR3H0CHtp61eFeRJzl9DcWH3%2Bkj8OeeTsRM%2BVyaG8BeDkhTlpW5D3OO0jdNzp9KJ6NNThe03%2F%2FTuD8klxYTU2UAXWBudWut0qVSL2D%2FAP43s6rPt2umdaI8E3fW5jjnONnPxeygM5qcoqSN1s7P%2FBWgUti1YtMkovvxcKZP4Wn0l%2Fd11l1uC6B2LTqrNIkZxYcrHoxjj8qqR5wpKMAgiN73v%2FHGlg4JggpDaiBHywl2F4yhTXNP98pS%2BzACV4109YbtDSNmMuVYo7f7lsSwBfrNwJKZUQ11aEkwbM4CcybNja26eG9SWcZB%2Fni1t9zu8u0Q6hxP3Z8D1LYIS%2BghuooQsIRxgaSs1y4XUyD822RM9%2BjSAE%2Bd2YjSRKWePZbNkUdnrZa7s8fLNbmxPDZnETXDNGqwcf3dExBX90tOdR52LWOz9r%2Bnn9vE3zVj0t6TmHop9rvLjpfyPmob%2Bt0n6%2B4FBbi3piLVS8PUlQ%2BvzKH0kCTw7ks%2F6bCvDFqa73eZaUSZ3lM7zEJ0RcnZRrwQ%2FQEDIYltW5gd3fFDdJ%2FQmMw1PqFf0zQpJNTdINeovxt9QaiS%2F1LkW1KMMKyKl9cGOqUBzWRCHm%2BqUo0VhsZGoIueP8DFU%2BraFVxKIs5pAKgTkfwpPvxxkVaMxu072Jp3QtAnz3CgNa9UgIlD0SAERbdmTkFUrPUWinIFlyfpEuI1p0S2exkCJRN7QkodysDhTfXk2HG7YoHu%2Fu%2BN36lticEiyAIfCBK4s8v3lcvbcPyr5PpJ8N0BPuBP5EVJkVA3z%2B8ZIkr%2BLKEXH5odgq87oqAtnZ1PIaSX&X-Amz-Signature=0ab149505f0044bfa97dc306aa8654323b22fed0cb65f23dba2b15b7dc8e1e97&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

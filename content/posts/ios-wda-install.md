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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466SQR63T2A%2F20260913%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260913T151547Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEAcaCXVzLXdlc3QtMiJIMEYCIQCCRUXczcm3TBP7GyzQINBdcU57wAv6gGcyEmCC5mVMcgIhAMxuXuG9eZC2ARzW6nzWN5I1hj3frUOZLQVN2vQo3mgtKogECM%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgxRAnibkup9ApSgNCYq3ANhZpR9ILQ%2F3cVGheutNhYOiP4fKkm%2FWx%2BrhtrkygteFAPT58rThhZcKeGKgoRD4il9hz3t7bSWY6m6sW8wyY3RNJcgVjEKoF9LSVKhzV4ytwcQpBjdYhD4xYrkFGB1WN6NAuPkpUGKYWnjkSiKehyq5QJvaicXPRiOLJ7wM9TWTZmhzQoFAfKil5MjkrgnCfV5EklguNREQyLD9IxOkg5G52lJ3x8h6CycKx%2Bdrq8BrA483q8UUG61n1HTnjcGLwLOl9zWA3PpgPWAGNRnqvW8e0gDgyb9YvISqpqQXuIUtJRq1U0q%2Bc4Pgfe90mh2mhIkZ9SNzVZ5sL2ffnSiuHxBFh5W2AaZbxfGzU5noc6LMQViCJn13nyh36E5P5CfoVOc96siVkFru%2Bqbm0SmXbxT6EYsRc88aS7bcy22KqGw2UU1MdOtchDlEczS%2BmY%2BivLnoUM4B4AKaDaASFvAIZzxllkMPjx%2FZ%2FIzXCXYyP%2BoCK55lmdxw%2Bje7iuTfUCfGifdSmg4q3eKRBt7dEjzCPTM%2BTt9BbIwSuQVXNIy5c37uFzJYOzmYz21fblquJNc5QLlUlO0Dvqh32kmNDFn0UuBj%2BnkSAs9ctGOkSqeJDV5jSyBkas1z4dkY64VVjCW55rVBjqkAZTRuz4GFUR8TsTAewtjstUhZdbPR4XzKzm0xENVYRQ98qGeBK6ykAkhKWHUhn6zy%2Fiy0Psu8s7CzS%2B7Zm46xM9caKz51At20%2Fd3%2BY%2BtrLNJr6cAwD5v3MgnoHJ0bX9vTczn%2BoSSbvaAzzuszMV0W7Wv6mIf8BmLw0BE%2BGeXURb0u6jRsrfJF8L9rFB0cgJtsRMBHAlm6GkUoXAa9JVG8JGo37TX&X-Amz-Signature=46e4e7afff8592f72ca92516373084f06ae4f1b7426d466139b3abcdd9589806&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466SQR63T2A%2F20260913%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260913T151547Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEAcaCXVzLXdlc3QtMiJIMEYCIQCCRUXczcm3TBP7GyzQINBdcU57wAv6gGcyEmCC5mVMcgIhAMxuXuG9eZC2ARzW6nzWN5I1hj3frUOZLQVN2vQo3mgtKogECM%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgxRAnibkup9ApSgNCYq3ANhZpR9ILQ%2F3cVGheutNhYOiP4fKkm%2FWx%2BrhtrkygteFAPT58rThhZcKeGKgoRD4il9hz3t7bSWY6m6sW8wyY3RNJcgVjEKoF9LSVKhzV4ytwcQpBjdYhD4xYrkFGB1WN6NAuPkpUGKYWnjkSiKehyq5QJvaicXPRiOLJ7wM9TWTZmhzQoFAfKil5MjkrgnCfV5EklguNREQyLD9IxOkg5G52lJ3x8h6CycKx%2Bdrq8BrA483q8UUG61n1HTnjcGLwLOl9zWA3PpgPWAGNRnqvW8e0gDgyb9YvISqpqQXuIUtJRq1U0q%2Bc4Pgfe90mh2mhIkZ9SNzVZ5sL2ffnSiuHxBFh5W2AaZbxfGzU5noc6LMQViCJn13nyh36E5P5CfoVOc96siVkFru%2Bqbm0SmXbxT6EYsRc88aS7bcy22KqGw2UU1MdOtchDlEczS%2BmY%2BivLnoUM4B4AKaDaASFvAIZzxllkMPjx%2FZ%2FIzXCXYyP%2BoCK55lmdxw%2Bje7iuTfUCfGifdSmg4q3eKRBt7dEjzCPTM%2BTt9BbIwSuQVXNIy5c37uFzJYOzmYz21fblquJNc5QLlUlO0Dvqh32kmNDFn0UuBj%2BnkSAs9ctGOkSqeJDV5jSyBkas1z4dkY64VVjCW55rVBjqkAZTRuz4GFUR8TsTAewtjstUhZdbPR4XzKzm0xENVYRQ98qGeBK6ykAkhKWHUhn6zy%2Fiy0Psu8s7CzS%2B7Zm46xM9caKz51At20%2Fd3%2BY%2BtrLNJr6cAwD5v3MgnoHJ0bX9vTczn%2BoSSbvaAzzuszMV0W7Wv6mIf8BmLw0BE%2BGeXURb0u6jRsrfJF8L9rFB0cgJtsRMBHAlm6GkUoXAa9JVG8JGo37TX&X-Amz-Signature=d7c672a940b3ea3a4b13a46931fb655eb44e305b7c45fa0f2dc4faa2f458e929&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

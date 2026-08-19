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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466YJ6W2RNQ%2F20260819%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260819T181734Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjELL%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCwiNmf4awrG0VQb8pG%2F%2BLEof%2Bh2VxMWncsCRRYTN0%2BVwIhAIvfMwyV6Gdp6X%2ByARjTTunY6%2FL03RMO%2B0s6K0kbvkMXKv8DCHsQABoMNjM3NDIzMTgzODA1IgzZloDuHXorri5Q548q3ANGfG3UIOH%2Bpkimqonk%2FLWU4bGxcEl%2B6uZKHg3IAABFTLbxvz2jj4eUb7sGbPdbxlc%2Foa2S3TchvlkgbtL9KG2%2FWPnCaaWU6OU%2FUR8kXdxZTRtD96UIDEQzzCN92vXozEt%2FnTS0YXS1bYxmb90FFnv%2BzMwCET6eDoIRw0v1dtFtHEQNlHSEVG%2BozmF3g8AE5eTp7UG4Xov0xSt24bIS62p%2FbrXWsxnP2zHVDu3hmU78aE2ho16OUTF1is59KaL51NjOe31OFOnmqFtnvlQmmcVm9qNAnK60tv2jeKPJCrtA4Dv7B9FvnhGhYLedanhvVpWbjEJgNeNwKWlLDBOXAMLX%2FznX5v1HD7OjoJ4J2J0UmjQXhUceZAuUaOXemBnMDBwBEw1fqh96pUJ0Sfk6A9sOxXsLw5am3Ny6ZZ%2BO0AbsCTKT%2B4sf4B4XfmXs20hKj1mWuQjEUKlhE0R0sVVM5LlfHaXWkWDBP4NZ9IRQBHmiTV9eWhUohlIj9NPoPnJAn4cvm4K3sX1fcPf5Dt%2FghP5fDMI7B3fzh0NcgJ0rsxNwH0Dx9K954YyjyPWOa5DQjrVPPnYYqFHKjOHQCX8kTc3ZFiNIJSYpRkYHUi9sRkckCLBvz7OnYUICAXqnIzCL05fUBjqkAf%2BypWsxumJrlPG6LqchLgCfu6yE%2BKs%2FzN%2FvpVqIMlFiYU67z5lWmf%2BtoR1D9Ca4HiEeEKKP%2FP6x61gW0W4TqLI1D1cvMVpyw3FPVZWNN5fjFesAr1bI0Is2dRLR8Zr%2FKx0vkm6HSUrj9w1IusLsLtdALJYv4J0driGeGeIMV4F3lenPNBbCXpowuoCmx80GwJ%2FY3M1PmL8%2F9YYw%2Bul5d1CFnVHM&X-Amz-Signature=966c0b71c23a3bdd09f590a6d1a37219023f47246c544529bbb1ba8d7482b83a&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466YJ6W2RNQ%2F20260819%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260819T181734Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjELL%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCwiNmf4awrG0VQb8pG%2F%2BLEof%2Bh2VxMWncsCRRYTN0%2BVwIhAIvfMwyV6Gdp6X%2ByARjTTunY6%2FL03RMO%2B0s6K0kbvkMXKv8DCHsQABoMNjM3NDIzMTgzODA1IgzZloDuHXorri5Q548q3ANGfG3UIOH%2Bpkimqonk%2FLWU4bGxcEl%2B6uZKHg3IAABFTLbxvz2jj4eUb7sGbPdbxlc%2Foa2S3TchvlkgbtL9KG2%2FWPnCaaWU6OU%2FUR8kXdxZTRtD96UIDEQzzCN92vXozEt%2FnTS0YXS1bYxmb90FFnv%2BzMwCET6eDoIRw0v1dtFtHEQNlHSEVG%2BozmF3g8AE5eTp7UG4Xov0xSt24bIS62p%2FbrXWsxnP2zHVDu3hmU78aE2ho16OUTF1is59KaL51NjOe31OFOnmqFtnvlQmmcVm9qNAnK60tv2jeKPJCrtA4Dv7B9FvnhGhYLedanhvVpWbjEJgNeNwKWlLDBOXAMLX%2FznX5v1HD7OjoJ4J2J0UmjQXhUceZAuUaOXemBnMDBwBEw1fqh96pUJ0Sfk6A9sOxXsLw5am3Ny6ZZ%2BO0AbsCTKT%2B4sf4B4XfmXs20hKj1mWuQjEUKlhE0R0sVVM5LlfHaXWkWDBP4NZ9IRQBHmiTV9eWhUohlIj9NPoPnJAn4cvm4K3sX1fcPf5Dt%2FghP5fDMI7B3fzh0NcgJ0rsxNwH0Dx9K954YyjyPWOa5DQjrVPPnYYqFHKjOHQCX8kTc3ZFiNIJSYpRkYHUi9sRkckCLBvz7OnYUICAXqnIzCL05fUBjqkAf%2BypWsxumJrlPG6LqchLgCfu6yE%2BKs%2FzN%2FvpVqIMlFiYU67z5lWmf%2BtoR1D9Ca4HiEeEKKP%2FP6x61gW0W4TqLI1D1cvMVpyw3FPVZWNN5fjFesAr1bI0Is2dRLR8Zr%2FKx0vkm6HSUrj9w1IusLsLtdALJYv4J0driGeGeIMV4F3lenPNBbCXpowuoCmx80GwJ%2FY3M1PmL8%2F9YYw%2Bul5d1CFnVHM&X-Amz-Signature=c07179a768a4657f86992c1381e54a1a05666989465b6f0faf33d69a6815962b&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466XKNDEGHC%2F20261123%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261123T164704Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjELD%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQC2WBZClYUlgzYi4gVqm5M7aAL6boJrw2EWyTqtFEl8vAIhAKaERLMD9ztQNNBvcaFUFo3PzSQekXOyZj%2FzegtqoIafKv8DCHgQABoMNjM3NDIzMTgzODA1Igxib0KKXpHLmwaxAC0q3ANj3GNhBMyukGFTCzPgsKldAzo91XnkuPeUXMsGc7VNGPlzGJRaPxw21%2BUlkAFMbVXoYC2NigvSd4eEYEkH0n3UMbDyMFW2Q8WWMNEQWWzYDmYXfduNU0mZvM82k3%2BY7I1pJFuEUgB3LTt9gMOuC9UjVD%2BsIkjRmtClTUqNN%2Bj7zTTFZrW8o%2FLAAFb7gbz8zXdEv3VaSRF5FRIaiR18Q59VS%2BtzxGSyecf9z8vK8ctHZZFOQYojNg%2BiSafRyo2SqIauAxCs2os%2F95ydeZqPkSkvEuXfJGEvxxLCeiirUkSEq4nKITCzD0kf9aF3qQKh0seAspvYNLvt13Tugs8XB5qtFeZDjScPYCMI2EgL898mruZThMN0zDNXzHLNBpjWzfEOqU%2BLfeVLBEKdS4w2n98mG6sf%2BfMy90D61ZH5Sa69HaaNuXtD1WHgN6XiACho4bAPXdvdjrAZewp2QnqqQr8NTpsEAjqMFStha%2Fhh8MVA4qHRmeTyHKSc6SBD7mzkKGI24ty7bomGCW%2F0EUZ39%2Bt91hLJ7BMzvUYxhSUc%2BkGR0BoGF4PRit1xlYCagXXsKh9I3wZ9hUTs%2FIT8lM%2BhNtMhXC0tJMSSxXPL%2FAz3J5aIYAJKTxcLpfQ9PxPc6DDzspHYBjqkARz2Uo%2Fau9xYtkC0pUcAF6EkKwvroa2L05IQDi7NbOmITcNG%2FdrvUDz%2FpDTqP%2F6eFAqW%2F7DKUH21N7A2SxbDfy7XEjOCAKjKK6JPH3veWFxIK2d1luk%2BxgoXxXKcFWkQAdDnyy1oGGGZkMwvkFwYt5P%2FyiuKDV1Ko00HbfxpaerhbAZgYswdeKDqXyKlO48CDGPkLVozk4S0pGMQOpeu3uKAKesq&X-Amz-Signature=48f66d5a0d4e0aff81a97333e6ed8173aec4576a3db78de8c8fa0e6785fc15ed&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466XKNDEGHC%2F20261123%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261123T164704Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjELD%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQC2WBZClYUlgzYi4gVqm5M7aAL6boJrw2EWyTqtFEl8vAIhAKaERLMD9ztQNNBvcaFUFo3PzSQekXOyZj%2FzegtqoIafKv8DCHgQABoMNjM3NDIzMTgzODA1Igxib0KKXpHLmwaxAC0q3ANj3GNhBMyukGFTCzPgsKldAzo91XnkuPeUXMsGc7VNGPlzGJRaPxw21%2BUlkAFMbVXoYC2NigvSd4eEYEkH0n3UMbDyMFW2Q8WWMNEQWWzYDmYXfduNU0mZvM82k3%2BY7I1pJFuEUgB3LTt9gMOuC9UjVD%2BsIkjRmtClTUqNN%2Bj7zTTFZrW8o%2FLAAFb7gbz8zXdEv3VaSRF5FRIaiR18Q59VS%2BtzxGSyecf9z8vK8ctHZZFOQYojNg%2BiSafRyo2SqIauAxCs2os%2F95ydeZqPkSkvEuXfJGEvxxLCeiirUkSEq4nKITCzD0kf9aF3qQKh0seAspvYNLvt13Tugs8XB5qtFeZDjScPYCMI2EgL898mruZThMN0zDNXzHLNBpjWzfEOqU%2BLfeVLBEKdS4w2n98mG6sf%2BfMy90D61ZH5Sa69HaaNuXtD1WHgN6XiACho4bAPXdvdjrAZewp2QnqqQr8NTpsEAjqMFStha%2Fhh8MVA4qHRmeTyHKSc6SBD7mzkKGI24ty7bomGCW%2F0EUZ39%2Bt91hLJ7BMzvUYxhSUc%2BkGR0BoGF4PRit1xlYCagXXsKh9I3wZ9hUTs%2FIT8lM%2BhNtMhXC0tJMSSxXPL%2FAz3J5aIYAJKTxcLpfQ9PxPc6DDzspHYBjqkARz2Uo%2Fau9xYtkC0pUcAF6EkKwvroa2L05IQDi7NbOmITcNG%2FdrvUDz%2FpDTqP%2F6eFAqW%2F7DKUH21N7A2SxbDfy7XEjOCAKjKK6JPH3veWFxIK2d1luk%2BxgoXxXKcFWkQAdDnyy1oGGGZkMwvkFwYt5P%2FyiuKDV1Ko00HbfxpaerhbAZgYswdeKDqXyKlO48CDGPkLVozk4S0pGMQOpeu3uKAKesq&X-Amz-Signature=74861b8ee998a19c258c1fc7963b4bdeadb8600983d738da7af1db0efc4a3d30&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

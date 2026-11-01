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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466SX6SI2TE%2F20261101%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261101T121552Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJr%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQDyYF%2BDA0q54ktUj2Fp3B83rMnf8dp2nw1LfLZLTVTlQgIhAIIxKk5FK81cu51TwSe2N6znCKsXeCgSYL0K7FqYf9H1Kv8DCGMQABoMNjM3NDIzMTgzODA1IgzbaOCBhVUiYIcQ7ZMq3AOUuqwYCjw8%2BDvA0gKScNR%2FSokRONXltIF1SyU%2F1wavIuqJu2lUHC8CixYYT32Xkv6CY6SmA8PgR1t3CfYceJOwzcx8o7JoerzprLqS67yLWktxrFCoCVVT%2FG218ce5FNuwvLJS1eILP8l3ZexRqFf0XUWR7lIpker06zHH1NjSxTCcCzjCZBTo2WH%2Fz5SOPkikt4Lgq2i%2FHabQCcaIGPXTPY2Vb11%2FVrC7hZoq8MGMjro%2F8URhFSnzu%2BHu2Zm4rtIqWk8hVs5dO%2FcMuZ8YCALA1WhjdaOBbZIKK0VkV4qhw%2BsOCIJUE%2FV4Gr9WcgkjRLX6St8kOm7T2hGChYEiXJQatu5TttHStv6roiiM5dYwgC5OuQ4y5eG2JAJ2YtMxGgc15DWHIFl3uauvKf0SshO90yXKie%2BLfpGHn77xeun0%2BslO%2BzFjeGHJoITDQSQAdKQs2AYvDpfHVQR055%2BeMfJUWWONsbIgjPt%2BELCBYhPdwOm7%2FC7FRwJ3KYvpC75fXNKk3T%2FZdMEXZYD8vfVL8Ir8qCazNIUjrrmrT%2FnYQ0gq2%2BcAlEwpAxqYT%2Buw3I%2BNcpIg%2FTw5UI%2B%2FUs9LS3Hi%2FH2n7EcluasINk6B5ItBikvMDXs8OOjlfPYN%2Fm6SETCHk5zXBjqkAZHAsDqv8eIb5sIkd1Za9sMDE8nyfGG7QGmxPIelJRHXILVP5kA4ojDhkDJPeiLRZv9Ugrs33W2agE6PyYZLDPfIvsFU1u2kKAlSNGzEzKsM5USCQIX9zGM2adxvBu5z7%2BCrwts2U1mb%2Fp4r%2B1sMhyVfnZguBP%2F2hIfkyotOth2TL%2FKqpE22F8DbRhN%2BhMAy0BLMMRHj%2FKQRzNcfPLAWhjKX%2FiBi&X-Amz-Signature=f96c5d7ca18c66b34ae6325a826d524b4eaee646ff602f6b1edb6554cfffcf52&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466SX6SI2TE%2F20261101%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261101T121552Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJr%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQDyYF%2BDA0q54ktUj2Fp3B83rMnf8dp2nw1LfLZLTVTlQgIhAIIxKk5FK81cu51TwSe2N6znCKsXeCgSYL0K7FqYf9H1Kv8DCGMQABoMNjM3NDIzMTgzODA1IgzbaOCBhVUiYIcQ7ZMq3AOUuqwYCjw8%2BDvA0gKScNR%2FSokRONXltIF1SyU%2F1wavIuqJu2lUHC8CixYYT32Xkv6CY6SmA8PgR1t3CfYceJOwzcx8o7JoerzprLqS67yLWktxrFCoCVVT%2FG218ce5FNuwvLJS1eILP8l3ZexRqFf0XUWR7lIpker06zHH1NjSxTCcCzjCZBTo2WH%2Fz5SOPkikt4Lgq2i%2FHabQCcaIGPXTPY2Vb11%2FVrC7hZoq8MGMjro%2F8URhFSnzu%2BHu2Zm4rtIqWk8hVs5dO%2FcMuZ8YCALA1WhjdaOBbZIKK0VkV4qhw%2BsOCIJUE%2FV4Gr9WcgkjRLX6St8kOm7T2hGChYEiXJQatu5TttHStv6roiiM5dYwgC5OuQ4y5eG2JAJ2YtMxGgc15DWHIFl3uauvKf0SshO90yXKie%2BLfpGHn77xeun0%2BslO%2BzFjeGHJoITDQSQAdKQs2AYvDpfHVQR055%2BeMfJUWWONsbIgjPt%2BELCBYhPdwOm7%2FC7FRwJ3KYvpC75fXNKk3T%2FZdMEXZYD8vfVL8Ir8qCazNIUjrrmrT%2FnYQ0gq2%2BcAlEwpAxqYT%2Buw3I%2BNcpIg%2FTw5UI%2B%2FUs9LS3Hi%2FH2n7EcluasINk6B5ItBikvMDXs8OOjlfPYN%2Fm6SETCHk5zXBjqkAZHAsDqv8eIb5sIkd1Za9sMDE8nyfGG7QGmxPIelJRHXILVP5kA4ojDhkDJPeiLRZv9Ugrs33W2agE6PyYZLDPfIvsFU1u2kKAlSNGzEzKsM5USCQIX9zGM2adxvBu5z7%2BCrwts2U1mb%2Fp4r%2B1sMhyVfnZguBP%2F2hIfkyotOth2TL%2FKqpE22F8DbRhN%2BhMAy0BLMMRHj%2FKQRzNcfPLAWhjKX%2FiBi&X-Amz-Signature=b2bdfdd366076c76e35f7b5af614187275885838b47787af7037b434ce45ec39&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

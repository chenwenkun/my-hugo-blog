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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB46642IUSBSV%2F20260917%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260917T103657Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEGEaCXVzLXdlc3QtMiJHMEUCIBfTP0ptJ2Q8jouDE66AobD%2BFtS9oJ7e%2FavcmCkr5nUWAiEAwTYTtTt9%2BIB4RYjtMsh639rmtTNO6GKrdA0uD%2FsVtvAq%2FwMIKhAAGgw2Mzc0MjMxODM4MDUiDIUDs1kfChfueJYJHCrcA0MilpTZTkJacos7%2FQZ0GXUVUUFXjmi0ExksjGdYPoZvMy4re4avekIZqhLhO5OxhkvSIHwK1jrNz6zM8ltYmaQSLhQG1AEMrN0589JTuCSkr6Y1bE1ZzMrufKpHtmXC7tg8F26Kp19uwHZBe56WUmsNzZuOJzQOXGBQ3ari8m2J5bdMlfDU80TOJPsaBg0iX%2BQbd2bcy2nWKUM30ycllEsOp4eTpzXJEsPvNX0rJHh1kjCIkdhKjPEKuKmQIFXlsFndNWi016zQsYGajSdECC4HGchLWO%2BWQa10mwAfCoTdKDgX5cp9l%2FzggDZFNTRPXHhadZ1zRHkFn1nLP3MC7QJUAz%2B4w3yDzFz8PhBbvwHO7V0Gn6Kj%2Ba9%2BWK5PpxUM4n74eDHrC2%2BLNasdAMJf8bFptOeAfnWhEg692IxcG%2F8mWpYY2ZtifsaOARTyRCpZv0cPo0Wym%2FVJD9VOEFaIbXePpranr4Z96o5BArktMNu5PgLQKhT9SSRLOfRzwrzAgL1GZ7gOoxTsTlHVnt8VT99%2FIh%2BcTOXul8ANIYAg1ZuqA8390FX3UhqOb%2Fufag8JLoRNJXUbvTeoWEarp%2BUVt%2BnEZEeZxXnkjaurbpwGuEKHWaYtBcG52pkPbg8XMNbertUGOqUBcd00n5JeXH4wmTRlo9jmoii%2FoaroLhE9uw8DVoJlA%2F2zxYCe%2FT0i3sjAhmRMYfHNR2j29onB6Y%2FCbls7faxieg8zwCWtkveebwihOzzHRoywDyAo05pAPXulY7r%2FuK3q5l1KBGI7UZRA4VlMeYKKRLle99ZkfPcSAGRdWrX3rfvFGH5HXtPh9Pr7LE%2B6clsNGp3DCPEAEFM%2B3zHCqHqbE2XA3uDU&X-Amz-Signature=93e6d212336a7a606cec5ca9b35dcdf3167d23bcb9c2cb2827d305f28773b130&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB46642IUSBSV%2F20260917%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260917T103657Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEGEaCXVzLXdlc3QtMiJHMEUCIBfTP0ptJ2Q8jouDE66AobD%2BFtS9oJ7e%2FavcmCkr5nUWAiEAwTYTtTt9%2BIB4RYjtMsh639rmtTNO6GKrdA0uD%2FsVtvAq%2FwMIKhAAGgw2Mzc0MjMxODM4MDUiDIUDs1kfChfueJYJHCrcA0MilpTZTkJacos7%2FQZ0GXUVUUFXjmi0ExksjGdYPoZvMy4re4avekIZqhLhO5OxhkvSIHwK1jrNz6zM8ltYmaQSLhQG1AEMrN0589JTuCSkr6Y1bE1ZzMrufKpHtmXC7tg8F26Kp19uwHZBe56WUmsNzZuOJzQOXGBQ3ari8m2J5bdMlfDU80TOJPsaBg0iX%2BQbd2bcy2nWKUM30ycllEsOp4eTpzXJEsPvNX0rJHh1kjCIkdhKjPEKuKmQIFXlsFndNWi016zQsYGajSdECC4HGchLWO%2BWQa10mwAfCoTdKDgX5cp9l%2FzggDZFNTRPXHhadZ1zRHkFn1nLP3MC7QJUAz%2B4w3yDzFz8PhBbvwHO7V0Gn6Kj%2Ba9%2BWK5PpxUM4n74eDHrC2%2BLNasdAMJf8bFptOeAfnWhEg692IxcG%2F8mWpYY2ZtifsaOARTyRCpZv0cPo0Wym%2FVJD9VOEFaIbXePpranr4Z96o5BArktMNu5PgLQKhT9SSRLOfRzwrzAgL1GZ7gOoxTsTlHVnt8VT99%2FIh%2BcTOXul8ANIYAg1ZuqA8390FX3UhqOb%2Fufag8JLoRNJXUbvTeoWEarp%2BUVt%2BnEZEeZxXnkjaurbpwGuEKHWaYtBcG52pkPbg8XMNbertUGOqUBcd00n5JeXH4wmTRlo9jmoii%2FoaroLhE9uw8DVoJlA%2F2zxYCe%2FT0i3sjAhmRMYfHNR2j29onB6Y%2FCbls7faxieg8zwCWtkveebwihOzzHRoywDyAo05pAPXulY7r%2FuK3q5l1KBGI7UZRA4VlMeYKKRLle99ZkfPcSAGRdWrX3rfvFGH5HXtPh9Pr7LE%2B6clsNGp3DCPEAEFM%2B3zHCqHqbE2XA3uDU&X-Amz-Signature=12a6ef95ffc2bff4cca5c48efb039bf44262691ffa05907cf84118a332236566&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

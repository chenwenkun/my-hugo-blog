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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4666IE24Z4P%2F20261009%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261009T121507Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEHMaCXVzLXdlc3QtMiJIMEYCIQCF%2BzTqfb5Yf97Rux5Uo1nB9vHIMq0IX1HoQVJxZhPYrAIhAONqgvFluLsIg%2B2M2sE%2FoYNqEKHmh8Zn%2BOi3Om4hWH9WKv8DCDwQABoMNjM3NDIzMTgzODA1IgyboawyUP4WDGQhK34q3AMxictUH72dswR77bL8mjui1jS6dAqAd8HFKblmhOFbNlnltG4%2B6OTs%2B9jh6HFrNEdJ0m%2Bj1pGYRbkS65d6EYcdgluBPTRQSbs41f0xVtFge2%2BjMobo3LcF32EniOd3OTUBMnoNwMC4KS4mkV0s4RLtfnMrzmYUJsbDJpNQ8hugCxGdpC8SDMBWORs8Mg6e6v5IUuJZcf%2BQtePnkHzFRbX9%2BEB3AeyEZ7jf57y%2FOM4UPISHJQKVkZp%2FOaKdlCrMmUHrMWMdUSsBjDH9gkcCnkmGq4nUF%2FX4XWVxKWJLLuj3GFINirD%2B1sAK5YuQQoA%2BfRtODghvGvf4sH9y5ITAdZ8nGfuSR546u%2BkuQcHxmcq0EIpLWdyHJZEzSkEUzbZq7rCNaaqJoHo1d2xA30jvsmXF3TgUb6dTZRwYxrPbK45e3lhuHQt9RdwqSYM6xh8apDJXuDaI%2FdaOZ8nYHL7RUEXPl5cpd4BZAKeMoGCmrLpjWl7iDQTZRDH%2BbbaW6oItsiBWnfy7%2FulHRR7jO7P4%2Fi6cTPw7ebaWiaQE4sHB3UAj%2B4P9HKnFCxxRCncHV%2B7%2Fs%2BCuBWX4xx71P5bw2IMS5vCbmpDw3NMcS1zoObp6Yz2%2Fa25MptQ62b62Os09PTDng6PWBjqkAR22KcPX6iM20tuTGdCIKzGGtD3TImwBySd8Wl6KTyrzwkK4OXCEUGh2%2Bp4e0IpXCxiqFi9FlWh04yVsPP7pVzHoT6vDxfIZalWgKcoGN%2FO3oE9u87SwLY5oWYQQDdhMLz7TFvE0wQ6TwPuw%2FiKMeK97Nq8Q2R06gAwwuXQGUFDrbpbAC5%2B5ER3%2FaiX7A0LIsppUUKAltmw9rE20cdVsCjAVPZDP&X-Amz-Signature=7bb748d5665cc2a8e43d4f7a904b3e1faf83c5bad30f088d631145636b15d898&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4666IE24Z4P%2F20261009%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261009T121508Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEHMaCXVzLXdlc3QtMiJIMEYCIQCF%2BzTqfb5Yf97Rux5Uo1nB9vHIMq0IX1HoQVJxZhPYrAIhAONqgvFluLsIg%2B2M2sE%2FoYNqEKHmh8Zn%2BOi3Om4hWH9WKv8DCDwQABoMNjM3NDIzMTgzODA1IgyboawyUP4WDGQhK34q3AMxictUH72dswR77bL8mjui1jS6dAqAd8HFKblmhOFbNlnltG4%2B6OTs%2B9jh6HFrNEdJ0m%2Bj1pGYRbkS65d6EYcdgluBPTRQSbs41f0xVtFge2%2BjMobo3LcF32EniOd3OTUBMnoNwMC4KS4mkV0s4RLtfnMrzmYUJsbDJpNQ8hugCxGdpC8SDMBWORs8Mg6e6v5IUuJZcf%2BQtePnkHzFRbX9%2BEB3AeyEZ7jf57y%2FOM4UPISHJQKVkZp%2FOaKdlCrMmUHrMWMdUSsBjDH9gkcCnkmGq4nUF%2FX4XWVxKWJLLuj3GFINirD%2B1sAK5YuQQoA%2BfRtODghvGvf4sH9y5ITAdZ8nGfuSR546u%2BkuQcHxmcq0EIpLWdyHJZEzSkEUzbZq7rCNaaqJoHo1d2xA30jvsmXF3TgUb6dTZRwYxrPbK45e3lhuHQt9RdwqSYM6xh8apDJXuDaI%2FdaOZ8nYHL7RUEXPl5cpd4BZAKeMoGCmrLpjWl7iDQTZRDH%2BbbaW6oItsiBWnfy7%2FulHRR7jO7P4%2Fi6cTPw7ebaWiaQE4sHB3UAj%2B4P9HKnFCxxRCncHV%2B7%2Fs%2BCuBWX4xx71P5bw2IMS5vCbmpDw3NMcS1zoObp6Yz2%2Fa25MptQ62b62Os09PTDng6PWBjqkAR22KcPX6iM20tuTGdCIKzGGtD3TImwBySd8Wl6KTyrzwkK4OXCEUGh2%2Bp4e0IpXCxiqFi9FlWh04yVsPP7pVzHoT6vDxfIZalWgKcoGN%2FO3oE9u87SwLY5oWYQQDdhMLz7TFvE0wQ6TwPuw%2FiKMeK97Nq8Q2R06gAwwuXQGUFDrbpbAC5%2B5ER3%2FaiX7A0LIsppUUKAltmw9rE20cdVsCjAVPZDP&X-Amz-Signature=25ac642d6426f19db698d33052970d8fa9a79b54cbdc516c1c103756e5cccc1a&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466247YJBRU%2F20261027%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261027T165930Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjECkaCXVzLXdlc3QtMiJIMEYCIQCDFWCj5u9eCuB%2FHu%2BYrHsIaSbh3pP1kQYGZK1bPDrcPQIhAM%2BzR%2Bdm2%2FExmNMDFdJkB6IrxgUtsuA%2FSbWISXt4Mhl9KogECPL%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1Igx6XfDztgEX148SNdAq3ANVC2z5DdXn3ySYnpHJ8NN69xkueFSAmgBRn4Sbgbg7WPCJWRyvSmaJgal4ajgyujSH3Ud11yu1oRoumTghp2bwPZV3zcsOT2QGl%2ByGAoLdb08pvzW2YqK3bJ8qMJ2SFV2Qx3YB1m92IcS6sGSbT5V1%2B4aIMbKgh3k%2BsgzhzsT0Hx8xfvjBdqObmRhP4JRdkZeTV7druwRDMAD3IIjJu%2F94k7k5Br7j9ncg5ENwq53p%2FSKDR40CL%2BjDURux%2Fze%2FWO2YWtiv9ItwSCu29Vbq6l47TzHeXZS9ifbprLkUGS1%2BXLeeiPyADZlAKsNba4GEVIh%2B9VLocLL1HTz6IXHBZrH%2BvMXDFXMH%2BMgZpog6vyXe%2FhHFOBoMw0fPYjfRaxIdS5LpjBh2AV%2FEgVUPRjIJLCHpbeZC92%2Bmm3kXMD0K2wPXMghboIQd4TneU23oMYEba3OdV04OKRQh%2BwK70PUZpzAENqhNnlmAFyFDqxK9w82xXe%2FQqId9IHRz6dVlZlYiMg545HB5n2A1kP2hr5NepDukKiKqqT5Pj0liYM3CX5T%2ByT1DDzJKlnZAf5fOpQ%2BeFwZS4l0APtFYJZjtdNc8aFEDUK2W3VrlBszblTOnSbz7z%2FcnI5c4qtNr%2BeZzfjDIooPXBjqkASaiamogHmswE%2BnjAKP%2FVGbKv3o4U5A%2F4LfRj1qVjTW1YJGDeQDgwtlZhTS2cevMcY3OMVpPIHBH8US3TVc7ybf4ySQrTWg%2F7r7m22oArXB7cIwrTxXo5HurdE11qUE3lj%2FP%2BSc%2B%2FVEL%2Fc2au%2B3zKvvZogp1JgAeBiR7as10AcTK4N2cxBDzRZ8F0V%2FukzKf6Lm7j6N2fp04%2Fev2N2NWL0H6zsXA&X-Amz-Signature=c41f6811f537f87deb4c477ceeb1362689fddcaa08886c6e6fa54fc7b4493a74&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466247YJBRU%2F20261027%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261027T165930Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjECkaCXVzLXdlc3QtMiJIMEYCIQCDFWCj5u9eCuB%2FHu%2BYrHsIaSbh3pP1kQYGZK1bPDrcPQIhAM%2BzR%2Bdm2%2FExmNMDFdJkB6IrxgUtsuA%2FSbWISXt4Mhl9KogECPL%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1Igx6XfDztgEX148SNdAq3ANVC2z5DdXn3ySYnpHJ8NN69xkueFSAmgBRn4Sbgbg7WPCJWRyvSmaJgal4ajgyujSH3Ud11yu1oRoumTghp2bwPZV3zcsOT2QGl%2ByGAoLdb08pvzW2YqK3bJ8qMJ2SFV2Qx3YB1m92IcS6sGSbT5V1%2B4aIMbKgh3k%2BsgzhzsT0Hx8xfvjBdqObmRhP4JRdkZeTV7druwRDMAD3IIjJu%2F94k7k5Br7j9ncg5ENwq53p%2FSKDR40CL%2BjDURux%2Fze%2FWO2YWtiv9ItwSCu29Vbq6l47TzHeXZS9ifbprLkUGS1%2BXLeeiPyADZlAKsNba4GEVIh%2B9VLocLL1HTz6IXHBZrH%2BvMXDFXMH%2BMgZpog6vyXe%2FhHFOBoMw0fPYjfRaxIdS5LpjBh2AV%2FEgVUPRjIJLCHpbeZC92%2Bmm3kXMD0K2wPXMghboIQd4TneU23oMYEba3OdV04OKRQh%2BwK70PUZpzAENqhNnlmAFyFDqxK9w82xXe%2FQqId9IHRz6dVlZlYiMg545HB5n2A1kP2hr5NepDukKiKqqT5Pj0liYM3CX5T%2ByT1DDzJKlnZAf5fOpQ%2BeFwZS4l0APtFYJZjtdNc8aFEDUK2W3VrlBszblTOnSbz7z%2FcnI5c4qtNr%2BeZzfjDIooPXBjqkASaiamogHmswE%2BnjAKP%2FVGbKv3o4U5A%2F4LfRj1qVjTW1YJGDeQDgwtlZhTS2cevMcY3OMVpPIHBH8US3TVc7ybf4ySQrTWg%2F7r7m22oArXB7cIwrTxXo5HurdE11qUE3lj%2FP%2BSc%2B%2FVEL%2Fc2au%2B3zKvvZogp1JgAeBiR7as10AcTK4N2cxBDzRZ8F0V%2FukzKf6Lm7j6N2fp04%2Fev2N2NWL0H6zsXA&X-Amz-Signature=ad4cd4044280bba25eb68e18296a99f21472ae67c32bb9bd9f37c19cf81a3dd6&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

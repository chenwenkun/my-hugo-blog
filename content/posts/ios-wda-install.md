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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466Y2WQR5O7%2F20260924%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260924T205450Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEBQaCXVzLXdlc3QtMiJIMEYCIQC37SZkhh5uKeNFpD9RURBIkOH%2B6u0DVmacx8spmVm%2FKwIhAOVNhtVzbyYxMum3BU47cI99CLVjyK%2B%2BMr9Ti14aX%2Fq8KogECNz%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1Igwd%2FoWsn6vVX14kwU8q3AMZxRRKR8OY%2BdTlrk6TT5tlR1U5h3EZNjpjTu%2BCe5b%2BDJSp0PoWAuaQtdrZLgQj%2F6N4z1Vh%2BJ3Y4f95Hj1WktF%2F6rs9nGHdxm%2Fq4vbxDQIkAOxWjl6KZi9NxCcGX8bZAB2xVhNKrzQvsA%2F0jNFuc%2BDlAwbqHc1KmUVNFBTBFgl%2BH0KNOLHO3oiFQsLBaGn%2FB87AwTx0PxKExCPcFj9aYeLEVJowaVJsV6VrsXyI7%2F%2FTexJK4DmEMzi6bXLMzm6mvaqu1OzEUcBqm9ZbOH7pUDXdRNVI2ZhB2p7LWm5cl5D4dNBlN3Y8Y3LDtRjrlJXGhPkX4QLrWVcW0akTYHfmG3IClPY2o4DJ8DHDO90P%2FnAbxGNSSpw3UaNwz62QzVOdmSfucNR2veFOjNIPLTSfeue6kSQH0%2FYe22wprRUB%2FAyrLhEx1wNhZDr13etBDxLF21gT1WaDSGqFC6RCCZBx%2Fw46Yv4Fo9KidT6Xy%2FzkOiMo9asBSZi18Cey6VgEzlHMLTjVHHGYn5FJm79KpqocJ9SqygysHLjQQT%2FwIfSy3tSvKgmAyR7BVCXcd11qlc%2FUezYhMIYtDFNj2AvC0g6RLqxe1pkHZooOGTuAV%2By6n4OU9jkdeVfQ5KURsmMTkzCD8NXVBjqkAeTWsr5%2BOB6t0XAswWhNguWPNgwzm1C7VqulqNc2jrTMrzJePmNB%2FwVBLWV15lAQimIJjr0I3ckOfmVXde88qwTU7BDRXZRqYT2SjRp6AkuRhd%2FwfiR4oxJMhgusXWs%2BbCezdbxAude3P6TrGJizuH3mCxDX81XlbRXAwI19WbeTERLwK9gzSS4yGPd64GCGxOoLF%2FxelkLQxrc7V6g86siIm9aY&X-Amz-Signature=1c395e9b27b5f10878ba669359b58b19cccbb786a4f3b7b9e6b1ac365a42420b&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466Y2WQR5O7%2F20260924%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260924T205450Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEBQaCXVzLXdlc3QtMiJIMEYCIQC37SZkhh5uKeNFpD9RURBIkOH%2B6u0DVmacx8spmVm%2FKwIhAOVNhtVzbyYxMum3BU47cI99CLVjyK%2B%2BMr9Ti14aX%2Fq8KogECNz%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1Igwd%2FoWsn6vVX14kwU8q3AMZxRRKR8OY%2BdTlrk6TT5tlR1U5h3EZNjpjTu%2BCe5b%2BDJSp0PoWAuaQtdrZLgQj%2F6N4z1Vh%2BJ3Y4f95Hj1WktF%2F6rs9nGHdxm%2Fq4vbxDQIkAOxWjl6KZi9NxCcGX8bZAB2xVhNKrzQvsA%2F0jNFuc%2BDlAwbqHc1KmUVNFBTBFgl%2BH0KNOLHO3oiFQsLBaGn%2FB87AwTx0PxKExCPcFj9aYeLEVJowaVJsV6VrsXyI7%2F%2FTexJK4DmEMzi6bXLMzm6mvaqu1OzEUcBqm9ZbOH7pUDXdRNVI2ZhB2p7LWm5cl5D4dNBlN3Y8Y3LDtRjrlJXGhPkX4QLrWVcW0akTYHfmG3IClPY2o4DJ8DHDO90P%2FnAbxGNSSpw3UaNwz62QzVOdmSfucNR2veFOjNIPLTSfeue6kSQH0%2FYe22wprRUB%2FAyrLhEx1wNhZDr13etBDxLF21gT1WaDSGqFC6RCCZBx%2Fw46Yv4Fo9KidT6Xy%2FzkOiMo9asBSZi18Cey6VgEzlHMLTjVHHGYn5FJm79KpqocJ9SqygysHLjQQT%2FwIfSy3tSvKgmAyR7BVCXcd11qlc%2FUezYhMIYtDFNj2AvC0g6RLqxe1pkHZooOGTuAV%2By6n4OU9jkdeVfQ5KURsmMTkzCD8NXVBjqkAeTWsr5%2BOB6t0XAswWhNguWPNgwzm1C7VqulqNc2jrTMrzJePmNB%2FwVBLWV15lAQimIJjr0I3ckOfmVXde88qwTU7BDRXZRqYT2SjRp6AkuRhd%2FwfiR4oxJMhgusXWs%2BbCezdbxAude3P6TrGJizuH3mCxDX81XlbRXAwI19WbeTERLwK9gzSS4yGPd64GCGxOoLF%2FxelkLQxrc7V6g86siIm9aY&X-Amz-Signature=3d9b08817f4125f6b121389bbb0d8c45cac03ae005d8be1e26f873dab7eab31c&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

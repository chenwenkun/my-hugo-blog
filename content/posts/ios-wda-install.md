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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466YA5IQAMG%2F20260808%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260808T122425Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEKH%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIAXC5A%2BXoYAs%2F75Fn%2BjRYayX9KVxS%2FqjAp4PlQP9RFgiAiEAho%2B2B5Jv1sx7e6p2Cuq1pea7pcO6CpIG8uVnKKTOSp0q%2FwMIahAAGgw2Mzc0MjMxODM4MDUiDFMqj0yKDrGug50duSrcA04%2BrbS8QkypVrxQ6VmLuiY1zXPv2Ivt5bd%2B9tHHLl5VdPSTVI2PltWxbMsaEjFYKHMPer1Z190PM2lMybfs%2B%2FoUc6dvs%2B7hpW%2Bn7b5C89J5b6JIvl785B5hxKlcoXzSSGOBWomoMMDnfi%2Bn7D7TUynRNWYf2uTIqITPNiSX1NeQK4kpoN9wP2pQ7PUhb7DfkFRYqD37PjSldHf2UxAMAUfJePzcCgqJcRDruvNx7OVWLZ7qD3Zu8QkoHOYZ7k31rO55KoxLC5O9v75V49UL754P%2B%2BU11wbmZCQHJCwd1DPPxnz5s%2FppXDlHp6oIzXrQkN9ZgSq42J639UlmiE2mqGl8qtt8eMSmIhgT3%2BNQh4mxMZPJ787ZlQBUtAbJ003j%2FNBI2OHwQ8ByieaoHA5DcRG%2B6rcaU34LWQDsicyS60MfI%2BO4LFPqo07302L1B3fOf2Di3Xjjyhc62LIcm3zjX8%2FLQsh4sBoAUu6uFVP2%2BADmMUiafIJy5P8ylVVYHe%2BYrTDl6CEvveuCQxQPmevwkqml8HPMrtpdp0ZzqiFi8ubk7mmgSJYK7WkIMYrwyBvVJnM%2BDQi5XZmKPipkCxw8UD1qC1xOccXrwgR%2BR6tl7HUSWeAYSO57p5h%2Fa4eFMPDW29MGOqUBqMdHYq5yCrrZkQSn%2BCwimEnISetiqYOAFcCk2ShF18WSmTkc54qzavRxu2Ps%2BMc1I5csa%2B83oeXvfKNcTVfLjqUmLLjpd7ai615aMUxzRlVN658SrAl8YKbYy9jIif9fVlkqj%2FBtazjKsL2zxM1PJmWMqn4ZQsnroZHObcV3tCA3Zx2WM6i4RoOQu7H0zK7RIdyEwlJf4UxANofb6r5HpiAGgOed&X-Amz-Signature=78ef293cc362855475779a0129b5362d0741f5c122452487a8b04997e1c9c361&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466YA5IQAMG%2F20260808%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260808T122425Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEKH%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIAXC5A%2BXoYAs%2F75Fn%2BjRYayX9KVxS%2FqjAp4PlQP9RFgiAiEAho%2B2B5Jv1sx7e6p2Cuq1pea7pcO6CpIG8uVnKKTOSp0q%2FwMIahAAGgw2Mzc0MjMxODM4MDUiDFMqj0yKDrGug50duSrcA04%2BrbS8QkypVrxQ6VmLuiY1zXPv2Ivt5bd%2B9tHHLl5VdPSTVI2PltWxbMsaEjFYKHMPer1Z190PM2lMybfs%2B%2FoUc6dvs%2B7hpW%2Bn7b5C89J5b6JIvl785B5hxKlcoXzSSGOBWomoMMDnfi%2Bn7D7TUynRNWYf2uTIqITPNiSX1NeQK4kpoN9wP2pQ7PUhb7DfkFRYqD37PjSldHf2UxAMAUfJePzcCgqJcRDruvNx7OVWLZ7qD3Zu8QkoHOYZ7k31rO55KoxLC5O9v75V49UL754P%2B%2BU11wbmZCQHJCwd1DPPxnz5s%2FppXDlHp6oIzXrQkN9ZgSq42J639UlmiE2mqGl8qtt8eMSmIhgT3%2BNQh4mxMZPJ787ZlQBUtAbJ003j%2FNBI2OHwQ8ByieaoHA5DcRG%2B6rcaU34LWQDsicyS60MfI%2BO4LFPqo07302L1B3fOf2Di3Xjjyhc62LIcm3zjX8%2FLQsh4sBoAUu6uFVP2%2BADmMUiafIJy5P8ylVVYHe%2BYrTDl6CEvveuCQxQPmevwkqml8HPMrtpdp0ZzqiFi8ubk7mmgSJYK7WkIMYrwyBvVJnM%2BDQi5XZmKPipkCxw8UD1qC1xOccXrwgR%2BR6tl7HUSWeAYSO57p5h%2Fa4eFMPDW29MGOqUBqMdHYq5yCrrZkQSn%2BCwimEnISetiqYOAFcCk2ShF18WSmTkc54qzavRxu2Ps%2BMc1I5csa%2B83oeXvfKNcTVfLjqUmLLjpd7ai615aMUxzRlVN658SrAl8YKbYy9jIif9fVlkqj%2FBtazjKsL2zxM1PJmWMqn4ZQsnroZHObcV3tCA3Zx2WM6i4RoOQu7H0zK7RIdyEwlJf4UxANofb6r5HpiAGgOed&X-Amz-Signature=f879d258e85cf4ee29cf56524d0d9bc4e2a6487749d450ac1fddc5c0ff818d2a&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

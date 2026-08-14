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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466TVD7PCNQ%2F20260814%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260814T010146Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjECgaCXVzLXdlc3QtMiJIMEYCIQCm6ZEU1hn3ykRDfHyN9A20UgnD%2FR3yp1PhnKljI2osOgIhAOrKrZ9iHwytj3H6Nll9r%2BEDpDK6XVOsSpvGHP4uu2GVKogECPH%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgynSbiiVjaOMuirvhMq3AMPgBEymklfw%2BpJltyU1%2BrMyZEuCHk3GAqKNYeQ8r9hgkecquPQj76%2FzzDvbUuKPHCHcADYN9hcuRr7cWTIZRIkzp0vKq3dhbvseWAU%2F9dUS%2FiYP9ocSu02Rd43WptmUVKjuyrVqktRahe2lrfB4AGo5S8zV9rdqreEBHTFrREv3vfCoH2MYZz4OX%2BD3nfl7v2RhXc75B83pHQEgelHfWBuRx5mbhMYkIImecl48LrpCQ653K4Qdw1kG0XqJXM%2FS7bt5tImJ2AyrVZjQ9XZjuWb%2BqOcWmklobSq9SvbjFnmeX9amM5kyH%2BrVjsKrhPxzceX3XdZPIXY68BuiyYJMkcVH9ahmR8cSYoifFWbc8urPDE8fzHfx1yDjsrx4DRgKsIy4qX35LS3Shqdwa8bjpxCS4WpIu8GGR3bMFnjO9ZdZGisKDg0somSFLB1eyODx0J1%2BToHr4iAwETh0wNuTzFNlVgN9ih0JlnTsHwO8tkyIdj3bNMojasD9%2Bzv%2Fl2e30%2BU6DyVhxf8BUWF22VkgbhG%2BKxf8wFMrNDapF2yxvcn5iA7BNW7TkLy7R3GFkBvNNoYIlkxoM6sgYEE7KGV%2BIQypaZCDbmr47B%2FSZ4IqZN6X4Pk1pjEVT%2B1z3sSMjD6tPnTBjqkASbjKgVG65CBuIIf4Hacw2HNq5pVrF4klRjTsK24LBAOw3p%2BpCJGPCdNYUD6ZXpqD%2BgomtCdNi6iWeM3vLi01AZ%2FlGah2dNWnKOqjZLzFpycWIfv8c3N4kAkct0n7t9Y6DMc8YSEvZH4Yss3GW7BHXdgGKn1QWWq1qMLnfCJoM3GBgbP4cBg33eKg4Ks14oZuIsI80r5I2N66tQH479EkYicTuFm&X-Amz-Signature=391dcd18a052c5d561c8e8a7fe87466a1ae3807d80d2a8336d16a83447994554&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466TVD7PCNQ%2F20260814%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260814T010146Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjECgaCXVzLXdlc3QtMiJIMEYCIQCm6ZEU1hn3ykRDfHyN9A20UgnD%2FR3yp1PhnKljI2osOgIhAOrKrZ9iHwytj3H6Nll9r%2BEDpDK6XVOsSpvGHP4uu2GVKogECPH%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgynSbiiVjaOMuirvhMq3AMPgBEymklfw%2BpJltyU1%2BrMyZEuCHk3GAqKNYeQ8r9hgkecquPQj76%2FzzDvbUuKPHCHcADYN9hcuRr7cWTIZRIkzp0vKq3dhbvseWAU%2F9dUS%2FiYP9ocSu02Rd43WptmUVKjuyrVqktRahe2lrfB4AGo5S8zV9rdqreEBHTFrREv3vfCoH2MYZz4OX%2BD3nfl7v2RhXc75B83pHQEgelHfWBuRx5mbhMYkIImecl48LrpCQ653K4Qdw1kG0XqJXM%2FS7bt5tImJ2AyrVZjQ9XZjuWb%2BqOcWmklobSq9SvbjFnmeX9amM5kyH%2BrVjsKrhPxzceX3XdZPIXY68BuiyYJMkcVH9ahmR8cSYoifFWbc8urPDE8fzHfx1yDjsrx4DRgKsIy4qX35LS3Shqdwa8bjpxCS4WpIu8GGR3bMFnjO9ZdZGisKDg0somSFLB1eyODx0J1%2BToHr4iAwETh0wNuTzFNlVgN9ih0JlnTsHwO8tkyIdj3bNMojasD9%2Bzv%2Fl2e30%2BU6DyVhxf8BUWF22VkgbhG%2BKxf8wFMrNDapF2yxvcn5iA7BNW7TkLy7R3GFkBvNNoYIlkxoM6sgYEE7KGV%2BIQypaZCDbmr47B%2FSZ4IqZN6X4Pk1pjEVT%2B1z3sSMjD6tPnTBjqkASbjKgVG65CBuIIf4Hacw2HNq5pVrF4klRjTsK24LBAOw3p%2BpCJGPCdNYUD6ZXpqD%2BgomtCdNi6iWeM3vLi01AZ%2FlGah2dNWnKOqjZLzFpycWIfv8c3N4kAkct0n7t9Y6DMc8YSEvZH4Yss3GW7BHXdgGKn1QWWq1qMLnfCJoM3GBgbP4cBg33eKg4Ks14oZuIsI80r5I2N66tQH479EkYicTuFm&X-Amz-Signature=cb3fe2478f664fe7efcb557c7ae84a3f236744159c7d550b0c36108362765a4c&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

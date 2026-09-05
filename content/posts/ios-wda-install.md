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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466UZGL2YO7%2F20260905%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260905T015516Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEDkaCXVzLXdlc3QtMiJGMEQCIDE0Y%2BesUe6ffGX%2BZb6uWUfoHYKO6PgqLcDnCiWh%2BpsnAiBgfPLycx%2Bv3n1OQAkmrjISBKDDxFJrc%2BUQcLokZu%2FOJSr%2FAwgBEAAaDDYzNzQyMzE4MzgwNSIMutuO5f%2BXzYNBHaoDKtwDYx00Fx55dnk4WEoK8zZdA2BwTcfXp%2BcqXuErHvbwlrdGAPQcHy5NuBBd4m%2FGdJ6b2h8BUHjPfuwPcCc%2Bhv37uIKs%2BrK3Fiwj6ZnFgmsjJafxLzk6ja5NWw9m%2B%2BdN3ZHOT%2FFlO83dHwLDlfYo1LB45uAWJ%2B0GIk2VzQCBXf3KWLu1BWlosINHJyZ2cG%2FCcA%2FzD3ZTNDJW4RtlJrwhIcl1pg47STi82DF9%2FYcfuHLUpoTUlyE1ZHbEGuJ8zyc%2BYlsGVQ%2Fo7I5CoUuwp34JYD7vuUlKr8ahNlCxJiU%2F17MYH10gEnnBJQzELAsq73hIfHmiKjbMM%2FcqYej6gnPA9oqsT%2BDE5sVLabanxER2VRDtCE8Hy4LgrPomKCOSB5Yp%2BAinEuB2jVO4R3iz9T8YDZfXvQUfJfwQcR6415dopfy9a0f9JThAYv5sPyYDwihBLAE84luX8B6XKyD%2BeouqgRBac8xB7KyM7u7K4sEs%2Bais9SSMLQvrf6i866dDZ6VbrO8s4i4VMXwaV9zAyiJdii4rPA2vbs0q7mJcN%2BX6Ry8c5%2Bc7069gWQJKH%2FD3X80KakPEFel0xTkHeW%2BkEBqZxfPBAZGyw0FqKmQKmnN4ovPxT9uWyfBL586fcwbsrR0wur%2Ft1AY6pgE30aOOwVqIsxOI8Do%2BUc51QcbnBX1NXI5Zq3AQuSzBRsLBEVgHzbPmn1B7Hnyz9J%2FYEztgOwSsN0rc38gNXsjsDbfVQHZNi3pnfPSmTMz8OWbd9tgV9po8z9hYcXxp5upavYadD09WXMzxDkzuSdQJLYp8CllbCtALDeKksqpPVlTeh9f%2FczWWl5uZNNci6IaI9U5nd%2B68zVHlh9p5XoZRIzO5Igfj&X-Amz-Signature=7cbccee959a855d07515426e717289a03ee2cbe358d9688a00f3d44a93438dcf&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466UZGL2YO7%2F20260905%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260905T015516Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEDkaCXVzLXdlc3QtMiJGMEQCIDE0Y%2BesUe6ffGX%2BZb6uWUfoHYKO6PgqLcDnCiWh%2BpsnAiBgfPLycx%2Bv3n1OQAkmrjISBKDDxFJrc%2BUQcLokZu%2FOJSr%2FAwgBEAAaDDYzNzQyMzE4MzgwNSIMutuO5f%2BXzYNBHaoDKtwDYx00Fx55dnk4WEoK8zZdA2BwTcfXp%2BcqXuErHvbwlrdGAPQcHy5NuBBd4m%2FGdJ6b2h8BUHjPfuwPcCc%2Bhv37uIKs%2BrK3Fiwj6ZnFgmsjJafxLzk6ja5NWw9m%2B%2BdN3ZHOT%2FFlO83dHwLDlfYo1LB45uAWJ%2B0GIk2VzQCBXf3KWLu1BWlosINHJyZ2cG%2FCcA%2FzD3ZTNDJW4RtlJrwhIcl1pg47STi82DF9%2FYcfuHLUpoTUlyE1ZHbEGuJ8zyc%2BYlsGVQ%2Fo7I5CoUuwp34JYD7vuUlKr8ahNlCxJiU%2F17MYH10gEnnBJQzELAsq73hIfHmiKjbMM%2FcqYej6gnPA9oqsT%2BDE5sVLabanxER2VRDtCE8Hy4LgrPomKCOSB5Yp%2BAinEuB2jVO4R3iz9T8YDZfXvQUfJfwQcR6415dopfy9a0f9JThAYv5sPyYDwihBLAE84luX8B6XKyD%2BeouqgRBac8xB7KyM7u7K4sEs%2Bais9SSMLQvrf6i866dDZ6VbrO8s4i4VMXwaV9zAyiJdii4rPA2vbs0q7mJcN%2BX6Ry8c5%2Bc7069gWQJKH%2FD3X80KakPEFel0xTkHeW%2BkEBqZxfPBAZGyw0FqKmQKmnN4ovPxT9uWyfBL586fcwbsrR0wur%2Ft1AY6pgE30aOOwVqIsxOI8Do%2BUc51QcbnBX1NXI5Zq3AQuSzBRsLBEVgHzbPmn1B7Hnyz9J%2FYEztgOwSsN0rc38gNXsjsDbfVQHZNi3pnfPSmTMz8OWbd9tgV9po8z9hYcXxp5upavYadD09WXMzxDkzuSdQJLYp8CllbCtALDeKksqpPVlTeh9f%2FczWWl5uZNNci6IaI9U5nd%2B68zVHlh9p5XoZRIzO5Igfj&X-Amz-Signature=788ca202e545cfcd98c359983d8a5e205d799b5bf9b4a152e3d6edd65b839c1c&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466XQLERTSS%2F20261016%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261016T201251Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjECMaCXVzLXdlc3QtMiJHMEUCICAeCX3ZXKh%2B57mWCTNqyUqWyqjYsiLBIyTVZqQlH91FAiEA5wMwfGVPCEU7ZU8LAYRjDND17tVLv9y9UAneJ6bRKBIqiAQI7P%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDAAP3f%2FSCEEISWtPvircA4M9kRL6k%2FXzdGVSLgJINWW19u7ICHfEFbdi1M%2FwEw3S0hc4XzAIwK5s7t2R3mymdzCaBwjMVl%2FbKLK3YRJkytaTD9cD%2BEZTzC4Tz0VRgYtlXcZ2k8NZNW58BC%2BsWNQ0r2tlG%2Bqv0uzcJy45N%2FujY%2BFsACgK6bi69Zom0vno7gpuYeab59hjIBpBMEZzoFGwP9iovSdQrOaOKvWt7%2FR7Qr%2BglnchMCrA6fca3gMVr9YY49vWpYoXzkQnhU4fiepIOTqZEHbOsg3cYlSb5IH%2FD7pQRiMDemRQHKzA5VXDkR820%2FVSj%2FSwlVwDeCQEMCAdj9Wc9IaaaM1P7zGjoUdiPnKCK0LdOyIPg6Pkf4StuiQgOh1Xad7ucSA%2F5CpYfx6Pp%2BAlO4ZvJQNolzE7jVzLMwy0FjfaYicXSCtZBlcpx9zabjg1LcxitBlz3PPd%2BmOU6aCzmlZMfyYkmOyutKOmaHJZ9G6P4QqUCoPqH73dtTUxurgyiV2f4aFvHxhsKc9tToCSl9j%2F7jWXEiui%2BH4oO%2BGNS2Rjmc24d4eARfuSdkXemFaYVP6XPJ6jVCfcg%2BJ25OSRWVbSt%2BdHuga4GAoOHh516d%2FkrH44Ucg0ROJ%2F%2B7AzstTQh0CCLJVveZ3MMKnsydYGOqUBD8xmXHe9GSSHKe5YmVxSfBGFAEoWDwKFZd8RKnN1v0lnR2B6do9fo5%2FCMb8CgbhYwm80D1CqY%2B4Sj9DPrrA6JTHG48%2Be1Tna6bfq8okl3L4bkVsihP5HPmL21X%2FFz%2Bvdp0iPZ8MsGrMkMthgct2a5MTeAMqybcpJ6L%2BX4bjrkO3dpxB%2BDFVEW%2FDVtKA2v458A07%2B4anrukg1LDldcY7gb%2BSBErSt&X-Amz-Signature=4dedbf5b04a506b780952406fb28074ba99e4d7cd7d2b3154f9243c757ac092d&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466XQLERTSS%2F20261016%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261016T201251Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjECMaCXVzLXdlc3QtMiJHMEUCICAeCX3ZXKh%2B57mWCTNqyUqWyqjYsiLBIyTVZqQlH91FAiEA5wMwfGVPCEU7ZU8LAYRjDND17tVLv9y9UAneJ6bRKBIqiAQI7P%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDAAP3f%2FSCEEISWtPvircA4M9kRL6k%2FXzdGVSLgJINWW19u7ICHfEFbdi1M%2FwEw3S0hc4XzAIwK5s7t2R3mymdzCaBwjMVl%2FbKLK3YRJkytaTD9cD%2BEZTzC4Tz0VRgYtlXcZ2k8NZNW58BC%2BsWNQ0r2tlG%2Bqv0uzcJy45N%2FujY%2BFsACgK6bi69Zom0vno7gpuYeab59hjIBpBMEZzoFGwP9iovSdQrOaOKvWt7%2FR7Qr%2BglnchMCrA6fca3gMVr9YY49vWpYoXzkQnhU4fiepIOTqZEHbOsg3cYlSb5IH%2FD7pQRiMDemRQHKzA5VXDkR820%2FVSj%2FSwlVwDeCQEMCAdj9Wc9IaaaM1P7zGjoUdiPnKCK0LdOyIPg6Pkf4StuiQgOh1Xad7ucSA%2F5CpYfx6Pp%2BAlO4ZvJQNolzE7jVzLMwy0FjfaYicXSCtZBlcpx9zabjg1LcxitBlz3PPd%2BmOU6aCzmlZMfyYkmOyutKOmaHJZ9G6P4QqUCoPqH73dtTUxurgyiV2f4aFvHxhsKc9tToCSl9j%2F7jWXEiui%2BH4oO%2BGNS2Rjmc24d4eARfuSdkXemFaYVP6XPJ6jVCfcg%2BJ25OSRWVbSt%2BdHuga4GAoOHh516d%2FkrH44Ucg0ROJ%2F%2B7AzstTQh0CCLJVveZ3MMKnsydYGOqUBD8xmXHe9GSSHKe5YmVxSfBGFAEoWDwKFZd8RKnN1v0lnR2B6do9fo5%2FCMb8CgbhYwm80D1CqY%2B4Sj9DPrrA6JTHG48%2Be1Tna6bfq8okl3L4bkVsihP5HPmL21X%2FFz%2Bvdp0iPZ8MsGrMkMthgct2a5MTeAMqybcpJ6L%2BX4bjrkO3dpxB%2BDFVEW%2FDVtKA2v458A07%2B4anrukg1LDldcY7gb%2BSBErSt&X-Amz-Signature=9d989de18fa47a630759208f1804874771c57f08c2c78c19de98a24dc47b448c&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

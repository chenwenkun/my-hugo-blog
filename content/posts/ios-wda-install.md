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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466RESHXFBQ%2F20261116%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261116T141453Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEAQaCXVzLXdlc3QtMiJGMEQCICuyB1VdMS2pG%2F2attFEh9z%2B4xhyDH63LhPT8e7VU5YLAiA4yJKMX7xSpn8MEzNUGIQcB%2FURYUGP6EZ08RUEmG4wLiqIBAjN%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMJ%2BPridXgYEzipinMKtwDZGXMTOS3Oh8wuVgoYXIvEksfVhaBT0eEV39JO8Qoj6zOWkuGE6ztneyZ9Kj5gV7oUsyJzW31g0LOHFvBLPNMqOmbOUURp315oKddY4yYsa5CssJ1SRgMwlf8Yy4H6XvpRHqZFdwf6F2ajaZW0%2FmEKLE6hBq1FsUa41phedfw42T%2FA0zaAKGOQ81wA%2BX60Lqjo2PnPd2GTxh1Rg3XWURSMBE4lLpuCeYtpRHsLQ%2FQ76r1wLQhMex82mz%2BdxzJ3ZmHSQv7Aou5Ki0ND%2FuRKIqANpU%2BRql%2B%2FCv%2BdmwKXpvfn2b1O5jL%2BOqcyQlt903lsMiS0v3EXbO1cVhVuYF7WhGU2T%2FouuQ01k4RXxD9gqjbG05mD9o2X8jv0fnUUnoSYWk7H3srYvcz6HJV1jOMmXBIk6TC%2BQ1W4td%2F%2FuhcUCW%2FiElhWCeki46kUsFXF1Gx0UwO%2BghuQpmcOikqAXsjMeo21V1hGK%2FI89EZv0ljB4vmd0a4OfJbjLFlwsNjKM%2FLG6YcTgK0RcBt8paEb17B8ich53A934n1i82D6J1vsNQXVnZV8HY2PPpIiG6lHC8QONRyam07Qx%2B3JOL3JvQBKcYc2SI47BYX%2FsW4ez7K5icdpbFUV%2BCj9oiZE70jeg0w%2F%2BPr1wY6pgG266ZBAiIaZyyjWOkAE%2BQ%2FByBJKgvNoHEZi2oazJ2i4oiUgUNY5dfvYRbElBy5lGkeLgziuowQbuWr%2FiOlM57Hw3YPcBiK5ny2%2BLLOQrYsaUfUAyO%2BeufRLff%2FAHWkhBYmX6a5DljC3W7xPiCqMIKEDQwr1SplzcaxaaFZTNKvtIFYMRvUmQZU9YSGnz2neDTfwSwbMXwAakEN%2BgJD4syaJsICE0Gk&X-Amz-Signature=827785ef9011bbafe66ed9df9b601e00099d685d6ee5fd23c49025ba6e6cb4c4&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466RESHXFBQ%2F20261116%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261116T141453Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEAQaCXVzLXdlc3QtMiJGMEQCICuyB1VdMS2pG%2F2attFEh9z%2B4xhyDH63LhPT8e7VU5YLAiA4yJKMX7xSpn8MEzNUGIQcB%2FURYUGP6EZ08RUEmG4wLiqIBAjN%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMJ%2BPridXgYEzipinMKtwDZGXMTOS3Oh8wuVgoYXIvEksfVhaBT0eEV39JO8Qoj6zOWkuGE6ztneyZ9Kj5gV7oUsyJzW31g0LOHFvBLPNMqOmbOUURp315oKddY4yYsa5CssJ1SRgMwlf8Yy4H6XvpRHqZFdwf6F2ajaZW0%2FmEKLE6hBq1FsUa41phedfw42T%2FA0zaAKGOQ81wA%2BX60Lqjo2PnPd2GTxh1Rg3XWURSMBE4lLpuCeYtpRHsLQ%2FQ76r1wLQhMex82mz%2BdxzJ3ZmHSQv7Aou5Ki0ND%2FuRKIqANpU%2BRql%2B%2FCv%2BdmwKXpvfn2b1O5jL%2BOqcyQlt903lsMiS0v3EXbO1cVhVuYF7WhGU2T%2FouuQ01k4RXxD9gqjbG05mD9o2X8jv0fnUUnoSYWk7H3srYvcz6HJV1jOMmXBIk6TC%2BQ1W4td%2F%2FuhcUCW%2FiElhWCeki46kUsFXF1Gx0UwO%2BghuQpmcOikqAXsjMeo21V1hGK%2FI89EZv0ljB4vmd0a4OfJbjLFlwsNjKM%2FLG6YcTgK0RcBt8paEb17B8ich53A934n1i82D6J1vsNQXVnZV8HY2PPpIiG6lHC8QONRyam07Qx%2B3JOL3JvQBKcYc2SI47BYX%2FsW4ez7K5icdpbFUV%2BCj9oiZE70jeg0w%2F%2BPr1wY6pgG266ZBAiIaZyyjWOkAE%2BQ%2FByBJKgvNoHEZi2oazJ2i4oiUgUNY5dfvYRbElBy5lGkeLgziuowQbuWr%2FiOlM57Hw3YPcBiK5ny2%2BLLOQrYsaUfUAyO%2BeufRLff%2FAHWkhBYmX6a5DljC3W7xPiCqMIKEDQwr1SplzcaxaaFZTNKvtIFYMRvUmQZU9YSGnz2neDTfwSwbMXwAakEN%2BgJD4syaJsICE0Gk&X-Amz-Signature=508eb9e2587db2d56e329f70008f891478396bd2d84e7d24f70dc35f6f0f34ac&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

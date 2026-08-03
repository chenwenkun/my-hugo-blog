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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466ZXOSFBGJ%2F20260803%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260803T141333Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEC0aCXVzLXdlc3QtMiJHMEUCIFzzuQ5oVGXHt6sDCM3MdUbtSCaGA5I3QG7Ho5Ev4rXAAiEAsmuwZMbSyovl8auIM%2FUEvnV9mWZ9Rc2k8ALjuUuHkr4qiAQI9v%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDADx97WrchYqRpJYQSrcAwrDxABExO8yQRg9jtwVs3HlSEZ5hGnhv9xZ9PzVmlppU309O1cbJAcWRk6eHYFHqIYkbN59GITURDcxms%2FNGUhL92rtcPGCPPywJQxjbwUkWsn9Dce4lUmKjXXTKKTT41mTaQV0k%2B21dLP%2FaZtW%2B3Vtlw2vfwMM7MgC0Y8kWigZdXOQ8HiRfjg30kTw6AyOIwUyFWSHizK6FD6kk65oJqug2m7yJjr00FDrUxB4TQ7HBPS4uKsv7J98ECzlYktD%2F5RCCMIH4aBxzgkx5q72yk1AmP85qhDn5MknD6BXxYiUKjGJg0WVWUeMTgPXfloXpPkjIXmwLpi4dhdeEhBrThZyXJASTsKVp1AgosAqD7m4uFgpnFKeJSvQG7xSNC3I1i7d%2FThNPV27yUFGeMgYH%2BbJEs%2FhVP3D7uFsxgdw81CfK29%2FdFeE8Z1RLZXV4H2bKpNHi2Otg82rH2SGJ4thcq5WlYbEPUUHNztaYcfatwKCcfeOFTtUJMwpY%2BQP4AENkxSVcgtTX7Pm8yp6vMmnhvz7d4j18xBH9GDZ%2By1qYZazT7Pjai9KV72pbwhRDufK0aFsA2twkzL3cgarjSbfHtyAx4XPARPFvAAMgqOwDLLdPsDH5jjOn11hs7KfMKqawtMGOqUBxDUdi%2F0vzI9gAcVWKAvK1GU8AmkpMs0%2FP1YrI%2FEeoq0sxKgk51M3tKT9J%2Fa3IF68cvRrZdTYcNaDTPcL%2FW9WX1OAFxaz9j8JHkiWr%2BvDrupCWtm1zykOtaNl%2BOYwzMhWFcks8psUQEmj9EkLTGgDgGW16YOHsbVHOqyq3iceqqCprbM33bGOobJHlg2lYJ%2BxItn3kohCSfAs%2Fv1XZKagF%2BkhzNLh&X-Amz-Signature=7105e0f2c79d3f0866b5e40c4a1f053254657312d59c826c02e77e8c35a1dc0a&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466ZXOSFBGJ%2F20260803%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260803T141333Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEC0aCXVzLXdlc3QtMiJHMEUCIFzzuQ5oVGXHt6sDCM3MdUbtSCaGA5I3QG7Ho5Ev4rXAAiEAsmuwZMbSyovl8auIM%2FUEvnV9mWZ9Rc2k8ALjuUuHkr4qiAQI9v%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDADx97WrchYqRpJYQSrcAwrDxABExO8yQRg9jtwVs3HlSEZ5hGnhv9xZ9PzVmlppU309O1cbJAcWRk6eHYFHqIYkbN59GITURDcxms%2FNGUhL92rtcPGCPPywJQxjbwUkWsn9Dce4lUmKjXXTKKTT41mTaQV0k%2B21dLP%2FaZtW%2B3Vtlw2vfwMM7MgC0Y8kWigZdXOQ8HiRfjg30kTw6AyOIwUyFWSHizK6FD6kk65oJqug2m7yJjr00FDrUxB4TQ7HBPS4uKsv7J98ECzlYktD%2F5RCCMIH4aBxzgkx5q72yk1AmP85qhDn5MknD6BXxYiUKjGJg0WVWUeMTgPXfloXpPkjIXmwLpi4dhdeEhBrThZyXJASTsKVp1AgosAqD7m4uFgpnFKeJSvQG7xSNC3I1i7d%2FThNPV27yUFGeMgYH%2BbJEs%2FhVP3D7uFsxgdw81CfK29%2FdFeE8Z1RLZXV4H2bKpNHi2Otg82rH2SGJ4thcq5WlYbEPUUHNztaYcfatwKCcfeOFTtUJMwpY%2BQP4AENkxSVcgtTX7Pm8yp6vMmnhvz7d4j18xBH9GDZ%2By1qYZazT7Pjai9KV72pbwhRDufK0aFsA2twkzL3cgarjSbfHtyAx4XPARPFvAAMgqOwDLLdPsDH5jjOn11hs7KfMKqawtMGOqUBxDUdi%2F0vzI9gAcVWKAvK1GU8AmkpMs0%2FP1YrI%2FEeoq0sxKgk51M3tKT9J%2Fa3IF68cvRrZdTYcNaDTPcL%2FW9WX1OAFxaz9j8JHkiWr%2BvDrupCWtm1zykOtaNl%2BOYwzMhWFcks8psUQEmj9EkLTGgDgGW16YOHsbVHOqyq3iceqqCprbM33bGOobJHlg2lYJ%2BxItn3kohCSfAs%2Fv1XZKagF%2BkhzNLh&X-Amz-Signature=3ce612e40c3a1a3fd7dbf83157b6a0a8a9f31d29939e1b619b0b0fbafba4ebcb&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

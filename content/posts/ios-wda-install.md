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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466QVA7LXEI%2F20260927%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260927T155834Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEFUaCXVzLXdlc3QtMiJHMEUCIQCXFGyx418qg1ksptADHKqqoAl2CngrDblC2hHHSwRomQIgTJsINGmahgmFTNS0nU6xtSbYFMLN9IusCOa8V%2BUedtAq%2FwMIHhAAGgw2Mzc0MjMxODM4MDUiDNTOSs%2FfhUib%2B%2Fm1kyrcA%2F6ZCVxQZBiF7paTeKK8ef0EkB9deEztriPYeVmcPG29K7ZC30Qu%2B0oUsXRvVhCtSEjaUw4P%2BJ5a%2B0emBsftZKAT8wGpuW1vafF7yOvbtnzcCzgAfOImqdyRoX77ZaLDlwgLKus1QbJS32%2BfmYnzcem4fMn184dnPCmDDdSrVpcNcHGow6hkyrOOXYOsYExoYA6Kn6PO3MwK1Pl3H4AS0GsKkSdF5eDLmbhP4Lm%2BxLX3VvC1mOJ%2Fc%2BNu9Q4qmOwM%2Fq5BvxPeZFSYQKgLOazHIee1C0%2FcgRe7DrL1fKAZHCJX5fdIC986CPSJBnfK3JUQcczjgusQDeNC8Y5vc8ZlFTBMltyKJjHd4cRuvJbWZ0Y14QjQw%2B2YxVkjHOny3jsK0NBVCcQonF6EM85%2Bl10lCytsctBf5Bqt5PsVc%2Bl5KxLaKJ4EVjoEYEx6unMhEeWWqVCewhIY0xjQcU7sQrJzUsgj7hkZK9DPNVAikWiHR5wqOszwBDypEaC%2FZtMv6p4rTUpeRSYKStpCa98AfUHwjNyrR4b6Hhdyf23kivOmrhAo87av175aiqU%2FNqirTZTIpForpgK5fdy0Kf1Van3HSzgxUea54DyFjhsqNijd%2BBuXtaiJavbZRJjKmyFkMK6p5NUGOqUBblG2E9Tb%2B13yq%2BVGn%2BlYOFMPWEWGr5LEjxclX3R0RLTAE6S1k%2F8ZiIEX6lqLY8N9FNL7E1jLeUjWeQgXm7JrCNnliDWUfcJXJbDhseBHChCRBcFwPoOyUq37r9VZLugV%2BIq1O5xVB4beQ7Lt%2FpWiMWsJakx8D1C6ZIG5WHYaztJ4QE6jLLIaJNuu6QYlklRiu%2BTJdaTkOb0MqtD3GwNawDenNKCy&X-Amz-Signature=6aae4cba4076d6505edeafc33e97e3d57f81bfb0d80632dfa6d712212021767f&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466QVA7LXEI%2F20260927%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260927T155834Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEFUaCXVzLXdlc3QtMiJHMEUCIQCXFGyx418qg1ksptADHKqqoAl2CngrDblC2hHHSwRomQIgTJsINGmahgmFTNS0nU6xtSbYFMLN9IusCOa8V%2BUedtAq%2FwMIHhAAGgw2Mzc0MjMxODM4MDUiDNTOSs%2FfhUib%2B%2Fm1kyrcA%2F6ZCVxQZBiF7paTeKK8ef0EkB9deEztriPYeVmcPG29K7ZC30Qu%2B0oUsXRvVhCtSEjaUw4P%2BJ5a%2B0emBsftZKAT8wGpuW1vafF7yOvbtnzcCzgAfOImqdyRoX77ZaLDlwgLKus1QbJS32%2BfmYnzcem4fMn184dnPCmDDdSrVpcNcHGow6hkyrOOXYOsYExoYA6Kn6PO3MwK1Pl3H4AS0GsKkSdF5eDLmbhP4Lm%2BxLX3VvC1mOJ%2Fc%2BNu9Q4qmOwM%2Fq5BvxPeZFSYQKgLOazHIee1C0%2FcgRe7DrL1fKAZHCJX5fdIC986CPSJBnfK3JUQcczjgusQDeNC8Y5vc8ZlFTBMltyKJjHd4cRuvJbWZ0Y14QjQw%2B2YxVkjHOny3jsK0NBVCcQonF6EM85%2Bl10lCytsctBf5Bqt5PsVc%2Bl5KxLaKJ4EVjoEYEx6unMhEeWWqVCewhIY0xjQcU7sQrJzUsgj7hkZK9DPNVAikWiHR5wqOszwBDypEaC%2FZtMv6p4rTUpeRSYKStpCa98AfUHwjNyrR4b6Hhdyf23kivOmrhAo87av175aiqU%2FNqirTZTIpForpgK5fdy0Kf1Van3HSzgxUea54DyFjhsqNijd%2BBuXtaiJavbZRJjKmyFkMK6p5NUGOqUBblG2E9Tb%2B13yq%2BVGn%2BlYOFMPWEWGr5LEjxclX3R0RLTAE6S1k%2F8ZiIEX6lqLY8N9FNL7E1jLeUjWeQgXm7JrCNnliDWUfcJXJbDhseBHChCRBcFwPoOyUq37r9VZLugV%2BIq1O5xVB4beQ7Lt%2FpWiMWsJakx8D1C6ZIG5WHYaztJ4QE6jLLIaJNuu6QYlklRiu%2BTJdaTkOb0MqtD3GwNawDenNKCy&X-Amz-Signature=2b06472a7c7f633b1cafafee86316aaba1513d3bbfd9c97c47c86b3da7594392&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

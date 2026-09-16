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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466WF4MRQ2Q%2F20260916%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260916T021529Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEEEaCXVzLXdlc3QtMiJIMEYCIQDmQXfd7Gf0Y2LJrMdAzebUG3Hdjqyg6tcqpipPpmkp7gIhAPTQ1INi9BL%2B329WcyhfPd%2FYT2HmfW7Wo%2FuT9%2FTocqAKKv8DCAoQABoMNjM3NDIzMTgzODA1IgwZhaoxaksBPHwcDDcq3ANR9etE6NSA85R7oFsfzVIjrmTDSc8m%2F6cPl33AawL%2BbHNKGVP33EqZdM6yJCXWm953f0JpnLi0D%2FSX3hSmsvanIh1J3T9abF6IgA52IFMoS2YPFdHA6dxeXRDj4mFCBYD803if%2BbvOCM09TB7KOYe1CDM7j%2FSMpDUcQS%2Br8E0zwtAw6QXK6vxft4ppj5XVVg8GjBOVa0pu04aBfhD%2FnYASNJLcoXgdVuUE%2B7brRLJrdo%2Bz38nF1NZnQuLQoRLH2AvdptLoTKoNS4RamhT6ndujXk%2B4lcrXo5I%2BLVuJrEBkexTraaWk7ot%2F0UZaCzwC37%2BBWlGeAeat7mzS7bzCSUjLlXS399%2FegfbFjETqe0%2Bufs9r%2BHKrdTEOThRmQlnzr94NuyhmtKUpqungOp6Pt7vXv3Ptad2Qe9bhJKiOWFYF9cDxwPSeZQU9B1nupXxNEKeWP8HGhT6eL%2BYIvbU5yyMgqbCWcXLLM9fteg9s1m9u%2BP7eozKmGER0uxmqXUGeoU%2FXWdIEhrGfKH%2B5QFUmLQ9a8RA40UGz0WfhooK3E1ZiXKOyI9sdGFN1aXTyeUOpLzv2jYtUl1OV2ubAsts8dFhbfnqRA2C%2FHZds66q06VvEAtddnPgud7CEnuNrrzC%2FyafVBjqkAaXYROuBXI26ntEXydsKG94mWH7nGBclduqVY%2FtSUdy8%2BwY4SUEyZMITsVf4p4Xtp0oCYob0i8oT3J%2F0OkwxCwxTSPT7UwmcOlbeA%2FTsHQK%2FnLvaGE2aZ%2BidiWV2TidKzdd%2BQKfpd3s5KOZbTLtROI4zuM4Wxj%2FjeolDLFll%2BA%2FgHagSOsRUlFPOle%2BLd2VyvNLibCdytkbfnHjAUXy%2FdVJrzQYk&X-Amz-Signature=fcf8cd35a656764e9969a2983ab8935769cd2c605edd81767d6a090f85adec97&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466WF4MRQ2Q%2F20260916%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260916T021529Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEEEaCXVzLXdlc3QtMiJIMEYCIQDmQXfd7Gf0Y2LJrMdAzebUG3Hdjqyg6tcqpipPpmkp7gIhAPTQ1INi9BL%2B329WcyhfPd%2FYT2HmfW7Wo%2FuT9%2FTocqAKKv8DCAoQABoMNjM3NDIzMTgzODA1IgwZhaoxaksBPHwcDDcq3ANR9etE6NSA85R7oFsfzVIjrmTDSc8m%2F6cPl33AawL%2BbHNKGVP33EqZdM6yJCXWm953f0JpnLi0D%2FSX3hSmsvanIh1J3T9abF6IgA52IFMoS2YPFdHA6dxeXRDj4mFCBYD803if%2BbvOCM09TB7KOYe1CDM7j%2FSMpDUcQS%2Br8E0zwtAw6QXK6vxft4ppj5XVVg8GjBOVa0pu04aBfhD%2FnYASNJLcoXgdVuUE%2B7brRLJrdo%2Bz38nF1NZnQuLQoRLH2AvdptLoTKoNS4RamhT6ndujXk%2B4lcrXo5I%2BLVuJrEBkexTraaWk7ot%2F0UZaCzwC37%2BBWlGeAeat7mzS7bzCSUjLlXS399%2FegfbFjETqe0%2Bufs9r%2BHKrdTEOThRmQlnzr94NuyhmtKUpqungOp6Pt7vXv3Ptad2Qe9bhJKiOWFYF9cDxwPSeZQU9B1nupXxNEKeWP8HGhT6eL%2BYIvbU5yyMgqbCWcXLLM9fteg9s1m9u%2BP7eozKmGER0uxmqXUGeoU%2FXWdIEhrGfKH%2B5QFUmLQ9a8RA40UGz0WfhooK3E1ZiXKOyI9sdGFN1aXTyeUOpLzv2jYtUl1OV2ubAsts8dFhbfnqRA2C%2FHZds66q06VvEAtddnPgud7CEnuNrrzC%2FyafVBjqkAaXYROuBXI26ntEXydsKG94mWH7nGBclduqVY%2FtSUdy8%2BwY4SUEyZMITsVf4p4Xtp0oCYob0i8oT3J%2F0OkwxCwxTSPT7UwmcOlbeA%2FTsHQK%2FnLvaGE2aZ%2BidiWV2TidKzdd%2BQKfpd3s5KOZbTLtROI4zuM4Wxj%2FjeolDLFll%2BA%2FgHagSOsRUlFPOle%2BLd2VyvNLibCdytkbfnHjAUXy%2FdVJrzQYk&X-Amz-Signature=2d7acecb5578573bb9c87ee5700330e42226ed9664d9854d8250fbb73c6fc92b&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

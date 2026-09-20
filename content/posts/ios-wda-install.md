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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466UFPSZ3MU%2F20260920%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260920T101524Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEKj%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIFFYv4RiT2aogJOmue3mBjdqFBbe5w3P%2B5Ru2%2FyXUN7aAiEA2tZafclzOJPo5jwSOEl0WQi%2F2Z3ibLJaybjX2o36hNEq%2FwMIcRAAGgw2Mzc0MjMxODM4MDUiDECyC2oTewSdQdb38SrcAwBwCUPh67G52N2YOSVkTgI%2FcQ0KtsU56n3zUC2r9vbDhtdCspw5avJivLHUVe8bwMipgMYtl4riIaqmByBjb%2FkNDmqTGDllr9VP9qV2YGpRzGdjM1jUIxJe3%2B9ZiuTgg6wYiWYttPK1KrZE4K9D7DqzPzymF%2BTxnFKc3YR89cHzSMSEwVMSxyJuRuDwX88YRgzHncD2ItHolRH9zlzNPfTCHCSts5Dbycbjpvu4qSz4VT05o%2FVj8iBIFJARDgTsZLS%2BaYM6D1WWtQNNeLa3IsGDLW7Sd6PRxHbh9Ja2qy%2BZNyUh5OSMJ2WLQFbQbRdtmHgeJU8XUHYFVK%2Bau75ii1Lauf%2B%2FVqv766suyGJHUq6obtT3TefRMqLuu7oSLWWMJLEOwnGb6EWUhS4DRKBRRCZAsVdFmpGP2KW%2Bnw%2B%2B70ztLS7YoWeBnrOaFFTdiHI9xlI4Q4R6%2BTj%2Bb1ve2Lv9EZFDb52b%2BTWB5T4C6a59Gf%2Bmyge2%2FIC2OXKrt7E3i%2B4QfEjjlkL8xzMhyj4kFxPGemIEVDsztGsFovrYIqLpgEPqwx805dyIi3ZEDOxq2l9VvCdiPlpY3O0bL2b%2BhIts9y6nDlVPg5AYLF7MIcKVHYTEfW5O1dmSHH9bI7obMJ2mvtUGOqUBStjHis0sEEc8ygzWGdSHYSF%2FseUm72hqbQ2mURbP513j1ccoNqwAG1siar1Ie4o0e91OZ3oFhS%2BVcvhSXscte5BaMTJ0YA2536oNtqi2sBhAc4a0qG2iMWPg0aHg6cLenj6tGJyZNLz%2FMOFR39Xe8lZRNiXO%2Fb7TWImu6hyIdHs%2FtFJfgH4YEbqWxJS%2BBSkybkHGWbrtM4nz0WRCwZ%2BUYgNOb57p&X-Amz-Signature=f097cc5dd46e08309af7a26d8ebdd8fb90a70580e35c998530672b5330ba6e64&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466UFPSZ3MU%2F20260920%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260920T101524Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEKj%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIFFYv4RiT2aogJOmue3mBjdqFBbe5w3P%2B5Ru2%2FyXUN7aAiEA2tZafclzOJPo5jwSOEl0WQi%2F2Z3ibLJaybjX2o36hNEq%2FwMIcRAAGgw2Mzc0MjMxODM4MDUiDECyC2oTewSdQdb38SrcAwBwCUPh67G52N2YOSVkTgI%2FcQ0KtsU56n3zUC2r9vbDhtdCspw5avJivLHUVe8bwMipgMYtl4riIaqmByBjb%2FkNDmqTGDllr9VP9qV2YGpRzGdjM1jUIxJe3%2B9ZiuTgg6wYiWYttPK1KrZE4K9D7DqzPzymF%2BTxnFKc3YR89cHzSMSEwVMSxyJuRuDwX88YRgzHncD2ItHolRH9zlzNPfTCHCSts5Dbycbjpvu4qSz4VT05o%2FVj8iBIFJARDgTsZLS%2BaYM6D1WWtQNNeLa3IsGDLW7Sd6PRxHbh9Ja2qy%2BZNyUh5OSMJ2WLQFbQbRdtmHgeJU8XUHYFVK%2Bau75ii1Lauf%2B%2FVqv766suyGJHUq6obtT3TefRMqLuu7oSLWWMJLEOwnGb6EWUhS4DRKBRRCZAsVdFmpGP2KW%2Bnw%2B%2B70ztLS7YoWeBnrOaFFTdiHI9xlI4Q4R6%2BTj%2Bb1ve2Lv9EZFDb52b%2BTWB5T4C6a59Gf%2Bmyge2%2FIC2OXKrt7E3i%2B4QfEjjlkL8xzMhyj4kFxPGemIEVDsztGsFovrYIqLpgEPqwx805dyIi3ZEDOxq2l9VvCdiPlpY3O0bL2b%2BhIts9y6nDlVPg5AYLF7MIcKVHYTEfW5O1dmSHH9bI7obMJ2mvtUGOqUBStjHis0sEEc8ygzWGdSHYSF%2FseUm72hqbQ2mURbP513j1ccoNqwAG1siar1Ie4o0e91OZ3oFhS%2BVcvhSXscte5BaMTJ0YA2536oNtqi2sBhAc4a0qG2iMWPg0aHg6cLenj6tGJyZNLz%2FMOFR39Xe8lZRNiXO%2Fb7TWImu6hyIdHs%2FtFJfgH4YEbqWxJS%2BBSkybkHGWbrtM4nz0WRCwZ%2BUYgNOb57p&X-Amz-Signature=d6e7684616704c803cfe0fbd4f67ce68d020014de7167aa4c75497a39524d39e&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

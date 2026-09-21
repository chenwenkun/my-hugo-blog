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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466TIGEBKOM%2F20260921%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260921T112307Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEMH%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIEWjOw32jX%2Bt8pI3j3DA%2BgvYjW1DSs%2F5EJ7U%2F%2FclAXy7AiEAvFnDZyJqf08qmwIGT1rN9PVo%2FMtD00koZGgLHKm1MgcqiAQIiv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDOakAoY14Z7MKAZauircA0gWKeSQ1bgxWOueV0E7fS1aq1cTUyMfNnABUnpR3SvJNwk7ZcgJdcTblhURYSumFECzoKn0TCWdeLD9cwDbwStS87mrgZa5XLXqvLxm%2FYzm12E0IvFn9x%2F2mDRftU5YwZzrdhGiKHY3Yh6ijnZRdeP0IHdOyBk%2FYTUp%2Fl3nRmU91mwOYx3bbN5eOKcTlFWX454vh5GMMiVmoPNE8%2FR7mw1yWMCtW4oXudad1u7QnoqXZU%2FSqf3ytnEcPnMxTq9%2BKAtrW%2BGBtQClRYCKzD%2BNmZPXSgg2PuG15%2BZcn9szHTBesLBKeom1hXxSGMCfqBgtglSYBAy6bOmfS2pipS8eyENeHWhbhwVojYGjfZCX8079a1bqSBNrGAr%2BLWIGYkSOblZgnMjgttFLcaRIv79ELTUXCzBfVyVx3uQrDEYFHybxnmAbnwaMHSi0fHqVx9mU4r%2BHGlQCM2%2B0lbhEJKWOW7YEHpCaRyYgnzgCRD6Q2XDh5Dbhef0LUPnFlp7oeJH1g11a3qR1y9eS1CTste4uqr5oJOwT%2BYIbzeeJOksbgNPCnAsfDrwXIt7ffO4yCGPFiaz14ckR%2B3cFqIEWbgamLa7kewXgJk54i70XUW3DMIZw%2FHYH8Fo0CAFrLvARMKnrw9UGOqUBIOyYvjvWi7q75eauiVh3pCWeTak1emLCYBBI8wsMDcwvgWRV9P8B7EQ0so8ULgVlwG%2BGoX0eMKy9xheE%2FlKBYbVqbi%2FxchR13OtZsG5IoX4AwPMsVfnji5B8yh4fZwEiI8MGU%2FMTIhzsE2KDqqgNvH0%2FVhR1ZyBwvAJphZvdSEVdqf0reF13c0fN66K8uDjtG8SKOnpOAhvdgAJOHFZxw1B%2B0JOm&X-Amz-Signature=a711c0500f2e240ed018e6471117d9d82010a1eaf863c9da4a8cfd801593a0db&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466TIGEBKOM%2F20260921%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260921T112307Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEMH%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIEWjOw32jX%2Bt8pI3j3DA%2BgvYjW1DSs%2F5EJ7U%2F%2FclAXy7AiEAvFnDZyJqf08qmwIGT1rN9PVo%2FMtD00koZGgLHKm1MgcqiAQIiv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDOakAoY14Z7MKAZauircA0gWKeSQ1bgxWOueV0E7fS1aq1cTUyMfNnABUnpR3SvJNwk7ZcgJdcTblhURYSumFECzoKn0TCWdeLD9cwDbwStS87mrgZa5XLXqvLxm%2FYzm12E0IvFn9x%2F2mDRftU5YwZzrdhGiKHY3Yh6ijnZRdeP0IHdOyBk%2FYTUp%2Fl3nRmU91mwOYx3bbN5eOKcTlFWX454vh5GMMiVmoPNE8%2FR7mw1yWMCtW4oXudad1u7QnoqXZU%2FSqf3ytnEcPnMxTq9%2BKAtrW%2BGBtQClRYCKzD%2BNmZPXSgg2PuG15%2BZcn9szHTBesLBKeom1hXxSGMCfqBgtglSYBAy6bOmfS2pipS8eyENeHWhbhwVojYGjfZCX8079a1bqSBNrGAr%2BLWIGYkSOblZgnMjgttFLcaRIv79ELTUXCzBfVyVx3uQrDEYFHybxnmAbnwaMHSi0fHqVx9mU4r%2BHGlQCM2%2B0lbhEJKWOW7YEHpCaRyYgnzgCRD6Q2XDh5Dbhef0LUPnFlp7oeJH1g11a3qR1y9eS1CTste4uqr5oJOwT%2BYIbzeeJOksbgNPCnAsfDrwXIt7ffO4yCGPFiaz14ckR%2B3cFqIEWbgamLa7kewXgJk54i70XUW3DMIZw%2FHYH8Fo0CAFrLvARMKnrw9UGOqUBIOyYvjvWi7q75eauiVh3pCWeTak1emLCYBBI8wsMDcwvgWRV9P8B7EQ0so8ULgVlwG%2BGoX0eMKy9xheE%2FlKBYbVqbi%2FxchR13OtZsG5IoX4AwPMsVfnji5B8yh4fZwEiI8MGU%2FMTIhzsE2KDqqgNvH0%2FVhR1ZyBwvAJphZvdSEVdqf0reF13c0fN66K8uDjtG8SKOnpOAhvdgAJOHFZxw1B%2B0JOm&X-Amz-Signature=0873a9821f61d57541672746806bd9edeb207fd44ceca76628dc1013c23673f2&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

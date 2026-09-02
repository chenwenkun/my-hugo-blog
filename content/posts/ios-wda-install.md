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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663IQL4ATW%2F20260902%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260902T153408Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCICQub0uYGHTu9Fr1bY35Xdih7SDDsEOMjb993CpjRRPlAiA4E%2B1mcY5sAEtB8B19b7ICIdG92hSA9BfJym3idNSSVSqIBAjI%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIM5Kjfz6TTtmUNAMZ1KtwDb2I0CvA%2BC%2FbJo%2BhZy0uYgu5SYr536iYC6e7AoB%2Fj%2B73aZ86Xm3VD3YjjxjYwn460kofSPCW3%2BqzUPynzV0p92JSv4%2BxJobN6Cnfz0tvFSOEkGEjQJNzPB7yrGfZrRSSvg1CpOZMQe0QG5MhoSuTP5Ftm8aFjkugCnlUioLmGS5ziHqSnWkfjNWlMpVsOaGn7z0LetHCWDiifyq2AJIK3WtPHQHZCTN4fvxHvqynFvl1bGxr%2FmjB7W%2F7pCG%2BosbvbFh6Po7T3%2FU%2BVn6CnMYZfoVPqRGHvTQOj1OyBDjuJjs1D94wHdn3maJ11EGppz1ckMU1jO1FONdqmPXjhmBXH8rBFCQivjZT4n6lIwM7wQxjSmpVkvi2jp9Ok6fbHUmyfOA%2B8beeoivZqX2CtNPaN8YLklVxOnVuGatQypo1RF8uaBBxCuxhDPun0GPDSlhEKeUrBhwhH42ZujVI3ZBiYeHIDhEjFby1aDXZXwfhhvEk0JmNZVfrQQ6CLF%2BKwShkY9%2FA1vk8VLMhNYRVcft0HX63b3vnDfv5259NzXWN1r%2BYVpkRdu%2Bvf%2FeuzR6XtyxlmvQp95v2%2FQEOsdMmwxbLEOjCOAa9UPUBAKE%2BxSypqPKfWgEx638URTKlKGVIwiffg1AY6pgEySKDjTqG8xMtfsyl07V8btJZIdCOJAD6aebvim9HuFMoNZ5v6bGh204Hkf4KO7JtouWudp2XM1FfYEcCmymtAmIckapg%2FpyRyahgyNLkwgYp%2FbUL29ot9TO4Zl7kpu74qqsNvOt08pCRWVD4%2Bb5N%2Fh%2B1gxpWwdzoa%2F86xaeyJ3gyNd5n1sWjmZsGSMadLLWJLbUmuLQDAmPWwE07%2BdsKSHT5LOq6C&X-Amz-Signature=eece9c25121cba4dcb1c3139bbba75a86c20863cf0ca97db2f2dd1114dd14e98&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663IQL4ATW%2F20260902%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260902T153408Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCICQub0uYGHTu9Fr1bY35Xdih7SDDsEOMjb993CpjRRPlAiA4E%2B1mcY5sAEtB8B19b7ICIdG92hSA9BfJym3idNSSVSqIBAjI%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIM5Kjfz6TTtmUNAMZ1KtwDb2I0CvA%2BC%2FbJo%2BhZy0uYgu5SYr536iYC6e7AoB%2Fj%2B73aZ86Xm3VD3YjjxjYwn460kofSPCW3%2BqzUPynzV0p92JSv4%2BxJobN6Cnfz0tvFSOEkGEjQJNzPB7yrGfZrRSSvg1CpOZMQe0QG5MhoSuTP5Ftm8aFjkugCnlUioLmGS5ziHqSnWkfjNWlMpVsOaGn7z0LetHCWDiifyq2AJIK3WtPHQHZCTN4fvxHvqynFvl1bGxr%2FmjB7W%2F7pCG%2BosbvbFh6Po7T3%2FU%2BVn6CnMYZfoVPqRGHvTQOj1OyBDjuJjs1D94wHdn3maJ11EGppz1ckMU1jO1FONdqmPXjhmBXH8rBFCQivjZT4n6lIwM7wQxjSmpVkvi2jp9Ok6fbHUmyfOA%2B8beeoivZqX2CtNPaN8YLklVxOnVuGatQypo1RF8uaBBxCuxhDPun0GPDSlhEKeUrBhwhH42ZujVI3ZBiYeHIDhEjFby1aDXZXwfhhvEk0JmNZVfrQQ6CLF%2BKwShkY9%2FA1vk8VLMhNYRVcft0HX63b3vnDfv5259NzXWN1r%2BYVpkRdu%2Bvf%2FeuzR6XtyxlmvQp95v2%2FQEOsdMmwxbLEOjCOAa9UPUBAKE%2BxSypqPKfWgEx638URTKlKGVIwiffg1AY6pgEySKDjTqG8xMtfsyl07V8btJZIdCOJAD6aebvim9HuFMoNZ5v6bGh204Hkf4KO7JtouWudp2XM1FfYEcCmymtAmIckapg%2FpyRyahgyNLkwgYp%2FbUL29ot9TO4Zl7kpu74qqsNvOt08pCRWVD4%2Bb5N%2Fh%2B1gxpWwdzoa%2F86xaeyJ3gyNd5n1sWjmZsGSMadLLWJLbUmuLQDAmPWwE07%2BdsKSHT5LOq6C&X-Amz-Signature=0db464ffc124194955d419a25696cfb47e1b3c8076c4bd29b5c3b0dc2deb49c2&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB46662S6SVKB%2F20260912%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260912T195021Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEPP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCqyRczIyu4dze%2BHnfW8Glbiv4qwmURVqze%2BNeTPF4TfgIhAOTvCa86ROlltxZyKGFQaYPAxpMbSDS2fh7MOF%2BWX9xOKogECLz%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1Igz%2FzuPbnA3Fcml1T0wq3APwEsNUrG2i3NeUOFhpznyhMuWfAtsZAs449eFEHptgFoT24NX%2Bk68%2F7QbRa0yYFJYPOIepTKlWi9WuzrQFXrPnxCuJ0T%2FyM8%2FHKdqQ1z%2B3%2BFSc6HXVsQ62d340cvI8zm1MytBXU0M1kxYyyc3YH7KbatUMYhZ%2FZKSe5MNs4dE4mQnO5jctPZdpucYy45tmoxz7mfwMmkcA9oAl1vyHXhraucMOL7NDgM11rgFrPzVVmi9QlPWZEEBjVbDGtf7W0iedlCK86EhLf6BgifF28gAimCUv4bI%2BBwbbgYoWU5F%2FGsybNs9wCmgKjMCH1l%2Bpd0IIh1406jZ0BBuxg6E4eqkeY4rj6%2FWM3y2H%2BLWf1lFPvzobQZpwShFP9RSYPR8L0%2Fe3%2Ba97xM4JCBr8JcZwZQJW5BaE3a7y5d5bZF6PfqKzX%2BAG10PP9cSBPoVKdaRRVUV%2B3YllCizeyCSeQM3qPYUtFqUWUVllalQhi46fmI8Flm3XFNA4yLYhXDPMK1SLtzfEHPOLJoZo8RcHT%2Fvqtfkm5PpqKPzJfKjBPzClAjEVv1HDp3DnpSUW0ic7Zd%2BQuZKXi6lk%2BWBHla976xUUK2Ewot%2FKGQUi1QwCjrnKCIqqBDgqhQPhpRdUmlo2KTDlyJbVBjqkAV11V437Tea%2BQ%2FcmZBTBUvMKC7YLwRgcVrcBRWJgEcvJUptPD0JnxyyemlRd2ONZOWOs47Rk7fZttNWwiZnsEV7SElM9oWTuPiRcv%2B3o2zWpqwwGNZjFNlGmwR9dhwS5%2FtGYt3O633y6zI5XieGX9T89LU3Ffh00lxRqIc5P8mkGPpW5xzo5kBe8Q4dhqpy%2BvBTx%2BY3X%2Bn2o6IxEPOihs%2BEzb2Br&X-Amz-Signature=35a82a1aa7f87397921efc45d339c8b7a35f55fc9881cf3c27440bf1fc3ebd44&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB46662S6SVKB%2F20260912%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260912T195021Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEPP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCqyRczIyu4dze%2BHnfW8Glbiv4qwmURVqze%2BNeTPF4TfgIhAOTvCa86ROlltxZyKGFQaYPAxpMbSDS2fh7MOF%2BWX9xOKogECLz%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1Igz%2FzuPbnA3Fcml1T0wq3APwEsNUrG2i3NeUOFhpznyhMuWfAtsZAs449eFEHptgFoT24NX%2Bk68%2F7QbRa0yYFJYPOIepTKlWi9WuzrQFXrPnxCuJ0T%2FyM8%2FHKdqQ1z%2B3%2BFSc6HXVsQ62d340cvI8zm1MytBXU0M1kxYyyc3YH7KbatUMYhZ%2FZKSe5MNs4dE4mQnO5jctPZdpucYy45tmoxz7mfwMmkcA9oAl1vyHXhraucMOL7NDgM11rgFrPzVVmi9QlPWZEEBjVbDGtf7W0iedlCK86EhLf6BgifF28gAimCUv4bI%2BBwbbgYoWU5F%2FGsybNs9wCmgKjMCH1l%2Bpd0IIh1406jZ0BBuxg6E4eqkeY4rj6%2FWM3y2H%2BLWf1lFPvzobQZpwShFP9RSYPR8L0%2Fe3%2Ba97xM4JCBr8JcZwZQJW5BaE3a7y5d5bZF6PfqKzX%2BAG10PP9cSBPoVKdaRRVUV%2B3YllCizeyCSeQM3qPYUtFqUWUVllalQhi46fmI8Flm3XFNA4yLYhXDPMK1SLtzfEHPOLJoZo8RcHT%2Fvqtfkm5PpqKPzJfKjBPzClAjEVv1HDp3DnpSUW0ic7Zd%2BQuZKXi6lk%2BWBHla976xUUK2Ewot%2FKGQUi1QwCjrnKCIqqBDgqhQPhpRdUmlo2KTDlyJbVBjqkAV11V437Tea%2BQ%2FcmZBTBUvMKC7YLwRgcVrcBRWJgEcvJUptPD0JnxyyemlRd2ONZOWOs47Rk7fZttNWwiZnsEV7SElM9oWTuPiRcv%2B3o2zWpqwwGNZjFNlGmwR9dhwS5%2FtGYt3O633y6zI5XieGX9T89LU3Ffh00lxRqIc5P8mkGPpW5xzo5kBe8Q4dhqpy%2BvBTx%2BY3X%2Bn2o6IxEPOihs%2BEzb2Br&X-Amz-Signature=6cce8485eab7f140c3d909dd898d63b7389eeaf2e0290cbb1f7393691ffb70ca&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

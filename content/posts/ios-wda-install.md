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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466YHESGFSS%2F20260809%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260809T122700Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjELr%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIEeyycuN1jfnDEVy88qVmiHOfE55W%2BS4YR5gQ53d4JJ%2BAiBrj9%2BPjqg7kl2eklg1OUmubJbcp1T%2F9jVh7Gxj1YLFkyqIBAiD%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMBobm4I2DcwzqjExpKtwD5bXepbhVPVxz4BG7Nz2mjwa0aEA3xi%2Bu5HY0XOmjkMmJinKrw9BlL0qs9%2FYCQSTrN3WBEBcYyT3Z%2B2%2F0jUqp%2BxV0wnmqFltPgw2LVJM0jUx%2BOMhGE%2BsS%2BFwwuta%2F71ZSi9xjU5celugpw%2FK83wFfA6R%2B0AfXsa%2Fxu05SSmUe%2Ffw0lnEAB8ne%2BQ01WbfX6SNjZshH5b9AE5qFA6Zty6P0Ls6ye97Tcq9dwNKKYfNDhayurYZYITU2bW8AzcuKBoRtmDC7RAlGBkGE1zTv3hkR3ily2DdrLHEwd1fNImfkECbeDJELWCmb0kXroeFxNTpxDQ5nvrl%2Fa35rzuhcMbXueZG8RSKNetD1rh9e2di87kiVGT9mW6dMcBO5YkwyfJOFnCo%2FNOvCZGz9w3E%2BEojeS2Eau59yA6eP45%2F4ESP20RMmuNXsEtsBahLygQ%2FGlLTwfxEr%2BbZlCv8xG%2F90M%2BuLYJw090ZDjiJVcxhbTKl6BmUe965%2FFEhr1%2FvRQU8fgwno8hQifKCmeXM2b%2BFi462peqhyEE107NJ6lNalwI3MLW4LfUePfNGubk9xsaFb77h3vk5RQCaO3nt%2Fg9%2FB8vMtJqlujo5Xwt1Ac5rcHZmCXbELfLHe3K9eGzY24yAw96Lh0wY6pgEwNFqsqfrJVpje7OZFj2uDJEES6qceKosOvjAludqaKlagvFzuCM2rkKKiEtlyJ5Y7jTSLD78y8PhzPvONe1WCbXLx%2F%2FebNbZz1yT9FwUfEO8y2SnwcSFJgVy8%2BHLEKfHqLE3WfajL%2Ft9NBLCLvjKtht59h%2B58zlK8d%2BoIfbCVI2cnDH%2BXZAdlamT3sUCt6hWyQccLDvNbfBKMdPsctq%2B3cvveSBdJ&X-Amz-Signature=0d44eb9a7698652ce08abdfabcfe3635c4d58370565a6b0dcdfdf7558afc3462&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466YHESGFSS%2F20260809%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260809T122700Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjELr%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIEeyycuN1jfnDEVy88qVmiHOfE55W%2BS4YR5gQ53d4JJ%2BAiBrj9%2BPjqg7kl2eklg1OUmubJbcp1T%2F9jVh7Gxj1YLFkyqIBAiD%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMBobm4I2DcwzqjExpKtwD5bXepbhVPVxz4BG7Nz2mjwa0aEA3xi%2Bu5HY0XOmjkMmJinKrw9BlL0qs9%2FYCQSTrN3WBEBcYyT3Z%2B2%2F0jUqp%2BxV0wnmqFltPgw2LVJM0jUx%2BOMhGE%2BsS%2BFwwuta%2F71ZSi9xjU5celugpw%2FK83wFfA6R%2B0AfXsa%2Fxu05SSmUe%2Ffw0lnEAB8ne%2BQ01WbfX6SNjZshH5b9AE5qFA6Zty6P0Ls6ye97Tcq9dwNKKYfNDhayurYZYITU2bW8AzcuKBoRtmDC7RAlGBkGE1zTv3hkR3ily2DdrLHEwd1fNImfkECbeDJELWCmb0kXroeFxNTpxDQ5nvrl%2Fa35rzuhcMbXueZG8RSKNetD1rh9e2di87kiVGT9mW6dMcBO5YkwyfJOFnCo%2FNOvCZGz9w3E%2BEojeS2Eau59yA6eP45%2F4ESP20RMmuNXsEtsBahLygQ%2FGlLTwfxEr%2BbZlCv8xG%2F90M%2BuLYJw090ZDjiJVcxhbTKl6BmUe965%2FFEhr1%2FvRQU8fgwno8hQifKCmeXM2b%2BFi462peqhyEE107NJ6lNalwI3MLW4LfUePfNGubk9xsaFb77h3vk5RQCaO3nt%2Fg9%2FB8vMtJqlujo5Xwt1Ac5rcHZmCXbELfLHe3K9eGzY24yAw96Lh0wY6pgEwNFqsqfrJVpje7OZFj2uDJEES6qceKosOvjAludqaKlagvFzuCM2rkKKiEtlyJ5Y7jTSLD78y8PhzPvONe1WCbXLx%2F%2FebNbZz1yT9FwUfEO8y2SnwcSFJgVy8%2BHLEKfHqLE3WfajL%2Ft9NBLCLvjKtht59h%2B58zlK8d%2BoIfbCVI2cnDH%2BXZAdlamT3sUCt6hWyQccLDvNbfBKMdPsctq%2B3cvveSBdJ&X-Amz-Signature=8f5cc4486dee9c7b719ec250cfc808d1052391912d53d91206b074ff854c5c4f&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

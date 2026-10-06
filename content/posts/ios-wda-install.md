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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4667SKXTKWB%2F20261006%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261006T215933Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEDIaCXVzLXdlc3QtMiJHMEUCIQDTQRfE91ii7kQgUJBkTTScerJ0BAq26vSAZIa16p%2FZ1wIgQDnIUV9RlVI3fUTXV06YLf2AIDL53a04DXORLLi7mUsqiAQI%2Bv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDDNZKDx9ucSVmXSezircAyQi%2Fa1LjPMtbdnKczMVW6FSStD3TSFwqflkIueE9NiC9i9Qym5ZWjIu0WgiLm%2FSe9ucXJkoWnCTUOypfOD1BCuPAKb8nQCcOW8iQz5g8bP6iuKH0QMDY7qFvA2w6s9L3iFMWw87JjRz1P3g6FNZoNDH1aC5ecFYe9%2Bp0Qvk7tc9oRsa6cvPTXXzBv9V1yjKmyeamTYFOxdVSChJxeLmAkJkNIE9urQegG%2BfLg8vvolC7%2FBHOh5Ui9ONexSzHHTRZp93kbtTSElKDV8tfgN9RdBifQHCzIJdF5gmJo6AiRzqf4e5clYmPhkmpV1Q2v%2F7uWhPX7cyeth2xz5W6BZTTLvy4uZvjkFxIeBFq3ajmsbGpzBek7m7t3%2BuYF68TnotUnC6s9nWUb3wncfPoaxJWQN%2B0Ao5abyP0JLRbx2OHkaopKdAqIfqVfIWCRWTsHEefCkxlHn8HQDW%2BUmNADgCK4e3Zm%2BrkOxbMUtKT2cDhSJIPDXo%2BAqJ%2F%2FHhyTGL7QvO8y%2FA5xN8KfqORM2JgRGgouVvWZkRXDJbKxkdg0vO4xPHmD0pw88u6NCMMSe9puywRQTRuONKppyz2ICdsZCvbODXez5WlN5pImIG26ua9aIrnLN08MjL7qp%2BVOVZMKLllNYGOqUBDmkGQQphnnLBFJbLST%2B6tRDgj8x0p2VVdEzESx0O0aV%2BPR2IdDPWG5QEX8cywlgJpzbR5OSFuQ%2Fx7SYgmSjBhR60w6qadKqt5Z52vMdPuNZK%2B4enk5zuePUB2JWCK1MIwCV0gNH51WxphkmjDUQxfaJhsA9XpSpVma%2F09OawZKQVM6JJRMPWV9%2BStjmcZ0UUM55h9UVBMiZsa6P5n%2F3pHs0Ha4%2BE&X-Amz-Signature=b21a1def557a598c01041cc659e592e8deda9a207adde9c7a2192519471015fd&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4667SKXTKWB%2F20261006%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261006T215933Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEDIaCXVzLXdlc3QtMiJHMEUCIQDTQRfE91ii7kQgUJBkTTScerJ0BAq26vSAZIa16p%2FZ1wIgQDnIUV9RlVI3fUTXV06YLf2AIDL53a04DXORLLi7mUsqiAQI%2Bv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDDNZKDx9ucSVmXSezircAyQi%2Fa1LjPMtbdnKczMVW6FSStD3TSFwqflkIueE9NiC9i9Qym5ZWjIu0WgiLm%2FSe9ucXJkoWnCTUOypfOD1BCuPAKb8nQCcOW8iQz5g8bP6iuKH0QMDY7qFvA2w6s9L3iFMWw87JjRz1P3g6FNZoNDH1aC5ecFYe9%2Bp0Qvk7tc9oRsa6cvPTXXzBv9V1yjKmyeamTYFOxdVSChJxeLmAkJkNIE9urQegG%2BfLg8vvolC7%2FBHOh5Ui9ONexSzHHTRZp93kbtTSElKDV8tfgN9RdBifQHCzIJdF5gmJo6AiRzqf4e5clYmPhkmpV1Q2v%2F7uWhPX7cyeth2xz5W6BZTTLvy4uZvjkFxIeBFq3ajmsbGpzBek7m7t3%2BuYF68TnotUnC6s9nWUb3wncfPoaxJWQN%2B0Ao5abyP0JLRbx2OHkaopKdAqIfqVfIWCRWTsHEefCkxlHn8HQDW%2BUmNADgCK4e3Zm%2BrkOxbMUtKT2cDhSJIPDXo%2BAqJ%2F%2FHhyTGL7QvO8y%2FA5xN8KfqORM2JgRGgouVvWZkRXDJbKxkdg0vO4xPHmD0pw88u6NCMMSe9puywRQTRuONKppyz2ICdsZCvbODXez5WlN5pImIG26ua9aIrnLN08MjL7qp%2BVOVZMKLllNYGOqUBDmkGQQphnnLBFJbLST%2B6tRDgj8x0p2VVdEzESx0O0aV%2BPR2IdDPWG5QEX8cywlgJpzbR5OSFuQ%2Fx7SYgmSjBhR60w6qadKqt5Z52vMdPuNZK%2B4enk5zuePUB2JWCK1MIwCV0gNH51WxphkmjDUQxfaJhsA9XpSpVma%2F09OawZKQVM6JJRMPWV9%2BStjmcZ0UUM55h9UVBMiZsa6P5n%2F3pHs0Ha4%2BE&X-Amz-Signature=86a45d8ea7d6d854cf592ab2ee57d7290e21cf9bc35a43fb3bab19fa07db4a13&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

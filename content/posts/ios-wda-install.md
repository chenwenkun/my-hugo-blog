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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466YY3ANZE3%2F20261004%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261004T160750Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEP7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCQt5Q%2FWwCOqT%2FPzzg0%2FEY6AeFD0WPQGZ9%2BVCM5bktY6AIhANQ4mLM8Pl6R%2BlceGEi%2FBys2FUEwETDTAY7RJE2zeSVhKogECMf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1Igycy4cixabGyyh6sfQq3AN7QtNGi7eVG3c2SYdoOj08FyK5%2FOi7I49acz4hMvyMfSPzE5jFgFoRdISMDg4%2BbnNoS7%2F%2FnCNiXy44IKb9GLib1JdrnQXFczP4PYqT4JshlvZfMWVVXbl9V7TVD1BGBF5sAZbhCfSIvamZ3Ud%2FDsdkSBs%2FMQ5Ma7AOxKgiWoF0ejw4Kl5qH4JHmTIby%2Fal3BXl58oOI29WxYuhwOAFEeqRqYFHO4je3hbveE79fnUPqg8pxPwje8omaeyJ556wq7aegZgD3NZhmUaOT7fJVKS2q5jDXAAAxXmCNEa03hv9iTbMC%2FmyuhrAR1H%2FeMRKBkpiC5vAUUXNCbxClYj2zZJf6Zwn6Y1hh6fLkvqpFwuaJ8MLtKKEJ3VVbw0uWVkM7rgnYQWuSjj5G92bbRCvkYEOtSD6yId4vP77bpUlrX3mH61g%2BMfTJRzf4uI5HcoatSGX9T4KkTgpnJbStNkyw3LYEgZM6NteQODUAUPQbB97K35gvuO6Og9Jnyt%2Fj1tnsNcZX07gTzQy736esNwzX78RSoBmPoxs0DiyOq7lmug9pzTj7k4U39OWu9yidPXL%2FcbXXnO5ZXi%2Fa1LC0GmeuxaziMhmDSAV5QTrtPj7RTrEn7vOUmJJFQGseJdxrDDKuInWBjqkAa9A1KYJS9yQYDBjo857zr7h0u8UQ6W2fQlDN84skuRr1sDLjpHS16FjH7itqL0M8JVVQDL5GUox8B%2FiAp5I%2BaaD%2FSuJbnHJOgX7glIVtIyX0z6Dte2VqUc2vIFA%2BZtL7b3YKUljtBDn%2Fxgcx9yQDSp01WO0z%2Bbqt4XgtACQLbmQ%2BSQow9AcCScJ5V%2F1iUbJiA9CHY0I0rXUeooiNe2FXyXq%2B5KZ&X-Amz-Signature=027a6eaf4c3ce1d8f7e1ada580542a54b6dab12d5f18afca1d819a7b9bdbb116&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466YY3ANZE3%2F20261004%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261004T160750Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEP7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCQt5Q%2FWwCOqT%2FPzzg0%2FEY6AeFD0WPQGZ9%2BVCM5bktY6AIhANQ4mLM8Pl6R%2BlceGEi%2FBys2FUEwETDTAY7RJE2zeSVhKogECMf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1Igycy4cixabGyyh6sfQq3AN7QtNGi7eVG3c2SYdoOj08FyK5%2FOi7I49acz4hMvyMfSPzE5jFgFoRdISMDg4%2BbnNoS7%2F%2FnCNiXy44IKb9GLib1JdrnQXFczP4PYqT4JshlvZfMWVVXbl9V7TVD1BGBF5sAZbhCfSIvamZ3Ud%2FDsdkSBs%2FMQ5Ma7AOxKgiWoF0ejw4Kl5qH4JHmTIby%2Fal3BXl58oOI29WxYuhwOAFEeqRqYFHO4je3hbveE79fnUPqg8pxPwje8omaeyJ556wq7aegZgD3NZhmUaOT7fJVKS2q5jDXAAAxXmCNEa03hv9iTbMC%2FmyuhrAR1H%2FeMRKBkpiC5vAUUXNCbxClYj2zZJf6Zwn6Y1hh6fLkvqpFwuaJ8MLtKKEJ3VVbw0uWVkM7rgnYQWuSjj5G92bbRCvkYEOtSD6yId4vP77bpUlrX3mH61g%2BMfTJRzf4uI5HcoatSGX9T4KkTgpnJbStNkyw3LYEgZM6NteQODUAUPQbB97K35gvuO6Og9Jnyt%2Fj1tnsNcZX07gTzQy736esNwzX78RSoBmPoxs0DiyOq7lmug9pzTj7k4U39OWu9yidPXL%2FcbXXnO5ZXi%2Fa1LC0GmeuxaziMhmDSAV5QTrtPj7RTrEn7vOUmJJFQGseJdxrDDKuInWBjqkAa9A1KYJS9yQYDBjo857zr7h0u8UQ6W2fQlDN84skuRr1sDLjpHS16FjH7itqL0M8JVVQDL5GUox8B%2FiAp5I%2BaaD%2FSuJbnHJOgX7glIVtIyX0z6Dte2VqUc2vIFA%2BZtL7b3YKUljtBDn%2Fxgcx9yQDSp01WO0z%2Bbqt4XgtACQLbmQ%2BSQow9AcCScJ5V%2F1iUbJiA9CHY0I0rXUeooiNe2FXyXq%2B5KZ&X-Amz-Signature=0d68638d9898466d7a6cb283e4bd14be6d5e14a657004acc9762cb946f28d3d8&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

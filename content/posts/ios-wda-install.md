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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466SULCSRFB%2F20260905%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260905T194045Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEEoaCXVzLXdlc3QtMiJIMEYCIQCKgRlqVYmVjkEOPqnyrvGMSH5tnPKPmCP%2BpCReVn1Q2wIhAIYQ0K%2FYjNJ5Yqhp2O3EEJxULthiCUHsUP2ozIVlihklKv8DCBMQABoMNjM3NDIzMTgzODA1IgwESuJwjYxVBwhxaV0q3AM%2BbbPrOFWilaJ9efQTn4l9GWSaY74gOHONjm34OR2EO30%2FJK2xGutidqfoM%2Fb1D14jS4LjYn7r9gBO1vmcMTNg%2FWK%2BiJw8weGt%2BKL%2FS7XGDyc4Eo8WEN4cQR14JFPDINowsnmUtJedoYjTUm0jrt8hIoxlICs7vKXTT3i7aQojFn%2F%2FtyasMN4gah%2FyzJ103GYPUZykalP7eHHaU7u16NLldZGWMm2iI6%2Fp1FfXQeJjOljnAwh55AYZliclcas5%2BTxF81Aq1PmrikaVMX3sWM8Zd%2FoEM9112mkiBpd%2Bkd%2FBYvuYPCJ0DA6i0QKdCx3NsFp2A1jJY2h5aqgexc1cBTGTJ9AkL%2BiSFPHYoVK5PQlEFuNjD1wKJBCR5foZ3EH9zN4g%2FotoVWPkRARZAP1Z9CAlIqs8eOPxJ9oyvr45CdSsGHmaJJNjd%2FW1S9y97Nj37QcVotFMdXHI3LvARnXo%2FwydGhmPh39EAOD%2Fug3%2FUXGZmfL74pulwBbjYkWijof8bkCJj%2BH5MbpxG3idYG%2BOKMXcsL%2B6C%2FwGKb%2BLsOA8L8ZrtWGstoo5bGLtX2gyvagB3A7pXaoudpfJ593uVZ4J5s5j0TPiTG9NDy8gzlBTLRfa0cC6zLLm6Tw3HWhXJDDWtPHUBjqkAenSAjhYv6cGRlkD96HeutW1X6RERaKQj78Tc2RA7TpE6g3Z8n9721fnYqxdgBtXPd%2BF4D5mde%2FgSO8g%2BkAC891xEUKZm8uPPNoWy%2FcbPSLRGlbC5p7LRV6y0ftkGdG%2BwDQGtRb8%2BlBXLmm5scVrP81tcsOX2Gfw6ZO%2BuHMpz6ndpXww9Tet6CmQ4TzOHddY5V%2Fh0pn%2B%2BWhXZO5zb1vGx6iu5Gzl&X-Amz-Signature=16381c44e70432ebb8001bc3f5edf64443db7b6e7fba1bd40c3bf435dcd91d38&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466SULCSRFB%2F20260905%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260905T194045Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEEoaCXVzLXdlc3QtMiJIMEYCIQCKgRlqVYmVjkEOPqnyrvGMSH5tnPKPmCP%2BpCReVn1Q2wIhAIYQ0K%2FYjNJ5Yqhp2O3EEJxULthiCUHsUP2ozIVlihklKv8DCBMQABoMNjM3NDIzMTgzODA1IgwESuJwjYxVBwhxaV0q3AM%2BbbPrOFWilaJ9efQTn4l9GWSaY74gOHONjm34OR2EO30%2FJK2xGutidqfoM%2Fb1D14jS4LjYn7r9gBO1vmcMTNg%2FWK%2BiJw8weGt%2BKL%2FS7XGDyc4Eo8WEN4cQR14JFPDINowsnmUtJedoYjTUm0jrt8hIoxlICs7vKXTT3i7aQojFn%2F%2FtyasMN4gah%2FyzJ103GYPUZykalP7eHHaU7u16NLldZGWMm2iI6%2Fp1FfXQeJjOljnAwh55AYZliclcas5%2BTxF81Aq1PmrikaVMX3sWM8Zd%2FoEM9112mkiBpd%2Bkd%2FBYvuYPCJ0DA6i0QKdCx3NsFp2A1jJY2h5aqgexc1cBTGTJ9AkL%2BiSFPHYoVK5PQlEFuNjD1wKJBCR5foZ3EH9zN4g%2FotoVWPkRARZAP1Z9CAlIqs8eOPxJ9oyvr45CdSsGHmaJJNjd%2FW1S9y97Nj37QcVotFMdXHI3LvARnXo%2FwydGhmPh39EAOD%2Fug3%2FUXGZmfL74pulwBbjYkWijof8bkCJj%2BH5MbpxG3idYG%2BOKMXcsL%2B6C%2FwGKb%2BLsOA8L8ZrtWGstoo5bGLtX2gyvagB3A7pXaoudpfJ593uVZ4J5s5j0TPiTG9NDy8gzlBTLRfa0cC6zLLm6Tw3HWhXJDDWtPHUBjqkAenSAjhYv6cGRlkD96HeutW1X6RERaKQj78Tc2RA7TpE6g3Z8n9721fnYqxdgBtXPd%2BF4D5mde%2FgSO8g%2BkAC891xEUKZm8uPPNoWy%2FcbPSLRGlbC5p7LRV6y0ftkGdG%2BwDQGtRb8%2BlBXLmm5scVrP81tcsOX2Gfw6ZO%2BuHMpz6ndpXww9Tet6CmQ4TzOHddY5V%2Fh0pn%2B%2BWhXZO5zb1vGx6iu5Gzl&X-Amz-Signature=90c300dfec2758af30bc99aa5787071786ed76d61bed7a8344862fedb9b55f9a&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

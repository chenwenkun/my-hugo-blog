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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4666VK3JAQV%2F20260902%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260902T201513Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEAQaCXVzLXdlc3QtMiJGMEQCIDwFkGnSSim8h7qGK2biVctn55QPeztR2dv6PB5iEtsmAiBHa%2BVAB7YMcYQEvoZH%2FC2k5I0oRTs3kWA8Hf9%2F7Tmx2SqIBAjN%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMY2G%2B%2BZ4DNwP2XmE1KtwDOAW9nvAHNnSLWc1pgNbelN4y0akuMuroOVrRQrW6JzApnoymRmuku5PAIXSe904CgmLjIBbb6Ku3ektkaqORYuVXmiGAOU%2Fl9K%2FH3%2FvRNqczW1fDtszHpBpWXB1jojCjVDpIi0IkuHSSvkZzFz5sHaT4weRLxZGpoTSm7KoNcy46ABk9cci%2Bc0kJrliNpP7AJ1Aa4%2BKuGSFPo2uRZh6YNUGeRGSBzv0XJXXT9K%2FFwyLoxMqCPFHjS4wCKMfYScZpGOt2zE2JVZ%2BPIhLcc6C0%2BAxNMHu1SzJfeGjtdAbyWHBw7Qq3nIYVYDHWP5uPeVzJPvwKLWFc0VgWy%2Fx74rxCt%2BGnwVX7N%2FUIREwf2%2FJ%2Foq4svy0q06JAYefej0A3OEthxH04tVdngfnh%2FYlymj%2FTf5YVAODD6Gp32eHsu4gFuqYvtwWwRvDvbKhWMv3rGFwURW5h2PCsMWu42SHFsVSAzazMu9VGTRG32XQyz8jWRC%2FmH2CwIi6uRUhbV85XPWzfmh0wTMZY%2F%2BMyhCK%2BwKItjpf6xReqwJGHwXdgLOgB1Pkqyzh0s3SdbS3y6JimJwlnsRkdoq2JJDorDILolN3LDY473sEjdQmwzfThKDJHm2naQX8apSk5wPEtolEwkvvh1AY6pgHzC5ce4HsWnoqSxBl13PmpsQlCibv8KF4hhmDzjlqzMvpNZEJKL1uQtjxfrWq6MPjCMjEcV6%2B0a%2FY%2BWCr5uxMt6F%2BaIQX217ntGRvIHC9MW39P4PacOBY1AoShOpAnkRdBdihA%2BJbOgSIn1gJKyk9SU7PzctzgtcycCr6%2B8gJgvuN9mRBnzpgjw5PNoxJVPbo2rABh5ZcLkAKg6YhnM6bQIRBq5roO&X-Amz-Signature=9502e747615ec749c2c3825bd1a976c0172bac6282de345af91fdfac23916802&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4666VK3JAQV%2F20260902%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260902T201513Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEAQaCXVzLXdlc3QtMiJGMEQCIDwFkGnSSim8h7qGK2biVctn55QPeztR2dv6PB5iEtsmAiBHa%2BVAB7YMcYQEvoZH%2FC2k5I0oRTs3kWA8Hf9%2F7Tmx2SqIBAjN%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMY2G%2B%2BZ4DNwP2XmE1KtwDOAW9nvAHNnSLWc1pgNbelN4y0akuMuroOVrRQrW6JzApnoymRmuku5PAIXSe904CgmLjIBbb6Ku3ektkaqORYuVXmiGAOU%2Fl9K%2FH3%2FvRNqczW1fDtszHpBpWXB1jojCjVDpIi0IkuHSSvkZzFz5sHaT4weRLxZGpoTSm7KoNcy46ABk9cci%2Bc0kJrliNpP7AJ1Aa4%2BKuGSFPo2uRZh6YNUGeRGSBzv0XJXXT9K%2FFwyLoxMqCPFHjS4wCKMfYScZpGOt2zE2JVZ%2BPIhLcc6C0%2BAxNMHu1SzJfeGjtdAbyWHBw7Qq3nIYVYDHWP5uPeVzJPvwKLWFc0VgWy%2Fx74rxCt%2BGnwVX7N%2FUIREwf2%2FJ%2Foq4svy0q06JAYefej0A3OEthxH04tVdngfnh%2FYlymj%2FTf5YVAODD6Gp32eHsu4gFuqYvtwWwRvDvbKhWMv3rGFwURW5h2PCsMWu42SHFsVSAzazMu9VGTRG32XQyz8jWRC%2FmH2CwIi6uRUhbV85XPWzfmh0wTMZY%2F%2BMyhCK%2BwKItjpf6xReqwJGHwXdgLOgB1Pkqyzh0s3SdbS3y6JimJwlnsRkdoq2JJDorDILolN3LDY473sEjdQmwzfThKDJHm2naQX8apSk5wPEtolEwkvvh1AY6pgHzC5ce4HsWnoqSxBl13PmpsQlCibv8KF4hhmDzjlqzMvpNZEJKL1uQtjxfrWq6MPjCMjEcV6%2B0a%2FY%2BWCr5uxMt6F%2BaIQX217ntGRvIHC9MW39P4PacOBY1AoShOpAnkRdBdihA%2BJbOgSIn1gJKyk9SU7PzctzgtcycCr6%2B8gJgvuN9mRBnzpgjw5PNoxJVPbo2rABh5ZcLkAKg6YhnM6bQIRBq5roO&X-Amz-Signature=b73a69c2baa5749ae8c1fb515819a2156473f82abdfc7f15ff049bd271beb9c8&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466WXG5BJHY%2F20260907%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260907T014700Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEGkaCXVzLXdlc3QtMiJIMEYCIQDKSucsf6zi0s6eLSOEy6g9PwzARn1xuJGBlJplnUSfFgIhALLKGW%2BOQaZkQBNQ8mw91n%2BEHyVgJBvqVAeEV0rFh90wKv8DCDIQABoMNjM3NDIzMTgzODA1Igy9DnuO7pq2ljSCouUq3AMP7raTIPavTwI1Cigk1wzjvh27iItQxeatLkkZqPjB%2Bx3E52phMEnGUuDhYIBLtwPe9p681MkHxU7%2BN7ApPQsjS6Yi%2FlyvTQYn8z%2FxvkRu32ALDB5IuCEVQ%2FtJL2YUjm5e938EPU%2FwQsd4tGlFGVXhYKGfV8dWLNNz0IdGqbgcpRVrcnxgKhWGTtIFJMAotEEZcuGTLWvhv04bVCL4O2mXM2h15riZch%2FPaPENB%2FqQosHexgMhRUq2HtlUl83Q0lYr%2B73PAZrqqfLItGNpofqfGT00b8fmrJGEx%2BnkRGjn6oGi3Ymju6FumX1eox3aOZpR%2BTZ5KMCkukO5guuj%2FEHxtq46dmEamFk2Tfg2v2%2Bz%2FMw09InqMktwmUSze8QK0bUetMMRUG%2BkAmyeuF35F30Ho23B1q%2By3zuhFiVp7o7plgac61QglA9uoMwG8J%2B7FbFambnf%2BlPi%2B759E5Iozgiquqwrz7MuEdKXFItDn%2FmGjvD96hb%2FBt45ooRgD9fZ6RRrcBnhIWv0D6FGN1DQ65cg6sS4aZnqn9cAAHLGE5NVrS0baAGaVM5rky1yARQ%2Bj39R4NDrkPM71gEoJWSSx6CdmGSyJG4rJ4UgVcR%2BCOcHzr81rqLgNDbFHj6IvDCBjfjUBjqkAY19K4IfJsavbiiQfhHYOo25ahLtteyL1TfvycC9CKSuNY%2BPeVO9tlLQeElu4QlL78wC5bN6NJ11S5IOxMU3WTeoKnxnW%2FREnz6u0OA8LpjcHhVut1wa3Uipr3eYOdpON2vq6aeziRF1%2BaiAaRo6fEtdczd0%2FjXDBQSCM1bsCa5RyPgWhriBCGq1Z7Z76UI%2FX5pijY0iAglyF8%2Bf6Gao48l12qys&X-Amz-Signature=29c67fe8b9188a0a28cf59576ad92422541066eb9ed2acc2160654e9a9f69f92&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466WXG5BJHY%2F20260907%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260907T014700Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEGkaCXVzLXdlc3QtMiJIMEYCIQDKSucsf6zi0s6eLSOEy6g9PwzARn1xuJGBlJplnUSfFgIhALLKGW%2BOQaZkQBNQ8mw91n%2BEHyVgJBvqVAeEV0rFh90wKv8DCDIQABoMNjM3NDIzMTgzODA1Igy9DnuO7pq2ljSCouUq3AMP7raTIPavTwI1Cigk1wzjvh27iItQxeatLkkZqPjB%2Bx3E52phMEnGUuDhYIBLtwPe9p681MkHxU7%2BN7ApPQsjS6Yi%2FlyvTQYn8z%2FxvkRu32ALDB5IuCEVQ%2FtJL2YUjm5e938EPU%2FwQsd4tGlFGVXhYKGfV8dWLNNz0IdGqbgcpRVrcnxgKhWGTtIFJMAotEEZcuGTLWvhv04bVCL4O2mXM2h15riZch%2FPaPENB%2FqQosHexgMhRUq2HtlUl83Q0lYr%2B73PAZrqqfLItGNpofqfGT00b8fmrJGEx%2BnkRGjn6oGi3Ymju6FumX1eox3aOZpR%2BTZ5KMCkukO5guuj%2FEHxtq46dmEamFk2Tfg2v2%2Bz%2FMw09InqMktwmUSze8QK0bUetMMRUG%2BkAmyeuF35F30Ho23B1q%2By3zuhFiVp7o7plgac61QglA9uoMwG8J%2B7FbFambnf%2BlPi%2B759E5Iozgiquqwrz7MuEdKXFItDn%2FmGjvD96hb%2FBt45ooRgD9fZ6RRrcBnhIWv0D6FGN1DQ65cg6sS4aZnqn9cAAHLGE5NVrS0baAGaVM5rky1yARQ%2Bj39R4NDrkPM71gEoJWSSx6CdmGSyJG4rJ4UgVcR%2BCOcHzr81rqLgNDbFHj6IvDCBjfjUBjqkAY19K4IfJsavbiiQfhHYOo25ahLtteyL1TfvycC9CKSuNY%2BPeVO9tlLQeElu4QlL78wC5bN6NJ11S5IOxMU3WTeoKnxnW%2FREnz6u0OA8LpjcHhVut1wa3Uipr3eYOdpON2vq6aeziRF1%2BaiAaRo6fEtdczd0%2FjXDBQSCM1bsCa5RyPgWhriBCGq1Z7Z76UI%2FX5pijY0iAglyF8%2Bf6Gao48l12qys&X-Amz-Signature=b7fb4547f0e626266c93a33671bb589e8a8913966bcba29364da87920f27dc54&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

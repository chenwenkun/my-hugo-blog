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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466SJB4JVVX%2F20261123%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261123T043923Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEKL%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQCnE5xeMcNdgGJuAzh6huvUqLiHpIGTZsTAkRnNrAQrbAIgDhBcZTwM8hF1vwzfnO43wGegWz2TVyFHrK1llS7k%2FEUq%2FwMIahAAGgw2Mzc0MjMxODM4MDUiDF9hLL6Jq0ZgWT3TYCrcA4m0LQvPUCjNUvPxq9eYIKiHMlqH042lbD7dltJd2kRNl8R6pOw5umsNDSZ6JQhHpmCRoFNY9nyBSV8n5ksw0kFGWQHJsfeX%2B6MJWumeg2xLPyyoLUjr3xC1ktRRilDeL1WpmpAzKfr6viqQGRFWOhPjTY4qsgpvL%2B96EAbwqmcepcHntAJROd627ruW4BBYeJuUOF0aMvc1WbUkhnjsOV%2FnASOcFXmTsKIXJjxaYB%2B9ck7njJhJMcsSFbySI5nDd2DtmxU7es9kafmcsBl6lEoQPFH8TFLVMrLSwzTljlUuXRn1ENy1mMG2mEHDR9n7XUa6NtGr%2F0CfMHMa97sU2jKLzyriVIedndhQWq6t4462NJoGscMC84x1rpDhYEIKiKykQEnuKNfAjfxfQVJ0dlp4ZUvsMGHcfbymsuZW4EDvZI%2BA%2BMSaPTI%2BzvCvdz2Ahq2OUtfXqvSkJPLLez%2BAoB3KVrn%2Bb%2FXdUflmou0DJibSVC%2BGz717nKwodmZ9wWTeWevyfWuiYWfcpUG4aUlXLNnCR6hveC6fN%2BBMULbXyvMpoaAzyPrqaSt5%2FscvN0Ax%2FVIzTSx3xyy3amLavBRkAzFGse%2FirZos5e2y85eR6y9CFc93zy%2BoOkp7sJ%2FPMMi0jtgGOqUBQZV2oqn6k50CMkv%2BCUDKEMdEMZS2AvO4BF9BQ427W4ZAb60V0%2B2S0FOs3DGaU6AnJ05v2h54Sot%2FjwryXsBnUh2JCjG5zIHDzwRaCSAID49Ty%2B0wM6BuU%2BApNFnPgzJOvhvDYB5jFqf9L5B%2BOw9746iaMso0H3N%2BHxMcdnUqe%2F3knrhhH2txrasD4aLClXUVC75bs1wq029nqX0sHKnacGiHEbu9&X-Amz-Signature=ae4b4a969eba5df8539484eeda94945dbdcfe06dc93f7e83bb7357b5c03357b3&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466SJB4JVVX%2F20261123%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261123T043924Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEKL%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQCnE5xeMcNdgGJuAzh6huvUqLiHpIGTZsTAkRnNrAQrbAIgDhBcZTwM8hF1vwzfnO43wGegWz2TVyFHrK1llS7k%2FEUq%2FwMIahAAGgw2Mzc0MjMxODM4MDUiDF9hLL6Jq0ZgWT3TYCrcA4m0LQvPUCjNUvPxq9eYIKiHMlqH042lbD7dltJd2kRNl8R6pOw5umsNDSZ6JQhHpmCRoFNY9nyBSV8n5ksw0kFGWQHJsfeX%2B6MJWumeg2xLPyyoLUjr3xC1ktRRilDeL1WpmpAzKfr6viqQGRFWOhPjTY4qsgpvL%2B96EAbwqmcepcHntAJROd627ruW4BBYeJuUOF0aMvc1WbUkhnjsOV%2FnASOcFXmTsKIXJjxaYB%2B9ck7njJhJMcsSFbySI5nDd2DtmxU7es9kafmcsBl6lEoQPFH8TFLVMrLSwzTljlUuXRn1ENy1mMG2mEHDR9n7XUa6NtGr%2F0CfMHMa97sU2jKLzyriVIedndhQWq6t4462NJoGscMC84x1rpDhYEIKiKykQEnuKNfAjfxfQVJ0dlp4ZUvsMGHcfbymsuZW4EDvZI%2BA%2BMSaPTI%2BzvCvdz2Ahq2OUtfXqvSkJPLLez%2BAoB3KVrn%2Bb%2FXdUflmou0DJibSVC%2BGz717nKwodmZ9wWTeWevyfWuiYWfcpUG4aUlXLNnCR6hveC6fN%2BBMULbXyvMpoaAzyPrqaSt5%2FscvN0Ax%2FVIzTSx3xyy3amLavBRkAzFGse%2FirZos5e2y85eR6y9CFc93zy%2BoOkp7sJ%2FPMMi0jtgGOqUBQZV2oqn6k50CMkv%2BCUDKEMdEMZS2AvO4BF9BQ427W4ZAb60V0%2B2S0FOs3DGaU6AnJ05v2h54Sot%2FjwryXsBnUh2JCjG5zIHDzwRaCSAID49Ty%2B0wM6BuU%2BApNFnPgzJOvhvDYB5jFqf9L5B%2BOw9746iaMso0H3N%2BHxMcdnUqe%2F3knrhhH2txrasD4aLClXUVC75bs1wq029nqX0sHKnacGiHEbu9&X-Amz-Signature=d354d1b8e328672366779bfc44cce25fa59d45fb8ebd4f76c9d9c4d7be3f46fc&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

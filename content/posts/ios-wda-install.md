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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466Q3JQZSYR%2F20260830%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260830T105301Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEK%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQC0ouGS7XSx%2BCtDJNfY3k74eDzso8zaM5yTh7a%2BknfTJAIgZjSEbZ4J8j9mYMuTnq2oy7XgFz9zvyrd8xkUQ7zycKYq%2FwMIeBAAGgw2Mzc0MjMxODM4MDUiDOcM3pYPNkuYx%2BRprSrcA2ZbMH6G4eqtQ2Pvrsm8WF9EfNiQaFZ%2FnNdmA9sv79ziZYncNT75F%2FuY2cgMMAHlxRmNIEjxWpBAAYEEZV6Vwe0GBbomyL0zyZ7WFYqJZ%2FYBDRUhlrd%2Bm77RJgPfbkI5jINoDFriVRTOZoboHSxRno9q%2BEnJW0BYR4k6gvsovjGWqDkgsaD04F5i4VXomvJ8SgMKUoo%2BgNYToiHhH1YiKj531AmUgu7Z6J7SyvLq24NT09Ptlk71XbpQhwL3UyRbjq7y3aBeQ%2BUpB9jQp3oiUXvAgUngJB389jIINwSQaOnswmc6U7kmBhecuz3Lv2sTuBDONYEWa%2FayyN2Wx5DSZ05cn1otGltx3JvHnYWOe3FGddBuRoU7KMStPUX%2B4Fw94X8tYIcKOvG5rdNwgpn%2Faqvo5NG%2B5WH9u7cReEqTwuWnzdxRay0oLnDdOrK7ttqKhqNxsKjYgAIWxklRkcfsKydak3PLhKq5fpox59W%2Bj%2BXRfRPXnZYYWL9Jda3AkGUvY1s2f1jSqd92Sb3maBo948XbwNrxTN58R72g7W6vnZz7Rh4Mbb%2BmeDLSi65M3sy7sCSYcbDe%2FOGGem1fWGFMPSqBFyezC5vSg95EKkdLPx%2FxCGSgM4oXkQrrfamXMMWxz9QGOqUBsROUCAcRtlnvd0jpZCTJ8wcm3QsRmEu8v0%2F2UaT7pQ8epkfpxyg2JPYBr7moKi%2FmXTGuJW6a3iNYI55AT2uackm5kanivixXwUTwLVjDNSLLhyYCVzFe%2F%2FZoeLcbLUlZPXF7pmH3cBFx4DPsWKM%2Fh3yYB%2BNcfKaNLk5dc4KSHGpaBqDC94%2FoBzUGB%2Fpg39QM3I2RwBe4BGbVUsxPtAcE4PG6Kh%2FY&X-Amz-Signature=7e0a4c8bf2e0eaf4df51acef06433e9c5770dcdb5cb1f2f303b4879bce20943d&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466Q3JQZSYR%2F20260830%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260830T105301Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEK%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQC0ouGS7XSx%2BCtDJNfY3k74eDzso8zaM5yTh7a%2BknfTJAIgZjSEbZ4J8j9mYMuTnq2oy7XgFz9zvyrd8xkUQ7zycKYq%2FwMIeBAAGgw2Mzc0MjMxODM4MDUiDOcM3pYPNkuYx%2BRprSrcA2ZbMH6G4eqtQ2Pvrsm8WF9EfNiQaFZ%2FnNdmA9sv79ziZYncNT75F%2FuY2cgMMAHlxRmNIEjxWpBAAYEEZV6Vwe0GBbomyL0zyZ7WFYqJZ%2FYBDRUhlrd%2Bm77RJgPfbkI5jINoDFriVRTOZoboHSxRno9q%2BEnJW0BYR4k6gvsovjGWqDkgsaD04F5i4VXomvJ8SgMKUoo%2BgNYToiHhH1YiKj531AmUgu7Z6J7SyvLq24NT09Ptlk71XbpQhwL3UyRbjq7y3aBeQ%2BUpB9jQp3oiUXvAgUngJB389jIINwSQaOnswmc6U7kmBhecuz3Lv2sTuBDONYEWa%2FayyN2Wx5DSZ05cn1otGltx3JvHnYWOe3FGddBuRoU7KMStPUX%2B4Fw94X8tYIcKOvG5rdNwgpn%2Faqvo5NG%2B5WH9u7cReEqTwuWnzdxRay0oLnDdOrK7ttqKhqNxsKjYgAIWxklRkcfsKydak3PLhKq5fpox59W%2Bj%2BXRfRPXnZYYWL9Jda3AkGUvY1s2f1jSqd92Sb3maBo948XbwNrxTN58R72g7W6vnZz7Rh4Mbb%2BmeDLSi65M3sy7sCSYcbDe%2FOGGem1fWGFMPSqBFyezC5vSg95EKkdLPx%2FxCGSgM4oXkQrrfamXMMWxz9QGOqUBsROUCAcRtlnvd0jpZCTJ8wcm3QsRmEu8v0%2F2UaT7pQ8epkfpxyg2JPYBr7moKi%2FmXTGuJW6a3iNYI55AT2uackm5kanivixXwUTwLVjDNSLLhyYCVzFe%2F%2FZoeLcbLUlZPXF7pmH3cBFx4DPsWKM%2Fh3yYB%2BNcfKaNLk5dc4KSHGpaBqDC94%2FoBzUGB%2Fpg39QM3I2RwBe4BGbVUsxPtAcE4PG6Kh%2FY&X-Amz-Signature=a60a8b4b862a57cbf7d89bd9594f22619e2f1dec87eef8103be9a3c52bf312d6&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466TWOZSSOD%2F20261125%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261125T014316Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEND%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIHeODwdDRDRAC9JMHftwlKX35fj5a42HpmA98LISljolAiB98ly%2FTdqA%2FpIFVVyAIg6XnKLycoGdIstv%2BIH9KP9aqCqIBAiZ%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMzOcBoJ1utYrtE%2FakKtwDrbXIgG10aXCi5W%2FhOV7v2jEnZQO7lWpmXIPVS4Xk3xF0wv5GL1VA8CtqHh67XqfTcvWyIEgxwvcIPGBMtRwV5hG4Qo6P1kfv4BvH0L61t74XAcimYB4nbXgiAWqprjbyCxy%2FtuZ89x%2Fz4tzbUtoS94n1svXWzwDN0Obn%2BrsNvMapBubHslWVatbb06BFtEGn7E%2FNNAJKq7MYXHz6rJWSrWZMA9XlWik3aSxWAn1kRb%2FNNQ0RjxgbYlmYlLCCGGEL%2Fhqw%2BlcoYpbqZUihtL3IE6NZjgm3vekoXjxYi5vK0L0BrF2aR6vIpS1OO%2B6hjya4FMI%2BiPvpGXyAdRtS3lHNp6uZmf3ojIvIgZ%2BwnRv92I9dWK6xmISYJJCum54OO5CBIj%2BGuxux9r438SW7GKwngtxNCIN8Zkz19iFlnfsdpLdRSSLbL5G3L02EZ90WSQWI0XFkp%2FNrRfr8s3BkNOLd9Hb5Jiq3u2Zj8XYqiue6qdwEz8nNV%2Fw63%2FNg2EqJAJP8SmB1FtRcz%2Fyb6hOUzBjZ1dXe6NyELJNVPsRBIeUdIpOvuOxl%2FC8RBjBKm1dpnpZX5c5Mg6FmL5ec2Ub0TZNzydnF298U5vQ10n678GOkRbST0tCNFKpBxSiVDcUw2MWY2AY6pgHbGCSOUv0H36gTpNZbbdFbh7iG4pnGAmnRK5qc6U3vE6Cc9P%2Fimtz%2Bfwvu9FED6630DwAgAbgVt02h6pmZP8QqIVqqLyNLbVx%2B8c9dGv%2FLoo5HleJAba7JSseSvI72U251IwYYkNpazOGFcSNi%2B8SrXI8Epk%2FmPVsJ8xRH8VuFQRHjDrGHSKwuRI%2B1jQXb6eEu1WLXF6vvWAmGEXXTfGQYLOnG3tC0&X-Amz-Signature=ae1328554bf509d01d2e1143381075a959bf1b2f2b54caf5abd1cae7c8da0a0e&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466TWOZSSOD%2F20261125%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261125T014317Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEND%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIHeODwdDRDRAC9JMHftwlKX35fj5a42HpmA98LISljolAiB98ly%2FTdqA%2FpIFVVyAIg6XnKLycoGdIstv%2BIH9KP9aqCqIBAiZ%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMzOcBoJ1utYrtE%2FakKtwDrbXIgG10aXCi5W%2FhOV7v2jEnZQO7lWpmXIPVS4Xk3xF0wv5GL1VA8CtqHh67XqfTcvWyIEgxwvcIPGBMtRwV5hG4Qo6P1kfv4BvH0L61t74XAcimYB4nbXgiAWqprjbyCxy%2FtuZ89x%2Fz4tzbUtoS94n1svXWzwDN0Obn%2BrsNvMapBubHslWVatbb06BFtEGn7E%2FNNAJKq7MYXHz6rJWSrWZMA9XlWik3aSxWAn1kRb%2FNNQ0RjxgbYlmYlLCCGGEL%2Fhqw%2BlcoYpbqZUihtL3IE6NZjgm3vekoXjxYi5vK0L0BrF2aR6vIpS1OO%2B6hjya4FMI%2BiPvpGXyAdRtS3lHNp6uZmf3ojIvIgZ%2BwnRv92I9dWK6xmISYJJCum54OO5CBIj%2BGuxux9r438SW7GKwngtxNCIN8Zkz19iFlnfsdpLdRSSLbL5G3L02EZ90WSQWI0XFkp%2FNrRfr8s3BkNOLd9Hb5Jiq3u2Zj8XYqiue6qdwEz8nNV%2Fw63%2FNg2EqJAJP8SmB1FtRcz%2Fyb6hOUzBjZ1dXe6NyELJNVPsRBIeUdIpOvuOxl%2FC8RBjBKm1dpnpZX5c5Mg6FmL5ec2Ub0TZNzydnF298U5vQ10n678GOkRbST0tCNFKpBxSiVDcUw2MWY2AY6pgHbGCSOUv0H36gTpNZbbdFbh7iG4pnGAmnRK5qc6U3vE6Cc9P%2Fimtz%2Bfwvu9FED6630DwAgAbgVt02h6pmZP8QqIVqqLyNLbVx%2B8c9dGv%2FLoo5HleJAba7JSseSvI72U251IwYYkNpazOGFcSNi%2B8SrXI8Epk%2FmPVsJ8xRH8VuFQRHjDrGHSKwuRI%2B1jQXb6eEu1WLXF6vvWAmGEXXTfGQYLOnG3tC0&X-Amz-Signature=7f8c1fd8a7c179814e2b9aa8e830ba1f237339ba05dae0b50d214b1d941d0730&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466X46TWFHQ%2F20260820%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260820T062526Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEL7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCID6z%2F06PzTqqq0BtNRet8a1qKyprFg%2FYt6yU7b5Kvf8DAiEA%2FkTSbZ29qqD2niBFpAUorlnAQ2HnZyKgYPeeLSi3ADMqiAQIh%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDAiPbKc5achRdGh%2FhSrcA9IveiiNWDsL76hUOVbc3qQ4o3qEpKIOnbhInWHDaDSF6xPKtBdkYeFykmxH%2FcX%2FrIAdDGPFNNHcqk7X7MzH6AIejCYa6laB7KMuu%2BlCMzMslFKrA2kT%2FuMINyfB8oj%2BKjeOMfJMcG6W06EkJ3%2FNa7hUVmKuTUQBdTwBjngnqr6TBfHIesNLD8F%2FOgpm5CT%2F3Adb0p8cQ%2FuSk9QK5jcJoewuT4G8S2j5dERYUJHO0k5rzfyLdihbcsyk4TKXRaaWz4xcDIqySKVUfrNuDfqzWMdVmnMWCZEPNGGGqUwSzS9C%2BbcScPBi%2Bl9JOsxdU6votRePNfj2wgNX3RgJSZTXCWcezRY4gVouXP2fc5kfzMVXFjrralUAsPUbnA1s1q0fVNmsvxz%2FI95Uhtv8W9mc8CDh42Ot%2FWYIb54qbKWugVHcTe2JFwaLXlPsgDR77r6NqK52%2Bj6g1px825GrnP2CLESoPwvOTzyLc7B0nqHVfiKvBNJoa6WQ7A5wKAiWJWjCiXC0D11vENvvog3x9YlQtdF58r4IuM9BUoVLNOq1WBty6SwcDgu5EuBfxzkN82AcWQOh7DDPbxITwJ3smUaRPEP2aX%2FOsA8K6u8J%2Fc2jCHHm2H9K03eUdcZljh1TMLiqmtQGOqUBT9xpwPvHlb4Yk4ZkK30mzArOx%2BfJA3ro7NuosuVlFB%2BBcMQ5UpKpvcsv0va9tIBwEa1mhuiRUsxsFFr7%2F%2BX6rMym%2Bq2LW3QBZ6qPJWv%2FrA6WETlsFJj4eCW%2FkeTk%2B7y0yhI9QgiW7eMMMZB7bMgGamtyNaw7fxnUEB6k1UHTkqpMTSSUCoEpwaRInN2rZkAqaVO9x%2B9SUzjAIHRVaO3gfsRqGv8Y&X-Amz-Signature=4945aa91db8c2f394dff2d3b7a0aac988ccdc73828c7fe42dc0a74fec502f18a&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466X46TWFHQ%2F20260820%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260820T062526Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEL7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCID6z%2F06PzTqqq0BtNRet8a1qKyprFg%2FYt6yU7b5Kvf8DAiEA%2FkTSbZ29qqD2niBFpAUorlnAQ2HnZyKgYPeeLSi3ADMqiAQIh%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDAiPbKc5achRdGh%2FhSrcA9IveiiNWDsL76hUOVbc3qQ4o3qEpKIOnbhInWHDaDSF6xPKtBdkYeFykmxH%2FcX%2FrIAdDGPFNNHcqk7X7MzH6AIejCYa6laB7KMuu%2BlCMzMslFKrA2kT%2FuMINyfB8oj%2BKjeOMfJMcG6W06EkJ3%2FNa7hUVmKuTUQBdTwBjngnqr6TBfHIesNLD8F%2FOgpm5CT%2F3Adb0p8cQ%2FuSk9QK5jcJoewuT4G8S2j5dERYUJHO0k5rzfyLdihbcsyk4TKXRaaWz4xcDIqySKVUfrNuDfqzWMdVmnMWCZEPNGGGqUwSzS9C%2BbcScPBi%2Bl9JOsxdU6votRePNfj2wgNX3RgJSZTXCWcezRY4gVouXP2fc5kfzMVXFjrralUAsPUbnA1s1q0fVNmsvxz%2FI95Uhtv8W9mc8CDh42Ot%2FWYIb54qbKWugVHcTe2JFwaLXlPsgDR77r6NqK52%2Bj6g1px825GrnP2CLESoPwvOTzyLc7B0nqHVfiKvBNJoa6WQ7A5wKAiWJWjCiXC0D11vENvvog3x9YlQtdF58r4IuM9BUoVLNOq1WBty6SwcDgu5EuBfxzkN82AcWQOh7DDPbxITwJ3smUaRPEP2aX%2FOsA8K6u8J%2Fc2jCHHm2H9K03eUdcZljh1TMLiqmtQGOqUBT9xpwPvHlb4Yk4ZkK30mzArOx%2BfJA3ro7NuosuVlFB%2BBcMQ5UpKpvcsv0va9tIBwEa1mhuiRUsxsFFr7%2F%2BX6rMym%2Bq2LW3QBZ6qPJWv%2FrA6WETlsFJj4eCW%2FkeTk%2B7y0yhI9QgiW7eMMMZB7bMgGamtyNaw7fxnUEB6k1UHTkqpMTSSUCoEpwaRInN2rZkAqaVO9x%2B9SUzjAIHRVaO3gfsRqGv8Y&X-Amz-Signature=4cf0a2995e59aebc0347fa7d85c9c613781503869d0ac04377d9bc935adc91c9&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

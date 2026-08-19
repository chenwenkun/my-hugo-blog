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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663WV7QEZW%2F20260819%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260819T003636Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEKD%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQDuLFNmel6Z8rPNVyZ02EozYNKM%2FFOxLkDdC7sM0DB%2F7wIhALlcYwGmqRx64Ps7dVE9TAFZFpLFiMXBPm0%2BlsYoQ5tcKv8DCGkQABoMNjM3NDIzMTgzODA1IgwuWdqx38SlSaCMj6Aq3ANJAzH9R6eej53z%2FmcUWCgicAzJhlZ4nASqC5bdg1rJ5nUsYXw1pVqsvSZvMk647rDFg4xBshoa4EF7OBuVCFswEz%2FjjMukgjRPZIHM7UNe4LN4ri8WXzSafdCB%2FZgAFx8lYwUu5I8VyMJYHf8dwZH0vRPLwAe8n%2FWs%2Bv%2F06GfgmiqlHSSY%2BhGYbKk9%2FhfooBTVHCFx2idkUJTcFF6oPDcfGZzDiNnMZBpbzNzX3zy65xh3h7t4KnnxWAfWjUDqrQo2OwcagGuO6xN%2FHmZUwzQufWdkuVkrDhr0Y3Y%2FmTkhhk8taxeFx9SOiCaiBpffwoAdGr5LRjEE3qw5oYi83iFJnKKTIgD9XXKIe%2F%2F6LJ1yb41DZgMMa9RMpowOxzQfTPlOHAewjuBU3wQ3inM%2FpL7mhc2m3FDhR711Pd9SpKXuTEzqdfSpsQzPwl4ob9o3rdebVHeEK7jCadPYojT4wNrIDmQ%2BcCLQ3yC8UplLMjShJsMFvSlajwVtqmBXabFJJoYETIWydBUV5yxKpqHkjG712moHzUp5E1b9BOQVQMtWZUhR0W6wNLS2UCJ41aa06swxKy18iUjgEgj93kcadkQ4f869O2ksL24r3DqRH5DwLJQKDvbGK%2FaFPbY3jDDT35PUBjqkAXHEzJylbOEMQSYzkTNOd5HGv2YUT6Jqd8P6yytuo2RLZkN9RcNvqoq6HluAIUz5Y57SwmOWVKHu9QgMtS4m9XWincQy4g79t%2BOt8oBVKIcZqZdjmDtUUagNuFd7pAgam6j02PeAGvFg28zSSZnHAxX%2BFHo6HOZ3HnyrDmS4A2PjVkybZOnRdH69OSr61BcDvd%2BVhV1M3SEjigqpnmdRGyw8UaaU&X-Amz-Signature=faff1c198d97db7b7be6901f5d78f02dd600d265ce7fabb6cd5cff51bd2282d6&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663WV7QEZW%2F20260819%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260819T003636Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEKD%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQDuLFNmel6Z8rPNVyZ02EozYNKM%2FFOxLkDdC7sM0DB%2F7wIhALlcYwGmqRx64Ps7dVE9TAFZFpLFiMXBPm0%2BlsYoQ5tcKv8DCGkQABoMNjM3NDIzMTgzODA1IgwuWdqx38SlSaCMj6Aq3ANJAzH9R6eej53z%2FmcUWCgicAzJhlZ4nASqC5bdg1rJ5nUsYXw1pVqsvSZvMk647rDFg4xBshoa4EF7OBuVCFswEz%2FjjMukgjRPZIHM7UNe4LN4ri8WXzSafdCB%2FZgAFx8lYwUu5I8VyMJYHf8dwZH0vRPLwAe8n%2FWs%2Bv%2F06GfgmiqlHSSY%2BhGYbKk9%2FhfooBTVHCFx2idkUJTcFF6oPDcfGZzDiNnMZBpbzNzX3zy65xh3h7t4KnnxWAfWjUDqrQo2OwcagGuO6xN%2FHmZUwzQufWdkuVkrDhr0Y3Y%2FmTkhhk8taxeFx9SOiCaiBpffwoAdGr5LRjEE3qw5oYi83iFJnKKTIgD9XXKIe%2F%2F6LJ1yb41DZgMMa9RMpowOxzQfTPlOHAewjuBU3wQ3inM%2FpL7mhc2m3FDhR711Pd9SpKXuTEzqdfSpsQzPwl4ob9o3rdebVHeEK7jCadPYojT4wNrIDmQ%2BcCLQ3yC8UplLMjShJsMFvSlajwVtqmBXabFJJoYETIWydBUV5yxKpqHkjG712moHzUp5E1b9BOQVQMtWZUhR0W6wNLS2UCJ41aa06swxKy18iUjgEgj93kcadkQ4f869O2ksL24r3DqRH5DwLJQKDvbGK%2FaFPbY3jDDT35PUBjqkAXHEzJylbOEMQSYzkTNOd5HGv2YUT6Jqd8P6yytuo2RLZkN9RcNvqoq6HluAIUz5Y57SwmOWVKHu9QgMtS4m9XWincQy4g79t%2BOt8oBVKIcZqZdjmDtUUagNuFd7pAgam6j02PeAGvFg28zSSZnHAxX%2BFHo6HOZ3HnyrDmS4A2PjVkybZOnRdH69OSr61BcDvd%2BVhV1M3SEjigqpnmdRGyw8UaaU&X-Amz-Signature=d0b8c410da6728ada6dec5e15b86ab93c9325262570f6a9f438cbd60296bee38&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4664YPGPALP%2F20260810%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260810T005500Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEMj%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQDNYMG9fRF6Em2JckxLcm4WZVazaMBaUrTiLwvVKRfNJAIgO%2F3ex1uEJ2hyNEMzU%2Fh1bhEkek7GazBMyGc2rljjVKwqiAQIkf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDN4hNZY4TFB8UQrbPCrcAxtyuIsTeGgrVvN6JJ%2F0J1uZKVPAkp17RRMw5kCZUg1GWId3FVY4bULBwejpIcYpy6pRmuO4YJxq4Z%2F8dSYe%2Fnl2Qnp2CxSrtW2rkxr7iIV7ZKq68jLbPZLBAKVbUIgJrm9JUBvfFmubNExxC71iwyaZAMMEKmc7F5pDlVecJ842QkluYVXsoocTDLKUM%2But7dXuLAGhtE7HtalrngYpTCLqCH0OZIWntc%2FXH2S87aiex8EGx8n8r6VQJESkgQM9m64qcZwO7OIbn2rjT25AKgTIsQbIeIWeQvYhjW6QAytbf6KBQquB28phTSc7Pdc5gRkPCm3GTTBg1e6lB9ahRWPxjDgL8RufzG9u13Wobm8Ker4gjH9RCWJu3jrHkhuFrmS%2BJeyvhXx86tj47tIvKoElnI71fOT0WZD%2BGt9gTbikBatVF%2BvVcIboxwn%2BrgJXNNnVK26u0flqRh8C7W%2BWldfai4u2ZDmAEC0RIqM9BQSdtAzMlEg8oZwUAL5dJQuXHHrUwZsY9qTqIwc6sfO%2BfU2DtjqsbnDoPiA7K4MLK9Fc7ftFKA6FtaGx5bdOVgHzEGeJCu2K%2BC5dLkdXuKvJ6kgZdL8a3h4F2FbrLHeb%2BV8EZ4KGsmCJPDFWJeAMMJ6w5NMGOqUBMlbBdAf9OsKcT8VFWEPHajzpQSPMVYXdWALlCYNc3y3lZC8FP9C4G4IU6xWo50URKz%2BNuIRQIWxBQ307libZDmiaiTf6%2F7OPZ72NxUmaL0ZlqchuGLcVg17wBMwgnE1bL%2FRjSzf2diA6Rg0T86GEuqJ4bDCOpMgSJj%2BbT6TKspYIEhLX3MKXA8QuifkboRLqs7kvQzXYX4aNSridq8BJ2Yxz9HrY&X-Amz-Signature=f4a530b13dcb232648282fb8cd8b313579534f5e40a3175e2e73faa503221068&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4664YPGPALP%2F20260810%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260810T005500Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEMj%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQDNYMG9fRF6Em2JckxLcm4WZVazaMBaUrTiLwvVKRfNJAIgO%2F3ex1uEJ2hyNEMzU%2Fh1bhEkek7GazBMyGc2rljjVKwqiAQIkf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDN4hNZY4TFB8UQrbPCrcAxtyuIsTeGgrVvN6JJ%2F0J1uZKVPAkp17RRMw5kCZUg1GWId3FVY4bULBwejpIcYpy6pRmuO4YJxq4Z%2F8dSYe%2Fnl2Qnp2CxSrtW2rkxr7iIV7ZKq68jLbPZLBAKVbUIgJrm9JUBvfFmubNExxC71iwyaZAMMEKmc7F5pDlVecJ842QkluYVXsoocTDLKUM%2But7dXuLAGhtE7HtalrngYpTCLqCH0OZIWntc%2FXH2S87aiex8EGx8n8r6VQJESkgQM9m64qcZwO7OIbn2rjT25AKgTIsQbIeIWeQvYhjW6QAytbf6KBQquB28phTSc7Pdc5gRkPCm3GTTBg1e6lB9ahRWPxjDgL8RufzG9u13Wobm8Ker4gjH9RCWJu3jrHkhuFrmS%2BJeyvhXx86tj47tIvKoElnI71fOT0WZD%2BGt9gTbikBatVF%2BvVcIboxwn%2BrgJXNNnVK26u0flqRh8C7W%2BWldfai4u2ZDmAEC0RIqM9BQSdtAzMlEg8oZwUAL5dJQuXHHrUwZsY9qTqIwc6sfO%2BfU2DtjqsbnDoPiA7K4MLK9Fc7ftFKA6FtaGx5bdOVgHzEGeJCu2K%2BC5dLkdXuKvJ6kgZdL8a3h4F2FbrLHeb%2BV8EZ4KGsmCJPDFWJeAMMJ6w5NMGOqUBMlbBdAf9OsKcT8VFWEPHajzpQSPMVYXdWALlCYNc3y3lZC8FP9C4G4IU6xWo50URKz%2BNuIRQIWxBQ307libZDmiaiTf6%2F7OPZ72NxUmaL0ZlqchuGLcVg17wBMwgnE1bL%2FRjSzf2diA6Rg0T86GEuqJ4bDCOpMgSJj%2BbT6TKspYIEhLX3MKXA8QuifkboRLqs7kvQzXYX4aNSridq8BJ2Yxz9HrY&X-Amz-Signature=faafef483c7d425f3637a522f24e6979cd58a32de7bcc454a37d5e71b144d9f8&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

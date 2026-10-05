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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4664Z55PGN3%2F20261005%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261005T025614Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEAsaCXVzLXdlc3QtMiJIMEYCIQDCCwSVntFezaaSeb9zgUszm7yIfBbsTMhKNeo5V4wF9AIhAL6%2BUA%2FN17jgL6eCJo0Yh5TzKDboTaz1nI1wFGr6mqhyKogECNT%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgwP7QOSO7%2FfhdLX80Iq3AMw8GV2xpGYgpvRQMQTcRTj6frDtc%2BaB7n3Bxf6LrgULpATXe04tLlESElvy0REKWFtGVKVw3xylr%2B3b6vr5eSBlrhoNUb%2FvQMj95TKQUE9vlkujtgPx%2FhDADArdRwRLYhJJkFdrjTL7LMFhi9vlj0egPuq3%2F37RwoDk2rdVzQ9MAdMBl1ezT5B9%2Fein9N9Y6%2BGyxnev%2BZnSRNdHDutiaJv2UOBNV%2FewgbrDY9kB1zg3xpCXyhAGUAtUpsmhwwgMh9xT324ag%2Fv0cXURQj5w1rxriBMNUfGz4bi%2BIPTxDCCEb4ngKBUrx5fIVrVZ08fgzshs85zfI7GC9xo99p2tItKbysqsIu0mxqHopPGMciYEybDgGuQ7A06pmfzfWZsnGtwm27O7p62is5m5aD1paNC1qeDI09fgav3mTEJTpP1%2FPjq%2FhEb57dI%2BokSG%2Bh3yDSfNbi6GbIgN1gbqULVF3bqAg22Ife0LneJrwZKRu%2BDQhosiVwBTZhWujVdOoQMjYli1y125mNz9YcDjGNDsBxxyisTKzcbRhmy4zbbE%2BgLWkyKvhFCH5ccwwBTsZ7ZR5rs10WWFmimVnAHDCeaT%2F8%2Fg3y0oKnVJT2LBv7ev3YA6wkejS3gyy2rlZ5R5jCCnYzWBjqkASv3iS94exXCS8%2B5Qn4osBuC1vk50P%2FKgMN%2BPD%2FYwtHS1JPGWOpwrqYThDR8z4Z1C9f5hinhSSLYopz22mDIsu9%2Fvs45ymkjx6dW6OyAaCJMCqheNB%2FTDX2dSdwyqmSSEU7eTxMZWpFooy0SD3u2HZkY%2FFEO6HadM5nBW00MRP7UkFqRfDEA%2Fkpei2DpShxEMtmkOPMhSJyUTwSGUGRTo9ZL%2B8dM&X-Amz-Signature=25484d0aab27f750e56582c58b1629184572c4aaf3ec0d94a9c254ca85c3c54c&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4664Z55PGN3%2F20261005%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261005T025614Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEAsaCXVzLXdlc3QtMiJIMEYCIQDCCwSVntFezaaSeb9zgUszm7yIfBbsTMhKNeo5V4wF9AIhAL6%2BUA%2FN17jgL6eCJo0Yh5TzKDboTaz1nI1wFGr6mqhyKogECNT%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgwP7QOSO7%2FfhdLX80Iq3AMw8GV2xpGYgpvRQMQTcRTj6frDtc%2BaB7n3Bxf6LrgULpATXe04tLlESElvy0REKWFtGVKVw3xylr%2B3b6vr5eSBlrhoNUb%2FvQMj95TKQUE9vlkujtgPx%2FhDADArdRwRLYhJJkFdrjTL7LMFhi9vlj0egPuq3%2F37RwoDk2rdVzQ9MAdMBl1ezT5B9%2Fein9N9Y6%2BGyxnev%2BZnSRNdHDutiaJv2UOBNV%2FewgbrDY9kB1zg3xpCXyhAGUAtUpsmhwwgMh9xT324ag%2Fv0cXURQj5w1rxriBMNUfGz4bi%2BIPTxDCCEb4ngKBUrx5fIVrVZ08fgzshs85zfI7GC9xo99p2tItKbysqsIu0mxqHopPGMciYEybDgGuQ7A06pmfzfWZsnGtwm27O7p62is5m5aD1paNC1qeDI09fgav3mTEJTpP1%2FPjq%2FhEb57dI%2BokSG%2Bh3yDSfNbi6GbIgN1gbqULVF3bqAg22Ife0LneJrwZKRu%2BDQhosiVwBTZhWujVdOoQMjYli1y125mNz9YcDjGNDsBxxyisTKzcbRhmy4zbbE%2BgLWkyKvhFCH5ccwwBTsZ7ZR5rs10WWFmimVnAHDCeaT%2F8%2Fg3y0oKnVJT2LBv7ev3YA6wkejS3gyy2rlZ5R5jCCnYzWBjqkASv3iS94exXCS8%2B5Qn4osBuC1vk50P%2FKgMN%2BPD%2FYwtHS1JPGWOpwrqYThDR8z4Z1C9f5hinhSSLYopz22mDIsu9%2Fvs45ymkjx6dW6OyAaCJMCqheNB%2FTDX2dSdwyqmSSEU7eTxMZWpFooy0SD3u2HZkY%2FFEO6HadM5nBW00MRP7UkFqRfDEA%2Fkpei2DpShxEMtmkOPMhSJyUTwSGUGRTo9ZL%2B8dM&X-Amz-Signature=a73ca7cbbe3255206d0094bd635571a0ea9d62123227fd01b8d1f337f0661ff3&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

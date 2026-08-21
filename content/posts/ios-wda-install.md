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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4662YRNWT7U%2F20260821%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260821T122341Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjENv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIA%2FyVypaRINsJo1WLvqKmr%2FEZnF4B5%2FuQAZq7W1fzyDnAiEA%2Bpm7rshlJv8F0%2BE61P4dAXzcuziiI5LLqeB%2FW6hGMbwqiAQIpP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDJzUNY%2BoqwYtlTksbCrcA4XmslDlIKDTzcJEWCPW83OI21VLLFTdnIxPd8znPfWDfBzE%2BbRYiLJGv%2FHSWLHahUlvE%2B5xL9QJ3BMGycMP1UEYOQAvjWiUUunYOPiDCkQpHlDIkw2IHjSrPNJ3gSGrhS1H50EcqwV7lHtWwJRVyF6xUtZNBrkKcv1iamYc0tVckxnI89RvuNTl5ADOtifWf1WNg0g4TrfdUKSLzO0z8GoVjjFXyIBx2fSEWOTWb4BgZJ415TgkTiYRlmZNY6sdqYAc2wdYBULlGsKg7qbRnxV%2BMcg3blHT1wZfHkyRO9xHfuCTpSWM9LY5EX8D0AONASAoydOt7DIjOodel9R%2Bo2zOSoLZwFET4pWGvD9%2F5dOImLosW4v53Z8vmt8XBA7SQMp3RMIb6eq%2B3NCGU6mewyTjUEEAcIVUPra59gkgRXuz3RDnhpQ9gRLi4rCRI9ZoWQSA5RlvxsQetkfkyYz6PI%2BW5yJhUIOxuQaYp%2F%2F2nvmzX%2BOZpHXC4itkhdM8iSONAK%2F8Ce7gqL%2BFKd2Ohdz9VtaEcZlcUeRj1NzJQWRoJrtwjLe2TGK8BALvfobIkLd8r0ktttUY5A7WZ08SpbNUWhNpz92YOB%2F7gfa1TRFmuibvCRamp6Erala0dvGtMNvWoNQGOqUBgbXbz0IUBTNTaIZAJ4jxzAvEl5zBSovLIG9n03HFlRYEVlSp9UIf7gO2XKTBdgsjjsy0xlcPeqlOyORSYbUSHNLJSso268af08oXP0RAPPvD0v8jBoxMyCsppdGWdjHq7Yqa2GE7GKJUayRfJughHC1S3Rzrt616QIAPv88rgjRitDfCudSWfe0EDS41npwH%2BCn8n1QeJ9NfE87OByEKHvc2JhU4&X-Amz-Signature=c93c500bba684e50956cff6287a50064721a7f85d19327843c898fca0709cac3&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4662YRNWT7U%2F20260821%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260821T122341Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjENv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIA%2FyVypaRINsJo1WLvqKmr%2FEZnF4B5%2FuQAZq7W1fzyDnAiEA%2Bpm7rshlJv8F0%2BE61P4dAXzcuziiI5LLqeB%2FW6hGMbwqiAQIpP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDJzUNY%2BoqwYtlTksbCrcA4XmslDlIKDTzcJEWCPW83OI21VLLFTdnIxPd8znPfWDfBzE%2BbRYiLJGv%2FHSWLHahUlvE%2B5xL9QJ3BMGycMP1UEYOQAvjWiUUunYOPiDCkQpHlDIkw2IHjSrPNJ3gSGrhS1H50EcqwV7lHtWwJRVyF6xUtZNBrkKcv1iamYc0tVckxnI89RvuNTl5ADOtifWf1WNg0g4TrfdUKSLzO0z8GoVjjFXyIBx2fSEWOTWb4BgZJ415TgkTiYRlmZNY6sdqYAc2wdYBULlGsKg7qbRnxV%2BMcg3blHT1wZfHkyRO9xHfuCTpSWM9LY5EX8D0AONASAoydOt7DIjOodel9R%2Bo2zOSoLZwFET4pWGvD9%2F5dOImLosW4v53Z8vmt8XBA7SQMp3RMIb6eq%2B3NCGU6mewyTjUEEAcIVUPra59gkgRXuz3RDnhpQ9gRLi4rCRI9ZoWQSA5RlvxsQetkfkyYz6PI%2BW5yJhUIOxuQaYp%2F%2F2nvmzX%2BOZpHXC4itkhdM8iSONAK%2F8Ce7gqL%2BFKd2Ohdz9VtaEcZlcUeRj1NzJQWRoJrtwjLe2TGK8BALvfobIkLd8r0ktttUY5A7WZ08SpbNUWhNpz92YOB%2F7gfa1TRFmuibvCRamp6Erala0dvGtMNvWoNQGOqUBgbXbz0IUBTNTaIZAJ4jxzAvEl5zBSovLIG9n03HFlRYEVlSp9UIf7gO2XKTBdgsjjsy0xlcPeqlOyORSYbUSHNLJSso268af08oXP0RAPPvD0v8jBoxMyCsppdGWdjHq7Yqa2GE7GKJUayRfJughHC1S3Rzrt616QIAPv88rgjRitDfCudSWfe0EDS41npwH%2BCn8n1QeJ9NfE87OByEKHvc2JhU4&X-Amz-Signature=813c54c9373e5b4e6870aad04790a8278d1734d08822ea47873fe347c034a537&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

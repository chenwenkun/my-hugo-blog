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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4664LQFMGCS%2F20261128%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261128T004905Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEBYaCXVzLXdlc3QtMiJHMEUCIHR98ysgMMnIGYjijzmMm%2FNxaeYlwzhOiVJZg6Uq%2FVIdAiEApdkO73Juq0Xff5%2BUnVBs6hpONjKmVHDsRuwtese93VUqiAQI3v%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDM7f%2Bt%2BpgPDA3D3xQSrcA8GAhcA2yaI8Gg6If5L9MQkmmUgll0ihOA0mkiSDmV4HYAlWHa6JGHqi5GQVvNyv3QsHlVHSMWDDsGKPjFbv57k5lVjbjdfNBGR93wqimYn0CFp8oxJxyEDT%2BLQnskVQu9IyoVasmTT6XkydGO5tVIbA3Kll%2BZydcpWAiGRgQEY08q5l2vnVmzY1XHsffkKlVcAw1Z0p66ItpGA2hBfuBtvXAqZM9es5JYh73UEdgyamCdtoDsTFMsEXV269aBw6p2VnsaPX9%2Bu8xgfCRoDVQnk%2Bb8Q9ixxER8PN3nP%2BCeFk%2BIY4NPcgofGWpPqbL8L%2BM282kO7xgZeNlojyT%2FLY27rDlVAZS3Ml566G4MYsKiBRkDfhTACm91qWe1KcjAZViFhYUK9ZRtcvci6wkQiaG%2Bn3Z%2BkCbyOo5V7zKvmPbkweGgz4KF1FYsHPgXYIPvcAXPud2oL90%2FiowY2qrpS9jIXEBWY9%2Fv%2FtaOY%2Fd3xjhBF%2B7urIIvKNRpMHSsoMl0ZQFMBoHo8Wa8YNHypS265k2ZjC2pnb8LDSYn1Eb6vrWQ4sMorVAuHfpftq3%2BNMe2eOCKloFWNm%2Fh7FU38x8IEowSxBMXRN4KAuwWkMR%2BvclXLPw4COQ9reLahIfNTyMKXop9gGOqUB5z9YQLu6TWspZC8D2svO%2FUTVUc4X1TgZhYx7bR4MFpJ5LERj7tC1si1qXQwua5EnhZjpQRGbKKvAw2S2JDbgM3Q8G6Dku9hXWVZ0SyIUo%2Fx39zhuwyejbVhqu8n9rqXN7OAnrGypniVOWLve58l6U0Dlmw05EcNo9uzBoVgKgWucDtvo3dLdL7dSTDAulwtg%2FCEv1iepOYklCPBIZkFtjHxzXoVC&X-Amz-Signature=cba539706b66a34f9f078a350c8a916dbd80deeaf947db374869d58baf12400e&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4664LQFMGCS%2F20261128%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261128T004905Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEBYaCXVzLXdlc3QtMiJHMEUCIHR98ysgMMnIGYjijzmMm%2FNxaeYlwzhOiVJZg6Uq%2FVIdAiEApdkO73Juq0Xff5%2BUnVBs6hpONjKmVHDsRuwtese93VUqiAQI3v%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDM7f%2Bt%2BpgPDA3D3xQSrcA8GAhcA2yaI8Gg6If5L9MQkmmUgll0ihOA0mkiSDmV4HYAlWHa6JGHqi5GQVvNyv3QsHlVHSMWDDsGKPjFbv57k5lVjbjdfNBGR93wqimYn0CFp8oxJxyEDT%2BLQnskVQu9IyoVasmTT6XkydGO5tVIbA3Kll%2BZydcpWAiGRgQEY08q5l2vnVmzY1XHsffkKlVcAw1Z0p66ItpGA2hBfuBtvXAqZM9es5JYh73UEdgyamCdtoDsTFMsEXV269aBw6p2VnsaPX9%2Bu8xgfCRoDVQnk%2Bb8Q9ixxER8PN3nP%2BCeFk%2BIY4NPcgofGWpPqbL8L%2BM282kO7xgZeNlojyT%2FLY27rDlVAZS3Ml566G4MYsKiBRkDfhTACm91qWe1KcjAZViFhYUK9ZRtcvci6wkQiaG%2Bn3Z%2BkCbyOo5V7zKvmPbkweGgz4KF1FYsHPgXYIPvcAXPud2oL90%2FiowY2qrpS9jIXEBWY9%2Fv%2FtaOY%2Fd3xjhBF%2B7urIIvKNRpMHSsoMl0ZQFMBoHo8Wa8YNHypS265k2ZjC2pnb8LDSYn1Eb6vrWQ4sMorVAuHfpftq3%2BNMe2eOCKloFWNm%2Fh7FU38x8IEowSxBMXRN4KAuwWkMR%2BvclXLPw4COQ9reLahIfNTyMKXop9gGOqUB5z9YQLu6TWspZC8D2svO%2FUTVUc4X1TgZhYx7bR4MFpJ5LERj7tC1si1qXQwua5EnhZjpQRGbKKvAw2S2JDbgM3Q8G6Dku9hXWVZ0SyIUo%2Fx39zhuwyejbVhqu8n9rqXN7OAnrGypniVOWLve58l6U0Dlmw05EcNo9uzBoVgKgWucDtvo3dLdL7dSTDAulwtg%2FCEv1iepOYklCPBIZkFtjHxzXoVC&X-Amz-Signature=c8f75bb7682d005843d05544bf531f9a7b94b679ab302cf4c3ef21009ae82523&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

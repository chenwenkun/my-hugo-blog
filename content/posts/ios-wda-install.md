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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4664VYGOHKO%2F20260903%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260903T015921Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEAcaCXVzLXdlc3QtMiJHMEUCIHnm2%2Foq5cPiLsW2Yp%2B%2FQTV4sP%2FgWN74QZ78B2cI1hltAiEAhYPhaZDotF41%2BEOKag5ls4FHMJNOZwdX%2B8mYZNPR3%2BAqiAQI0P%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDMUaB2iKJlOwiB0VaircA2Kp90NZ6%2BZraClyvPRcF9dVQConftO3Gk7ULC8xJAM6W5e7vzesZHkE8iqEJYjukx%2BNdpPPErX%2B0U74hsVP0oNWiTLbo8zcrq5QoJtmLorZsUjsL%2B3bClWZtviwpP%2FR7KoPudOUqQLjmSb4zHtoX5vINlCQpSedj1noo%2FrLR5%2BWMB7bkD2wNbwh%2BU7SM4cv8DNQx6lmxNS4%2BKb5xAsH7nOP50o7%2Bqu9WDjDECEcafFSt6BqnCT%2FvXWwKem2N194Z9pQM3OPHQKDruk27Cq53pJEndOOpZFm5990Au8BSiGK58f%2FMGZmVbIDtUf%2FBb9NQUgQdTdKsTAAfZv7lRsdsVyZ3IU%2BDx8WkSOVhBned5ZYOO8Qmka9ZyR0Vo%2B3B6y7UmCg5WVt7L7Wp4u9Ac0vYvKa%2B58%2BMFuk2LPNLJne5mfWXaFSuUFnf%2FJiULK9dkbW%2FTlncCuwFoozM7CgdoHh8q781aqBzWuh1ELz3wXA3I3OCail1OxacVLvDgq2%2BRiQM60e3EUAFAtS743%2FMI0FLnXaTbG8VNtl0Bv5A1%2BixWEDa1Lf%2F1mC%2B%2FCNEVo20HOxdg%2BEvi2a%2B%2FX8EPfedlSeGUYxPBRuY7e0JdGPycSBjtOKyMyJdLuUys77mpwXMMTI4tQGOqUB5LrbwctxwJppvkGL%2F8%2FiYHyyukLMhUiPSzZGxI9dRJtTeRVIEGkD11ZaCAk0RpQJ4DwjuJmjgrU%2FAfnlfOuRhXS6JQRgi2HiVDGqAJ9IBAQjvstv1Dt9I1Y8s%2BT0Alu9WjQAfpzvMSHNQC%2FF2gAweAhM9oTB%2B9%2FfryY%2Ftbo4xCWVN0uvhOnJ8F%2F%2FkTZwMDEFshsKsq7Z%2Bs%2B1q14EJzuN0GLlqC%2FR&X-Amz-Signature=73968239d6687ac1d1f25619866bb5671795c6bb5c3cf8c9d7007e191f43e5a3&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4664VYGOHKO%2F20260903%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260903T015921Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEAcaCXVzLXdlc3QtMiJHMEUCIHnm2%2Foq5cPiLsW2Yp%2B%2FQTV4sP%2FgWN74QZ78B2cI1hltAiEAhYPhaZDotF41%2BEOKag5ls4FHMJNOZwdX%2B8mYZNPR3%2BAqiAQI0P%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDMUaB2iKJlOwiB0VaircA2Kp90NZ6%2BZraClyvPRcF9dVQConftO3Gk7ULC8xJAM6W5e7vzesZHkE8iqEJYjukx%2BNdpPPErX%2B0U74hsVP0oNWiTLbo8zcrq5QoJtmLorZsUjsL%2B3bClWZtviwpP%2FR7KoPudOUqQLjmSb4zHtoX5vINlCQpSedj1noo%2FrLR5%2BWMB7bkD2wNbwh%2BU7SM4cv8DNQx6lmxNS4%2BKb5xAsH7nOP50o7%2Bqu9WDjDECEcafFSt6BqnCT%2FvXWwKem2N194Z9pQM3OPHQKDruk27Cq53pJEndOOpZFm5990Au8BSiGK58f%2FMGZmVbIDtUf%2FBb9NQUgQdTdKsTAAfZv7lRsdsVyZ3IU%2BDx8WkSOVhBned5ZYOO8Qmka9ZyR0Vo%2B3B6y7UmCg5WVt7L7Wp4u9Ac0vYvKa%2B58%2BMFuk2LPNLJne5mfWXaFSuUFnf%2FJiULK9dkbW%2FTlncCuwFoozM7CgdoHh8q781aqBzWuh1ELz3wXA3I3OCail1OxacVLvDgq2%2BRiQM60e3EUAFAtS743%2FMI0FLnXaTbG8VNtl0Bv5A1%2BixWEDa1Lf%2F1mC%2B%2FCNEVo20HOxdg%2BEvi2a%2B%2FX8EPfedlSeGUYxPBRuY7e0JdGPycSBjtOKyMyJdLuUys77mpwXMMTI4tQGOqUB5LrbwctxwJppvkGL%2F8%2FiYHyyukLMhUiPSzZGxI9dRJtTeRVIEGkD11ZaCAk0RpQJ4DwjuJmjgrU%2FAfnlfOuRhXS6JQRgi2HiVDGqAJ9IBAQjvstv1Dt9I1Y8s%2BT0Alu9WjQAfpzvMSHNQC%2FF2gAweAhM9oTB%2B9%2FfryY%2Ftbo4xCWVN0uvhOnJ8F%2F%2FkTZwMDEFshsKsq7Z%2Bs%2B1q14EJzuN0GLlqC%2FR&X-Amz-Signature=bc6f1ac5ff71e673b4b00a9898232fa0fec55f28f0289556389d018bb0988c0d&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

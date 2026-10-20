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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466VNUBSIKT%2F20261020%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261020T103605Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEHkaCXVzLXdlc3QtMiJHMEUCIQCTeMcO7WKMZjNl3Bc2b2OXi1lLN1fTW4XwKST5PGn3twIgMJ6zkUX4LjVvI1fNybXbgmNk5nNh2%2BV%2BhyjFp%2FveMxEq%2FwMIQhAAGgw2Mzc0MjMxODM4MDUiDP4MploaTeGMsnx68CrcA%2FMA88E3d1yuZ4kGHebVZkiYcA%2F1Ik9VAwOEIa4mpxi78vYph1vGwnzttjV5THr7tbp5yBZiYeC4Yi4Hw7z36CrWLH5CyCPmYirKMla2ikxksxzDB8oyJSZRcknm7kuuJGm8CoOdmAjwizxJVx4YnjEukc8fwtagyhmTcR6oPV0XQiJ3ZlQCXHFvsKi6fYAobfTivducI6mlAKyiFTO9wYA7kUnaVDihnNaniMbjkkhYsI%2Bq0%2FhK2py2qFUxMXiFkSl0cAIh7D34T36a58Z0k%2FV6GPqDdHEiVyOQ1Anc%2F5r9fFlYyJxcCHY8gACgOb3tHsmbIgtXxJhSemEAelGaVlDtfPtVuJbBecFtpTlSFwPV0%2BBuFElXE8soR15zi8XzsXwvDOpKsPWU1Y%2FL9AmvhIIN%2BC8FNA5Yy%2B2sgoiuv4hu2rABhdfu9BOE9s%2Ftb8JHi9krmgrP%2BUs2mri%2Bnu0zs8PpBCy99FSpZW85pTxNLnORNSdKmLvbbFpC%2FwpphTJ39QfcpYzk21JRsccNYMTrBwIJUElC2a1uXr5zdrJAnazXA%2FobONOHISiWI3UwaOLzI5vJwu59stXblnJldMxRwIeBCRK0d9AL5FeLqCebtpfOu5NBn%2BYD8euoN3XcMO%2FR3NYGOqUBllqu8SLskOTLIdc44QPGzyQ8GB5ab0TtdCMPDJdwPI1YegTTTeWm%2FA2CZKZf1eUTpp%2FD0mLNJISt7K3koylYXqszut5Dq5pZi%2FfneZFE3tU%2BzxVA57X36w6MI8uF%2BoZOafAWSHwZaDNijiKF7diJlw8OEHxB0d9zUOdrfsB86NSyZKtWd6MATKEYbyGsgTByFw5O%2BbpVmD35Ct8AhNvZDtn86qVL&X-Amz-Signature=4c099efd2c083f282175ade31bf76ba0e4b7ff9323170a352365137a202b2acd&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466VNUBSIKT%2F20261020%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261020T103605Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEHkaCXVzLXdlc3QtMiJHMEUCIQCTeMcO7WKMZjNl3Bc2b2OXi1lLN1fTW4XwKST5PGn3twIgMJ6zkUX4LjVvI1fNybXbgmNk5nNh2%2BV%2BhyjFp%2FveMxEq%2FwMIQhAAGgw2Mzc0MjMxODM4MDUiDP4MploaTeGMsnx68CrcA%2FMA88E3d1yuZ4kGHebVZkiYcA%2F1Ik9VAwOEIa4mpxi78vYph1vGwnzttjV5THr7tbp5yBZiYeC4Yi4Hw7z36CrWLH5CyCPmYirKMla2ikxksxzDB8oyJSZRcknm7kuuJGm8CoOdmAjwizxJVx4YnjEukc8fwtagyhmTcR6oPV0XQiJ3ZlQCXHFvsKi6fYAobfTivducI6mlAKyiFTO9wYA7kUnaVDihnNaniMbjkkhYsI%2Bq0%2FhK2py2qFUxMXiFkSl0cAIh7D34T36a58Z0k%2FV6GPqDdHEiVyOQ1Anc%2F5r9fFlYyJxcCHY8gACgOb3tHsmbIgtXxJhSemEAelGaVlDtfPtVuJbBecFtpTlSFwPV0%2BBuFElXE8soR15zi8XzsXwvDOpKsPWU1Y%2FL9AmvhIIN%2BC8FNA5Yy%2B2sgoiuv4hu2rABhdfu9BOE9s%2Ftb8JHi9krmgrP%2BUs2mri%2Bnu0zs8PpBCy99FSpZW85pTxNLnORNSdKmLvbbFpC%2FwpphTJ39QfcpYzk21JRsccNYMTrBwIJUElC2a1uXr5zdrJAnazXA%2FobONOHISiWI3UwaOLzI5vJwu59stXblnJldMxRwIeBCRK0d9AL5FeLqCebtpfOu5NBn%2BYD8euoN3XcMO%2FR3NYGOqUBllqu8SLskOTLIdc44QPGzyQ8GB5ab0TtdCMPDJdwPI1YegTTTeWm%2FA2CZKZf1eUTpp%2FD0mLNJISt7K3koylYXqszut5Dq5pZi%2FfneZFE3tU%2BzxVA57X36w6MI8uF%2BoZOafAWSHwZaDNijiKF7diJlw8OEHxB0d9zUOdrfsB86NSyZKtWd6MATKEYbyGsgTByFw5O%2BbpVmD35Ct8AhNvZDtn86qVL&X-Amz-Signature=940eedf9bb739644ca89d14267628d0d25f103106619efccc5e3aa9e4923219e&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466WXILXY63%2F20260817%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260817T063145Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEHYaCXVzLXdlc3QtMiJHMEUCIQD7gb2Y2%2FJu%2F5b2T7Wvl12aM6IIy1TaE6%2BlxY16ixuJhQIgca%2FTGtvx1Y2uerenibebPweT4YGYnE%2B%2FZqN3Tj6latkq%2FwMIPxAAGgw2Mzc0MjMxODM4MDUiDCSi2CcrL2nNcZJyCCrcA%2BwN39ysq9Qx74MvwqOEuC1ZOOunv4QEv9qZL7%2F3qmoxb%2BteHJuPFGl4SsUuPDuJ2vXP5TtYNNbUJpiK51gKUo7rJDBf473RljdlsK8Vmd9E0KNSQdvT6jrrFlTbDgsJzyVwxZqz3XA9zIE0OOwEdSSawQzVf035I%2FP%2Fa4ebAS0NdncbZucSOpuljHdaFddV978cFU%2FVDaTBJoM3nrF4Jnd%2F7%2B3vtTbd0%2FkGCl1b6RjaTaqXjX1DQWCKx1cU0kEua2Kdmo%2BxlD2GiAM%2FjZYChSKgISphMzfaXX2fSU0DJO%2BniK0u5yzo7Avc%2FH57izdnKesA%2BwcC8t13JKW4UHX8MFkb419E7Ge62Tf1G3BQxnU2v0V4q%2B9mMn8Gee6Ghiq5ykJIUMIfOHsYpYKTNj2ngyDB3oqYIOvTyEQizfiPIpM189Y%2B0P7R8OB0AfBlQZhn5ifE5C3UrsMM8AsdC1Piym4M5KCFVfaa%2BRx47Mk%2FnJtliL2BFhTNp2x8z9t4My%2FJwjNAd1jxJCPGwGLMHq08SbmSjA%2Fm6RHPw4N2YkTO0SzY88%2F59vh8xI54gtyqLIWkzD2kp8sWzhYbWSwMYFnoYh2EhqwKztGmQeVrUWdtIWNE2x4hkIcnX7vRf9xuMOTMitQGOqUBgcK5qFxS3HtwwEBh8D32mEs9r7mqyqCy84x%2BmhlWN5o9F9bNQ9QcuoQPrTzPwYLwHPAChF54knGDdcC9B2BE9aFXksnQDzjHavuzb4DDvSV%2BnT7FIG4nfRFF4Oz3JjmEHATlqhCXJD4Z0jXcAGBMSqfgSnRK%2B67Ek3MK4c5sXlDRs%2F%2FOoqQhQn1dDWBEW4CsuUOEUk%2BLGU1YWOOmJCVf7RF0EyY8&X-Amz-Signature=fe53ee11e1cdfc258bf37f3fea7715c781f10ac27bfaf96942ef86e7a01cd532&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466WXILXY63%2F20260817%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260817T063145Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEHYaCXVzLXdlc3QtMiJHMEUCIQD7gb2Y2%2FJu%2F5b2T7Wvl12aM6IIy1TaE6%2BlxY16ixuJhQIgca%2FTGtvx1Y2uerenibebPweT4YGYnE%2B%2FZqN3Tj6latkq%2FwMIPxAAGgw2Mzc0MjMxODM4MDUiDCSi2CcrL2nNcZJyCCrcA%2BwN39ysq9Qx74MvwqOEuC1ZOOunv4QEv9qZL7%2F3qmoxb%2BteHJuPFGl4SsUuPDuJ2vXP5TtYNNbUJpiK51gKUo7rJDBf473RljdlsK8Vmd9E0KNSQdvT6jrrFlTbDgsJzyVwxZqz3XA9zIE0OOwEdSSawQzVf035I%2FP%2Fa4ebAS0NdncbZucSOpuljHdaFddV978cFU%2FVDaTBJoM3nrF4Jnd%2F7%2B3vtTbd0%2FkGCl1b6RjaTaqXjX1DQWCKx1cU0kEua2Kdmo%2BxlD2GiAM%2FjZYChSKgISphMzfaXX2fSU0DJO%2BniK0u5yzo7Avc%2FH57izdnKesA%2BwcC8t13JKW4UHX8MFkb419E7Ge62Tf1G3BQxnU2v0V4q%2B9mMn8Gee6Ghiq5ykJIUMIfOHsYpYKTNj2ngyDB3oqYIOvTyEQizfiPIpM189Y%2B0P7R8OB0AfBlQZhn5ifE5C3UrsMM8AsdC1Piym4M5KCFVfaa%2BRx47Mk%2FnJtliL2BFhTNp2x8z9t4My%2FJwjNAd1jxJCPGwGLMHq08SbmSjA%2Fm6RHPw4N2YkTO0SzY88%2F59vh8xI54gtyqLIWkzD2kp8sWzhYbWSwMYFnoYh2EhqwKztGmQeVrUWdtIWNE2x4hkIcnX7vRf9xuMOTMitQGOqUBgcK5qFxS3HtwwEBh8D32mEs9r7mqyqCy84x%2BmhlWN5o9F9bNQ9QcuoQPrTzPwYLwHPAChF54knGDdcC9B2BE9aFXksnQDzjHavuzb4DDvSV%2BnT7FIG4nfRFF4Oz3JjmEHATlqhCXJD4Z0jXcAGBMSqfgSnRK%2B67Ek3MK4c5sXlDRs%2F%2FOoqQhQn1dDWBEW4CsuUOEUk%2BLGU1YWOOmJCVf7RF0EyY8&X-Amz-Signature=9b6cc1970c542e6cb5e689f88cefe215f10c5a922350697bf13dee026407ac02&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

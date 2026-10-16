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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4666ZMUZWQA%2F20261016%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261016T101839Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEBkaCXVzLXdlc3QtMiJHMEUCIB%2BBRAuwpg8cUqOfxonki%2FTKGyseyTRT52ZkEQXbsC0kAiEAxIFPUShar7qHZYmZOQ%2BJ4RYAcUVmgMOQ6yoq7%2FSdtdkqiAQI4v%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDGyZVN7qFqiB8ueeHCrcA0aavoJr4njIO7%2BEVffj5HRfWnR9ePx2QsYz81PamG4%2FVFyUrw31Tp7lEPYKfQsvraamnpSklJtT42iNCRIuSxNrWxJ6c1HVMU651oTAO2ikgcsOcbpZzE%2B9p7%2FKL7GtYZEX%2BxuqqzPI1Vyd%2B%2FVA5C6oqMLzXvYGE8k8Ht5SO7v2dCl%2BrqAkyvnGmXkI%2BYg4bMaN6CSa8EwZlPc7e4kr%2F08oNUnSpE010vLKmcK7fWSLzIa%2BcAdDxi9B%2BzXQ0rBQhURkLhr6RyqPtRgWxKCdDWwXtzA8%2FRaTP%2Fgb%2FQvAljKR0NXmsk1eFIe6N4IylWDrZTuk5sxGVajFHNOfSJKenJkSuzY5fulBe1xjLlnU6xURzpMkqevKcPRsyubJyf%2BNiSc5vMekWEnQXGwbMSghohOCbMtQx72q59lhRraGOQgBptlsbDJ4OkRLJ1AuXNwJKsw7Y4eyvHcWcfEbBIEXUQAhsXXze9rm%2BcKf0P84lr0ukHOzjGngEBvLH%2BFLa%2BE0aLFmM4LnjuYqyB0MI8xg9JxSkEiNlmpXdEdHy42HkxEelTye106UKh%2FA%2FD71DilEJo8a1TgF4v%2BkT7hZObk7ZyXZSDlJUQ0O7Yrzr%2FZBFmoJvk5vh7GrPHReQ%2FXPMJLVx9YGOqUBeFwF1CIKMrB9l%2BARexihU6ffZiY9JrEbJ2DxZTF38Cs%2FBaBasuXJOxO4VVMxJZ9slaynnJ5YGDHPdYg2QG4wyPc%2BZq8Qm3Y1rwS5yHoyIkLp4g56rxFpl0caaS6JvW11Sa6FZtvAol37WG0rw1jAdTKMnN696K0Bhp7eoUIsaqeIFA0Pq1xv4ML%2B%2BPrjDPqxIfyGHkEDiLrdla55wzUD744exSmH&X-Amz-Signature=f939ef5931ed8cc7ca06881ffc842c8ae21d9ebb535e8fb421e3765796d1eea4&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4666ZMUZWQA%2F20261016%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261016T101840Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEBkaCXVzLXdlc3QtMiJHMEUCIB%2BBRAuwpg8cUqOfxonki%2FTKGyseyTRT52ZkEQXbsC0kAiEAxIFPUShar7qHZYmZOQ%2BJ4RYAcUVmgMOQ6yoq7%2FSdtdkqiAQI4v%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDGyZVN7qFqiB8ueeHCrcA0aavoJr4njIO7%2BEVffj5HRfWnR9ePx2QsYz81PamG4%2FVFyUrw31Tp7lEPYKfQsvraamnpSklJtT42iNCRIuSxNrWxJ6c1HVMU651oTAO2ikgcsOcbpZzE%2B9p7%2FKL7GtYZEX%2BxuqqzPI1Vyd%2B%2FVA5C6oqMLzXvYGE8k8Ht5SO7v2dCl%2BrqAkyvnGmXkI%2BYg4bMaN6CSa8EwZlPc7e4kr%2F08oNUnSpE010vLKmcK7fWSLzIa%2BcAdDxi9B%2BzXQ0rBQhURkLhr6RyqPtRgWxKCdDWwXtzA8%2FRaTP%2Fgb%2FQvAljKR0NXmsk1eFIe6N4IylWDrZTuk5sxGVajFHNOfSJKenJkSuzY5fulBe1xjLlnU6xURzpMkqevKcPRsyubJyf%2BNiSc5vMekWEnQXGwbMSghohOCbMtQx72q59lhRraGOQgBptlsbDJ4OkRLJ1AuXNwJKsw7Y4eyvHcWcfEbBIEXUQAhsXXze9rm%2BcKf0P84lr0ukHOzjGngEBvLH%2BFLa%2BE0aLFmM4LnjuYqyB0MI8xg9JxSkEiNlmpXdEdHy42HkxEelTye106UKh%2FA%2FD71DilEJo8a1TgF4v%2BkT7hZObk7ZyXZSDlJUQ0O7Yrzr%2FZBFmoJvk5vh7GrPHReQ%2FXPMJLVx9YGOqUBeFwF1CIKMrB9l%2BARexihU6ffZiY9JrEbJ2DxZTF38Cs%2FBaBasuXJOxO4VVMxJZ9slaynnJ5YGDHPdYg2QG4wyPc%2BZq8Qm3Y1rwS5yHoyIkLp4g56rxFpl0caaS6JvW11Sa6FZtvAol37WG0rw1jAdTKMnN696K0Bhp7eoUIsaqeIFA0Pq1xv4ML%2B%2BPrjDPqxIfyGHkEDiLrdla55wzUD744exSmH&X-Amz-Signature=d49a8e707f5b7fb5024c54e97107c14d2db2c626f0b1226d8d0967f52b887007&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466ZHLGJK4Y%2F20260823%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260823T121733Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEAgaCXVzLXdlc3QtMiJHMEUCIAWnluBJaxvqGl3YMOv9SaW8cTBao4ZiPDQ5lKRzZgI3AiEA9vsQHP6g8bg0Z4u0J4nRLN9PlEmHsJ3iyAK9QspUcKkqiAQI0f%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDLPpjpwPjgFCWjv8%2FyrcA%2Bb2S3QKEf2DcfPLLLFU%2Frhmy8CvhK51oAqm5NnNZ5xpqd9CYc02vwO8J%2BGbDwchfAxAhzYQgEOl1YPKv%2BnrAcP7DEFLZY9Cr8Kg67%2BEPLHGrOO7DoikU4gDam2ipxC15sulGvr1ok08RsLuiUxa4xnqvK4qPejbdI1twWSyv23OANjFW47moab4gMxAF%2FoYYhQ9aGnAkRCfRGKtBEUXwgWb7hA4lnyQpDLESqxPV%2BTxf11Y437%2BGZ%2FVYfAIqOuBLNKsQIb3j%2FsDX4fumDfQ3xiuohEMsgwmdZa2tczE2e12hCpgOu91JU9Di10s48CqqsxSmlNTBOCzXBRAOJe5wX0w2xO4dUu6HxC%2F4yzxtiFYnK5xkX1U7vHgR87s%2F44gxVbyEcx00Gc4rz19bFIbvqhvkj%2F7QUNDJrHr6Y5nfedzUu6L5%2FvI%2FACF1qSZRQjI45taRMDfkYTy68qM1MATv5FfGCligSdqWQrL4KDEJJlPGYRrMD%2F6mWiNFatlj98%2BlmMIga%2B%2FQYjbL%2Fjz3PM%2FGPNtXEY1hTlc5G5WkOZ1GRXtrH4fods3yURPr87a%2BUvrqYrXCrFAa0YetSFqbMRnjrWFq%2BBJgosZSroVIJu5ZrZN8lF1Br7L2J3CFmbFMITUqtQGOqUBp7PIRUwt9MkVtnw2LMfTX4sLFBlz13cDVaxnyYOtwao%2FvBDqAXodHOv4hRi0FpqqFcRTiTjq3LepokNvDzLI2EiSipfBNkOyfnoodINtNTyEReB%2F7Z9dOvP8%2Frbk70sqXZy1VRH6wTeo%2BosbXlc1P%2BBmxpuZxRkrVb7TE8I5ZROnI9jZfzIuWOWSYfvh%2Ba8YrGS8q%2FxgiZbbM8I%2BfIXEVWlxCtZS&X-Amz-Signature=c867ca9e11760e979c40b8848faa5542bbaf27a4d25b43a1896d42bdf116ca22&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466ZHLGJK4Y%2F20260823%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260823T121733Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEAgaCXVzLXdlc3QtMiJHMEUCIAWnluBJaxvqGl3YMOv9SaW8cTBao4ZiPDQ5lKRzZgI3AiEA9vsQHP6g8bg0Z4u0J4nRLN9PlEmHsJ3iyAK9QspUcKkqiAQI0f%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDLPpjpwPjgFCWjv8%2FyrcA%2Bb2S3QKEf2DcfPLLLFU%2Frhmy8CvhK51oAqm5NnNZ5xpqd9CYc02vwO8J%2BGbDwchfAxAhzYQgEOl1YPKv%2BnrAcP7DEFLZY9Cr8Kg67%2BEPLHGrOO7DoikU4gDam2ipxC15sulGvr1ok08RsLuiUxa4xnqvK4qPejbdI1twWSyv23OANjFW47moab4gMxAF%2FoYYhQ9aGnAkRCfRGKtBEUXwgWb7hA4lnyQpDLESqxPV%2BTxf11Y437%2BGZ%2FVYfAIqOuBLNKsQIb3j%2FsDX4fumDfQ3xiuohEMsgwmdZa2tczE2e12hCpgOu91JU9Di10s48CqqsxSmlNTBOCzXBRAOJe5wX0w2xO4dUu6HxC%2F4yzxtiFYnK5xkX1U7vHgR87s%2F44gxVbyEcx00Gc4rz19bFIbvqhvkj%2F7QUNDJrHr6Y5nfedzUu6L5%2FvI%2FACF1qSZRQjI45taRMDfkYTy68qM1MATv5FfGCligSdqWQrL4KDEJJlPGYRrMD%2F6mWiNFatlj98%2BlmMIga%2B%2FQYjbL%2Fjz3PM%2FGPNtXEY1hTlc5G5WkOZ1GRXtrH4fods3yURPr87a%2BUvrqYrXCrFAa0YetSFqbMRnjrWFq%2BBJgosZSroVIJu5ZrZN8lF1Br7L2J3CFmbFMITUqtQGOqUBp7PIRUwt9MkVtnw2LMfTX4sLFBlz13cDVaxnyYOtwao%2FvBDqAXodHOv4hRi0FpqqFcRTiTjq3LepokNvDzLI2EiSipfBNkOyfnoodINtNTyEReB%2F7Z9dOvP8%2Frbk70sqXZy1VRH6wTeo%2BosbXlc1P%2BBmxpuZxRkrVb7TE8I5ZROnI9jZfzIuWOWSYfvh%2Ba8YrGS8q%2FxgiZbbM8I%2BfIXEVWlxCtZS&X-Amz-Signature=783fb0c6cf7f154019eca8a06776db8264bf646b3ba48770d1742a8c45248523&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

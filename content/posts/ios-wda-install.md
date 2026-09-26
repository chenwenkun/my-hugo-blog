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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663SZHRN3E%2F20260926%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260926T202004Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEEMaCXVzLXdlc3QtMiJHMEUCIAcnYjDvU6UKkGymqoXgThLp25PLR1KJ%2BeIyPS484EklAiEA3WKuz6FDQXjx72N4AJPRfttIPaeIhwmfxPIkqL7j9OAq%2FwMIDBAAGgw2Mzc0MjMxODM4MDUiDIaGJg0I3n6Ch3oShCrcAzBsMHWVbhN5k4P8BsjJlrHwePbkJoOmd51PntIcrdU9jy3dyBjPF8UyTWiQBgCkkyF9rRQQXY1ryoWC1e9Rz2B36HHS0Dj0osjjfc8TtxNfLOutuqSILhhdHLeN5eCxCAQmWjppOqWl281%2Fd7ZNKdAFCi7KA%2BCO95TBPkbUl%2BvDP1S1ewzMEL4nOy6ahK2cS8RbLNNX%2FMYF8OHuR1b5wj0ylQWJs2YzP4Ky%2FdOulM4piRqi0JncZ9ekp0BQfRFT%2BT%2BWehgxzN%2BRu3BslaZY64khmtKNvYTzAVtMfyGH2njT5LKO3LSjst3U1LCdu4dr2kLQE4xrGeSGJO1W7QqHeiZ635Fm%2BReXtdJHxYGKjpaJ9LCkHx00vnZtud6eH17H7Npqi38Nz0MPf3nBe%2FtqGSWAnvnzSTA55A7C1%2B7ypFsevUd1%2BiiC5C%2F0%2B3gApmqdWKgvzfWzYg8B7zmW0iSu7wI2ECRK7R2Twy3nZ0b%2BmMN%2BxxmmyV8FEW8STaXeDL8LA9sefBajaGf0iSOvfMayclHx8uXedcXMWP8PXTprOWLEEZVKL36vgTwwYda1QMFyx%2F6KQe9Bn397yH8U75SO8Zk2X5EkNo5la0YgaQudronfdTAN23grdqQNvIyMMNKt4NUGOqUBRTDH4%2B2Jkv%2BBXfIOr%2B5ifrxDftbK%2Fk9thLdcq7i9sNM3roveSm6giB0lgnSplarV4aDBoEYsDU%2FMHPVgnLjH%2BK3197Fk4jw7WHAg75V5Top3Pc79hkgeYYyfYoVnsbS6CmD2wSGCuHu4W4gi9zKt0Kj3V7jJUcoSrhE3uRRl9nhJnSM3jbPT3tzipNNOrXT4yX63tT4Isiws8KV%2FvcwXt9N71l7j&X-Amz-Signature=3a3a60a2973d83d27f092ff7bd5bd5957b5382a7f70460035989f374478d3656&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663SZHRN3E%2F20260926%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260926T202004Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEEMaCXVzLXdlc3QtMiJHMEUCIAcnYjDvU6UKkGymqoXgThLp25PLR1KJ%2BeIyPS484EklAiEA3WKuz6FDQXjx72N4AJPRfttIPaeIhwmfxPIkqL7j9OAq%2FwMIDBAAGgw2Mzc0MjMxODM4MDUiDIaGJg0I3n6Ch3oShCrcAzBsMHWVbhN5k4P8BsjJlrHwePbkJoOmd51PntIcrdU9jy3dyBjPF8UyTWiQBgCkkyF9rRQQXY1ryoWC1e9Rz2B36HHS0Dj0osjjfc8TtxNfLOutuqSILhhdHLeN5eCxCAQmWjppOqWl281%2Fd7ZNKdAFCi7KA%2BCO95TBPkbUl%2BvDP1S1ewzMEL4nOy6ahK2cS8RbLNNX%2FMYF8OHuR1b5wj0ylQWJs2YzP4Ky%2FdOulM4piRqi0JncZ9ekp0BQfRFT%2BT%2BWehgxzN%2BRu3BslaZY64khmtKNvYTzAVtMfyGH2njT5LKO3LSjst3U1LCdu4dr2kLQE4xrGeSGJO1W7QqHeiZ635Fm%2BReXtdJHxYGKjpaJ9LCkHx00vnZtud6eH17H7Npqi38Nz0MPf3nBe%2FtqGSWAnvnzSTA55A7C1%2B7ypFsevUd1%2BiiC5C%2F0%2B3gApmqdWKgvzfWzYg8B7zmW0iSu7wI2ECRK7R2Twy3nZ0b%2BmMN%2BxxmmyV8FEW8STaXeDL8LA9sefBajaGf0iSOvfMayclHx8uXedcXMWP8PXTprOWLEEZVKL36vgTwwYda1QMFyx%2F6KQe9Bn397yH8U75SO8Zk2X5EkNo5la0YgaQudronfdTAN23grdqQNvIyMMNKt4NUGOqUBRTDH4%2B2Jkv%2BBXfIOr%2B5ifrxDftbK%2Fk9thLdcq7i9sNM3roveSm6giB0lgnSplarV4aDBoEYsDU%2FMHPVgnLjH%2BK3197Fk4jw7WHAg75V5Top3Pc79hkgeYYyfYoVnsbS6CmD2wSGCuHu4W4gi9zKt0Kj3V7jJUcoSrhE3uRRl9nhJnSM3jbPT3tzipNNOrXT4yX63tT4Isiws8KV%2FvcwXt9N71l7j&X-Amz-Signature=183a8c42c1aeddab9398a71eef4600b5aa482dd2e5d46e497ba8b2162c1fc2ec&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466RA7TWJRX%2F20260917%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260917T204309Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEGgaCXVzLXdlc3QtMiJHMEUCIClA3gbLyq5lMm4JLj3D6a%2F3hJi7mBGyuWZhszFYR1ZrAiEA3QJ9Yt1i0aEzHS5BFoczu3prIxVSLWTk6ed%2BF%2BRrh5kq%2FwMIMRAAGgw2Mzc0MjMxODM4MDUiDK0%2F3OokpXLRPC8AkSrcAyMxlL6naAiNaErzUSb15uXUUlDJdnAWMBRLGyE5HMkGifkDiJMVvKHuP0kBIMRWPC71%2B%2Fvdv7JZLdBR1kzP8M2VRZNa93dm5E0UinWQRTPpnjA17%2BawKZ6PpYSCp5kNpQK4NIe%2BQcu5e5%2FZ3Tt1aM1KhCHlQADf9O5safNWhhpniD7EHwYHH%2Fc2xJOLvymVE5w4g7FKupVHNPuPBosQW%2Fn1kfYBwzUD6yjtnTpzi3twQH1Uo%2BxYaol5CjsOJdGQy0dx%2BP7FDxKjxHWApHgsKXcwrIY0usCNy%2BRVg7MBMChg2%2Be0eo0r9u5DIzsWKxYi7aL1D9OPJRLl1pZwIheUwRPwd%2FdlRe29ooI2AEKt9ZGRFOZ9PNRlxYhT1%2B95xj%2F8PIJb06ohn%2Bd255wTsdDOEwq9BLIwf6yjyry1%2FjbBwky9J4cJ6fIVN4iK5KykR4no8oiJAtSZBZisXsbBMM8%2Fqysv2PXU%2B0UsYr110vRnvw9FfQNJMev%2F7Xh1LB%2F7433OpHPV3%2FNPlQjNrm%2FIYwCC2xKMRGrgcpfze7VZFZTNTRQjawH73pi25LQLL3Gw7bHmAxYcyBGp9DaTizwqJ1JnjlKOrjnCfp7aVrBUM6kblkX7unLXQwSR1UGDgsU6MNaPsNUGOqUBWs%2FInLtjC53oHHYXEXh0%2FBnLVwv0Uy9PE%2F8H3l4QSZxvvqhPFgZGpJAKDTpWy3XIKhWbWhCTxldEphNEt7tlRXG%2FcpqPjE4d%2Bf265jPfi0p2avhwZZbYDoxQlNNqtB%2B3QRovMCKFHNO7%2BL%2FgBGTEetqppkBqSh8mOsyfeWK%2FP3B6c6L3xnG3Ees%2FKMg0U0st%2Ffy1mIwtA8LNG%2BgioKY4Rmg9FG%2Fq&X-Amz-Signature=6f9da08f3ad5c477ef7ef01dfa1a1f0b3cdbcb5779710218772a6323d3381d99&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466RA7TWJRX%2F20260917%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260917T204309Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEGgaCXVzLXdlc3QtMiJHMEUCIClA3gbLyq5lMm4JLj3D6a%2F3hJi7mBGyuWZhszFYR1ZrAiEA3QJ9Yt1i0aEzHS5BFoczu3prIxVSLWTk6ed%2BF%2BRrh5kq%2FwMIMRAAGgw2Mzc0MjMxODM4MDUiDK0%2F3OokpXLRPC8AkSrcAyMxlL6naAiNaErzUSb15uXUUlDJdnAWMBRLGyE5HMkGifkDiJMVvKHuP0kBIMRWPC71%2B%2Fvdv7JZLdBR1kzP8M2VRZNa93dm5E0UinWQRTPpnjA17%2BawKZ6PpYSCp5kNpQK4NIe%2BQcu5e5%2FZ3Tt1aM1KhCHlQADf9O5safNWhhpniD7EHwYHH%2Fc2xJOLvymVE5w4g7FKupVHNPuPBosQW%2Fn1kfYBwzUD6yjtnTpzi3twQH1Uo%2BxYaol5CjsOJdGQy0dx%2BP7FDxKjxHWApHgsKXcwrIY0usCNy%2BRVg7MBMChg2%2Be0eo0r9u5DIzsWKxYi7aL1D9OPJRLl1pZwIheUwRPwd%2FdlRe29ooI2AEKt9ZGRFOZ9PNRlxYhT1%2B95xj%2F8PIJb06ohn%2Bd255wTsdDOEwq9BLIwf6yjyry1%2FjbBwky9J4cJ6fIVN4iK5KykR4no8oiJAtSZBZisXsbBMM8%2Fqysv2PXU%2B0UsYr110vRnvw9FfQNJMev%2F7Xh1LB%2F7433OpHPV3%2FNPlQjNrm%2FIYwCC2xKMRGrgcpfze7VZFZTNTRQjawH73pi25LQLL3Gw7bHmAxYcyBGp9DaTizwqJ1JnjlKOrjnCfp7aVrBUM6kblkX7unLXQwSR1UGDgsU6MNaPsNUGOqUBWs%2FInLtjC53oHHYXEXh0%2FBnLVwv0Uy9PE%2F8H3l4QSZxvvqhPFgZGpJAKDTpWy3XIKhWbWhCTxldEphNEt7tlRXG%2FcpqPjE4d%2Bf265jPfi0p2avhwZZbYDoxQlNNqtB%2B3QRovMCKFHNO7%2BL%2FgBGTEetqppkBqSh8mOsyfeWK%2FP3B6c6L3xnG3Ees%2FKMg0U0st%2Ffy1mIwtA8LNG%2BgioKY4Rmg9FG%2Fq&X-Amz-Signature=09e3de2edf52576bc893b5c5e6cb6b04b752f79062a955e4a5ca50f7ffa10c0d&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

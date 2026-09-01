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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466WFGOEZAR%2F20260901%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260901T104338Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEOH%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIFRsSoHWDqwD44QJq2wN7op46tFKcv2Q3ofNg1SwBgbiAiEA%2Bh9CCnUFL5R8r%2BkGxzMAI1c%2FnW%2FzBbdyBUku%2BLiv7%2BcqiAQIqv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDAaJIeU1q5hPByQseircA5uqom2U1nCIGSTQH3yO9piRIyJXbAAm5hIqKdg09Op0gFlBP3xG%2FFLFCmM2pGSt30n5NXpwBhhV%2FYfSFH%2FMc07sbChk0t%2BILjYYTKAwjx2RQAAIgLtbO5lHD9M0E0bsKbbIhH%2FXRqP5iTMfo0sI%2BxkUry5yej1eAX6IfJqcUvmkrntY371BzFz77qQEXnH77x1cftpH5hkSnLbm2F1tFKxieN2rjfyWkqYpUgpe3bAnmX0anwmgFwZ%2FN3bxvL81wB%2B2b4YidkjesXRqlTVYxErpF9cQngxTiKyB6o309p4BAB17aHEoiNOkXKC8obeBUoqEIIn%2B56UR6TOum9xTmuSMGJQULARoPDYBSzwgjni4uNQjzHa2HQCkhDGDOThThaHG29cM6h%2BLnwcbw%2FdPf9Dt30se8KJu%2BXNzwGsI7hmN7hBYVbNtm1igkTj00bPnbDFV6zF%2BVKt954OeyETHbUAUDi8fLsCn%2BX3J3udh1XkFF7tpDJN2PkB%2BoprVdzcTpF%2ByNyKssR70%2FDjKAR2%2FdAjgGf9C%2BUbR0UsxZpbWX%2BumG7joae0G0niJqPjClfT2GzIgAs8CrinbFcvbaVNFk%2FR%2FXfP08%2FjObn9YXkKLU%2B%2FmHh5wqvIuoNQPvixjMI%2Bw2tQGOqUBWIbthaM0aYCP474cr4Z9FF8HVa0n%2BM%2BoxhCkVqr%2F0ja0fKeJ65BL43wQQriXvw5wHMFJF1qrJPNrAJE7R8j1yJpXMbmvSpgMdCvtWrPfLnrUcLPXzzOX6emJlC1CjnoY1xeQfLIvkBqoiY3VmDf2psouHqA8ljS3h%2FZWB9oB3f%2F3%2FAdfOsZYxYB%2BlzLt4ZTuOk3Gz2G5Tb1XciSEfeaBJHrpJngo&X-Amz-Signature=642b8a95695cabbfa9d2b33bb7357e17c5898b3af0f4e1d3ef266726d2c21606&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466WFGOEZAR%2F20260901%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260901T104339Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEOH%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIFRsSoHWDqwD44QJq2wN7op46tFKcv2Q3ofNg1SwBgbiAiEA%2Bh9CCnUFL5R8r%2BkGxzMAI1c%2FnW%2FzBbdyBUku%2BLiv7%2BcqiAQIqv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDAaJIeU1q5hPByQseircA5uqom2U1nCIGSTQH3yO9piRIyJXbAAm5hIqKdg09Op0gFlBP3xG%2FFLFCmM2pGSt30n5NXpwBhhV%2FYfSFH%2FMc07sbChk0t%2BILjYYTKAwjx2RQAAIgLtbO5lHD9M0E0bsKbbIhH%2FXRqP5iTMfo0sI%2BxkUry5yej1eAX6IfJqcUvmkrntY371BzFz77qQEXnH77x1cftpH5hkSnLbm2F1tFKxieN2rjfyWkqYpUgpe3bAnmX0anwmgFwZ%2FN3bxvL81wB%2B2b4YidkjesXRqlTVYxErpF9cQngxTiKyB6o309p4BAB17aHEoiNOkXKC8obeBUoqEIIn%2B56UR6TOum9xTmuSMGJQULARoPDYBSzwgjni4uNQjzHa2HQCkhDGDOThThaHG29cM6h%2BLnwcbw%2FdPf9Dt30se8KJu%2BXNzwGsI7hmN7hBYVbNtm1igkTj00bPnbDFV6zF%2BVKt954OeyETHbUAUDi8fLsCn%2BX3J3udh1XkFF7tpDJN2PkB%2BoprVdzcTpF%2ByNyKssR70%2FDjKAR2%2FdAjgGf9C%2BUbR0UsxZpbWX%2BumG7joae0G0niJqPjClfT2GzIgAs8CrinbFcvbaVNFk%2FR%2FXfP08%2FjObn9YXkKLU%2B%2FmHh5wqvIuoNQPvixjMI%2Bw2tQGOqUBWIbthaM0aYCP474cr4Z9FF8HVa0n%2BM%2BoxhCkVqr%2F0ja0fKeJ65BL43wQQriXvw5wHMFJF1qrJPNrAJE7R8j1yJpXMbmvSpgMdCvtWrPfLnrUcLPXzzOX6emJlC1CjnoY1xeQfLIvkBqoiY3VmDf2psouHqA8ljS3h%2FZWB9oB3f%2F3%2FAdfOsZYxYB%2BlzLt4ZTuOk3Gz2G5Tb1XciSEfeaBJHrpJngo&X-Amz-Signature=b484f3ef1f48d9708a32f524462f8aff6a472b2f348274dde8e809e79f64ae34&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

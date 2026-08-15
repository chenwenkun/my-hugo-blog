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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466QA5CICBN%2F20260815%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260815T003651Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjED8aCXVzLXdlc3QtMiJGMEQCIBdsV6Wze7F%2FJKfiT2CFeDM9UN6bax88jjW4wOO4ckrEAiBRfK9cGokl7tyWjuxWigyhxFL%2BU5hWAp0vuu1EW6w7Nir%2FAwgIEAAaDDYzNzQyMzE4MzgwNSIMEFNO%2BzLQz64M2tFxKtwDzqWJSVxCi5%2BVcuURWyRS0sTgV4D75uIM3bzzb%2F0XPUFQBa2ai0qN1BrmZrsS07m20EBdFIyjCT3lUkENTcrrI4q9JhU7YP3gfb%2FCku78p9GKHnLv3aUVmXPOHDGUUpJMA4%2BsoCu3HrkC7OayFyN3SBJUG55ND%2FYpu0mvXwWRz4Qf3uGSk%2B2v4Xn9bDzHXLHg6JxPytG%2BejOoieQtAq0gDjxv0qrLTI8URasNq0X0lIvBNiiMIpL3ngoN3n0z6PevvHRjygS2UkwiV9ubA9MwQofyImCYV76V7P9LFpJFMkhzqCWU9EkMjwFvm152SYxGxzIH5F8YOSSvJ8%2BgP%2B%2FdtjeV13bJckb6bHYEmtdB9eWF6bm4YhX02HvWM7xbKvj1rNkYAtD1%2FGcTcKvPjJbKZT9bghO%2F7zHbO9IxJwvOHOUW8KShm2Xlaxs4ndutWkcWPKMR2PmBt%2BB5OZEr2ElcJZ1c9Su9xy9Cyl5EdnQWDZGPC7d09JVjNdQXZIEJxwxgIHA9mCJUu9ELvv8eplCc4ivlqD5HFMViHdDcS0cEBIxgtLE4MvZFh%2Bj830pZqQkQ3kcTZZFLPzacHzf%2B5s%2BLq4QfA2DsXDyJJNS1yRUK39Efj%2FnOqmhXP%2FnRXt4w4sP%2B0wY6pgERWS3Wyw0VnpZw1tIaNEmkagVId5wg8g41jzDJNZxsMfHT8d7DYc8HVTtPTyYLsuI%2B7V%2FTw4KfHem0Z%2B66L%2FaQyQSAdWVwkfUBL6zImnR8yeIJpFVR%2FXO5iiIgKKL3Nim8%2BezPSCq2ALlaWzexMY4puUMaRsKUCRRwl21PAwJbSVU9F%2FTT8lLiqmdhNRMpsSisjAyAq9b4c3ibh0umP%2FXMnaoD5yXr&X-Amz-Signature=012d05c874bde868313641cefab896874ccdc0c74c7e45a2e9dfdd944d2fc87b&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466QA5CICBN%2F20260815%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260815T003651Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjED8aCXVzLXdlc3QtMiJGMEQCIBdsV6Wze7F%2FJKfiT2CFeDM9UN6bax88jjW4wOO4ckrEAiBRfK9cGokl7tyWjuxWigyhxFL%2BU5hWAp0vuu1EW6w7Nir%2FAwgIEAAaDDYzNzQyMzE4MzgwNSIMEFNO%2BzLQz64M2tFxKtwDzqWJSVxCi5%2BVcuURWyRS0sTgV4D75uIM3bzzb%2F0XPUFQBa2ai0qN1BrmZrsS07m20EBdFIyjCT3lUkENTcrrI4q9JhU7YP3gfb%2FCku78p9GKHnLv3aUVmXPOHDGUUpJMA4%2BsoCu3HrkC7OayFyN3SBJUG55ND%2FYpu0mvXwWRz4Qf3uGSk%2B2v4Xn9bDzHXLHg6JxPytG%2BejOoieQtAq0gDjxv0qrLTI8URasNq0X0lIvBNiiMIpL3ngoN3n0z6PevvHRjygS2UkwiV9ubA9MwQofyImCYV76V7P9LFpJFMkhzqCWU9EkMjwFvm152SYxGxzIH5F8YOSSvJ8%2BgP%2B%2FdtjeV13bJckb6bHYEmtdB9eWF6bm4YhX02HvWM7xbKvj1rNkYAtD1%2FGcTcKvPjJbKZT9bghO%2F7zHbO9IxJwvOHOUW8KShm2Xlaxs4ndutWkcWPKMR2PmBt%2BB5OZEr2ElcJZ1c9Su9xy9Cyl5EdnQWDZGPC7d09JVjNdQXZIEJxwxgIHA9mCJUu9ELvv8eplCc4ivlqD5HFMViHdDcS0cEBIxgtLE4MvZFh%2Bj830pZqQkQ3kcTZZFLPzacHzf%2B5s%2BLq4QfA2DsXDyJJNS1yRUK39Efj%2FnOqmhXP%2FnRXt4w4sP%2B0wY6pgERWS3Wyw0VnpZw1tIaNEmkagVId5wg8g41jzDJNZxsMfHT8d7DYc8HVTtPTyYLsuI%2B7V%2FTw4KfHem0Z%2B66L%2FaQyQSAdWVwkfUBL6zImnR8yeIJpFVR%2FXO5iiIgKKL3Nim8%2BezPSCq2ALlaWzexMY4puUMaRsKUCRRwl21PAwJbSVU9F%2FTT8lLiqmdhNRMpsSisjAyAq9b4c3ibh0umP%2FXMnaoD5yXr&X-Amz-Signature=0de3534ed9b5687e773ab131188c9874453412a7edc8b2940b6c3ac6e33f2af6&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

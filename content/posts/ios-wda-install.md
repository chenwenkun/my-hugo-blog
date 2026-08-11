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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466WE2FPAIW%2F20260811%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260811T184452Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEPP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIBu0xwaIfWFf%2FhGIlvbLKcM6ppzVEZQzhwgHzglbdY3mAiEA8bU4RkknLPy9EFE%2Fzrpk5XNx7YHICFRHrtRfWaHMEI4qiAQIvP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDGkEgwNzNT0wup%2BxQCrcA1P%2FaDhtVTs1u%2Fv5ZCwH3dfRBEKi4kcCeAHnf36w3R87NfKbp1F5jPPiFQtPbvkGNirwVyJPaTVICZZYtl8nTBtvkxh1GUXTKZVX0l79XFBkq8gsvMw7hCXI66TaoCW4dd4Jy1%2Box9bvM%2BRwKenFt4QnWnyo44eNRHW0IfM1GSUbmjsn0mvchxwM2EzwnGjYAT5zjCTBtZNbx9qW%2BMwXC9hsWnzzvWH4u%2BH%2BuJ3%2BblerfR%2FX32dV7cu23YS%2FmkyDF5JhyBFWaVW2NsfED5xIl477EqKUfMdEbIyXjAiZrl8vsW8XrpB99abajRGpAq7vQ%2FFUKyBNqT6sIGmv8tRn%2F1kEPFnU0CZv9URpXxotgJLS1pcJYOzmTKE5OFOUPgg1%2BA%2Fs%2F8DzOEBPpHCI2ut0c2KAv7TxzcqrZbaBLViBNM4tKTUDAyVfdVielMgpw1AsbPa5b9Hs45YdPfsv56P4ab8AHn5Wt4xOOZwTK8R8v0P6KrC%2BPlLuIUomqQN05rh6un8gvLYjxFOB5%2F%2FcT%2FUljrQc66sX9IWGL8UWM%2BKqZUsJuFii8XYBynQLM0Udb1aT02u3ot47LV1WyAf5jL1nU%2Bz%2B%2BpxGAdUrrgNEN1AuuA3MEAUK%2B6qkhPiykw80MNvT7dMGOqUBOBrslnMt4dgnonNmVOSK4xPbSd%2B%2BXsXpMUbVFKJPY9qbhKzZxwMVeb2JQiWpuuraRkcsky%2FQq4xoa390mzH6H%2BkErQbAH6ZtjaZERM8Lk%2F9%2BSanb7tK4WXz3hLct4nWTO5HGoFGoEVHZbesUbJfjP83k0Hkj%2B8K6godbDTRCGlwecvyw%2BCv6ASAiYVfISW57Yv2VwXCo04qH9h3i0d9L2Abyt7Mm&X-Amz-Signature=4038a9f5fd444f11e605616eb9f240c8116316e41fce2e9f011f3f19e2c2718a&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466WE2FPAIW%2F20260811%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260811T184452Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEPP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIBu0xwaIfWFf%2FhGIlvbLKcM6ppzVEZQzhwgHzglbdY3mAiEA8bU4RkknLPy9EFE%2Fzrpk5XNx7YHICFRHrtRfWaHMEI4qiAQIvP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDGkEgwNzNT0wup%2BxQCrcA1P%2FaDhtVTs1u%2Fv5ZCwH3dfRBEKi4kcCeAHnf36w3R87NfKbp1F5jPPiFQtPbvkGNirwVyJPaTVICZZYtl8nTBtvkxh1GUXTKZVX0l79XFBkq8gsvMw7hCXI66TaoCW4dd4Jy1%2Box9bvM%2BRwKenFt4QnWnyo44eNRHW0IfM1GSUbmjsn0mvchxwM2EzwnGjYAT5zjCTBtZNbx9qW%2BMwXC9hsWnzzvWH4u%2BH%2BuJ3%2BblerfR%2FX32dV7cu23YS%2FmkyDF5JhyBFWaVW2NsfED5xIl477EqKUfMdEbIyXjAiZrl8vsW8XrpB99abajRGpAq7vQ%2FFUKyBNqT6sIGmv8tRn%2F1kEPFnU0CZv9URpXxotgJLS1pcJYOzmTKE5OFOUPgg1%2BA%2Fs%2F8DzOEBPpHCI2ut0c2KAv7TxzcqrZbaBLViBNM4tKTUDAyVfdVielMgpw1AsbPa5b9Hs45YdPfsv56P4ab8AHn5Wt4xOOZwTK8R8v0P6KrC%2BPlLuIUomqQN05rh6un8gvLYjxFOB5%2F%2FcT%2FUljrQc66sX9IWGL8UWM%2BKqZUsJuFii8XYBynQLM0Udb1aT02u3ot47LV1WyAf5jL1nU%2Bz%2B%2BpxGAdUrrgNEN1AuuA3MEAUK%2B6qkhPiykw80MNvT7dMGOqUBOBrslnMt4dgnonNmVOSK4xPbSd%2B%2BXsXpMUbVFKJPY9qbhKzZxwMVeb2JQiWpuuraRkcsky%2FQq4xoa390mzH6H%2BkErQbAH6ZtjaZERM8Lk%2F9%2BSanb7tK4WXz3hLct4nWTO5HGoFGoEVHZbesUbJfjP83k0Hkj%2B8K6godbDTRCGlwecvyw%2BCv6ASAiYVfISW57Yv2VwXCo04qH9h3i0d9L2Abyt7Mm&X-Amz-Signature=9840704e397de31cd2cd8238b0641debe206e603ae3045e3c6d34944e22fd969&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

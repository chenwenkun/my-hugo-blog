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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663CD4N4DW%2F20261027%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261027T111347Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjECMaCXVzLXdlc3QtMiJHMEUCIGSLVRL1337TjtAFWn%2B%2FhjNs7IkXmpRvi5uJ%2F%2BqwbPRcAiEA%2B3wosCcj2epMCr7PS3V6R8oqajOpYOA0svEl91OXgnwqiAQI6%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDJam9O5dtf6MjRXrXyrcA008GXU1SEbENyep%2BT%2Fy9slbo%2FpUns1OwE98%2FpvLngWABsGe5506utaUilrOFxLBi5FScH6j3VtsttcrHvxDfs1mo72N%2Ba%2F7HcETQMboDb1wnjwb1AvWvqcGSKIEojpnszFxYXTMl9xJHdfP5M%2Bf1cUZJAY%2FMJ6jEnItLsZyu%2FJ66%2Bj%2Bl11%2BVvoEwpkA%2BnLab1R2hxWByNIw0GQlmbfdujMafoHDUrh7ajE0PlDlg%2Ff28MK0Uz6%2FDoF%2BobXzJbK67X01uYPpiKVhulQLJu0qO%2Fb0OocrV5UoVF9g90nHx5gybzigT4T9BdN1KTwYFiLG6GuLi77PLgWVsH2qdS0nVB62kb%2F2ACW8MwsFqX%2BxsBhpDifZhtrnDBNJnRNA9HpoUg2EZTp9crSX35VIFYMZX8BmfBoXhQmLt%2BwZEPDSW3lyqGk0WbnvBLimI%2FqNC%2FtwAN%2FTJ7E99ZAp3YNuoM3Jj4fNVArRA5ZbaeoyPMz802cHdZ9fvdxO37uOSIsb2GBp%2BhOz2jmSZDbRRlMMmefIAI9aRIMT0hhzjsnzOjYqOefAt%2FHMbp0M4R9MZFZuWYwDGrn5wgN8csp386HZBp%2BWn4CKTx3qkJmNu1ruLfJwBo2PFMxxXlnTuaVr2jxtMKCKgtcGOqUB3Ym4URW1Sh1Xeb3P8K4xmp5nyvPjYFx4RhEsp1pM0U3w8ptlPcUIUeglvtNWuXH5ZhvhDK2vPfbE07pthijckxGlvHD1bZILKRJIDZN8BLh6EGVqTqzb7mQa4%2BzxbuznWaunl%2FPm1CEBcXH6dRlU%2BhUSuJY1J%2FSxW%2B9xjYw1MvOuCZAfqOMSmNJxlrbX6ZkogxCULIcsU31hzwTpfklNOXo%2BdqDJ&X-Amz-Signature=55792b901170bab9f73a2bf607fbaf2463221882512ccdb91c13afca2cf640c1&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663CD4N4DW%2F20261027%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261027T111347Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjECMaCXVzLXdlc3QtMiJHMEUCIGSLVRL1337TjtAFWn%2B%2FhjNs7IkXmpRvi5uJ%2F%2BqwbPRcAiEA%2B3wosCcj2epMCr7PS3V6R8oqajOpYOA0svEl91OXgnwqiAQI6%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDJam9O5dtf6MjRXrXyrcA008GXU1SEbENyep%2BT%2Fy9slbo%2FpUns1OwE98%2FpvLngWABsGe5506utaUilrOFxLBi5FScH6j3VtsttcrHvxDfs1mo72N%2Ba%2F7HcETQMboDb1wnjwb1AvWvqcGSKIEojpnszFxYXTMl9xJHdfP5M%2Bf1cUZJAY%2FMJ6jEnItLsZyu%2FJ66%2Bj%2Bl11%2BVvoEwpkA%2BnLab1R2hxWByNIw0GQlmbfdujMafoHDUrh7ajE0PlDlg%2Ff28MK0Uz6%2FDoF%2BobXzJbK67X01uYPpiKVhulQLJu0qO%2Fb0OocrV5UoVF9g90nHx5gybzigT4T9BdN1KTwYFiLG6GuLi77PLgWVsH2qdS0nVB62kb%2F2ACW8MwsFqX%2BxsBhpDifZhtrnDBNJnRNA9HpoUg2EZTp9crSX35VIFYMZX8BmfBoXhQmLt%2BwZEPDSW3lyqGk0WbnvBLimI%2FqNC%2FtwAN%2FTJ7E99ZAp3YNuoM3Jj4fNVArRA5ZbaeoyPMz802cHdZ9fvdxO37uOSIsb2GBp%2BhOz2jmSZDbRRlMMmefIAI9aRIMT0hhzjsnzOjYqOefAt%2FHMbp0M4R9MZFZuWYwDGrn5wgN8csp386HZBp%2BWn4CKTx3qkJmNu1ruLfJwBo2PFMxxXlnTuaVr2jxtMKCKgtcGOqUB3Ym4URW1Sh1Xeb3P8K4xmp5nyvPjYFx4RhEsp1pM0U3w8ptlPcUIUeglvtNWuXH5ZhvhDK2vPfbE07pthijckxGlvHD1bZILKRJIDZN8BLh6EGVqTqzb7mQa4%2BzxbuznWaunl%2FPm1CEBcXH6dRlU%2BhUSuJY1J%2FSxW%2B9xjYw1MvOuCZAfqOMSmNJxlrbX6ZkogxCULIcsU31hzwTpfklNOXo%2BdqDJ&X-Amz-Signature=5fe1c2d8082a2ed8ce9765346c7df984ab3b25ab2843afd534dd2a317653c752&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

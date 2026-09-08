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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663RYZUIZD%2F20260908%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260908T202700Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJH%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIFehPgUoPmcxh0%2FbFx%2BaKcHSGeq3ie28RfQToCWo40UaAiEA%2B1HZH%2B6o6aa8I1pS%2B6Og3jSfT7EN%2Ft6pGsQ2OlzCPAAq%2FwMIWhAAGgw2Mzc0MjMxODM4MDUiDPnGA3rlHG6Bb%2Be8mircA2Ndd5Is48SpRq71nTFfVuXK1DgXOEKIW7UWv3x%2BEggF9tbTx%2B5DXfbQoaXJQrT%2FSZjwjk2eSorWp7aj%2F0boZ4AX729MCLhh4o3%2FiTdolIr%2BXSGl2sW9V00skmtjgkKWMFkOZVacWkky%2B2K%2F2ZgaX4juNJkbPeHQK74jPQ4G0Et3B6zfRxpgBG%2F4ppifNJDuVkB19WwEa0KrtSdvAnKTccQu2Trhs%2Bgua2xeZuFGaZpFQ0pMH79S9nXjFdwfFfLfk6W7EH8wVZOMWs1g%2BmrapfD6rOM4urpK1xB6olskMDz%2BU9MacyTFqVmzqmtvVULTM5NX6OWd9nNFyHOMuLACQKCFHQwjChIC0rkeA81JoaSgyfZFAQeu5TCqrjeL4GTkMLR2y1MKr9nt9oD4t5WfdpwHXCfjnxLLtJOczLRxrJ6D0TGGA0vg4AeLrhcEMCYLyLvOSo3euAd9Jkrsnp5DpQpGdRrIOhBSYWZNBrDPEhPjYVReHj8RqrWFyYcwjHpFXwEkdhgaa8vpt9oL5M%2Bz0rsryTLqyUzxLleLokzkv59ESvo5uV%2FFMmbAoQvsjvdPdPozTLh%2BaEjsHmM2qdaQLSUO6soMZoeW%2FmEt8xBWURaCcctKijCluwsliyv6MOr%2FgNUGOqUBpEdbV2yk%2FUCFyLx7obd4fzsthfnidF1BAz6kfnfdABPjMINtIDZYk0C03%2FL%2FGcEp15DD6EQcI69eFjZSASrf7PhBSnB6%2BNN7dTFN5swBvnlT%2BzbwOobZZ09tNyz7MNQC1lhHciv1zpd57Ey%2BU1Ebod1zA7ZWqcXiX09syoaSaWq5KXbOqBSNyHUcuKciGOE%2B2qE5RsvIpbg4MBOTb5wSvawj6XTn&X-Amz-Signature=8ccb5afc9c8862eaa829da80ca6116e31eb37e260403f373a23f9da0e12e8969&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663RYZUIZD%2F20260908%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260908T202700Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJH%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIFehPgUoPmcxh0%2FbFx%2BaKcHSGeq3ie28RfQToCWo40UaAiEA%2B1HZH%2B6o6aa8I1pS%2B6Og3jSfT7EN%2Ft6pGsQ2OlzCPAAq%2FwMIWhAAGgw2Mzc0MjMxODM4MDUiDPnGA3rlHG6Bb%2Be8mircA2Ndd5Is48SpRq71nTFfVuXK1DgXOEKIW7UWv3x%2BEggF9tbTx%2B5DXfbQoaXJQrT%2FSZjwjk2eSorWp7aj%2F0boZ4AX729MCLhh4o3%2FiTdolIr%2BXSGl2sW9V00skmtjgkKWMFkOZVacWkky%2B2K%2F2ZgaX4juNJkbPeHQK74jPQ4G0Et3B6zfRxpgBG%2F4ppifNJDuVkB19WwEa0KrtSdvAnKTccQu2Trhs%2Bgua2xeZuFGaZpFQ0pMH79S9nXjFdwfFfLfk6W7EH8wVZOMWs1g%2BmrapfD6rOM4urpK1xB6olskMDz%2BU9MacyTFqVmzqmtvVULTM5NX6OWd9nNFyHOMuLACQKCFHQwjChIC0rkeA81JoaSgyfZFAQeu5TCqrjeL4GTkMLR2y1MKr9nt9oD4t5WfdpwHXCfjnxLLtJOczLRxrJ6D0TGGA0vg4AeLrhcEMCYLyLvOSo3euAd9Jkrsnp5DpQpGdRrIOhBSYWZNBrDPEhPjYVReHj8RqrWFyYcwjHpFXwEkdhgaa8vpt9oL5M%2Bz0rsryTLqyUzxLleLokzkv59ESvo5uV%2FFMmbAoQvsjvdPdPozTLh%2BaEjsHmM2qdaQLSUO6soMZoeW%2FmEt8xBWURaCcctKijCluwsliyv6MOr%2FgNUGOqUBpEdbV2yk%2FUCFyLx7obd4fzsthfnidF1BAz6kfnfdABPjMINtIDZYk0C03%2FL%2FGcEp15DD6EQcI69eFjZSASrf7PhBSnB6%2BNN7dTFN5swBvnlT%2BzbwOobZZ09tNyz7MNQC1lhHciv1zpd57Ey%2BU1Ebod1zA7ZWqcXiX09syoaSaWq5KXbOqBSNyHUcuKciGOE%2B2qE5RsvIpbg4MBOTb5wSvawj6XTn&X-Amz-Signature=66d15d0c74955f697adf454300a530fa217dabe0cd470cd312f0de37e4f70cb0&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

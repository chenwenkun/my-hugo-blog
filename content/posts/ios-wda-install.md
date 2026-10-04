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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466SFZW6WHZ%2F20261004%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261004T112918Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEPn%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQCxGeKf1vi3LQ801tXwl44YPSliJ3uYkPZzVmw9bxsNbAIgBIa9r%2Bui3iAwaSNVKpbA61tpV%2FfkNx%2FRs4cLAaVS86wqiAQIwf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDLXFWw9X0JMfIxBkNCrcA2%2BunAj3JwkjSnDyWVoW3o1YUXdSLVqC%2F8JfrP1OmBR7xc2wT7%2FTZxM%2FLr1auYVCnsVTTcDG23Tk%2FdyHhTNMAFgS6d%2BopcwrH8jXf1hkyw%2B%2FJvvRdTHbkei%2FzZcb3dqwG%2FYSbplLT%2Bsa96iGXAbNru45Zb6KfZLopu6%2BbTrR2Mo88jSgI5UDJPFU5w6JXz7hXyRDxA%2FNjPp0%2FC4QNhN88VAi4eiaUIefiESPrSLJsnUdCIUswFgD3i2su7%2BVfKOU6TSBhxHD9yUWFrlwQZ4Iv9Xezsz4AzGyqs%2F9HN8xsFTKJKlOQpASWv2K9AzaHPo7hSUlfjfsNVLks0GtllYk2%2FGsD9iJ6eDLS%2BSgzwCosy6DpcjyFgV3tqdVtPQAmbeUFxCFLsuoCuhE703DtK2Fo76bB45iq%2B1aiJI1yQIteLZ0OPYiL0wgquAVdfN1fJVpD7WJ9jXDrDzKXHb%2BxYe0QI%2Fb%2Br8YT%2B7A5QAHZDc2k5vG8RftwGG4o%2Bx%2Fx2r5JCwu%2FhvO0qDfABVqdr8njy2UwNqhzWZeaqE1GscWq6%2BnJ5YhPfFet7U1ls16O7eQQXB%2Fb1UYIDDV8K1IbJsYIfRxSVMEv2Oxk8Gq95BJIWahp%2FBolOKWaswmPNjb40xXMNaYiNYGOqUBzK5e0nG%2Bfn%2FwftkfoKUI6aJcL9JbroJdtoPTswC6X04Gv%2FZxCLyFeaEEi9FKJnuGTB98MXTlV7xLYXkyGAre%2ByRjs8PQqvf4MZv7fq97Ik6%2BLqG1H%2BCp39Py%2B7lxauo7JiotleP2OGqxGFKfEvuwBNYmaYs4%2F0myW%2Fg%2B42hArgf4HffBMGQOgivTDv6LJE4OAbl42lVBGGwnR5kg0MQ6KzQM%2F8Q8&X-Amz-Signature=a95bd8fd02262aaf2859ea8d145361ba7ba70e06f9ed0836bb7f1b368a0a2a4d&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466SFZW6WHZ%2F20261004%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261004T112918Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEPn%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQCxGeKf1vi3LQ801tXwl44YPSliJ3uYkPZzVmw9bxsNbAIgBIa9r%2Bui3iAwaSNVKpbA61tpV%2FfkNx%2FRs4cLAaVS86wqiAQIwf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDLXFWw9X0JMfIxBkNCrcA2%2BunAj3JwkjSnDyWVoW3o1YUXdSLVqC%2F8JfrP1OmBR7xc2wT7%2FTZxM%2FLr1auYVCnsVTTcDG23Tk%2FdyHhTNMAFgS6d%2BopcwrH8jXf1hkyw%2B%2FJvvRdTHbkei%2FzZcb3dqwG%2FYSbplLT%2Bsa96iGXAbNru45Zb6KfZLopu6%2BbTrR2Mo88jSgI5UDJPFU5w6JXz7hXyRDxA%2FNjPp0%2FC4QNhN88VAi4eiaUIefiESPrSLJsnUdCIUswFgD3i2su7%2BVfKOU6TSBhxHD9yUWFrlwQZ4Iv9Xezsz4AzGyqs%2F9HN8xsFTKJKlOQpASWv2K9AzaHPo7hSUlfjfsNVLks0GtllYk2%2FGsD9iJ6eDLS%2BSgzwCosy6DpcjyFgV3tqdVtPQAmbeUFxCFLsuoCuhE703DtK2Fo76bB45iq%2B1aiJI1yQIteLZ0OPYiL0wgquAVdfN1fJVpD7WJ9jXDrDzKXHb%2BxYe0QI%2Fb%2Br8YT%2B7A5QAHZDc2k5vG8RftwGG4o%2Bx%2Fx2r5JCwu%2FhvO0qDfABVqdr8njy2UwNqhzWZeaqE1GscWq6%2BnJ5YhPfFet7U1ls16O7eQQXB%2Fb1UYIDDV8K1IbJsYIfRxSVMEv2Oxk8Gq95BJIWahp%2FBolOKWaswmPNjb40xXMNaYiNYGOqUBzK5e0nG%2Bfn%2FwftkfoKUI6aJcL9JbroJdtoPTswC6X04Gv%2FZxCLyFeaEEi9FKJnuGTB98MXTlV7xLYXkyGAre%2ByRjs8PQqvf4MZv7fq97Ik6%2BLqG1H%2BCp39Py%2B7lxauo7JiotleP2OGqxGFKfEvuwBNYmaYs4%2F0myW%2Fg%2B42hArgf4HffBMGQOgivTDv6LJE4OAbl42lVBGGwnR5kg0MQ6KzQM%2F8Q8&X-Amz-Signature=99b856b65ec8ad9c77c3909d9c149c8700e377b64e07a9c5a01b4a964d340ed9&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466QTEJHFGA%2F20260927%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260927T105954Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEFEaCXVzLXdlc3QtMiJHMEUCIQCbdtH2bfZMDkBVbpxm8iJI7LxHdTPpRIRZ%2F%2BHkrppBgAIgf1uVRhuEcIwQHoVNWdDcIGcELkqHdmjgZBFZLic3Iwgq%2FwMIGhAAGgw2Mzc0MjMxODM4MDUiDPpF6S17KEjp7x8qZSrcAyvGgsem%2BqnVriYQbsgntzyVxMhTM9aXKBuJd%2BDh5BGPBOzKX%2FNDvd4VrDG9UABuGo0buoTPwGEQyp2OWvxTwpCjslmI7%2BXZQ6vVup8kO%2F8Ti64HKWnfz73U6EXoploCSKJ0EpVyPwV6M6NRqdTP%2Ffg%2BYCDfF0n92jSf%2B%2FAS%2B8Ub9wksJRzb4T0mCI5ltiwEujwKdjU3iMvnbxNATPBvRf2QWWso3f02UZ59kXkhqhCi0uZ%2BF7voOufEPWqPuhEqJ3JQ7Jyw14zpKRr9edqstZoM18jojKtA8pYolL2nJt4AXsb06SEyotoPoW5DG0kAVLUQyBGk3kcFZ%2FJrbpGpvl9OzkSIg5HV%2BfVmRWGYYQ8UFbJIRDxWabUqStY1d4q7U7djv04SDNUJOTzIvRpFuP9OgCoBj%2FllQUZKUJdHl4fv1ePMmWc4Un6N0SpJROuGOia58cqNh4iC7BgCewb2NsOEn1NU13b8gqEUub87LSNClV0MzUgYQ9X3ZQftFtL0m6C1UoK0iuHObo8Gz4ctC59D0oD%2BWX4b8ZhVyxxEcypWTNTcY4JHLFGISkjZ7ULC%2Fi7egICnSiMeiwesASGBk63gZBIm1SlXaRki5Esi1%2FMZBVTlIyrtnrPWSR4VMLqs49UGOqUB1cNEqeqFcKyQDsBugP8vy%2BmIMtcPKPW3d%2FmUlu4Zx7LFXdIvZu0vS9cJMiCMOjDE99vmR7nIJxthh90AJZ0sijZBqLqaFFB%2B1FDbo%2BYbuKPJzRT3jzOwXXxyzJWXjlY%2FdMyYrppf0HWgvtRUJ0gSuvskI6LYUSJeUdJm6ISARvZzK%2F6iaTPgwlC8O0xuqdsRT2g0mQftBEYse26ATl43VhC52o%2FQ&X-Amz-Signature=9da988dd7d8bb7ad1fefed1c98dfc69f6b58f15da430ec981dbabbee59fa2441&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466QTEJHFGA%2F20260927%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260927T105954Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEFEaCXVzLXdlc3QtMiJHMEUCIQCbdtH2bfZMDkBVbpxm8iJI7LxHdTPpRIRZ%2F%2BHkrppBgAIgf1uVRhuEcIwQHoVNWdDcIGcELkqHdmjgZBFZLic3Iwgq%2FwMIGhAAGgw2Mzc0MjMxODM4MDUiDPpF6S17KEjp7x8qZSrcAyvGgsem%2BqnVriYQbsgntzyVxMhTM9aXKBuJd%2BDh5BGPBOzKX%2FNDvd4VrDG9UABuGo0buoTPwGEQyp2OWvxTwpCjslmI7%2BXZQ6vVup8kO%2F8Ti64HKWnfz73U6EXoploCSKJ0EpVyPwV6M6NRqdTP%2Ffg%2BYCDfF0n92jSf%2B%2FAS%2B8Ub9wksJRzb4T0mCI5ltiwEujwKdjU3iMvnbxNATPBvRf2QWWso3f02UZ59kXkhqhCi0uZ%2BF7voOufEPWqPuhEqJ3JQ7Jyw14zpKRr9edqstZoM18jojKtA8pYolL2nJt4AXsb06SEyotoPoW5DG0kAVLUQyBGk3kcFZ%2FJrbpGpvl9OzkSIg5HV%2BfVmRWGYYQ8UFbJIRDxWabUqStY1d4q7U7djv04SDNUJOTzIvRpFuP9OgCoBj%2FllQUZKUJdHl4fv1ePMmWc4Un6N0SpJROuGOia58cqNh4iC7BgCewb2NsOEn1NU13b8gqEUub87LSNClV0MzUgYQ9X3ZQftFtL0m6C1UoK0iuHObo8Gz4ctC59D0oD%2BWX4b8ZhVyxxEcypWTNTcY4JHLFGISkjZ7ULC%2Fi7egICnSiMeiwesASGBk63gZBIm1SlXaRki5Esi1%2FMZBVTlIyrtnrPWSR4VMLqs49UGOqUB1cNEqeqFcKyQDsBugP8vy%2BmIMtcPKPW3d%2FmUlu4Zx7LFXdIvZu0vS9cJMiCMOjDE99vmR7nIJxthh90AJZ0sijZBqLqaFFB%2B1FDbo%2BYbuKPJzRT3jzOwXXxyzJWXjlY%2FdMyYrppf0HWgvtRUJ0gSuvskI6LYUSJeUdJm6ISARvZzK%2F6iaTPgwlC8O0xuqdsRT2g0mQftBEYse26ATl43VhC52o%2FQ&X-Amz-Signature=824281ae7a64ab75ae5cd243ed685630b6cd67a4bf78826cdb7a2eb7001afa5e&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

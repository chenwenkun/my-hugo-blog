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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466Z77QX7BB%2F20261023%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261023T104043Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEMH%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQDV1ZA6Q9SgfWxA0QbnYb52G7R6V5b%2BnaHoXjMEBn9tiQIgCWxuqVM3m7yjyXxHcU%2FMNY6lVzmIbUAvk9esk2fAzSUqiAQIif%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDAJU7wGCTNikN0Z3YSrcA8rlwobTGE%2FhwmBFbPHCkH2u9yEGuwNDxmMAtm7ce6qwyOPN00GS6Ii9%2F0cGSWCftvN1Xw1uoAylWykfaOie%2B%2BO5LQjtsJ5hO8J6aCJ%2B0m%2FEGsf1lPO1Hn5D9otEQyGAayF9DkLvFInPc2sXGigX9nwPuICGpG7Z2QfC6GZUDWXL%2Foe%2BcN6%2Fm0lTIh9G66hc2Rth8FNlSVJPRzXH7IElJKIzl07wU0NwSZhtsEwito04I%2BElCjdC39bjkKLCl3YC%2F4%2BaiVjdNhqsc%2FUenwo%2BJoXMRYQfr8ESb93iN9AGrslp5bl9NcsyoUqilLRrgqyN%2F2agiQGH%2BtogoeOoIWBgteOb6rU%2FYy6YRytdIT33UZgftFRcn8N3wQG6cJEE4Fl%2FeKuAqGbP5VfYqpsXqFXIFTV3RfDSdZlUr815IwUxPTXCXHm%2FhF6fHb7RE6yWw%2B2NBB4zTeGgxFO6kmgD4XAdH9MUZ6%2B1%2FgrSrhy%2BJ%2B3P5b4HVeowAwCUDLrDSfui4W629gdO7NLwmsxyLybNfRgWBFlWSPcf7hrqGxKWIZOYcpOhRqFkZVLgMXuAORMkShpYgxXrFHkVD46zWz6ct8yxfOnAPYQ05TqmRSQ5rkbU5PT%2FQoFLnVUhvi1FjhbFML237NYGOqUBLaevjBmLqpFIeqWLR8WkPApnkgDvN%2FJEwPyb%2F10eNUj1bIQTa9vO7piBj8hD5uTl6AnebgoKo3WL8oylpmSfWxc4hci3is2YbbSdu5YDYqb2Sb8MYwC0QNjYiEtmuKq%2FHTrO2kh0zCph9QdAjmDrsh5SP%2BwDNANog%2BpFopFqaK7nUZgBVbaVrUELp5rsEEQiK9lGtRS7YuyYvSvtJYxFwINEONvU&X-Amz-Signature=8ad7d118f62e820b23f4780b0c03aa6cd55681893a0d2844a656e6c802ce9bc3&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466Z77QX7BB%2F20261023%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261023T104043Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEMH%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQDV1ZA6Q9SgfWxA0QbnYb52G7R6V5b%2BnaHoXjMEBn9tiQIgCWxuqVM3m7yjyXxHcU%2FMNY6lVzmIbUAvk9esk2fAzSUqiAQIif%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDAJU7wGCTNikN0Z3YSrcA8rlwobTGE%2FhwmBFbPHCkH2u9yEGuwNDxmMAtm7ce6qwyOPN00GS6Ii9%2F0cGSWCftvN1Xw1uoAylWykfaOie%2B%2BO5LQjtsJ5hO8J6aCJ%2B0m%2FEGsf1lPO1Hn5D9otEQyGAayF9DkLvFInPc2sXGigX9nwPuICGpG7Z2QfC6GZUDWXL%2Foe%2BcN6%2Fm0lTIh9G66hc2Rth8FNlSVJPRzXH7IElJKIzl07wU0NwSZhtsEwito04I%2BElCjdC39bjkKLCl3YC%2F4%2BaiVjdNhqsc%2FUenwo%2BJoXMRYQfr8ESb93iN9AGrslp5bl9NcsyoUqilLRrgqyN%2F2agiQGH%2BtogoeOoIWBgteOb6rU%2FYy6YRytdIT33UZgftFRcn8N3wQG6cJEE4Fl%2FeKuAqGbP5VfYqpsXqFXIFTV3RfDSdZlUr815IwUxPTXCXHm%2FhF6fHb7RE6yWw%2B2NBB4zTeGgxFO6kmgD4XAdH9MUZ6%2B1%2FgrSrhy%2BJ%2B3P5b4HVeowAwCUDLrDSfui4W629gdO7NLwmsxyLybNfRgWBFlWSPcf7hrqGxKWIZOYcpOhRqFkZVLgMXuAORMkShpYgxXrFHkVD46zWz6ct8yxfOnAPYQ05TqmRSQ5rkbU5PT%2FQoFLnVUhvi1FjhbFML237NYGOqUBLaevjBmLqpFIeqWLR8WkPApnkgDvN%2FJEwPyb%2F10eNUj1bIQTa9vO7piBj8hD5uTl6AnebgoKo3WL8oylpmSfWxc4hci3is2YbbSdu5YDYqb2Sb8MYwC0QNjYiEtmuKq%2FHTrO2kh0zCph9QdAjmDrsh5SP%2BwDNANog%2BpFopFqaK7nUZgBVbaVrUELp5rsEEQiK9lGtRS7YuyYvSvtJYxFwINEONvU&X-Amz-Signature=7e4edbe956da3ba50dead3f2a39fb9c49c4d554e304f2a51e4445746777f634c&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

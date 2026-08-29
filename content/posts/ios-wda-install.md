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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466UMCJI7UZ%2F20260829%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260829T115549Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIBpQ8dclmJzzm6EDPpWvR526TRm379ka59dfchixj0I8AiEAu3UkJ47M%2BmwID5aPWHeoKjPLepS83Y%2FFpFWOLb2HPWQq%2FwMIZBAAGgw2Mzc0MjMxODM4MDUiDAKyPPUM8hry0FuQPSrcAzT2og8U2FMTwk8OWn7LvqUkkxpvEvjnGT1oMWSBp5DLQZMjC99g8ZuymoOTwmVjGZCnwG%2FjRMAU0WICIzX9DdQ1LbXoooBCLltDnpuI7PE66aYisUDxIooFvLRiZfFv0QqT4mXIVpc8S1PgipmN9pVRozbgVkZr2nLi3k%2BjLwwM3UkmzMDDxMDKmgu81ohE7BrgmX%2BYPjNsiwCtqBNi2yIJtxcOw%2FU%2Fwm8E8CGbz6MHY80S29hzvv5H2n3KEJuvcEuSibygCUhykrHFXdlRGgUO9CdcujnyOMvgN0Lk2cBkHS4KzqAouiaY7AKv3mZocWKGG2A%2FBAf2pUrJ9V6X6EUuDSIqldWfmd3hPlgt6rq6VA4tbZFWo4%2FDHtIck%2FvfT3BrIpXDlmoYEafFNsPXcysDmFOCyDLFg7qK1hyJb8mVc4oqcvSbTyHGMfwE%2FSEj1ArbzJs0JBWW9SE0PrLWbAhf0dBOqZQml9GOaFnRcr5%2FuvoQ3lUxIvt5MXl43rU1oC9bRnEXn7Wk%2BQyH%2FHpIuTkv1H%2F4BCIUqufzxAMU4Xq7P5ixteSHs7oPGiE60uwJZf67FKcMzz5o2nzQiUBQtc6RLsgzjjK8TrT7ZxvRZex4KY4Zg22u%2BswEM2%2FZMJL7ytQGOqUB%2FdEB8K5npA4AMpej9JNqPaDLb23xPzcoLRKpK2t3Yc9UhuKJ9TorhSp5IeWs0%2FPVKl2%2BDMaltb%2FhBj5JY89N80dFSfoT3HkB3h1euL67NR%2FZcM5ykceUM3wYskiXmX3OVvRJeoug63LLTX6ppMfsij%2F3UgMYtKpLWG1DdchljbcCfQ7gjkNZImGnPNF0LK8oNJhX7qQKsdrMHI0mF2WZCXIcYLq2&X-Amz-Signature=8276ec0781b3d27c1ac84866fc8001fd86601752d3874fa80553cfb17fd7ccf7&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466UMCJI7UZ%2F20260829%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260829T115550Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIBpQ8dclmJzzm6EDPpWvR526TRm379ka59dfchixj0I8AiEAu3UkJ47M%2BmwID5aPWHeoKjPLepS83Y%2FFpFWOLb2HPWQq%2FwMIZBAAGgw2Mzc0MjMxODM4MDUiDAKyPPUM8hry0FuQPSrcAzT2og8U2FMTwk8OWn7LvqUkkxpvEvjnGT1oMWSBp5DLQZMjC99g8ZuymoOTwmVjGZCnwG%2FjRMAU0WICIzX9DdQ1LbXoooBCLltDnpuI7PE66aYisUDxIooFvLRiZfFv0QqT4mXIVpc8S1PgipmN9pVRozbgVkZr2nLi3k%2BjLwwM3UkmzMDDxMDKmgu81ohE7BrgmX%2BYPjNsiwCtqBNi2yIJtxcOw%2FU%2Fwm8E8CGbz6MHY80S29hzvv5H2n3KEJuvcEuSibygCUhykrHFXdlRGgUO9CdcujnyOMvgN0Lk2cBkHS4KzqAouiaY7AKv3mZocWKGG2A%2FBAf2pUrJ9V6X6EUuDSIqldWfmd3hPlgt6rq6VA4tbZFWo4%2FDHtIck%2FvfT3BrIpXDlmoYEafFNsPXcysDmFOCyDLFg7qK1hyJb8mVc4oqcvSbTyHGMfwE%2FSEj1ArbzJs0JBWW9SE0PrLWbAhf0dBOqZQml9GOaFnRcr5%2FuvoQ3lUxIvt5MXl43rU1oC9bRnEXn7Wk%2BQyH%2FHpIuTkv1H%2F4BCIUqufzxAMU4Xq7P5ixteSHs7oPGiE60uwJZf67FKcMzz5o2nzQiUBQtc6RLsgzjjK8TrT7ZxvRZex4KY4Zg22u%2BswEM2%2FZMJL7ytQGOqUB%2FdEB8K5npA4AMpej9JNqPaDLb23xPzcoLRKpK2t3Yc9UhuKJ9TorhSp5IeWs0%2FPVKl2%2BDMaltb%2FhBj5JY89N80dFSfoT3HkB3h1euL67NR%2FZcM5ykceUM3wYskiXmX3OVvRJeoug63LLTX6ppMfsij%2F3UgMYtKpLWG1DdchljbcCfQ7gjkNZImGnPNF0LK8oNJhX7qQKsdrMHI0mF2WZCXIcYLq2&X-Amz-Signature=291746677802e6e4a7af48b325bcf017c713bdffea50afffd5c19ed67c33d64f&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466WK34JP3R%2F20260918%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260918T101308Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEHcaCXVzLXdlc3QtMiJHMEUCIH%2F%2Bt6pmFbaG9kHWKSFMmokJvLZie%2BYhsouzZ%2BbW%2BrGqAiEA1nBEZqBOJ11ScRFr0VWh9Lg8KfCIdqmvKQk0BWuSHIgq%2FwMIQBAAGgw2Mzc0MjMxODM4MDUiDMQwSaIY8%2FIWUViAIircAw51LSUbPXwlSNl5iXZjyERLNL9QNuBBiSIklOW5cc6jFahGdxJ46ekjk%2B0iPbg3kwyhGM9sga5IjHHAehlpx5AOOjHHjhGegJTge09G4Qjd0gFU775hNKTFY1l0PmpwAk%2BVfJGqKK1dpQGqtIUsMXGxpPgMNGvU2ziupVkYh%2BaXY6WuWiLt%2FTLpwbZlJStyZRVkOJ2FE0z4FVFa1K5eEKxA1hzVy4W6U4eUrn0kevKTpQ11fVGzU5SSrdlgZ36TpxqPuC4nd8AsXiAb8fZf%2BkYXSaf0PidMssYgafrTbJvkeGniv6m10xLrGt8zz0WGFAVLvaX%2BaMHDjQIzgLYQK31VxLiLOvuxD9ENxUbEp4Ah%2BRC4tpaH4EoRDIDJQC2VKwli5de333YK07LxaLssKNeVazFIM7m9JbFbvxdf2MKXsgSAmt6nQTOzEtE8g3XzQ2EGXIzPxf4RtmFcMoaavinkLOlii%2Bljgq4P5eXostrzpcUaE9Wl72YN3q1DeG0vm%2B76ERrYYN1w40%2ByvixDk2Pt3wg4M8IYWnL6igF%2BE4sbBM5AeBxyIGy89cs5%2BhLwRZ9wArH1ihYKXy5tIpmHy7XZFUQHpJRBO1wfLJt3p4YTECMZT5Veft2hJ3c0MMy%2Fs9UGOqUBNVJTYKT6sbZLoe8QJ4%2FaXJki0sGyGRMjbqWLmTz8%2Fp%2BkxNo8guINzuXjuqP0cFXqx6dbF7AnfK4MxhUPxC8BtiRFtPHmz7nJMdgPhFqx4bd%2Fn4s72SPH%2BbA6LEBZOpqtp2ET%2FhNUNcGJfGJa6c5jaAZVw%2F3mZ%2BfnbYyhRbIkHrIM8yU8bCsEkzwqdUY%2FbYGn37DZxwwWMGop0hVT2NKPBtmpTfQ6&X-Amz-Signature=a435456fd990050694a54f0f1b9426377b94bdf18b165f1969d29bc37f75bab8&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466WK34JP3R%2F20260918%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260918T101308Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEHcaCXVzLXdlc3QtMiJHMEUCIH%2F%2Bt6pmFbaG9kHWKSFMmokJvLZie%2BYhsouzZ%2BbW%2BrGqAiEA1nBEZqBOJ11ScRFr0VWh9Lg8KfCIdqmvKQk0BWuSHIgq%2FwMIQBAAGgw2Mzc0MjMxODM4MDUiDMQwSaIY8%2FIWUViAIircAw51LSUbPXwlSNl5iXZjyERLNL9QNuBBiSIklOW5cc6jFahGdxJ46ekjk%2B0iPbg3kwyhGM9sga5IjHHAehlpx5AOOjHHjhGegJTge09G4Qjd0gFU775hNKTFY1l0PmpwAk%2BVfJGqKK1dpQGqtIUsMXGxpPgMNGvU2ziupVkYh%2BaXY6WuWiLt%2FTLpwbZlJStyZRVkOJ2FE0z4FVFa1K5eEKxA1hzVy4W6U4eUrn0kevKTpQ11fVGzU5SSrdlgZ36TpxqPuC4nd8AsXiAb8fZf%2BkYXSaf0PidMssYgafrTbJvkeGniv6m10xLrGt8zz0WGFAVLvaX%2BaMHDjQIzgLYQK31VxLiLOvuxD9ENxUbEp4Ah%2BRC4tpaH4EoRDIDJQC2VKwli5de333YK07LxaLssKNeVazFIM7m9JbFbvxdf2MKXsgSAmt6nQTOzEtE8g3XzQ2EGXIzPxf4RtmFcMoaavinkLOlii%2Bljgq4P5eXostrzpcUaE9Wl72YN3q1DeG0vm%2B76ERrYYN1w40%2ByvixDk2Pt3wg4M8IYWnL6igF%2BE4sbBM5AeBxyIGy89cs5%2BhLwRZ9wArH1ihYKXy5tIpmHy7XZFUQHpJRBO1wfLJt3p4YTECMZT5Veft2hJ3c0MMy%2Fs9UGOqUBNVJTYKT6sbZLoe8QJ4%2FaXJki0sGyGRMjbqWLmTz8%2Fp%2BkxNo8guINzuXjuqP0cFXqx6dbF7AnfK4MxhUPxC8BtiRFtPHmz7nJMdgPhFqx4bd%2Fn4s72SPH%2BbA6LEBZOpqtp2ET%2FhNUNcGJfGJa6c5jaAZVw%2F3mZ%2BfnbYyhRbIkHrIM8yU8bCsEkzwqdUY%2FbYGn37DZxwwWMGop0hVT2NKPBtmpTfQ6&X-Amz-Signature=10cb5520ff223458c7ad15d87ef9d195830b35f760149e1d01cb68e4986e4a7a&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

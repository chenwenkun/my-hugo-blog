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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB46625LSN4ZP%2F20260829%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260829T200756Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEKP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIACg8l0cGxRIRBVGmaPphjJsdQyCDTi99AgcREncff0HAiBBXkUKEcTzJhXlTEnKx5vFar5nFLiC23naLTRfH2IsASr%2FAwhsEAAaDDYzNzQyMzE4MzgwNSIMqVqaSKD4uARJeoMEKtwD7UkuktvVzIatXW8ZvBvBFCAEw9PLYzmyPqXJnYEKsE6yKm9fw1q3qhDC8G0q7TRiWsEjQGaQwiQsNDa3Ju0sCbUzOb3H81c5qSDgeP4jXWnteqUBK%2Fr2edy12ozu0UGC5vBc9tdKRL6a%2F1Yth2bAZFIevetkZpb5KG0TgC%2BAsgNETKBGjy74nrzFZ%2BGOTYZcAu4wULeoHlDuOcl6dctR%2FntLXBh3Ft%2FNSIJYoduQ4yxpkrD6QCwR%2BOHMfmjZdsdx3MBqBPxO242Hgl7AO2%2F2l%2Bn48ZtDleZVMHXF3YYywVZ1u%2BQq13aUt24FNL6oD0G9sbiqpWJSAFJlsjXY5zYut14NnZPKe3Tkr7y0xvX2%2FZJ3eHimHRoNZL90giApwCqxS5VffT2oeUsUHkogttKnVr%2FO6sYxNGyYJG4ZIpgJnWbk8YUgCvjShx9RNpIWuEpjN4hY5Et%2FvCYYZXW%2BtSgls7VJrfb7LwYlWZebXomfCUd9NQiSRE5jOCKQHZut8%2FaCgB6QXWPUTqFz0IjtzmpI3I5KpljlAGhmvMpAICPKUhrnqYVCnQN3y207jj337nCYdCv0aNlUBOUU9NwLM%2BAM9APuC%2BKfWLLNZkfkR%2Bpk2h7tBF2ZUWxP6lqm3JIwh8rM1AY6pgGjqY48xHFugApAgy3cBP9NOz2H47SO3W3laimuYvEI8yOpbBHrrfR5jWCwyxe5cJKPdoZlZPcGDCyk4dlBWw5FEoEFhpTGdLyJ8QOp1Fdrl%2FywqPzofahdfcp24Jd%2BPKZKjOOlnJk6eVxowBwUrKs9qPTqZkUF%2FvhOMOltrMj%2BNMqkZQeHDP5sgh4pDcY4xJxhqg4KKv4gUGkc2fo29fevv16IN8ri&X-Amz-Signature=3a5c55f381d07ded9bcab9d665287f401467a8b2c057b6b23344cfdad017e6ca&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB46625LSN4ZP%2F20260829%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260829T200756Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEKP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIACg8l0cGxRIRBVGmaPphjJsdQyCDTi99AgcREncff0HAiBBXkUKEcTzJhXlTEnKx5vFar5nFLiC23naLTRfH2IsASr%2FAwhsEAAaDDYzNzQyMzE4MzgwNSIMqVqaSKD4uARJeoMEKtwD7UkuktvVzIatXW8ZvBvBFCAEw9PLYzmyPqXJnYEKsE6yKm9fw1q3qhDC8G0q7TRiWsEjQGaQwiQsNDa3Ju0sCbUzOb3H81c5qSDgeP4jXWnteqUBK%2Fr2edy12ozu0UGC5vBc9tdKRL6a%2F1Yth2bAZFIevetkZpb5KG0TgC%2BAsgNETKBGjy74nrzFZ%2BGOTYZcAu4wULeoHlDuOcl6dctR%2FntLXBh3Ft%2FNSIJYoduQ4yxpkrD6QCwR%2BOHMfmjZdsdx3MBqBPxO242Hgl7AO2%2F2l%2Bn48ZtDleZVMHXF3YYywVZ1u%2BQq13aUt24FNL6oD0G9sbiqpWJSAFJlsjXY5zYut14NnZPKe3Tkr7y0xvX2%2FZJ3eHimHRoNZL90giApwCqxS5VffT2oeUsUHkogttKnVr%2FO6sYxNGyYJG4ZIpgJnWbk8YUgCvjShx9RNpIWuEpjN4hY5Et%2FvCYYZXW%2BtSgls7VJrfb7LwYlWZebXomfCUd9NQiSRE5jOCKQHZut8%2FaCgB6QXWPUTqFz0IjtzmpI3I5KpljlAGhmvMpAICPKUhrnqYVCnQN3y207jj337nCYdCv0aNlUBOUU9NwLM%2BAM9APuC%2BKfWLLNZkfkR%2Bpk2h7tBF2ZUWxP6lqm3JIwh8rM1AY6pgGjqY48xHFugApAgy3cBP9NOz2H47SO3W3laimuYvEI8yOpbBHrrfR5jWCwyxe5cJKPdoZlZPcGDCyk4dlBWw5FEoEFhpTGdLyJ8QOp1Fdrl%2FywqPzofahdfcp24Jd%2BPKZKjOOlnJk6eVxowBwUrKs9qPTqZkUF%2FvhOMOltrMj%2BNMqkZQeHDP5sgh4pDcY4xJxhqg4KKv4gUGkc2fo29fevv16IN8ri&X-Amz-Signature=4058870523045ae257b07a621d530da23ee2fb6f381b58e18fec6cb63cb4dfda&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

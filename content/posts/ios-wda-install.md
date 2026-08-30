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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466SDKRJUN4%2F20260830%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260830T201525Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjELz%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQDF%2FpgYx64dD713t%2FC%2BaAkdQP2nNHHelf7SihTnt%2FGRxgIgBpLft5QmgLzSbiRfODTs900FhtUJM8XVT%2FUowRPwiGYqiAQIhf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDB%2Bei7EyrGcDheI3USrcA%2BalGwZSJeU2h8kzyQlyCSjhu8mzDEifUsSDpyc6Dt9uqC%2F2CgK2jrx7NsYeiLtejeN9iU1VoK3EqylsILfRSQwc4hOeEklmdwQMIidgYDR6nGyUFCWdESKIlWnuKYXZRKpkc0%2BHn1n5rViVDP7Sk2sBuPd6TkiKV7H%2BFeTt4k%2BMdD8%2FTx4tZBDX8VkaUTuP8ou3b5vgrCAfuXfnx9z3xCXzLLGV3Fl%2FDLxMXWl%2FX05J5QUB7t54VXF8hyK%2BytijyLisvLG16AfLGr1D4OMSZKRFErm%2B65uB%2BFn0e0UxrDqQq41kMWf8QpJKLWiBH%2F1Yv1qBOB03megWdAWdeNHkQILh%2BduKgYnUf0VZoprWTTqrVGYKyb46HTs60Wb1lD%2FUnuvpy80hjnqzJsmaR6OdjqAnvx8qWCLOb%2F0StPBagpsY2OhELSUy8Btn1YVY73CYiOmH8sUN0BfC9G03EfruJZLosZ%2BqYO2byMOsDyQ3vizoCrNe4gveinJ5rrZ%2FoFGzbeo%2Fmpqp6Hlw8%2BIovbB2K6vknz5vRUo%2Bky8sZ%2F11cE8E09ldr05gHJH49iPg4pjf0UDSSKzci68n3R%2BspSaNstaZqe8YNTe%2FR5fFD4V9IqMc8zSHwhqq1wbqXQH3MLmT0tQGOqUBjMqxxOF9kqtGXUsheCtGiZH99Ddaep2vILnaPjaWleEMi0%2Fqq13bb6yrov4X2%2Fqvw%2BIZ%2BfVbFbpW9DU8QKnDqfklnAjIQa4zZTb411OZBg7E2qF3hKb8QMxtHOdJpNmRRuhs3Zq92MVsHqdVZfHBb%2F2S08uSEXMdWW%2BlmWKTzrlJIWBFys5enw69L6RtCW99lH6EEHVnxEV5N3Z%2FsgbmXp%2BQWBBv&X-Amz-Signature=28341d2eb961c5f4e732a44bb5bb961644fba1ca10498738238e9384076f0a1d&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466SDKRJUN4%2F20260830%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260830T201525Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjELz%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQDF%2FpgYx64dD713t%2FC%2BaAkdQP2nNHHelf7SihTnt%2FGRxgIgBpLft5QmgLzSbiRfODTs900FhtUJM8XVT%2FUowRPwiGYqiAQIhf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDB%2Bei7EyrGcDheI3USrcA%2BalGwZSJeU2h8kzyQlyCSjhu8mzDEifUsSDpyc6Dt9uqC%2F2CgK2jrx7NsYeiLtejeN9iU1VoK3EqylsILfRSQwc4hOeEklmdwQMIidgYDR6nGyUFCWdESKIlWnuKYXZRKpkc0%2BHn1n5rViVDP7Sk2sBuPd6TkiKV7H%2BFeTt4k%2BMdD8%2FTx4tZBDX8VkaUTuP8ou3b5vgrCAfuXfnx9z3xCXzLLGV3Fl%2FDLxMXWl%2FX05J5QUB7t54VXF8hyK%2BytijyLisvLG16AfLGr1D4OMSZKRFErm%2B65uB%2BFn0e0UxrDqQq41kMWf8QpJKLWiBH%2F1Yv1qBOB03megWdAWdeNHkQILh%2BduKgYnUf0VZoprWTTqrVGYKyb46HTs60Wb1lD%2FUnuvpy80hjnqzJsmaR6OdjqAnvx8qWCLOb%2F0StPBagpsY2OhELSUy8Btn1YVY73CYiOmH8sUN0BfC9G03EfruJZLosZ%2BqYO2byMOsDyQ3vizoCrNe4gveinJ5rrZ%2FoFGzbeo%2Fmpqp6Hlw8%2BIovbB2K6vknz5vRUo%2Bky8sZ%2F11cE8E09ldr05gHJH49iPg4pjf0UDSSKzci68n3R%2BspSaNstaZqe8YNTe%2FR5fFD4V9IqMc8zSHwhqq1wbqXQH3MLmT0tQGOqUBjMqxxOF9kqtGXUsheCtGiZH99Ddaep2vILnaPjaWleEMi0%2Fqq13bb6yrov4X2%2Fqvw%2BIZ%2BfVbFbpW9DU8QKnDqfklnAjIQa4zZTb411OZBg7E2qF3hKb8QMxtHOdJpNmRRuhs3Zq92MVsHqdVZfHBb%2F2S08uSEXMdWW%2BlmWKTzrlJIWBFys5enw69L6RtCW99lH6EEHVnxEV5N3Z%2FsgbmXp%2BQWBBv&X-Amz-Signature=aacac7373a1178bb7d05ee46d9d159e54348086f005af4546d51fd70212f57f0&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

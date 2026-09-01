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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663HSJAVHF%2F20260901%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260901T023238Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjENr%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQCwE6zqy62zOOJMYAWUmqGLdADmq6hqAr3zTugsrEKLFQIgcd2NEHgPZ4a%2FInpdP9GJrFjKgu2xOw0mGQ6I5EGRN7gqiAQIo%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDOUPQoMvAlj7Knco%2BCrcAzmdNeqsog68KiuNb3u5AmP0x2s%2BOs7XEXXJjhzIox7nj7Dykv8BtlvVTZzb2LNDhKaVIi%2Fp60Lf1hGU6iJPFnx5UVfZNZEe1ARN0dtI5ssBNtJCTuueO%2F%2BfKSbUE3w85PEoFcPiSp80O0dWIbb84peC43sRkRC7PEqkb%2F%2Ff%2FCkcE2ItpfJotm%2BfysbLPVy1vYPZzm8k1chVhiFMfGuCJ981fMkbtwZ6pEVX%2FpwV40Xw%2BCxts5x%2FzNonagrg%2F6fJWkV8zQTHoqXJXciwSDcP%2FpKE1l1n0qXUakke2Fo3fHfUaais2HyE3kdG3CasFOWfNtSiD3gi7oFF2Ztuhs35wiSLarOSNvzNoPx%2BYhgFxSxIgXE2FQ7qa21aUStVpBt1JooqeA1ENiZ71z2NRr5w8rvI%2Bu8k8DgWIcI4xVrreTIDySzB1cxnomTQ8TLbbE2zDI9ccnJIe%2F1%2Bhwa%2FQrvSzN9HBh7WqM72e281OQKOy3rH%2BEegPu52Mir%2FQSI1PJr1Jgw%2FxQ7gz86HUKxmUKAArtHpAQ%2B%2Fkh5%2FOOxxOEKeD78v63APAGVVr1rZpEEALK6NCjWxa5jF5cQDAGAiJN14nmPvSsdrO9ugD2WFmTuru478cW4fGeylilZAwd9eMMLS2NQGOqUBb1okDUH8xq93xWyyoKkTEfmLRHsf5%2BiNoE8MByLN46sIhDNqf6fJZRbDSxln61u3FlCVFb0ufaOQfSTlhreQc2ZjiHHETjo%2FxO5t%2B6stn8CUzbavOu4OkNU6spza82HhUiOI6cRdqNZB22mvAXWN57ON5ux%2BS0M4OB7knHJ9Aqlmi2YwQIomkSpVbluyEZ%2FhFDQ7JG7ASrLc6F%2B1hPpwsZDHLu0w&X-Amz-Signature=a2398b42d399e25e6771673a72292cb90d8dd23fa22044bb7e9f8253c65593df&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663HSJAVHF%2F20260901%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260901T023238Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjENr%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQCwE6zqy62zOOJMYAWUmqGLdADmq6hqAr3zTugsrEKLFQIgcd2NEHgPZ4a%2FInpdP9GJrFjKgu2xOw0mGQ6I5EGRN7gqiAQIo%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDOUPQoMvAlj7Knco%2BCrcAzmdNeqsog68KiuNb3u5AmP0x2s%2BOs7XEXXJjhzIox7nj7Dykv8BtlvVTZzb2LNDhKaVIi%2Fp60Lf1hGU6iJPFnx5UVfZNZEe1ARN0dtI5ssBNtJCTuueO%2F%2BfKSbUE3w85PEoFcPiSp80O0dWIbb84peC43sRkRC7PEqkb%2F%2Ff%2FCkcE2ItpfJotm%2BfysbLPVy1vYPZzm8k1chVhiFMfGuCJ981fMkbtwZ6pEVX%2FpwV40Xw%2BCxts5x%2FzNonagrg%2F6fJWkV8zQTHoqXJXciwSDcP%2FpKE1l1n0qXUakke2Fo3fHfUaais2HyE3kdG3CasFOWfNtSiD3gi7oFF2Ztuhs35wiSLarOSNvzNoPx%2BYhgFxSxIgXE2FQ7qa21aUStVpBt1JooqeA1ENiZ71z2NRr5w8rvI%2Bu8k8DgWIcI4xVrreTIDySzB1cxnomTQ8TLbbE2zDI9ccnJIe%2F1%2Bhwa%2FQrvSzN9HBh7WqM72e281OQKOy3rH%2BEegPu52Mir%2FQSI1PJr1Jgw%2FxQ7gz86HUKxmUKAArtHpAQ%2B%2Fkh5%2FOOxxOEKeD78v63APAGVVr1rZpEEALK6NCjWxa5jF5cQDAGAiJN14nmPvSsdrO9ugD2WFmTuru478cW4fGeylilZAwd9eMMLS2NQGOqUBb1okDUH8xq93xWyyoKkTEfmLRHsf5%2BiNoE8MByLN46sIhDNqf6fJZRbDSxln61u3FlCVFb0ufaOQfSTlhreQc2ZjiHHETjo%2FxO5t%2B6stn8CUzbavOu4OkNU6spza82HhUiOI6cRdqNZB22mvAXWN57ON5ux%2BS0M4OB7knHJ9Aqlmi2YwQIomkSpVbluyEZ%2FhFDQ7JG7ASrLc6F%2B1hPpwsZDHLu0w&X-Amz-Signature=9428ad305f187535ae6d371468b413df5f735428a4c8034dbddfea8f58c034b8&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

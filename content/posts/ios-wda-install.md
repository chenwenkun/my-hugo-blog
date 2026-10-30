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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466TVZMFDX7%2F20261030%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261030T214624Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEHYaCXVzLXdlc3QtMiJHMEUCIEEEyfsOlOCIEZFv%2FS7bVT9JD7uZB0mxgCEKkeG%2FRcjUAiEAtv5kOhZFykJCqr8hoZIjY71GQeysCqOXU5Gv2crKdXkq%2FwMIPxAAGgw2Mzc0MjMxODM4MDUiDJSLD0fQU0aJpRjoICrcA8Y1rYPcHnvRETeIA3j7s6Ui2xtksgZn8I3hUPd4zQi7%2BlJgb5GZavC9%2FOm34EhBXm9FhNdYjaEAqPkjk%2F0TzRgTqKokfU2gzXB%2F3TssA3WFKsJBBfCJSYWcZbSnpNSot1ADeB%2FL3biHP1rAdiQfWRsRWBHkEzCktZXp5nmm1Z4AS8critHyDS2vOUEWP6pj1Nonf3yf9nYnXGD0o2oDrwyOgUtZXoUWudLE0AFbgPi7eC%2F7hAedPM5tEfSQEk%2FV%2Bm7FevUNpMAS2ypjdaOT9pxw2Fe3GPSd3hzw3D2%2BH2w5Aeg8XsNLgpdcusB%2FYyFu1%2F9CY0nvie6KscEWp2KLGlAr54kCfA2BMX2zFARzz%2B13%2Fz7KoLA3jsdhw80X7mEFkM1HaHHQGLkpwmGRQy4YTLKkWvmcyY2IMU%2BXKgUTFoiZkumxLP2BCGVtOJv6%2Ff0rpME%2F3ktoZ1MidAjELcQyGOBAzFOBGoSX56uWE8Z1BeLJQlFYulaNczD%2Be2t4UR09iU9Vt95e8rJFPohWfIgYcJwBYaTBl6N%2FikkdFmSDVv%2FRMqUMe5mvUG%2FZjZtCx39dcTtgjK6yWh8JNuwxUOcv08w1XEmCCvWbCviWV7obIbgliwf58%2FYFDUzsahfmMMmalNcGOqUB%2Fl50tSM7ND4Cx8NB10UyNMNfxICFJ%2FZG1cqPqw9j8XNdy5hM%2B0BIYiOTXQYVs1K5A%2FQmCCLBro0psAWIwdnmiNRXOQoLQ%2FEMkMV4YchZmb3BFGXs5CimpQoMlfXn0ah2dUxAkSe8eMOc625WVfseN3894ZYr78%2F0yF6%2BDk72jjmzbKATMKQvtid5psYO%2Fa5oFmPYF%2Buhotj7K%2BzjY9iS%2BHIOTaVA&X-Amz-Signature=bf180236a0a9268a4421ee3bef6b91a2cb455c6a20055005d6b553f4c4cf4dbf&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466TVZMFDX7%2F20261030%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261030T214624Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEHYaCXVzLXdlc3QtMiJHMEUCIEEEyfsOlOCIEZFv%2FS7bVT9JD7uZB0mxgCEKkeG%2FRcjUAiEAtv5kOhZFykJCqr8hoZIjY71GQeysCqOXU5Gv2crKdXkq%2FwMIPxAAGgw2Mzc0MjMxODM4MDUiDJSLD0fQU0aJpRjoICrcA8Y1rYPcHnvRETeIA3j7s6Ui2xtksgZn8I3hUPd4zQi7%2BlJgb5GZavC9%2FOm34EhBXm9FhNdYjaEAqPkjk%2F0TzRgTqKokfU2gzXB%2F3TssA3WFKsJBBfCJSYWcZbSnpNSot1ADeB%2FL3biHP1rAdiQfWRsRWBHkEzCktZXp5nmm1Z4AS8critHyDS2vOUEWP6pj1Nonf3yf9nYnXGD0o2oDrwyOgUtZXoUWudLE0AFbgPi7eC%2F7hAedPM5tEfSQEk%2FV%2Bm7FevUNpMAS2ypjdaOT9pxw2Fe3GPSd3hzw3D2%2BH2w5Aeg8XsNLgpdcusB%2FYyFu1%2F9CY0nvie6KscEWp2KLGlAr54kCfA2BMX2zFARzz%2B13%2Fz7KoLA3jsdhw80X7mEFkM1HaHHQGLkpwmGRQy4YTLKkWvmcyY2IMU%2BXKgUTFoiZkumxLP2BCGVtOJv6%2Ff0rpME%2F3ktoZ1MidAjELcQyGOBAzFOBGoSX56uWE8Z1BeLJQlFYulaNczD%2Be2t4UR09iU9Vt95e8rJFPohWfIgYcJwBYaTBl6N%2FikkdFmSDVv%2FRMqUMe5mvUG%2FZjZtCx39dcTtgjK6yWh8JNuwxUOcv08w1XEmCCvWbCviWV7obIbgliwf58%2FYFDUzsahfmMMmalNcGOqUB%2Fl50tSM7ND4Cx8NB10UyNMNfxICFJ%2FZG1cqPqw9j8XNdy5hM%2B0BIYiOTXQYVs1K5A%2FQmCCLBro0psAWIwdnmiNRXOQoLQ%2FEMkMV4YchZmb3BFGXs5CimpQoMlfXn0ah2dUxAkSe8eMOc625WVfseN3894ZYr78%2F0yF6%2BDk72jjmzbKATMKQvtid5psYO%2Fa5oFmPYF%2Buhotj7K%2BzjY9iS%2BHIOTaVA&X-Amz-Signature=1ab49971d5b511e726641ac797250064d9793eb14008ff4b6b3aaf1bd333cdf6&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

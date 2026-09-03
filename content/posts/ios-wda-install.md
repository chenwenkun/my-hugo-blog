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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4662S3XZEI7%2F20260903%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260903T152611Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEBgaCXVzLXdlc3QtMiJHMEUCIBt2v5xv%2BhK603%2BCRymG1aHv39damxrNs5N7EpxgB%2Bq1AiEAyO3RAt911v59llbTxPLZiKzkUsK6VJ8CrqKpbrQTQusqiAQI4P%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDPbvmRLkZUUsHOa%2FVircAzPezALe5PscdoC9N4hRcxgWQs8PAyLKnjjK2oW0m0KFllGpJyoADOLKYmFRRJIFJ7qWb3bVOjFhWGT1DuPlOL2VDOu%2FhAuApMkXcmasO3Eh1AwitI14nkIUH1S0hW6azYkwtwk66By69BOWLqR27xX1HkDofX0CU6%2F%2BRhHu3iBpM3be4c06zTOp1ecvOlspljeBCRSivdRVj8b%2Bicj5NxELL1oKhNhxOYLVqgUmjk6l5EcqQFKlrSMa4TOB2nWGs4zJQMgPCI%2BNZtwn001A76v2vfLgDCD54crK9vtlsj5yHiEU60y%2B7PqgsAsvuSn27fj3GagZ1Hq3e46GTiq7lgJ6NOHj2aCrI69OWynX4w4kCu%2FDhMKgc5oKGXE%2BRphDHoL9vRO4djRqAcx8svJujQWCR3RnbGEnRkF876WCfKLaz%2BjlSxJ5WnzQk1yG2faaIOR2%2Bq2VMG2MDOlFECudTtUX531jxdPAKReoAA5h8b5BItx8nsxxGzdYEVPRclVBx4EksrApH413rM06aQUEeGii3lZlknaWTp0JlB3qox75tBTg9lhQDqcG3V6HG1zLop4wo9EJsVuDJdCslXmoXeSxSei7%2BbRtQRXZL7DgUaKljiLOBoBBnYV5gx7DMOWf5tQGOqUB7scziv185G58vDRi1knoZp9AWi66J4MoPeYMvHVTQ1JDmfn4M5hgr51A2Yybk%2FfcVtnLech0cndrnnz2%2FzUKbtp%2BK07fsiKXJqQacO7X0w9TYu0HX0vQm9eVNWvLjMka6SpyQXJVCPeJpBwJh2%2F70h9XLplyJFXKpPzwNLDqP6%2BYLd6qbMbs76V8zMIc8iESruUicnH5Vg5mAfvRCLhH2Q5OuyqR&X-Amz-Signature=4d8166d84073f4384560d844130c6a9fe4a96139ae8a79198dfcba2c7a73e5a3&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4662S3XZEI7%2F20260903%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260903T152611Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEBgaCXVzLXdlc3QtMiJHMEUCIBt2v5xv%2BhK603%2BCRymG1aHv39damxrNs5N7EpxgB%2Bq1AiEAyO3RAt911v59llbTxPLZiKzkUsK6VJ8CrqKpbrQTQusqiAQI4P%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDPbvmRLkZUUsHOa%2FVircAzPezALe5PscdoC9N4hRcxgWQs8PAyLKnjjK2oW0m0KFllGpJyoADOLKYmFRRJIFJ7qWb3bVOjFhWGT1DuPlOL2VDOu%2FhAuApMkXcmasO3Eh1AwitI14nkIUH1S0hW6azYkwtwk66By69BOWLqR27xX1HkDofX0CU6%2F%2BRhHu3iBpM3be4c06zTOp1ecvOlspljeBCRSivdRVj8b%2Bicj5NxELL1oKhNhxOYLVqgUmjk6l5EcqQFKlrSMa4TOB2nWGs4zJQMgPCI%2BNZtwn001A76v2vfLgDCD54crK9vtlsj5yHiEU60y%2B7PqgsAsvuSn27fj3GagZ1Hq3e46GTiq7lgJ6NOHj2aCrI69OWynX4w4kCu%2FDhMKgc5oKGXE%2BRphDHoL9vRO4djRqAcx8svJujQWCR3RnbGEnRkF876WCfKLaz%2BjlSxJ5WnzQk1yG2faaIOR2%2Bq2VMG2MDOlFECudTtUX531jxdPAKReoAA5h8b5BItx8nsxxGzdYEVPRclVBx4EksrApH413rM06aQUEeGii3lZlknaWTp0JlB3qox75tBTg9lhQDqcG3V6HG1zLop4wo9EJsVuDJdCslXmoXeSxSei7%2BbRtQRXZL7DgUaKljiLOBoBBnYV5gx7DMOWf5tQGOqUB7scziv185G58vDRi1knoZp9AWi66J4MoPeYMvHVTQ1JDmfn4M5hgr51A2Yybk%2FfcVtnLech0cndrnnz2%2FzUKbtp%2BK07fsiKXJqQacO7X0w9TYu0HX0vQm9eVNWvLjMka6SpyQXJVCPeJpBwJh2%2F70h9XLplyJFXKpPzwNLDqP6%2BYLd6qbMbs76V8zMIc8iESruUicnH5Vg5mAfvRCLhH2Q5OuyqR&X-Amz-Signature=a62087c3635c1805a4c146641b01d404bb7f0f0051b0b33485192183168e0999&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

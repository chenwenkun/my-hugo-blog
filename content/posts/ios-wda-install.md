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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466WY43S4VV%2F20260929%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260929T031208Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEHoaCXVzLXdlc3QtMiJHMEUCIGGYYFdTzkoW3vMR6uneoV%2FX2%2BGfCXvNd20ZDpeLOpV5AiEAqy3BKaTEKYe2Jiw2aSIUdSel4diFwP%2B8iivddB5U%2Fj4q%2FwMIQxAAGgw2Mzc0MjMxODM4MDUiDH8L4uIyug5xQPuDmSrcA2V7tsAntJql2cK3b1Qj5pYcFUUpsmvyBJkbM%2FqKy6ODP04031GP9u2cYiTfkgxaBMOxUDzr2Qv%2BPPmDhEUR6q5PFYUrNyjDEr3lh4BTmq1FS1UDVdENUVpvDzTAEoZnKm6CR0GomqPdOnk8GIJ%2Bd%2F7KfHHrrDC5B7zvJ81R7JCx63zXHZo%2FZ5pITP%2BSXOCiB9Ks0Qrv8M%2BgLrraDpz1ft%2BIjveOZiWsmm8ynJp8mgHPq9T6ktz%2BUD4X0aR088vRI%2F4JdDQ%2FdE%2FCsmrp3hmiXCEAJOVpGs8vrvY2XHH%2BKURDn%2BL5uHA04QeVVN8BlPfwM9RSYTLXQDZicyjXAr7ADx%2B5Z5LcDdFsA7vDkB5uEMExrleQ48RRelRiDUwT9C1f%2FKOUpIlD%2Bm8NCBo3WH6IXm3THY1SHKE1mxTt5%2BIrgTNzt6rSHmTM25tU7jqKDxUxwzM%2FVIzg8TKVyBLlCiU6Fo9kpKznKj3pRvrnjyuay%2BfYcZVeeaYAZUE4kjJWVCMWHjITbak85zs2shbtNcMu%2FLGasUI4f89M6l%2FxkAJw6myNPxcqsehv19HaDDv%2BbshCQxyd8Yz00SiSJIKlAzIzY1GWHAhQTcBW0ZrZ2XIQswo5VhWPs0aXI%2B79KHQSMKC97NUGOqUBsYmLqq%2FJ4eUpvBrtCPuQ99FWjuWg2pYLa8v3PxQXk8tuUuzqiXuhrA1Ukntmqailj3kvDVH8YcIHtQUCygKbhKlgT%2BhOE4cM7%2FdiN3DdJw3%2FPL7t2EtT0rhPBW5VJ%2Fyj2vL0Jrsu%2Bzl4zieTUOLOogen7pWjYY0s0V1PTXRGMQ4Ekr%2B7ZUjRznijM733AJd1mzx4OTXjDE99iUzYhIyhUu7xpYuS&X-Amz-Signature=377b0f770c654a10a41910a8b1853e93fe70c66dd47154640d802f4ddabfa35c&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466WY43S4VV%2F20260929%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260929T031208Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEHoaCXVzLXdlc3QtMiJHMEUCIGGYYFdTzkoW3vMR6uneoV%2FX2%2BGfCXvNd20ZDpeLOpV5AiEAqy3BKaTEKYe2Jiw2aSIUdSel4diFwP%2B8iivddB5U%2Fj4q%2FwMIQxAAGgw2Mzc0MjMxODM4MDUiDH8L4uIyug5xQPuDmSrcA2V7tsAntJql2cK3b1Qj5pYcFUUpsmvyBJkbM%2FqKy6ODP04031GP9u2cYiTfkgxaBMOxUDzr2Qv%2BPPmDhEUR6q5PFYUrNyjDEr3lh4BTmq1FS1UDVdENUVpvDzTAEoZnKm6CR0GomqPdOnk8GIJ%2Bd%2F7KfHHrrDC5B7zvJ81R7JCx63zXHZo%2FZ5pITP%2BSXOCiB9Ks0Qrv8M%2BgLrraDpz1ft%2BIjveOZiWsmm8ynJp8mgHPq9T6ktz%2BUD4X0aR088vRI%2F4JdDQ%2FdE%2FCsmrp3hmiXCEAJOVpGs8vrvY2XHH%2BKURDn%2BL5uHA04QeVVN8BlPfwM9RSYTLXQDZicyjXAr7ADx%2B5Z5LcDdFsA7vDkB5uEMExrleQ48RRelRiDUwT9C1f%2FKOUpIlD%2Bm8NCBo3WH6IXm3THY1SHKE1mxTt5%2BIrgTNzt6rSHmTM25tU7jqKDxUxwzM%2FVIzg8TKVyBLlCiU6Fo9kpKznKj3pRvrnjyuay%2BfYcZVeeaYAZUE4kjJWVCMWHjITbak85zs2shbtNcMu%2FLGasUI4f89M6l%2FxkAJw6myNPxcqsehv19HaDDv%2BbshCQxyd8Yz00SiSJIKlAzIzY1GWHAhQTcBW0ZrZ2XIQswo5VhWPs0aXI%2B79KHQSMKC97NUGOqUBsYmLqq%2FJ4eUpvBrtCPuQ99FWjuWg2pYLa8v3PxQXk8tuUuzqiXuhrA1Ukntmqailj3kvDVH8YcIHtQUCygKbhKlgT%2BhOE4cM7%2FdiN3DdJw3%2FPL7t2EtT0rhPBW5VJ%2Fyj2vL0Jrsu%2Bzl4zieTUOLOogen7pWjYY0s0V1PTXRGMQ4Ekr%2B7ZUjRznijM733AJd1mzx4OTXjDE99iUzYhIyhUu7xpYuS&X-Amz-Signature=858ab87e97a0232c5b421bbc1610ca3bfe9bfdf45b7a22b8c349e0db4563bae4&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

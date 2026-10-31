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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466REMY3Q27%2F20261031%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261031T162903Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEIn%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQC%2Fj69g4Vleyed3FT3WO3f9KDUrN83hcoZDVfUyTohIgwIhALKrj9m3bWKwr1%2F4l4oFbQR5bAbCF%2BisbpI0MiMfZJqRKv8DCFEQABoMNjM3NDIzMTgzODA1IgxwZMQ%2F3i%2BxsEUy%2Bp8q3AOlCL70NUKAwsENwZmxu9TYw8K3QY4lsuPz0P%2BDLIl7og0oQApuNgruiYbgc6TnMmtTRdn6TN9YrdQKxVTjj357UhF7p5C5MPMkDpJEWNG2Hm3kObPiFFcZ47whbDR3%2BT2tFpGs77SL4FqrAWJG%2FWFgBGV34o1l62PaZsBzd70HtCl0VPsUR3ZXXvlfk%2FX8xfcd%2BqAzD68vRNXhsz7tOty5laoiu7%2FcQO95muAIdhx8ry%2B6%2BfMQgAfzb6KGrl5yMtGWWQFV83BRhentwPofFtBgYs%2FA6NfjwUTDkTScv39a%2FVYdzNTm2lyuxIf5VWdiLvXDDKiCK4Cbm%2Bx1UjBYxX7Y1rswFbRdjYgwwKrnDbCYpx%2B6tCDkbjpEhbmTbcOy8NGFJ8xbEQWO1vLztBsPK50u%2BWvqxo2xrBi06Rl%2BrvUHIcdw46muyQg7hvhsl72NsRH%2FB3En8lYk4WcX6dENms7zidzo2X691H%2BjqTApEMySf0XWnvl4%2BnjANKk%2FMQStmSQDRu66AcWSTCNaq%2BldnvEAD0Ec4t6A9kCu1CE3iHytmJgzCYXA2B%2FgYXUPesRLZkqHKx4PpfCzaxWByGCtOEiUzsgDzQxlPQx%2Bldy3hES33nXBnC6sWojH8Xr8XDDvqpjXBjqkAX7TBM1S56zz5xAMUicUAeqkJFN8qsdNKoYHu%2FX2%2B%2BNzU0yAmWFKMJns9lXNg0Ux7zJsHKuBbVGE994EtrUoS%2FrmYlBE7NwXBut9iI2CTrxPq%2FCjlqz4WjYB%2FPRfknO4LjsqrKbbZiFYifik8f%2FtLqkeU7Ic9OwCwhsKtYIiqlwi%2BCZ0SRRM1BbRX6%2Fyc6U%2F5edlje%2Bm3p3DdEmKIZxyNPJulGXi&X-Amz-Signature=b3bb8174f42f4df7dae23c2134f5db443f786bfcd77611e516ebe82ff08d65cd&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466REMY3Q27%2F20261031%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261031T162903Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEIn%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQC%2Fj69g4Vleyed3FT3WO3f9KDUrN83hcoZDVfUyTohIgwIhALKrj9m3bWKwr1%2F4l4oFbQR5bAbCF%2BisbpI0MiMfZJqRKv8DCFEQABoMNjM3NDIzMTgzODA1IgxwZMQ%2F3i%2BxsEUy%2Bp8q3AOlCL70NUKAwsENwZmxu9TYw8K3QY4lsuPz0P%2BDLIl7og0oQApuNgruiYbgc6TnMmtTRdn6TN9YrdQKxVTjj357UhF7p5C5MPMkDpJEWNG2Hm3kObPiFFcZ47whbDR3%2BT2tFpGs77SL4FqrAWJG%2FWFgBGV34o1l62PaZsBzd70HtCl0VPsUR3ZXXvlfk%2FX8xfcd%2BqAzD68vRNXhsz7tOty5laoiu7%2FcQO95muAIdhx8ry%2B6%2BfMQgAfzb6KGrl5yMtGWWQFV83BRhentwPofFtBgYs%2FA6NfjwUTDkTScv39a%2FVYdzNTm2lyuxIf5VWdiLvXDDKiCK4Cbm%2Bx1UjBYxX7Y1rswFbRdjYgwwKrnDbCYpx%2B6tCDkbjpEhbmTbcOy8NGFJ8xbEQWO1vLztBsPK50u%2BWvqxo2xrBi06Rl%2BrvUHIcdw46muyQg7hvhsl72NsRH%2FB3En8lYk4WcX6dENms7zidzo2X691H%2BjqTApEMySf0XWnvl4%2BnjANKk%2FMQStmSQDRu66AcWSTCNaq%2BldnvEAD0Ec4t6A9kCu1CE3iHytmJgzCYXA2B%2FgYXUPesRLZkqHKx4PpfCzaxWByGCtOEiUzsgDzQxlPQx%2Bldy3hES33nXBnC6sWojH8Xr8XDDvqpjXBjqkAX7TBM1S56zz5xAMUicUAeqkJFN8qsdNKoYHu%2FX2%2B%2BNzU0yAmWFKMJns9lXNg0Ux7zJsHKuBbVGE994EtrUoS%2FrmYlBE7NwXBut9iI2CTrxPq%2FCjlqz4WjYB%2FPRfknO4LjsqrKbbZiFYifik8f%2FtLqkeU7Ic9OwCwhsKtYIiqlwi%2BCZ0SRRM1BbRX6%2Fyc6U%2F5edlje%2Bm3p3DdEmKIZxyNPJulGXi&X-Amz-Signature=f9774a13fb67516953bab5cd442b8c53cd18e12e0fc65f20d00518f7f6458893&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

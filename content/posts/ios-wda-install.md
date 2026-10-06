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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466RXXEEUY2%2F20261006%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261006T034546Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjECIaCXVzLXdlc3QtMiJIMEYCIQDDEBbXAEthfdVo1zfrehZqk2JOAefrRs7%2BaZTMHm9dygIhAJos1td0GWK1lrjFo9sp90P%2FwE3o9CrV1wx6cX5llxH6KogECOv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1Igxbnk6v466OzPIPVMsq3APzsPY%2FuDy0mMFJG7f7IZ7o0i9FqajeNSmpORyeMaQnzAWj%2BccEFUuHf6wg7psyVJ7TE85kYvuZHq1TMUVtofggHSimQxRDtOhJL0nVQwSFiqazBiPMxp7C53L4z0rF2ngkyKII%2Fl%2BopSiTlbQGJOH336qytlMNI4j5dlm%2FqSorto6yqBxur20KnSRGhCcsc0woRprjOr9UCeqxdU8i8AXvZpHpKiJQLNjHNzLfJDm5beskEC1aX5nHsjTXmqYbYf%2FD1s3F474kFtK4sratoiYlUb2apBJjJM148LA0zBOFHYqGtpVZh6ZAqiScVEFOVqb%2BhTB5IasmXBG8VSYoUR88FieriQBkdqcOSh4bpLSKXG8XltphCv5ZJqdyPLzWCy8sEC1pKA3V2KqhRpWx2GajJmXzvalDniij3lP%2FxLCK9mxS%2FCrvEaPDblQyqPNgojUSHbj%2Bb%2FUr%2F06dTYVPIleUFZyyryK1bIoA6wG0Q2DV1rNgoilRPpWynhk6fMQb5r6ZTFLXFlC%2BhIkzXnfWRkvzXMfzJuhX2BmQDHIxtUXSJ3Gqak4Ws0Nw%2BNmE74VcTA8gVQUdkQ5ngmqt29qrW6IF4blC6ZjzEgiG3qv59wBy6HJgxTdsR8twi20pPjDvs5HWBjqkAfPRXTgaFeEvVdytCe2VnR67Q9ndFkVGIIrCkzeHxXFHLC%2B3cPLnVG1K%2Bc3s3xlVmLNx3lin2QJHN%2Fqis3GMfKvotKP23iDnJzqq3AZovOTrgU6BPsGg3EigB%2BVBSPc9vYjvV2Kg6AveMOH0VTdVlfBCno2cnsKRz0u%2FThZjewHmVQ2hM6E7B5SNqaWrKYgr1yHlOHf1UXWUtYcEOi3n87LN18bG&X-Amz-Signature=2c6bfe8836e0ccfdb8d904387baa8c864d09d3539eb216c82a5b13a051f295ad&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466RXXEEUY2%2F20261006%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261006T034546Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjECIaCXVzLXdlc3QtMiJIMEYCIQDDEBbXAEthfdVo1zfrehZqk2JOAefrRs7%2BaZTMHm9dygIhAJos1td0GWK1lrjFo9sp90P%2FwE3o9CrV1wx6cX5llxH6KogECOv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1Igxbnk6v466OzPIPVMsq3APzsPY%2FuDy0mMFJG7f7IZ7o0i9FqajeNSmpORyeMaQnzAWj%2BccEFUuHf6wg7psyVJ7TE85kYvuZHq1TMUVtofggHSimQxRDtOhJL0nVQwSFiqazBiPMxp7C53L4z0rF2ngkyKII%2Fl%2BopSiTlbQGJOH336qytlMNI4j5dlm%2FqSorto6yqBxur20KnSRGhCcsc0woRprjOr9UCeqxdU8i8AXvZpHpKiJQLNjHNzLfJDm5beskEC1aX5nHsjTXmqYbYf%2FD1s3F474kFtK4sratoiYlUb2apBJjJM148LA0zBOFHYqGtpVZh6ZAqiScVEFOVqb%2BhTB5IasmXBG8VSYoUR88FieriQBkdqcOSh4bpLSKXG8XltphCv5ZJqdyPLzWCy8sEC1pKA3V2KqhRpWx2GajJmXzvalDniij3lP%2FxLCK9mxS%2FCrvEaPDblQyqPNgojUSHbj%2Bb%2FUr%2F06dTYVPIleUFZyyryK1bIoA6wG0Q2DV1rNgoilRPpWynhk6fMQb5r6ZTFLXFlC%2BhIkzXnfWRkvzXMfzJuhX2BmQDHIxtUXSJ3Gqak4Ws0Nw%2BNmE74VcTA8gVQUdkQ5ngmqt29qrW6IF4blC6ZjzEgiG3qv59wBy6HJgxTdsR8twi20pPjDvs5HWBjqkAfPRXTgaFeEvVdytCe2VnR67Q9ndFkVGIIrCkzeHxXFHLC%2B3cPLnVG1K%2Bc3s3xlVmLNx3lin2QJHN%2Fqis3GMfKvotKP23iDnJzqq3AZovOTrgU6BPsGg3EigB%2BVBSPc9vYjvV2Kg6AveMOH0VTdVlfBCno2cnsKRz0u%2FThZjewHmVQ2hM6E7B5SNqaWrKYgr1yHlOHf1UXWUtYcEOi3n87LN18bG&X-Amz-Signature=576f51e91cad5f27170bb8d87c73b900ab25e880666ec79def785c592f168c10&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

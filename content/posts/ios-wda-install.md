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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4666YM7F3BU%2F20261031%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261031T031048Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEHsaCXVzLXdlc3QtMiJHMEUCIQCqGFv3jjNcc%2BGZmyjBpV%2BxbX4rEB6Vum6DLq4owC9uKAIgHvq579Q9llezVcQT%2FI%2FAy%2F%2BreutdDdLLcOuKMXLxEZEq%2FwMIQxAAGgw2Mzc0MjMxODM4MDUiDBrEymeTWBR07ItgUSrcAwtqr%2BYADXCUJ8H6BCvIuTLG85vrBthiOjBVBLYeO%2BTFDqExyIBgL0tDNP54BJiHKYHtoHlzIlbPkh6N3VS6bOx7mb6sS9DMVfuxaOxZeDqGRkG%2FxHVAB4i9xADi8ehnyCsMi273DCIN%2B0h4DxuCWn3JNxkLmCikTIWyo00ANxWP%2BgCz1hpxiWZO%2Fr5QiI9XQduGOFyI4xeE5UMo1B4fnr9oBLcWchP4uynSIzjQsO%2B2%2BEBxwCdb2z0oIsy2t%2BzYhGXcdUxs1prpqOVtUoyRmFZpWB0QW3G9yxE%2BdkOJIK7jqPEWCR5uS7npQwhImx%2BrLemyXhaBxrnnEEX4ez%2B3gH%2BiphSB18miR2UVKYY3FSgd39YcSPOATY88FgCM3i%2FsTv%2BdcBfcIASp3sOQb%2BEiXQ6DbhHl8P%2BU2hG7or8givG3I1R1HQ0t%2F3N0Tj1msq9Rdli1vYVYXchQfR0IWbZ%2FSaNcEzJYH8wLXWhvv1Q16Ul1K7EDp1V9eDECAh0%2BRM0bMVWG9oNqzHUFR1ZmUE94BY%2FTrhLbZKZ4Xc%2FnU9TDEay933tsLDMtawVp1lJaxhLYUPBg9z7JWjNVFBWRGX1SLGXZ%2Bj0tMsGwbvhwo5xkXHNI3UZjyGmTmG06yvqSMM2uldcGOqUBCPseEJY9n0%2FFizqw7DmePX2QosxaFLDWeYn5J%2FppkVlxUrziBudHffoibJFrS7U%2Flj8CRYlZvsAN5lXerCReUgFKf6SeyCrUx0G33l5faarmeGuZ6WHmfVbPc542tsYMjNcQ5Vde%2FQODdWmQ97JCK41P1ue76XnI7MbFvOowDA5Woxx29%2BQSElYUcMXN9rH4ASoPo0pLazPIzBxMtrv3zvpWYosK&X-Amz-Signature=faeaa48c878409d994c922837f42285a9671ab4283344c161c4b408e11b05479&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4666YM7F3BU%2F20261031%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261031T031048Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEHsaCXVzLXdlc3QtMiJHMEUCIQCqGFv3jjNcc%2BGZmyjBpV%2BxbX4rEB6Vum6DLq4owC9uKAIgHvq579Q9llezVcQT%2FI%2FAy%2F%2BreutdDdLLcOuKMXLxEZEq%2FwMIQxAAGgw2Mzc0MjMxODM4MDUiDBrEymeTWBR07ItgUSrcAwtqr%2BYADXCUJ8H6BCvIuTLG85vrBthiOjBVBLYeO%2BTFDqExyIBgL0tDNP54BJiHKYHtoHlzIlbPkh6N3VS6bOx7mb6sS9DMVfuxaOxZeDqGRkG%2FxHVAB4i9xADi8ehnyCsMi273DCIN%2B0h4DxuCWn3JNxkLmCikTIWyo00ANxWP%2BgCz1hpxiWZO%2Fr5QiI9XQduGOFyI4xeE5UMo1B4fnr9oBLcWchP4uynSIzjQsO%2B2%2BEBxwCdb2z0oIsy2t%2BzYhGXcdUxs1prpqOVtUoyRmFZpWB0QW3G9yxE%2BdkOJIK7jqPEWCR5uS7npQwhImx%2BrLemyXhaBxrnnEEX4ez%2B3gH%2BiphSB18miR2UVKYY3FSgd39YcSPOATY88FgCM3i%2FsTv%2BdcBfcIASp3sOQb%2BEiXQ6DbhHl8P%2BU2hG7or8givG3I1R1HQ0t%2F3N0Tj1msq9Rdli1vYVYXchQfR0IWbZ%2FSaNcEzJYH8wLXWhvv1Q16Ul1K7EDp1V9eDECAh0%2BRM0bMVWG9oNqzHUFR1ZmUE94BY%2FTrhLbZKZ4Xc%2FnU9TDEay933tsLDMtawVp1lJaxhLYUPBg9z7JWjNVFBWRGX1SLGXZ%2Bj0tMsGwbvhwo5xkXHNI3UZjyGmTmG06yvqSMM2uldcGOqUBCPseEJY9n0%2FFizqw7DmePX2QosxaFLDWeYn5J%2FppkVlxUrziBudHffoibJFrS7U%2Flj8CRYlZvsAN5lXerCReUgFKf6SeyCrUx0G33l5faarmeGuZ6WHmfVbPc542tsYMjNcQ5Vde%2FQODdWmQ97JCK41P1ue76XnI7MbFvOowDA5Woxx29%2BQSElYUcMXN9rH4ASoPo0pLazPIzBxMtrv3zvpWYosK&X-Amz-Signature=f98412665cdcf991dddd38510d8d212984ad8723b892c7d6b38d1e96b31c5409&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

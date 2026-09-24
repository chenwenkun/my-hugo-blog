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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466WLOXI7P3%2F20260924%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260924T104256Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEAoaCXVzLXdlc3QtMiJHMEUCIQCaHdoFysTTNucE0C54oUo36dczBal5V94kx7m8FGrFCQIgd2q2%2FCXJhnLH55xl0jye4MHfXAcSX3fM3lS6B540AP4qiAQI0%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDIXzjeX3gS3X6rwAHCrcA%2B2dm%2BXcLlipb02X18zINpBQ%2FyT3ZEegKy880mKxQX4Pi1HiObxHCgNQs8Ea%2F%2FRm9VC08wgXCPSF%2F3HgyJsThRdWGFuD1rdGcSSEXsi%2BViuYKuFzuipXSNYvrUpqkCwweIPwsL8Pj%2Fa12paYP3r8K8hTEcOCO0oGnND4xDopLJrdb3AouPJt6tv1qq0YKjStT8ptYU%2FebZ2%2FtENbj4rtLE3%2BvI8VXRCvo%2B188mY8QPRYftnEkkufawoxpkey7Dwdx99XLh0ni5j6FCw3NP%2BXdoIUgXdNlSXhGzoa4CcXjyaVSNqcqbyZRwbCc0zN4uX%2FzykKb9E8R8SomiDTIFCV68kRDfQe39ACU1eQZxzYCcR8J19W0n7K3T73PNJutRqXzlZZmdfN0BobDmxknYig%2B%2F2%2F83EjuIPMtICEn%2BvDgIlzJa%2BDuNz7YDBMv30z1kyS0IQtWZmbn8bKWXVISsk%2BACjbaGQOw6hxQCCGeYes4QAdBubEQNLADb2DQRTEnMIfGT0BuYyKr0Shou4EJeq5CXF69X3B%2BWazbuHPreZ4wB5TBCE6%2BK9r6cdIH9ACyQUbGO7gut7smSBjzqWcnhZQb1pbMHT8R4AU75TBjRbVs%2F%2FJU%2BFOXeRwgcwpcTZSMKHe09UGOqUB%2BoTIyyfQawSeDYK4PelUhrYls97WUH2fPjbAE3a14svkjW2PlUxpC1IEoMA80jMgJ5vXxj2Mx0cvqn55hnta1gS0RavpvocCDmVMgJRbzo%2FCBujjnTLGjzDQ8EoEv9UcCY6lO8TmWkUPbTC6LK0GCXTS7FQ0qaQ88PYEfGsoon22N2%2B0lL5asZczjPIr%2BZQZMbbz1bpbAe1iZY9C1y7zE5z2tCb%2B&X-Amz-Signature=f18fe808fc8116fbc592d0e5cb97a15a87986efd843339faf5367f721dd77f26&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466WLOXI7P3%2F20260924%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260924T104256Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEAoaCXVzLXdlc3QtMiJHMEUCIQCaHdoFysTTNucE0C54oUo36dczBal5V94kx7m8FGrFCQIgd2q2%2FCXJhnLH55xl0jye4MHfXAcSX3fM3lS6B540AP4qiAQI0%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDIXzjeX3gS3X6rwAHCrcA%2B2dm%2BXcLlipb02X18zINpBQ%2FyT3ZEegKy880mKxQX4Pi1HiObxHCgNQs8Ea%2F%2FRm9VC08wgXCPSF%2F3HgyJsThRdWGFuD1rdGcSSEXsi%2BViuYKuFzuipXSNYvrUpqkCwweIPwsL8Pj%2Fa12paYP3r8K8hTEcOCO0oGnND4xDopLJrdb3AouPJt6tv1qq0YKjStT8ptYU%2FebZ2%2FtENbj4rtLE3%2BvI8VXRCvo%2B188mY8QPRYftnEkkufawoxpkey7Dwdx99XLh0ni5j6FCw3NP%2BXdoIUgXdNlSXhGzoa4CcXjyaVSNqcqbyZRwbCc0zN4uX%2FzykKb9E8R8SomiDTIFCV68kRDfQe39ACU1eQZxzYCcR8J19W0n7K3T73PNJutRqXzlZZmdfN0BobDmxknYig%2B%2F2%2F83EjuIPMtICEn%2BvDgIlzJa%2BDuNz7YDBMv30z1kyS0IQtWZmbn8bKWXVISsk%2BACjbaGQOw6hxQCCGeYes4QAdBubEQNLADb2DQRTEnMIfGT0BuYyKr0Shou4EJeq5CXF69X3B%2BWazbuHPreZ4wB5TBCE6%2BK9r6cdIH9ACyQUbGO7gut7smSBjzqWcnhZQb1pbMHT8R4AU75TBjRbVs%2F%2FJU%2BFOXeRwgcwpcTZSMKHe09UGOqUB%2BoTIyyfQawSeDYK4PelUhrYls97WUH2fPjbAE3a14svkjW2PlUxpC1IEoMA80jMgJ5vXxj2Mx0cvqn55hnta1gS0RavpvocCDmVMgJRbzo%2FCBujjnTLGjzDQ8EoEv9UcCY6lO8TmWkUPbTC6LK0GCXTS7FQ0qaQ88PYEfGsoon22N2%2B0lL5asZczjPIr%2BZQZMbbz1bpbAe1iZY9C1y7zE5z2tCb%2B&X-Amz-Signature=b4616b2dd3e3816cd294dbec7161441b2068f8cbe6af3728e4edfd68bd09f8b6&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

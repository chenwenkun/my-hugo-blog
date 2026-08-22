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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466YNBH3W6F%2F20260822%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260822T121650Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEPL%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIDTuTc3udm6jh2LUmV%2FawJs%2FyfQYlf5RCIugwDXvo74lAiAehdRjbcQ8spGzHgsgauf%2BdNAGb%2BZKzzj%2Fg%2BrE9p5oeiqIBAi7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMVylWfafoJCHiuwtkKtwDS4BQJDyWss6QU03Si3wryLpzJxXcbj6pXJane5duBUbSJ2ul49AruFdpQdml5dK9YK69ebN7tgr%2FEbGEUokcJz1cq1OGr09ZbkcOl5LQocB%2FdSGAMyw0uLvDZLHQDGNsrjQcvbjV%2BnBBJcGHXGQzHwYoW5bDzDA4wJtRLP1fA7YEAFGn9C3LFQy7vickvIczYG6N41XS7bq8otefoWhvIJUM7VOwRaU37l2UQkw2DRlKWGfGhZMQdRZzT5i66gNUKWWaIgRlIxB9MvpN7oSP3k6T8fEo80zf%2FEYZNNXdjtDKaLE15tQJA%2BFiH7gH3%2BmVmfVWMHCtitl0OlS5YJ%2BY06e32ZZblLDMsJnBC72Wnzg9UHVKAexKL%2FC%2BTvMOSRg2IQwf2QWnzsNt1HVaTZUnNaNet2IxG6uwItJg7EvCuXHP1S6cWh9Q%2BgLiuAmJng7tVWkxVCLlnLa1MLCMuZUbWBcSRmJX7liilymiRi4pxh1u1SekMvncideNb%2FWtZvC4ypMJrOk8mCYbAAWRMQ5CnI%2BdLkaVfb1f2bKqNhyDtJRFcolGNWni2Np0N4JnUSlY9x4LVRwboFBh4Kz71rOxDT6%2BsklJCjU5zRetr4pbcDh4lEH%2FUpEseZmU3HMw1N%2Bl1AY6pgGzI1Yyi2jQp01Fec7WNKNnMyFv9ZGLWjQrzHFCiMWjF16NEvv%2FBfiQIYxKPbFtX8S8csn95zs9I2AO7THBTjjU2qWYdTd4GlOxjsNGsQ59GycGP4gn61SY3wxS3k26%2FObcRfFttbar5CDyAoLVSkPFtNjxkZVHUgrefJAWw%2FKgIj1afKeiZBHOfdVZ0POIK8XrQ3i%2FNtJA8htm%2F1otWHfuNQZX38qL&X-Amz-Signature=6626d62879f2d6ccd4a23ff1982cd12286b33c04abb28562b9f522a01131df69&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466YNBH3W6F%2F20260822%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260822T121650Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEPL%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIDTuTc3udm6jh2LUmV%2FawJs%2FyfQYlf5RCIugwDXvo74lAiAehdRjbcQ8spGzHgsgauf%2BdNAGb%2BZKzzj%2Fg%2BrE9p5oeiqIBAi7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMVylWfafoJCHiuwtkKtwDS4BQJDyWss6QU03Si3wryLpzJxXcbj6pXJane5duBUbSJ2ul49AruFdpQdml5dK9YK69ebN7tgr%2FEbGEUokcJz1cq1OGr09ZbkcOl5LQocB%2FdSGAMyw0uLvDZLHQDGNsrjQcvbjV%2BnBBJcGHXGQzHwYoW5bDzDA4wJtRLP1fA7YEAFGn9C3LFQy7vickvIczYG6N41XS7bq8otefoWhvIJUM7VOwRaU37l2UQkw2DRlKWGfGhZMQdRZzT5i66gNUKWWaIgRlIxB9MvpN7oSP3k6T8fEo80zf%2FEYZNNXdjtDKaLE15tQJA%2BFiH7gH3%2BmVmfVWMHCtitl0OlS5YJ%2BY06e32ZZblLDMsJnBC72Wnzg9UHVKAexKL%2FC%2BTvMOSRg2IQwf2QWnzsNt1HVaTZUnNaNet2IxG6uwItJg7EvCuXHP1S6cWh9Q%2BgLiuAmJng7tVWkxVCLlnLa1MLCMuZUbWBcSRmJX7liilymiRi4pxh1u1SekMvncideNb%2FWtZvC4ypMJrOk8mCYbAAWRMQ5CnI%2BdLkaVfb1f2bKqNhyDtJRFcolGNWni2Np0N4JnUSlY9x4LVRwboFBh4Kz71rOxDT6%2BsklJCjU5zRetr4pbcDh4lEH%2FUpEseZmU3HMw1N%2Bl1AY6pgGzI1Yyi2jQp01Fec7WNKNnMyFv9ZGLWjQrzHFCiMWjF16NEvv%2FBfiQIYxKPbFtX8S8csn95zs9I2AO7THBTjjU2qWYdTd4GlOxjsNGsQ59GycGP4gn61SY3wxS3k26%2FObcRfFttbar5CDyAoLVSkPFtNjxkZVHUgrefJAWw%2FKgIj1afKeiZBHOfdVZ0POIK8XrQ3i%2FNtJA8htm%2F1otWHfuNQZX38qL&X-Amz-Signature=d55dadd2871d906d874e2844487efe87feb4ce5cb92cd29c94c91e3e07be5865&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

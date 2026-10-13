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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4665IOOD5QX%2F20261013%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261013T130809Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjENT%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIC%2FMAqjhirbuwbP72VJmXyoXTKFWF5Tk6mpPBwKZEo2jAiEA27TIT3b%2FtGjsbwKpSbRsMLbL8Vn0s1DGYPuTfexo%2FcoqiAQInf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDFo8qFsKtvLd1RH6mircAyJF62T2ZwHEIvsBfKm6uRAS3DczEkhafJFDRWbB8L5IMWLAXF%2FlaKZduVjeiT3N4hP%2FeOmFyeq5SEiY4xG1WMW5NOQR55Qc214Nm8vvFMLl0eTuJBs%2F8x3G%2BLg%2BLVeBT60xkrbGZbkI83kTLegh2Xc92eQE%2Bwumk%2BWJYAL7dxLtRA0cXRyoaYoxMUq7pZ7hiTIJ7kWgj2GYtjL4VhwPRo7pqGPMI9nl7fvqUelvOJ0MPTV0VngLubPJKwuc2FbNt10oLv3452FTjB4n%2BU1W7ORmtZYt1yJg3AjI%2BgwExNlga8LowzV4B7K8M5mPqMMgvCsrUm8%2FnC61wSvblzsCoxxeQ1Bj5doyh4FM4C2uXIDfCg9gSevcAOk%2B0eDM9Gahosxd6sA7V0WQtplsB%2BuTmGNmRdzydZcfiSGugD8A5r4CqnBuPaWFWbj9oZeNiqxbuDLD%2BDlQHaXOhKwL5bKqcD1rjG9Gx60fkn6x90t4dBLZIWryxrwiJPn%2BlaswxcPe0GvOA5evByD5v5Ifnf70ct7fvP63vICyBYhOupEdV1uXkTeJH3fcF8MLp7gdWwsRd1Epxaa1Uv8FyEHEvklgCGHBHpIPBu8SYlCECrrYKSDh1PDtSig1CKAzvWTAMIWxuNYGOqUBYnWKdWINNufWmD%2F8nol%2FvAlnm1omwtTXIhi5h8fULDuS8JDR9mUlnsGSQPPpPe6CzlBIci6Bhf0Nq9BJi%2BqzC%2FIVrCbiel2iGWtyY0Z%2FbdGxhCrRKLhCYD1mxtfP%2FSAAwsnSxCkkzaqs2xl%2FjYFJrszudF0Hqrmrui9vJBUVCMo0IRWwOv%2FEmX6bzMPfII3b1bYexnDZlimaukFfOvLcSOuyWuru&X-Amz-Signature=15ed3ee262603f0db11d5fac59271f3fc9af1984784f4c0fc9a865ebda50af9b&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4665IOOD5QX%2F20261013%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261013T130809Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjENT%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIC%2FMAqjhirbuwbP72VJmXyoXTKFWF5Tk6mpPBwKZEo2jAiEA27TIT3b%2FtGjsbwKpSbRsMLbL8Vn0s1DGYPuTfexo%2FcoqiAQInf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDFo8qFsKtvLd1RH6mircAyJF62T2ZwHEIvsBfKm6uRAS3DczEkhafJFDRWbB8L5IMWLAXF%2FlaKZduVjeiT3N4hP%2FeOmFyeq5SEiY4xG1WMW5NOQR55Qc214Nm8vvFMLl0eTuJBs%2F8x3G%2BLg%2BLVeBT60xkrbGZbkI83kTLegh2Xc92eQE%2Bwumk%2BWJYAL7dxLtRA0cXRyoaYoxMUq7pZ7hiTIJ7kWgj2GYtjL4VhwPRo7pqGPMI9nl7fvqUelvOJ0MPTV0VngLubPJKwuc2FbNt10oLv3452FTjB4n%2BU1W7ORmtZYt1yJg3AjI%2BgwExNlga8LowzV4B7K8M5mPqMMgvCsrUm8%2FnC61wSvblzsCoxxeQ1Bj5doyh4FM4C2uXIDfCg9gSevcAOk%2B0eDM9Gahosxd6sA7V0WQtplsB%2BuTmGNmRdzydZcfiSGugD8A5r4CqnBuPaWFWbj9oZeNiqxbuDLD%2BDlQHaXOhKwL5bKqcD1rjG9Gx60fkn6x90t4dBLZIWryxrwiJPn%2BlaswxcPe0GvOA5evByD5v5Ifnf70ct7fvP63vICyBYhOupEdV1uXkTeJH3fcF8MLp7gdWwsRd1Epxaa1Uv8FyEHEvklgCGHBHpIPBu8SYlCECrrYKSDh1PDtSig1CKAzvWTAMIWxuNYGOqUBYnWKdWINNufWmD%2F8nol%2FvAlnm1omwtTXIhi5h8fULDuS8JDR9mUlnsGSQPPpPe6CzlBIci6Bhf0Nq9BJi%2BqzC%2FIVrCbiel2iGWtyY0Z%2FbdGxhCrRKLhCYD1mxtfP%2FSAAwsnSxCkkzaqs2xl%2FjYFJrszudF0Hqrmrui9vJBUVCMo0IRWwOv%2FEmX6bzMPfII3b1bYexnDZlimaukFfOvLcSOuyWuru&X-Amz-Signature=2f1775dd6ba0e5e9dc8eb741245c133249511c0abc7ee67b95a6a7c8a267fdcd&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

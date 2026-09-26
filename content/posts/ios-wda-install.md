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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466TPHPCSQ5%2F20260926%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260926T022823Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEDIaCXVzLXdlc3QtMiJHMEUCIQDZhBDvtUU6TsAIhx6K6eX61ANd0T8tWm6eiwXudw%2Fg5AIgIobDunw5y4FmY4ZEa%2FNZKJVLSq%2Fzcw0DRAkJrDPZWfEqiAQI%2B%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDDWQAM1FMUI142r7XircA9Z992324qiWVFR%2FiQ6mBNyNm5jMiCqzrOuLaky9gqFvYNhablNT6N27xlTLXi9QXaFduG%2F66JdMCKx44iIXYQ%2FEw9%2BRSifWMY3j955svh%2F8nd6kVW86m7g6dG9SEJ%2FbeyqZR89ktVWsaLAC69AApfvTjsmKiYzoEsYhqcSRvnNAVGwc3SjMVQQE1CU8Y3tEQU4rN17zbhhokHNWMr%2BN9chtqdsqGG7dlQgATuToDZobv0E0k2fY3zLK22QFmo3OBBdscOqaCrukeiG2swwMo2q5TqoFUKvc%2B6KNmZ2LkbhG%2FrLCboQCT5RwOlP0msYL3FeVeYqVf%2B9dRE40JtXRNh75ALNMl0tO%2B7AnrSXHZxbyVI3nD7T4o7B7D62m%2FtNMiz1bH379w7WHRU8fblSNsmvp9tATz08jj5C%2FpizeBElKivO8ph9wzwAwkFKqMnrOcxYbvT7l9KfvjkILUf%2BEU6Crlm0dm1K3up4zriqFa5toS5Obczzh64LSYVhsscxO1yo%2BeKuO3RQR%2Bfvv42GEvElPUKl6hOEJcsUYreo9QA0%2FfaOjqLxMwBob29R8P2SPrn3aJfs3juVqf%2Fdwzi91w5uwBfbf9Rmi2c9gqExEb59JVcCA4go6dBlFYJrYMPvI3NUGOqUBj7bdwKzi7gC3s1f6jGmP3f%2FbVRdu6uIt1Y2EbSNLPLnJhGX%2FW5%2B1%2BYGNlwDUgsjAZwvu4N%2BZk7f0mzpgEwoeFECL8Vz8ecMApgBZw5zc7yU36HlZfsjRf28KMLEh2o80YvQVYuGxY6fjji%2BQlafxzpsq2cM9lNj3t4%2Bjygo6rokL6AHVCU0lwfy4b2QT1in9uAOniyty9Ks0Z%2BzQ38XYALTWaKtd&X-Amz-Signature=45bfeb949a153be951b79fcc7715230b668cc0c4754ba84c6a15137601cd31df&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466TPHPCSQ5%2F20260926%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260926T022823Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEDIaCXVzLXdlc3QtMiJHMEUCIQDZhBDvtUU6TsAIhx6K6eX61ANd0T8tWm6eiwXudw%2Fg5AIgIobDunw5y4FmY4ZEa%2FNZKJVLSq%2Fzcw0DRAkJrDPZWfEqiAQI%2B%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDDWQAM1FMUI142r7XircA9Z992324qiWVFR%2FiQ6mBNyNm5jMiCqzrOuLaky9gqFvYNhablNT6N27xlTLXi9QXaFduG%2F66JdMCKx44iIXYQ%2FEw9%2BRSifWMY3j955svh%2F8nd6kVW86m7g6dG9SEJ%2FbeyqZR89ktVWsaLAC69AApfvTjsmKiYzoEsYhqcSRvnNAVGwc3SjMVQQE1CU8Y3tEQU4rN17zbhhokHNWMr%2BN9chtqdsqGG7dlQgATuToDZobv0E0k2fY3zLK22QFmo3OBBdscOqaCrukeiG2swwMo2q5TqoFUKvc%2B6KNmZ2LkbhG%2FrLCboQCT5RwOlP0msYL3FeVeYqVf%2B9dRE40JtXRNh75ALNMl0tO%2B7AnrSXHZxbyVI3nD7T4o7B7D62m%2FtNMiz1bH379w7WHRU8fblSNsmvp9tATz08jj5C%2FpizeBElKivO8ph9wzwAwkFKqMnrOcxYbvT7l9KfvjkILUf%2BEU6Crlm0dm1K3up4zriqFa5toS5Obczzh64LSYVhsscxO1yo%2BeKuO3RQR%2Bfvv42GEvElPUKl6hOEJcsUYreo9QA0%2FfaOjqLxMwBob29R8P2SPrn3aJfs3juVqf%2Fdwzi91w5uwBfbf9Rmi2c9gqExEb59JVcCA4go6dBlFYJrYMPvI3NUGOqUBj7bdwKzi7gC3s1f6jGmP3f%2FbVRdu6uIt1Y2EbSNLPLnJhGX%2FW5%2B1%2BYGNlwDUgsjAZwvu4N%2BZk7f0mzpgEwoeFECL8Vz8ecMApgBZw5zc7yU36HlZfsjRf28KMLEh2o80YvQVYuGxY6fjji%2BQlafxzpsq2cM9lNj3t4%2Bjygo6rokL6AHVCU0lwfy4b2QT1in9uAOniyty9Ks0Z%2BzQ38XYALTWaKtd&X-Amz-Signature=d30c005747657b9c290efe99cafccbd1b05dbf81f00121eab8a3937852109e44&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

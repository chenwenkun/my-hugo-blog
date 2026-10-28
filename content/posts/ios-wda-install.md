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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466Z47YQVCN%2F20261028%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261028T173544Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEEIaCXVzLXdlc3QtMiJHMEUCIQCuFJK0s5wm0tDSr6t7bWiSX2q6ViX3FiZqmDkhgxN6GQIgIhX4SrLQXXFQuP2T7%2BJ3LYmwPVN1JTWLjei2oGkb%2Flcq%2FwMIChAAGgw2Mzc0MjMxODM4MDUiDEIg7x1brbfjhsqduSrcA6VeT%2FgXZGhw6ImtmfnzeazEq047IVeKv9rhIjP7oh71iwvEMV65n01dToaFQgucVDwMyb9fAue5zUN7FpOjPz7OaeF21Hpb5%2FDMRO2cma2wLD1XGh7g6w9I9VU1iTRgo2NUtC1dj6n5QNdM2KaH6NH8%2ButRCYYhWcE%2FThD4GDmpTd%2FxU2LB2YFRp5wdHGkzgM19PHUrZLvvK4%2FL2K%2FlqvJbhbjUribRUWbZjSdaz9hWXqfjxRWYyqYs1bKys91jtZca80CznbWtdd2lP2xC5hLe8wpMYyM8Ap%2FyPxvM0A1bLfQ%2B6BEUGbsT67eCaGWlmEs60J7iTF8SY%2FhrVbZ%2F2K47KZb5Y%2Fedrs0QWdZmdJEKYAQv8kziEJv3xjGn%2BmO8uvY3DShTGpNkv6waj%2BL8bwRcmxZM76bAP8ao83koLJVOVy235xOKPxc%2FJVJenthkfaDP2QFjZ2vtMUyTYEqyRBJo1Igvd1jAMbr5ntAaA2Cdk4tTINiVAJaxvxf6WIgj2Zcg92bW1Al%2BtuBegLkovgLzCMkCxz1Xri7YGIlFu38HZNP7c%2BBKtx8IZiXBcRF3HmSzycXJYpytoK5MdhQYhbKHYG2UpqobPI9rbF5gLCGclETV2wIKSyd8GThSMOviiNcGOqUBFI6BMnd1RjgFWt%2FLMuLGYc9ev%2Fcklymwi1EnSXE0lYzKFSZURsKafbFTYhLW2dxSEP1OozytnKCkiZOrZ0AATBNHQbseF5Hno2MJLco8sIwJCNO3DhIT0NuH7f0CroGYMcSd6OoIvV5NU0qTY7p1AbpfZriSNC28okoseP2FwNZbP8A3hrY6%2B2dmm49pf24tl1BJcwytnAZqILvW0KOMJVFjlMWh&X-Amz-Signature=680e3130db9730bd289f07ebc23598300df52598586d5111c591fc94229601e3&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466Z47YQVCN%2F20261028%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261028T173545Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEEIaCXVzLXdlc3QtMiJHMEUCIQCuFJK0s5wm0tDSr6t7bWiSX2q6ViX3FiZqmDkhgxN6GQIgIhX4SrLQXXFQuP2T7%2BJ3LYmwPVN1JTWLjei2oGkb%2Flcq%2FwMIChAAGgw2Mzc0MjMxODM4MDUiDEIg7x1brbfjhsqduSrcA6VeT%2FgXZGhw6ImtmfnzeazEq047IVeKv9rhIjP7oh71iwvEMV65n01dToaFQgucVDwMyb9fAue5zUN7FpOjPz7OaeF21Hpb5%2FDMRO2cma2wLD1XGh7g6w9I9VU1iTRgo2NUtC1dj6n5QNdM2KaH6NH8%2ButRCYYhWcE%2FThD4GDmpTd%2FxU2LB2YFRp5wdHGkzgM19PHUrZLvvK4%2FL2K%2FlqvJbhbjUribRUWbZjSdaz9hWXqfjxRWYyqYs1bKys91jtZca80CznbWtdd2lP2xC5hLe8wpMYyM8Ap%2FyPxvM0A1bLfQ%2B6BEUGbsT67eCaGWlmEs60J7iTF8SY%2FhrVbZ%2F2K47KZb5Y%2Fedrs0QWdZmdJEKYAQv8kziEJv3xjGn%2BmO8uvY3DShTGpNkv6waj%2BL8bwRcmxZM76bAP8ao83koLJVOVy235xOKPxc%2FJVJenthkfaDP2QFjZ2vtMUyTYEqyRBJo1Igvd1jAMbr5ntAaA2Cdk4tTINiVAJaxvxf6WIgj2Zcg92bW1Al%2BtuBegLkovgLzCMkCxz1Xri7YGIlFu38HZNP7c%2BBKtx8IZiXBcRF3HmSzycXJYpytoK5MdhQYhbKHYG2UpqobPI9rbF5gLCGclETV2wIKSyd8GThSMOviiNcGOqUBFI6BMnd1RjgFWt%2FLMuLGYc9ev%2Fcklymwi1EnSXE0lYzKFSZURsKafbFTYhLW2dxSEP1OozytnKCkiZOrZ0AATBNHQbseF5Hno2MJLco8sIwJCNO3DhIT0NuH7f0CroGYMcSd6OoIvV5NU0qTY7p1AbpfZriSNC28okoseP2FwNZbP8A3hrY6%2B2dmm49pf24tl1BJcwytnAZqILvW0KOMJVFjlMWh&X-Amz-Signature=cd3256df95333eda93323c501f9257cc2a8306af7e506f5fdde732234d089972&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

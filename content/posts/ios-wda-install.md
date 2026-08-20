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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4667CJ2FRP5%2F20260820%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260820T122407Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEMP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQD9nfiWtBvtluMDXtb5qaQqWa4BwqkivdWhm8KdwmXLvQIhAM1RryXQP7RYPeu8G2c69TWRWmDEDXk4ZOLcPdJQHNXEKogECIz%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgxDlCWE3VtuFX9xvB4q3AMVBpgUE7fCRMFoNw013kibk2HGE7I6Fr4JPlQR5S%2Bgy8M1VIkaNnNzeYP3guF6RH4XQWNOtKVCGUFvWdFjMRzTH3AECquN0PvhOz3b7Mv%2FgsNJIuMjrvvSFE8mJB04KWv5CN18cW%2FR7MDK0Yr5YGtr2NQZHMZZ6QLHyd%2B89Fe6XagEtJbj%2Fk7Z5mUnCX7NnHxv3RufjKteOEyyY%2FEjv195TdkcV5o54TxSOABaTZm8cFP%2BJTLTo2lcS6J%2BHWCoZX7yr30V54TnA9MPxgwTvSA37pHrMjRSsawxVmfdQi7kukUUcVUEGzGOIYqj1TuHnraXGBcsHcfORcbiCl18FIFFhEgNw07vlzXp8JksXZCk%2Fuba8ZjB34TBiicmNyFdCVES%2Bx2JrRL1oB5LJZcyzB%2B3xfCTm%2BPa6%2FSVh1sTEHJK8JQVA4zRjpXlTPKIU4xGmFb4vsRY%2BAoaM5tgo3fHDjeFGKWSXp%2FG34Dso9LBffN3NILurdvmZe4acLfs3aRUVJ1bLjT8GP0vJE5ropAYYMHfsox7T7zr%2BLHyUGqJDLZWExtFtL6uQ2oRVngAizCLdHfPJNY0cmwhLzrcURNxkUVZP6nmIu52C4KZcp1yhjc6ZHXihhZ6k9bTqIy4QTC2sZvUBjqkAYOEgNwB27QfNVvp5NgMCTNNdHnGDJm1bvuMHKdHtDFG%2FQYWqSo3p7twnA060lWaBjUkYFFOJmKaS%2Fm9jBx%2Bx9ku1QkIFQrOYWrGimEdIKYGnX8mwbQjxt0iIu7%2FlGzQH7pkrr5e%2FxzIbPuIqjpPfgdj5Y19GgAx1HOhOts86XHqz6c%2Beo%2BWFblgs0xnxOCvCy7Bg1DruB%2FpW91pc1zKvevtJG3F&X-Amz-Signature=c73fdf5d9eace8a33cff00e3f290be972d7669177b61f181b28329e19fb35584&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4667CJ2FRP5%2F20260820%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260820T122407Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEMP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQD9nfiWtBvtluMDXtb5qaQqWa4BwqkivdWhm8KdwmXLvQIhAM1RryXQP7RYPeu8G2c69TWRWmDEDXk4ZOLcPdJQHNXEKogECIz%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgxDlCWE3VtuFX9xvB4q3AMVBpgUE7fCRMFoNw013kibk2HGE7I6Fr4JPlQR5S%2Bgy8M1VIkaNnNzeYP3guF6RH4XQWNOtKVCGUFvWdFjMRzTH3AECquN0PvhOz3b7Mv%2FgsNJIuMjrvvSFE8mJB04KWv5CN18cW%2FR7MDK0Yr5YGtr2NQZHMZZ6QLHyd%2B89Fe6XagEtJbj%2Fk7Z5mUnCX7NnHxv3RufjKteOEyyY%2FEjv195TdkcV5o54TxSOABaTZm8cFP%2BJTLTo2lcS6J%2BHWCoZX7yr30V54TnA9MPxgwTvSA37pHrMjRSsawxVmfdQi7kukUUcVUEGzGOIYqj1TuHnraXGBcsHcfORcbiCl18FIFFhEgNw07vlzXp8JksXZCk%2Fuba8ZjB34TBiicmNyFdCVES%2Bx2JrRL1oB5LJZcyzB%2B3xfCTm%2BPa6%2FSVh1sTEHJK8JQVA4zRjpXlTPKIU4xGmFb4vsRY%2BAoaM5tgo3fHDjeFGKWSXp%2FG34Dso9LBffN3NILurdvmZe4acLfs3aRUVJ1bLjT8GP0vJE5ropAYYMHfsox7T7zr%2BLHyUGqJDLZWExtFtL6uQ2oRVngAizCLdHfPJNY0cmwhLzrcURNxkUVZP6nmIu52C4KZcp1yhjc6ZHXihhZ6k9bTqIy4QTC2sZvUBjqkAYOEgNwB27QfNVvp5NgMCTNNdHnGDJm1bvuMHKdHtDFG%2FQYWqSo3p7twnA060lWaBjUkYFFOJmKaS%2Fm9jBx%2Bx9ku1QkIFQrOYWrGimEdIKYGnX8mwbQjxt0iIu7%2FlGzQH7pkrr5e%2FxzIbPuIqjpPfgdj5Y19GgAx1HOhOts86XHqz6c%2Beo%2BWFblgs0xnxOCvCy7Bg1DruB%2FpW91pc1zKvevtJG3F&X-Amz-Signature=eb746081da8c6c01f8c68b4b74c045aa5a9a9e369ac2dc97d22b5a6822949881&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

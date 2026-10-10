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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466YEIFTJP5%2F20261010%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261010T113258Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEIj%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCICqSVKxKc4D4iYwaiOhNBLW72GRKgvKlV35uAL64pEoQAiEAo%2BEsZrH31C70TAsNlzg7%2F8Oz6ngA4z14zqKiNsZZMmcq%2FwMIURAAGgw2Mzc0MjMxODM4MDUiDILfa%2Fgjh1WXiJgKLCrcA0vtCexvLgG887Z8VseMaDLBCEFuq8OBo44bVk%2F%2Fh8yRkVuB9pZgX%2FZGkCz4PJcsvm%2By64UztEQpvcEvydK6Hd6Ki1NfuqSbSw7x4rcjLWNbh%2FTafaI1UsL8rB1IZxM%2FM%2FRJ5Pf22g0ptRfQddSzVAz0qIughZlVaAVkl%2B1%2Bj3ZMnrPc1Hj6xfLFlPYNhRV1HRG0X2dZychNlNMYWMz0KVJzw5IHmyFwoogsVCF7%2F9x75GtapY4w5x6%2BmmD1O9VIR3rhLgDUJYMS3xN%2BWn6uTbDX%2FGG3jORaYlTcpmRwHS2XPw2MxYTUC9dSGC0x3RGzESBxbpJQ%2FObeFKP29%2FBQqcm9Ytj%2BYCVXjWY3ogvRVRGXm%2FxMqB582Ku9z3u2GF1wZEgkhKX5MkhmgrkTceaDaF%2FFjnulQfU%2FFnXo7dbkEcJhr0FmhHomIrnkPjWJJd0o5UR0jt1uLInFZipPEf2FZG1DBmuUWjy95%2B11Xxrrwsn602MVlNyLqBt0TEKqXbvBhEE9SklKWJJ1nI%2B3opuV9NnT2ekaDDTNSvvCXAYIIyPH8cQsn3ynAaqjlqLquzeYO%2Bi%2F48tHygCaoZ1UtlbICNtVCLMB87zJUNOepuphOQ9akD%2BP290yWime%2F3h%2FMITpp9YGOqUBpNCAPZa2i99zGKHrm43Wugrft%2FMSblHS0MOFhFg5QxJJ7IXJ6F9AjRITqYxzJHIDw24qrJaGZE4LYvMZOIlXHpeWnrXE%2F%2FyqoQA%2FeA4fWKpBqL7eLtEsuWu6ZVOppbmv8IgY5zvspy7JGykyftf9UMBh2v3BOuSlCiTjantgDEZ2D5NiisBLZ2PEqRmXzZYYzuAx9tK8MRoFNx%2FOkba2MatjZNJj&X-Amz-Signature=034d43eff7ef0215b00f9cf6b48ebf2d68efb3dc990bd7878f5bffeade1fee07&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466YEIFTJP5%2F20261010%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261010T113258Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEIj%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCICqSVKxKc4D4iYwaiOhNBLW72GRKgvKlV35uAL64pEoQAiEAo%2BEsZrH31C70TAsNlzg7%2F8Oz6ngA4z14zqKiNsZZMmcq%2FwMIURAAGgw2Mzc0MjMxODM4MDUiDILfa%2Fgjh1WXiJgKLCrcA0vtCexvLgG887Z8VseMaDLBCEFuq8OBo44bVk%2F%2Fh8yRkVuB9pZgX%2FZGkCz4PJcsvm%2By64UztEQpvcEvydK6Hd6Ki1NfuqSbSw7x4rcjLWNbh%2FTafaI1UsL8rB1IZxM%2FM%2FRJ5Pf22g0ptRfQddSzVAz0qIughZlVaAVkl%2B1%2Bj3ZMnrPc1Hj6xfLFlPYNhRV1HRG0X2dZychNlNMYWMz0KVJzw5IHmyFwoogsVCF7%2F9x75GtapY4w5x6%2BmmD1O9VIR3rhLgDUJYMS3xN%2BWn6uTbDX%2FGG3jORaYlTcpmRwHS2XPw2MxYTUC9dSGC0x3RGzESBxbpJQ%2FObeFKP29%2FBQqcm9Ytj%2BYCVXjWY3ogvRVRGXm%2FxMqB582Ku9z3u2GF1wZEgkhKX5MkhmgrkTceaDaF%2FFjnulQfU%2FFnXo7dbkEcJhr0FmhHomIrnkPjWJJd0o5UR0jt1uLInFZipPEf2FZG1DBmuUWjy95%2B11Xxrrwsn602MVlNyLqBt0TEKqXbvBhEE9SklKWJJ1nI%2B3opuV9NnT2ekaDDTNSvvCXAYIIyPH8cQsn3ynAaqjlqLquzeYO%2Bi%2F48tHygCaoZ1UtlbICNtVCLMB87zJUNOepuphOQ9akD%2BP290yWime%2F3h%2FMITpp9YGOqUBpNCAPZa2i99zGKHrm43Wugrft%2FMSblHS0MOFhFg5QxJJ7IXJ6F9AjRITqYxzJHIDw24qrJaGZE4LYvMZOIlXHpeWnrXE%2F%2FyqoQA%2FeA4fWKpBqL7eLtEsuWu6ZVOppbmv8IgY5zvspy7JGykyftf9UMBh2v3BOuSlCiTjantgDEZ2D5NiisBLZ2PEqRmXzZYYzuAx9tK8MRoFNx%2FOkba2MatjZNJj&X-Amz-Signature=b363b8cb6ad3b4e78c76876939a9752485530dac78e3e44654e14fe73484da9f&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

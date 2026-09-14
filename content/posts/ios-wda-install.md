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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4662JG37NY4%2F20260914%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260914T111142Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEBsaCXVzLXdlc3QtMiJHMEUCIAjx6USzxioVNtc4LXQ8SAxo6Ufmv%2B5PgPYxGBhrnJWMAiEAwDaF%2Bf%2B7UQzxDPF8PZxIGxBblhVKq1kvfX2jw9GVr2kqiAQI5P%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDAWb1R8IXVp3MvAqFyrcA%2FC0p%2FCn3W%2BFTVJ385TUQI722aB3Gn5gabW8Z3iCGQ1x4EK%2Bb%2FwguwoAHmOXR%2FMsaoLm4YG%2FHYlpQoXBLp7Gj72RBEIH%2F83YikDZGBfruek4ITdt9zAaUjc%2FwORIF6tdtjUkxnN3%2BSin0tu5mz3jaVT5sk0XFrWjON8KFRfvU5xvFn1kDO4%2FnXpiA9XNWRnZ1rCq7dJyDpNpzxbMd02i7FWa9Nt6SAkvZ3echiAuhiM%2B8W6L5NgsKFW4Q1wzcwTZXVU3Kftrqo6k1AlgwnMZ15hfnnniHUJHLq3TnLL%2BTrce%2Bv%2B76ixs5OaY3KaVkCzzm1z6vLHW3ylLsdPMFLQk08kLsTaBpvhkaCWeH6pffDlzicj1akDDimUoq3Xr3sE%2Bheew4JtYKgB5pRIGwvDEDrKu%2BIvZbVHGEoF8Jvs2JFU46bKpDcFFHZooMYSgvD3HwrHdV78In57UhLEUvdVchgj7ysILn5coaYqm%2FFW0uHwZR%2FH6RIIHbT2Xy%2BSNl9wGsIdOgMHGvKFgLm6ccMDM0kYqLibzp%2BkwpDSxt6rvSgBuVL5JNvkdvBt7IXHiOgb5rbFUShTq3yVRFL%2BkjNmOFM3YNJNks7lTS3L0fhGD5vA8aoRds4MIkoBwilS8MLCkn9UGOqUBg0tgFMFxDmv6xnokuS7Ii8QKpkobYEbRu1Xhx6tzq6AFdo0zb9%2FghFYadcAB7DhSDHDvLSknQaxXHn5Nh8N5QrLAHrGjndg3CuidEkJxSZ49YG8%2BuLwbis9N%2Fo6bTNeiRelf1rIrgU6AuEUX8qXvlHDIAlcj1SX6zjfwy6lDaOAHMI51LPzjl4bLRcW%2FglpmZG%2BmQiCbhUI%2FihyMAc4FfE5%2FKM8R&X-Amz-Signature=a65c508681b67377c59c2f297e71c794b12f66ef5a595bcfb5578cfe36fb535b&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4662JG37NY4%2F20260914%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260914T111142Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEBsaCXVzLXdlc3QtMiJHMEUCIAjx6USzxioVNtc4LXQ8SAxo6Ufmv%2B5PgPYxGBhrnJWMAiEAwDaF%2Bf%2B7UQzxDPF8PZxIGxBblhVKq1kvfX2jw9GVr2kqiAQI5P%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDAWb1R8IXVp3MvAqFyrcA%2FC0p%2FCn3W%2BFTVJ385TUQI722aB3Gn5gabW8Z3iCGQ1x4EK%2Bb%2FwguwoAHmOXR%2FMsaoLm4YG%2FHYlpQoXBLp7Gj72RBEIH%2F83YikDZGBfruek4ITdt9zAaUjc%2FwORIF6tdtjUkxnN3%2BSin0tu5mz3jaVT5sk0XFrWjON8KFRfvU5xvFn1kDO4%2FnXpiA9XNWRnZ1rCq7dJyDpNpzxbMd02i7FWa9Nt6SAkvZ3echiAuhiM%2B8W6L5NgsKFW4Q1wzcwTZXVU3Kftrqo6k1AlgwnMZ15hfnnniHUJHLq3TnLL%2BTrce%2Bv%2B76ixs5OaY3KaVkCzzm1z6vLHW3ylLsdPMFLQk08kLsTaBpvhkaCWeH6pffDlzicj1akDDimUoq3Xr3sE%2Bheew4JtYKgB5pRIGwvDEDrKu%2BIvZbVHGEoF8Jvs2JFU46bKpDcFFHZooMYSgvD3HwrHdV78In57UhLEUvdVchgj7ysILn5coaYqm%2FFW0uHwZR%2FH6RIIHbT2Xy%2BSNl9wGsIdOgMHGvKFgLm6ccMDM0kYqLibzp%2BkwpDSxt6rvSgBuVL5JNvkdvBt7IXHiOgb5rbFUShTq3yVRFL%2BkjNmOFM3YNJNks7lTS3L0fhGD5vA8aoRds4MIkoBwilS8MLCkn9UGOqUBg0tgFMFxDmv6xnokuS7Ii8QKpkobYEbRu1Xhx6tzq6AFdo0zb9%2FghFYadcAB7DhSDHDvLSknQaxXHn5Nh8N5QrLAHrGjndg3CuidEkJxSZ49YG8%2BuLwbis9N%2Fo6bTNeiRelf1rIrgU6AuEUX8qXvlHDIAlcj1SX6zjfwy6lDaOAHMI51LPzjl4bLRcW%2FglpmZG%2BmQiCbhUI%2FihyMAc4FfE5%2FKM8R&X-Amz-Signature=be626c19bee3ef43623a12d1d0cfbd37d3a842f9ee8a43520bd9f80f06216657&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

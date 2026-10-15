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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466T24W5KKQ%2F20261015%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261015T021701Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEPr%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCkcLrKfELxlu%2FRRde%2BEuh7BZyAfch4uMooJoZ17dMz3wIhANRBiOwG7qU%2FxyF2mihAJmPSK2J7SqupV%2FyyZVzBA7N6KogECML%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1Igxhj4yeic9S5wwyyh4q3AO8ilyCMc%2BoE960bL1B1Msdnc9o4v9LPoc5nLBzN5QpQdmlpz0XnxlGWIY7GtZdzOOXUlRh%2BjXhrBdzwrbAmRGyx3h4cLngaa%2FKMmkcPUYKoDZoJmjYKAj2Ex0vBDsiCP7uDFdHOMV8nTz7490OzlLPFkqHQ23p6QDARwob3Jx%2FAjBi2fTpsWl%2BCJdMU1ZdisZDIFd1d9r3wZVVx1LK4EuUiNRASEXWoaToGNwC9zOY8q06Kc8h2EDhDSQ%2BRosS0kyJ6ETR8nczOrLlXar0qxGSwWN3CRGRIs3XyMkQgR0aNeEKr27tb2Myzdbkb44mbzjWYqip6cyrfU%2FZAD4Iio9qIow%2BKkJJhMmE1j99pSCjUtZHixa1LfysHE%2BYdjKJJwSezNGeGP2Rfxr1TLAicPjxq1NhewEqNBrr3oUhH2dXuDl7R%2BZ6J%2B%2FMoC39kGBsYuaY2TuTANvnFLmsfK%2BEv%2BUs6LVF2hCHoSwshQOegpQNeFY4BooYVe0POB5JUeBYiZ%2Bl7Md5VlDHochF%2FMe7aYGJOKDF4EFTaGfxitLqgJhbdFcm8nfAmxzMvB5VOfMj2qYAoXmm0fgpwJ47CYGSQRdX2CdK5ywi9lgXg3YVhASxeb15gGBIUx6AoDtJrzCB2sDWBjqkAfu3Wx1No8mNp4pD82ef%2FtvZFG5N6oxdkIUAdrPiW2aPUmlke57JzZvxhHE2L976PTo5jl1Yuiq201PpfZR79%2BKbKndimw%2BKAZMHFMHR8%2BPhPL%2FMnG%2FXBdMmKX2LOKvTKbSTQ%2F5M6%2Byu4u33gOvUmOmvN%2F9kmW%2FLFHUwS1qbYeRC8yKzGLEH66KjX37PvHfuBNU%2BR70S6XJtptJaruWyRgHqXI8e&X-Amz-Signature=c4f53c412ee2f13155128ae8048afcd8b5c4be55a93c0461cf325537b692a2f8&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466T24W5KKQ%2F20261015%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261015T021701Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEPr%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCkcLrKfELxlu%2FRRde%2BEuh7BZyAfch4uMooJoZ17dMz3wIhANRBiOwG7qU%2FxyF2mihAJmPSK2J7SqupV%2FyyZVzBA7N6KogECML%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1Igxhj4yeic9S5wwyyh4q3AO8ilyCMc%2BoE960bL1B1Msdnc9o4v9LPoc5nLBzN5QpQdmlpz0XnxlGWIY7GtZdzOOXUlRh%2BjXhrBdzwrbAmRGyx3h4cLngaa%2FKMmkcPUYKoDZoJmjYKAj2Ex0vBDsiCP7uDFdHOMV8nTz7490OzlLPFkqHQ23p6QDARwob3Jx%2FAjBi2fTpsWl%2BCJdMU1ZdisZDIFd1d9r3wZVVx1LK4EuUiNRASEXWoaToGNwC9zOY8q06Kc8h2EDhDSQ%2BRosS0kyJ6ETR8nczOrLlXar0qxGSwWN3CRGRIs3XyMkQgR0aNeEKr27tb2Myzdbkb44mbzjWYqip6cyrfU%2FZAD4Iio9qIow%2BKkJJhMmE1j99pSCjUtZHixa1LfysHE%2BYdjKJJwSezNGeGP2Rfxr1TLAicPjxq1NhewEqNBrr3oUhH2dXuDl7R%2BZ6J%2B%2FMoC39kGBsYuaY2TuTANvnFLmsfK%2BEv%2BUs6LVF2hCHoSwshQOegpQNeFY4BooYVe0POB5JUeBYiZ%2Bl7Md5VlDHochF%2FMe7aYGJOKDF4EFTaGfxitLqgJhbdFcm8nfAmxzMvB5VOfMj2qYAoXmm0fgpwJ47CYGSQRdX2CdK5ywi9lgXg3YVhASxeb15gGBIUx6AoDtJrzCB2sDWBjqkAfu3Wx1No8mNp4pD82ef%2FtvZFG5N6oxdkIUAdrPiW2aPUmlke57JzZvxhHE2L976PTo5jl1Yuiq201PpfZR79%2BKbKndimw%2BKAZMHFMHR8%2BPhPL%2FMnG%2FXBdMmKX2LOKvTKbSTQ%2F5M6%2Byu4u33gOvUmOmvN%2F9kmW%2FLFHUwS1qbYeRC8yKzGLEH66KjX37PvHfuBNU%2BR70S6XJtptJaruWyRgHqXI8e&X-Amz-Signature=260bd3fb6fa10c15f91ad3d52614e1fc3427176685243731cabd74e75a6b403d&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

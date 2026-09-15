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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466UD56CHIW%2F20260915%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260915T022206Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjECoaCXVzLXdlc3QtMiJGMEQCIFz174%2B6uv9j37FI3MP4ia5mpH%2FxfgH15MaJNSTMyripAiBeMdbHN6QErt86NuyfXPouaGffznUEiqi%2BHJ7UaiC6CyqIBAjy%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIM4wtnTSSNoXLrSgW6KtwD8oKU3pRdQK1w3eEYJ3WXUceVdXTBX9C8bhEofkLbTI6lDaWqPlQDAgPBLAoilHPrwtQxUT7eUH1usBrAfYtOQCzD0QqthFYJTnOhZ2ZwHc8UdZqI9HRCt4YsdZoSnoFH4ASo1XtdQOZLzpigd6C4LgRQMrj8Fb41TsYOwUCyuomH77JVWys3MXY3iLqaAkp52WNfj4vWRKO7G0pP4sJnU9%2BvnTdD2ycpI0t4s7Wwz%2FIDVqKCubqI%2BvHCfrATYJ3ueGUWUhCVpHIW9QlZ1AFl4sBD0cLXpiFu0yfvy51NpUU2%2Fv%2BO5A%2FJvirHAwtCS2FJWOVCBsk87u4xkkAQAgXbBL8aboHQI2%2BReoQShC5arm3zLGGb3HPFVQ%2BtPONDw8R%2BDFtrnzBowzPdmPbZJoWu9v0QzV10xuE8WJ2FU9xSlSYAPj2PLuTsva9O0ZuBkXh4QmiQCrgasUTziNms2sHuJMIW8nfbMS7YL6ZBkyt2jBOZGCH81d9W46WrQyl4fCQ3p9h6bJZtOwDu%2FwyiqQU3%2FPYI5TA8g%2FVNvm1cvwQFWj%2BxW0%2FIbwpl7%2BUaBFe%2B1myLsE2vpFo8fz9lwyKA8PgoYI%2FoVlwg2WvSzSu4i9%2Fc8gzvQibeIRIZiiNEWogwgryi1QY6pgGz3lsxdjsZNqfBE4cjRu7AF%2BtalXsN6sxKfHN2n96fRp84DI4Qjwvwe0mdWduAam%2FeOZw4MH6QclCl1xBhwHcIfZFFnHx2KCcx%2FfvV7nlPJ8KGtQgNzvrpZ4mlGQgCIsN7x09J%2Bp6oETQDRoeX2aFjTpneXQVL9VdU%2FLbQee%2Fep4Xcrwroe1igeAv1YjDG2qtiXbLd4b6GGtMFUs1b1vUpwupr%2Fh5c&X-Amz-Signature=3c577b7f65c44114b3534d26d886f3be02203534d9f42ef30086208a979f48e7&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466UD56CHIW%2F20260915%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260915T022206Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjECoaCXVzLXdlc3QtMiJGMEQCIFz174%2B6uv9j37FI3MP4ia5mpH%2FxfgH15MaJNSTMyripAiBeMdbHN6QErt86NuyfXPouaGffznUEiqi%2BHJ7UaiC6CyqIBAjy%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIM4wtnTSSNoXLrSgW6KtwD8oKU3pRdQK1w3eEYJ3WXUceVdXTBX9C8bhEofkLbTI6lDaWqPlQDAgPBLAoilHPrwtQxUT7eUH1usBrAfYtOQCzD0QqthFYJTnOhZ2ZwHc8UdZqI9HRCt4YsdZoSnoFH4ASo1XtdQOZLzpigd6C4LgRQMrj8Fb41TsYOwUCyuomH77JVWys3MXY3iLqaAkp52WNfj4vWRKO7G0pP4sJnU9%2BvnTdD2ycpI0t4s7Wwz%2FIDVqKCubqI%2BvHCfrATYJ3ueGUWUhCVpHIW9QlZ1AFl4sBD0cLXpiFu0yfvy51NpUU2%2Fv%2BO5A%2FJvirHAwtCS2FJWOVCBsk87u4xkkAQAgXbBL8aboHQI2%2BReoQShC5arm3zLGGb3HPFVQ%2BtPONDw8R%2BDFtrnzBowzPdmPbZJoWu9v0QzV10xuE8WJ2FU9xSlSYAPj2PLuTsva9O0ZuBkXh4QmiQCrgasUTziNms2sHuJMIW8nfbMS7YL6ZBkyt2jBOZGCH81d9W46WrQyl4fCQ3p9h6bJZtOwDu%2FwyiqQU3%2FPYI5TA8g%2FVNvm1cvwQFWj%2BxW0%2FIbwpl7%2BUaBFe%2B1myLsE2vpFo8fz9lwyKA8PgoYI%2FoVlwg2WvSzSu4i9%2Fc8gzvQibeIRIZiiNEWogwgryi1QY6pgGz3lsxdjsZNqfBE4cjRu7AF%2BtalXsN6sxKfHN2n96fRp84DI4Qjwvwe0mdWduAam%2FeOZw4MH6QclCl1xBhwHcIfZFFnHx2KCcx%2FfvV7nlPJ8KGtQgNzvrpZ4mlGQgCIsN7x09J%2Bp6oETQDRoeX2aFjTpneXQVL9VdU%2FLbQee%2Fep4Xcrwroe1igeAv1YjDG2qtiXbLd4b6GGtMFUs1b1vUpwupr%2Fh5c&X-Amz-Signature=6df3189bee571b4d986cc0d103caff102654078fa8fe207cd239aaaaddc4ab8f&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

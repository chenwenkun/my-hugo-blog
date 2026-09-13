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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466VCA6YOQW%2F20260913%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260913T104613Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEAMaCXVzLXdlc3QtMiJHMEUCIC7Lz8Y6Zxssy9Nwplvcx7U7ZtPmC%2BG0aVrYv9foCsm3AiEA3cm5YIkSwxVDUKPBqq8ceJJ7jngxr3Jzt9Gutm9sqLkqiAQIzP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDCe7j4lqCYHEoAcybircA3TqfNwu82rlTddItFxeffGVQat1p5Qy0hKxUfSr50SbBbianasI%2Fyz5%2B4SFkEpDgeJYeFG7PCIc7KgEoC3OmxCf7QGayijB%2FgF4nZG3SUtAcs6qDIsk0F2xqxOLIk8v1IgwzlRbqK1X%2BaWh%2FRxLZ3hPb%2BNn8%2BWL2B2CaJ%2BgvYMQjElf3yfvvSu1ngAfsAsiFmo17UzfedIaWLDEKP8YbJ5FW%2FdzfByRkI1EmAbBn9QWAZ25o4y9TAid32l1n%2Bx3nkba7JaAYEuoXco1pOE4ny6oZzrHya8E5DQ604pCpf%2BBKt7x3dxsiYFABb2JvIURb%2BjdSqmDEO1NHfsMqA5RyR1QaQzmrblOV28YDL3299Y6wRrvdAAPc%2F%2FpGdSXjlI5IsTJeXSQ8%2FdmzxnRoLvIT26xYVh6mdwN%2Bi5%2BQ2J6YOhtitsFiPGS8qYPAJqxbwMBCjh8uucxz7QWsDISom7L7vO65pvA3RjpK1TSdtmKFzrWZeN3B4TrkvhuR89JXxiiJs4pPsAyMjhZZ%2FVqlw7nMcL9PPyJ0T7xuEl9wDMHbAecEj0bwrU%2BvUl4mZt51Z0Mbl9Zsp6FnJSi2iSrc%2FdbmKEISHIvpjRZqLoay1Kof2iQmcB%2FHsTZZzNhwjKxMPT0mdUGOqUBlsU%2Fj1Fmupm7O7qG8bbkWwx8QhiDDPEEJGMWQhlMb9mOgx5lxe5iF1cUo%2B5PKnk2UZsdTtBUS1eQfF%2F6f2ZKOjJYFOo6pkKHQxC9uB5doe6sySAsWxbUIe0Tnj3JoTjKGd4iqtnD2TBtJKHCVnm13BRvEcXitNlreZJ3r11DrkP1To4g6ix2%2B1Ur5WU%2Bdnv1952U5Gy8ftGYOG9f9jB%2BLhkPnvPS&X-Amz-Signature=ee6b5ec5d37eae55dbd27d7cf8db0f2d87f8488d9981ef4dd5327c956de5f134&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466VCA6YOQW%2F20260913%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260913T104613Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEAMaCXVzLXdlc3QtMiJHMEUCIC7Lz8Y6Zxssy9Nwplvcx7U7ZtPmC%2BG0aVrYv9foCsm3AiEA3cm5YIkSwxVDUKPBqq8ceJJ7jngxr3Jzt9Gutm9sqLkqiAQIzP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDCe7j4lqCYHEoAcybircA3TqfNwu82rlTddItFxeffGVQat1p5Qy0hKxUfSr50SbBbianasI%2Fyz5%2B4SFkEpDgeJYeFG7PCIc7KgEoC3OmxCf7QGayijB%2FgF4nZG3SUtAcs6qDIsk0F2xqxOLIk8v1IgwzlRbqK1X%2BaWh%2FRxLZ3hPb%2BNn8%2BWL2B2CaJ%2BgvYMQjElf3yfvvSu1ngAfsAsiFmo17UzfedIaWLDEKP8YbJ5FW%2FdzfByRkI1EmAbBn9QWAZ25o4y9TAid32l1n%2Bx3nkba7JaAYEuoXco1pOE4ny6oZzrHya8E5DQ604pCpf%2BBKt7x3dxsiYFABb2JvIURb%2BjdSqmDEO1NHfsMqA5RyR1QaQzmrblOV28YDL3299Y6wRrvdAAPc%2F%2FpGdSXjlI5IsTJeXSQ8%2FdmzxnRoLvIT26xYVh6mdwN%2Bi5%2BQ2J6YOhtitsFiPGS8qYPAJqxbwMBCjh8uucxz7QWsDISom7L7vO65pvA3RjpK1TSdtmKFzrWZeN3B4TrkvhuR89JXxiiJs4pPsAyMjhZZ%2FVqlw7nMcL9PPyJ0T7xuEl9wDMHbAecEj0bwrU%2BvUl4mZt51Z0Mbl9Zsp6FnJSi2iSrc%2FdbmKEISHIvpjRZqLoay1Kof2iQmcB%2FHsTZZzNhwjKxMPT0mdUGOqUBlsU%2Fj1Fmupm7O7qG8bbkWwx8QhiDDPEEJGMWQhlMb9mOgx5lxe5iF1cUo%2B5PKnk2UZsdTtBUS1eQfF%2F6f2ZKOjJYFOo6pkKHQxC9uB5doe6sySAsWxbUIe0Tnj3JoTjKGd4iqtnD2TBtJKHCVnm13BRvEcXitNlreZJ3r11DrkP1To4g6ix2%2B1Ur5WU%2Bdnv1952U5Gy8ftGYOG9f9jB%2BLhkPnvPS&X-Amz-Signature=54107ebe684925df2c12bde2b476f4ba3536f29152be827e59264973b7457fa3&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

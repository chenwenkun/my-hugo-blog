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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466YATDSZWF%2F20261102%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261102T031712Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEKr%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIH2Vnp4MzESTZUVfT%2Fb567NNs5grXM8QTeQjnynRDT1ZAiEAlK%2Bm3349avtvGHeI9ILhOi50V8uBELjJw2mQUHk0Egwq%2FwMIchAAGgw2Mzc0MjMxODM4MDUiDKKL88lY6GliT3pV4ircA0TZNkpZeYZk%2FDpXDUsynQiJezwPzcLyJ9sqS5w0PGthROId2aOXSX3ROFcZuROssW7KH3LOoNOhUnB5w5T0%2BR6M1K0Jkf3CUrTCQRkf28ALXXO6VE0sL%2B72PFMYv6lJlVxLrPYc5IbkONvF5C%2BSNmmJ6OpHC3RtJaWJKo%2FwlkyySYhBhl9%2FiqtwnaAWq9rGompOYcJocgNIFDDXGV4pIX%2FtemHEj7DdX%2B8sEmoLM2Lc%2FG1CypT7QpY2hY0mRT%2FS20yFIcqjjvhnvANvr6tRDTuUffNIQQWdCzRWd6C1wnU2pUKM1iH9%2FeRuCxTZBCk1bGuB%2BgxzPkfoaXC%2FQb%2Fun%2F%2Fj6fdmM53rA9obKNvZuss7JuWp6SQsrJOannZNJI%2FYxrvOOS6wuZ9BfZnOlDCHXJdlQ67FNltvG9XhwPecMONZv%2FcRmKydr4663uKdiAHWmhmcHTxxdpmA61Fgdo6eN7pOQTalxiO2kExdGucxtRFNaArltV4CaJhCQ%2FKkZjS8p3CHRhDic8posD95s2GrZ%2BVf4KUcnak2fq5AR%2Fpmcf9INDYzm2EMHHGW%2BV6dUbhLBKeNUHuEZB%2Ft2imD3XzBKZhLxP2DRztKHDMI9mnvxJc%2B%2BpwUotlNKw1NmHEyMMPYn9cGOqUBT%2BWbrXv7kaF8dzwZn1HdwX4sNenLUa4zbHNcjiz4vzwmCtJ6Ah0n7Iy1wsTqawjFOtG9O6Et2ljGdk3oQYKyCTUZhFZ2dSe2ZM93sIMgD4UG0aF4LOJWyjLUGdEn7Jr1O41MaxGiS%2F%2F4%2BFVwvXlexOXsRDp4iTk%2BZwUwmnIQYIRha14woNZkrneGmiHT8TYXiR0byq9Tr2%2BZRc4oRotB2cPtS1Pq&X-Amz-Signature=81a437fb996b7eed9107c75c0f8fea83e9e49eabe40e63571df4384b015a6d4e&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466YATDSZWF%2F20261102%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261102T031712Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEKr%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIH2Vnp4MzESTZUVfT%2Fb567NNs5grXM8QTeQjnynRDT1ZAiEAlK%2Bm3349avtvGHeI9ILhOi50V8uBELjJw2mQUHk0Egwq%2FwMIchAAGgw2Mzc0MjMxODM4MDUiDKKL88lY6GliT3pV4ircA0TZNkpZeYZk%2FDpXDUsynQiJezwPzcLyJ9sqS5w0PGthROId2aOXSX3ROFcZuROssW7KH3LOoNOhUnB5w5T0%2BR6M1K0Jkf3CUrTCQRkf28ALXXO6VE0sL%2B72PFMYv6lJlVxLrPYc5IbkONvF5C%2BSNmmJ6OpHC3RtJaWJKo%2FwlkyySYhBhl9%2FiqtwnaAWq9rGompOYcJocgNIFDDXGV4pIX%2FtemHEj7DdX%2B8sEmoLM2Lc%2FG1CypT7QpY2hY0mRT%2FS20yFIcqjjvhnvANvr6tRDTuUffNIQQWdCzRWd6C1wnU2pUKM1iH9%2FeRuCxTZBCk1bGuB%2BgxzPkfoaXC%2FQb%2Fun%2F%2Fj6fdmM53rA9obKNvZuss7JuWp6SQsrJOannZNJI%2FYxrvOOS6wuZ9BfZnOlDCHXJdlQ67FNltvG9XhwPecMONZv%2FcRmKydr4663uKdiAHWmhmcHTxxdpmA61Fgdo6eN7pOQTalxiO2kExdGucxtRFNaArltV4CaJhCQ%2FKkZjS8p3CHRhDic8posD95s2GrZ%2BVf4KUcnak2fq5AR%2Fpmcf9INDYzm2EMHHGW%2BV6dUbhLBKeNUHuEZB%2Ft2imD3XzBKZhLxP2DRztKHDMI9mnvxJc%2B%2BpwUotlNKw1NmHEyMMPYn9cGOqUBT%2BWbrXv7kaF8dzwZn1HdwX4sNenLUa4zbHNcjiz4vzwmCtJ6Ah0n7Iy1wsTqawjFOtG9O6Et2ljGdk3oQYKyCTUZhFZ2dSe2ZM93sIMgD4UG0aF4LOJWyjLUGdEn7Jr1O41MaxGiS%2F%2F4%2BFVwvXlexOXsRDp4iTk%2BZwUwmnIQYIRha14woNZkrneGmiHT8TYXiR0byq9Tr2%2BZRc4oRotB2cPtS1Pq&X-Amz-Signature=f689fe389f015e2fdf987e167060c53a4f5946e3427aac3875048b6004bdaf0e&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466SWA6WVBX%2F20260813%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260813T071010Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEBYaCXVzLXdlc3QtMiJHMEUCIQD44irf%2BJn3sweBRUIfbirR3rBMe%2BeuIS065GlmN4ukBgIgPi9B%2FmSyfSqL9zQ17NXclRb%2FL4o6GtrgotF7tbFMWikqiAQI3%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDP5%2BUaO1Dxkd5myPKSrcA5MpVLEGEv9R8K2dV%2B6zrfTftsYyt8dN63Ff43jd1bqOOew3YqdPFyYXjyh2ZEykiRqtqK9A5zsUFAtOVMFtez8RbtKZFB4Nk7O1lO%2Bi%2BhN58cm5Cpmi4Cd7qXxrwBttTXpkClQBvHKaZIfWwADPa3oQBx14PbF3fcqcBYYvWbrDNgLTcr3%2FYHHCT0rYcYPtglxGNJHQ1md%2B1HkA07mZYSQJEZtS8SKDVChd7n0F%2FuSzN4ocWAibcY%2FfaK5l79SQWsP7nQsIR1ETp1i1Ql8dxrNM3JCVHBErxyPzsyLeTZAzMoUQ3Isgk2IQ4E4aSQcxAf2d0cTzixJQQbwXPK7c9lEl3TFFMiZk6qZooKsioSt5EI%2FUq0lAiuBYft2FeLpW8XEj8pSDltnNuBIzE4A6Q4dX%2BQfF0RZNHxGKMcwkb4scbcUA80bmjLHPT2DpemxT5WrYeqFuGtOl%2FmXJR54yO174jg55%2F4I%2FNVmyKPhVhTaeW1a2jPU47X%2FwaxzKv5rNxdvXP5rNcHuci042jH5uIk42KMwrNdVKD9YIUctISYI8j7dcHQYTd%2B2q7tSakZ6SH992dYxkJn5hTpd4t6mkWvtNnMX%2BPs3PLWzOCct%2FV0%2BTztoBTzBlUl8AXqKuMOa69dMGOqUBJwiYc%2F2XCj1WFDzyCYUfOUEcTUHvbH1LvA4%2F1sboKRCwcQSEMVqDUilXmZl4TvYct1JgeLzq71paKPM04W5p2H1goLTPD1JroOWEUXb3Tsf4MmRzKtNCpEW0nCxWsllCZkhluitcXhdJMUAx26fWG8z%2BhM%2BKrpDG7yuHFzM4ocpNoQIqXAujnE%2FjYuu%2FVrzeYJNcugry%2BxBQ6poC9u1LLMcCGPgo&X-Amz-Signature=1a2b5420570150f46b74ffed0e6b4ab98fb50f03ea2593c225a4a033af3b4c98&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466SWA6WVBX%2F20260813%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260813T071010Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEBYaCXVzLXdlc3QtMiJHMEUCIQD44irf%2BJn3sweBRUIfbirR3rBMe%2BeuIS065GlmN4ukBgIgPi9B%2FmSyfSqL9zQ17NXclRb%2FL4o6GtrgotF7tbFMWikqiAQI3%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDP5%2BUaO1Dxkd5myPKSrcA5MpVLEGEv9R8K2dV%2B6zrfTftsYyt8dN63Ff43jd1bqOOew3YqdPFyYXjyh2ZEykiRqtqK9A5zsUFAtOVMFtez8RbtKZFB4Nk7O1lO%2Bi%2BhN58cm5Cpmi4Cd7qXxrwBttTXpkClQBvHKaZIfWwADPa3oQBx14PbF3fcqcBYYvWbrDNgLTcr3%2FYHHCT0rYcYPtglxGNJHQ1md%2B1HkA07mZYSQJEZtS8SKDVChd7n0F%2FuSzN4ocWAibcY%2FfaK5l79SQWsP7nQsIR1ETp1i1Ql8dxrNM3JCVHBErxyPzsyLeTZAzMoUQ3Isgk2IQ4E4aSQcxAf2d0cTzixJQQbwXPK7c9lEl3TFFMiZk6qZooKsioSt5EI%2FUq0lAiuBYft2FeLpW8XEj8pSDltnNuBIzE4A6Q4dX%2BQfF0RZNHxGKMcwkb4scbcUA80bmjLHPT2DpemxT5WrYeqFuGtOl%2FmXJR54yO174jg55%2F4I%2FNVmyKPhVhTaeW1a2jPU47X%2FwaxzKv5rNxdvXP5rNcHuci042jH5uIk42KMwrNdVKD9YIUctISYI8j7dcHQYTd%2B2q7tSakZ6SH992dYxkJn5hTpd4t6mkWvtNnMX%2BPs3PLWzOCct%2FV0%2BTztoBTzBlUl8AXqKuMOa69dMGOqUBJwiYc%2F2XCj1WFDzyCYUfOUEcTUHvbH1LvA4%2F1sboKRCwcQSEMVqDUilXmZl4TvYct1JgeLzq71paKPM04W5p2H1goLTPD1JroOWEUXb3Tsf4MmRzKtNCpEW0nCxWsllCZkhluitcXhdJMUAx26fWG8z%2BhM%2BKrpDG7yuHFzM4ocpNoQIqXAujnE%2FjYuu%2FVrzeYJNcugry%2BxBQ6poC9u1LLMcCGPgo&X-Amz-Signature=ec8d44e870680d20242b8c39a3d8ab7cc2c065034362af3f79f750cae2c20d20&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

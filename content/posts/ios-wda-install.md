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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466UWT5VIOD%2F20260904%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260904T101259Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjECkaCXVzLXdlc3QtMiJHMEUCIHSC5qA6sN95vEP0ZQKtPA1PAez8PnEiyF%2FvFuMgrYNQAiEAhqLeY7uR29OPu4s8od75TiklfrhZRUoo8HmDnkAqmLcqiAQI8v%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDOLs9PrS0J6qRXJmwCrcA1TYE3m2ZzfRDRT7U9mepfc8fo7UlRbimKknSWUnzKfMTtfalhkABZMKZToFyLvVvZJbdMsyg477WE2hHTufKpcaquzRAFpbqu1ifofUTHtcvOq0kBPLqJMoSVQznW9PAVEQK2LTV43sWZBy7U231OnfMVt1stqdBkLvEbM66hMwB%2BO%2Bzu8Fc%2FxY1X3Li3iMy%2FOCNqc9sLEMnyKOZoTz%2BNeRJ7p2RQizRcaC9MfscA0QrOS5Q8d%2FZ3eZg63OQrOuwvEjTwzBCTGOEHUsU5WIbIuf185VbGQ%2Fh%2F%2BXqg9VlZOTFlt86C8BG%2BHYu%2FQwwI8P%2F0g%2FSSyBLZFp9rag0k6J80FXNEHjrmM3eW7P9x5ZzXrGmXIqXgbhO4ibRS8OmtYG20RKsUDRcz7P1a3egMx47Cg34gJVbNJCgJLlTFi5mFaZwr%2FnkLFR4GS9B7dqiEQLxQQIYx1fJu7G2kNYTENMniX3LtmqlumAW%2BzzSXaxg4rULP4uwAI1oRfGg6YQOMS%2BcELpF7HFvMIus%2FYOK3%2FdbKtU508ARmXWVv7DKzqAqT7ie0KoQc5PojHpQgYY1fFoWJWTO%2FPazevU1HNkNjU%2Bv5icUYzLRXYVaNayy55pAYZh4H0UNvrsMwmBuj1NMIaD6tQGOqUBD3kmS7yuoHZIHMLs1l0jNsajbGtXJaAwHAdU7v%2B5FNKFx8HOaA4QAwoTNPGOP%2FP%2B8M4IYZ%2BeqBgxZTlDjQ1YfW7WQYxj24QUCCsC1l1Uj2yQxcB1k3TDTpsX6w8wkGvcM80aoxvOQKbLvwzmdZ31ZtmIvICvLQfcL7oG13RK%2FoL1UlnmyWd3hZDAPZbGSXHRx6rDT4k7BBRTtvSQpNdUJtYFxmQ1&X-Amz-Signature=725247506fbf40593ec53f902df0bb5f5350628a375972d2772cc87bbcb76f50&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466UWT5VIOD%2F20260904%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260904T101259Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjECkaCXVzLXdlc3QtMiJHMEUCIHSC5qA6sN95vEP0ZQKtPA1PAez8PnEiyF%2FvFuMgrYNQAiEAhqLeY7uR29OPu4s8od75TiklfrhZRUoo8HmDnkAqmLcqiAQI8v%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDOLs9PrS0J6qRXJmwCrcA1TYE3m2ZzfRDRT7U9mepfc8fo7UlRbimKknSWUnzKfMTtfalhkABZMKZToFyLvVvZJbdMsyg477WE2hHTufKpcaquzRAFpbqu1ifofUTHtcvOq0kBPLqJMoSVQznW9PAVEQK2LTV43sWZBy7U231OnfMVt1stqdBkLvEbM66hMwB%2BO%2Bzu8Fc%2FxY1X3Li3iMy%2FOCNqc9sLEMnyKOZoTz%2BNeRJ7p2RQizRcaC9MfscA0QrOS5Q8d%2FZ3eZg63OQrOuwvEjTwzBCTGOEHUsU5WIbIuf185VbGQ%2Fh%2F%2BXqg9VlZOTFlt86C8BG%2BHYu%2FQwwI8P%2F0g%2FSSyBLZFp9rag0k6J80FXNEHjrmM3eW7P9x5ZzXrGmXIqXgbhO4ibRS8OmtYG20RKsUDRcz7P1a3egMx47Cg34gJVbNJCgJLlTFi5mFaZwr%2FnkLFR4GS9B7dqiEQLxQQIYx1fJu7G2kNYTENMniX3LtmqlumAW%2BzzSXaxg4rULP4uwAI1oRfGg6YQOMS%2BcELpF7HFvMIus%2FYOK3%2FdbKtU508ARmXWVv7DKzqAqT7ie0KoQc5PojHpQgYY1fFoWJWTO%2FPazevU1HNkNjU%2Bv5icUYzLRXYVaNayy55pAYZh4H0UNvrsMwmBuj1NMIaD6tQGOqUBD3kmS7yuoHZIHMLs1l0jNsajbGtXJaAwHAdU7v%2B5FNKFx8HOaA4QAwoTNPGOP%2FP%2B8M4IYZ%2BeqBgxZTlDjQ1YfW7WQYxj24QUCCsC1l1Uj2yQxcB1k3TDTpsX6w8wkGvcM80aoxvOQKbLvwzmdZ31ZtmIvICvLQfcL7oG13RK%2FoL1UlnmyWd3hZDAPZbGSXHRx6rDT4k7BBRTtvSQpNdUJtYFxmQ1&X-Amz-Signature=6802fa6265d103a70459976cd260a349b900001043491a03693abdce1a906222&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

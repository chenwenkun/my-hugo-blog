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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663SXIAALO%2F20260823%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260823T003932Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCICg1gCm1J5QJLiVtRhr%2FPRQK9Nn%2BcSZjZo4uE1IwoD1fAiEAg3Coym4ndE43uwKXGJo%2BwrT8vp75LHwMiek%2BNLcgobgqiAQIyP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDP8bcUsiIxPwR36DqCrcAw948rbdyW020nbNo%2FMQvagqZIqGFEJfVeS9rwDZINNqbEPzs7UgVzbyjMyanfns4kdxjIXtWBkvc1e8mMOnHI0jWvuyej7b%2BDDD835CH11GrfA%2F7FpYYVkHzikO9ZpAH5pvDoEwgxgVZKuOjgOQ1DiMm2zptFAl8tkgsMAFm3%2F6ibuh88B26nu%2F%2BRSWwaS6vx3%2FMOneJZDJdTHPgWeuDCFnhTKMx1MKWnLebvZLsnZsd2hqb%2BQsGyqcVL7sVQ04Afx9I1SLKnKoe3bPXEfc6T8BBBVMiamc%2BKzCFXUyTHb3HUo4qHzcj0gxUnG6RijDYXGNdIr0QsY4bm%2FvoN56m8sEIowNTBBqD16D9LOB4lCknRebyjTev5HgwvLF4v02cRjYFSpuxM%2FJWFvE1wUbsMP8h3fESPJkgTbQ2Jlo%2BAtUQs%2Blf9zFAsxCkIiIi%2FiBhef0QZwItl%2BFSeAKdNOhtwEzqBZ5uaf0qsmxjQDfkyCZ7MEbQd0%2FIRFea%2FQxgKGRTuWq9pPanDYyk9SE0aZlrlI2Yk8tVxenK0FjJMegXKdvVg6vP%2F38Ab79rDn0WkJ0SGVwtMLtRIkdYyKTtOcNdZLC6qi6wjHErPIxi95Gs9n29UMWSLHZ10eGNVbMMJPTqNQGOqUBf2OYnZv2wH2XFwdLG0V8aq5Tgl1863R%2BOfCDM%2FruKKB2tdR4X9xO5b8O4znYXo7YILP5lWMR7Hox1yoob619BC1dBKsshoTiY6FcD4rRxhMx3pQHJvtg9NAxenMehIU8lDt%2F6Qh4p1MZY4YiIBhiWK%2F1A9PkvvIB2%2Ff8M9cuINIMRNgCRMKvuaaKFFxRPeYEE1R9M6T4s%2Fjw%2BBmiJ5NGRWkLT2n9&X-Amz-Signature=c33c512a8b624074e65ee6921ebe4c6d0f4461347c20a2113388e335e145c71a&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663SXIAALO%2F20260823%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260823T003932Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCICg1gCm1J5QJLiVtRhr%2FPRQK9Nn%2BcSZjZo4uE1IwoD1fAiEAg3Coym4ndE43uwKXGJo%2BwrT8vp75LHwMiek%2BNLcgobgqiAQIyP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDP8bcUsiIxPwR36DqCrcAw948rbdyW020nbNo%2FMQvagqZIqGFEJfVeS9rwDZINNqbEPzs7UgVzbyjMyanfns4kdxjIXtWBkvc1e8mMOnHI0jWvuyej7b%2BDDD835CH11GrfA%2F7FpYYVkHzikO9ZpAH5pvDoEwgxgVZKuOjgOQ1DiMm2zptFAl8tkgsMAFm3%2F6ibuh88B26nu%2F%2BRSWwaS6vx3%2FMOneJZDJdTHPgWeuDCFnhTKMx1MKWnLebvZLsnZsd2hqb%2BQsGyqcVL7sVQ04Afx9I1SLKnKoe3bPXEfc6T8BBBVMiamc%2BKzCFXUyTHb3HUo4qHzcj0gxUnG6RijDYXGNdIr0QsY4bm%2FvoN56m8sEIowNTBBqD16D9LOB4lCknRebyjTev5HgwvLF4v02cRjYFSpuxM%2FJWFvE1wUbsMP8h3fESPJkgTbQ2Jlo%2BAtUQs%2Blf9zFAsxCkIiIi%2FiBhef0QZwItl%2BFSeAKdNOhtwEzqBZ5uaf0qsmxjQDfkyCZ7MEbQd0%2FIRFea%2FQxgKGRTuWq9pPanDYyk9SE0aZlrlI2Yk8tVxenK0FjJMegXKdvVg6vP%2F38Ab79rDn0WkJ0SGVwtMLtRIkdYyKTtOcNdZLC6qi6wjHErPIxi95Gs9n29UMWSLHZ10eGNVbMMJPTqNQGOqUBf2OYnZv2wH2XFwdLG0V8aq5Tgl1863R%2BOfCDM%2FruKKB2tdR4X9xO5b8O4znYXo7YILP5lWMR7Hox1yoob619BC1dBKsshoTiY6FcD4rRxhMx3pQHJvtg9NAxenMehIU8lDt%2F6Qh4p1MZY4YiIBhiWK%2F1A9PkvvIB2%2Ff8M9cuINIMRNgCRMKvuaaKFFxRPeYEE1R9M6T4s%2Fjw%2BBmiJ5NGRWkLT2n9&X-Amz-Signature=56f03851432f0948c05849a8b0f26964c189d1f4c878a4d80bcccfc05765fead&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

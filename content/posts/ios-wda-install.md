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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466SUVUDGVD%2F20261011%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261011T024807Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJb%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIEJZ1jGBk%2FIy9ob5vxNhTldDbYKStUHPKb3tFOIKEzVPAiA0%2Bdj223H4v5dflBwN3NzWhZwQA7S%2BR5HDcL2Qk4S9Mir%2FAwheEAAaDDYzNzQyMzE4MzgwNSIMw9KZJS6kcbp%2FZ3uWKtwDwcXR4lGTqTJrpkettw7N9EVXCw6B7ap9G2gvwznHe4IQcwT5D4pxPmo%2Bk0zBTtkfkeLFht3DOIT8MYfqrlLfS1mFGEULOuoSM29uD3tYMFwIYLFl2%2FhfmvKW1iDzig3OLQwlFFr4uUNQLjSNvfltb3m5qK4mgTsyRAAIzsKvCFFl%2BojluzvNGiSNcXdlTimhMAcxkBr2faYYmmlWE4vgRI7PhNvydzYXJy8T8KUXn07kxKPmaZiHcCgVNRTKaxxpMdpmz86GolmPsHRrKgvTzksm0MZkyqGDGmtLjh5vNBpz00ElDkgPvVPKgLjFJm00pedWKKlvOfwou5R8SfGt6YURGJm9EKVdCRtiJVYWLpA2k888GmpN0w4aFOkadlf2EUCjU2jhQnD7g18MTfOKRigH4N9wIbvHdV%2FQSq1opQFnALLQcX0E%2FhdWx3w9N86gWteKwBP3mTLCCgBT3cbEatvB9F483a%2BXZZSFd97nUfw%2FHS0WvkVSyVjXW7q6LaM99yqypvSh4ArIi%2BuUqb%2BAtAX8EyUAqrQB14ikB45G6iYklMqrJgN%2BeR2fSK6xFGaeNxAtEMiUwCf0HEujrphIKP0vucf%2FHc5BJWOds36ZcnreQckJZguV8Os%2BiHEwndmq1gY6pgHa0NuDo4tZWqCNzCEJdWdsJ6BUfXN4bX2YdmiTwnr8%2BbKVuzpoB8XBHL6wPQWqG7s%2F%2FPAEjQKGP7faEZHcraGPmfWUIw9Roo6rFopJ%2By%2FGVdcFS4o4z6IZ3WUeINcDbZLnpsb%2BwKvrOO8NVJIdR17P3IcEGPjLTP%2Ba%2BEta4StPnrGu9JxzPDNEladLKvrPLn3U3yzJdqHMO8zjpGbC9nVLieIQOrzi&X-Amz-Signature=613c34ad31634d12f24824e1622b440aac807954b8edcf142e68ab4115caa231&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466SUVUDGVD%2F20261011%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261011T024807Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJb%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIEJZ1jGBk%2FIy9ob5vxNhTldDbYKStUHPKb3tFOIKEzVPAiA0%2Bdj223H4v5dflBwN3NzWhZwQA7S%2BR5HDcL2Qk4S9Mir%2FAwheEAAaDDYzNzQyMzE4MzgwNSIMw9KZJS6kcbp%2FZ3uWKtwDwcXR4lGTqTJrpkettw7N9EVXCw6B7ap9G2gvwznHe4IQcwT5D4pxPmo%2Bk0zBTtkfkeLFht3DOIT8MYfqrlLfS1mFGEULOuoSM29uD3tYMFwIYLFl2%2FhfmvKW1iDzig3OLQwlFFr4uUNQLjSNvfltb3m5qK4mgTsyRAAIzsKvCFFl%2BojluzvNGiSNcXdlTimhMAcxkBr2faYYmmlWE4vgRI7PhNvydzYXJy8T8KUXn07kxKPmaZiHcCgVNRTKaxxpMdpmz86GolmPsHRrKgvTzksm0MZkyqGDGmtLjh5vNBpz00ElDkgPvVPKgLjFJm00pedWKKlvOfwou5R8SfGt6YURGJm9EKVdCRtiJVYWLpA2k888GmpN0w4aFOkadlf2EUCjU2jhQnD7g18MTfOKRigH4N9wIbvHdV%2FQSq1opQFnALLQcX0E%2FhdWx3w9N86gWteKwBP3mTLCCgBT3cbEatvB9F483a%2BXZZSFd97nUfw%2FHS0WvkVSyVjXW7q6LaM99yqypvSh4ArIi%2BuUqb%2BAtAX8EyUAqrQB14ikB45G6iYklMqrJgN%2BeR2fSK6xFGaeNxAtEMiUwCf0HEujrphIKP0vucf%2FHc5BJWOds36ZcnreQckJZguV8Os%2BiHEwndmq1gY6pgHa0NuDo4tZWqCNzCEJdWdsJ6BUfXN4bX2YdmiTwnr8%2BbKVuzpoB8XBHL6wPQWqG7s%2F%2FPAEjQKGP7faEZHcraGPmfWUIw9Roo6rFopJ%2By%2FGVdcFS4o4z6IZ3WUeINcDbZLnpsb%2BwKvrOO8NVJIdR17P3IcEGPjLTP%2Ba%2BEta4StPnrGu9JxzPDNEladLKvrPLn3U3yzJdqHMO8zjpGbC9nVLieIQOrzi&X-Amz-Signature=52430dee09e6a1c8b689d3674bd826fcb79e5261f33856dab851dcbf0369db55&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

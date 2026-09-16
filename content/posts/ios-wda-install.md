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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4665QUBDQAG%2F20260916%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260916T203612Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEFQaCXVzLXdlc3QtMiJHMEUCIDIfxluHIv9A7pkN2s8pBowG0h02JPRA0uOK2wGAovevAiEAu3ZyitmdjBcUWJd0BzeOUQmROQzngsQ6QEFeYsJc7XIq%2FwMIHRAAGgw2Mzc0MjMxODM4MDUiDD1v1MdFAFYv%2BrlTfircA0UBn9I%2B4o5Kz1M8%2BC0qQa6SK8rK8bK30ZRxedHIZGUY1FRro7On%2FOBCVZ7FBQH%2FLQS8RsRcLm3HsEHideLGOl%2BjbqZL4GvZIKaLKkpttjgueVqeTT4jGVxvv8a7spThNPWdYfWMVwCmqjuzNj%2FAH4pBJb4PVSQ6L5hyKUBXmUjG26S51dosY2hlLSpIH7ikQAkel4yrLM5nj5%2FWL4C9qA659kZPg%2B34FAnHvN3DiPfDmSQZVaDS%2BOcst7VWGsTK%2F5svuU5cDa9cVLbOi8eJa5guCrcTCY8aj%2BNJaCMYBCap0qrmvDz20IfCQ33%2By9duK0qWXTOfVMGrs%2BRNKrtG6kmizOLHei98bnTj49paDs%2BSJXFF3cbeq0JxQFnmz7zN%2BzooswgdBO7lh4yd%2FoPQl9yKkAhbT9GpI95XOwwb0Ik%2FzFe6nRjg78ewp1muqP8e1rcY49LXvXj6OLXwj6mCcF52v3zoN06LRqsFvgn38N1Sglq2mxUiQhWBcmgxekTNjiQwoYwANw3%2BZgFg%2FcrrjNKfvtEBKG3DcjlLNYLOGaWTgAHdLsts%2FnwYas68l8lxtDVyL3NCeKGs6Zc0mfi45dRAhafVhZ%2FJMK9wkT6k75ZbmVJJU94eYPIiMIfzMNDcq9UGOqUBYTSrxSUpcHqxoAWohvNzhIPJteDvXEE5Tjx5x6hVJdLMdWkeE73Y6hx5zCIwvORGxf5jdOO8J3FGybixFHdlyoJr8RaPpaLweJ7xQWsalBSWwy4HuPrOGc6uDUEF1oegr09e0%2Fwa50sToOw7jNxg6V2dylJd0iXCPSwHxHgDpXs%2FTpV0h99tjQfG3TpmowPGtYvAcNeoqpy1nD%2BVpG31CM8RMPUo&X-Amz-Signature=749f8d89518e6f09d84aa350c7af67d067479525e20019751e12425160c25e3b&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4665QUBDQAG%2F20260916%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260916T203612Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEFQaCXVzLXdlc3QtMiJHMEUCIDIfxluHIv9A7pkN2s8pBowG0h02JPRA0uOK2wGAovevAiEAu3ZyitmdjBcUWJd0BzeOUQmROQzngsQ6QEFeYsJc7XIq%2FwMIHRAAGgw2Mzc0MjMxODM4MDUiDD1v1MdFAFYv%2BrlTfircA0UBn9I%2B4o5Kz1M8%2BC0qQa6SK8rK8bK30ZRxedHIZGUY1FRro7On%2FOBCVZ7FBQH%2FLQS8RsRcLm3HsEHideLGOl%2BjbqZL4GvZIKaLKkpttjgueVqeTT4jGVxvv8a7spThNPWdYfWMVwCmqjuzNj%2FAH4pBJb4PVSQ6L5hyKUBXmUjG26S51dosY2hlLSpIH7ikQAkel4yrLM5nj5%2FWL4C9qA659kZPg%2B34FAnHvN3DiPfDmSQZVaDS%2BOcst7VWGsTK%2F5svuU5cDa9cVLbOi8eJa5guCrcTCY8aj%2BNJaCMYBCap0qrmvDz20IfCQ33%2By9duK0qWXTOfVMGrs%2BRNKrtG6kmizOLHei98bnTj49paDs%2BSJXFF3cbeq0JxQFnmz7zN%2BzooswgdBO7lh4yd%2FoPQl9yKkAhbT9GpI95XOwwb0Ik%2FzFe6nRjg78ewp1muqP8e1rcY49LXvXj6OLXwj6mCcF52v3zoN06LRqsFvgn38N1Sglq2mxUiQhWBcmgxekTNjiQwoYwANw3%2BZgFg%2FcrrjNKfvtEBKG3DcjlLNYLOGaWTgAHdLsts%2FnwYas68l8lxtDVyL3NCeKGs6Zc0mfi45dRAhafVhZ%2FJMK9wkT6k75ZbmVJJU94eYPIiMIfzMNDcq9UGOqUBYTSrxSUpcHqxoAWohvNzhIPJteDvXEE5Tjx5x6hVJdLMdWkeE73Y6hx5zCIwvORGxf5jdOO8J3FGybixFHdlyoJr8RaPpaLweJ7xQWsalBSWwy4HuPrOGc6uDUEF1oegr09e0%2Fwa50sToOw7jNxg6V2dylJd0iXCPSwHxHgDpXs%2FTpV0h99tjQfG3TpmowPGtYvAcNeoqpy1nD%2BVpG31CM8RMPUo&X-Amz-Signature=50f049c885cb76a6ac590e81f18f99539372dad710dc7741686e5e3a70af764d&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

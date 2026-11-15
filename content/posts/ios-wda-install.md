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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466SLRTQWZL%2F20261115%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261115T221529Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEPX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQC2Ngd9gaIHDdt8x5GEvZR0bB9zTY9pXfEd1rNFyLq1IwIgdF0m5MiorjNoi6X%2FX2H3jLAcX8uS1tLpA1ehR7jks2YqiAQIvv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDOgQsXvyc%2F%2BVRKShoircA1JYTXr%2BmvZN3DHHtSyIDyuUdo3wIIUuvAEbjOu9j06P4G3P53M7jRYaWJk6jkn4XXHzO58Tv48YCOHFYvaq41%2BD%2BpN487U89VQ%2F1gKCrGxAh20OsZQO%2FIS420VaDaJAl5c%2FnR9%2FRmeO7T6O4pMarXwtwBsqFJbDWyOyPEn1gSG%2BSvHgrIR%2BCh%2F4uAzEWZs8YG5qXrw870rNMF%2F0MXNYw4YyhBsFh3PzwhWHYdXjWnLDpLA%2F9sRNiZxvelxsihjA%2BrlEjXgq4lX3IRtCZ3TmQPIlLygMjLUENuFNlQALzCyImDlxt1u0po9Wfm6Y23daYW2lnMCJ6Jpr4hHC3e7Gl%2FylnebfKr9nV1IwVVmdscn97hCEs13glhS8660W1tPN6pXCUwqL%2Bt81GHEOy54h0TjWcJtbndKv4LKqTM%2BitZIa5ysmpDeciqEdsEzsoJ77zVzp4fHw7tt0abeTaTEmofTWmlh2acpMbeNhB%2FxqciWG4zCQVpuT%2FpmtSmjFAoexiQKaWvJcWkvZUPJaE%2F7e%2BNrLdqsuNHUr2cIb4XmOdXhiXlI0eQmKjukUIadiiV0%2BhPjmt15QTZFK6YCgLzQN41qTSTUgYeNP2iZZsVxte0CaZdTbwcibDxnkXwUYMN%2FC6NcGOqUBmRd0WzRYuZQnJGQssPTRR9mV09uqDzy3G%2BRR58Hyg1fGUuWRHj67vQ2UlqKK2Qdd5Zht%2BG2Cd6VpkOQQ%2BFtRR0gqKPjrEJ5ZjMcAdUCBBNgCZORhhAQX7J3iWlkXcj5gldgaubyMqfxE4HfsjEWQVMXv%2BItkfuO0c1xHu2JogATZHepthe9%2B77gJonz64FE7svTCjMb%2FRJsG7AYE%2BsNl6l%2BWVNrt&X-Amz-Signature=60a49ecdc0f4eeea20cff9caf46af4633bc92ba7e32ecbc030bd7ea47a9d27dd&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466SLRTQWZL%2F20261115%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261115T221529Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEPX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQC2Ngd9gaIHDdt8x5GEvZR0bB9zTY9pXfEd1rNFyLq1IwIgdF0m5MiorjNoi6X%2FX2H3jLAcX8uS1tLpA1ehR7jks2YqiAQIvv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDOgQsXvyc%2F%2BVRKShoircA1JYTXr%2BmvZN3DHHtSyIDyuUdo3wIIUuvAEbjOu9j06P4G3P53M7jRYaWJk6jkn4XXHzO58Tv48YCOHFYvaq41%2BD%2BpN487U89VQ%2F1gKCrGxAh20OsZQO%2FIS420VaDaJAl5c%2FnR9%2FRmeO7T6O4pMarXwtwBsqFJbDWyOyPEn1gSG%2BSvHgrIR%2BCh%2F4uAzEWZs8YG5qXrw870rNMF%2F0MXNYw4YyhBsFh3PzwhWHYdXjWnLDpLA%2F9sRNiZxvelxsihjA%2BrlEjXgq4lX3IRtCZ3TmQPIlLygMjLUENuFNlQALzCyImDlxt1u0po9Wfm6Y23daYW2lnMCJ6Jpr4hHC3e7Gl%2FylnebfKr9nV1IwVVmdscn97hCEs13glhS8660W1tPN6pXCUwqL%2Bt81GHEOy54h0TjWcJtbndKv4LKqTM%2BitZIa5ysmpDeciqEdsEzsoJ77zVzp4fHw7tt0abeTaTEmofTWmlh2acpMbeNhB%2FxqciWG4zCQVpuT%2FpmtSmjFAoexiQKaWvJcWkvZUPJaE%2F7e%2BNrLdqsuNHUr2cIb4XmOdXhiXlI0eQmKjukUIadiiV0%2BhPjmt15QTZFK6YCgLzQN41qTSTUgYeNP2iZZsVxte0CaZdTbwcibDxnkXwUYMN%2FC6NcGOqUBmRd0WzRYuZQnJGQssPTRR9mV09uqDzy3G%2BRR58Hyg1fGUuWRHj67vQ2UlqKK2Qdd5Zht%2BG2Cd6VpkOQQ%2BFtRR0gqKPjrEJ5ZjMcAdUCBBNgCZORhhAQX7J3iWlkXcj5gldgaubyMqfxE4HfsjEWQVMXv%2BItkfuO0c1xHu2JogATZHepthe9%2B77gJonz64FE7svTCjMb%2FRJsG7AYE%2BsNl6l%2BWVNrt&X-Amz-Signature=2473024ec8be19c3bcb7495a61dda71f63b7d1c9a58a1493548a42e431783b3b&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663UIWZWZL%2F20260930%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260930T213819Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEKT%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJFMEMCH3%2FSIRcC%2B1xjiDMeSk3t077RupIiuM1rTuAq5AM9qykCIBorx0UXNorfnjcrxiUZIfRmJYqvuu9lVHFylsFdVk%2BIKv8DCG0QABoMNjM3NDIzMTgzODA1IgwvAZDpYeum9QALtPwq3AOLrF7%2Bo1ja3ykmj0ez9pKzorMrqunoKerX7UNyPGsJpsoXgSIbubh2cZEe%2BSTblUC8TFVXq8Sy7ZUx4zgtX1OAcWKwWpvBAy1cpyLnHlzd6zZAN5eyLK0dAZR5m%2BE1IljIBVcSz4mzb7cOXKnwqDU1V3vNLiyiAXkQ3vu2efju3zCgnwyEc21V%2BYBAUha5xhyOrQ1oLyNqwfj%2FFVUIJ245c1mcIb5bqqv23DkLXOwCpb7Bls9%2FFUBUZlBqAKJ%2FPcmRcRqKp7kPhukaFv3C1kdISMn2kjBZPDUJOGMJ2ZjhD7m5XZGz45%2FKipQoGidSw%2Fg97IQLWlWDlXUhuW3DDyN5%2BSNTttJrR3LW%2F5jXW%2BWJIrdoenuHEarPiCzF5Rhbbt6ZRPxs%2F%2B4ZZhWU6VTFX%2BPDb6wraj9ZtYUzS8A5gmFLTE5PYt%2B0TSS5rQc4JTGNvcvwiUHv%2BllmgViN8fM9dqZk56xva%2FpRCRE9BuhQS1zbnM8FhpuV8vKuLCwMKmC1CzaNLUNtbbADP5hhfgfm4CulFt1cz5BWRcZ7w1T1eDNcJqf%2B8DVyU2J1Kc%2Fcl%2FIv%2BbuqZNe%2FJYcUODoXXGJT1HzDIJBkigmKyaw75VI2Uwe7LDGKOmOGbrAIDl9bczDs2fXVBjqnAWkw6EFJ2RO1tpU39M0diEdX4JFYqnOBdNXb879XmeZggwK%2B2k19IJ7vh8GFvhK5ZwOFmRVsoxfyznNag3Lcu8SV3HYNjFzK52bkzcbf5vAjg8ievpT4T%2BZw1QMen4jwpDejaegagffnyXHksGZdowjuYsKJe4GzIJasp8qfoizL57usqfU7TnwK%2Bt9fN61OEvKx7aBuYcFpSpz%2BZiS6w5X4w%2FjoClq8&X-Amz-Signature=f38728b913ca4570d43ce9e296d7613e32f4d66a2b7711e90a06cb73293583aa&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663UIWZWZL%2F20260930%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260930T213819Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEKT%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJFMEMCH3%2FSIRcC%2B1xjiDMeSk3t077RupIiuM1rTuAq5AM9qykCIBorx0UXNorfnjcrxiUZIfRmJYqvuu9lVHFylsFdVk%2BIKv8DCG0QABoMNjM3NDIzMTgzODA1IgwvAZDpYeum9QALtPwq3AOLrF7%2Bo1ja3ykmj0ez9pKzorMrqunoKerX7UNyPGsJpsoXgSIbubh2cZEe%2BSTblUC8TFVXq8Sy7ZUx4zgtX1OAcWKwWpvBAy1cpyLnHlzd6zZAN5eyLK0dAZR5m%2BE1IljIBVcSz4mzb7cOXKnwqDU1V3vNLiyiAXkQ3vu2efju3zCgnwyEc21V%2BYBAUha5xhyOrQ1oLyNqwfj%2FFVUIJ245c1mcIb5bqqv23DkLXOwCpb7Bls9%2FFUBUZlBqAKJ%2FPcmRcRqKp7kPhukaFv3C1kdISMn2kjBZPDUJOGMJ2ZjhD7m5XZGz45%2FKipQoGidSw%2Fg97IQLWlWDlXUhuW3DDyN5%2BSNTttJrR3LW%2F5jXW%2BWJIrdoenuHEarPiCzF5Rhbbt6ZRPxs%2F%2B4ZZhWU6VTFX%2BPDb6wraj9ZtYUzS8A5gmFLTE5PYt%2B0TSS5rQc4JTGNvcvwiUHv%2BllmgViN8fM9dqZk56xva%2FpRCRE9BuhQS1zbnM8FhpuV8vKuLCwMKmC1CzaNLUNtbbADP5hhfgfm4CulFt1cz5BWRcZ7w1T1eDNcJqf%2B8DVyU2J1Kc%2Fcl%2FIv%2BbuqZNe%2FJYcUODoXXGJT1HzDIJBkigmKyaw75VI2Uwe7LDGKOmOGbrAIDl9bczDs2fXVBjqnAWkw6EFJ2RO1tpU39M0diEdX4JFYqnOBdNXb879XmeZggwK%2B2k19IJ7vh8GFvhK5ZwOFmRVsoxfyznNag3Lcu8SV3HYNjFzK52bkzcbf5vAjg8ievpT4T%2BZw1QMen4jwpDejaegagffnyXHksGZdowjuYsKJe4GzIJasp8qfoizL57usqfU7TnwK%2Bt9fN61OEvKx7aBuYcFpSpz%2BZiS6w5X4w%2FjoClq8&X-Amz-Signature=417a18954f186cef3fc205cea9309aa7427970176b499be7f2be329592ab115e&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

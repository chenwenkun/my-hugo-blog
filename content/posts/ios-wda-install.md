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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4667YO7RZTJ%2F20260908%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260908T101507Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEIj%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIAmajWwjU%2FNnRlWGdEb4ya5Zo46HKbpPYD6nsKA1HGDrAiEArEKSbeMC8UZp4uDfY0SoxlHXgIKOh800ODToAkfO%2BSEq%2FwMIURAAGgw2Mzc0MjMxODM4MDUiDPYCrGfSJqirGBEqLyrcA1Ed5tj7pvgSyuypIIPdVK1szohlw61DGjkgfJoVZLzghRVfXy7mo0K8gfrQyHJYcTKRG5%2B57lVCJI6OGaRbY9i%2Ffzm%2FdDsxy5ZL5UUqXFJLWrHObXqiz6XIs4kG%2FwPcvbd4rxzcdCKN%2F2pM219r7G6ctitsEOyP814orVrAb00V5EMFjYNxd4a8ocuwiRUPRv8kqYIVuVFHtEQbZZgtQ77OO9fselAIxStsBKK4QCzxfPZ%2B%2Fa9toKAIgdZUQgTpKV9KakyZs9eNyWsrwtj0HC7Qgl46RQ0MJOdErWgWlhKjswBHppFrzxInBeQix8lYuZUzY69i%2FtkkCUyHiFudy5YVEm%2B3YfTa842MgLrMqzmBXPX%2F%2B2mDrRD%2Fu7BcGDR%2FEVemHu62cnizEd8rgh9Gf87G%2FvFs8J7YDoCvtaxS6YPJjyzsvP%2BxNPUMAcgt7zb7jzfrkqSbfofz0Ktj5R1y6aNUtPcU9nOSjQvM9NuGAx6cXq%2BAz8sCY4I7GhmxyeNnY5whT6yQ%2FLQpf7YeU90PzrlZCjUWN%2BxGviXTyjXNfNf7rj8DMHGhD68gHLIH4sLntVbkXWhGz0xJNhwU1xgI1b3TRfohEzmVyzFB5RzTzqqPYjiZD4Ve3XWKS3T8MOGI%2F9QGOqUBlNeoXwJsWQU4lp%2BXKZ4UD9DBIn7QoNCMJbWI0BQIVsluTvekX%2FwZQrhUYBiXVjKIYyrvhpJm7%2BLFuyN8eTKlOTWxZ93Y5LZwqyJaBOi70cx2ACLQmc2K8%2B4c0PgnUCh0mjJQ%2BTScPs43Iuh%2FgOD8xL1gCcgHcBy6ZmqIf9wrGNXoCMEWFnx1TYk7s7FkCEWqUWW8lxsvcPDVQ9MoHe5rBHTwNiBw&X-Amz-Signature=75cfbe47170109e965647dec887f1d9e7408854de00ffd1c7c91a6c5750221e7&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4667YO7RZTJ%2F20260908%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260908T101507Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEIj%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIAmajWwjU%2FNnRlWGdEb4ya5Zo46HKbpPYD6nsKA1HGDrAiEArEKSbeMC8UZp4uDfY0SoxlHXgIKOh800ODToAkfO%2BSEq%2FwMIURAAGgw2Mzc0MjMxODM4MDUiDPYCrGfSJqirGBEqLyrcA1Ed5tj7pvgSyuypIIPdVK1szohlw61DGjkgfJoVZLzghRVfXy7mo0K8gfrQyHJYcTKRG5%2B57lVCJI6OGaRbY9i%2Ffzm%2FdDsxy5ZL5UUqXFJLWrHObXqiz6XIs4kG%2FwPcvbd4rxzcdCKN%2F2pM219r7G6ctitsEOyP814orVrAb00V5EMFjYNxd4a8ocuwiRUPRv8kqYIVuVFHtEQbZZgtQ77OO9fselAIxStsBKK4QCzxfPZ%2B%2Fa9toKAIgdZUQgTpKV9KakyZs9eNyWsrwtj0HC7Qgl46RQ0MJOdErWgWlhKjswBHppFrzxInBeQix8lYuZUzY69i%2FtkkCUyHiFudy5YVEm%2B3YfTa842MgLrMqzmBXPX%2F%2B2mDrRD%2Fu7BcGDR%2FEVemHu62cnizEd8rgh9Gf87G%2FvFs8J7YDoCvtaxS6YPJjyzsvP%2BxNPUMAcgt7zb7jzfrkqSbfofz0Ktj5R1y6aNUtPcU9nOSjQvM9NuGAx6cXq%2BAz8sCY4I7GhmxyeNnY5whT6yQ%2FLQpf7YeU90PzrlZCjUWN%2BxGviXTyjXNfNf7rj8DMHGhD68gHLIH4sLntVbkXWhGz0xJNhwU1xgI1b3TRfohEzmVyzFB5RzTzqqPYjiZD4Ve3XWKS3T8MOGI%2F9QGOqUBlNeoXwJsWQU4lp%2BXKZ4UD9DBIn7QoNCMJbWI0BQIVsluTvekX%2FwZQrhUYBiXVjKIYyrvhpJm7%2BLFuyN8eTKlOTWxZ93Y5LZwqyJaBOi70cx2ACLQmc2K8%2B4c0PgnUCh0mjJQ%2BTScPs43Iuh%2FgOD8xL1gCcgHcBy6ZmqIf9wrGNXoCMEWFnx1TYk7s7FkCEWqUWW8lxsvcPDVQ9MoHe5rBHTwNiBw&X-Amz-Signature=70910c1b28e0cb145661eafa7429c59665c84cdc36afefbe42a5c02dc3ab3918&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

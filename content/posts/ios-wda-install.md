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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466VOVLMKFC%2F20261016%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261016T020852Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEBIaCXVzLXdlc3QtMiJHMEUCICgxj%2BGzZJo6nD88dhEy59wfWulgXdpGmFgzTYxSy99yAiEAvoTQ5A6aSquocGrDJY1rH3HARclchmT5aCMgN%2B%2FD3MQqiAQI2v%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDNcjDe2qN%2FDnrDuWkyrcA3g%2F15qzoOIbSTKzSwWxfzmTTWqchDZ9H1xnLrrZkcqcLznr%2BXzk7HI4HOLV%2B10WymNYHxbee6Y1P1%2Fz8nhCLDOxoGs2QT86t7Zup1HEGdgoIY3GfqARu5eJ6atmhhifGqRxb1hQNksvgArgYHSItIFe78JKg7iHdM4Qnt3Wbuo%2BL%2Fbe2%2BuClsGtf6RUxns7f0Pnt%2Buqe6HpTztdpGHjt4DxGrhN%2Bwsy4Fw8%2BNzfhgSxMfiV9J2vkqiKR8mKvYXsF%2BSY%2B5p%2BWy7rIyI%2FrJfBgxtmaPv%2FSVAITnhAJ2Qq5yUTiBCrpNfGOo1BjCQP%2FBOvJaTFsNUFuNhDLe3J3h6YXTfDUEf3nUpazVar2dCBpSyx5MSC9Xa6IiHdTCiUkKA33I0itp8L%2BVjrh2ah4E8vwJCwMoA4jJoN%2FPi0ZZ4MDcswi13dh14VlANe450ovW6eA53tmVj3txK086ZrmEvgWipIrH9SEjVkZBBnOvNyLG61eIf2Os%2BdFMBm5TjRNjW1QqaIchrnDD9jKyettS%2FtUXqREqh%2FRZTqvYjW%2BwakDsfcza5Itl6o5HKlNgzLBFq2j%2F4XEQxcSsVZRW%2BpyvOTO6D3NhncLRRZkAaWzmblpuEOJg57nNZgtOdiE9YDMKKGxtYGOqUBZlOtPBirgDdT99eLBk4Jo6TgRIMuYG%2Br5p9UI4ac2wJoADQkf9TQDlJnIZkpdKe3fVJT63MpBb4IG606gTu3KdwrIwQKaZG6a9tBrxqwWS61UlOBAUuWD76sLNw5%2Fozd%2Bp0fpQOeweLoPcTTpvtjRIOg0TEucpWaaFmoo7vpSGVB5XPdplou5hEBZgGp7Zc9qZCNDhS0bfoJC7hx7K45JbUn%2FyYi&X-Amz-Signature=d2f52818da45857aa65ebc40824be68e9d4eab27e8ea8e392908a8684f2a4d8c&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466VOVLMKFC%2F20261016%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261016T020852Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEBIaCXVzLXdlc3QtMiJHMEUCICgxj%2BGzZJo6nD88dhEy59wfWulgXdpGmFgzTYxSy99yAiEAvoTQ5A6aSquocGrDJY1rH3HARclchmT5aCMgN%2B%2FD3MQqiAQI2v%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDNcjDe2qN%2FDnrDuWkyrcA3g%2F15qzoOIbSTKzSwWxfzmTTWqchDZ9H1xnLrrZkcqcLznr%2BXzk7HI4HOLV%2B10WymNYHxbee6Y1P1%2Fz8nhCLDOxoGs2QT86t7Zup1HEGdgoIY3GfqARu5eJ6atmhhifGqRxb1hQNksvgArgYHSItIFe78JKg7iHdM4Qnt3Wbuo%2BL%2Fbe2%2BuClsGtf6RUxns7f0Pnt%2Buqe6HpTztdpGHjt4DxGrhN%2Bwsy4Fw8%2BNzfhgSxMfiV9J2vkqiKR8mKvYXsF%2BSY%2B5p%2BWy7rIyI%2FrJfBgxtmaPv%2FSVAITnhAJ2Qq5yUTiBCrpNfGOo1BjCQP%2FBOvJaTFsNUFuNhDLe3J3h6YXTfDUEf3nUpazVar2dCBpSyx5MSC9Xa6IiHdTCiUkKA33I0itp8L%2BVjrh2ah4E8vwJCwMoA4jJoN%2FPi0ZZ4MDcswi13dh14VlANe450ovW6eA53tmVj3txK086ZrmEvgWipIrH9SEjVkZBBnOvNyLG61eIf2Os%2BdFMBm5TjRNjW1QqaIchrnDD9jKyettS%2FtUXqREqh%2FRZTqvYjW%2BwakDsfcza5Itl6o5HKlNgzLBFq2j%2F4XEQxcSsVZRW%2BpyvOTO6D3NhncLRRZkAaWzmblpuEOJg57nNZgtOdiE9YDMKKGxtYGOqUBZlOtPBirgDdT99eLBk4Jo6TgRIMuYG%2Br5p9UI4ac2wJoADQkf9TQDlJnIZkpdKe3fVJT63MpBb4IG606gTu3KdwrIwQKaZG6a9tBrxqwWS61UlOBAUuWD76sLNw5%2Fozd%2Bp0fpQOeweLoPcTTpvtjRIOg0TEucpWaaFmoo7vpSGVB5XPdplou5hEBZgGp7Zc9qZCNDhS0bfoJC7hx7K45JbUn%2FyYi&X-Amz-Signature=335a1afc4ed3b97f472cd6dd00f021efa4b57638dce65250046dfa7ca56c394e&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

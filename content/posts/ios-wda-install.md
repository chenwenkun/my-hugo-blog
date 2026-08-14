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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB46646HEQ3YB%2F20260814%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260814T183919Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEDsaCXVzLXdlc3QtMiJHMEUCIBvK1wEHiT8VDibZ6a0eFze%2FozGPVbVKreZWfoKnpdnBAiEAtjGQhOojoK65ia7wplPbGEPhbPum3GXdS%2Bg1C6hV6f4q%2FwMIAxAAGgw2Mzc0MjMxODM4MDUiDEXNblBwyHUA4zajHSrcA0v%2BMZkFO5NDSH8F9VFp0HegiyVsXkHz%2BkYz7JI%2BhL3BDUXNEqrbecJAPxgLL9BGoZrJfs49lid3t3vnqs%2BqkVsnVPThDdPC27pmloD2qxAkd3iWsrNoHIJieZdiwWuZqREa5OcckrNMbrGNV37zOiElIAHQKJl0fBu%2FTq3fazYgYfgtzsMGzsO6s%2FbHwWe29KzuMuBAxl7rNJ405oP%2F78zI0uWS988TKW1%2FMXvszIQb0UgbS3NklRaSl5O3sZLqbfg2ax3Ffi80ydxYiJQPNQriA9I%2B0FvPzHGB%2FlyRmEYQLvGN%2BVl5Z54snCt%2BOj%2Ft8vm8foaIOQRPyIZJZcw2jU%2B5rdjYdxuqKbVoaPpOu1SR67TM%2BbRlz%2FLq85gbgFxuITTb%2FAS1bKBT58zZy%2FDF7jUwciDiTjs6EhDqapKKfPJ435lXbn%2FkCoukhg6T3pkZO7%2B1roORghH%2FCpNLY47lo6HLQ7L9mM8dHmsz8dLa5EfinVI8k2YFHaoKvaEofniGUv5DDM3QFsSMt6TBbKoo1XsqR6zJzrvaFy%2BgC2mzFCab%2BjJXWpF5%2F6qofg3ZXeveAkCluwCNzlSkwUPpIIPOFUASyr91BZV9OBIN9E8Z3QwfkKK5rhLt07WvLajrMNa4%2FdMGOqUB%2BuZ1SLVQ5neNd86VqZs1pnZZxl0xcb7e9FzxkkkbDjdQSGSzbXIq0Ify8SOqVsQKGQ10WgAktmi9Qk%2B67XxA6yD4X1TxwxvV4CgUANMFwOeMJJRL6h77AruCUnryFi7C462RPqZNQP8X0g2OyzYqmnAHJB%2BesgvPD4JvMbXpOwGyqMUuqsqb8BNf%2FJwyW1l1Q7dnsr6G57DGkKA8%2BnSNJWOev6Ua&X-Amz-Signature=1f502310d98c1cf9901f6a7a98167d2d983d827ea4d5dc7200725a9e8d866d10&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB46646HEQ3YB%2F20260814%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260814T183919Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEDsaCXVzLXdlc3QtMiJHMEUCIBvK1wEHiT8VDibZ6a0eFze%2FozGPVbVKreZWfoKnpdnBAiEAtjGQhOojoK65ia7wplPbGEPhbPum3GXdS%2Bg1C6hV6f4q%2FwMIAxAAGgw2Mzc0MjMxODM4MDUiDEXNblBwyHUA4zajHSrcA0v%2BMZkFO5NDSH8F9VFp0HegiyVsXkHz%2BkYz7JI%2BhL3BDUXNEqrbecJAPxgLL9BGoZrJfs49lid3t3vnqs%2BqkVsnVPThDdPC27pmloD2qxAkd3iWsrNoHIJieZdiwWuZqREa5OcckrNMbrGNV37zOiElIAHQKJl0fBu%2FTq3fazYgYfgtzsMGzsO6s%2FbHwWe29KzuMuBAxl7rNJ405oP%2F78zI0uWS988TKW1%2FMXvszIQb0UgbS3NklRaSl5O3sZLqbfg2ax3Ffi80ydxYiJQPNQriA9I%2B0FvPzHGB%2FlyRmEYQLvGN%2BVl5Z54snCt%2BOj%2Ft8vm8foaIOQRPyIZJZcw2jU%2B5rdjYdxuqKbVoaPpOu1SR67TM%2BbRlz%2FLq85gbgFxuITTb%2FAS1bKBT58zZy%2FDF7jUwciDiTjs6EhDqapKKfPJ435lXbn%2FkCoukhg6T3pkZO7%2B1roORghH%2FCpNLY47lo6HLQ7L9mM8dHmsz8dLa5EfinVI8k2YFHaoKvaEofniGUv5DDM3QFsSMt6TBbKoo1XsqR6zJzrvaFy%2BgC2mzFCab%2BjJXWpF5%2F6qofg3ZXeveAkCluwCNzlSkwUPpIIPOFUASyr91BZV9OBIN9E8Z3QwfkKK5rhLt07WvLajrMNa4%2FdMGOqUB%2BuZ1SLVQ5neNd86VqZs1pnZZxl0xcb7e9FzxkkkbDjdQSGSzbXIq0Ify8SOqVsQKGQ10WgAktmi9Qk%2B67XxA6yD4X1TxwxvV4CgUANMFwOeMJJRL6h77AruCUnryFi7C462RPqZNQP8X0g2OyzYqmnAHJB%2BesgvPD4JvMbXpOwGyqMUuqsqb8BNf%2FJwyW1l1Q7dnsr6G57DGkKA8%2BnSNJWOev6Ua&X-Amz-Signature=5af19f713c7027993cc58c66070b33a508b11c351dbf90f506cc1d3324a96f68&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

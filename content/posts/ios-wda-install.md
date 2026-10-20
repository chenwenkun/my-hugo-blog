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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663JW2A3JJ%2F20261020%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261020T205900Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEIT%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIDU19rhfQXtlxesrGbPLP5%2B0u9fHH2E9b7LSEy9wBzglAiEAnVv00iyBXs9y8qxlDOTEC5ghbjL31ZZlLJow8pm5%2FLQq%2FwMITBAAGgw2Mzc0MjMxODM4MDUiDMv0bM8YyQG%2B2WnIDircA3D5SbGX3I1YJUuext3kvCbHYSBTvdEjnZmabvycLhXRZ2g3CTm9%2FJNf0tv3k0imPso4I5QApAqmVNE5%2FXoAIhAhdem78PqT1wnTkp8CpxnjOYZqBuowrvvL5Fi9%2FJ77Y%2FPvQHd8DCGMxHWyKk5jjqKFq3MI9WOq8rydL1qrX3d3vhawkYIE8YwvhJxWwUTZs6gqgqY7BdoLA6TMwpThGQTS%2BqQMij0ESIrOijZ7aoTuBWVqQSfyyFdH2%2Bg7TTKaQMhfhNS895X1tJuC1nJRpkLTOaH4VrOjNSGO0CuDwaA3vem93rGXQpDo%2B43brUYjAFU0b7u2hUlJ56aSqPLs%2BfrDV2OjU%2F9Cw3Vt%2BQt4yBRiWU0Ve%2F3rpmzKpL6vvaUrPPVolhXTcp5d90Sj%2FyrRs8VORori7KSDV7qRlirH5gT%2BkUmOwOVrndyf8i7xCGQZWEDZUSupdPHQ%2Fa5%2Bq12Ge6HwlnUDexKMGympkG3pgOHwa7QFWtZmmsX6262cS67zhhtPkWq9WhDDLkaVllDxrNYB%2B2yyO%2BLcZNK8e9z6jP2GbOQJOef3mruzbmjuHsjAGQY4PmyiLTVciFPEgRdpnfbe1%2BbdCGoxgwhqw6pEO3EVNRpelbF9Yw%2BEoEtJMPSG39YGOqUBRFXRVOuo%2FsmW4b9%2BbrngaNz%2BYRXT6gU6AX%2Ft2JS8vmYrwRs3YHnVgkW9t7MaKZ%2BWZqqslwNQkSrYMmcoaYjP1HAuT%2FRNP682Dq1qx9LOsIumgem80C1bOJwKcuxzrYpSgPsq%2BhGJN3aMhjuj5r4d0m33tch1%2FZpSXLs3%2BXE7Tki4D6A7YFRDlFzGXrj7HweA8lJjVhkLqrbQKvq%2BKvKEIgpQ6HVE&X-Amz-Signature=8676da14bba735df0dd1354713cbd40229588eb6ab2f031c5f9e01dbb8690af9&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663JW2A3JJ%2F20261020%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261020T205900Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEIT%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIDU19rhfQXtlxesrGbPLP5%2B0u9fHH2E9b7LSEy9wBzglAiEAnVv00iyBXs9y8qxlDOTEC5ghbjL31ZZlLJow8pm5%2FLQq%2FwMITBAAGgw2Mzc0MjMxODM4MDUiDMv0bM8YyQG%2B2WnIDircA3D5SbGX3I1YJUuext3kvCbHYSBTvdEjnZmabvycLhXRZ2g3CTm9%2FJNf0tv3k0imPso4I5QApAqmVNE5%2FXoAIhAhdem78PqT1wnTkp8CpxnjOYZqBuowrvvL5Fi9%2FJ77Y%2FPvQHd8DCGMxHWyKk5jjqKFq3MI9WOq8rydL1qrX3d3vhawkYIE8YwvhJxWwUTZs6gqgqY7BdoLA6TMwpThGQTS%2BqQMij0ESIrOijZ7aoTuBWVqQSfyyFdH2%2Bg7TTKaQMhfhNS895X1tJuC1nJRpkLTOaH4VrOjNSGO0CuDwaA3vem93rGXQpDo%2B43brUYjAFU0b7u2hUlJ56aSqPLs%2BfrDV2OjU%2F9Cw3Vt%2BQt4yBRiWU0Ve%2F3rpmzKpL6vvaUrPPVolhXTcp5d90Sj%2FyrRs8VORori7KSDV7qRlirH5gT%2BkUmOwOVrndyf8i7xCGQZWEDZUSupdPHQ%2Fa5%2Bq12Ge6HwlnUDexKMGympkG3pgOHwa7QFWtZmmsX6262cS67zhhtPkWq9WhDDLkaVllDxrNYB%2B2yyO%2BLcZNK8e9z6jP2GbOQJOef3mruzbmjuHsjAGQY4PmyiLTVciFPEgRdpnfbe1%2BbdCGoxgwhqw6pEO3EVNRpelbF9Yw%2BEoEtJMPSG39YGOqUBRFXRVOuo%2FsmW4b9%2BbrngaNz%2BYRXT6gU6AX%2Ft2JS8vmYrwRs3YHnVgkW9t7MaKZ%2BWZqqslwNQkSrYMmcoaYjP1HAuT%2FRNP682Dq1qx9LOsIumgem80C1bOJwKcuxzrYpSgPsq%2BhGJN3aMhjuj5r4d0m33tch1%2FZpSXLs3%2BXE7Tki4D6A7YFRDlFzGXrj7HweA8lJjVhkLqrbQKvq%2BKvKEIgpQ6HVE&X-Amz-Signature=1a7529e34e1ca4ec6a675760ff812d0f600ff8b49cf8be6504a4bf0306765805&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

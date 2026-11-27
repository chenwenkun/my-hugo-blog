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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB46673BKFSIH%2F20261127%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261127T154722Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEA8aCXVzLXdlc3QtMiJHMEUCIG8o%2BlS6mplfK3NszWoMnAYcs9idGCgBpMTLIDJuTIgGAiEAoO2ZYL3%2FN7f4QMrX3T96zFTPbMVMhV5z4VHJ80nRAFsqiAQI1%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDHHXcbjWPWo96ChKTCrcA3Ce8uksU4PuHUDDlUSTNbgJqCqCsi07wwvIhFRVhgCrJyUZuOlk9X3i85Pl6FPz8qMqpBR06UIa1lu0mArtztlKZI%2FgvRUlqIfXwcCLz%2Bl8hoy32j8fAuiqptW5z2vmxzPdeVh7KoRjh5AvyMhFBB2kvz71ZA9g0kG4MjhaLMNPcmkre%2F3TwatU4eLFYMBJRejZ67gYZpX5Jn%2FCV6QfsNTwc0hmI6o%2BGpzQtCV%2BQXrBHcs21QVJPFiY1quxlHBNhTI7hoxEJQUIkk7HnABAVycrT%2FD2OPmXSU6%2BcVVvpWazYtguPUNQIxjWsax6AYu00RD35QVwUMZwmmH%2B3fJ%2BusNRpEvgGiw9E2qA%2BAjon%2BwfIV0KYFkPjehWUPqZ4FY1JWmdqZtAZ09Ivd75QdBF8nFda%2F%2Byfy2HJ3KEE5q21XzXFeJgV503ztSRgVp4E0WUVVeHz4yzIAT5vaDr4Zy8NjUvvxW0BLWvnMvc9fPeQH7KxThOTYAJqfb6GWx%2B09C90O5sTLU2r0uOcpHjzkiD1O6Tw8%2Fos7RNK749LyWD2ulso9k5P3RUMHgFnSXKvoY%2BFsIa6g0d9vKHWqX03cwtefOnKs1eNWwmYu3G4vVNmP4VDc4ua7TUEQyURAxRMI2nptgGOqUBPPdXDa24knaLXBCMm2OYxg8IkiC%2FU3EvFyABy7rGpxuVWHKPFWqOL8rb2Lw78DV2xwPWVWAExcOG3P18Ci0LpkoEJ07XZjVXs9Q7R6iJvWJLlPszkWV3uhQOQ5RWMneFOaDTHOpVbwN6NXvzdkxF8Z0VD2NzdeJOyznVB78lPt6OoxRf5i2RVkxTJ8c4j9GAnE8RmWbi%2FmwZ35%2FKwMRnzho17%2FX5&X-Amz-Signature=316193a7dd65f99546703e186bf5ca5cca967f7bee7bb43cafd51913f8ee8a65&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB46673BKFSIH%2F20261127%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261127T154722Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEA8aCXVzLXdlc3QtMiJHMEUCIG8o%2BlS6mplfK3NszWoMnAYcs9idGCgBpMTLIDJuTIgGAiEAoO2ZYL3%2FN7f4QMrX3T96zFTPbMVMhV5z4VHJ80nRAFsqiAQI1%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDHHXcbjWPWo96ChKTCrcA3Ce8uksU4PuHUDDlUSTNbgJqCqCsi07wwvIhFRVhgCrJyUZuOlk9X3i85Pl6FPz8qMqpBR06UIa1lu0mArtztlKZI%2FgvRUlqIfXwcCLz%2Bl8hoy32j8fAuiqptW5z2vmxzPdeVh7KoRjh5AvyMhFBB2kvz71ZA9g0kG4MjhaLMNPcmkre%2F3TwatU4eLFYMBJRejZ67gYZpX5Jn%2FCV6QfsNTwc0hmI6o%2BGpzQtCV%2BQXrBHcs21QVJPFiY1quxlHBNhTI7hoxEJQUIkk7HnABAVycrT%2FD2OPmXSU6%2BcVVvpWazYtguPUNQIxjWsax6AYu00RD35QVwUMZwmmH%2B3fJ%2BusNRpEvgGiw9E2qA%2BAjon%2BwfIV0KYFkPjehWUPqZ4FY1JWmdqZtAZ09Ivd75QdBF8nFda%2F%2Byfy2HJ3KEE5q21XzXFeJgV503ztSRgVp4E0WUVVeHz4yzIAT5vaDr4Zy8NjUvvxW0BLWvnMvc9fPeQH7KxThOTYAJqfb6GWx%2B09C90O5sTLU2r0uOcpHjzkiD1O6Tw8%2Fos7RNK749LyWD2ulso9k5P3RUMHgFnSXKvoY%2BFsIa6g0d9vKHWqX03cwtefOnKs1eNWwmYu3G4vVNmP4VDc4ua7TUEQyURAxRMI2nptgGOqUBPPdXDa24knaLXBCMm2OYxg8IkiC%2FU3EvFyABy7rGpxuVWHKPFWqOL8rb2Lw78DV2xwPWVWAExcOG3P18Ci0LpkoEJ07XZjVXs9Q7R6iJvWJLlPszkWV3uhQOQ5RWMneFOaDTHOpVbwN6NXvzdkxF8Z0VD2NzdeJOyznVB78lPt6OoxRf5i2RVkxTJ8c4j9GAnE8RmWbi%2FmwZ35%2FKwMRnzho17%2FX5&X-Amz-Signature=6f6fde5c6ee810215f211eaf04bd6525791bd2b635d963be8725988e61ec136a&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

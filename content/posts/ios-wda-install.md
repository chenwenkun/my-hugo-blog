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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663VLFXDXF%2F20260826%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260826T062832Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEE0aCXVzLXdlc3QtMiJGMEQCIGE6BE05nvMFo8NkLL6L7z5RWL2NAjVO6fm1sOdX8yhrAiBnzv46UxADAL2%2FLAZbCur4f3WeBNMneNQLpx%2BBFQbTMir%2FAwgVEAAaDDYzNzQyMzE4MzgwNSIM9PfWszD6R0NnJOUVKtwDQYSXL9DWujlWsW%2FOG5qpPhcuVgW3KvUKlkDCaCDWNjhm0xSzIRYakiEMOutr5tzjEYwvYPSgfnyV5B71TChQinJxXaI0ONhdkrzBPwWbegbifoEW85s2OeLBp4rTxh0Rzm9MWFFyANRJZ3zKkAYJkU90PibMx9h9tmVd9JDR7huyMo96ODKK4JFk9oC7of1Hut86WayYyNJ5A4WAcSCvJ6a7NpW7gfFtA74j9JjJH78aZzLqqoJOILSecG%2BjwAMBjocrobbSB0y6gafvpUUUY1lCvHFHhNetaCTN4%2FTp%2FOtDz4%2FieSiuuQrjyYcVD478y1HU8Lrfv5aP0LO%2BsJFRS2ogq6%2BJ5glggXiYFVwS6Osiy1z7MaGJOpeItQYFQOUp8NJ0U%2FxEshoBr%2Brkcn%2FW1mJCbDajTSLlk6zcs2p%2Bdy9JGr%2BrYJyFlGFQrNF47kXYhcdt%2BcEiV5BH0qasWiPsWkWlwrVQywvxRz2svng%2BTWgc%2Fne8Sskwc1H3AFznFiXiR9VLcVDL0D2uEhDvWA%2BEiuZ3wlZeYn3HewvSepOuJm%2FnwJqOpeDZdgIRg1XWGHVpkVpRfoZ8w3iRuNv6wnEEoIaR8rBNsp2h8j%2F21zAxdusOdSSnJNhkjoU%2FZXEwttO51AY6pgHjBK9gEXpTD1jvqnrpCKgF9zbahQGpwd49FtRmuk8pTFbOyDLCRnQgYTF8uTRDYiAa3p91FjAtCnCedfPGgp7qQIZMMyiM464Fsxjw%2F7Wq1VfUppzHLdR7W0Q5pJXXYpxMq1TLTEee3%2F7Gu0b44HteWdsIc6qCATDv7zsKPKT8APCUYm5YMfnkIlerd16b5lvF3qimtW7ZVcOwMA9DDBH%2BNLvN4EpA&X-Amz-Signature=28fb2bc53f5f6b27e7fafec17a31743ac1edff9610c5e71fe1a2fca60a4deef3&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663VLFXDXF%2F20260826%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260826T062832Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEE0aCXVzLXdlc3QtMiJGMEQCIGE6BE05nvMFo8NkLL6L7z5RWL2NAjVO6fm1sOdX8yhrAiBnzv46UxADAL2%2FLAZbCur4f3WeBNMneNQLpx%2BBFQbTMir%2FAwgVEAAaDDYzNzQyMzE4MzgwNSIM9PfWszD6R0NnJOUVKtwDQYSXL9DWujlWsW%2FOG5qpPhcuVgW3KvUKlkDCaCDWNjhm0xSzIRYakiEMOutr5tzjEYwvYPSgfnyV5B71TChQinJxXaI0ONhdkrzBPwWbegbifoEW85s2OeLBp4rTxh0Rzm9MWFFyANRJZ3zKkAYJkU90PibMx9h9tmVd9JDR7huyMo96ODKK4JFk9oC7of1Hut86WayYyNJ5A4WAcSCvJ6a7NpW7gfFtA74j9JjJH78aZzLqqoJOILSecG%2BjwAMBjocrobbSB0y6gafvpUUUY1lCvHFHhNetaCTN4%2FTp%2FOtDz4%2FieSiuuQrjyYcVD478y1HU8Lrfv5aP0LO%2BsJFRS2ogq6%2BJ5glggXiYFVwS6Osiy1z7MaGJOpeItQYFQOUp8NJ0U%2FxEshoBr%2Brkcn%2FW1mJCbDajTSLlk6zcs2p%2Bdy9JGr%2BrYJyFlGFQrNF47kXYhcdt%2BcEiV5BH0qasWiPsWkWlwrVQywvxRz2svng%2BTWgc%2Fne8Sskwc1H3AFznFiXiR9VLcVDL0D2uEhDvWA%2BEiuZ3wlZeYn3HewvSepOuJm%2FnwJqOpeDZdgIRg1XWGHVpkVpRfoZ8w3iRuNv6wnEEoIaR8rBNsp2h8j%2F21zAxdusOdSSnJNhkjoU%2FZXEwttO51AY6pgHjBK9gEXpTD1jvqnrpCKgF9zbahQGpwd49FtRmuk8pTFbOyDLCRnQgYTF8uTRDYiAa3p91FjAtCnCedfPGgp7qQIZMMyiM464Fsxjw%2F7Wq1VfUppzHLdR7W0Q5pJXXYpxMq1TLTEee3%2F7Gu0b44HteWdsIc6qCATDv7zsKPKT8APCUYm5YMfnkIlerd16b5lvF3qimtW7ZVcOwMA9DDBH%2BNLvN4EpA&X-Amz-Signature=9831741676f28a791448a57e46aab9572130520d658b91393862657fb3b7cdf6&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

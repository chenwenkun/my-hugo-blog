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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466TSOWILHZ%2F20261002%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261002T213350Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjENP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIHzTaiOdowwvIzL9HZEiwhq1PpSFUMW6ZOFmmZe36Cu0AiB5BFMlZ1dXDwCiNyUkKMCsVq%2B31AapMU%2FP29WDVVA9EiqIBAib%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMahsykAMO86fQ9wdKKtwD%2BbyAIoEhkh6fHCsF2EZb31wW293yI3TmEpjOiMpNqsh5FTnOx4mUeJ2awrkGqJ4r4QZltbuGsiPz0dEUeWrhlo72iv66hQoZacG9a6op7aC8tsmRuogbj1jer2a6EeUjuad4bSXwT6KaQNkH9aYBodZl2r6tpuclT1bJ2XKSVKl2PUvegzVegCnS9%2F6zWOXUz2G00l9mWifaMCPLV8ylR8B8YT06h9u80NBP%2BxgAJiW%2B7ALyzPxy%2BvPesY3KPC2EPpiDvC9y4HSoNKn0VOnYequD%2FKSjE5owiIFQp%2B5GmN8FE0O9bW7grN7CtPoidMWKIV57QYC1TlTcq6JIH1HCRlGTNvYQHswklxB9uwFBUH0AMcQrXhrH7SoBHQZ1I8ywkCJntg%2BAIfEcv8OeEi4qM55%2B3NtyRdErOSzLBSenGPRghK%2BrnZiRxGlaqIa2NgfjHdgEumfZmemHjbHPSPANhkCwZC2655IbHw%2BBa7z0e9%2FNTAk69zDjQ3ARrezqgA6CcZuYLOmfViB3SqcOFShLoAW7Q9%2Fq8%2B5qsr76gFSGeS0NzaLTLONA4so1AeHqnjeXa800qUBlP5eurJqFJ3wSxvcchQe%2FyyaA2cCZHpJcVl1Fk4lfJ98utorcfVwwsoCA1gY6pgGRBOjXwURag%2FqQ27TFAT%2B%2BnopV2ygmReKuz6%2Fib71jSDasCI2OGxP7nskKmqXUmagHPJ93UIDix12aRdiVwZ42bNdH42dXK%2FpODsVoG9FXF6thrap9xsDShbLLBI72vQ9YzUec%2Fm0TyhfDChJq5mJYTsnCfs1XufrN58wNGBFTgOlOroTOGWI5iUzktH9GByUh2sNeFYlz15%2FMqPcur2MIz1g0OSH9&X-Amz-Signature=37a8ef71dca4cab64f4c9347d6f203c7898fa3238d0ae317f79dafdb0d3f63c8&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466TSOWILHZ%2F20261002%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261002T213350Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjENP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIHzTaiOdowwvIzL9HZEiwhq1PpSFUMW6ZOFmmZe36Cu0AiB5BFMlZ1dXDwCiNyUkKMCsVq%2B31AapMU%2FP29WDVVA9EiqIBAib%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMahsykAMO86fQ9wdKKtwD%2BbyAIoEhkh6fHCsF2EZb31wW293yI3TmEpjOiMpNqsh5FTnOx4mUeJ2awrkGqJ4r4QZltbuGsiPz0dEUeWrhlo72iv66hQoZacG9a6op7aC8tsmRuogbj1jer2a6EeUjuad4bSXwT6KaQNkH9aYBodZl2r6tpuclT1bJ2XKSVKl2PUvegzVegCnS9%2F6zWOXUz2G00l9mWifaMCPLV8ylR8B8YT06h9u80NBP%2BxgAJiW%2B7ALyzPxy%2BvPesY3KPC2EPpiDvC9y4HSoNKn0VOnYequD%2FKSjE5owiIFQp%2B5GmN8FE0O9bW7grN7CtPoidMWKIV57QYC1TlTcq6JIH1HCRlGTNvYQHswklxB9uwFBUH0AMcQrXhrH7SoBHQZ1I8ywkCJntg%2BAIfEcv8OeEi4qM55%2B3NtyRdErOSzLBSenGPRghK%2BrnZiRxGlaqIa2NgfjHdgEumfZmemHjbHPSPANhkCwZC2655IbHw%2BBa7z0e9%2FNTAk69zDjQ3ARrezqgA6CcZuYLOmfViB3SqcOFShLoAW7Q9%2Fq8%2B5qsr76gFSGeS0NzaLTLONA4so1AeHqnjeXa800qUBlP5eurJqFJ3wSxvcchQe%2FyyaA2cCZHpJcVl1Fk4lfJ98utorcfVwwsoCA1gY6pgGRBOjXwURag%2FqQ27TFAT%2B%2BnopV2ygmReKuz6%2Fib71jSDasCI2OGxP7nskKmqXUmagHPJ93UIDix12aRdiVwZ42bNdH42dXK%2FpODsVoG9FXF6thrap9xsDShbLLBI72vQ9YzUec%2Fm0TyhfDChJq5mJYTsnCfs1XufrN58wNGBFTgOlOroTOGWI5iUzktH9GByUh2sNeFYlz15%2FMqPcur2MIz1g0OSH9&X-Amz-Signature=2dc74bdcb460231741dc8d98e5598319f80b6ede3254ec098eb543ebb1d39066&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4664JZJGEUU%2F20261003%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261003T201921Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEOz%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIBF%2FCacTBPkEo%2Fcsz%2FPQs%2FMGBqvm6O1a6CfNVwjT5YeNAiBVlOHodpE7mwCKO5y%2BV5sgcAjbsKr59KsU%2Bex5EEcLNiqIBAi0%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMySVem8KBH9BKJn%2BwKtwDE3aKRDk%2BDep6FXyetgbj4nSQUtsr9CmmFglWUei3DoaIUkWd%2BtMqLB4%2BYV02H7FxY%2FsXtTN%2BmyC3mRNQ%2FNrFBSvLdjNToFA9U4NkuIyQP8UJSB0N6WYvI27yS9jh5h3dMGGYs2PCtBOoUsvToGq5G6iSJsT3V0anrSwfwTfUEKy6QGFxE8CDvT62RZz4sI%2F7PyEpUbIWTuAU2vF2lWJKn3AGeF2rvLIPpJwbofSMRc7w0wbQ7RXtGnYHUmyQi8oJyZNTjvujKUpnqMGiqDvZsxbuPoYJqFHSrzamTlcHoje%2BynlXcgjxbmRg95fREpXTtqNG7wFDInISwuYKTG%2BWQdEErNOGF7Z6ssTt8ZkQOAsFpFtZ%2FD4mL7d53vhqVhyrHD3YM5inrgUC%2BMoFk%2FPbm0hajCrai2ku7la%2FwXSX0oueD%2BNOyVWmepskT7rtyy%2BHTXQla6b%2FRzt0YAg09XEU%2FZ9WwAfIOLplKpgz0nwcihscBb1mkL1G%2FA51gHjZjmaVC060oT5c7cTro8%2Bidz6KazRJV7elTENqnWTxS3otK79LdMsrSM42UumS4%2FirjbLsVlyiGm0oX0m5BsyRsXVZWdKcogvLpfK%2FCur5qbXGApLpQ0VRyFOUxjlSin8wla%2BF1gY6pgE%2FHqjyAuk6Th83H7IJ5ivGtZFzmyopVUVwDc5ymwPar6cZOal%2B6Qw6m%2BbomBjT%2FPWd%2FN6dAepQlBIcGilUf8%2FnsBwZ7n3fXFV22G6%2FJvtqG1OCK1TiRKi1w1auOUqMftXvqB9ZIJtmNitw720ZRs8JQZEb8k1V%2B8rVFP4BFJRTcGIiyl6P8BDJjkjjuz9fFFmcDvvEIQr3ulOthlHwtgpWHUKndOtV&X-Amz-Signature=90aff6029f218580da2ce92c48e7fc784237d5fc4167031909c22c2345e7eada&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4664JZJGEUU%2F20261003%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261003T201921Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEOz%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIBF%2FCacTBPkEo%2Fcsz%2FPQs%2FMGBqvm6O1a6CfNVwjT5YeNAiBVlOHodpE7mwCKO5y%2BV5sgcAjbsKr59KsU%2Bex5EEcLNiqIBAi0%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMySVem8KBH9BKJn%2BwKtwDE3aKRDk%2BDep6FXyetgbj4nSQUtsr9CmmFglWUei3DoaIUkWd%2BtMqLB4%2BYV02H7FxY%2FsXtTN%2BmyC3mRNQ%2FNrFBSvLdjNToFA9U4NkuIyQP8UJSB0N6WYvI27yS9jh5h3dMGGYs2PCtBOoUsvToGq5G6iSJsT3V0anrSwfwTfUEKy6QGFxE8CDvT62RZz4sI%2F7PyEpUbIWTuAU2vF2lWJKn3AGeF2rvLIPpJwbofSMRc7w0wbQ7RXtGnYHUmyQi8oJyZNTjvujKUpnqMGiqDvZsxbuPoYJqFHSrzamTlcHoje%2BynlXcgjxbmRg95fREpXTtqNG7wFDInISwuYKTG%2BWQdEErNOGF7Z6ssTt8ZkQOAsFpFtZ%2FD4mL7d53vhqVhyrHD3YM5inrgUC%2BMoFk%2FPbm0hajCrai2ku7la%2FwXSX0oueD%2BNOyVWmepskT7rtyy%2BHTXQla6b%2FRzt0YAg09XEU%2FZ9WwAfIOLplKpgz0nwcihscBb1mkL1G%2FA51gHjZjmaVC060oT5c7cTro8%2Bidz6KazRJV7elTENqnWTxS3otK79LdMsrSM42UumS4%2FirjbLsVlyiGm0oX0m5BsyRsXVZWdKcogvLpfK%2FCur5qbXGApLpQ0VRyFOUxjlSin8wla%2BF1gY6pgE%2FHqjyAuk6Th83H7IJ5ivGtZFzmyopVUVwDc5ymwPar6cZOal%2B6Qw6m%2BbomBjT%2FPWd%2FN6dAepQlBIcGilUf8%2FnsBwZ7n3fXFV22G6%2FJvtqG1OCK1TiRKi1w1auOUqMftXvqB9ZIJtmNitw720ZRs8JQZEb8k1V%2B8rVFP4BFJRTcGIiyl6P8BDJjkjjuz9fFFmcDvvEIQr3ulOthlHwtgpWHUKndOtV&X-Amz-Signature=3c022d56f55afd7289634fd138a0d1b1c70356e1c195f055e57e66d615a60f1b&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

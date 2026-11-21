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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466U5TPXJRN%2F20261121%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261121T044312Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEHQaCXVzLXdlc3QtMiJHMEUCIEVXFNhfu3lD5U2Gu4QF86JUN13powZ8CAEygcJpDfx0AiEAiA1dWFRynCMIG8D4L3qlgINGLyrP%2BsCCjIlRD0VcP2Yq%2FwMIPRAAGgw2Mzc0MjMxODM4MDUiDBX%2FcqO4PPdC5UG%2FzCrcA3%2FeVd59AYS0wP9EqPLkek4sUnS8Sqa166DKrrD0VVP1HfP91Dh8loMABIcTBXa2M%2BOHNbH31pH9sNTYJykAwOst9oe4h1OED7bqe6R0hz81rxfazustAza8ltFWYdYp4agKmTYjXGhF5VKqudhI%2FgbuELNLx8GJQtqbfNpOz3PbSpHxnZ3B3ylxjzb2AL0kylmPDMXGAUDipHRplkxhJNDdj73XYMym%2FwFghUrEXzDkGbzyMU0t9maQC0EfLEaN0v0nZyJhSFPRvdslujHWjjZsfcccUAcMShW%2FTBPektv6uJups4YMaG2WXagLOlcw89NFihGnRrxK%2BhN4gkxLdQLRogVYCJzk0ap6IgSzUieKlYEqkV5J1%2FElKdsWtcdgwrJQ2TLoVz9SX517%2BzVXtJ1t6U2maUO%2Bfkr4gLSCaiK1gmZoVeMx6SthCr6R4psr53jPgtYQ8PmnHok8uSji2jV7W8whgLwti6l31qwL7jUzRtwn5nX%2BssP1TQyQX8gPMYHf26n8X%2BSC3HL4g5NhJkc8WFbUZCnqMlTU37GR2ZYOXAyEtlDKITImxjwYHOhEsUlFsyl3s7ueRNJ%2BcTHWR0IaPKbwx22sn7Qdd%2FEaTLaKeiZ4JNa0Zaqse3XPMKOphNgGOqUBXCJrDbQDV01wSJ99%2BYjMKEAOSVm%2Bwu%2BXrFNafNt7gKzeJKtluSiWGtUqDzruzlp2o4RKXzYOXAFMyMuh9Vsb6IZeLd4jYmwF4pG2OiegxYV8VQP9RV24nZov4wGdpCAhkeiEOcgOoHig3vdDkZYBbXTrZxLDI5AwAzMfdzFs7A8KO1WMe1lBVJoNmQ%2Fvj9z8UqUdxhECR5d7mE2yg9sIi17us40G&X-Amz-Signature=fb1e36fe36eb4d6f04e20d68d3c89730ca184b13f9af56de7c9601780851d8ff&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466U5TPXJRN%2F20261121%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261121T044312Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEHQaCXVzLXdlc3QtMiJHMEUCIEVXFNhfu3lD5U2Gu4QF86JUN13powZ8CAEygcJpDfx0AiEAiA1dWFRynCMIG8D4L3qlgINGLyrP%2BsCCjIlRD0VcP2Yq%2FwMIPRAAGgw2Mzc0MjMxODM4MDUiDBX%2FcqO4PPdC5UG%2FzCrcA3%2FeVd59AYS0wP9EqPLkek4sUnS8Sqa166DKrrD0VVP1HfP91Dh8loMABIcTBXa2M%2BOHNbH31pH9sNTYJykAwOst9oe4h1OED7bqe6R0hz81rxfazustAza8ltFWYdYp4agKmTYjXGhF5VKqudhI%2FgbuELNLx8GJQtqbfNpOz3PbSpHxnZ3B3ylxjzb2AL0kylmPDMXGAUDipHRplkxhJNDdj73XYMym%2FwFghUrEXzDkGbzyMU0t9maQC0EfLEaN0v0nZyJhSFPRvdslujHWjjZsfcccUAcMShW%2FTBPektv6uJups4YMaG2WXagLOlcw89NFihGnRrxK%2BhN4gkxLdQLRogVYCJzk0ap6IgSzUieKlYEqkV5J1%2FElKdsWtcdgwrJQ2TLoVz9SX517%2BzVXtJ1t6U2maUO%2Bfkr4gLSCaiK1gmZoVeMx6SthCr6R4psr53jPgtYQ8PmnHok8uSji2jV7W8whgLwti6l31qwL7jUzRtwn5nX%2BssP1TQyQX8gPMYHf26n8X%2BSC3HL4g5NhJkc8WFbUZCnqMlTU37GR2ZYOXAyEtlDKITImxjwYHOhEsUlFsyl3s7ueRNJ%2BcTHWR0IaPKbwx22sn7Qdd%2FEaTLaKeiZ4JNa0Zaqse3XPMKOphNgGOqUBXCJrDbQDV01wSJ99%2BYjMKEAOSVm%2Bwu%2BXrFNafNt7gKzeJKtluSiWGtUqDzruzlp2o4RKXzYOXAFMyMuh9Vsb6IZeLd4jYmwF4pG2OiegxYV8VQP9RV24nZov4wGdpCAhkeiEOcgOoHig3vdDkZYBbXTrZxLDI5AwAzMfdzFs7A8KO1WMe1lBVJoNmQ%2Fvj9z8UqUdxhECR5d7mE2yg9sIi17us40G&X-Amz-Signature=43a39ba3e5317378fba0eef63123efb7e0371cc0135e4e2b0366356ab1819849&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4664YI4QDCD%2F20260813%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260813T124316Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEBwaCXVzLXdlc3QtMiJHMEUCIB5eu5hQeuDKGbWwr%2FoUpiKUW4NuIJDju8U6QVkWhf0HAiEAgv5Vk75%2BE6kqWVM4IShR7zXZRLWZo600XeYB2uiV0wYqiAQI5f%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDK8w%2Fu8nmeldAMYm%2BircA7t3e1oN3D668SUdhzrh3a1g82WKrKK%2FZrNWOCpdLZW3%2FjLOWw1hb2KMapgAbAFSgXVQsK%2FisAJxoaSWiMSLZr4WWLob44HJZKeiK94izUx2fQeNPLfgSxmn1Gg9y4Sap97NkcDiqiQAhq9zHzAfFQNWRKiIf6ghy9lMvA4aa9uMdrBRpEqSMPj3hBP7u1R4Gf0CXFdXdXWGu97kQrKOV57%2BvP%2FAR9gJNKYtuMGBV2wqAltoQI5s3oQZ%2BjZdb4LE%2FiK6V%2Bq80O4ePSlTr5HOk%2Fqfmqrla%2BDQFE52BUj7VZojizj56UEAXtEd9T8h6DKvFht3YfjBMn1Mf0sXf8d8Q%2FWj76RG2hThbelEDI%2BA3QdLLYlK%2B7IZdcNS5w1sv500vRrh1Co94BRZwHMZ3fZU9Onv46E8cgue86SEve94HPwUhftim3C38D6EdQwOdawkZa3bQQCVofKaRD2Qx0XtgQyu0%2Fswj8hjyR6vjx3RnidHJ9Erkhg2WSlNDyRM%2FtqA3hGM6FqxdjMOAp8XOuVCZdvSAFYi9rMV4C74hMhGuCacTUXmqrj4rkJdWjW%2F08xi73tphgppmfcApXm20dVBniHZci0xcgwYyDHXuWEhn4LYZI61GuBzjCxFKQ4%2BMJzZ9tMGOqUBs2FfiKa02LIkq%2FV%2FGWqFHzxhe8FH2JMSszGUdwiKOuDxa3zOwKkJzgN0hHz69PakP%2BByz%2BSPe6JIcWpt0qUyk4RfVXGZ2SHItaDk0ziwVSVg1olIaayUX4j02syhBpvVvrvzqjzdZo70dqBDpH5myMaXi7JM38mmX1kDmRRVGcsDJP%2FAdKETcWB%2FNSOE1CaVyTy7XkCtJizHoGrxgB5mT7pl2ott&X-Amz-Signature=8a95cb700d94b59b8f4114b4c64cd0ae6523c2de8b124b8bc450e470ca07f5fa&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4664YI4QDCD%2F20260813%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260813T124316Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEBwaCXVzLXdlc3QtMiJHMEUCIB5eu5hQeuDKGbWwr%2FoUpiKUW4NuIJDju8U6QVkWhf0HAiEAgv5Vk75%2BE6kqWVM4IShR7zXZRLWZo600XeYB2uiV0wYqiAQI5f%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDK8w%2Fu8nmeldAMYm%2BircA7t3e1oN3D668SUdhzrh3a1g82WKrKK%2FZrNWOCpdLZW3%2FjLOWw1hb2KMapgAbAFSgXVQsK%2FisAJxoaSWiMSLZr4WWLob44HJZKeiK94izUx2fQeNPLfgSxmn1Gg9y4Sap97NkcDiqiQAhq9zHzAfFQNWRKiIf6ghy9lMvA4aa9uMdrBRpEqSMPj3hBP7u1R4Gf0CXFdXdXWGu97kQrKOV57%2BvP%2FAR9gJNKYtuMGBV2wqAltoQI5s3oQZ%2BjZdb4LE%2FiK6V%2Bq80O4ePSlTr5HOk%2Fqfmqrla%2BDQFE52BUj7VZojizj56UEAXtEd9T8h6DKvFht3YfjBMn1Mf0sXf8d8Q%2FWj76RG2hThbelEDI%2BA3QdLLYlK%2B7IZdcNS5w1sv500vRrh1Co94BRZwHMZ3fZU9Onv46E8cgue86SEve94HPwUhftim3C38D6EdQwOdawkZa3bQQCVofKaRD2Qx0XtgQyu0%2Fswj8hjyR6vjx3RnidHJ9Erkhg2WSlNDyRM%2FtqA3hGM6FqxdjMOAp8XOuVCZdvSAFYi9rMV4C74hMhGuCacTUXmqrj4rkJdWjW%2F08xi73tphgppmfcApXm20dVBniHZci0xcgwYyDHXuWEhn4LYZI61GuBzjCxFKQ4%2BMJzZ9tMGOqUBs2FfiKa02LIkq%2FV%2FGWqFHzxhe8FH2JMSszGUdwiKOuDxa3zOwKkJzgN0hHz69PakP%2BByz%2BSPe6JIcWpt0qUyk4RfVXGZ2SHItaDk0ziwVSVg1olIaayUX4j02syhBpvVvrvzqjzdZo70dqBDpH5myMaXi7JM38mmX1kDmRRVGcsDJP%2FAdKETcWB%2FNSOE1CaVyTy7XkCtJizHoGrxgB5mT7pl2ott&X-Amz-Signature=4590218d3e52cb636ef5e97ad06e64b46ba23bd634b6c257d382441375931d5d&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

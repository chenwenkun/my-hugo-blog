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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466WC5M2OLI%2F20261024%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261024T150157Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEN7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQC2PqWQ5yJsmRRsH3hOg%2BPUSoloWqu1o2iDhojdsAExcQIgBqmC5UFnoePWdT9kykxt0IvM%2BVN9jYB71YIyRBz0SZkqiAQIpv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDIJGrETs8j%2BBuBpzPSrcA%2F5wUTDOJ3I7kL8lM2Cf64W09l2XIlwiLFrJdogcHKVJsEEaq%2B6fIGl8lH21BRlvKUzQBtE%2Ft4S%2FCNnfW4qR6r3WitfZSBbzh5lSZCbktK6t1%2Bdh5Z57z57efP8JXMMf82SRrZL4KTW36ugteb3E7Q0RQru%2FKR36RywELcMg5v1oND1YtaO6eNKjECi%2BYhgsc6gtiE03Gh1gI66fbKyYO3kvFUEsXPXGLg9NMi89oQmtxC%2BO0jWJ4F%2F%2FbK%2BUqzlajj2HB2Ip0DtdE8qUWQg%2BICgIkFP7i2Gv37Ur1U%2FOQ2Opb7MkOSOuLNd4YSsK8rPt%2BT8Sl7JFHwRrSdj5wkZE6fzm%2FLoRMAcLsi%2BS1P9mpmfEqcPAhNqzXNrHQKSDoyykgG6sz8Vgb6ocrK6IxgHoj7fnHaxkUWbVDOLMIte0tDPbWygeSbui46lfuCbSPkKAbkj8iq4lFriBmXRdDnqhiBxjZ7%2B2JjiD7y7a%2F5gQ95RUM6UYGpeVgihE5w9XGY%2FySM6XZQCuzBzxweXVA08QJuP%2BdOZRXdiQD5rVWOhvqqbRkiZn5XcrA16%2FEfPZPq9tbBFZgJOE66iQL%2FUx4P2N2%2Bi3ROTDAzZN4FWXYuo2%2FWLwcgFspfAF5Sow0wSVMIns8tYGOqUBfvg2H%2Ft%2BFlD9W3JvwwfESzU2%2B%2BEbJgptUaEu%2B6qWI2l1KGRpaqVg4%2F6xzC52Vyf1LoeHKbDkHWX%2B5YZEtokE%2F3oCwmmFPof2DDAHWE0gLLmNWJlZVhS3gom%2F0c73Y5CCodDyADFgklsEPEGTEEjdCoiw8j6vhl95o5XLgaiEUrJnI1xQZxVgX1VPcFtOKF1iiXvjcQrWfzjMMSqybXuO7v5xsGkP&X-Amz-Signature=37639cb626c0ea94e11535848edec62d092a15bfe16925c7a9d50b69a6abbc0c&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466WC5M2OLI%2F20261024%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261024T150157Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEN7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQC2PqWQ5yJsmRRsH3hOg%2BPUSoloWqu1o2iDhojdsAExcQIgBqmC5UFnoePWdT9kykxt0IvM%2BVN9jYB71YIyRBz0SZkqiAQIpv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDIJGrETs8j%2BBuBpzPSrcA%2F5wUTDOJ3I7kL8lM2Cf64W09l2XIlwiLFrJdogcHKVJsEEaq%2B6fIGl8lH21BRlvKUzQBtE%2Ft4S%2FCNnfW4qR6r3WitfZSBbzh5lSZCbktK6t1%2Bdh5Z57z57efP8JXMMf82SRrZL4KTW36ugteb3E7Q0RQru%2FKR36RywELcMg5v1oND1YtaO6eNKjECi%2BYhgsc6gtiE03Gh1gI66fbKyYO3kvFUEsXPXGLg9NMi89oQmtxC%2BO0jWJ4F%2F%2FbK%2BUqzlajj2HB2Ip0DtdE8qUWQg%2BICgIkFP7i2Gv37Ur1U%2FOQ2Opb7MkOSOuLNd4YSsK8rPt%2BT8Sl7JFHwRrSdj5wkZE6fzm%2FLoRMAcLsi%2BS1P9mpmfEqcPAhNqzXNrHQKSDoyykgG6sz8Vgb6ocrK6IxgHoj7fnHaxkUWbVDOLMIte0tDPbWygeSbui46lfuCbSPkKAbkj8iq4lFriBmXRdDnqhiBxjZ7%2B2JjiD7y7a%2F5gQ95RUM6UYGpeVgihE5w9XGY%2FySM6XZQCuzBzxweXVA08QJuP%2BdOZRXdiQD5rVWOhvqqbRkiZn5XcrA16%2FEfPZPq9tbBFZgJOE66iQL%2FUx4P2N2%2Bi3ROTDAzZN4FWXYuo2%2FWLwcgFspfAF5Sow0wSVMIns8tYGOqUBfvg2H%2Ft%2BFlD9W3JvwwfESzU2%2B%2BEbJgptUaEu%2B6qWI2l1KGRpaqVg4%2F6xzC52Vyf1LoeHKbDkHWX%2B5YZEtokE%2F3oCwmmFPof2DDAHWE0gLLmNWJlZVhS3gom%2F0c73Y5CCodDyADFgklsEPEGTEEjdCoiw8j6vhl95o5XLgaiEUrJnI1xQZxVgX1VPcFtOKF1iiXvjcQrWfzjMMSqybXuO7v5xsGkP&X-Amz-Signature=e5ab7e036e6688a70a171fc799a824f966ff7bda97da0c65cc84c0b58b401cf8&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

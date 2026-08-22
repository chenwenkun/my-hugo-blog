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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4667H7A3F4S%2F20260822%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260822T062023Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEO7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIBPhGpbHfoV635dOadwtO2EDg8MjBs9I%2BPiPjr%2BGtWsmAiEApavdMuQ0QYoTCxRj7vFG9ZpjQi90PXGNThh12ZPajKAqiAQIt%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDM%2FpmSRosb2lvMcB7ircA%2FzobSq3t5vHAqRY1oddwFm6gYWdXTlYka1xPmkGBU01V8hgYmg9Vg1FzRVnqQCe0%2FTpHdD0AhDr9Ja61rqdTuI6BrXClf%2F%2FMqIDERMcgZGVtxFWhwvzC3YrexZQGmT7%2BgH9NSywBmb6x12blc%2FgHms%2FOO%2B8GLKW2bgCrJmOrb92gf%2FTUpC9OCmnJibW9sU3lzW8L88kcbsJIyANgafZXjgzCRw2tGXSev9fZ%2B1WH%2FU%2BGIlFvgMwm9rOX0v07H0RtVxKsy7H78kHc7lRUrn%2BtqsWkU4DGKaVEVysWZmraR2NcfBzdc88H3MJbVxKZ9Rd6dbsmjp8GVgsyhwYnavGN%2FW4j2ktdXoAfTmzilXPMEfYZEHWep8dXnk8ovmXwvEzgFQrirFIJFaCtcPgZemjgfPzp9HbEnfqH6BCYa1b6Q9StOnQFGQpbOdtOA5K637nAKlBiFL5KvbuluWXr2EsNxbXQ18Vl8Q74YgCGDOaqD0xWtIE62H6ogJrdjWqlICsmdf6gstOyoznhpPtlY1E1w%2BLA8lUmJMj4pjj7TWUkEsara83v22KsBeb8n3%2FoTgd0KiZnfb8oeOSp98oH1qSTFL%2B5DSWXoWOlYokVbLh%2BPRroge%2BiE0ocxqtItlgMMX5pNQGOqUBh0wohCNcDJVefCM1j%2FmL7xJG2QVPlsbpV%2FXeoGZUB6M%2BjehrubYdq9IfQjUo5n49UZ%2B8aSb67UMd%2BXra5Ws6rk12BFPN82Ool9OcYt4QigVhbvMaM64wLsypqUn8zq97g28XiKkNQTzVLhkt7mL4J4ljPuVJHTEHrO05uOsMmi0LYuCRx4Iz1%2BdWpYDXlZ88aweFjPFyUscCfYXKKsLGRtCpjid6&X-Amz-Signature=40310dab7c4f76a61987241f16a46ec4707894d8c0a104caf631dfd37a2150ff&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4667H7A3F4S%2F20260822%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260822T062024Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEO7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIBPhGpbHfoV635dOadwtO2EDg8MjBs9I%2BPiPjr%2BGtWsmAiEApavdMuQ0QYoTCxRj7vFG9ZpjQi90PXGNThh12ZPajKAqiAQIt%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDM%2FpmSRosb2lvMcB7ircA%2FzobSq3t5vHAqRY1oddwFm6gYWdXTlYka1xPmkGBU01V8hgYmg9Vg1FzRVnqQCe0%2FTpHdD0AhDr9Ja61rqdTuI6BrXClf%2F%2FMqIDERMcgZGVtxFWhwvzC3YrexZQGmT7%2BgH9NSywBmb6x12blc%2FgHms%2FOO%2B8GLKW2bgCrJmOrb92gf%2FTUpC9OCmnJibW9sU3lzW8L88kcbsJIyANgafZXjgzCRw2tGXSev9fZ%2B1WH%2FU%2BGIlFvgMwm9rOX0v07H0RtVxKsy7H78kHc7lRUrn%2BtqsWkU4DGKaVEVysWZmraR2NcfBzdc88H3MJbVxKZ9Rd6dbsmjp8GVgsyhwYnavGN%2FW4j2ktdXoAfTmzilXPMEfYZEHWep8dXnk8ovmXwvEzgFQrirFIJFaCtcPgZemjgfPzp9HbEnfqH6BCYa1b6Q9StOnQFGQpbOdtOA5K637nAKlBiFL5KvbuluWXr2EsNxbXQ18Vl8Q74YgCGDOaqD0xWtIE62H6ogJrdjWqlICsmdf6gstOyoznhpPtlY1E1w%2BLA8lUmJMj4pjj7TWUkEsara83v22KsBeb8n3%2FoTgd0KiZnfb8oeOSp98oH1qSTFL%2B5DSWXoWOlYokVbLh%2BPRroge%2BiE0ocxqtItlgMMX5pNQGOqUBh0wohCNcDJVefCM1j%2FmL7xJG2QVPlsbpV%2FXeoGZUB6M%2BjehrubYdq9IfQjUo5n49UZ%2B8aSb67UMd%2BXra5Ws6rk12BFPN82Ool9OcYt4QigVhbvMaM64wLsypqUn8zq97g28XiKkNQTzVLhkt7mL4J4ljPuVJHTEHrO05uOsMmi0LYuCRx4Iz1%2BdWpYDXlZ88aweFjPFyUscCfYXKKsLGRtCpjid6&X-Amz-Signature=849cab09732fe72345818163d6325907345d287716e4d1bbcb1666456c045476&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

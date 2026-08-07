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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466V7UR5JZD%2F20260807%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260807T123811Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEIv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIB71dgNXgJhzuoEwtu8g6fnojPcSapJQbjEKVApfreGUAiEA87jwTQkvwaq%2BngluSKWjic%2FQdgXM%2FAFLAWn3hqMRYYoq%2FwMIVBAAGgw2Mzc0MjMxODM4MDUiDPSObExdnWmJSnqBkCrcA0bRn1ySAyikUf9kQhcZymxr3wS2FkaoCO%2BVOMBI%2FU%2FU2VMnvg6u2JqzWbAKhFZ%2FhZjWH7wVObXIBeSHWjTwbvGkqtj0RkerZd4XRhByCCRJqeIE43ZZINIgHwFcmCaSTsh2owJTJ4fslDQlRULWxn7GmNPQkloFkYGMEQRryNJ4SaCBAbhY01Y4TRoGXOnM%2BOgFFw%2BePVrlewGxrZg0yvwMQBQ6bVfnkhX4u7l%2F678q%2FoVkxKkWuz8MVef%2BRZmAgmdnhZI9OuMX2snw3lrDitTRPetVDJyWKV5vxzBxH0MY7LoWZc8vxG0aPRG81Ds%2FdIVheM8BWgJZSzLv9j13JNMlT0IBSrofxQzlwrxXRWMg2OujTJT0c%2Fu0VUIZgzhwfvxsZTJr%2BqTvjg6zNJBvVZEMxt%2Fx67xIJ9jW%2F67bYasLCAOfKyu37b4SRM8o5eww%2FCyJNSQKbZRjI5J7YD9zWAZRS0o5e5Uy04KE0dxwCdJpuiZ4bkDILfNZNEHSQpwVHa605jvVTouiVH8e8ttgSXqfAVtOLnGmNhrjdEtG9kYg6bsdK5bywjsLwC52WWY2useoHYmW%2BnqMMS%2FQ0CYhqK5IRP9%2BUz9FHDFY%2F9CD%2F4gAIuS2i76j%2BKSEkDBZMPP71tMGOqUBX%2FbTLjCZEhbuqBRO99TNGYKUcOAdvcXVYW9bwGZ%2FTDzXHWPngeRZP0wvE2K9ub2OwTQUKL0zP5GxZW8Wonhfo6k7FXeNcgba2Oz%2FwY6ULJRdeO3X%2F4LOvMfXnzX5jadjhd7HaVJR2btr%2FrMrPgoJ4%2BytQQG2ez4oEEtYI845XC8mHg%2F6b7cwb1ctKlUL1ow9TciXXfGgXWawYz2S8T7OnNxL4St3&X-Amz-Signature=5d3ed442d204967f24229a4fd8cd1f8c6ba35a28c8466a51afcfe113002e386b&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466V7UR5JZD%2F20260807%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260807T123812Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEIv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIB71dgNXgJhzuoEwtu8g6fnojPcSapJQbjEKVApfreGUAiEA87jwTQkvwaq%2BngluSKWjic%2FQdgXM%2FAFLAWn3hqMRYYoq%2FwMIVBAAGgw2Mzc0MjMxODM4MDUiDPSObExdnWmJSnqBkCrcA0bRn1ySAyikUf9kQhcZymxr3wS2FkaoCO%2BVOMBI%2FU%2FU2VMnvg6u2JqzWbAKhFZ%2FhZjWH7wVObXIBeSHWjTwbvGkqtj0RkerZd4XRhByCCRJqeIE43ZZINIgHwFcmCaSTsh2owJTJ4fslDQlRULWxn7GmNPQkloFkYGMEQRryNJ4SaCBAbhY01Y4TRoGXOnM%2BOgFFw%2BePVrlewGxrZg0yvwMQBQ6bVfnkhX4u7l%2F678q%2FoVkxKkWuz8MVef%2BRZmAgmdnhZI9OuMX2snw3lrDitTRPetVDJyWKV5vxzBxH0MY7LoWZc8vxG0aPRG81Ds%2FdIVheM8BWgJZSzLv9j13JNMlT0IBSrofxQzlwrxXRWMg2OujTJT0c%2Fu0VUIZgzhwfvxsZTJr%2BqTvjg6zNJBvVZEMxt%2Fx67xIJ9jW%2F67bYasLCAOfKyu37b4SRM8o5eww%2FCyJNSQKbZRjI5J7YD9zWAZRS0o5e5Uy04KE0dxwCdJpuiZ4bkDILfNZNEHSQpwVHa605jvVTouiVH8e8ttgSXqfAVtOLnGmNhrjdEtG9kYg6bsdK5bywjsLwC52WWY2useoHYmW%2BnqMMS%2FQ0CYhqK5IRP9%2BUz9FHDFY%2F9CD%2F4gAIuS2i76j%2BKSEkDBZMPP71tMGOqUBX%2FbTLjCZEhbuqBRO99TNGYKUcOAdvcXVYW9bwGZ%2FTDzXHWPngeRZP0wvE2K9ub2OwTQUKL0zP5GxZW8Wonhfo6k7FXeNcgba2Oz%2FwY6ULJRdeO3X%2F4LOvMfXnzX5jadjhd7HaVJR2btr%2FrMrPgoJ4%2BytQQG2ez4oEEtYI845XC8mHg%2F6b7cwb1ctKlUL1ow9TciXXfGgXWawYz2S8T7OnNxL4St3&X-Amz-Signature=584428aa93ad7d24a9eb823ce54405938d4d41b50dd8c4aaee0fedfd51a3401a&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

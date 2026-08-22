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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466W76UFH6I%2F20260822%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260822T181333Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEPn%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQDQ1Bxfxw12P%2BWmz73I%2FO2DnyDYmZXB5Yl3970dYtz%2FZAIhALlRzvHx7RoS8uJ6L3BRplxvaodLe6Zgh%2BHQEUHAkCV1KogECML%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgwjwrB1yMxQmkFXxMwq3ANadMKJlZ5gc8HiM5L%2BCqKTJfoWC0Bia43nIX9vfiLeTh1ln%2BI5%2BFlM0Bz34FqZ6xtCM3J79IjmuUqaCbr3fF9CvW3uRrKfCeqO4ZcKOsSNk6TKua8tfQp%2BI32VtGvLJmlFH9RZPK4PvfYiE%2FY6ne4Dd68%2B1OYRBHgIZq1%2F20FHKohSpzAYTJSmvLSBlEJqVz%2BmDgnc0Vr6y73UeL0V%2FzomGKYKPqGleq4YrW9mCtz%2F49SojKTMYO83TjLzSSv4bsonEYAPP9yJ0jypX8Bdh7zq4wxrG7srKBcs7RC9wiQFj6%2BqtZ0IIaAA0Ka4ecze1azGjAxzHMaT7OxZBuKOiiMg42EQdXALrDs6jnVeh8KvVpelhyxzZK7HSI6p4P6%2FDyGL3Tfd%2BRnyqPybPkfWdH0xDRm2C%2FrfqLa4oXsksYipPl9Hjf5xvXokzoaKjf%2B3MrX%2FwhQCzasQGUwn6OYrTy%2B%2FQSHtgy82BPHgD719qCts3KWVFthnRkzxtdujeLja8tLzVBSwHdSqUIbSG%2BXcHln6Ko1r0CcUV3iXk9DA%2FZGPHqqissqeQVCjHjc6p33eZC0h4v3HbjJlTzhYf%2Fph0AP1N3sQNkT%2BKV7dEmbc7AzzzULnCXbvb1%2BBBo0osDDwsafUBjqkAdyth8ah8dTkNm14gD3YurQeIUPXPIwkNMFcH6lWUyxGXo%2Bd3fF2iu2v%2FGgJD7OddJ%2BgrDiAJr5WLpw%2Bo%2BiTif1Zy%2FPpw0tIMEQZCSlmkuEtPHXXTsnSpdpNovpS6n8Hof98vbXB56uHnzwGyaSY09AnujNBVi%2FjrvF17g2Nq4PY3BFT9F3simsNWl74%2BnAQta69fTdouhBBo17DaXjojPc3hgTL&X-Amz-Signature=033e999b885f1592ac3d81e7052aa9d8b29a88bfc9624a8f6a4c3a61fbe7c6b6&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466W76UFH6I%2F20260822%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260822T181333Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEPn%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQDQ1Bxfxw12P%2BWmz73I%2FO2DnyDYmZXB5Yl3970dYtz%2FZAIhALlRzvHx7RoS8uJ6L3BRplxvaodLe6Zgh%2BHQEUHAkCV1KogECML%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgwjwrB1yMxQmkFXxMwq3ANadMKJlZ5gc8HiM5L%2BCqKTJfoWC0Bia43nIX9vfiLeTh1ln%2BI5%2BFlM0Bz34FqZ6xtCM3J79IjmuUqaCbr3fF9CvW3uRrKfCeqO4ZcKOsSNk6TKua8tfQp%2BI32VtGvLJmlFH9RZPK4PvfYiE%2FY6ne4Dd68%2B1OYRBHgIZq1%2F20FHKohSpzAYTJSmvLSBlEJqVz%2BmDgnc0Vr6y73UeL0V%2FzomGKYKPqGleq4YrW9mCtz%2F49SojKTMYO83TjLzSSv4bsonEYAPP9yJ0jypX8Bdh7zq4wxrG7srKBcs7RC9wiQFj6%2BqtZ0IIaAA0Ka4ecze1azGjAxzHMaT7OxZBuKOiiMg42EQdXALrDs6jnVeh8KvVpelhyxzZK7HSI6p4P6%2FDyGL3Tfd%2BRnyqPybPkfWdH0xDRm2C%2FrfqLa4oXsksYipPl9Hjf5xvXokzoaKjf%2B3MrX%2FwhQCzasQGUwn6OYrTy%2B%2FQSHtgy82BPHgD719qCts3KWVFthnRkzxtdujeLja8tLzVBSwHdSqUIbSG%2BXcHln6Ko1r0CcUV3iXk9DA%2FZGPHqqissqeQVCjHjc6p33eZC0h4v3HbjJlTzhYf%2Fph0AP1N3sQNkT%2BKV7dEmbc7AzzzULnCXbvb1%2BBBo0osDDwsafUBjqkAdyth8ah8dTkNm14gD3YurQeIUPXPIwkNMFcH6lWUyxGXo%2Bd3fF2iu2v%2FGgJD7OddJ%2BgrDiAJr5WLpw%2Bo%2BiTif1Zy%2FPpw0tIMEQZCSlmkuEtPHXXTsnSpdpNovpS6n8Hof98vbXB56uHnzwGyaSY09AnujNBVi%2FjrvF17g2Nq4PY3BFT9F3simsNWl74%2BnAQta69fTdouhBBo17DaXjojPc3hgTL&X-Amz-Signature=16703be51535d8166dd561fcdf0231ede5aca759feacc3dc602c987eaacdec99&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

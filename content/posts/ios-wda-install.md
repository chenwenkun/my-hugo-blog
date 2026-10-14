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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466QAMSONQU%2F20261014%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261014T104851Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEOn%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIFJcslcnMqjRAO94hd7ifsKPWyiE%2FP%2Ftk%2BOGj2bbEw4tAiEA8GOqLw5uhvf7onfvohAwcuHLisRWk%2FORbZCqiJNJQh0qiAQIsv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDEy5vNm681wDJfcJjyrcAwe7iLtrCMcGJLvjHORgZ2KcP0WEINq8g3Y8A%2BcRbUM%2FwauSrdRurp4dBKGsTtyRXodstaXBAW3JZASK4WXNliEjtY4N4I9%2BeDb2MXMentecXuhLpS18BrPEbctWF1qALfp65KWKbStfGre8JygXIz4baBJTAkk%2F6UX%2FR%2B0Ds1MSAFCazHcu9R463WJJpSI2cG1g8ZN5N7rb2DB2aa96Wj4p7XmuKc4r1r1sTXMw%2Bif3rVP6pSjRVV8Pgs4Yd%2Fho3F3gSQSZM2OCneZ0oLg1dE%2F0U0opj1d1WpL3yDVh2ucVpdl5wKTvC6hbVAWqgulbsx34Y33ABWnTammOV%2Fy%2FA8EYu09VO8apEuxdFIbsKUEbQt1iAcPG06PnGGz7bTPtt7xAOcZcuLY67fW2wh99mDmjV65WSEJj8mAqASJvm%2FrYMdwO8f50fowxn%2FjhjwB9MfX7JF9tdAJKaELHA209Z1s8S%2F0dN%2Be6P6ITw%2FnjMavtvCO4NpYPJm5vb1BKGvQZzfIQ9HO6wAH9OsR9JlwNriM4vppPikbWPLWpFfus9iUl8Q57DVbZ3AZCBBovGARyzsUJBjMjNljLMBgvs1CAhCilsWKDFZquohJI0BnBXNVhChQsLlTSEqVI5DcPMNKLvdYGOqUBT7srt2fFdQGyDJbMAVI0aANepE6ZQxxNi7id8hUC8aJ5kF%2BLCvy%2FiEfg05FdQKCwsDXywHiJtIGjW9BxQFrvyECFNyqm0LxKye5hwzBTc8o5KekfBcpCIhtJREwiul1%2B6H8Pv1vajNFzZO5A3vsyqnhkLabKTUrgpv5PHdTEB1%2FYO7Sa6GKGkWTuZUjprGG2a7NknFCN9X4BEssCzBSOwTHSQwOP&X-Amz-Signature=7532ef6ed966ae18d1741e75513e31d95f5077180905ee1a3b05c72ebea9e807&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466QAMSONQU%2F20261014%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261014T104851Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEOn%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIFJcslcnMqjRAO94hd7ifsKPWyiE%2FP%2Ftk%2BOGj2bbEw4tAiEA8GOqLw5uhvf7onfvohAwcuHLisRWk%2FORbZCqiJNJQh0qiAQIsv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDEy5vNm681wDJfcJjyrcAwe7iLtrCMcGJLvjHORgZ2KcP0WEINq8g3Y8A%2BcRbUM%2FwauSrdRurp4dBKGsTtyRXodstaXBAW3JZASK4WXNliEjtY4N4I9%2BeDb2MXMentecXuhLpS18BrPEbctWF1qALfp65KWKbStfGre8JygXIz4baBJTAkk%2F6UX%2FR%2B0Ds1MSAFCazHcu9R463WJJpSI2cG1g8ZN5N7rb2DB2aa96Wj4p7XmuKc4r1r1sTXMw%2Bif3rVP6pSjRVV8Pgs4Yd%2Fho3F3gSQSZM2OCneZ0oLg1dE%2F0U0opj1d1WpL3yDVh2ucVpdl5wKTvC6hbVAWqgulbsx34Y33ABWnTammOV%2Fy%2FA8EYu09VO8apEuxdFIbsKUEbQt1iAcPG06PnGGz7bTPtt7xAOcZcuLY67fW2wh99mDmjV65WSEJj8mAqASJvm%2FrYMdwO8f50fowxn%2FjhjwB9MfX7JF9tdAJKaELHA209Z1s8S%2F0dN%2Be6P6ITw%2FnjMavtvCO4NpYPJm5vb1BKGvQZzfIQ9HO6wAH9OsR9JlwNriM4vppPikbWPLWpFfus9iUl8Q57DVbZ3AZCBBovGARyzsUJBjMjNljLMBgvs1CAhCilsWKDFZquohJI0BnBXNVhChQsLlTSEqVI5DcPMNKLvdYGOqUBT7srt2fFdQGyDJbMAVI0aANepE6ZQxxNi7id8hUC8aJ5kF%2BLCvy%2FiEfg05FdQKCwsDXywHiJtIGjW9BxQFrvyECFNyqm0LxKye5hwzBTc8o5KekfBcpCIhtJREwiul1%2B6H8Pv1vajNFzZO5A3vsyqnhkLabKTUrgpv5PHdTEB1%2FYO7Sa6GKGkWTuZUjprGG2a7NknFCN9X4BEssCzBSOwTHSQwOP&X-Amz-Signature=32c74f1ca42cce0c58cadd4baf5daa1588972d9810fa32494d109713af31dbb1&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

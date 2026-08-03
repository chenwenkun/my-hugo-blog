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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466ZFVJAN6H%2F20260803%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260803T092005Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjECgaCXVzLXdlc3QtMiJHMEUCIHHUmfLqtQYZss0GPPq7KWTYMv6rczNBXh7jVAa8Qh%2BCAiEApojeZIkdArXis2sKBSwgZwXrjsErvK84jqruRyP05WgqiAQI8P%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDBm1GHPfg6qtIEwrZircAwe2XZVVO4iCTxfipe7c8HTrmTYka0dL6ocadcRgc82dNTOJQXGco6GsDp0hkvE39lH%2B%2BYAHbOFteUi1%2BlUwHsXcXQhoqlfDvopPPGAMMBoBDOMEgMVRWzQDc%2FcDKyDMAy1km%2FS22zUS7i6if%2Fo%2BOVNiqE5P5X%2FSyX7CwIfeEE9uHo18gULdFfe%2FcFfG6Z0w4ErGEnPN%2BQqQHpQMU%2B79s3DqCOfWGItg9tvac06oFwtJi%2B5Y44Cz9ZyLJXNdcunocgl5KiMd6eGbnxeOS%2BW8vXThubbHmq2wo0ofSLjMmhVSQ5pdmRi44NST5lRJV1lRFJQdh3o4vDX1Cx%2BAE%2BG%2BWAA1Gg0MRSLJ%2FEVyCydL%2BXDn8qE5Qi3eFMfi4kudI8llKam1BsUolLI%2BDHfct8xIV5rdgNubf%2BO3kFkx9axUID2seumtCSRWOml720It0M11fT3Z2ysYWErGYjUGXSzzVieAjTYStB6c1W%2BuwmAC8NoZAoaAkTHRi9vzkCPInIO8Jg9TdmGBmeqFwLSGidpxFOK075cmCSaCffljESfi%2FnZokayAf6XdpG2DfrYhpS%2BikOmELLHlnSvTfTCMwOvvWN5ZhWFJiejxDPyCAc9GUUgtfdss4ElHzd63IyoiMOaIwdMGOqUBMjXlG8o%2Bmf%2F%2FZzsPPmehual1cl8HcHp2R8PhsdJcU7AIR6TzYYaOOTJA3OgNs9Xwfil2IjafwIg9jVaGfBGvpoa15UIoS%2B9Vbtaxp4h34fE6fxQexZdArURwXxw3dXilFKmg%2BkpPYvslyM9%2FNtUnN7mHX97V9UuLhm%2F6IZil9Y4Yoharme1mtk7Wy7epH1GewZk2NW2jl9ruZMi2QXJ7reOz6xId&X-Amz-Signature=04ceb3b9d9ace46aa5996337ee99d717c8ca500ed29f47637ff605f46b68f7b0&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466ZFVJAN6H%2F20260803%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260803T092006Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjECgaCXVzLXdlc3QtMiJHMEUCIHHUmfLqtQYZss0GPPq7KWTYMv6rczNBXh7jVAa8Qh%2BCAiEApojeZIkdArXis2sKBSwgZwXrjsErvK84jqruRyP05WgqiAQI8P%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDBm1GHPfg6qtIEwrZircAwe2XZVVO4iCTxfipe7c8HTrmTYka0dL6ocadcRgc82dNTOJQXGco6GsDp0hkvE39lH%2B%2BYAHbOFteUi1%2BlUwHsXcXQhoqlfDvopPPGAMMBoBDOMEgMVRWzQDc%2FcDKyDMAy1km%2FS22zUS7i6if%2Fo%2BOVNiqE5P5X%2FSyX7CwIfeEE9uHo18gULdFfe%2FcFfG6Z0w4ErGEnPN%2BQqQHpQMU%2B79s3DqCOfWGItg9tvac06oFwtJi%2B5Y44Cz9ZyLJXNdcunocgl5KiMd6eGbnxeOS%2BW8vXThubbHmq2wo0ofSLjMmhVSQ5pdmRi44NST5lRJV1lRFJQdh3o4vDX1Cx%2BAE%2BG%2BWAA1Gg0MRSLJ%2FEVyCydL%2BXDn8qE5Qi3eFMfi4kudI8llKam1BsUolLI%2BDHfct8xIV5rdgNubf%2BO3kFkx9axUID2seumtCSRWOml720It0M11fT3Z2ysYWErGYjUGXSzzVieAjTYStB6c1W%2BuwmAC8NoZAoaAkTHRi9vzkCPInIO8Jg9TdmGBmeqFwLSGidpxFOK075cmCSaCffljESfi%2FnZokayAf6XdpG2DfrYhpS%2BikOmELLHlnSvTfTCMwOvvWN5ZhWFJiejxDPyCAc9GUUgtfdss4ElHzd63IyoiMOaIwdMGOqUBMjXlG8o%2Bmf%2F%2FZzsPPmehual1cl8HcHp2R8PhsdJcU7AIR6TzYYaOOTJA3OgNs9Xwfil2IjafwIg9jVaGfBGvpoa15UIoS%2B9Vbtaxp4h34fE6fxQexZdArURwXxw3dXilFKmg%2BkpPYvslyM9%2FNtUnN7mHX97V9UuLhm%2F6IZil9Y4Yoharme1mtk7Wy7epH1GewZk2NW2jl9ruZMi2QXJ7reOz6xId&X-Amz-Signature=4cccecf18702fe5f84c099c219ea79af9a1c303cd150d2458d0084fd75436636&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466QORUTYJK%2F20261119%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261119T045725Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEEMaCXVzLXdlc3QtMiJIMEYCIQDOv9C8Up7WK095tuzOmlZcdAtom1dAmjo%2FkeMnG0tc1gIhAKv0TTrB0%2B999mt3IiGkh8jjYqCLzZTihMivPPFDJKiYKv8DCAsQABoMNjM3NDIzMTgzODA1IgyUo5m9HwibtdIQlaAq3AMMwvjlWiTXIqzOQKSWfZOUlImV3D8NTae3tl7v%2FWuqbJJqFds%2FNkLowtIZMNZHN1LFefKqY158T1VG%2F%2BJEiBJmH8kJrG8ySiU7lueQN9CKL5UZFTRfoldFOTMx8hpSVIMXUPwK5PNuox9Convd2hr34XlkDsu27ND89EdjG8gu2bvzaoZMEKEblYr2VYIP21G6Tws9IKb71mOruypqY3ilfoOYfMUhkBCDWkpfZRaGE1I2rCjOujZcMtWeKbMGDhy7Jxj2DFxhTcDlU2yOM6vQ6kA99YStkHl5VM1VYJUgB4aOLMaGkhVpwff8pdZFPDBVjdsHavkHkPveEMesOx%2FfnQ6K6J5WUynL8fDNMJlrUOZ5gM7Y1nmZ79ClA%2FI25%2FCinYSeJykciwQqzoANb1ZbyDpj0b70eMC7yx2tuoFkxM30s5502T1DyltYwQYeMLJ93ksKVL4I5esIUOQWmUPfusU0DHkbOXyu%2B85CnvAcYHNhAHbItx4BeF6d38Ov%2BtnzS71Fu%2BrjQI5rZd1PQuWP8p68zfnS8%2FzqOqQUdPr7Le0cEF%2B8oForj6valCn%2F3dw4WmE8v4TD%2BCY5Ke9Udz%2FKw1xoJtMISy91bXcpJPka0CTTXDg%2BTEdRcwvxVTDvy%2FnXBjqkAUr7Ep7B0At0wVvTCzcvECVo8DhhlzjlTvSZ3VT2d689rMLAn3DekzyVeJa82F%2BmPChwEZfFoCFuWKgSgw2sd8kO39CqnFJTIaiN%2FHLf%2BbXXWEzfFN5n6mvtCn%2BTx%2B02Sf0micLRAPTLb7SAwglwmNYlAtN%2FHXIwkAM%2F6ekYLqzsZf9Bq9lwIwgl3DqO2f24oxQ1oks7%2FuhfWzRq3H7oHMvY0pR%2B&X-Amz-Signature=c24b57b6b121565f32a0121f86e89a874f91f8a8d16d06e5838c097014e64f6c&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466QORUTYJK%2F20261119%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261119T045725Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEEMaCXVzLXdlc3QtMiJIMEYCIQDOv9C8Up7WK095tuzOmlZcdAtom1dAmjo%2FkeMnG0tc1gIhAKv0TTrB0%2B999mt3IiGkh8jjYqCLzZTihMivPPFDJKiYKv8DCAsQABoMNjM3NDIzMTgzODA1IgyUo5m9HwibtdIQlaAq3AMMwvjlWiTXIqzOQKSWfZOUlImV3D8NTae3tl7v%2FWuqbJJqFds%2FNkLowtIZMNZHN1LFefKqY158T1VG%2F%2BJEiBJmH8kJrG8ySiU7lueQN9CKL5UZFTRfoldFOTMx8hpSVIMXUPwK5PNuox9Convd2hr34XlkDsu27ND89EdjG8gu2bvzaoZMEKEblYr2VYIP21G6Tws9IKb71mOruypqY3ilfoOYfMUhkBCDWkpfZRaGE1I2rCjOujZcMtWeKbMGDhy7Jxj2DFxhTcDlU2yOM6vQ6kA99YStkHl5VM1VYJUgB4aOLMaGkhVpwff8pdZFPDBVjdsHavkHkPveEMesOx%2FfnQ6K6J5WUynL8fDNMJlrUOZ5gM7Y1nmZ79ClA%2FI25%2FCinYSeJykciwQqzoANb1ZbyDpj0b70eMC7yx2tuoFkxM30s5502T1DyltYwQYeMLJ93ksKVL4I5esIUOQWmUPfusU0DHkbOXyu%2B85CnvAcYHNhAHbItx4BeF6d38Ov%2BtnzS71Fu%2BrjQI5rZd1PQuWP8p68zfnS8%2FzqOqQUdPr7Le0cEF%2B8oForj6valCn%2F3dw4WmE8v4TD%2BCY5Ke9Udz%2FKw1xoJtMISy91bXcpJPka0CTTXDg%2BTEdRcwvxVTDvy%2FnXBjqkAUr7Ep7B0At0wVvTCzcvECVo8DhhlzjlTvSZ3VT2d689rMLAn3DekzyVeJa82F%2BmPChwEZfFoCFuWKgSgw2sd8kO39CqnFJTIaiN%2FHLf%2BbXXWEzfFN5n6mvtCn%2BTx%2B02Sf0micLRAPTLb7SAwglwmNYlAtN%2FHXIwkAM%2F6ekYLqzsZf9Bq9lwIwgl3DqO2f24oxQ1oks7%2FuhfWzRq3H7oHMvY0pR%2B&X-Amz-Signature=cf69fc6719209c98441d4a3a7fd3536d7427c5dbe424bb00621822481528ef15&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4666DKEK3SO%2F20261022%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261022T104829Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEKv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCFTuTgnfkVbGrivOdcDYnZLPG3D5XEvSZ7BjRGhXUmDAIhAN524sL7CBoaarN9vGnLH9KUOe0HHMce4ipzelJ69KrbKv8DCHMQABoMNjM3NDIzMTgzODA1Igw6O7jttUpo0lCvczIq3AOKQSTOCiELIafoi9ZekfsHvNec3G0pO28UKS96jqP3ztjAjNQGkleUfGeVD80OdMWknJ9tPOKCb1GaUOOLvhB2AIOmXKI4as8Ko5aSax0jJrzJClt%2FOG5%2BNrTp3yf%2BGpyf2500vnystJY1TkIUgdPvQWV9g%2Bjqa4wG3TTouhquIMhkM11oczIe67JSEozQ4YDFDtMN79TllVTczELiN0QxjzYoK0sf5zdHd%2BhR502MT%2BwTo6s%2FwyCLK5%2BLFwSTOpglbCfoGlxrNVCSd%2B0pMSn8ndCwUmB%2BVWzVkowB9YQhMq5ZVrHAqiUNkeK1MQ6gTIdcvTF5srjMyVl45nagBPe%2FAREjFY%2BrJa7HN4VoLC5ldgcizykefxDDJzRoVeAmHVAhpvaadO5XXRXZKyI7%2BsLYnCH8XvOgMbmEwAJT5S9IpsnMuFA3D5NydfyiX4dCAAmOvy6eGpTMog1V%2BuasnI6kgPJsULrd2FggKpQv2ksyKjY2ukDCHAhJkkfce8bVFmP9bfyt%2FczGDLx96bluAy57ReqPxDoTMzYkhcetLjua9NPZSN4giXVbIswpo6xyEgN%2FpIkO2HfSfRzmuq6yRC1UXEM1RqWZ7%2FbCRezD%2Ff55IUAJvHEVzAT%2BrjETgDDNyufWBjqkAZXfHTUX0ojoUC8NGZK1jt7C9HgTXSuaJmNS0ah0QXHuIG0XfgnLEbtyDS67rWj9YQqb9N%2BP1%2BcJCfAM%2B%2FXyzpPjKhkq%2FklOhV%2B6SwnarDfItK3gSvalK4DVqQfm4dNQBfPpv17sODglT%2BNTUPDX5UYbDb24KztxcctStwtG3kxNRqOqBcSyNyFOGn11q9dZdOJnd4YRv%2FhHHF7p5Yn2oNCxMIzu&X-Amz-Signature=6c2985392681e695c169d7b30e00e271baf55dd8e9f0c0afa73b628206af0b84&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4666DKEK3SO%2F20261022%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261022T104829Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEKv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCFTuTgnfkVbGrivOdcDYnZLPG3D5XEvSZ7BjRGhXUmDAIhAN524sL7CBoaarN9vGnLH9KUOe0HHMce4ipzelJ69KrbKv8DCHMQABoMNjM3NDIzMTgzODA1Igw6O7jttUpo0lCvczIq3AOKQSTOCiELIafoi9ZekfsHvNec3G0pO28UKS96jqP3ztjAjNQGkleUfGeVD80OdMWknJ9tPOKCb1GaUOOLvhB2AIOmXKI4as8Ko5aSax0jJrzJClt%2FOG5%2BNrTp3yf%2BGpyf2500vnystJY1TkIUgdPvQWV9g%2Bjqa4wG3TTouhquIMhkM11oczIe67JSEozQ4YDFDtMN79TllVTczELiN0QxjzYoK0sf5zdHd%2BhR502MT%2BwTo6s%2FwyCLK5%2BLFwSTOpglbCfoGlxrNVCSd%2B0pMSn8ndCwUmB%2BVWzVkowB9YQhMq5ZVrHAqiUNkeK1MQ6gTIdcvTF5srjMyVl45nagBPe%2FAREjFY%2BrJa7HN4VoLC5ldgcizykefxDDJzRoVeAmHVAhpvaadO5XXRXZKyI7%2BsLYnCH8XvOgMbmEwAJT5S9IpsnMuFA3D5NydfyiX4dCAAmOvy6eGpTMog1V%2BuasnI6kgPJsULrd2FggKpQv2ksyKjY2ukDCHAhJkkfce8bVFmP9bfyt%2FczGDLx96bluAy57ReqPxDoTMzYkhcetLjua9NPZSN4giXVbIswpo6xyEgN%2FpIkO2HfSfRzmuq6yRC1UXEM1RqWZ7%2FbCRezD%2Ff55IUAJvHEVzAT%2BrjETgDDNyufWBjqkAZXfHTUX0ojoUC8NGZK1jt7C9HgTXSuaJmNS0ah0QXHuIG0XfgnLEbtyDS67rWj9YQqb9N%2BP1%2BcJCfAM%2B%2FXyzpPjKhkq%2FklOhV%2B6SwnarDfItK3gSvalK4DVqQfm4dNQBfPpv17sODglT%2BNTUPDX5UYbDb24KztxcctStwtG3kxNRqOqBcSyNyFOGn11q9dZdOJnd4YRv%2FhHHF7p5Yn2oNCxMIzu&X-Amz-Signature=fa44aef1248a9e7cc898211143062a524a7df8862ffb32e885073396c8785d3d&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

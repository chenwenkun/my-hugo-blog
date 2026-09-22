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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466ZBOASUSJ%2F20260922%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260922T155511Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEN7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIDLvo05xkFUO2a%2BrU4aHFY47EcoZqrs37Xx%2F6On8cdasAiEA7UnNL41xKeDP4WB1OS8QMiT2sEUVJv%2BJ04xwWztM6r0qiAQIp%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDM%2BHnFGxhe2QNwFhSCrcA9WzpsvSG%2FnIHJLu7btHpPkL2dsPmiUagtbdqQdKJhJxMQW63rWAiBFxLBINcPrsx5NYKeaR2il1a9hxux4k%2FvKDZEUD%2FUnfDgV%2BZVZ4MMWGZpaj5iAEFl0Y75tSGneWmYQ3F1FUUw1NiqYal8zvRnvGvqXuqqZPSxhAsuZor5CbR2oPxoH2gmV65jpNDRMotTnz6YXO%2BZQL35YoQIehOscY6fGUsyBvx3x3lqNr5wJ5ShzK7atADCXfdB9KolOcfQeCh6PsJiUNrDdsW%2FsusU3vFiYkYM8DioZvjVCzTHZ0jChGIhVbZGaoGxJOMLq5ozW8BWwgnBvfM62ZHNVNDuyuT8Y5gtdD8ZRkAcMZzGY72DXcPTPM%2Bb82C7dVLu4GR5jrjhxAzfEs9cb%2FLFFDrK6UiofxOikNeAYeISiZAgRcHzmlnBDlJNLhGA5AcXS5ABVQi8Da56Y%2FYIavyI7EUaATsqdIzLYcnnEV71nF2K401aJezoYg1NdF83fie1U%2F97CZTiI3kYOkDj%2Bw8q9%2BbEvevDcYUNvR%2Fnd7fgWsj1Wl1sIlshl73JyIKUVIEqW%2FFX3xOL135ghSXwbIGjW4rpMRhGHU0y%2Bayrw2xcOpF34d2kzpYfhYns%2Bwf3NtMIiNytUGOqUBQ90I%2BOfozUCSOfQB5BYDue0mLyd%2FxLWfllneUAbSGwIX%2Bz7g6vzzp1WPETZC8xncepCHItmhrNjxTt16zGToMiaIzd%2BXLJYfAZq5JA0U0CNCGEWBwLa5kgqmidDxZd9DsaVMmbOvZzBabl7MwQjn8sYNTFBu%2FvOgRmUmdYlNV%2BLL2jAM7aLyVmut3QWW0mpfq7I%2FaX7fEvvhmVF4BrZjMdERkwWw&X-Amz-Signature=8ed2c3685ca1f1b5f105f1e9262960a05aff1a8cd8e2deb4bc1f452ab28461ee&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466ZBOASUSJ%2F20260922%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260922T155511Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEN7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIDLvo05xkFUO2a%2BrU4aHFY47EcoZqrs37Xx%2F6On8cdasAiEA7UnNL41xKeDP4WB1OS8QMiT2sEUVJv%2BJ04xwWztM6r0qiAQIp%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDM%2BHnFGxhe2QNwFhSCrcA9WzpsvSG%2FnIHJLu7btHpPkL2dsPmiUagtbdqQdKJhJxMQW63rWAiBFxLBINcPrsx5NYKeaR2il1a9hxux4k%2FvKDZEUD%2FUnfDgV%2BZVZ4MMWGZpaj5iAEFl0Y75tSGneWmYQ3F1FUUw1NiqYal8zvRnvGvqXuqqZPSxhAsuZor5CbR2oPxoH2gmV65jpNDRMotTnz6YXO%2BZQL35YoQIehOscY6fGUsyBvx3x3lqNr5wJ5ShzK7atADCXfdB9KolOcfQeCh6PsJiUNrDdsW%2FsusU3vFiYkYM8DioZvjVCzTHZ0jChGIhVbZGaoGxJOMLq5ozW8BWwgnBvfM62ZHNVNDuyuT8Y5gtdD8ZRkAcMZzGY72DXcPTPM%2Bb82C7dVLu4GR5jrjhxAzfEs9cb%2FLFFDrK6UiofxOikNeAYeISiZAgRcHzmlnBDlJNLhGA5AcXS5ABVQi8Da56Y%2FYIavyI7EUaATsqdIzLYcnnEV71nF2K401aJezoYg1NdF83fie1U%2F97CZTiI3kYOkDj%2Bw8q9%2BbEvevDcYUNvR%2Fnd7fgWsj1Wl1sIlshl73JyIKUVIEqW%2FFX3xOL135ghSXwbIGjW4rpMRhGHU0y%2Bayrw2xcOpF34d2kzpYfhYns%2Bwf3NtMIiNytUGOqUBQ90I%2BOfozUCSOfQB5BYDue0mLyd%2FxLWfllneUAbSGwIX%2Bz7g6vzzp1WPETZC8xncepCHItmhrNjxTt16zGToMiaIzd%2BXLJYfAZq5JA0U0CNCGEWBwLa5kgqmidDxZd9DsaVMmbOvZzBabl7MwQjn8sYNTFBu%2FvOgRmUmdYlNV%2BLL2jAM7aLyVmut3QWW0mpfq7I%2FaX7fEvvhmVF4BrZjMdERkwWw&X-Amz-Signature=f156baa9fc12389d9f4c960ee31554e17695ca4ced6b9851be7ff3a8235b3ef7&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

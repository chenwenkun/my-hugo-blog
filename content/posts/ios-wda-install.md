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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466ZNDUUPRF%2F20261020%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261020T023236Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEHIaCXVzLXdlc3QtMiJHMEUCIQDo5cqk1hsSOHn6UKQ0AwLpZBtXCIabaNfShDvTfHWd3wIgBz%2FqJl9%2BygviBCqOYk1L5i6kHOfhH8TpqiPOhL%2FqObwq%2FwMIOxAAGgw2Mzc0MjMxODM4MDUiDNRbHQPxQWtNleWl2yrcA5fEQ%2F1%2BbHEyfOWC04ixl%2F%2F7XrvAnXoGcM7DZ%2Bgf4PM6xrmddAZaKQkJBwleVPYe8%2FJfaNiWgtprm2ftNO%2FS5y0KvNz9KyfkL15Cwu2IdDqzkBFon6Buz9bSSdSutXduOn6jWjoGAGxYI6ShgZHXK0j%2By%2FCo4WeWIZf5s9HHgS4bxmovvSO9O4GvWVf5e%2Bq2HUC%2BXP%2BavnR0d6u6mk%2FJgbGLAxOhPsYZwXy2SgUqEkNVG5ZKeTOl0TkZcZDgG71xSIcM7MkjZSKB%2BbgjoLtE7x8rop6LfSNaomlqBkCGhftdwL8dOK%2FzFpnpTCdW1sfLJeIRdnbIkRQeRanuC7CrIuNOB2lV71vMQmbm2Gp91fre6XUyfIAE2IWyDzwDT5g9eacQN0GDuB1a8%2FYllOHGnAfKvHVierpPJDcCca%2FAfeG8ADGgLgM0fOiBB11m73NhS81yGYHdf14ib7mnjFpUo7p7F0f2dnxm4naVB6QWKc5228rWinDX%2FTdptRU2U6qRh%2FggISMUgSxm5sj%2BuXRnU11UH9eIyVqfECEuF4y3PP0%2F5%2Flct1ziSr%2FurPTQBlsErupOEgSXnoAK7Y8Gw1vBq9bCyX8nfGoQiEGpnBPphrPx4bLmgpiWyuhvgBOQMLue29YGOqUBB%2B69Gr1qhhjPjN%2BJWywFEXAR2UtgTB2gOwogAX%2Bf8XwKFo6MDxzLepVEo4xg1R46xzQmVmeo09BOXbQPp9GCv%2Fu2fTpmzyVxTjg%2FWPbvrivTjRq1L9eTjNW6SHbaujAVF9QEXRG0ao6nSLOfal026Cf3wf%2FtRxg47LWI6Qlb2QX6IIbJzm5G9FhrRQLd3006PRWAUyAAB9COkTMJ5FkhmjZg8tXC&X-Amz-Signature=107be162c45754a8842e822d605af98b09cdd8117d13962291869da5cba6abc3&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466ZNDUUPRF%2F20261020%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261020T023236Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEHIaCXVzLXdlc3QtMiJHMEUCIQDo5cqk1hsSOHn6UKQ0AwLpZBtXCIabaNfShDvTfHWd3wIgBz%2FqJl9%2BygviBCqOYk1L5i6kHOfhH8TpqiPOhL%2FqObwq%2FwMIOxAAGgw2Mzc0MjMxODM4MDUiDNRbHQPxQWtNleWl2yrcA5fEQ%2F1%2BbHEyfOWC04ixl%2F%2F7XrvAnXoGcM7DZ%2Bgf4PM6xrmddAZaKQkJBwleVPYe8%2FJfaNiWgtprm2ftNO%2FS5y0KvNz9KyfkL15Cwu2IdDqzkBFon6Buz9bSSdSutXduOn6jWjoGAGxYI6ShgZHXK0j%2By%2FCo4WeWIZf5s9HHgS4bxmovvSO9O4GvWVf5e%2Bq2HUC%2BXP%2BavnR0d6u6mk%2FJgbGLAxOhPsYZwXy2SgUqEkNVG5ZKeTOl0TkZcZDgG71xSIcM7MkjZSKB%2BbgjoLtE7x8rop6LfSNaomlqBkCGhftdwL8dOK%2FzFpnpTCdW1sfLJeIRdnbIkRQeRanuC7CrIuNOB2lV71vMQmbm2Gp91fre6XUyfIAE2IWyDzwDT5g9eacQN0GDuB1a8%2FYllOHGnAfKvHVierpPJDcCca%2FAfeG8ADGgLgM0fOiBB11m73NhS81yGYHdf14ib7mnjFpUo7p7F0f2dnxm4naVB6QWKc5228rWinDX%2FTdptRU2U6qRh%2FggISMUgSxm5sj%2BuXRnU11UH9eIyVqfECEuF4y3PP0%2F5%2Flct1ziSr%2FurPTQBlsErupOEgSXnoAK7Y8Gw1vBq9bCyX8nfGoQiEGpnBPphrPx4bLmgpiWyuhvgBOQMLue29YGOqUBB%2B69Gr1qhhjPjN%2BJWywFEXAR2UtgTB2gOwogAX%2Bf8XwKFo6MDxzLepVEo4xg1R46xzQmVmeo09BOXbQPp9GCv%2Fu2fTpmzyVxTjg%2FWPbvrivTjRq1L9eTjNW6SHbaujAVF9QEXRG0ao6nSLOfal026Cf3wf%2FtRxg47LWI6Qlb2QX6IIbJzm5G9FhrRQLd3006PRWAUyAAB9COkTMJ5FkhmjZg8tXC&X-Amz-Signature=0c89e65ddd8c34bbdc7e23b14ad4ee87c2daa44647b64010ab4dbcc1e1aa9dbe&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

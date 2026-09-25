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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466QSGJXFVB%2F20260925%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260925T022451Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEBoaCXVzLXdlc3QtMiJGMEQCIHYexYQfqgRcYks5oyYFtpPSRoQqwhwHkKVMr0ylcd%2FJAiAHwM6LKmyUBMB%2FA5h1zVxiiKHX5%2BOA15ZAWvtURPISPiqIBAji%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIM5WYYL0EPFsGL78QXKtwD9pAvesQk%2BIimsB4ft20lpbvVKiJ3hD5xM5%2B96d0AeaTKDmU9JygmzyrHt0PRZmFTfw1JdbNP1YGA%2BHfh2V%2Bf7y%2BrPiwgm%2FiDA1stHfV7avlgZsQ1TKCwmkiLhMqu9hfsB7%2Fx31j75X63Q0FaVidk77dWNnz2iIVILKj2vC2pyBsMq6fJtcuQL8tAHAQgjENFpzXN4Cte%2FOmo%2BcZ9tiu23FhdpyTwgVkdKtK6SiPaFk6XgiRL1XqM0eO5eKoGIjTb8ap4tXyztFgMJLL%2FfTaLGcoRw6hfLVcWIbhBGh1Z3LdjpgVT1NVOOMvCgns6SrxkKnrpIs0Nd2bQNznx%2BUUDFChveNYG7B%2F1mJGYEiCYz6acN65Hk8qDESnViK6%2B0Ha8jFnEJXv56G0fHS8RDZ50Lg%2FhsIcmbdlCYsPFK0NjYWvlnoJm6czSOCGF5ECseLNy1AO%2BwUzedTNBMWU0pyFe9beTISRWyViVtzq8LJeDZt0yLXhJSxBzol%2BG3uOiGkHo%2FCRF%2FLdf0gP96Z%2B4UKdwm5S%2FvY0mGXjQtqt5hJk9xLkE%2FZgtgQbvxnrYWr66DeJesyzfq8sEy2qYKiaoUcyuQwz1CbxLrXHsn9vNjMcGDG35DBlxFIstRZUlO%2Bww85fX1QY6pgFnPaIHf5ZJvzJi%2B%2FH4Xe1zulbw2QHIlbSksg%2Bgm3nmCP%2FOQ7lGYOVa4QWamJcL9Nc7TQDCm%2F5BJw4pitKd%2BdZ98n%2BLeiHABySPJL2BmNlGQxOEfDD%2B20E3PKeRY5TkRqbabVQyhw8h3FDcRRcmhokMTSgHlcfF52xNxJFqm5o68f%2Bp6NqbyOMvsY9b41f9bXXyIvchi%2B3JHjGlebjVSZrCsXR%2FzRYp&X-Amz-Signature=81d5f809b435d15c3176a760b485ccc6568f8ce5d961ad8d320f151e1ece72db&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466QSGJXFVB%2F20260925%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260925T022451Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEBoaCXVzLXdlc3QtMiJGMEQCIHYexYQfqgRcYks5oyYFtpPSRoQqwhwHkKVMr0ylcd%2FJAiAHwM6LKmyUBMB%2FA5h1zVxiiKHX5%2BOA15ZAWvtURPISPiqIBAji%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIM5WYYL0EPFsGL78QXKtwD9pAvesQk%2BIimsB4ft20lpbvVKiJ3hD5xM5%2B96d0AeaTKDmU9JygmzyrHt0PRZmFTfw1JdbNP1YGA%2BHfh2V%2Bf7y%2BrPiwgm%2FiDA1stHfV7avlgZsQ1TKCwmkiLhMqu9hfsB7%2Fx31j75X63Q0FaVidk77dWNnz2iIVILKj2vC2pyBsMq6fJtcuQL8tAHAQgjENFpzXN4Cte%2FOmo%2BcZ9tiu23FhdpyTwgVkdKtK6SiPaFk6XgiRL1XqM0eO5eKoGIjTb8ap4tXyztFgMJLL%2FfTaLGcoRw6hfLVcWIbhBGh1Z3LdjpgVT1NVOOMvCgns6SrxkKnrpIs0Nd2bQNznx%2BUUDFChveNYG7B%2F1mJGYEiCYz6acN65Hk8qDESnViK6%2B0Ha8jFnEJXv56G0fHS8RDZ50Lg%2FhsIcmbdlCYsPFK0NjYWvlnoJm6czSOCGF5ECseLNy1AO%2BwUzedTNBMWU0pyFe9beTISRWyViVtzq8LJeDZt0yLXhJSxBzol%2BG3uOiGkHo%2FCRF%2FLdf0gP96Z%2B4UKdwm5S%2FvY0mGXjQtqt5hJk9xLkE%2FZgtgQbvxnrYWr66DeJesyzfq8sEy2qYKiaoUcyuQwz1CbxLrXHsn9vNjMcGDG35DBlxFIstRZUlO%2Bww85fX1QY6pgFnPaIHf5ZJvzJi%2B%2FH4Xe1zulbw2QHIlbSksg%2Bgm3nmCP%2FOQ7lGYOVa4QWamJcL9Nc7TQDCm%2F5BJw4pitKd%2BdZ98n%2BLeiHABySPJL2BmNlGQxOEfDD%2B20E3PKeRY5TkRqbabVQyhw8h3FDcRRcmhokMTSgHlcfF52xNxJFqm5o68f%2Bp6NqbyOMvsY9b41f9bXXyIvchi%2B3JHjGlebjVSZrCsXR%2FzRYp&X-Amz-Signature=9d4daac788e6b7487a11de99a6b547bd90bb7539b1a37812b9521af86b82e334&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

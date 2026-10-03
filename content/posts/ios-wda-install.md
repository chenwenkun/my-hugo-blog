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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466QMNEQDY7%2F20261003%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261003T152338Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEOj%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIHOxOxQFG%2FBt6p6UY1rOzPu9ICucI3kL67k2DuO8VRltAiBXy3LXMaWSfwp2vx%2F6P5nZCAuTgrNLqRkWSHj6ZIt0%2ByqIBAiw%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMrce0Harz4HnjG4stKtwDmyW4XSeeKSopRdT8nyobI6ZOkhG3K9DYR1DeIZBknPrLlYAAouNmB9lUFo8EEA09gsBLLjOywrNSbvhSrzIm02yZ8M1Gk80wNftHkQZhLz7OQnUGUcpGsub3Rh15i7Z5MvObjNW6bwovaYH2RWE%2F8Rj9R0MHmtnD4EQrjftVekdPowI%2BxAmvJF2Cmz4lno9ROThU2FAB2TjDEK7yh1jFyv6RFIdXBFZVcQ1V%2BeXoHEZu2415RPp4l8%2FXCCEV4V6k%2BhX8TN0XH89i%2FXXpbiO21zHDx%2BGwMSrGwjIwRAZo0YAMCO6oWn7VzV3%2By0C1MjNZN45Vgnv6CmIPEKlt9I1Mz2mNs4Wg2W0zhrKuJ8VmrFrlyiZ4bcq10KzudriBUJ2Nyq8AC%2ByUTkWam9xuXhjjtBahFdIb7xxFTLnf4Y1CZuU6aoyqceP0%2FMn7W4sJeGHnczEPfker3WWlr3rJBgWBfzarrueOv%2BB5AUXX4bO7rjY1gnhRDKsYOsK%2FRn8ZQGbVlOsN8s%2Fu3lEce4tQ3iw4Rg0C8P8XIsbYnUjy43l7L%2FMeYJklp0aitpgBpiYT%2BoII4KDIa2hpI0gACjvyBCoUfPKyWkG%2BrHqjxBV%2FETmh4cLSXEr4sthckMGTR4ow6bmE1gY6pgFt2pTnVJi%2FXmX7ijMOD%2FkCWKIzDxkrqcEbJEAXmciCmtsTWEA9dVl46v80uW4KdrXYy01yiRu7GZSx%2FNZcfI08%2F9z9eR3167nQ6e5vPbGGHDv4htCBIZuS5r11CztJ%2FPkAVfDPrZUGazJWniUpnEax8zil0C1Wd%2B7YeHLcihbEV7CnPac6U16WD8R9BacoK26avCod2S%2FWhaEasuNNOplbEzjRvgfC&X-Amz-Signature=9c6cfb2c1f6ed3fd1f012571d24d52256857cc4f0efbf7ec0c7fed52f26dfb31&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466QMNEQDY7%2F20261003%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261003T152339Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEOj%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIHOxOxQFG%2FBt6p6UY1rOzPu9ICucI3kL67k2DuO8VRltAiBXy3LXMaWSfwp2vx%2F6P5nZCAuTgrNLqRkWSHj6ZIt0%2ByqIBAiw%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMrce0Harz4HnjG4stKtwDmyW4XSeeKSopRdT8nyobI6ZOkhG3K9DYR1DeIZBknPrLlYAAouNmB9lUFo8EEA09gsBLLjOywrNSbvhSrzIm02yZ8M1Gk80wNftHkQZhLz7OQnUGUcpGsub3Rh15i7Z5MvObjNW6bwovaYH2RWE%2F8Rj9R0MHmtnD4EQrjftVekdPowI%2BxAmvJF2Cmz4lno9ROThU2FAB2TjDEK7yh1jFyv6RFIdXBFZVcQ1V%2BeXoHEZu2415RPp4l8%2FXCCEV4V6k%2BhX8TN0XH89i%2FXXpbiO21zHDx%2BGwMSrGwjIwRAZo0YAMCO6oWn7VzV3%2By0C1MjNZN45Vgnv6CmIPEKlt9I1Mz2mNs4Wg2W0zhrKuJ8VmrFrlyiZ4bcq10KzudriBUJ2Nyq8AC%2ByUTkWam9xuXhjjtBahFdIb7xxFTLnf4Y1CZuU6aoyqceP0%2FMn7W4sJeGHnczEPfker3WWlr3rJBgWBfzarrueOv%2BB5AUXX4bO7rjY1gnhRDKsYOsK%2FRn8ZQGbVlOsN8s%2Fu3lEce4tQ3iw4Rg0C8P8XIsbYnUjy43l7L%2FMeYJklp0aitpgBpiYT%2BoII4KDIa2hpI0gACjvyBCoUfPKyWkG%2BrHqjxBV%2FETmh4cLSXEr4sthckMGTR4ow6bmE1gY6pgFt2pTnVJi%2FXmX7ijMOD%2FkCWKIzDxkrqcEbJEAXmciCmtsTWEA9dVl46v80uW4KdrXYy01yiRu7GZSx%2FNZcfI08%2F9z9eR3167nQ6e5vPbGGHDv4htCBIZuS5r11CztJ%2FPkAVfDPrZUGazJWniUpnEax8zil0C1Wd%2B7YeHLcihbEV7CnPac6U16WD8R9BacoK26avCod2S%2FWhaEasuNNOplbEzjRvgfC&X-Amz-Signature=f69d5d5c313fba886c1779249491b83d67008df2a915d5fbb065e26dcb88f17a&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466ZKG7IIAA%2F20260915%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260915T155246Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEDgaCXVzLXdlc3QtMiJIMEYCIQDsgSMWP%2BjIl2hnngC25MSUb0igfxY%2BB3IYjjhL7YOACAIhAPbvPj%2F0EbaDyVelAg51%2F%2ByrE%2FWDYHutqbm6qyFlU5DgKv8DCAEQABoMNjM3NDIzMTgzODA1Igwewh2GqSp%2Fw992kx4q3ANy9sGoCe9DI%2FQLQ9kE%2BNu6MfYzk71nM4FV7ikNITg2wMiFkOyayMms1f9PLMJSi6Ey9QL97uCQyldBNE%2FwWPije6mHlfEKIIVmVxBjTRpR5hmalu8SD6bXwmEPP4%2FEkUQ8jCT3SDlIPiaTsB%2FLIaabzDO3UO33e2oZ7I5LRBfCxQ6yNQMBFCW%2Bk9SaYQegIlQcio%2B7ORqJEyPu5%2Foz2%2FwZnSglTT6YbaHgIpZTVsUtsqFEJD2sbNElRSnmJvzLFphXif35GTEctpOxAgWTnKMpvcw0dRQoSIf2LtE1EvuyW%2F%2BMQAdhcxetyl92E7q%2FCrkQz7wfbV8py6GIjVABy%2BB4VthecI2rPcQ9G%2Fdm%2FwUiD7J6u37XlqaP1Pv079gndCUZVbb8gzBlCY4x72LoWT6UbNJTtJxUt6HJoqGHmio10TVZ9HdSMnoP95Q49OnexrjJIjzS6m7y%2BiiVt5GEda3zlfdl2h2NLkE9L7rp2WEMmV%2BA727WxW7j35HgHu5uJ0urc1X84meEVZZGQLWOaqILO8ndFBO2inzKGGfOogrb8owbXTzrRn2rSJOohgHq9yMQ7z0ljObNICakFJTv%2BZ%2BM6e%2FVlYyiDZnqrQpDSwkRRny3l0VbE2DGl%2BUV8DD60aXVBjqkARlwv2k5VWVD%2FIcQW3KrM2VAA5yi2ghJU5GxbWPnkzdOVEu8UsqXxMUowfkvyvIMVxk%2B3O0TV8RlZj97X3FSHDUt538gvwTy9N0jfpNNVKoaY%2BTTN2mdSTst%2BRmIrG8R2SUqVQj0QNjf%2FRTmTTMMfAdUJt4kVAoE%2FmkaHnSCFJk4KAik%2BdKaHmGi%2FrOUAO1i8mSqkoIT2gj3UTuTnv6IQIc8xr%2Bi&X-Amz-Signature=c40b9275890259690c91845768cd3a01cf5f4f231f97857095cebc118c6c6762&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466ZKG7IIAA%2F20260915%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260915T155246Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEDgaCXVzLXdlc3QtMiJIMEYCIQDsgSMWP%2BjIl2hnngC25MSUb0igfxY%2BB3IYjjhL7YOACAIhAPbvPj%2F0EbaDyVelAg51%2F%2ByrE%2FWDYHutqbm6qyFlU5DgKv8DCAEQABoMNjM3NDIzMTgzODA1Igwewh2GqSp%2Fw992kx4q3ANy9sGoCe9DI%2FQLQ9kE%2BNu6MfYzk71nM4FV7ikNITg2wMiFkOyayMms1f9PLMJSi6Ey9QL97uCQyldBNE%2FwWPije6mHlfEKIIVmVxBjTRpR5hmalu8SD6bXwmEPP4%2FEkUQ8jCT3SDlIPiaTsB%2FLIaabzDO3UO33e2oZ7I5LRBfCxQ6yNQMBFCW%2Bk9SaYQegIlQcio%2B7ORqJEyPu5%2Foz2%2FwZnSglTT6YbaHgIpZTVsUtsqFEJD2sbNElRSnmJvzLFphXif35GTEctpOxAgWTnKMpvcw0dRQoSIf2LtE1EvuyW%2F%2BMQAdhcxetyl92E7q%2FCrkQz7wfbV8py6GIjVABy%2BB4VthecI2rPcQ9G%2Fdm%2FwUiD7J6u37XlqaP1Pv079gndCUZVbb8gzBlCY4x72LoWT6UbNJTtJxUt6HJoqGHmio10TVZ9HdSMnoP95Q49OnexrjJIjzS6m7y%2BiiVt5GEda3zlfdl2h2NLkE9L7rp2WEMmV%2BA727WxW7j35HgHu5uJ0urc1X84meEVZZGQLWOaqILO8ndFBO2inzKGGfOogrb8owbXTzrRn2rSJOohgHq9yMQ7z0ljObNICakFJTv%2BZ%2BM6e%2FVlYyiDZnqrQpDSwkRRny3l0VbE2DGl%2BUV8DD60aXVBjqkARlwv2k5VWVD%2FIcQW3KrM2VAA5yi2ghJU5GxbWPnkzdOVEu8UsqXxMUowfkvyvIMVxk%2B3O0TV8RlZj97X3FSHDUt538gvwTy9N0jfpNNVKoaY%2BTTN2mdSTst%2BRmIrG8R2SUqVQj0QNjf%2FRTmTTMMfAdUJt4kVAoE%2FmkaHnSCFJk4KAik%2BdKaHmGi%2FrOUAO1i8mSqkoIT2gj3UTuTnv6IQIc8xr%2Bi&X-Amz-Signature=6e971f83a98e3d4624c2f89ce4a16ba6e71cce96edc360ada5d731edbcb72a05&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

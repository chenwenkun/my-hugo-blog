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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466XQFXBF43%2F20261113%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261113T225934Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEMP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIB39vpAGLuNPJM6rQEKBgwY9phRP5x1mqsp1SjnfsjjyAiEA%2B1WuOvQjA%2FCfp%2FX46kqpsdClRHOz1b%2Fh0%2FRUaWRcE7IqiAQIi%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDKeAsLUN2b0%2FE9S5UCrcA1G6szX%2Bn3wv%2FVW5%2FaUPr5Satq093r3u5WLsAoNK9X9TkbQ7lypcY21XJD2ijjbQXjHTGprIWwr4qzakATGb0SQMvwTe7IcNx2BAEjlq9qsHz%2FgF92s%2B%2BbTRS1Eg6GEYcqehZg7jB9zg7WV6vNmlTQ%2B1mdYh1HUUB%2FGz60dYqTqlvaecp%2BkpblOa9umLkjNk9TBs%2BiigqWXlWiV%2FQW1RSv0uR3rJ27w0tv%2Fd%2BA8W95rDs6kbqmoHgLI0AuFE7QE64ejo8xTDZwja9GRAozQoHE3Eg7aO9Dp%2Bt6BK1%2F%2B1gNbJSkpSa0TPy6WPV1je5LJGXODVt0J%2FiFPV%2FsZJXtLh4df3RtRIrr%2FiKxRhBblUPaaQM%2ByoG1SwB3ZxXp%2BjKmG3CugsNflFwDD4Uii%2FzoNsEuTKOGHsFeScFEI%2BnYKL8J3JUE4y8F0egMuVfS3k6xbNqXrXQF880uU3Ilg9aMfJ4YGkoCLxTU%2FuAlXfLYTpxGXEv4Uss72tTvxZaLYyrHf6CUUr4ZU9au4xUckI2DxfsdsPXRuLhLQfD%2BU6fNSZ8E0lUAwlak%2FxTdYQp4UWr%2B7d1enidZC1DTD%2FVuaJhu%2BTjeEEQlB5pMauHkT%2B7T58%2FZECFDdg%2FcxezXSjMe8RMLK33dcGOqUBbfuEFlHroFYzLJHA0h%2FKzwXB7etKWfFgtzTW2BcsmEyC18%2BlaB6YUOOu0lgVWejTVdY9336shf1E2IZt0PiiGp39ldQn0a%2FAnJqiMytsmEMQWREpeFEHM3aKJV29sDADbe%2BZIVraswFDhQuWDQepNFj6CEEWMmrfTj2AISjcSKrK%2F14Im1BVG%2BXuFzuXHmBk2PXpvG0ToSF%2F%2F7sQaUga%2FKJK%2B8wR&X-Amz-Signature=3134eff71a4a0df724a52abdd29b1b4b9037e465e6cdae5b9a609f6e3f024b24&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466XQFXBF43%2F20261113%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261113T225934Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEMP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIB39vpAGLuNPJM6rQEKBgwY9phRP5x1mqsp1SjnfsjjyAiEA%2B1WuOvQjA%2FCfp%2FX46kqpsdClRHOz1b%2Fh0%2FRUaWRcE7IqiAQIi%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDKeAsLUN2b0%2FE9S5UCrcA1G6szX%2Bn3wv%2FVW5%2FaUPr5Satq093r3u5WLsAoNK9X9TkbQ7lypcY21XJD2ijjbQXjHTGprIWwr4qzakATGb0SQMvwTe7IcNx2BAEjlq9qsHz%2FgF92s%2B%2BbTRS1Eg6GEYcqehZg7jB9zg7WV6vNmlTQ%2B1mdYh1HUUB%2FGz60dYqTqlvaecp%2BkpblOa9umLkjNk9TBs%2BiigqWXlWiV%2FQW1RSv0uR3rJ27w0tv%2Fd%2BA8W95rDs6kbqmoHgLI0AuFE7QE64ejo8xTDZwja9GRAozQoHE3Eg7aO9Dp%2Bt6BK1%2F%2B1gNbJSkpSa0TPy6WPV1je5LJGXODVt0J%2FiFPV%2FsZJXtLh4df3RtRIrr%2FiKxRhBblUPaaQM%2ByoG1SwB3ZxXp%2BjKmG3CugsNflFwDD4Uii%2FzoNsEuTKOGHsFeScFEI%2BnYKL8J3JUE4y8F0egMuVfS3k6xbNqXrXQF880uU3Ilg9aMfJ4YGkoCLxTU%2FuAlXfLYTpxGXEv4Uss72tTvxZaLYyrHf6CUUr4ZU9au4xUckI2DxfsdsPXRuLhLQfD%2BU6fNSZ8E0lUAwlak%2FxTdYQp4UWr%2B7d1enidZC1DTD%2FVuaJhu%2BTjeEEQlB5pMauHkT%2B7T58%2FZECFDdg%2FcxezXSjMe8RMLK33dcGOqUBbfuEFlHroFYzLJHA0h%2FKzwXB7etKWfFgtzTW2BcsmEyC18%2BlaB6YUOOu0lgVWejTVdY9336shf1E2IZt0PiiGp39ldQn0a%2FAnJqiMytsmEMQWREpeFEHM3aKJV29sDADbe%2BZIVraswFDhQuWDQepNFj6CEEWMmrfTj2AISjcSKrK%2F14Im1BVG%2BXuFzuXHmBk2PXpvG0ToSF%2F%2F7sQaUga%2FKJK%2B8wR&X-Amz-Signature=28f6b19b2053191d1e52410a1a90af816606634c1acfbd3e24ae98a2e9533bb0&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

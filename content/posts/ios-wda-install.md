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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663HAUO7D5%2F20260824%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260824T003825Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEBgaCXVzLXdlc3QtMiJGMEQCIH29kceMOo2vAB9mMUC6UScI1yprECGypT1ic36I35CWAiBMlvdACDhS6su%2Fs5oMVX7eTdk7MwafJVBrWXm0CEULoCqIBAjh%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIM%2FJywY651hbsBKZulKtwDTj2sw6HqXg8pphuaTO7G3GxRUe7FchB2DH3VPPJmdjU9EV3vVcKyj%2F3QQU%2BUFbAkWt%2F1mfe9fxs7Ye0JnT7ZEgJOOopggu6zQQdgnPU9Pw%2BVt8AIEcJlHsrLLZVsNeYcD4JEgcTYDig5HcVHJYikFcFOTE38fn4GUa7qEyW4xGPmLOT%2Fee2hvpcP%2Ba5wnohoLHq%2BXtuZnd3CJjdOn3PpyqXyiUSNrAlzVMH7zBAtg6vuwtGla5wrFwaGe6%2BokLeYSjxd0cI4ejGFhXiu9COYhe0l35Z%2FAx8A4OxyBf6iLrAwCCtHFxhZPkVyAhLk6lbbLkCGN5L7%2BxE%2FdxMGp7hNKHZytrOJ8BUSxineJfM1X67Ly%2FpcQnC7oyq2LDzN4EjaBRcLnxTWrYA1M%2BBFRxQTODJKXHrVRnzTkJN1qA6rG5Uu8XXMgCeIFJbmUgZAiicIMgkhUad6DUfWVeR5nP0GCacrnKnZzZLthxrZkKAuxMyi55LbJhOlsHi5MJEAeE23fgrtA%2FdO5WH%2BfG%2Fg%2BJkU%2Bjm%2FG%2BhZas0h5%2BsSkLsN%2B3CCLfa%2B1FaXc7xDSfGu%2F3I1smRtZ1TA8cQ28CRo3rKZup3biaVtkW7C%2BtEs7Khbd095noezkzWI%2FsA%2FIDwwgYOu1AY6pgGt%2FgRH%2FpiJD40EcDTTrqZi2ayJ8pc4RkkAsQft43QK35TSDIVB7c8rfxQxhObB7N8AozQdgbYEcP3Y9TmvKgIdPVdWOsdFOpcWD9bt%2FEHWWFdOE3TVdFc6cTL0K%2FU6d%2FzJ8qwZt0BiulAcAD6iaEeyaRPXkHklizB2JxCOmdFbmdAaWxMls2wqtlDebWkP9BnhA4zk6t5QW7bMJNocMLiAiLRzaK3K&X-Amz-Signature=5d18f0d2a4a6a225cc3eef9491f3575827469c0c9943528157305e861e30877c&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663HAUO7D5%2F20260824%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260824T003825Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEBgaCXVzLXdlc3QtMiJGMEQCIH29kceMOo2vAB9mMUC6UScI1yprECGypT1ic36I35CWAiBMlvdACDhS6su%2Fs5oMVX7eTdk7MwafJVBrWXm0CEULoCqIBAjh%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIM%2FJywY651hbsBKZulKtwDTj2sw6HqXg8pphuaTO7G3GxRUe7FchB2DH3VPPJmdjU9EV3vVcKyj%2F3QQU%2BUFbAkWt%2F1mfe9fxs7Ye0JnT7ZEgJOOopggu6zQQdgnPU9Pw%2BVt8AIEcJlHsrLLZVsNeYcD4JEgcTYDig5HcVHJYikFcFOTE38fn4GUa7qEyW4xGPmLOT%2Fee2hvpcP%2Ba5wnohoLHq%2BXtuZnd3CJjdOn3PpyqXyiUSNrAlzVMH7zBAtg6vuwtGla5wrFwaGe6%2BokLeYSjxd0cI4ejGFhXiu9COYhe0l35Z%2FAx8A4OxyBf6iLrAwCCtHFxhZPkVyAhLk6lbbLkCGN5L7%2BxE%2FdxMGp7hNKHZytrOJ8BUSxineJfM1X67Ly%2FpcQnC7oyq2LDzN4EjaBRcLnxTWrYA1M%2BBFRxQTODJKXHrVRnzTkJN1qA6rG5Uu8XXMgCeIFJbmUgZAiicIMgkhUad6DUfWVeR5nP0GCacrnKnZzZLthxrZkKAuxMyi55LbJhOlsHi5MJEAeE23fgrtA%2FdO5WH%2BfG%2Fg%2BJkU%2Bjm%2FG%2BhZas0h5%2BsSkLsN%2B3CCLfa%2B1FaXc7xDSfGu%2F3I1smRtZ1TA8cQ28CRo3rKZup3biaVtkW7C%2BtEs7Khbd095noezkzWI%2FsA%2FIDwwgYOu1AY6pgGt%2FgRH%2FpiJD40EcDTTrqZi2ayJ8pc4RkkAsQft43QK35TSDIVB7c8rfxQxhObB7N8AozQdgbYEcP3Y9TmvKgIdPVdWOsdFOpcWD9bt%2FEHWWFdOE3TVdFc6cTL0K%2FU6d%2FzJ8qwZt0BiulAcAD6iaEeyaRPXkHklizB2JxCOmdFbmdAaWxMls2wqtlDebWkP9BnhA4zk6t5QW7bMJNocMLiAiLRzaK3K&X-Amz-Signature=437aec428e1e3b2b96d95f18e25f4d57bb26fe19cb755f0368fe2bab5b07cd01&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466766MGTQ6%2F20260813%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260813T010228Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEA4aCXVzLXdlc3QtMiJHMEUCIB0TLkA9h7GdaphnuVCZgC6mHwaGcQJVgukArWSrSOiuAiEA9vDgoOZ43PwGLt7RFlQLcgP19m67IZPuTzwQWyhazIUqiAQI1%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDDuHGkpKFlmt0x4dNSrcA4JNwu%2FhmdnLpVFbduJwoWcIt0GuXXjSfs0ZJ9cF8XyVQHtpxa1amWm%2F2xKqXI5vWHMGbyqhcpFp1t2d91JjSenPsEBjv%2BSYeEJMtaQ3kWza%2FA8oBI%2BuyN9YwOoTHYyd7VNiWeuKwS2rvSLMCgjLFab39LS%2FjGmyHdKeBksu8fnCvzkmDjj%2B65uDVAH159ICDlPXHDKZH9lufEtbHC%2BHQohQ1HuVjPTFikD9MNVim9EVq2CUpftrw%2FC4%2B6sHuI%2FakWbaLo69dDHZXWfI4kqhSqfvsKVAHFnBGTlZx%2FiI7GLNLPc1VYsDec1QFcNRGwc6401mhF2sjYID%2FZHJSv5lIEE8CPkcvMIiabD4sE3fqLreG2jS4jeE8II10MhCo4KFg8RaI0VPQx4TG05K04IoadPZSqezQ%2FWXNxYWvGG2RD7jE7pnMrzN5Q0s5u4Lep7bi1dpBkHwxJCz3lF4QFk3amWln60S93XR8Q%2BCY7a%2F3YVs0XNcjtQXki9vwuGRdF3UOx8BFhZUr7chjHDD7Tovmz3PA6V7JPaZ%2FIkEGP5TuL4Bd8JBqHqWVUsjXFHyTDNZCJ6iGGJ5hoktq1DYJg9p93UWHjYy1hhLrjfEo3WlqQKCEiyQN9YGcj8hlLZnMO7N89MGOqUBP3hFguxs8F6FBxxjmawXrWQ5kRWuVHvXxeIMmHrlgSP%2BX3sKxhZLk3hg5FbPJqj9OM2cFnoGqeBYoG2ax9By4b0jdJGefSUBcJBSVl7WGza1nM564A8zmY%2Bn25C3dVeB4HBdmcW3G5WqF%2Fb28PPML85U93%2BOFQ0Oir%2FBGtEWX6CWDtqzgCtHTm%2BpfwT7CV2FECChRjbHdNzL17eHHj8zM3tHcIO1&X-Amz-Signature=8d15fe602f18693d5daf76cdc833b6a9c0d6d6239c66fe75453f69b882d03538&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466766MGTQ6%2F20260813%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260813T010229Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEA4aCXVzLXdlc3QtMiJHMEUCIB0TLkA9h7GdaphnuVCZgC6mHwaGcQJVgukArWSrSOiuAiEA9vDgoOZ43PwGLt7RFlQLcgP19m67IZPuTzwQWyhazIUqiAQI1%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDDuHGkpKFlmt0x4dNSrcA4JNwu%2FhmdnLpVFbduJwoWcIt0GuXXjSfs0ZJ9cF8XyVQHtpxa1amWm%2F2xKqXI5vWHMGbyqhcpFp1t2d91JjSenPsEBjv%2BSYeEJMtaQ3kWza%2FA8oBI%2BuyN9YwOoTHYyd7VNiWeuKwS2rvSLMCgjLFab39LS%2FjGmyHdKeBksu8fnCvzkmDjj%2B65uDVAH159ICDlPXHDKZH9lufEtbHC%2BHQohQ1HuVjPTFikD9MNVim9EVq2CUpftrw%2FC4%2B6sHuI%2FakWbaLo69dDHZXWfI4kqhSqfvsKVAHFnBGTlZx%2FiI7GLNLPc1VYsDec1QFcNRGwc6401mhF2sjYID%2FZHJSv5lIEE8CPkcvMIiabD4sE3fqLreG2jS4jeE8II10MhCo4KFg8RaI0VPQx4TG05K04IoadPZSqezQ%2FWXNxYWvGG2RD7jE7pnMrzN5Q0s5u4Lep7bi1dpBkHwxJCz3lF4QFk3amWln60S93XR8Q%2BCY7a%2F3YVs0XNcjtQXki9vwuGRdF3UOx8BFhZUr7chjHDD7Tovmz3PA6V7JPaZ%2FIkEGP5TuL4Bd8JBqHqWVUsjXFHyTDNZCJ6iGGJ5hoktq1DYJg9p93UWHjYy1hhLrjfEo3WlqQKCEiyQN9YGcj8hlLZnMO7N89MGOqUBP3hFguxs8F6FBxxjmawXrWQ5kRWuVHvXxeIMmHrlgSP%2BX3sKxhZLk3hg5FbPJqj9OM2cFnoGqeBYoG2ax9By4b0jdJGefSUBcJBSVl7WGza1nM564A8zmY%2Bn25C3dVeB4HBdmcW3G5WqF%2Fb28PPML85U93%2BOFQ0Oir%2FBGtEWX6CWDtqzgCtHTm%2BpfwT7CV2FECChRjbHdNzL17eHHj8zM3tHcIO1&X-Amz-Signature=73403548a75ca6f416eabb293bb37e8f2bd312542152d80a06c929c560af008a&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

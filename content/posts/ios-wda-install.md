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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4667SGKK45M%2F20261105%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261105T040810Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEPL%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCIekudYxPb1EbDHIMvJqvcfOnVflDtCLpWkXso6pU20QIhAIhfTeVQCVKv8ei0%2B0dkw4KPwMMBbYASEXcOYA5pmQxQKogECLv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgzWx9BpZRvlLfRHEt4q3ANcuZ2WUmxwj61XnuyDAc%2Bkqqgpt4v2fYRCKwCrI5kCyKLvj8lvs67ZpUDUVQkcstB5QivCzxIX%2Bwcp88%2FML5F5fLSXBZ9lfnR8LU8GydZo37rNuHUj03bMWeaA1%2F315JrntSRvSxpOlnnNaUd0Gs6VVghB4I9nsh3bhRCIoIpkpiw4YBH8l5%2BcEDmRfy7yl2SxiQI5uwU8Sl9lmkuBs5dp7QO7h2%2B3CMrtJaeB05SLtWA1ke5PaGDtJTGLujErekkUVw48SCFIA0IJsdjbmMlfcawDme3yLVXSIFsR6gV6BO7EyFkdQuNYBqb7HEYE6JMQdsmqQxOLfOyJkbAbHIMfEugnWRQ9sv9%2F8NHUKgtVSjWPih3DIPH2MWkcrryaGbgPEq83QZm86BIXQcRVOTYOm%2FiVI77YrMp%2BfNKqumon%2Fit6FunfW3%2FL8JCKq2vZeE03LzCDE9njJ9RQxWK6vG2Knj9Zd5nCeqr0SCBBOBSg3DksITFrZgSFB1s9kQR2HClfzLzgNQTWi208nJdBwiX7sYBrb30tKvmYYiw6ve2HwYcUzZe4gf8w1hzQhnhxYEsT9UkSbG3wzXIMrJdJ5Vg8ddaiNzXTpW1Ua%2FnS2vslK3hsfkJ92W8S6IXEnDCgzK%2FXBjqkAfDZQgiFLvU5i%2F0ubNlPaVs8iLC9li%2F0ik0wSLxUovYoxFI11pPK1Bs3HIN2glxxg%2BRY9w65KTcOayt7OoIW%2Bq%2Ba%2FT5rWR59qCvagRzYBwQGlsJIxG4tWrZnKEZr9bmeT%2Ba99mrWQ7afykfY5kIK7Wl2wc%2FBTieG0Mym3UOOsvLPafYyl%2FMDQwCb4hqyWWAJ%2BsLKOYAekmS4gprshjja3greMfLT&X-Amz-Signature=b3be25efd1c16fc87320c37457c8bf84a57d4e90bec4d240dc423a441274b16a&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4667SGKK45M%2F20261105%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261105T040810Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEPL%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCIekudYxPb1EbDHIMvJqvcfOnVflDtCLpWkXso6pU20QIhAIhfTeVQCVKv8ei0%2B0dkw4KPwMMBbYASEXcOYA5pmQxQKogECLv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgzWx9BpZRvlLfRHEt4q3ANcuZ2WUmxwj61XnuyDAc%2Bkqqgpt4v2fYRCKwCrI5kCyKLvj8lvs67ZpUDUVQkcstB5QivCzxIX%2Bwcp88%2FML5F5fLSXBZ9lfnR8LU8GydZo37rNuHUj03bMWeaA1%2F315JrntSRvSxpOlnnNaUd0Gs6VVghB4I9nsh3bhRCIoIpkpiw4YBH8l5%2BcEDmRfy7yl2SxiQI5uwU8Sl9lmkuBs5dp7QO7h2%2B3CMrtJaeB05SLtWA1ke5PaGDtJTGLujErekkUVw48SCFIA0IJsdjbmMlfcawDme3yLVXSIFsR6gV6BO7EyFkdQuNYBqb7HEYE6JMQdsmqQxOLfOyJkbAbHIMfEugnWRQ9sv9%2F8NHUKgtVSjWPih3DIPH2MWkcrryaGbgPEq83QZm86BIXQcRVOTYOm%2FiVI77YrMp%2BfNKqumon%2Fit6FunfW3%2FL8JCKq2vZeE03LzCDE9njJ9RQxWK6vG2Knj9Zd5nCeqr0SCBBOBSg3DksITFrZgSFB1s9kQR2HClfzLzgNQTWi208nJdBwiX7sYBrb30tKvmYYiw6ve2HwYcUzZe4gf8w1hzQhnhxYEsT9UkSbG3wzXIMrJdJ5Vg8ddaiNzXTpW1Ua%2FnS2vslK3hsfkJ92W8S6IXEnDCgzK%2FXBjqkAfDZQgiFLvU5i%2F0ubNlPaVs8iLC9li%2F0ik0wSLxUovYoxFI11pPK1Bs3HIN2glxxg%2BRY9w65KTcOayt7OoIW%2Bq%2Ba%2FT5rWR59qCvagRzYBwQGlsJIxG4tWrZnKEZr9bmeT%2Ba99mrWQ7afykfY5kIK7Wl2wc%2FBTieG0Mym3UOOsvLPafYyl%2FMDQwCb4hqyWWAJ%2BsLKOYAekmS4gprshjja3greMfLT&X-Amz-Signature=3d354e795762778971e551f36ccca1592004d41794ab400bc7f4dc034ea3fb3b&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

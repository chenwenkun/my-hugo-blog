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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466VFNUQ6FQ%2F20260922%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260922T203744Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEOT%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCPVWRBdL6%2B%2FSIEL3VClQrK9AEjEwjNoNoFlWQppbN%2FmwIhAJSkOQyC9Bcpqwx3xTOo9kYIEu6j2lDvbjXTG9DopaMkKogECK3%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgxyzPslgrcFZp92qGYq3AN5rCkvBxgHKdYEiQ9wL2NYdh7JBYiO4tZUxVj%2BFQ0X24OP6Svxqpg2BIT%2BvSbg3jpEyigmmNXSEN5dFKuLVJYg7S2t%2BhxDSR0AHGqYg1Q2%2FsA7W4RMxJkLv5mjHcMDhW5A1hIDlKCuho22CGV%2FMjLUFAMQ87eGTHsT9lNL7rCzxtO2zVlKpOfK0OMXeiGGKFv8hNMHeGVy2%2BS8936nuI7Q1vG74wfHmecapV80RMGxB1vagJqSjAhbajBNkz%2FGE0e2n3DVKg4SZPZ%2BlVTh5tETJ674fqTZ%2BytKSBPMshaZ9R9nCUxXJg62eQUbM0HVxR5ZKHElUz%2BiwWSOglBtNMJJSgJIIkWksPefQm9uzfoa%2FgvlC%2Fl5Ndsrw5S9WVn8SZNYn7nkwLyjNR2QM%2Fz4lK1cFqxM1gZ2InBZWDpghWbGW6b8NAiuHKrtyuw6b%2BLE7J77qun5UD8q1FBqFzBSIJ93WPehthm2LjTMHKUvbc3ZwFPX0T9oodSEsmzgzBnSJ2TIvKsRCQlrS75Zm%2BzZ678SC%2B0sch61XEVfDDDHnfagogCGtcCjd%2F4h4GWMjtpjkSm0YCUnE01rupwvkV5l1KqOtAppAuNYrllipRbwP%2BbJcMF09%2Brl%2Frl%2FAsF%2BazDlqsvVBjqkAbYAHU8RqG2Yjp9%2F5BGd778DraI%2FbQnU2ST%2BxOVVWb5F%2BVilSMB%2BWdR3xxTb3svmhGkshx59DTSCe9RqZt3fRF5m55%2FeodWmhdyY3KFBfisnVpg9N7WdLS8vKjoJ0agNdnHob6EieloR%2FZIpLlEdbGf4LfZPV%2FB7sj26%2B7bhZS9iCF1HB3Lo5a6x7HareO56owekwSy1EwEw55Cngwr9laVlpm%2Fw&X-Amz-Signature=6108af76cd41dc6cae2ff935672346a44092b30e11d51b85be6ab562f30cdc47&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466VFNUQ6FQ%2F20260922%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260922T203744Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEOT%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCPVWRBdL6%2B%2FSIEL3VClQrK9AEjEwjNoNoFlWQppbN%2FmwIhAJSkOQyC9Bcpqwx3xTOo9kYIEu6j2lDvbjXTG9DopaMkKogECK3%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgxyzPslgrcFZp92qGYq3AN5rCkvBxgHKdYEiQ9wL2NYdh7JBYiO4tZUxVj%2BFQ0X24OP6Svxqpg2BIT%2BvSbg3jpEyigmmNXSEN5dFKuLVJYg7S2t%2BhxDSR0AHGqYg1Q2%2FsA7W4RMxJkLv5mjHcMDhW5A1hIDlKCuho22CGV%2FMjLUFAMQ87eGTHsT9lNL7rCzxtO2zVlKpOfK0OMXeiGGKFv8hNMHeGVy2%2BS8936nuI7Q1vG74wfHmecapV80RMGxB1vagJqSjAhbajBNkz%2FGE0e2n3DVKg4SZPZ%2BlVTh5tETJ674fqTZ%2BytKSBPMshaZ9R9nCUxXJg62eQUbM0HVxR5ZKHElUz%2BiwWSOglBtNMJJSgJIIkWksPefQm9uzfoa%2FgvlC%2Fl5Ndsrw5S9WVn8SZNYn7nkwLyjNR2QM%2Fz4lK1cFqxM1gZ2InBZWDpghWbGW6b8NAiuHKrtyuw6b%2BLE7J77qun5UD8q1FBqFzBSIJ93WPehthm2LjTMHKUvbc3ZwFPX0T9oodSEsmzgzBnSJ2TIvKsRCQlrS75Zm%2BzZ678SC%2B0sch61XEVfDDDHnfagogCGtcCjd%2F4h4GWMjtpjkSm0YCUnE01rupwvkV5l1KqOtAppAuNYrllipRbwP%2BbJcMF09%2Brl%2Frl%2FAsF%2BazDlqsvVBjqkAbYAHU8RqG2Yjp9%2F5BGd778DraI%2FbQnU2ST%2BxOVVWb5F%2BVilSMB%2BWdR3xxTb3svmhGkshx59DTSCe9RqZt3fRF5m55%2FeodWmhdyY3KFBfisnVpg9N7WdLS8vKjoJ0agNdnHob6EieloR%2FZIpLlEdbGf4LfZPV%2FB7sj26%2B7bhZS9iCF1HB3Lo5a6x7HareO56owekwSy1EwEw55Cngwr9laVlpm%2Fw&X-Amz-Signature=c174a85ed0c5d12fb001ef77d08889b8837a9d53893ca343721d839981b468e0&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466TZQHTM2U%2F20261025%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261025T021314Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEOj%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQD0gYzCDQiEF%2Bb8uIuL%2FM7x9lnvVtYLJyTxgIYttaE9XAIhAN%2BfNyG4a9cZTFLk8Wv3Nprm8eq%2FJ7cQ6eaU0S4YjX7JKogECLD%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgzIVctSFDUfDZa%2B%2FAUq3AOqN2%2FkAP1ll74%2B88mWSodh8HY7s6Ga9cC9PZHBJBzy8TVio1yZnrZ5BCwx8el08Z2WHTU0%2Fz7mVuhu1ZzH9r%2FE9CVIoqOi3CYzaFtxc62fJLI1ioN%2FR1FKDTTX3jFHIwRuf%2BDpJgvFLgswgv9LVtOdHe8MquFBMTkXDOuBmxAspunSjfUaX2OKAwZrrIZxIiGeqUmFzBUFKURqpWq8Uyo1idiAcwMLPsRC0KbcAR8z4HAfZiXZAuEeH8pFrX7W34uN0l2VUepStd3xj2IARhsvP%2FDIUfKcIomsgUvq5xS10%2FKeUQjZANGKCd3O4Y7YEjHv%2BT3Bjvnb%2Bo%2FFSCY5cpNhO40Zk3n8OorfNN7qyyLFFeWrtn5U8NZ2mRmg2mB0EQXJQPP9ZdDWhySC4dRc2vxgjeJY4FBnQXe9L3gW12n7dpjltjQml4zz1jHUebAPHo6bcv39l9220bVw2oNZCjQw0c5EhtcAsr%2FxvkJx5FPiqrcNTrhWyIZ4FDHcylk5mDOxxSUuBggbLlqYM36%2BTB4TO9XIHdWLuH9VwsmEEvgsoKemWTr%2F%2FSH5dMB4Sjet7fil8ldRc0d4vBHedVxTIkB9MxwX0750TsrZ7XcNfpLZGU2xiKhiMwIbVwuGVzDugvXWBjqkATGcShkT5F0T8HFKtqeMlorjKCp%2FuyZwxECMGqXxxn5EzCNfK4IzfvQgs%2B3xhpf13sfgs%2FaY%2BlamPNdxYP%2BZ5C6R917fap0VNXg69Jnb74ZZu1DDQxR6CcpjN%2F2OyuJppExUEFzTqjxUjg%2BgQnNj7kZtlDZRSk%2Bj2oBdJnx%2BDssjOfwwAJnGPkOg2sq8kEYuQ%2BJH7VgQiEY7nlo9Wi1J%2FC4UcCv8&X-Amz-Signature=ca256c120440edc028d1db3e87d1129d05062ea4331180a04ebecdb65723ca09&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466TZQHTM2U%2F20261025%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261025T021314Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEOj%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQD0gYzCDQiEF%2Bb8uIuL%2FM7x9lnvVtYLJyTxgIYttaE9XAIhAN%2BfNyG4a9cZTFLk8Wv3Nprm8eq%2FJ7cQ6eaU0S4YjX7JKogECLD%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgzIVctSFDUfDZa%2B%2FAUq3AOqN2%2FkAP1ll74%2B88mWSodh8HY7s6Ga9cC9PZHBJBzy8TVio1yZnrZ5BCwx8el08Z2WHTU0%2Fz7mVuhu1ZzH9r%2FE9CVIoqOi3CYzaFtxc62fJLI1ioN%2FR1FKDTTX3jFHIwRuf%2BDpJgvFLgswgv9LVtOdHe8MquFBMTkXDOuBmxAspunSjfUaX2OKAwZrrIZxIiGeqUmFzBUFKURqpWq8Uyo1idiAcwMLPsRC0KbcAR8z4HAfZiXZAuEeH8pFrX7W34uN0l2VUepStd3xj2IARhsvP%2FDIUfKcIomsgUvq5xS10%2FKeUQjZANGKCd3O4Y7YEjHv%2BT3Bjvnb%2Bo%2FFSCY5cpNhO40Zk3n8OorfNN7qyyLFFeWrtn5U8NZ2mRmg2mB0EQXJQPP9ZdDWhySC4dRc2vxgjeJY4FBnQXe9L3gW12n7dpjltjQml4zz1jHUebAPHo6bcv39l9220bVw2oNZCjQw0c5EhtcAsr%2FxvkJx5FPiqrcNTrhWyIZ4FDHcylk5mDOxxSUuBggbLlqYM36%2BTB4TO9XIHdWLuH9VwsmEEvgsoKemWTr%2F%2FSH5dMB4Sjet7fil8ldRc0d4vBHedVxTIkB9MxwX0750TsrZ7XcNfpLZGU2xiKhiMwIbVwuGVzDugvXWBjqkATGcShkT5F0T8HFKtqeMlorjKCp%2FuyZwxECMGqXxxn5EzCNfK4IzfvQgs%2B3xhpf13sfgs%2FaY%2BlamPNdxYP%2BZ5C6R917fap0VNXg69Jnb74ZZu1DDQxR6CcpjN%2F2OyuJppExUEFzTqjxUjg%2BgQnNj7kZtlDZRSk%2Bj2oBdJnx%2BDssjOfwwAJnGPkOg2sq8kEYuQ%2BJH7VgQiEY7nlo9Wi1J%2FC4UcCv8&X-Amz-Signature=d26f6f63917224a05625666f9db1c9fc514f7a50d7107280676df7e15076dc37&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663M6FNM4U%2F20261010%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261010T031520Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEIL%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCS%2BQS78xOXKm91m9Nn6Hm0E99AitDMJJ9c2R8dZYay7wIhAKP3txBWzeWOxuuNK%2FATiWUAFAIoOX6pdyI%2FbQcoJMS%2BKv8DCEoQABoMNjM3NDIzMTgzODA1Igyc3wkCga3V4bSKc6wq3AOotr2GCu8uURX3HVuXD7E1HHCGtDmLLOVXfuqbmUc6z9f2u4nwZJumxmwgsNXJwLxrpgSptL38al09%2FKfU9YiilDZuHAoUCY2KM7rjM47s8GQBf9jrPZpIsXkTdGxd6vJJAUwK2r9nl5GMBFLuXwa2HI4dUgJklshFxuOAKrVvFfDnerdh0%2FJG5Zm%2B2RWrsi6flqy2IN2IUFf6MHw9ROcPmwjOyjX7uU14%2BMP59wbFobOYmG3YXlmzSAgFyEEGe1sWvJAJRH14BiLCWe%2BsQdkj3ZTMDa6yvcQIiYo%2Bhtj7pSywMWHeLnDcgO6HABxE%2FMPW5CVLo8os0PpkG%2FO95c9ASNT3Yz2%2FWGxvup01uyx7IbqbNpasnzi8ryvDL0JDDXIEBAhTEvzKQiPUUucqyLqpPYzKTMzxP%2BaIXbSQH8%2BTXsc21MUY7vlNyDbqZWRwusZXJRyz9AJ5v5nYw0Gi24vGHcPiBD%2BcM4ETFAAfEF7l1%2FxhzHkAJ%2Bv4KWARxfZOmV7%2FkmpaRpcmrciIrK%2FvHxyJt0Lb6Y7KzgfDimMblIziEMq02zAdMwKkgz6W3YPw1ZfwRWaGHTpezchXIArS8%2FKEI3mmUTV%2BZ6AZqe8gz1v8rSBJCfuKpJ8673I8NTDypqbWBjqkAWqpZQPygBx8rKzJDPiwn1sPn%2BkMZ14tJ8PVjFqXGHTPT2WloRtxl%2B0Xjq8Jbm7AVwcdknU3EDBgckBIgfidj22LEz8DbcLU41k58wM3HDrcbRoO0hJBfim0qoZSBnDRCdc4A3zTn1XQJAn9yUbMcNRqoE26uDKNCiXUcaoFri1LSJIgw4zODJxnSnW430kuv2UBpqNjQ9dZOJQdJAq9Kxj2Q8q%2F&X-Amz-Signature=e40e85e80a004e5f1df5ce666d0438580f01af133646d882109948601e73caed&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663M6FNM4U%2F20261010%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261010T031520Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEIL%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCS%2BQS78xOXKm91m9Nn6Hm0E99AitDMJJ9c2R8dZYay7wIhAKP3txBWzeWOxuuNK%2FATiWUAFAIoOX6pdyI%2FbQcoJMS%2BKv8DCEoQABoMNjM3NDIzMTgzODA1Igyc3wkCga3V4bSKc6wq3AOotr2GCu8uURX3HVuXD7E1HHCGtDmLLOVXfuqbmUc6z9f2u4nwZJumxmwgsNXJwLxrpgSptL38al09%2FKfU9YiilDZuHAoUCY2KM7rjM47s8GQBf9jrPZpIsXkTdGxd6vJJAUwK2r9nl5GMBFLuXwa2HI4dUgJklshFxuOAKrVvFfDnerdh0%2FJG5Zm%2B2RWrsi6flqy2IN2IUFf6MHw9ROcPmwjOyjX7uU14%2BMP59wbFobOYmG3YXlmzSAgFyEEGe1sWvJAJRH14BiLCWe%2BsQdkj3ZTMDa6yvcQIiYo%2Bhtj7pSywMWHeLnDcgO6HABxE%2FMPW5CVLo8os0PpkG%2FO95c9ASNT3Yz2%2FWGxvup01uyx7IbqbNpasnzi8ryvDL0JDDXIEBAhTEvzKQiPUUucqyLqpPYzKTMzxP%2BaIXbSQH8%2BTXsc21MUY7vlNyDbqZWRwusZXJRyz9AJ5v5nYw0Gi24vGHcPiBD%2BcM4ETFAAfEF7l1%2FxhzHkAJ%2Bv4KWARxfZOmV7%2FkmpaRpcmrciIrK%2FvHxyJt0Lb6Y7KzgfDimMblIziEMq02zAdMwKkgz6W3YPw1ZfwRWaGHTpezchXIArS8%2FKEI3mmUTV%2BZ6AZqe8gz1v8rSBJCfuKpJ8673I8NTDypqbWBjqkAWqpZQPygBx8rKzJDPiwn1sPn%2BkMZ14tJ8PVjFqXGHTPT2WloRtxl%2B0Xjq8Jbm7AVwcdknU3EDBgckBIgfidj22LEz8DbcLU41k58wM3HDrcbRoO0hJBfim0qoZSBnDRCdc4A3zTn1XQJAn9yUbMcNRqoE26uDKNCiXUcaoFri1LSJIgw4zODJxnSnW430kuv2UBpqNjQ9dZOJQdJAq9Kxj2Q8q%2F&X-Amz-Signature=1bdb0ad099c8768c7caa64746b93a75a142331fe93d9b7ae57996e38a6941f65&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB46627BKB6JY%2F20260914%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260914T171238Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjECEaCXVzLXdlc3QtMiJGMEQCIAytVNg%2FP40ZwCg6R%2Bca6uBVdV6d65Is4z%2FGDK21yy2eAiAe2ZTpnx8rotzAbpVhncWBKuD6cauw1QLu%2FhE8JgH0QiqIBAjq%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMhNwNuP6Pt4yjEw2NKtwDWm7qeXOScOm8iRBmgKsYr%2BrxSygmXcljp%2BmQQqkVHTw94AI1EplkIXUb3%2Fey12FvdZ05oDYd2wfX8EdiJbrti6zW%2FS6Wa93pxvF2VFTj4AbqcE1GCJdyYZtfI3G41Lhy3BXXjSPnADkVj%2BuxO7FPjyz4GgoSQj6Fj%2Fey9DaBSbP1bszVbuFuQ4dD5J7x2rZIX5CF9iuEkPrz%2BhaU3IL8wrX9gbUcT7ZfPANBaJKTU8adKYd8hW87PeXN7FCDWMBX5WnBqqGGcWTe2FPjsk%2Bco4JFrYWcSde2ncYGcgYycN5nlkpf5BwytSmmKpQ1kZr9XfNJ2ACigxhke%2FqF8%2F2VHfCj2wZqKBJA4V9UluK3vbIYT6qpRPkGQqKP658Vm%2B1lycOM67zgqQ9p6KZvCnGO9WapkcFK1i7eymbUQXndMsWrlzRKPwKtt56GMak%2BM%2BTX7UNtydMSYYczYM5agsQCF61ow2z1%2FfOG6P6PxIw0n7PVhgo1q5cS3YPiKTlSyGg6v%2FFcSDy2kX8klYVU%2BfxEMtpDKWDj52xrQ1rK5YQnZ0JXDHQGGFnxCt5wFRNgtHyRnLPw86xV5l8cwtNathgJVvYOHJFel0JgnEtrqP%2FsYQUBV2%2FbsfMV4MPo0s0w7MKg1QY6pgEDSE%2FzKw0%2B6%2FNTKtMltah9jDKongDsfbgvXO11UmiKUYt77VFYA%2F88JaG6rioIpnkBYY1q9Pnd02ArudOawMmiRTxBSj6R4qh8CtC5V6TaVQLhbKxdgSbqOQ%2BUrAuJ1xF2xJeKlqdrs9GucKNPzxhj1Iu2rAMd9IR5l1A6l3AMPk8ZuCoKcQI3cEbMA7g2jZ5Vj3OHN1HjXNJg3VT3ajqvXDe%2FQ4ZL&X-Amz-Signature=1d0adcfd4e8f5bf14e91cc357bcddd5ef9d0634ade4481fb122a9cc332cfc51b&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB46627BKB6JY%2F20260914%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260914T171238Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjECEaCXVzLXdlc3QtMiJGMEQCIAytVNg%2FP40ZwCg6R%2Bca6uBVdV6d65Is4z%2FGDK21yy2eAiAe2ZTpnx8rotzAbpVhncWBKuD6cauw1QLu%2FhE8JgH0QiqIBAjq%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMhNwNuP6Pt4yjEw2NKtwDWm7qeXOScOm8iRBmgKsYr%2BrxSygmXcljp%2BmQQqkVHTw94AI1EplkIXUb3%2Fey12FvdZ05oDYd2wfX8EdiJbrti6zW%2FS6Wa93pxvF2VFTj4AbqcE1GCJdyYZtfI3G41Lhy3BXXjSPnADkVj%2BuxO7FPjyz4GgoSQj6Fj%2Fey9DaBSbP1bszVbuFuQ4dD5J7x2rZIX5CF9iuEkPrz%2BhaU3IL8wrX9gbUcT7ZfPANBaJKTU8adKYd8hW87PeXN7FCDWMBX5WnBqqGGcWTe2FPjsk%2Bco4JFrYWcSde2ncYGcgYycN5nlkpf5BwytSmmKpQ1kZr9XfNJ2ACigxhke%2FqF8%2F2VHfCj2wZqKBJA4V9UluK3vbIYT6qpRPkGQqKP658Vm%2B1lycOM67zgqQ9p6KZvCnGO9WapkcFK1i7eymbUQXndMsWrlzRKPwKtt56GMak%2BM%2BTX7UNtydMSYYczYM5agsQCF61ow2z1%2FfOG6P6PxIw0n7PVhgo1q5cS3YPiKTlSyGg6v%2FFcSDy2kX8klYVU%2BfxEMtpDKWDj52xrQ1rK5YQnZ0JXDHQGGFnxCt5wFRNgtHyRnLPw86xV5l8cwtNathgJVvYOHJFel0JgnEtrqP%2FsYQUBV2%2FbsfMV4MPo0s0w7MKg1QY6pgEDSE%2FzKw0%2B6%2FNTKtMltah9jDKongDsfbgvXO11UmiKUYt77VFYA%2F88JaG6rioIpnkBYY1q9Pnd02ArudOawMmiRTxBSj6R4qh8CtC5V6TaVQLhbKxdgSbqOQ%2BUrAuJ1xF2xJeKlqdrs9GucKNPzxhj1Iu2rAMd9IR5l1A6l3AMPk8ZuCoKcQI3cEbMA7g2jZ5Vj3OHN1HjXNJg3VT3ajqvXDe%2FQ4ZL&X-Amz-Signature=cb9d28533b23a5e7df37225bdf26f61ee7322d1484000dcb3d68069d6e4b6147&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

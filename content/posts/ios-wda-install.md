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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466ZKN2TO3A%2F20260823%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260823T181329Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEBIaCXVzLXdlc3QtMiJIMEYCIQD3nmm96ogYkEhv%2BFxf1Rp6DK1YNhEGmtGden59EbtJBQIhAO9a1auWJLqg2RJc%2FZr3KRhlWry1PME2%2FEpPsGUqC%2BaBKogECNv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgyaW3ZuFM1HqQwqNToq3AM%2FvIBwtBD6iue24SkgIqGc%2F1feC2xf1Zl8iOeCEazpHCpbZhdIppUTE868QNumsHbkeHFy4GfnXVoPH%2B5dk1R2Bg527EFYwwiseczXVeFjurkeL81%2Fx1lc%2Bh1nysXI7atwGMTy%2F6sXne4WwsTn%2F4VZVk5zAI5unLTV48S%2Bf7IWJMIpo%2F3w1%2FhdmkvZPoyQbUgXpt0c%2Fddt9bBWIF1NPSc%2FmzotKY4x0wU0nTrL7D88yrkFYi44wBpSg%2Fe3OS6Lcaj%2BDEUGMT2Mo7Jm9CB%2FUwpKJKVUPFvZtOmV7NU59ARcwcP3GZV6EWsiZOpn%2Fegfk3C7%2BwDMMUzlxYCSPxIPPVfZivmrgviJ6QRaq3%2FGAC%2FNS5dbDiUJ3y4wRA%2BAAfyXuHnbCdZIaLPbYBWDPemNGmJxue3jL%2FDdK1%2FRE%2Bk%2FpI%2BmKas17eU0nrnKZ7LG%2B%2FTgqjClm7VlR6zjze3NqKO%2FLp7XU3OVKKCJucRdkwVqy%2F3k%2FLV6PAMVsTUz4hvAf0cmVxgwmXAp3nZwpX4QkkJyzj9rbNnmOeNB4uVSCeXaBkuIwj3taJZcy5xsIj5QDSQjjr0rkBGi5ZE9TGIyxmlC9sTCgTtYcL5I3Oj1ZrBKqgAGhD3gwG4%2BwT6GfsWGCjDZ6KzUBjqkAZmwKo00MIKSLagmPmlwF6%2B6X%2BLSslD30DnO6O5ay3YA9vEu1Ys4RcXkuYRiUvTnTmKLS13BPDAi0x%2BPwXBpena%2FqbfnQtAFVygOokTHVoVWq%2F9h%2FRWhXGeMWbovvk3JKtg0IcmeX%2B0tCBX5PfO8PbX%2FlPo%2Fm7YK5thp4QVbhf3RXkE789u12Q%2B90PwUQQeXA%2FUJYKikQjn3zhDcnytCbNM3S%2BJu&X-Amz-Signature=bd57a09e03585686eb29afcd9f01b6f4209b898d9d42bc44d7b0f2e4a02b7d35&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466ZKN2TO3A%2F20260823%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260823T181329Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEBIaCXVzLXdlc3QtMiJIMEYCIQD3nmm96ogYkEhv%2BFxf1Rp6DK1YNhEGmtGden59EbtJBQIhAO9a1auWJLqg2RJc%2FZr3KRhlWry1PME2%2FEpPsGUqC%2BaBKogECNv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgyaW3ZuFM1HqQwqNToq3AM%2FvIBwtBD6iue24SkgIqGc%2F1feC2xf1Zl8iOeCEazpHCpbZhdIppUTE868QNumsHbkeHFy4GfnXVoPH%2B5dk1R2Bg527EFYwwiseczXVeFjurkeL81%2Fx1lc%2Bh1nysXI7atwGMTy%2F6sXne4WwsTn%2F4VZVk5zAI5unLTV48S%2Bf7IWJMIpo%2F3w1%2FhdmkvZPoyQbUgXpt0c%2Fddt9bBWIF1NPSc%2FmzotKY4x0wU0nTrL7D88yrkFYi44wBpSg%2Fe3OS6Lcaj%2BDEUGMT2Mo7Jm9CB%2FUwpKJKVUPFvZtOmV7NU59ARcwcP3GZV6EWsiZOpn%2Fegfk3C7%2BwDMMUzlxYCSPxIPPVfZivmrgviJ6QRaq3%2FGAC%2FNS5dbDiUJ3y4wRA%2BAAfyXuHnbCdZIaLPbYBWDPemNGmJxue3jL%2FDdK1%2FRE%2Bk%2FpI%2BmKas17eU0nrnKZ7LG%2B%2FTgqjClm7VlR6zjze3NqKO%2FLp7XU3OVKKCJucRdkwVqy%2F3k%2FLV6PAMVsTUz4hvAf0cmVxgwmXAp3nZwpX4QkkJyzj9rbNnmOeNB4uVSCeXaBkuIwj3taJZcy5xsIj5QDSQjjr0rkBGi5ZE9TGIyxmlC9sTCgTtYcL5I3Oj1ZrBKqgAGhD3gwG4%2BwT6GfsWGCjDZ6KzUBjqkAZmwKo00MIKSLagmPmlwF6%2B6X%2BLSslD30DnO6O5ay3YA9vEu1Ys4RcXkuYRiUvTnTmKLS13BPDAi0x%2BPwXBpena%2FqbfnQtAFVygOokTHVoVWq%2F9h%2FRWhXGeMWbovvk3JKtg0IcmeX%2B0tCBX5PfO8PbX%2FlPo%2Fm7YK5thp4QVbhf3RXkE789u12Q%2B90PwUQQeXA%2FUJYKikQjn3zhDcnytCbNM3S%2BJu&X-Amz-Signature=c0988d5ae50a1ef21b2b468950e8fc6ac20106fceae125ab9e52801a0556618c&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

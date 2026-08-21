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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466R7L2C5QA%2F20260821%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260821T062629Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjENX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIB5DUx4O2bTICcP%2FiRF2Mco8%2BavS4D3w131WjlQwlysVAiEA3XmpWjgR2kbmgi1Jj%2FgHBNFYmm756D8qNeGTSyezWb8qiAQInv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDJVgZ6WYlEIMHW5rAyrcA%2BxzkUmwqGoNpd94rN7Iq4vQsteqYpgQZX8ZZlT5LMZ9JVyOswpVvzvmv4ys%2BUFF7e8w0rnuElH86g56OaKBfH2Ioi3eIuEKGVpwozoPEgsX7mdB4Ziq%2FX7%2F%2FTByWMB1o9DRNiJcOFOqzK8MO0T%2F1jKEkO71Q%2BjBxkqlbf8RLHnXEBLb57%2FSvYmZNLvGWYDdklFKTQy9hmghJ3r3jjtXGb1eAEJAsPy4Zq2jsLqq3FBfj%2F6Ab7Ymfl5AMPfbEQvS5oyQF1qgXQdgncXnkEQnWwSqSaHYmeD5zhPmdiFQ6ZpMRUUZmWDTdniirP%2B5eh%2BXkzUYjeHQOHGU3ZO%2Btcg1hlJYP8%2Bdu8iY0h3vBks2Wf%2FkU13GXmTstCUAEbV6AjlilJ0Ji0k%2FjMRBtebuMNqh1t1CdZ2j2ykfa1adfPTytKdNx8Zxzq5fljKbYaKZhX1bKmiQUBc55YpI6eYjcF8P5aT2mPerJoKNniYVSaNTlokgEjP1BcdeGYMIRCfSSW7UswaIA6ZCV1XpnFeqZnqSClcVmOYeza1qK%2BeL7G53SXKVIxFGekcUZvmGYoglkRTlvjWLV63Cx0T8kfhHdlXCWfvcJgUtLwbvy1nBk5o2cSD2HsevW3wRj1pRysi2MO6pn9QGOqUBTzbNm6h%2BIT3HP4DItHDSyEes5EkEx%2BKjDAMuSFQEhp8CxMKGnhdbeVbPrZhd5c1SONyVY5bXnoH0btup2wp71LP0LQhaayQhvq6BFARSMDRJkY1UEqWw%2BNRp3buBWq1ODktf7rikTn5giJfFjL5rAC7t0vonzPqfb8N54YjvEWj7OVGRqPKHP%2BOnXt%2F57UrGLFn2pD%2Bwsm1dwDBheQaSOPBCdeZT&X-Amz-Signature=3a577fd7062706f0cf8ed6325ec82514f9548c0efacfec3195f835d9f51f351b&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466R7L2C5QA%2F20260821%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260821T062629Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjENX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIB5DUx4O2bTICcP%2FiRF2Mco8%2BavS4D3w131WjlQwlysVAiEA3XmpWjgR2kbmgi1Jj%2FgHBNFYmm756D8qNeGTSyezWb8qiAQInv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDJVgZ6WYlEIMHW5rAyrcA%2BxzkUmwqGoNpd94rN7Iq4vQsteqYpgQZX8ZZlT5LMZ9JVyOswpVvzvmv4ys%2BUFF7e8w0rnuElH86g56OaKBfH2Ioi3eIuEKGVpwozoPEgsX7mdB4Ziq%2FX7%2F%2FTByWMB1o9DRNiJcOFOqzK8MO0T%2F1jKEkO71Q%2BjBxkqlbf8RLHnXEBLb57%2FSvYmZNLvGWYDdklFKTQy9hmghJ3r3jjtXGb1eAEJAsPy4Zq2jsLqq3FBfj%2F6Ab7Ymfl5AMPfbEQvS5oyQF1qgXQdgncXnkEQnWwSqSaHYmeD5zhPmdiFQ6ZpMRUUZmWDTdniirP%2B5eh%2BXkzUYjeHQOHGU3ZO%2Btcg1hlJYP8%2Bdu8iY0h3vBks2Wf%2FkU13GXmTstCUAEbV6AjlilJ0Ji0k%2FjMRBtebuMNqh1t1CdZ2j2ykfa1adfPTytKdNx8Zxzq5fljKbYaKZhX1bKmiQUBc55YpI6eYjcF8P5aT2mPerJoKNniYVSaNTlokgEjP1BcdeGYMIRCfSSW7UswaIA6ZCV1XpnFeqZnqSClcVmOYeza1qK%2BeL7G53SXKVIxFGekcUZvmGYoglkRTlvjWLV63Cx0T8kfhHdlXCWfvcJgUtLwbvy1nBk5o2cSD2HsevW3wRj1pRysi2MO6pn9QGOqUBTzbNm6h%2BIT3HP4DItHDSyEes5EkEx%2BKjDAMuSFQEhp8CxMKGnhdbeVbPrZhd5c1SONyVY5bXnoH0btup2wp71LP0LQhaayQhvq6BFARSMDRJkY1UEqWw%2BNRp3buBWq1ODktf7rikTn5giJfFjL5rAC7t0vonzPqfb8N54YjvEWj7OVGRqPKHP%2BOnXt%2F57UrGLFn2pD%2Bwsm1dwDBheQaSOPBCdeZT&X-Amz-Signature=de86357554daf9fcdfda7b1d635d98e7c82313a86255f80999adc95010f9656a&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

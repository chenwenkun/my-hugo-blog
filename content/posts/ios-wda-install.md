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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4665XDPG2NB%2F20261107%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261107T211231Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEDQaCXVzLXdlc3QtMiJIMEYCIQCbhMHGbqyK7%2BqotDbTcXDHtvkmLq3BeThEm1DEKTgoXwIhAK3dF631wsC%2Br8eaSYBfs0U7tpZzy7iQh%2BszyMNwPHVqKogECP3%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgwWJm%2FSPyuu3%2F1OdP0q3APvasBuBWCkobeBjgwVoUbkdUF1066U6Vy9xaR%2BQPwo%2BYCdwAyxiJaGkqUw5REyN8W4407FwwzUF7uR%2F%2FhAuZKyvRj5Rh2A%2BCHyGOIlRxVEIIHgYGVTDfSo2LUgsr9r9vTdeAHqsPoH5WVZhXv2BJfENAjDJMXvKSad%2FLKlsOh8%2FTfH7TBiH2Z60R%2B3YQ7%2FtO8FemxF6mwJWVXDKG6yhVKWBHLJ7L0lxve0GMRuzrZJgi9dCwC0WJtbbQj0xpQXXTLGhrFaNtmCVgS6F0eWs1%2BgVXI4subc7AxOsaXWD93Oa0Mh8sBlyeYGSjIx76y6UAAwpT%2BEkue8akdfChu1hZ8ZEEGOO%2FCARATGv3xKll376kqWgDLeC58Jb1GKpR5o3WBKLjU%2Ff5QymwG5vNJVDxRYRL09P%2BW9VBP8V2K0giatg%2BjTg0YDu26eV3LwD6b%2Fza2YFe3XvA6NaeA27P7sqZZqhgsYsq9YMGFSr40X3AS0fHt7WOAVCuf1YziQMT3z0GYIBaSTY92lp%2Fu7wmZo9r%2BnHQr%2Fk0YwlG%2BKjUf9QMK87%2Bq7nRl3iWswVIakOrHQCmmrHMspxXUV9btS6o0huVHHFH4WRV%2Fks4RIbNnYOrzP6YhBwiFJF4af5hZf%2BjCb%2B73XBjqkAQNizSBPnPINX89vPd%2BPxCW4nWH4YtY%2FVRt0I%2B5pISOBU09%2FvGZnLT8sTxMpHXKWHGqNhvj7mi2g6y1QJIlMUeIjYJEN3UjFz01uYvuxd5qN189PEGbE7ZUgB1thGO6ajqPDMal75r%2BQ%2BQYQVj%2FLLI%2BF7Gvr9oiRj%2F11vWBBhe5QO9JPb4lf5XxhKcJbw%2BIIvtrowt%2BzyWxAVpLHcxSyhEr6ExWM&X-Amz-Signature=f26f12a9a6a5f61f8007403dd3457322b62f0de9d13cebdea7f61a37fc6c9e24&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4665XDPG2NB%2F20261107%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261107T211231Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEDQaCXVzLXdlc3QtMiJIMEYCIQCbhMHGbqyK7%2BqotDbTcXDHtvkmLq3BeThEm1DEKTgoXwIhAK3dF631wsC%2Br8eaSYBfs0U7tpZzy7iQh%2BszyMNwPHVqKogECP3%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgwWJm%2FSPyuu3%2F1OdP0q3APvasBuBWCkobeBjgwVoUbkdUF1066U6Vy9xaR%2BQPwo%2BYCdwAyxiJaGkqUw5REyN8W4407FwwzUF7uR%2F%2FhAuZKyvRj5Rh2A%2BCHyGOIlRxVEIIHgYGVTDfSo2LUgsr9r9vTdeAHqsPoH5WVZhXv2BJfENAjDJMXvKSad%2FLKlsOh8%2FTfH7TBiH2Z60R%2B3YQ7%2FtO8FemxF6mwJWVXDKG6yhVKWBHLJ7L0lxve0GMRuzrZJgi9dCwC0WJtbbQj0xpQXXTLGhrFaNtmCVgS6F0eWs1%2BgVXI4subc7AxOsaXWD93Oa0Mh8sBlyeYGSjIx76y6UAAwpT%2BEkue8akdfChu1hZ8ZEEGOO%2FCARATGv3xKll376kqWgDLeC58Jb1GKpR5o3WBKLjU%2Ff5QymwG5vNJVDxRYRL09P%2BW9VBP8V2K0giatg%2BjTg0YDu26eV3LwD6b%2Fza2YFe3XvA6NaeA27P7sqZZqhgsYsq9YMGFSr40X3AS0fHt7WOAVCuf1YziQMT3z0GYIBaSTY92lp%2Fu7wmZo9r%2BnHQr%2Fk0YwlG%2BKjUf9QMK87%2Bq7nRl3iWswVIakOrHQCmmrHMspxXUV9btS6o0huVHHFH4WRV%2Fks4RIbNnYOrzP6YhBwiFJF4af5hZf%2BjCb%2B73XBjqkAQNizSBPnPINX89vPd%2BPxCW4nWH4YtY%2FVRt0I%2B5pISOBU09%2FvGZnLT8sTxMpHXKWHGqNhvj7mi2g6y1QJIlMUeIjYJEN3UjFz01uYvuxd5qN189PEGbE7ZUgB1thGO6ajqPDMal75r%2BQ%2BQYQVj%2FLLI%2BF7Gvr9oiRj%2F11vWBBhe5QO9JPb4lf5XxhKcJbw%2BIIvtrowt%2BzyWxAVpLHcxSyhEr6ExWM&X-Amz-Signature=e49370ddfc6776c2a93128a7a48cc67081a00d93c120c177429a182fbcc19313&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

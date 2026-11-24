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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB46676AK73PK%2F20261124%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261124T033505Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjELr%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCO2L9R%2BJ8eQzWW06CNqPYHnFaTUjCQGYd9a9sUkFbm5AIhAMREYyU46GwFvkYtucmQh38oC1YUGnqJl0Vq7Uttij%2FAKogECIP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgzIjhJkFR4IajnAbhQq3AMs3qJTsUfNzqhJGs8b9Jc2hwkUL255nzkkizayHDzYS8O%2B9Pn1rqxYJslJrmQtUCNcFaq1eEE1BCn8ye1edjE5DDCUQWDb3ZkvvyZ2C31RjClXEKywI8Sjmo4YzJvQ9yayS%2Fx9Fd6Jbl%2B3UiFhWBCIIYnCtei8GO8i375Fi9KmHZs7VEdsyl43bw4RkyoOLp1HJqLrFvIUpUEM3%2BMAkd2p%2FpwtBJKbIg1FjlA8u2%2BYD4xYMW8lBHXYq78QNhPYJNUDi4Olgc9V%2BEA2t6ibdnsMI%2BCApMmqlbLWcistsjbCweDAvE8gyD0tEIniBLkuumwWUhKG3takd1lma6YnGMij5GME%2BT%2BDwqh4z0gBwIcsmMnb4TYSBmwhWmT660ar04JTcU%2FkGxw1zmPYDrorn8YjYCKy0iljUJRJYudsVo4cKklpev36pWXOaTFM%2F%2FZvSZbTwoBGimQuwltbLXVRzc7uTbIc5XzpmoJXfW%2FfEh1yMbKSVqKB9I5nawq52a2PIfYGS3fhsACcNCtXzaxKMkE3ufMaj%2F%2F0N2f2sI4%2F1NXDkxHOKLbx9E%2BGTDyGebxbhh%2BbNLfihwnDGQHrx1VTtt0S0P6U6LNn%2FYTD1DP1wBC3S2sL35tRqu0OLFltITDw5JPYBjqkAXO9KYf0PUDV4DzbbT1W1iJTfD83nSpzyIfx4D6N8O4RX4wILT9XX3ApSJqrgOa2n7f7UFjCAjPvjE3hluT%2F34hXrMW7XiGp%2BncA9JpGXh2cnOuq1Gu%2B1XT6kQ2JPCYS8LM3s9BwLjr51dXolgkx71DTTIGDbRkHM7ZY9%2F%2Bu9Bbi5zSa5kM5RFzU26kluwO4Yq4dL3cIoU1TDSylw99b9eXlkJJn&X-Amz-Signature=43a7e15da07ec9ed5cca7fd65b00069bfa7641765f553fedadf09384e69fb814&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB46676AK73PK%2F20261124%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261124T033505Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjELr%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCO2L9R%2BJ8eQzWW06CNqPYHnFaTUjCQGYd9a9sUkFbm5AIhAMREYyU46GwFvkYtucmQh38oC1YUGnqJl0Vq7Uttij%2FAKogECIP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgzIjhJkFR4IajnAbhQq3AMs3qJTsUfNzqhJGs8b9Jc2hwkUL255nzkkizayHDzYS8O%2B9Pn1rqxYJslJrmQtUCNcFaq1eEE1BCn8ye1edjE5DDCUQWDb3ZkvvyZ2C31RjClXEKywI8Sjmo4YzJvQ9yayS%2Fx9Fd6Jbl%2B3UiFhWBCIIYnCtei8GO8i375Fi9KmHZs7VEdsyl43bw4RkyoOLp1HJqLrFvIUpUEM3%2BMAkd2p%2FpwtBJKbIg1FjlA8u2%2BYD4xYMW8lBHXYq78QNhPYJNUDi4Olgc9V%2BEA2t6ibdnsMI%2BCApMmqlbLWcistsjbCweDAvE8gyD0tEIniBLkuumwWUhKG3takd1lma6YnGMij5GME%2BT%2BDwqh4z0gBwIcsmMnb4TYSBmwhWmT660ar04JTcU%2FkGxw1zmPYDrorn8YjYCKy0iljUJRJYudsVo4cKklpev36pWXOaTFM%2F%2FZvSZbTwoBGimQuwltbLXVRzc7uTbIc5XzpmoJXfW%2FfEh1yMbKSVqKB9I5nawq52a2PIfYGS3fhsACcNCtXzaxKMkE3ufMaj%2F%2F0N2f2sI4%2F1NXDkxHOKLbx9E%2BGTDyGebxbhh%2BbNLfihwnDGQHrx1VTtt0S0P6U6LNn%2FYTD1DP1wBC3S2sL35tRqu0OLFltITDw5JPYBjqkAXO9KYf0PUDV4DzbbT1W1iJTfD83nSpzyIfx4D6N8O4RX4wILT9XX3ApSJqrgOa2n7f7UFjCAjPvjE3hluT%2F34hXrMW7XiGp%2BncA9JpGXh2cnOuq1Gu%2B1XT6kQ2JPCYS8LM3s9BwLjr51dXolgkx71DTTIGDbRkHM7ZY9%2F%2Bu9Bbi5zSa5kM5RFzU26kluwO4Yq4dL3cIoU1TDSylw99b9eXlkJJn&X-Amz-Signature=a279f169f4077115955e9f57d3442e6ff0cf6ddfccf8c11d6b1b36388b349a41&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

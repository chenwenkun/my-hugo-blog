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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466XAABBLAW%2F20261021%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261021T022645Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEIn%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQDKW8Cwqvo2w%2FelzS5N8dKS5P14ogDf1Us7nxDCe0iWxgIgQ9bEOKhp%2Bbz9i%2BqxiCgkQ%2Boruf4tGp9pqRadYp%2FyZxQq%2FwMIUhAAGgw2Mzc0MjMxODM4MDUiDCWt54Zhqjqq8jFvECrcAxDnAwbXrHbSDZPowOYl1DizK%2BXLB%2Fo4CGmZW0iEMv4iDcU2tsm2Lkn2wifk6dzGS2CRKMyUP5EOknLOJGGv8wyCX0pKmx1vAtoLm1tRsvAwWlqnK14PQD7GsDBA%2FLk6oQ9GbTbd6IzxTJ3JI%2FJpvG4VLdKN4%2FAuk0K7uGNJy2W1Dp%2BsfPXUX2wLzTjbulql5Hlwf9%2BorgRbIeVXddhh8uEH%2BYJKfcDReb4EAf49PppgoKfWXKE2HoTE39F%2FfUfLFo6JtKmNT%2BmJCv2bgZpUU%2B%2B0lpMufbDdGDWt9zFErospgkreW5YnnVN9QlVAyp8sBMhoeXVDtNpPsquhlGlht%2F2SKa8agBjJjrM39QZ8Z83RVlOOvuSMb4cV4b%2FyJ0FUT8mfAILEXdqD0MXAF5xvCeFdtyuKVt6me3%2FlNZIMboErTI%2ByTetZMZ5SqXSoWHP5S1wME8kg8xnyJ9pfSojiAPxsIP6QBvWKwOuAd1gMw%2Bf3H98SwyErX5TI6jQLqkdCCS1IMOdJwS421Kc0YmGcVnhG7hqE%2BM0bJuNySxbg9hWteBaxDGZa68be0qE0T0mHZUuSuehDG3qcyNNTBZF0wGRbNRK6oyn%2B8azeDtHIxexr7wZd%2BK5swRg2uAXbMMWZ4NYGOqUBv7iy7GL2%2Bp%2FmfH9gmPtgpzMOjiOKj6tHb7Hudh3zmEJT5uYp4zzOpLZ9P69EDg%2BUZJX0TiWzwkrJJZ5sKOrn2XrAaTmwLPARGi13jIijrn%2B1HEKe9Z%2BFyTcXZ6oCj7ohpQNdMKIMwLRisgPq2pwwtIE%2BDnk%2BFU9gKh3NwEJBGGl%2F7lgPs3z3bMsJ2e%2FK308eu%2F4pWhBOOtzC6cJL7Enua3vRykpx&X-Amz-Signature=2782234bda4c2994cab4da48107a4908a2a6ff952e5871962e621887e7b587dd&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466XAABBLAW%2F20261021%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261021T022645Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEIn%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQDKW8Cwqvo2w%2FelzS5N8dKS5P14ogDf1Us7nxDCe0iWxgIgQ9bEOKhp%2Bbz9i%2BqxiCgkQ%2Boruf4tGp9pqRadYp%2FyZxQq%2FwMIUhAAGgw2Mzc0MjMxODM4MDUiDCWt54Zhqjqq8jFvECrcAxDnAwbXrHbSDZPowOYl1DizK%2BXLB%2Fo4CGmZW0iEMv4iDcU2tsm2Lkn2wifk6dzGS2CRKMyUP5EOknLOJGGv8wyCX0pKmx1vAtoLm1tRsvAwWlqnK14PQD7GsDBA%2FLk6oQ9GbTbd6IzxTJ3JI%2FJpvG4VLdKN4%2FAuk0K7uGNJy2W1Dp%2BsfPXUX2wLzTjbulql5Hlwf9%2BorgRbIeVXddhh8uEH%2BYJKfcDReb4EAf49PppgoKfWXKE2HoTE39F%2FfUfLFo6JtKmNT%2BmJCv2bgZpUU%2B%2B0lpMufbDdGDWt9zFErospgkreW5YnnVN9QlVAyp8sBMhoeXVDtNpPsquhlGlht%2F2SKa8agBjJjrM39QZ8Z83RVlOOvuSMb4cV4b%2FyJ0FUT8mfAILEXdqD0MXAF5xvCeFdtyuKVt6me3%2FlNZIMboErTI%2ByTetZMZ5SqXSoWHP5S1wME8kg8xnyJ9pfSojiAPxsIP6QBvWKwOuAd1gMw%2Bf3H98SwyErX5TI6jQLqkdCCS1IMOdJwS421Kc0YmGcVnhG7hqE%2BM0bJuNySxbg9hWteBaxDGZa68be0qE0T0mHZUuSuehDG3qcyNNTBZF0wGRbNRK6oyn%2B8azeDtHIxexr7wZd%2BK5swRg2uAXbMMWZ4NYGOqUBv7iy7GL2%2Bp%2FmfH9gmPtgpzMOjiOKj6tHb7Hudh3zmEJT5uYp4zzOpLZ9P69EDg%2BUZJX0TiWzwkrJJZ5sKOrn2XrAaTmwLPARGi13jIijrn%2B1HEKe9Z%2BFyTcXZ6oCj7ohpQNdMKIMwLRisgPq2pwwtIE%2BDnk%2BFU9gKh3NwEJBGGl%2F7lgPs3z3bMsJ2e%2FK308eu%2F4pWhBOOtzC6cJL7Enua3vRykpx&X-Amz-Signature=75baee3a77431068ab7327ff946a6e00502477497e8066f3da5c5577695c0332&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

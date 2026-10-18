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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4666OWJ3P5J%2F20261018%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261018T100346Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEEoaCXVzLXdlc3QtMiJIMEYCIQCdGo6FsDSTkmw2lZfSHbBrJo%2FqEOgU7LD9WxVJu%2FzDHwIhAPRRuVvSH7zTk8EZuj2wRyd9mvERI71taQzAsME1WgOxKv8DCBIQABoMNjM3NDIzMTgzODA1IgyfkhX0JeyawxYtV2cq3AM9a7xOYtwhScoDrtm8GP2IFo5ro%2BieFr8pla%2B5OR%2BKElBiTuPH4N8bn1Axek4xmcxmd%2Boi1pHhYxBcyEaNlJ7VUTaUZLlfEBI%2FjyOEYHnzj0xs6df4HepkDFCgzB2itytLVKCV%2FaZ3xxO4AegdvKGZemrYRB03DKzM86wUsWsFFgj6bCfUuUGpInjZ%2F3pp%2Fi4IF2qcMbj4RiiJlreXYkXdp8B7yb0mQFaOHa1d2o78SsTMriIG4Ixq%2BpIkN2xkaTNEAoHQ9bLLhpBsEtCjEVbZOXEClrTWloFmaW2Y9hwFp6w7CQKaRCEEYAkwkIMVjDOjh%2BrBeFqFNfKyVDJSfg1AMv11p%2FQYWFRUDy0vMAmMTuEaaj%2BqgViWI1IZywR%2BQ3ZVyjuVM8ydzr1%2BUbLkxqmv3NA6LTgOU6gofuO6HKi51vtEhWGClxDy%2BxGbKScl6LGtD8clyX%2BvrRhUnhjZlQb9wvbKqTNsG84flZnT7%2F%2Fe%2FGmq%2BcJ1kW%2BQ0EGC7xLueIqB6JByz5sI1vowFOQS0D8ZqncFg7DmPxRqPCeDFiMJigeMYI3gc7JiyJ%2B4wOjS3Ra70lMV5IUui%2B%2B7tZnt4rNN%2Bhu36dG%2BzJVgmJOsmfu6ONVspTW4cUlsLrLA7TCQrNLWBjqkAZo1CMjMkxKUAs%2Bk%2FAxsscvV6L0oc28XfdsqQkWMr5UqVTTpgflWB3Luy8YvRE9jzUnXiidYzOomPh7EgXlf2vOZj9lJNJa6ieY0PemcaEbCfg5imlLhTmZz6ACJXLAip20OFfvN%2FoFAT%2Bolx91Iet%2BEuk4z2uuLMSJXxkJdKj%2BGtWgIlr%2BpuTXzI6U3XpK39QvZc07aDU2p6cEzltHTB3pt5jYo&X-Amz-Signature=1ada862e9fa8d8d72577e2d4a98e322779c3fa6109eaef828601419b1af88f14&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4666OWJ3P5J%2F20261018%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261018T100346Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEEoaCXVzLXdlc3QtMiJIMEYCIQCdGo6FsDSTkmw2lZfSHbBrJo%2FqEOgU7LD9WxVJu%2FzDHwIhAPRRuVvSH7zTk8EZuj2wRyd9mvERI71taQzAsME1WgOxKv8DCBIQABoMNjM3NDIzMTgzODA1IgyfkhX0JeyawxYtV2cq3AM9a7xOYtwhScoDrtm8GP2IFo5ro%2BieFr8pla%2B5OR%2BKElBiTuPH4N8bn1Axek4xmcxmd%2Boi1pHhYxBcyEaNlJ7VUTaUZLlfEBI%2FjyOEYHnzj0xs6df4HepkDFCgzB2itytLVKCV%2FaZ3xxO4AegdvKGZemrYRB03DKzM86wUsWsFFgj6bCfUuUGpInjZ%2F3pp%2Fi4IF2qcMbj4RiiJlreXYkXdp8B7yb0mQFaOHa1d2o78SsTMriIG4Ixq%2BpIkN2xkaTNEAoHQ9bLLhpBsEtCjEVbZOXEClrTWloFmaW2Y9hwFp6w7CQKaRCEEYAkwkIMVjDOjh%2BrBeFqFNfKyVDJSfg1AMv11p%2FQYWFRUDy0vMAmMTuEaaj%2BqgViWI1IZywR%2BQ3ZVyjuVM8ydzr1%2BUbLkxqmv3NA6LTgOU6gofuO6HKi51vtEhWGClxDy%2BxGbKScl6LGtD8clyX%2BvrRhUnhjZlQb9wvbKqTNsG84flZnT7%2F%2Fe%2FGmq%2BcJ1kW%2BQ0EGC7xLueIqB6JByz5sI1vowFOQS0D8ZqncFg7DmPxRqPCeDFiMJigeMYI3gc7JiyJ%2B4wOjS3Ra70lMV5IUui%2B%2B7tZnt4rNN%2Bhu36dG%2BzJVgmJOsmfu6ONVspTW4cUlsLrLA7TCQrNLWBjqkAZo1CMjMkxKUAs%2Bk%2FAxsscvV6L0oc28XfdsqQkWMr5UqVTTpgflWB3Luy8YvRE9jzUnXiidYzOomPh7EgXlf2vOZj9lJNJa6ieY0PemcaEbCfg5imlLhTmZz6ACJXLAip20OFfvN%2FoFAT%2Bolx91Iet%2BEuk4z2uuLMSJXxkJdKj%2BGtWgIlr%2BpuTXzI6U3XpK39QvZc07aDU2p6cEzltHTB3pt5jYo&X-Amz-Signature=8f65fbcccc5a01e822934f96b85f0aacf04f3066d37583d4d1f0feea90cbe324&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

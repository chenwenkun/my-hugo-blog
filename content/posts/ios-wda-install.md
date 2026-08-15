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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466XL75X6KE%2F20260815%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260815T061845Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEEYaCXVzLXdlc3QtMiJHMEUCIE%2FX0y6GTpoVay9j6OJtM8Ze6f39Y876lnk4r8bYFc4NAiEAyS46gByKvKFo7jS%2BaPq8Own%2B7Yyr9%2FbA8BLjrdC8Q60q%2FwMIDxAAGgw2Mzc0MjMxODM4MDUiDIoLhT0X4UwUajziSCrcAxcgFNQ7sdmNeF5T7wQkgL2THjF3r%2FJly1FsXHgGFBh4Nv9tEnMZYB4SkmfLeAImZyb9ST3u70faBlRQLElrIGQdXpsg%2BjTc66sNWFDI5KA93sWzsWZ83KADTE4I19wvTvSu0q%2FHyL%2Bt4b4iQbigf0cskOBv0%2F0kFur5gVmwal9G%2BsqZa8fJ9dLMVdjnx6wJhI10OViviyFiIVSEWKAYnoGHeAVQdW1NxAM1w4l%2BMUfRRtlS1%2B%2Fou7m4xtGqgVi1b7LDPZFcoTtzt7H7jnWAUF28sPrt5tc3L5xbmUziHVNBzS0w1EVv8gfSBUk0ML6vjXqp%2Fg%2FHdiGGvVcKOdOG4wY2qCK6oGpZDRGlIZajeYI4FNdM9usH7MwFsAj7LRCgAUxK31GMM3wEjoH%2BOllaJKLH4WvfclhIQGEqkoGuLrUo0ZBJSqCTIxORBlhJ5jVVZ4ZNAv7waITxM7oTwAm5bSOl6VVJlr98JxFBLsGBjNQbTUkpMA4YPy5ewSkEP8PfUv%2Fa7MeCOZEFeAyWQHk5M9YV8tEBTQNyrFgKPmJ5RsefwJIvTX8Tia9Dh%2F1Zcu7a%2Bx4UZlVPZxts1zsPC6aEcwgUZj9%2BXvqSXp0HZbw6EOco%2BgD5%2Fi2hgFmflb5sMN2AgNQGOqUBpGbSjRGEwMKzz76U5%2FmaPGNU6v4PzF2GEzAE9sYVx7xFN%2BiYtk6ptMmc0z58htYv09QU5ini9KkKJKItYuugSUKjixEVPU6TLqfjBA3JSU9Pg5p99mX5%2F4BDazUxbKswtXFM4kiI%2FI9yl0kdWLJn%2FYDcGKmZ430W6zUOQNpZazqtYtXxu25s5B00iHShvbXx8VpkYAlKR4R40eWQpobkh47f1U%2BN&X-Amz-Signature=e7be120867bad4055fd4e2adddab35c5c72e89878954118bc09611aa22cb9d6e&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466XL75X6KE%2F20260815%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260815T061845Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEEYaCXVzLXdlc3QtMiJHMEUCIE%2FX0y6GTpoVay9j6OJtM8Ze6f39Y876lnk4r8bYFc4NAiEAyS46gByKvKFo7jS%2BaPq8Own%2B7Yyr9%2FbA8BLjrdC8Q60q%2FwMIDxAAGgw2Mzc0MjMxODM4MDUiDIoLhT0X4UwUajziSCrcAxcgFNQ7sdmNeF5T7wQkgL2THjF3r%2FJly1FsXHgGFBh4Nv9tEnMZYB4SkmfLeAImZyb9ST3u70faBlRQLElrIGQdXpsg%2BjTc66sNWFDI5KA93sWzsWZ83KADTE4I19wvTvSu0q%2FHyL%2Bt4b4iQbigf0cskOBv0%2F0kFur5gVmwal9G%2BsqZa8fJ9dLMVdjnx6wJhI10OViviyFiIVSEWKAYnoGHeAVQdW1NxAM1w4l%2BMUfRRtlS1%2B%2Fou7m4xtGqgVi1b7LDPZFcoTtzt7H7jnWAUF28sPrt5tc3L5xbmUziHVNBzS0w1EVv8gfSBUk0ML6vjXqp%2Fg%2FHdiGGvVcKOdOG4wY2qCK6oGpZDRGlIZajeYI4FNdM9usH7MwFsAj7LRCgAUxK31GMM3wEjoH%2BOllaJKLH4WvfclhIQGEqkoGuLrUo0ZBJSqCTIxORBlhJ5jVVZ4ZNAv7waITxM7oTwAm5bSOl6VVJlr98JxFBLsGBjNQbTUkpMA4YPy5ewSkEP8PfUv%2Fa7MeCOZEFeAyWQHk5M9YV8tEBTQNyrFgKPmJ5RsefwJIvTX8Tia9Dh%2F1Zcu7a%2Bx4UZlVPZxts1zsPC6aEcwgUZj9%2BXvqSXp0HZbw6EOco%2BgD5%2Fi2hgFmflb5sMN2AgNQGOqUBpGbSjRGEwMKzz76U5%2FmaPGNU6v4PzF2GEzAE9sYVx7xFN%2BiYtk6ptMmc0z58htYv09QU5ini9KkKJKItYuugSUKjixEVPU6TLqfjBA3JSU9Pg5p99mX5%2F4BDazUxbKswtXFM4kiI%2FI9yl0kdWLJn%2FYDcGKmZ430W6zUOQNpZazqtYtXxu25s5B00iHShvbXx8VpkYAlKR4R40eWQpobkh47f1U%2BN&X-Amz-Signature=b2cdbeef7266adfa2e331cdae27482909f64b64ae8c51ea5ca9bdbca948aa721&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

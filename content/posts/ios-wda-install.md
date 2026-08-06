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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB46665GAYWX5%2F20260806%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260806T012636Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEGgaCXVzLXdlc3QtMiJGMEQCIDDtWux4IBXXUt%2Bqd5WuiX2OcMvL%2Fe9l4p6ArzvvC%2ByaAiBl2WtDk2TP8OV5h6iEz8q6nBHJgaVRityDGTAbriioZir%2FAwgxEAAaDDYzNzQyMzE4MzgwNSIMML2w1CwwqICmBDGnKtwDX4chKqapEHmYTuAhBpbXrQErRZpjNaTSC%2B9qSkKRHOsKDji59svDjOP9mHo94MTKGtH7wDyweTpub0inmo5hml3tFoCtp3XEJcR%2BM1seSaUYF7LGKo%2F9Rlzabr6YZoy%2BieUeQb0yDU8xWb9JvvRl4n7XXtF0Y2u%2FHnQwhJrXGQaGW9DZlFh5%2FtnjwtU%2BNWU9kdq2vCsjLD0HRPVEO0rY4QEIbusmh4t8dBCX%2F8VmDWvxpYWUIbBiKOh2R1gKUjIHuUDBsKywOfUmvTsfEl%2FcjvkCq1WV7q%2Br2hJP%2B0DE8rFfNhhTsoZwvHw%2B8whowoAbFSla35VJBBXF98DhS%2FgxK%2FwYhYAPqWxfqNXceb1TNX5Xh5Azk%2BjYjvs5qvQVP9ZCzyjYUr9eoVTfXlfGAcMMJ%2FJrt05K1xnZbpWyQJ3%2BTk5o2aqbt6bZQ1d%2B%2BFoQ0Ngc1yxOjofpNyGwORlpC2dqo0DrHMUY5SR2d2UVZd6b%2BKrYz61ljD0Yzof1c67KHN%2FFHj9YHPt9vbzXi2%2BKohI7xwwMYXaDngrbN26pMnOfnwF6CQRrzAU3UoPL2UDqTtQlRpqM9MvQS787P%2FwbE8ewoAzWKQMeuZtYDohUEOvDpR5uI5O4czMIhT%2BCfPEwlqXP0wY6pgGdmFJ8wZL26asxSYrIP%2BJRYDybJ3%2BFzhYyzoTRYJXTh38NC9XJBbVgM09NwBb1IUhmYLF9dfRtmHzKwoyKP7ycI7katSGjb1Vu38VLrJWfS9ObHjQiH0Lj2JiMqTTGlyr8iofgUXgfTbptW8SZVnBkEWBOtDdB%2F5WYq5Lcyyl8xKoV2S5ZOXOOSCD%2Fneh3viXt%2Buqmo8Wn8WOuAFPbu6Orjmg37PmV&X-Amz-Signature=35ed8fb5d3568ee661047001a32fabfcefb6c01e7d0dfb55ca90c81d5685e245&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB46665GAYWX5%2F20260806%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260806T012636Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEGgaCXVzLXdlc3QtMiJGMEQCIDDtWux4IBXXUt%2Bqd5WuiX2OcMvL%2Fe9l4p6ArzvvC%2ByaAiBl2WtDk2TP8OV5h6iEz8q6nBHJgaVRityDGTAbriioZir%2FAwgxEAAaDDYzNzQyMzE4MzgwNSIMML2w1CwwqICmBDGnKtwDX4chKqapEHmYTuAhBpbXrQErRZpjNaTSC%2B9qSkKRHOsKDji59svDjOP9mHo94MTKGtH7wDyweTpub0inmo5hml3tFoCtp3XEJcR%2BM1seSaUYF7LGKo%2F9Rlzabr6YZoy%2BieUeQb0yDU8xWb9JvvRl4n7XXtF0Y2u%2FHnQwhJrXGQaGW9DZlFh5%2FtnjwtU%2BNWU9kdq2vCsjLD0HRPVEO0rY4QEIbusmh4t8dBCX%2F8VmDWvxpYWUIbBiKOh2R1gKUjIHuUDBsKywOfUmvTsfEl%2FcjvkCq1WV7q%2Br2hJP%2B0DE8rFfNhhTsoZwvHw%2B8whowoAbFSla35VJBBXF98DhS%2FgxK%2FwYhYAPqWxfqNXceb1TNX5Xh5Azk%2BjYjvs5qvQVP9ZCzyjYUr9eoVTfXlfGAcMMJ%2FJrt05K1xnZbpWyQJ3%2BTk5o2aqbt6bZQ1d%2B%2BFoQ0Ngc1yxOjofpNyGwORlpC2dqo0DrHMUY5SR2d2UVZd6b%2BKrYz61ljD0Yzof1c67KHN%2FFHj9YHPt9vbzXi2%2BKohI7xwwMYXaDngrbN26pMnOfnwF6CQRrzAU3UoPL2UDqTtQlRpqM9MvQS787P%2FwbE8ewoAzWKQMeuZtYDohUEOvDpR5uI5O4czMIhT%2BCfPEwlqXP0wY6pgGdmFJ8wZL26asxSYrIP%2BJRYDybJ3%2BFzhYyzoTRYJXTh38NC9XJBbVgM09NwBb1IUhmYLF9dfRtmHzKwoyKP7ycI7katSGjb1Vu38VLrJWfS9ObHjQiH0Lj2JiMqTTGlyr8iofgUXgfTbptW8SZVnBkEWBOtDdB%2F5WYq5Lcyyl8xKoV2S5ZOXOOSCD%2Fneh3viXt%2Buqmo8Wn8WOuAFPbu6Orjmg37PmV&X-Amz-Signature=dc527bdc4084a50d8326ca76679141b118ef9bf0a2dec4c3dabe14366d31ed51&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

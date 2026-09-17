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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466XEVGR6BW%2F20260917%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260917T155054Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEGgaCXVzLXdlc3QtMiJHMEUCIEyK9jENbDYBuVZNB7PDrdiE4ywRS9MtzBqL2wMKQwTXAiEAs3tjKfQeUzFSVIK2I6mlEf0%2FReJHdjJJwDdeoQF66%2Bwq%2FwMIMRAAGgw2Mzc0MjMxODM4MDUiDEt0%2BGxIaM2%2BHZkyZCrcA4TEs8aLQEl4YDf2F8u6KLnhbCiEifvrXr54HFvW8RU2lgliv6cSdR3SeBebICJZcWnd%2FYRn5Sf1hWxIh9KbEE54cNucIqzCSThlFJ%2BNFzgbUH8exIjKEyPg8YFoqLiL1CGqpF4QXLFErantTr0XbLPqedb2vu48iBiG9lS1Opek0MWsF03QEhapAt%2BLmw7jnlR9GvPRyL5dLHT2MzMLkff2rz79EOILyDltd3eoKNg4hGL0iwhee8%2BhGhNOkq7qv6OjesEfT%2BCGqQv6A49YMnz%2BLD%2FwcQHTmPp3qJap9XMW1cTv8gfaELWoAog5c11%2FO48twXtQbTjpZcpYa6e%2F0J4NdZ9v48FuRkjVGCdTSV5fC63CPro5XAlrWjdnq9eUqbh0CuM2K1g1F4OhwZAxNVjNBHQ8%2BVbEU6AhVA%2FJglA4txP2qk8WEQyeCcYro3ZDOHRN%2BuqxfQ6mPLM7IZiSd3Hb%2FeIxzKZggXDKX%2F6W%2F97kS%2BOFJy9S9%2F3s2cgTOSIo84Vn7A8Fj9WCB5hQpZHPtmVKOUKy3R6ma6lyOztxUSHBg%2Fd5tSxggoQLL7kYhT%2FCZNIoz4hxMd6R7qEdPG91lnp%2FbsL20ry2CpEa22Ph6FQjG%2B8leFXBDcsRrxl2MP6PsNUGOqUBGB1Nt2UAwKckKXuZPFYUSQFFV7Nvtu%2BMzFHHR7XCdKoKRJbRv0GWMY5N68HkfOJ78PeeD%2FaDGeF0LqTSVDE2R2SOHIZ8uq1OzsYYkhxQbJge2Tgq0p5zakTrrkZwa7F%2BXSgosYLYULXEh%2F8iX4tSA01Y9CTNDaa%2BDAANu3%2BUiLuLWujvIPsWomhjWMCqQOxVrTM491hxKTtMZgXRqMqBnu0357BJ&X-Amz-Signature=f97815afb3e17dff4f0901db7e9245c588cc6c59e7f62667c7f30dcd6cf10470&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466XEVGR6BW%2F20260917%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260917T155054Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEGgaCXVzLXdlc3QtMiJHMEUCIEyK9jENbDYBuVZNB7PDrdiE4ywRS9MtzBqL2wMKQwTXAiEAs3tjKfQeUzFSVIK2I6mlEf0%2FReJHdjJJwDdeoQF66%2Bwq%2FwMIMRAAGgw2Mzc0MjMxODM4MDUiDEt0%2BGxIaM2%2BHZkyZCrcA4TEs8aLQEl4YDf2F8u6KLnhbCiEifvrXr54HFvW8RU2lgliv6cSdR3SeBebICJZcWnd%2FYRn5Sf1hWxIh9KbEE54cNucIqzCSThlFJ%2BNFzgbUH8exIjKEyPg8YFoqLiL1CGqpF4QXLFErantTr0XbLPqedb2vu48iBiG9lS1Opek0MWsF03QEhapAt%2BLmw7jnlR9GvPRyL5dLHT2MzMLkff2rz79EOILyDltd3eoKNg4hGL0iwhee8%2BhGhNOkq7qv6OjesEfT%2BCGqQv6A49YMnz%2BLD%2FwcQHTmPp3qJap9XMW1cTv8gfaELWoAog5c11%2FO48twXtQbTjpZcpYa6e%2F0J4NdZ9v48FuRkjVGCdTSV5fC63CPro5XAlrWjdnq9eUqbh0CuM2K1g1F4OhwZAxNVjNBHQ8%2BVbEU6AhVA%2FJglA4txP2qk8WEQyeCcYro3ZDOHRN%2BuqxfQ6mPLM7IZiSd3Hb%2FeIxzKZggXDKX%2F6W%2F97kS%2BOFJy9S9%2F3s2cgTOSIo84Vn7A8Fj9WCB5hQpZHPtmVKOUKy3R6ma6lyOztxUSHBg%2Fd5tSxggoQLL7kYhT%2FCZNIoz4hxMd6R7qEdPG91lnp%2FbsL20ry2CpEa22Ph6FQjG%2B8leFXBDcsRrxl2MP6PsNUGOqUBGB1Nt2UAwKckKXuZPFYUSQFFV7Nvtu%2BMzFHHR7XCdKoKRJbRv0GWMY5N68HkfOJ78PeeD%2FaDGeF0LqTSVDE2R2SOHIZ8uq1OzsYYkhxQbJge2Tgq0p5zakTrrkZwa7F%2BXSgosYLYULXEh%2F8iX4tSA01Y9CTNDaa%2BDAANu3%2BUiLuLWujvIPsWomhjWMCqQOxVrTM491hxKTtMZgXRqMqBnu0357BJ&X-Amz-Signature=91a4f86e20a5a46664eecdbd3f7d92c603ba08ed76d86a1c9658ca88f6e6b6a9&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

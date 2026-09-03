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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4664HEEW4DV%2F20260903%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260903T102007Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEBEaCXVzLXdlc3QtMiJIMEYCIQCzgUPMMDLsSfZxIzz1raocP6p7Hvsw%2FwEg9157XQmJqQIhALtmsc%2BtQAbi%2FuRZZm99Up461W4lHGqA68DdC0%2F4IbXoKogECNr%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgxNscsDewSi04O%2Fzd8q3ANh7Lnnzs1jh%2BD20rHqnp16ErE9oFHvOSmLqj%2B%2BvkIf61BA%2BvKZQeFumKMFOymibQYj%2Bye52%2F27nnHM0FzKdSLwuCk4Ee%2FaOxgDmTXdUtlX5gGIhE24w%2FXiekHkmdToupluserHcXTFh%2F04e2oJndo0%2BsOeV%2BE21lP54Gja5Z0ETebMZvA8DaKNFMAjriijH5HmOoHC6zv5HzXqweCy4GDlFKRV1pDPjR%2BSdpfpfXuwCIaDmIkFiyPZcyASgtCC5PeIXwum9zhkHu7%2Bjy4z6%2Brx%2BE6I5zCuGfXUE%2FVgucmDQB6pPkNdxTE1ZGZO1rXR%2B4XWWAv9LRVG8iRSHEPrUpX72jAg3ZkFwAbXqQU2EIvKwWH08GWhagH1c2Maj%2B78sOsRmVAjuRNA37AEopDnf1VzZ2QZ4MRLoK%2Bkf3HT2bLzZK9FqOyhrLasCTyD0268WiF%2B2lGk3eV2o7qToxVoO9p5y%2BUXVH5UcwXNSHn5WxofURPKVe3WeF5Xs1MvG7KO3%2B73PyNjyv72C6nC7IWvjsVOEfnPQlt60Ywd0vBmdG9NcJ%2FP8lkEDu0XIPEPhIcfwgvUjTBuLyvZJJDwoTyly7oYn3AlGBN7jxso4lttbABhLbdM9Xzc1Wsy0%2FS%2BozCX7eTUBjqkAf42t0J%2F4d7rJU%2BRdZvh0wm1A971mTsWkC4LKmcTYlOJynQAA7PHyHVOfzle9EAvVaejuKYgrba5jdX%2Bf3uy9V3CFzyCiTCBGWCs%2F%2BsvU%2FopWZtUC4Waj9F1b%2B7hnE6UHriBVNzdy751pnCaY%2FKQVHsKpxfaVql3cYgAEmyx7jY0DqlN8QwdH3ld7%2FqGH2810YBBcLWtjfdN8I27IAntqowql5%2Bu&X-Amz-Signature=ca61dac9ee293938e7bcc2238810be793bcd3abc062b14a9b0a4303dd920fa98&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4664HEEW4DV%2F20260903%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260903T102008Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEBEaCXVzLXdlc3QtMiJIMEYCIQCzgUPMMDLsSfZxIzz1raocP6p7Hvsw%2FwEg9157XQmJqQIhALtmsc%2BtQAbi%2FuRZZm99Up461W4lHGqA68DdC0%2F4IbXoKogECNr%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgxNscsDewSi04O%2Fzd8q3ANh7Lnnzs1jh%2BD20rHqnp16ErE9oFHvOSmLqj%2B%2BvkIf61BA%2BvKZQeFumKMFOymibQYj%2Bye52%2F27nnHM0FzKdSLwuCk4Ee%2FaOxgDmTXdUtlX5gGIhE24w%2FXiekHkmdToupluserHcXTFh%2F04e2oJndo0%2BsOeV%2BE21lP54Gja5Z0ETebMZvA8DaKNFMAjriijH5HmOoHC6zv5HzXqweCy4GDlFKRV1pDPjR%2BSdpfpfXuwCIaDmIkFiyPZcyASgtCC5PeIXwum9zhkHu7%2Bjy4z6%2Brx%2BE6I5zCuGfXUE%2FVgucmDQB6pPkNdxTE1ZGZO1rXR%2B4XWWAv9LRVG8iRSHEPrUpX72jAg3ZkFwAbXqQU2EIvKwWH08GWhagH1c2Maj%2B78sOsRmVAjuRNA37AEopDnf1VzZ2QZ4MRLoK%2Bkf3HT2bLzZK9FqOyhrLasCTyD0268WiF%2B2lGk3eV2o7qToxVoO9p5y%2BUXVH5UcwXNSHn5WxofURPKVe3WeF5Xs1MvG7KO3%2B73PyNjyv72C6nC7IWvjsVOEfnPQlt60Ywd0vBmdG9NcJ%2FP8lkEDu0XIPEPhIcfwgvUjTBuLyvZJJDwoTyly7oYn3AlGBN7jxso4lttbABhLbdM9Xzc1Wsy0%2FS%2BozCX7eTUBjqkAf42t0J%2F4d7rJU%2BRdZvh0wm1A971mTsWkC4LKmcTYlOJynQAA7PHyHVOfzle9EAvVaejuKYgrba5jdX%2Bf3uy9V3CFzyCiTCBGWCs%2F%2BsvU%2FopWZtUC4Waj9F1b%2B7hnE6UHriBVNzdy751pnCaY%2FKQVHsKpxfaVql3cYgAEmyx7jY0DqlN8QwdH3ld7%2FqGH2810YBBcLWtjfdN8I27IAntqowql5%2Bu&X-Amz-Signature=5cfd9ea998c7a7cb71ebb25ac5a637483bcfebbf881fd3e93fab51c32d847ecd&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

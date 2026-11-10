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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB46624QXDL4M%2F20261110%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261110T005733Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEGgaCXVzLXdlc3QtMiJIMEYCIQCECelZV0V9lw6QJwxpy2aSY1w6yGD6FaheVdl4R0BymwIhAMTkns1utfedETaIcmunMPRVQPwNnAgA1fRf6ACEs2P0Kv8DCDEQABoMNjM3NDIzMTgzODA1IgyE%2FMOva3quIUwyu04q3AN5QAeou9dJT1sIm2x55U0zxOnnosyutF5LYa6ImYRw1lbVFe%2FzFIZ2q9shyrrNxdhdwMgb0r9uHbwV6%2Fc8Pd1aCmqRGwqHZC1G9J1V1uYwCYg7TadO1uWPU3oWUcPTqd%2BfLPMi9g1bAIrk7OfZtT7SCImWiNyvRM9%2FMLQruaqGIQEumobZIahfa1eHwKNk1a30Kbfix5oMI5J5GMQ03qBWsm1s72t28hEQeC4yImbVm3gpSkqigaM%2B24lwU5u%2BIBbS9ARNZbbjHdVQiQk30FrnRoi3y5JUlW7Og%2BbI6i67uL4mIMwwVNZktP9J0Q5MZzI3uMc5G2ipoO%2FYC0EgEgYa%2Fo6px8VVtt7QLT94xPatpZJydH5hnKljIjVQlpUe%2FHB3IS%2B39VmNQxdf6GEbgjj9x8XrFxw8iiV8Jl8xL5Sx8LiojqVPT6Ta8J%2BUpreaaR1r1bB5TLdLuuiZsWah0eLx43Uf3tQLdlgs3DqF0ttlwH5C7xmY0jyQpXY%2BBIM3pFwWKdCqxvx3H8FbESn0SbGkfsyiJ%2FAsjh38NM%2B91KtVUL%2BP9SGqVt0cby%2BFjE8YOagdG3aQutBsVhiqTrFpT2QZG79P7dL1FDfxW7ySq0GQhqCfRnTphYppWVaR6zC3vsnXBjqkASSkqOisZcv55gHQMrndhDTF5G1E3MPTzz8dxAAKf2qgt%2FcMyDDKOuBERwth5mrJps%2BWpn6Wr2ho4wUkFeWKtnOqWaIsPc%2Be1bm3mzl5Qy6eoUyMkRkLafDKV0xgwrBhfQDmdJgw7RDtjJZhqrTY7tudfOgoHAK1QckuMPCVKT7so28exbwa2R6%2BgyW6kE9%2BcXzw07tg%2B2Wrw%2Fc%2FkrfcTEEnnN9%2B&X-Amz-Signature=8b6d4128c55452f77a7a8db9d30a3e795d83793fcda184f7cd7516765e81a99e&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB46624QXDL4M%2F20261110%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261110T005733Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEGgaCXVzLXdlc3QtMiJIMEYCIQCECelZV0V9lw6QJwxpy2aSY1w6yGD6FaheVdl4R0BymwIhAMTkns1utfedETaIcmunMPRVQPwNnAgA1fRf6ACEs2P0Kv8DCDEQABoMNjM3NDIzMTgzODA1IgyE%2FMOva3quIUwyu04q3AN5QAeou9dJT1sIm2x55U0zxOnnosyutF5LYa6ImYRw1lbVFe%2FzFIZ2q9shyrrNxdhdwMgb0r9uHbwV6%2Fc8Pd1aCmqRGwqHZC1G9J1V1uYwCYg7TadO1uWPU3oWUcPTqd%2BfLPMi9g1bAIrk7OfZtT7SCImWiNyvRM9%2FMLQruaqGIQEumobZIahfa1eHwKNk1a30Kbfix5oMI5J5GMQ03qBWsm1s72t28hEQeC4yImbVm3gpSkqigaM%2B24lwU5u%2BIBbS9ARNZbbjHdVQiQk30FrnRoi3y5JUlW7Og%2BbI6i67uL4mIMwwVNZktP9J0Q5MZzI3uMc5G2ipoO%2FYC0EgEgYa%2Fo6px8VVtt7QLT94xPatpZJydH5hnKljIjVQlpUe%2FHB3IS%2B39VmNQxdf6GEbgjj9x8XrFxw8iiV8Jl8xL5Sx8LiojqVPT6Ta8J%2BUpreaaR1r1bB5TLdLuuiZsWah0eLx43Uf3tQLdlgs3DqF0ttlwH5C7xmY0jyQpXY%2BBIM3pFwWKdCqxvx3H8FbESn0SbGkfsyiJ%2FAsjh38NM%2B91KtVUL%2BP9SGqVt0cby%2BFjE8YOagdG3aQutBsVhiqTrFpT2QZG79P7dL1FDfxW7ySq0GQhqCfRnTphYppWVaR6zC3vsnXBjqkASSkqOisZcv55gHQMrndhDTF5G1E3MPTzz8dxAAKf2qgt%2FcMyDDKOuBERwth5mrJps%2BWpn6Wr2ho4wUkFeWKtnOqWaIsPc%2Be1bm3mzl5Qy6eoUyMkRkLafDKV0xgwrBhfQDmdJgw7RDtjJZhqrTY7tudfOgoHAK1QckuMPCVKT7so28exbwa2R6%2BgyW6kE9%2BcXzw07tg%2B2Wrw%2Fc%2FkrfcTEEnnN9%2B&X-Amz-Signature=a34656f23b38eb3e9c4062476c4ec2a055a426e9fd015b3ddd069eeabd35268e&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

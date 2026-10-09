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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663AZJ3YKN%2F20261009%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261009T033443Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEGsaCXVzLXdlc3QtMiJHMEUCIHXD4ema6IizPRV%2FhvxJx82QW08LMP3o6G5eZuqHUpzXAiEArs%2BgmPazFmODSpMvvW7Vt1L6Apa4IKkHjoRVzXyHqI8q%2FwMINBAAGgw2Mzc0MjMxODM4MDUiDFMW0UqTvGh1iISo8CrcA0I%2B%2FxK8x9Wz7VlZhsG0WWyhNIFJ%2FSO%2Fv9AqjaOzNeIEmweVuDPkXaL5s8C3%2BXUs54T4yDp96UKUe5t1XS9HTJUBXx7T%2BIVkqtwwJ3bmOj3xF5ypC5Q9UISYJM7Z%2FICJtw7p9n%2FexojkwEvGPcoV%2B6Kwm46nAYSjU1PW3QjDtlmOWkMRc2UzJmAS5AmDGku4JMwzzBRUMtg5c7HnNW802v3SK%2BdU5wiGpTZr%2BruHTplUgXdY%2F6ipHfhWtOMNT0P2bS%2FFeD7e0JVOMiasgNPbvBHO0j4jrOmKt8IaVa6YwtxY3V89B%2FsAXm5%2FPuuGc65A2XXzceilGFIGX5YxuJ%2BSx9k36r0x0Hru9DiCCCRPt43revL9YJvb6i5oIBNsooBzEfsmbF1cwb5fBZ3zOZjpcivBAU662gg9uwj0GCQ%2FMVOiPqmQAGrjSLeRGQMBWep9K9CTYPo9plxgG%2BvZz0NAqNpZ1v3cFTF0Fb%2BfLvgqLTFXBtONkyR72NP%2BOxJ1TpTAvI74Hbaubu%2FWO4qY%2FI0COYY%2Fyw4kmGiApwvGEKw7EKbDLzfXPNBnzVeftpX2U2XVMuRE58PssfNjaQ%2BVSRqpS5g%2BO2k4U%2BkLWH0gsDH1O14Cqk3Aeawfz8h6Wc5gMJ%2B0odYGOqUBGynYv%2FUuBSgDTUCa5nRNTdmdH7S%2FG03Lb0dzbqVNoMaNAdO%2BDO5n01mqunY5szaqkreg6r2GsBZ12MapEVHcTh6VoJYeGN%2Fxbwcl85Ov0LYB%2FG88VdRqQpYNVNFcPJPu3U3GI4WF5fcGDZQvzuv9dErxtWK7W84IDD1vIdGziebQ%2By11%2BffvUmCq5Wff8TZ4nhL2HMv5fgy%2FXf6njFayzQJy0KFw&X-Amz-Signature=33feb35604283878185b88e257eddcf7670ef8a277df566fb0655fed4438ed1f&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663AZJ3YKN%2F20261009%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261009T033443Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEGsaCXVzLXdlc3QtMiJHMEUCIHXD4ema6IizPRV%2FhvxJx82QW08LMP3o6G5eZuqHUpzXAiEArs%2BgmPazFmODSpMvvW7Vt1L6Apa4IKkHjoRVzXyHqI8q%2FwMINBAAGgw2Mzc0MjMxODM4MDUiDFMW0UqTvGh1iISo8CrcA0I%2B%2FxK8x9Wz7VlZhsG0WWyhNIFJ%2FSO%2Fv9AqjaOzNeIEmweVuDPkXaL5s8C3%2BXUs54T4yDp96UKUe5t1XS9HTJUBXx7T%2BIVkqtwwJ3bmOj3xF5ypC5Q9UISYJM7Z%2FICJtw7p9n%2FexojkwEvGPcoV%2B6Kwm46nAYSjU1PW3QjDtlmOWkMRc2UzJmAS5AmDGku4JMwzzBRUMtg5c7HnNW802v3SK%2BdU5wiGpTZr%2BruHTplUgXdY%2F6ipHfhWtOMNT0P2bS%2FFeD7e0JVOMiasgNPbvBHO0j4jrOmKt8IaVa6YwtxY3V89B%2FsAXm5%2FPuuGc65A2XXzceilGFIGX5YxuJ%2BSx9k36r0x0Hru9DiCCCRPt43revL9YJvb6i5oIBNsooBzEfsmbF1cwb5fBZ3zOZjpcivBAU662gg9uwj0GCQ%2FMVOiPqmQAGrjSLeRGQMBWep9K9CTYPo9plxgG%2BvZz0NAqNpZ1v3cFTF0Fb%2BfLvgqLTFXBtONkyR72NP%2BOxJ1TpTAvI74Hbaubu%2FWO4qY%2FI0COYY%2Fyw4kmGiApwvGEKw7EKbDLzfXPNBnzVeftpX2U2XVMuRE58PssfNjaQ%2BVSRqpS5g%2BO2k4U%2BkLWH0gsDH1O14Cqk3Aeawfz8h6Wc5gMJ%2B0odYGOqUBGynYv%2FUuBSgDTUCa5nRNTdmdH7S%2FG03Lb0dzbqVNoMaNAdO%2BDO5n01mqunY5szaqkreg6r2GsBZ12MapEVHcTh6VoJYeGN%2Fxbwcl85Ov0LYB%2FG88VdRqQpYNVNFcPJPu3U3GI4WF5fcGDZQvzuv9dErxtWK7W84IDD1vIdGziebQ%2By11%2BffvUmCq5Wff8TZ4nhL2HMv5fgy%2FXf6njFayzQJy0KFw&X-Amz-Signature=ecf47d2096fb95cc9e339c3b2026bacb4a7e48b238b48ece6fa527dae719c64a&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663L42W42V%2F20260828%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260828T175135Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEIn%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIHjAuPvOujfNxKVfnfgU%2Fd0KcJVbPkcyfwhJqGXzIynlAiAshPrc88lmuheQBI76tXZDYlvcK4H88l0pHDuzVZ9TwSr%2FAwhREAAaDDYzNzQyMzE4MzgwNSIMbnHyTguavvJh8miNKtwD03coOhtCT2akcDektKOcbCqZNb5zAAbnkqgqzpRDDfoteVDpdw9pUuQpPdBeRsPIwiKsy6xQPTmBh5tk1fNd8rGGV6K72BVsaevPO%2BNJn7G2VUs0Me6nJ2ZAgDNOksMP%2BoOD5Tvii4uNPLCWuW%2BVGaDfN2Hj3P6HrF8ieQroke6%2FaIpY%2B7KhUHKQjT7RYrAo6hYD3CnuoNa5TGBx%2BM%2Brcth8fQtzN1STrsUhjU%2B30qagWQvDzoBs2%2BaOaKZzT34SclQ2xWNbSnmaR5MAVSGNS3w4GKg2kC8hQKcLA2VmvCE0sKPbBcsc3Ah5Mrya8Dz5ux2F3wkpFhGySvBbbYN1SlgXGtvy%2FyuQsdqG3jVETO9OfmlECV6%2BV4zAZohDnTCB88%2FiGQwXPmtbHt9FtKPyT73M3UV4ce3%2B%2BUJLen%2FWpBtCTQGiwowY7PPIYENcWNXJJGksT8AiTpJkT4LLMYZ3vHwTylFKhO5sdEVz3OVDisg2dXIWBYMeS9CfM2DglDBkFdmkfLd2ZgsHACh1phxiBzKSMDmhqeTaGw%2FQBd9ueM4Oc0BPPwxIiugpJnklKYSmb67MHcwXXWfUZ0659FmqVpnCVppExPvsqsKu1419lVDmmIk0bEtYu3V8UMQwlOvG1AY6pgFYmGSQt%2FRDvaTSWY%2FA3BEgG5q7ZHVk%2Fy5lWrOgOPDQ93j0rb6NiIecQCf7FOhkOncRUda30L8UAmX7t39VK3%2FWLp0jOGbpBcbatO7b%2BqTt0cR9ctW%2BpIPeOGSNP%2B6vEduJr5ZjsVUo20%2ByIn%2B2d0PVcC7iqot2X%2Br5mKRTwAaRlfD%2BKJuSSdS6Zxq7KwiC4iBcFZ0u0%2BH1aQpUgiG0bfi6AeJo8%2FXk&X-Amz-Signature=534c0cd9bb677f056e554756b874381aa17b811a55c1fcf2f662e0986dc54575&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663L42W42V%2F20260828%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260828T175135Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEIn%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIHjAuPvOujfNxKVfnfgU%2Fd0KcJVbPkcyfwhJqGXzIynlAiAshPrc88lmuheQBI76tXZDYlvcK4H88l0pHDuzVZ9TwSr%2FAwhREAAaDDYzNzQyMzE4MzgwNSIMbnHyTguavvJh8miNKtwD03coOhtCT2akcDektKOcbCqZNb5zAAbnkqgqzpRDDfoteVDpdw9pUuQpPdBeRsPIwiKsy6xQPTmBh5tk1fNd8rGGV6K72BVsaevPO%2BNJn7G2VUs0Me6nJ2ZAgDNOksMP%2BoOD5Tvii4uNPLCWuW%2BVGaDfN2Hj3P6HrF8ieQroke6%2FaIpY%2B7KhUHKQjT7RYrAo6hYD3CnuoNa5TGBx%2BM%2Brcth8fQtzN1STrsUhjU%2B30qagWQvDzoBs2%2BaOaKZzT34SclQ2xWNbSnmaR5MAVSGNS3w4GKg2kC8hQKcLA2VmvCE0sKPbBcsc3Ah5Mrya8Dz5ux2F3wkpFhGySvBbbYN1SlgXGtvy%2FyuQsdqG3jVETO9OfmlECV6%2BV4zAZohDnTCB88%2FiGQwXPmtbHt9FtKPyT73M3UV4ce3%2B%2BUJLen%2FWpBtCTQGiwowY7PPIYENcWNXJJGksT8AiTpJkT4LLMYZ3vHwTylFKhO5sdEVz3OVDisg2dXIWBYMeS9CfM2DglDBkFdmkfLd2ZgsHACh1phxiBzKSMDmhqeTaGw%2FQBd9ueM4Oc0BPPwxIiugpJnklKYSmb67MHcwXXWfUZ0659FmqVpnCVppExPvsqsKu1419lVDmmIk0bEtYu3V8UMQwlOvG1AY6pgFYmGSQt%2FRDvaTSWY%2FA3BEgG5q7ZHVk%2Fy5lWrOgOPDQ93j0rb6NiIecQCf7FOhkOncRUda30L8UAmX7t39VK3%2FWLp0jOGbpBcbatO7b%2BqTt0cR9ctW%2BpIPeOGSNP%2B6vEduJr5ZjsVUo20%2ByIn%2B2d0PVcC7iqot2X%2Br5mKRTwAaRlfD%2BKJuSSdS6Zxq7KwiC4iBcFZ0u0%2BH1aQpUgiG0bfi6AeJo8%2FXk&X-Amz-Signature=d7aa11ce03b48c16e67994a74c2fa5a0c81ffd67c6600aa9eee18cc403df310a&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

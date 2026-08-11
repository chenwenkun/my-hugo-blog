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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466TLM6NPKC%2F20260811%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260811T005427Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEOH%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQD16dWjnuJS6dmrWX65AaSktpETtjSxR9N3i2jcaH3nKgIgW5oB8FxrhCQAQaDdTmKZ%2F8w6STmuU7E1VeWzeALme28qiAQIqv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDCMIUcttjTMcDAETrCrcA9Z9RyiGirnACAofHQuTfCD5VshGjVUQQEQvbXWffzGOroPO5SgVX4NlGfeU9Ig4qSp5dzD9wNWAOn%2BGazAuxe7yevCPB8MaK5FToaEo6HOX5zRKi8YE1Zo%2BtRaacdZOgOiiD4GzXGgN5RQEs1uKHwpDu9EY0R4goSDyA4d%2FJqDJTI8lBeg2eIIggOm6DUS5JX8fs4vgsEeIGSflGRsIh%2FAf9IK8Kg7zXWcQOgJo72esOJEYcsr3GYbBEC3V3SI8AO7lTUcsMbGLW3RuXQ27jwQ2zaAoieKf32q5%2Bm6IHGIcQbbdHx73sNYuTh8MOP6hATnsZ5zC4gD%2Fk408noHny6rtYAt79c15kVGRrEL9xXsKBxf062ggysAC9MTy%2Bvz2jIDUJ5ISRhOlh4%2FB8OM%2Fs%2BJZE3ZFNIG26fPQs3JytaOOBPh38ZRdXuyxu7QXOPWgSepbg8hVApIgzo%2B7ZXzkqw61RIeHMKUitjSAeVqhWJzwcFef%2B113hc8T8od1y6Us%2FkYlG4vs1DBf%2FHmePhrHCVGccSsEXBJlP9AnYNXZbcDITQnWdKEShgdAV%2Fyv5BAO4nwCoC5FeMU6NGpanNWQjVa9B1jR0TEwJpach%2B9y3m2%2BVFurbYVOV1e%2BW6SRML7a6dMGOqUB3pTC9qwdnp8YnSGX33mgB0ZkQvh95rMSqXo1azwtPdSGVjfs5E7XeA5%2F4oLDksf2VnOuFOTTjIEaREKACkCcGfZ6H8AClR%2F1W3gN0k7ia1uLgZWWj32Q3dDJL5yGXunJKdzpsk4%2FTxIRV4JB%2FY8h5ox2Mu8SBrednl3ou8MEoX%2FxBD6CqKQO0mC9jN4fa%2F99Es9cljnNdvs402tBv5Gz3cYzR216&X-Amz-Signature=b64f92feed8e001728b4c7a3b2ded1825bc20e72694e8941aa68adc78d3df65c&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466TLM6NPKC%2F20260811%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260811T005427Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEOH%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQD16dWjnuJS6dmrWX65AaSktpETtjSxR9N3i2jcaH3nKgIgW5oB8FxrhCQAQaDdTmKZ%2F8w6STmuU7E1VeWzeALme28qiAQIqv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDCMIUcttjTMcDAETrCrcA9Z9RyiGirnACAofHQuTfCD5VshGjVUQQEQvbXWffzGOroPO5SgVX4NlGfeU9Ig4qSp5dzD9wNWAOn%2BGazAuxe7yevCPB8MaK5FToaEo6HOX5zRKi8YE1Zo%2BtRaacdZOgOiiD4GzXGgN5RQEs1uKHwpDu9EY0R4goSDyA4d%2FJqDJTI8lBeg2eIIggOm6DUS5JX8fs4vgsEeIGSflGRsIh%2FAf9IK8Kg7zXWcQOgJo72esOJEYcsr3GYbBEC3V3SI8AO7lTUcsMbGLW3RuXQ27jwQ2zaAoieKf32q5%2Bm6IHGIcQbbdHx73sNYuTh8MOP6hATnsZ5zC4gD%2Fk408noHny6rtYAt79c15kVGRrEL9xXsKBxf062ggysAC9MTy%2Bvz2jIDUJ5ISRhOlh4%2FB8OM%2Fs%2BJZE3ZFNIG26fPQs3JytaOOBPh38ZRdXuyxu7QXOPWgSepbg8hVApIgzo%2B7ZXzkqw61RIeHMKUitjSAeVqhWJzwcFef%2B113hc8T8od1y6Us%2FkYlG4vs1DBf%2FHmePhrHCVGccSsEXBJlP9AnYNXZbcDITQnWdKEShgdAV%2Fyv5BAO4nwCoC5FeMU6NGpanNWQjVa9B1jR0TEwJpach%2B9y3m2%2BVFurbYVOV1e%2BW6SRML7a6dMGOqUB3pTC9qwdnp8YnSGX33mgB0ZkQvh95rMSqXo1azwtPdSGVjfs5E7XeA5%2F4oLDksf2VnOuFOTTjIEaREKACkCcGfZ6H8AClR%2F1W3gN0k7ia1uLgZWWj32Q3dDJL5yGXunJKdzpsk4%2FTxIRV4JB%2FY8h5ox2Mu8SBrednl3ou8MEoX%2FxBD6CqKQO0mC9jN4fa%2F99Es9cljnNdvs402tBv5Gz3cYzR216&X-Amz-Signature=501d414042111cceb3888b8279054816a5389541134870c8eb982369ffee6cea&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

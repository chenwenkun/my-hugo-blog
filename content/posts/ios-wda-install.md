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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4664JUA4GUD%2F20260923%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260923T022010Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEOX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQDUXch9sHLJa%2B6ZEB2M%2F5d1uGkm7qF%2B3vBhwJmAnsg9OAIhAMYTBuAUpvyLPL%2Bom9t3qzw2jvYDjPGP4uEWsDyx18kZKogECK7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgxIcXuySrLHkrT4e8oq3APjN%2FpvmGu3SCaRsd54d4fsPV5LpqmSnEt6L%2BsT2Mx6OhMw48qsi9y%2BS1s5VVuSPl81yTOCfMeNnAzxqiSVUsuxK44Y55w5zJOVkscMRIu1OcuH%2B%2BPVwc5mwTwcMXo%2BHbPwZYoRh5%2FBOg%2FZJ86DYL6aABBoPZEpqMdI%2F32mEJ4Xl7uSb9kLX0Z4467YyDgQ5ap5pN0UvJlBgmGVsMdKUTtTgX0AfnFSWS7CUgP8QwzP%2BfbiWJVNXASNz6H0mrrcLUM21JWy8%2BS46d7rvfexp1D16R%2Fx66I81rlqlUYzDxpN3E43thSg4qM2k8We5oltGsOOPXnzXiMAERTDvb3hk%2FRq0bf3I018Mayy7E8EVZyygQTyoyeUOkMPLtCPxp7KE7nGVgJksx%2B8q26z0yVDTxe6d%2FJnKWZpzH153xpXwNe3q8l7dM1I2OzzxROjCn1g8ST8rcdETEnZJGX1VoUYCTY1evecEkt%2FYFBKctD%2FD4JmBTXfrUcS7SCCRmCc8%2FWkyxQwNPT4Qejt%2BXuUFcqQhlDzBT5pqZpq0MNEUv5tPzT10yzMHQ%2BDvZoXf7vg3jcVECdBdvx7JskNe%2FJkni6kIPhU5DpcO0nP0ISpy6mSnFzHuhkepWN0%2B4CbokhhrzCT1svVBjqkASriCPf%2Fuy7CdbyBrUhN65bV%2BAqTNFAKMv4AWoNz%2BJTpOAus8RZM7e%2FwgmTKyLID5UVlv6SBtENH5lFBYzkkTpAbK2EicCP0seydvvHbpzrxC0%2BYzzlZACuG5aAIC1bhSffPWmcCL%2FLZXmJh1xnUgnLSD8rKVovwOKV9XXLsr8toEPUqD7vz7PI7k7Zye0NjoFy9yEiSpGvTCAWTNmp3t%2BIadWVg&X-Amz-Signature=7d153febcdad519a483b1b77db4d46a2c76115c44f943dd28036d6bc206ab7da&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4664JUA4GUD%2F20260923%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260923T022010Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEOX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQDUXch9sHLJa%2B6ZEB2M%2F5d1uGkm7qF%2B3vBhwJmAnsg9OAIhAMYTBuAUpvyLPL%2Bom9t3qzw2jvYDjPGP4uEWsDyx18kZKogECK7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgxIcXuySrLHkrT4e8oq3APjN%2FpvmGu3SCaRsd54d4fsPV5LpqmSnEt6L%2BsT2Mx6OhMw48qsi9y%2BS1s5VVuSPl81yTOCfMeNnAzxqiSVUsuxK44Y55w5zJOVkscMRIu1OcuH%2B%2BPVwc5mwTwcMXo%2BHbPwZYoRh5%2FBOg%2FZJ86DYL6aABBoPZEpqMdI%2F32mEJ4Xl7uSb9kLX0Z4467YyDgQ5ap5pN0UvJlBgmGVsMdKUTtTgX0AfnFSWS7CUgP8QwzP%2BfbiWJVNXASNz6H0mrrcLUM21JWy8%2BS46d7rvfexp1D16R%2Fx66I81rlqlUYzDxpN3E43thSg4qM2k8We5oltGsOOPXnzXiMAERTDvb3hk%2FRq0bf3I018Mayy7E8EVZyygQTyoyeUOkMPLtCPxp7KE7nGVgJksx%2B8q26z0yVDTxe6d%2FJnKWZpzH153xpXwNe3q8l7dM1I2OzzxROjCn1g8ST8rcdETEnZJGX1VoUYCTY1evecEkt%2FYFBKctD%2FD4JmBTXfrUcS7SCCRmCc8%2FWkyxQwNPT4Qejt%2BXuUFcqQhlDzBT5pqZpq0MNEUv5tPzT10yzMHQ%2BDvZoXf7vg3jcVECdBdvx7JskNe%2FJkni6kIPhU5DpcO0nP0ISpy6mSnFzHuhkepWN0%2B4CbokhhrzCT1svVBjqkASriCPf%2Fuy7CdbyBrUhN65bV%2BAqTNFAKMv4AWoNz%2BJTpOAus8RZM7e%2FwgmTKyLID5UVlv6SBtENH5lFBYzkkTpAbK2EicCP0seydvvHbpzrxC0%2BYzzlZACuG5aAIC1bhSffPWmcCL%2FLZXmJh1xnUgnLSD8rKVovwOKV9XXLsr8toEPUqD7vz7PI7k7Zye0NjoFy9yEiSpGvTCAWTNmp3t%2BIadWVg&X-Amz-Signature=a91177f7d9240e51f8a207bab572d472a85b12ade6eb1f0603980887e4ae8de7&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

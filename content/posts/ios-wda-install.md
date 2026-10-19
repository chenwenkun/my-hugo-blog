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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4664P34MOLY%2F20261019%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261019T113015Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEGIaCXVzLXdlc3QtMiJGMEQCICi4m2KQT8jTsZeW5WlYkNoT1baVHPMZjlvb0pExaBuSAiB29sj82YnbucZ1wE%2FOEfe5y4YaGENaf94j7MGzxjWl%2BSr%2FAwgrEAAaDDYzNzQyMzE4MzgwNSIM9Z57KzBnTSrg2KLWKtwD%2FjiTM%2FWxsuv%2Fy1k2zyYYZBWgZZ3Ki6u3hmXFZjknTsXTS4FJs79OMRkGAIa0XCovMi4CxOVgqNGCmDGQlSBur70J1cDfo9KgnnC2gK5tWoMTR9gSA%2FtcsKr2HKjZfC9lvzoEqMYFu4cbC%2FM%2F3x28dLzGti8phbbm7AtcPbwTUHi7P4P5yMgO32jxkBlZiaOmK6NIaM5huYrM7zLVqdwiC%2FTsWxrbC8H%2FGq5ABgpcmWG2uxv%2FPGofnv1Dm92H%2BuonfD3hfcuefTM%2FSo3%2B7jeIKHfyghIJnS6zmzr77E5XuP%2F%2B7wvtpoX8%2FpnUTNx7YsUtnqdhlchSq3i6woHniLPM%2FyArSBE7mYcSEMVR5V6Q9Sgnic0vsaDA18bw9pcZ866dnswnR3jjhbzLfRBTujwqpTwPxBSiRNjjC2BnIQS8m1Xs4QkEd8GnyJTPf7AzEwQkDjbLZ65UjvSytUV1AnCE1BjDiwgdyKmnqEYeg2CtiO5Oe4nWsg%2F5ttQt1vznMr7Oi%2FftHqg9jgJiWzES90GdNIZstec3jUhrvkjXahr%2Bg8C5wwHxY%2Ff3llMCm5K%2Bn4uCgVQ0u7WX7PL2IzLtPg71UXwIrzbqD3ghQA6flsyqvtbjkNA9I12Qv%2FKzX5kwqMnX1gY6pgFbYGQ9MhOivtNcknlguW2i5D7MCf9SDnUfwZPFO%2B1fOGNSKReuqgz1ZVUyhL0fw5%2FrxduAGeVxy5YDeRwbvS0vNgbYfjO2n73zkgFOqYwvmLUWCIKUbhWLoEwtk37GgXoft3ewi5s7cykH9tiedUS%2Fx1D2l0yu%2FrERjqeM0r04MbY1ycuplgPwApc03c0tbTH0N7NnwgwizydMLwFQqZwGimOxpfvR&X-Amz-Signature=306394b2ab689c912783cc452bf21548f95c8110efc877265baa425f761ea995&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4664P34MOLY%2F20261019%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261019T113015Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEGIaCXVzLXdlc3QtMiJGMEQCICi4m2KQT8jTsZeW5WlYkNoT1baVHPMZjlvb0pExaBuSAiB29sj82YnbucZ1wE%2FOEfe5y4YaGENaf94j7MGzxjWl%2BSr%2FAwgrEAAaDDYzNzQyMzE4MzgwNSIM9Z57KzBnTSrg2KLWKtwD%2FjiTM%2FWxsuv%2Fy1k2zyYYZBWgZZ3Ki6u3hmXFZjknTsXTS4FJs79OMRkGAIa0XCovMi4CxOVgqNGCmDGQlSBur70J1cDfo9KgnnC2gK5tWoMTR9gSA%2FtcsKr2HKjZfC9lvzoEqMYFu4cbC%2FM%2F3x28dLzGti8phbbm7AtcPbwTUHi7P4P5yMgO32jxkBlZiaOmK6NIaM5huYrM7zLVqdwiC%2FTsWxrbC8H%2FGq5ABgpcmWG2uxv%2FPGofnv1Dm92H%2BuonfD3hfcuefTM%2FSo3%2B7jeIKHfyghIJnS6zmzr77E5XuP%2F%2B7wvtpoX8%2FpnUTNx7YsUtnqdhlchSq3i6woHniLPM%2FyArSBE7mYcSEMVR5V6Q9Sgnic0vsaDA18bw9pcZ866dnswnR3jjhbzLfRBTujwqpTwPxBSiRNjjC2BnIQS8m1Xs4QkEd8GnyJTPf7AzEwQkDjbLZ65UjvSytUV1AnCE1BjDiwgdyKmnqEYeg2CtiO5Oe4nWsg%2F5ttQt1vznMr7Oi%2FftHqg9jgJiWzES90GdNIZstec3jUhrvkjXahr%2Bg8C5wwHxY%2Ff3llMCm5K%2Bn4uCgVQ0u7WX7PL2IzLtPg71UXwIrzbqD3ghQA6flsyqvtbjkNA9I12Qv%2FKzX5kwqMnX1gY6pgFbYGQ9MhOivtNcknlguW2i5D7MCf9SDnUfwZPFO%2B1fOGNSKReuqgz1ZVUyhL0fw5%2FrxduAGeVxy5YDeRwbvS0vNgbYfjO2n73zkgFOqYwvmLUWCIKUbhWLoEwtk37GgXoft3ewi5s7cykH9tiedUS%2Fx1D2l0yu%2FrERjqeM0r04MbY1ycuplgPwApc03c0tbTH0N7NnwgwizydMLwFQqZwGimOxpfvR&X-Amz-Signature=6f82354508e60e1ae4c4d18d5c4b999cc6c5180c7054370ca3805014356e045e&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

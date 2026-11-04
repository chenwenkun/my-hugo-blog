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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466TZSNZWUU%2F20261104%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261104T035016Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjENz%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIEIrVDVVsm3MDiyqKXg180w14%2FU8noeoD%2FzrlfXmjv3cAiEAtNcGDz7nKuuuOdiXflXizdxXK1HDJLqaArsCiZi8dHUqiAQIpP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDMn8slQcAYY6nieGPircA4PRaWNNpgOMAXsABQbHdsAmA1DH5DXQIbtGIZXagDeY9g3NkdVSzFO3WlAkMXJqWB1UR0DnBqyiBb8zYpxbLsLW%2FJ198%2B0c2gEr5%2BBBu00MhupiqTSqKzVddsEex22zo1ryTtVy1CYstcSZ9zksj7SH7c23wtzpoEXvxM3Cc7pX3PXfrr79TfYuWwf8HWGDUQ4bltQuPQ%2FL2HKSjeUb%2FguKwdWrz29gg6qx3bWo8WrAW2KR%2FV9ZvBPCbJqgzyxM9BmfERcqxZlMg9VMF7xbiDA3ZEkoS3wPfJYhw9PyHO1ejf4y%2BbeC%2FayN0zTaRdXI4nY%2FrhqGS4Hz8c15e6ljySsHz7T0kIRMimq%2BcNUukOF22w5frYZPoap%2BCShyRJxlaehiN6CK9BVv3zh%2FGpjufzfQJ3QUEYEliNBtyvR4yh7NS68Oz1B9EBjTgkwg26bhgHe2XQLVbbcpqukJeNIGpu3ii0OVC%2BQqNX1c4k7BAXelfNyd%2FW0G6coBU%2B2L9oxYjsLctp42pbZjizmbNn%2BCmGMcvh3T6ilRS%2Fbiqq%2BuEiqSoxGpNC7quTJuy%2B2aoS9IGwFahH3oi71%2BPNvGGop%2FhjNq149SSmWjzXdLAtF%2Bb6h10kD%2B9XYt2dwBRuJNMKTMqtcGOqUBajcHH%2BJ1%2BnoTjuNSS%2BfOXA0orLhWSXSPj3ZqcJIuMGL3BF1y8PGdGYeNO%2BHW03KtcceOy9hA3R5cCWBYIsVsBnNF21YP0lF7n2LHGGCeY2AKZT9WasVD6ym21Kpux0kQhdPv0WCHhnJNgRstpCQEj4hSYyf1goGv2PEvAIVrWJes8BgkvLMLnMh0103zEoaI0%2F32J87GXIX2PECdS7hYmpuCKCX2&X-Amz-Signature=19cb26dda728f13bf822f47ddd5a91fab855df78fb0fed0e77340f5a0d93f77f&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466TZSNZWUU%2F20261104%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261104T035016Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjENz%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIEIrVDVVsm3MDiyqKXg180w14%2FU8noeoD%2FzrlfXmjv3cAiEAtNcGDz7nKuuuOdiXflXizdxXK1HDJLqaArsCiZi8dHUqiAQIpP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDMn8slQcAYY6nieGPircA4PRaWNNpgOMAXsABQbHdsAmA1DH5DXQIbtGIZXagDeY9g3NkdVSzFO3WlAkMXJqWB1UR0DnBqyiBb8zYpxbLsLW%2FJ198%2B0c2gEr5%2BBBu00MhupiqTSqKzVddsEex22zo1ryTtVy1CYstcSZ9zksj7SH7c23wtzpoEXvxM3Cc7pX3PXfrr79TfYuWwf8HWGDUQ4bltQuPQ%2FL2HKSjeUb%2FguKwdWrz29gg6qx3bWo8WrAW2KR%2FV9ZvBPCbJqgzyxM9BmfERcqxZlMg9VMF7xbiDA3ZEkoS3wPfJYhw9PyHO1ejf4y%2BbeC%2FayN0zTaRdXI4nY%2FrhqGS4Hz8c15e6ljySsHz7T0kIRMimq%2BcNUukOF22w5frYZPoap%2BCShyRJxlaehiN6CK9BVv3zh%2FGpjufzfQJ3QUEYEliNBtyvR4yh7NS68Oz1B9EBjTgkwg26bhgHe2XQLVbbcpqukJeNIGpu3ii0OVC%2BQqNX1c4k7BAXelfNyd%2FW0G6coBU%2B2L9oxYjsLctp42pbZjizmbNn%2BCmGMcvh3T6ilRS%2Fbiqq%2BuEiqSoxGpNC7quTJuy%2B2aoS9IGwFahH3oi71%2BPNvGGop%2FhjNq149SSmWjzXdLAtF%2Bb6h10kD%2B9XYt2dwBRuJNMKTMqtcGOqUBajcHH%2BJ1%2BnoTjuNSS%2BfOXA0orLhWSXSPj3ZqcJIuMGL3BF1y8PGdGYeNO%2BHW03KtcceOy9hA3R5cCWBYIsVsBnNF21YP0lF7n2LHGGCeY2AKZT9WasVD6ym21Kpux0kQhdPv0WCHhnJNgRstpCQEj4hSYyf1goGv2PEvAIVrWJes8BgkvLMLnMh0103zEoaI0%2F32J87GXIX2PECdS7hYmpuCKCX2&X-Amz-Signature=352117cf22820421c82a4518ebfedd6339619fac4271e1316924ded19ecff5ec&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

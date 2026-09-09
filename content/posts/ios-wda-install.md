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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466ZMD4ZXFJ%2F20260909%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260909T020322Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJr%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQCljkzN9WqCyEns6dYnKft%2FjjgmVLVc%2BJ3Fsv1yEBNo2wIgboosQRJn56sPUSd4QhvTcfE8vq%2Buq8eMJofpeKe4%2B4sq%2FwMIYxAAGgw2Mzc0MjMxODM4MDUiDH02a8BiPCTvwgrwmCrcA%2B7qDvBUyn5G1x59RNpWa9U%2Bu7p5K9Nt16r%2F4BjwS8A%2BulwRQk4wFADes9Nwfsk4YxgpiJqwXp1sh4fl%2BhgGSE%2FE2R7HzxMvnqZQrquPSfaTpgb%2F%2BIE2oOiAfbGe9oicbpe2RaxPqSn%2FqJLGAHNb1R%2Fn276GZmaUkib%2BWFsTO3gwqkUXeUrKxhaKJOv5Eds4NKid%2BHGe8%2BZn1DvPwK%2BUB4%2FISwy1E3wglX1MNbExZc9xE8iRn6Cqyrpou4MMuGW3smUjQyd6ttQn28shENAn4aRN4uQrPBw7L4Pq05M6NR5ra63pwDteL7%2BQWlVysHhMXM9y4MbYpzH5UydIjfzPqf%2B1vTg%2FzQ%2BDmp87JIqQZcH%2BmGm4%2Fu1XIuCte%2BRe8PUiYa7o16sVlzdB%2FUqN%2B8TVfA2CBp32tTDWIvZQGYZURl%2BqNumZVZ69ZAFqFr8%2Byd688tHlOVU%2BRxoMDob8JUcXnLuQsNmKwudUoCrPpEAFonp6HMP85iCkyTm%2Bqlo0gA4z9hnjB8jNpBHPR7mdxQbYzVFn1TKt3haRJMXwalFMcay89PR2X1U51NSm9wv%2Fh%2B%2F93ABVs5ybB2SCJoJkjIjtilERdJImsL4be1Og7RSr1xrOP%2BnYbwmAN9oLbWy1MPb3gtUGOqUBdS6cXKxq8hkVWJtiPsIfv1jmA6qcI32o1mDY2qajNO94y5oZr3n5EuFbNoBp3tdVTp1JgQs69XSq60tlzgoc6PtMTPwOifOGjdRSPArVixm86ePGT4Z14%2B1%2B0N0RxLcrt0KfPkJy%2FOjNDIGuFCMZvwdMHLcpglBZn435GSkO4%2BQL56WZhHNwdKAXZmN0VTHYmhLbQ1u%2B8spK6hTHfzp0kR%2FAf3hn&X-Amz-Signature=eeeb6a9906624da6f94be4480fd828eb1d4563bb2512d137dc0da849f7fd03b6&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466ZMD4ZXFJ%2F20260909%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260909T020322Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJr%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQCljkzN9WqCyEns6dYnKft%2FjjgmVLVc%2BJ3Fsv1yEBNo2wIgboosQRJn56sPUSd4QhvTcfE8vq%2Buq8eMJofpeKe4%2B4sq%2FwMIYxAAGgw2Mzc0MjMxODM4MDUiDH02a8BiPCTvwgrwmCrcA%2B7qDvBUyn5G1x59RNpWa9U%2Bu7p5K9Nt16r%2F4BjwS8A%2BulwRQk4wFADes9Nwfsk4YxgpiJqwXp1sh4fl%2BhgGSE%2FE2R7HzxMvnqZQrquPSfaTpgb%2F%2BIE2oOiAfbGe9oicbpe2RaxPqSn%2FqJLGAHNb1R%2Fn276GZmaUkib%2BWFsTO3gwqkUXeUrKxhaKJOv5Eds4NKid%2BHGe8%2BZn1DvPwK%2BUB4%2FISwy1E3wglX1MNbExZc9xE8iRn6Cqyrpou4MMuGW3smUjQyd6ttQn28shENAn4aRN4uQrPBw7L4Pq05M6NR5ra63pwDteL7%2BQWlVysHhMXM9y4MbYpzH5UydIjfzPqf%2B1vTg%2FzQ%2BDmp87JIqQZcH%2BmGm4%2Fu1XIuCte%2BRe8PUiYa7o16sVlzdB%2FUqN%2B8TVfA2CBp32tTDWIvZQGYZURl%2BqNumZVZ69ZAFqFr8%2Byd688tHlOVU%2BRxoMDob8JUcXnLuQsNmKwudUoCrPpEAFonp6HMP85iCkyTm%2Bqlo0gA4z9hnjB8jNpBHPR7mdxQbYzVFn1TKt3haRJMXwalFMcay89PR2X1U51NSm9wv%2Fh%2B%2F93ABVs5ybB2SCJoJkjIjtilERdJImsL4be1Og7RSr1xrOP%2BnYbwmAN9oLbWy1MPb3gtUGOqUBdS6cXKxq8hkVWJtiPsIfv1jmA6qcI32o1mDY2qajNO94y5oZr3n5EuFbNoBp3tdVTp1JgQs69XSq60tlzgoc6PtMTPwOifOGjdRSPArVixm86ePGT4Z14%2B1%2B0N0RxLcrt0KfPkJy%2FOjNDIGuFCMZvwdMHLcpglBZn435GSkO4%2BQL56WZhHNwdKAXZmN0VTHYmhLbQ1u%2B8spK6hTHfzp0kR%2FAf3hn&X-Amz-Signature=d3b2e89bd94b061bc4d2bdce1364d44ff1eea0dfd19734ab6ad3bc10a023d434&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

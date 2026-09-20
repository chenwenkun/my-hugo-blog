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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB46636EWHNYF%2F20260920%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260920T150333Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEK%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIGbdemE0P3MI3U2N9fIdDjcFVoLlTL2rhqDh0zh2ptlwAiEAtfsjmRAuZg%2BAjPS9Y3y4PeuL36nVbTsj0o8KXABEAt0q%2FwMIeBAAGgw2Mzc0MjMxODM4MDUiDBl00TSpUOM%2Fyc1vpSrcA3cSRp2ZoBwV00LbfQ0uLEEhhPMEq%2B4o9eBEWV4Pu7dqgITH5uTCj2JmD4zfGV3NFzhxESfBfmU33pdIHMroENCMtLj%2FX1Uq5q8xmh9%2BYuWqINPlxHQryEMtw41QfqwAh8z2OkiAoP%2FgOKJI9dHC03BDaPvDsfYg%2FL6LnEeLuBT8icSSz9UGPIJJBcS23hs23k5gqLCLougbfWZ1l3QEZJkC%2BtNKAKqHxy%2FHalhqEYNPosKTeDpQ3h5nLYzBdRmIDNPJmAvjT8ybVe5mSq%2FvmrLjYVIiHclVgmz2lOouNUyuiakHZuZm43Z9R9rPxKTLWTF5IHb9H%2BQmg8b3OxygPxSBbky9G71VNAh%2BXfQ1txtElI98MODPqL9LAyiLgXy5WISwPOhRIJBh1kITBqSPXNUZ4uNl%2F8FHlmSj4HT818VOo9zGr0TLhGGQ4uHgxK8tV54wXPi%2F8IOQ%2FWvpaOUyc5%2BMZAxpax0PqImPqAb6tnQHiVlVmDA3infHWU4Ad48SFNmK3kg5eM4i670aicM9ViVnt8PKl35DcHLtjfoFW3dCRV1dfoxLTL8e2%2FmXJ3UxGvvDnCUujHNfItraWMFoR8Ac22Ptfhw%2F0WMzfT94ekHicF3aSP1kKOo4A780MMHnv9UGOqUB5ECGN3LKHcUVWmEm7A%2BmNBCI%2B%2BEULVaekowLiFkXUFEtvwwlMGxe1iDxeOt%2F5h0NhJY%2BkcnOPtAipLn24SOvBWSIWu3TMB0pHSXOO9L03p2C4MbGlViHm3ll5bUpQRNdHcgeZbDmZ7e2jkCEecCjUP9vIGgsYa0ok2SKKb8pvvbR%2Bu1uOpHIN1%2FoIyOKQ6GbZBg8gSUk7hVhcW%2FMg%2Bs7d0ihpER9&X-Amz-Signature=f61925acb59e9250852962a0fc58d305c653abe0b809277edc8875d7a4906a52&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB46636EWHNYF%2F20260920%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260920T150333Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEK%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIGbdemE0P3MI3U2N9fIdDjcFVoLlTL2rhqDh0zh2ptlwAiEAtfsjmRAuZg%2BAjPS9Y3y4PeuL36nVbTsj0o8KXABEAt0q%2FwMIeBAAGgw2Mzc0MjMxODM4MDUiDBl00TSpUOM%2Fyc1vpSrcA3cSRp2ZoBwV00LbfQ0uLEEhhPMEq%2B4o9eBEWV4Pu7dqgITH5uTCj2JmD4zfGV3NFzhxESfBfmU33pdIHMroENCMtLj%2FX1Uq5q8xmh9%2BYuWqINPlxHQryEMtw41QfqwAh8z2OkiAoP%2FgOKJI9dHC03BDaPvDsfYg%2FL6LnEeLuBT8icSSz9UGPIJJBcS23hs23k5gqLCLougbfWZ1l3QEZJkC%2BtNKAKqHxy%2FHalhqEYNPosKTeDpQ3h5nLYzBdRmIDNPJmAvjT8ybVe5mSq%2FvmrLjYVIiHclVgmz2lOouNUyuiakHZuZm43Z9R9rPxKTLWTF5IHb9H%2BQmg8b3OxygPxSBbky9G71VNAh%2BXfQ1txtElI98MODPqL9LAyiLgXy5WISwPOhRIJBh1kITBqSPXNUZ4uNl%2F8FHlmSj4HT818VOo9zGr0TLhGGQ4uHgxK8tV54wXPi%2F8IOQ%2FWvpaOUyc5%2BMZAxpax0PqImPqAb6tnQHiVlVmDA3infHWU4Ad48SFNmK3kg5eM4i670aicM9ViVnt8PKl35DcHLtjfoFW3dCRV1dfoxLTL8e2%2FmXJ3UxGvvDnCUujHNfItraWMFoR8Ac22Ptfhw%2F0WMzfT94ekHicF3aSP1kKOo4A780MMHnv9UGOqUB5ECGN3LKHcUVWmEm7A%2BmNBCI%2B%2BEULVaekowLiFkXUFEtvwwlMGxe1iDxeOt%2F5h0NhJY%2BkcnOPtAipLn24SOvBWSIWu3TMB0pHSXOO9L03p2C4MbGlViHm3ll5bUpQRNdHcgeZbDmZ7e2jkCEecCjUP9vIGgsYa0ok2SKKb8pvvbR%2Bu1uOpHIN1%2FoIyOKQ6GbZBg8gSUk7hVhcW%2FMg%2Bs7d0ihpER9&X-Amz-Signature=d7e0d3bfeee62b93870e5054a5f63e960813babb6802312491c34d843017087e&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

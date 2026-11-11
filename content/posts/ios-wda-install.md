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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466ZI2SLPSF%2F20261111%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261111T130915Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEIz%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIHFYKbvdBa0jzEN6Sf9P8V5xROSOufWvT256236B5KxhAiAXxZSwuqIb6Xm3fCrDOuESGwilwHSl7k9Lc6lzJn7gNSr%2FAwhUEAAaDDYzNzQyMzE4MzgwNSIMUXta2l1ytLhECMI0KtwDQvAeuyNZKz18tRhgXOCghwBAGCYy9%2Fl%2Boeer9E1fSltBFp3IS3zajQxISmnrfqUFvAIIWudSEHVeR2SSD1fWuQwsWIYd6leVj08ayl1iB%2FNcdBqGrh39dy3B509Ts9EV3fmZ8yjYicQE8CusLPdCVCPSYSRuh4eFgLKOD5pXwXZBfWHgcm3yuTPw6UlXKgx0QXblKPUxhkJCFQo0doXCgF2xq6yTz1e1IKHC3gBmr6c7yPr%2F3SgTjPZDCl%2BdPM12gdDN3Ipgu5Uq5zhwaSpLQaka9KVQ3B3T%2FocmGFgFIhGz3rOUSDXWN8K2FMTxoYhgcvkGRJUUgJSARJCFvkb2lKCG7%2FHMolpWLS4tHGINewtQhj4w%2FhXNjfoPJnyJRA%2BIwgWD4PsFlOWrHd5EyMbkyYsRqBS0ce7F8Xcec9JkXRxbps9%2F6%2B%2FCM%2BSs9uQUzUtoUv56yXCB5LTmHRAcPzwT6R17Y%2B8up5bISySEFdLNM9CG5IF%2B6AD3TDJ3BiieUUzZi5x1xCxalkzAbiv7dePGMDHPC6FLEjwqXuJOpNYp2Bh%2BRKUp5N%2Fd2abX69ZDoDKRYDPYtZWPi%2F3gpnpK%2BL7T7MMd71TxYLi0I0zhVq25eEI6%2F3m79vFOXkRUqUww3ajR1wY6pgFgGgVA1pl563H7lFpOVk%2BjUEGW%2F0kgdsM%2BLVSdvQOE5yxZsWAHe0YFM2c7%2BTWkgwQrLGwVrwvYcFFQLZhw5IBr9qjDXSHAu%2FRPv5XMwukAzvGl5x%2FgYBsuv1%2BGZNs0wOKGyOh2baPRLXHNpbzqdKvQopEjuIWRzQB1GOf9dHDQF1cRQdyF9LPLjF9aH4VnnRAZdGaS6xOtfsnLbjT8GRTIpV5wdixU&X-Amz-Signature=dfffce7d7ab2c23f4a38e2f13158c0317001024640c98a220661138c4882fef0&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466ZI2SLPSF%2F20261111%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261111T130916Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEIz%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIHFYKbvdBa0jzEN6Sf9P8V5xROSOufWvT256236B5KxhAiAXxZSwuqIb6Xm3fCrDOuESGwilwHSl7k9Lc6lzJn7gNSr%2FAwhUEAAaDDYzNzQyMzE4MzgwNSIMUXta2l1ytLhECMI0KtwDQvAeuyNZKz18tRhgXOCghwBAGCYy9%2Fl%2Boeer9E1fSltBFp3IS3zajQxISmnrfqUFvAIIWudSEHVeR2SSD1fWuQwsWIYd6leVj08ayl1iB%2FNcdBqGrh39dy3B509Ts9EV3fmZ8yjYicQE8CusLPdCVCPSYSRuh4eFgLKOD5pXwXZBfWHgcm3yuTPw6UlXKgx0QXblKPUxhkJCFQo0doXCgF2xq6yTz1e1IKHC3gBmr6c7yPr%2F3SgTjPZDCl%2BdPM12gdDN3Ipgu5Uq5zhwaSpLQaka9KVQ3B3T%2FocmGFgFIhGz3rOUSDXWN8K2FMTxoYhgcvkGRJUUgJSARJCFvkb2lKCG7%2FHMolpWLS4tHGINewtQhj4w%2FhXNjfoPJnyJRA%2BIwgWD4PsFlOWrHd5EyMbkyYsRqBS0ce7F8Xcec9JkXRxbps9%2F6%2B%2FCM%2BSs9uQUzUtoUv56yXCB5LTmHRAcPzwT6R17Y%2B8up5bISySEFdLNM9CG5IF%2B6AD3TDJ3BiieUUzZi5x1xCxalkzAbiv7dePGMDHPC6FLEjwqXuJOpNYp2Bh%2BRKUp5N%2Fd2abX69ZDoDKRYDPYtZWPi%2F3gpnpK%2BL7T7MMd71TxYLi0I0zhVq25eEI6%2F3m79vFOXkRUqUww3ajR1wY6pgFgGgVA1pl563H7lFpOVk%2BjUEGW%2F0kgdsM%2BLVSdvQOE5yxZsWAHe0YFM2c7%2BTWkgwQrLGwVrwvYcFFQLZhw5IBr9qjDXSHAu%2FRPv5XMwukAzvGl5x%2FgYBsuv1%2BGZNs0wOKGyOh2baPRLXHNpbzqdKvQopEjuIWRzQB1GOf9dHDQF1cRQdyF9LPLjF9aH4VnnRAZdGaS6xOtfsnLbjT8GRTIpV5wdixU&X-Amz-Signature=bfa1cad1046644e7fa04399929db3fd95dfc8093a0727d5842fc9ce80dc04d79&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4662EBN54UD%2F20260807%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260807T183811Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJH%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCICchj4Sysdum1vyGrczfUGb%2BKMeU0M9ndrWHaHLvGs8fAiBhtAkfdALfUu%2FHiBHg%2F%2FJKAPhzabJlCNJg8efOcipdMCr%2FAwhaEAAaDDYzNzQyMzE4MzgwNSIMEA%2FYb2IrHWK42AdDKtwDLXvC9sHT3NJbWTCEoD3ysGEjrG4%2Bp81YMuGvICwafdEki9QrFr4LzD6z5%2B3XU17vqw0xMketzN7YwDlA3QXPYIib5W%2B%2BlPUQaH73JuJp5nXX7R1pTv6RF5LsoT%2FPnpKZz8qkHPPhtGX6yPFvvS8uGqFfquBKszI6gf3mfdM3c9fHtbVREhxDwMX4oM7lLlA%2BIMhRTZ%2FnWF3LlH18YCRlpI%2FjYRw1bummY1gYbZFHK2mPxa1hAym6dNGtkclPtFkKiEdbNIDQiiXf54u%2FAhB9ck8ekgWOgSz50Pul2pw2NeHPRNt3rqvEAaZT5YmG9WpZTpZ5KHmEImdVNFDrizKvU3Z3tc7q%2FX4ttm6BQJ8Rh5UlCKxJiPn8Prq2ytHq7A0qZRS0Gl2xlm9VTeCK5CpoW8xTM0gJ6g9nlVsPKcYuCvucXELEmCaf4qdhP%2FiszdfNQzLKYb2%2BeQ2UweM%2FPZGCNGCNutLL0X%2F3MiXZqwK1oz4pAiYg3fWvOfqPqQlzRiT4k37HCqsl9SZaXrbZreQW32Y5rp6TFskP6XdsZ6BOVW%2FSfE2t0AaLo8hyLWVqqOK4mGddhF1rdVLGynYTblv8h01sck6I6CirX5xXiMkWON3C4vaAXD8RpRN%2BDcswupbY0wY6pgFXW6%2FVAKYGKuYxlqh14qJ0l6dHJkyWee6VTg5edqfErwDyJ4tT3tut5OD1kUn0QwlIsKoGI265f%2Fmede7YOfg7ETHyExll94ANhfiNFSeKkuKMOGPbjrrthZWNE9EgC79knSJIlOQKXicZ8msrrgnoovt5e8WPhoOOgNpqej9go%2BlGgizX5oJTWxbVMVy4MPMeZbxRJJ%2FDKjsvpp9zUgxhiUjixIlx&X-Amz-Signature=4751afe0135c3e26723d6b70d95edcf9b10713829c34fbb94515348e1d1ab221&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4662EBN54UD%2F20260807%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260807T183811Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJH%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCICchj4Sysdum1vyGrczfUGb%2BKMeU0M9ndrWHaHLvGs8fAiBhtAkfdALfUu%2FHiBHg%2F%2FJKAPhzabJlCNJg8efOcipdMCr%2FAwhaEAAaDDYzNzQyMzE4MzgwNSIMEA%2FYb2IrHWK42AdDKtwDLXvC9sHT3NJbWTCEoD3ysGEjrG4%2Bp81YMuGvICwafdEki9QrFr4LzD6z5%2B3XU17vqw0xMketzN7YwDlA3QXPYIib5W%2B%2BlPUQaH73JuJp5nXX7R1pTv6RF5LsoT%2FPnpKZz8qkHPPhtGX6yPFvvS8uGqFfquBKszI6gf3mfdM3c9fHtbVREhxDwMX4oM7lLlA%2BIMhRTZ%2FnWF3LlH18YCRlpI%2FjYRw1bummY1gYbZFHK2mPxa1hAym6dNGtkclPtFkKiEdbNIDQiiXf54u%2FAhB9ck8ekgWOgSz50Pul2pw2NeHPRNt3rqvEAaZT5YmG9WpZTpZ5KHmEImdVNFDrizKvU3Z3tc7q%2FX4ttm6BQJ8Rh5UlCKxJiPn8Prq2ytHq7A0qZRS0Gl2xlm9VTeCK5CpoW8xTM0gJ6g9nlVsPKcYuCvucXELEmCaf4qdhP%2FiszdfNQzLKYb2%2BeQ2UweM%2FPZGCNGCNutLL0X%2F3MiXZqwK1oz4pAiYg3fWvOfqPqQlzRiT4k37HCqsl9SZaXrbZreQW32Y5rp6TFskP6XdsZ6BOVW%2FSfE2t0AaLo8hyLWVqqOK4mGddhF1rdVLGynYTblv8h01sck6I6CirX5xXiMkWON3C4vaAXD8RpRN%2BDcswupbY0wY6pgFXW6%2FVAKYGKuYxlqh14qJ0l6dHJkyWee6VTg5edqfErwDyJ4tT3tut5OD1kUn0QwlIsKoGI265f%2Fmede7YOfg7ETHyExll94ANhfiNFSeKkuKMOGPbjrrthZWNE9EgC79knSJIlOQKXicZ8msrrgnoovt5e8WPhoOOgNpqej9go%2BlGgizX5oJTWxbVMVy4MPMeZbxRJJ%2FDKjsvpp9zUgxhiUjixIlx&X-Amz-Signature=2eed0595bc09c02e6ad8b4949be0a581e8b149036ebe9b0838a9c2e302f186f3&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

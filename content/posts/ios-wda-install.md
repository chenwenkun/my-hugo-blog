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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4665LIMFEYQ%2F20261012%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261012T135000Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEL3%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIB1g1gaj%2BW9s5FWQJiBhJ%2BNC3GZ26oI3rk1aogO%2BxayRAiEAy%2FDv4AYET4K4nxu88r20QPdSmJrtVf52nlri2e7dckwqiAQIhv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDGgnHYfRCeHEhg2%2BCCrcAzOrZdm7zKpQ20dg9qNavYw7dBq9TOshWM7YIk81UQjHl3TjhXLDj5JJPUoVxS9Y6KP3oSsZjOfyrLyHNFdQ5pKIKnk29tE5tIy0mz5f%2FfRMn78X5scKBqlEAMWFhVtDKm4E45dViqUzkEen2OWb7dqnD9MGVYO7ffaE66qT6CJakbVGXoe5OVxQsFNeSWSUzKU0%2FaH3Dvfl260VdnzqXmivoKGNi5GzJtyfBIORVhavJfCgZzLNol083ZBiZtBeJQ8Xr18I67wm3oM2nOVPOzcCWt9H%2BTFpgJ%2BM8%2FpLPvo6iuk7nviP3fpn3fiPNoNc7Dtt%2Fp3iZ4ebPNur0ij4CDXGnmkBTJLpRvSIqIVcn%2Fom%2BKdHr%2BIzkY4NYb0auUVbuvL4qmQdVR47pZDZm3%2FbLhzITn7%2BCn%2FPpT5sMMTho%2FQuiApECGhqFxSwUvI5TaUE9Wb%2FUc66df61ANm4v3wIqA7aHWoAGk85v0t80Jfz1mxjZX5xLTSFZ9KDviAwXoyLfXi7G0ebNFhdRSBd7IRga1TdPfsjQhE%2Bn%2FPH25enR%2F9TvNo%2FZzWjAdsIDVPhrn8UmP9dJqgsc8NZf1ZCxGJaaTYp1S3p98tiiibu5t3lGIzkAjWOD0rDU0B%2FgOL3MKams9YGOqUBwzICFM64gHE4FY8apuqkjCkA44jGrW2piFzqAZEadNrIf6lt1yjii%2B8qmmbNKQ06wm3oyzYIvRCC1lO6SDDL9s%2B1V0qHPSfGzVGW1fzQB344n6yYZV78pFzfpuUrHYtWvSO2x%2FvN%2Fx5MXTKtrOyBprRECfMkn9Xw8rCyvvDvAKqL9pF2WWSvenfELqTeLECxGxzD%2B7h9kXuU7K1R9K2KPf%2Fr617%2B&X-Amz-Signature=ca55f2c044711ea81d844fe9f302433f3cb49be154aee5ad40c517f765733fa2&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4665LIMFEYQ%2F20261012%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261012T135000Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEL3%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIB1g1gaj%2BW9s5FWQJiBhJ%2BNC3GZ26oI3rk1aogO%2BxayRAiEAy%2FDv4AYET4K4nxu88r20QPdSmJrtVf52nlri2e7dckwqiAQIhv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDGgnHYfRCeHEhg2%2BCCrcAzOrZdm7zKpQ20dg9qNavYw7dBq9TOshWM7YIk81UQjHl3TjhXLDj5JJPUoVxS9Y6KP3oSsZjOfyrLyHNFdQ5pKIKnk29tE5tIy0mz5f%2FfRMn78X5scKBqlEAMWFhVtDKm4E45dViqUzkEen2OWb7dqnD9MGVYO7ffaE66qT6CJakbVGXoe5OVxQsFNeSWSUzKU0%2FaH3Dvfl260VdnzqXmivoKGNi5GzJtyfBIORVhavJfCgZzLNol083ZBiZtBeJQ8Xr18I67wm3oM2nOVPOzcCWt9H%2BTFpgJ%2BM8%2FpLPvo6iuk7nviP3fpn3fiPNoNc7Dtt%2Fp3iZ4ebPNur0ij4CDXGnmkBTJLpRvSIqIVcn%2Fom%2BKdHr%2BIzkY4NYb0auUVbuvL4qmQdVR47pZDZm3%2FbLhzITn7%2BCn%2FPpT5sMMTho%2FQuiApECGhqFxSwUvI5TaUE9Wb%2FUc66df61ANm4v3wIqA7aHWoAGk85v0t80Jfz1mxjZX5xLTSFZ9KDviAwXoyLfXi7G0ebNFhdRSBd7IRga1TdPfsjQhE%2Bn%2FPH25enR%2F9TvNo%2FZzWjAdsIDVPhrn8UmP9dJqgsc8NZf1ZCxGJaaTYp1S3p98tiiibu5t3lGIzkAjWOD0rDU0B%2FgOL3MKams9YGOqUBwzICFM64gHE4FY8apuqkjCkA44jGrW2piFzqAZEadNrIf6lt1yjii%2B8qmmbNKQ06wm3oyzYIvRCC1lO6SDDL9s%2B1V0qHPSfGzVGW1fzQB344n6yYZV78pFzfpuUrHYtWvSO2x%2FvN%2Fx5MXTKtrOyBprRECfMkn9Xw8rCyvvDvAKqL9pF2WWSvenfELqTeLECxGxzD%2B7h9kXuU7K1R9K2KPf%2Fr617%2B&X-Amz-Signature=1cbcd0c2120f336ac73c0b55e2ef413eeafd20e38842545a4d52ad591b0cefb4&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB46624UMUVKT%2F20260825%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260825T062600Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEDEaCXVzLXdlc3QtMiJIMEYCIQDYqx1m59pcsYNDEU2HbHKkjY%2ByNyHDfTbYCT4MIWFJfwIhANMhcCnZJN0O036aAQy5QsKIQmgENZ%2BmBobJ1umVApuTKogECPr%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgyN526yfEiouJOA0MMq3APgEwqyovXa3%2BoXkoOuglFczkStalyyFfwxVZtVaR%2BufgdowEl9u08phe1kyP3Q6Q0vY%2FfOvbwH4gnAANgfFZ0IfzKkJ15TExVQwZigK6Ke4Z8SI6e1NDIDIHeXNRK13aCuF3t%2FbTXNnzeALSyIstPJSnddNP%2BNm4h4cb8WdMG4jaV%2FfXGBOk%2FuFh%2BVBZVHRHPyXOatypLdOGkgumKPRGMDpgl7mGCurJByO91p7%2BQBAdqA9h57DCGoxHDJEoXPzIZbk13SbHvLXD9tyuzV33qLonk0k78AT5ds1af6SurnXe6svQteMgSam5PL8ERTSeOFMEBZQ3YIPhwFpSHYYyS%2BkXtwvCxjeHMhV7JxXrqayUnXa12BGoz7SSeDqWoM5vyDaqEMQFlfPsimXRzSFxrYtXKsxJiWbGmEGhSedc%2Bl%2BTO5P4gLsVgQJ8u1nARO6bjCNVnV8i2mOfS5Bm0qyuZzyjo4HklBG57hhiWlSGRUglXE0NK%2FuvmadW0CQw1mHNzLa6EUEQfA4IjLOsxaneloAAyxdHEp6sbPectljkAlalQN9w7B4xrlY351cTMwPvZDQh%2F1fCVSUtWN6OIFdBSdIeoDv9k04IBMMhh85i7cTxfPxk%2BrPOg9NNbQeTDu0LPUBjqkAcgOwhTTCxbUfR4LRWUETNnqYztiLbjOv7Y0v%2FmuQMCmO7ZI6bxG0bBEva6LM49n4FfMX5WDphvx0z5jJnl6xb2LCf907sOThcRON5in84ZX4aJDPjO0jQhoNzsECeiayvd8S7BVfO0u0R0sPC9Z%2FcY%2BOoP9YnMvY%2BULjpsMsEgqpoIi9V0YUH48ksXZX0Hty%2BwcJ3D7t00fcz3V%2BeULnspn%2BsLz&X-Amz-Signature=35ac9a38c7656a5181f07f17963037f5a59b0b4a77639a32118b091d531417eb&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB46624UMUVKT%2F20260825%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260825T062600Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEDEaCXVzLXdlc3QtMiJIMEYCIQDYqx1m59pcsYNDEU2HbHKkjY%2ByNyHDfTbYCT4MIWFJfwIhANMhcCnZJN0O036aAQy5QsKIQmgENZ%2BmBobJ1umVApuTKogECPr%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgyN526yfEiouJOA0MMq3APgEwqyovXa3%2BoXkoOuglFczkStalyyFfwxVZtVaR%2BufgdowEl9u08phe1kyP3Q6Q0vY%2FfOvbwH4gnAANgfFZ0IfzKkJ15TExVQwZigK6Ke4Z8SI6e1NDIDIHeXNRK13aCuF3t%2FbTXNnzeALSyIstPJSnddNP%2BNm4h4cb8WdMG4jaV%2FfXGBOk%2FuFh%2BVBZVHRHPyXOatypLdOGkgumKPRGMDpgl7mGCurJByO91p7%2BQBAdqA9h57DCGoxHDJEoXPzIZbk13SbHvLXD9tyuzV33qLonk0k78AT5ds1af6SurnXe6svQteMgSam5PL8ERTSeOFMEBZQ3YIPhwFpSHYYyS%2BkXtwvCxjeHMhV7JxXrqayUnXa12BGoz7SSeDqWoM5vyDaqEMQFlfPsimXRzSFxrYtXKsxJiWbGmEGhSedc%2Bl%2BTO5P4gLsVgQJ8u1nARO6bjCNVnV8i2mOfS5Bm0qyuZzyjo4HklBG57hhiWlSGRUglXE0NK%2FuvmadW0CQw1mHNzLa6EUEQfA4IjLOsxaneloAAyxdHEp6sbPectljkAlalQN9w7B4xrlY351cTMwPvZDQh%2F1fCVSUtWN6OIFdBSdIeoDv9k04IBMMhh85i7cTxfPxk%2BrPOg9NNbQeTDu0LPUBjqkAcgOwhTTCxbUfR4LRWUETNnqYztiLbjOv7Y0v%2FmuQMCmO7ZI6bxG0bBEva6LM49n4FfMX5WDphvx0z5jJnl6xb2LCf907sOThcRON5in84ZX4aJDPjO0jQhoNzsECeiayvd8S7BVfO0u0R0sPC9Z%2FcY%2BOoP9YnMvY%2BULjpsMsEgqpoIi9V0YUH48ksXZX0Hty%2BwcJ3D7t00fcz3V%2BeULnspn%2BsLz&X-Amz-Signature=6eecbf06bdc6a5b7053b6dddf82a70e19a2bad453f17cac38474c5dcce019f61&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4665KZYY34W%2F20260805%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260805T134045Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEF0aCXVzLXdlc3QtMiJGMEQCIAnoOEm8yRDus9P7R00zyJU%2FFMaTvMgb5DhzDr2DyNYqAiB6mD1gYBX4WJvseDY8U0OJK3f7xJykFzc2H4PCl4PPSir%2FAwgmEAAaDDYzNzQyMzE4MzgwNSIMMnUON1t5eVN9zyCMKtwDCS5Ul6sOM1k%2FsM51y1Ai9XoiJNfmQ6Q9GMeM0YAk%2F7KzswuKbrSWvH6XCR%2FdRUF09%2Fa7GJX3bHZra4i3gEw2cq3DsH0BrYelJEwJRO3z1mbji97RoyzqaCwBcyycO6rFql%2BUeIHvAGdPaSpi%2Fi7HpPzy86VWff%2FnQQtBjre3PrvonbpMGrioR5N7SD5RvJgvyKzuMNhGC5eKF3pE%2FUcYf000FAeAMt62oUAcOl%2FAerNvD%2BRzckQZDRI2WbRyRsNGPdXzm6t8vo0ucQPa3wBo6qX4XJIKi0%2F4R%2BHsoX99JDmpuI59ZEzaoBR0%2BKeK6ppFTrE2jId64YtCAZgHZM0fuyI4W%2F2ejX%2BkiVysxzc2u9v%2BTqzJUrzpDbm8IXBJToKAIMMc14rAFcVWL8ThuJ2BRty8ZC5woKYCd3BlDbb67URBd2mFfO8KYmEqrRiSoyj4oSEMNRROFVP%2FaadNHMJjw5xl31e9LoOqPoANdj5h8YNC%2BN2nyZgc6PWpwCkMxRbFDpbgUkgIsoCPqIBy6ZEAn3mU0kKBwRdUhkdQV7htrn3i3A62nkAzA9VAledK133qZ6JX9MjUgM%2FP4JuwlHE5ucajITX%2BL9k07fqLbQ%2FlbvH0dKCioPYEfs1YFj4wx%2BXM0wY6pgHxm1cTKaZ3KuvWRpvw9DHoCPfY%2FX%2Bq8Y2XVqyeLWdyrE7XBi2RA3SaB5ut4o41JryEY9i1QHCGWGSHYn16SY5aGtNJdHZI7wL8xPT%2FlqNXcOL2YejO3WtB4pWUD2DF7AI%2BbFekddD3CoGGTwC%2BsUiByZCNpNB0bgGTw5mQN3yUxk0LsEV4gefPX9FSNFiZ%2Fg3uIWTqIl1oQ0DeLM6nhjejHwGFtbRc&X-Amz-Signature=657b1737b8d197c1d1dbd07e8d71803f8a55e55e2624316afa58ad2222390372&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4665KZYY34W%2F20260805%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260805T134045Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEF0aCXVzLXdlc3QtMiJGMEQCIAnoOEm8yRDus9P7R00zyJU%2FFMaTvMgb5DhzDr2DyNYqAiB6mD1gYBX4WJvseDY8U0OJK3f7xJykFzc2H4PCl4PPSir%2FAwgmEAAaDDYzNzQyMzE4MzgwNSIMMnUON1t5eVN9zyCMKtwDCS5Ul6sOM1k%2FsM51y1Ai9XoiJNfmQ6Q9GMeM0YAk%2F7KzswuKbrSWvH6XCR%2FdRUF09%2Fa7GJX3bHZra4i3gEw2cq3DsH0BrYelJEwJRO3z1mbji97RoyzqaCwBcyycO6rFql%2BUeIHvAGdPaSpi%2Fi7HpPzy86VWff%2FnQQtBjre3PrvonbpMGrioR5N7SD5RvJgvyKzuMNhGC5eKF3pE%2FUcYf000FAeAMt62oUAcOl%2FAerNvD%2BRzckQZDRI2WbRyRsNGPdXzm6t8vo0ucQPa3wBo6qX4XJIKi0%2F4R%2BHsoX99JDmpuI59ZEzaoBR0%2BKeK6ppFTrE2jId64YtCAZgHZM0fuyI4W%2F2ejX%2BkiVysxzc2u9v%2BTqzJUrzpDbm8IXBJToKAIMMc14rAFcVWL8ThuJ2BRty8ZC5woKYCd3BlDbb67URBd2mFfO8KYmEqrRiSoyj4oSEMNRROFVP%2FaadNHMJjw5xl31e9LoOqPoANdj5h8YNC%2BN2nyZgc6PWpwCkMxRbFDpbgUkgIsoCPqIBy6ZEAn3mU0kKBwRdUhkdQV7htrn3i3A62nkAzA9VAledK133qZ6JX9MjUgM%2FP4JuwlHE5ucajITX%2BL9k07fqLbQ%2FlbvH0dKCioPYEfs1YFj4wx%2BXM0wY6pgHxm1cTKaZ3KuvWRpvw9DHoCPfY%2FX%2Bq8Y2XVqyeLWdyrE7XBi2RA3SaB5ut4o41JryEY9i1QHCGWGSHYn16SY5aGtNJdHZI7wL8xPT%2FlqNXcOL2YejO3WtB4pWUD2DF7AI%2BbFekddD3CoGGTwC%2BsUiByZCNpNB0bgGTw5mQN3yUxk0LsEV4gefPX9FSNFiZ%2Fg3uIWTqIl1oQ0DeLM6nhjejHwGFtbRc&X-Amz-Signature=12bb600fd8c35379e153d287d376d5c6a5f14ec58d135cb6ac6af98a4e7455ba&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

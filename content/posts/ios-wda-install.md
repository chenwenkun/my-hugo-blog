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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4666AXNYPKN%2F20260824%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260824T182314Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjECoaCXVzLXdlc3QtMiJHMEUCIC%2FxJmeRQOVCg2UQZvsVHTyPOeKVmkGjEzSyV3zt5MNbAiEAx3d0M1wfN0QOA2GqgGXaeMKOwHe0NUc0HB8bF4T0a20qiAQI8%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDDI%2FLi9aiuCZQmPhCSrcA1%2B4jw8W4d70oOMA0%2Be9LC6Z8lWy6zGjJjTZo6%2Fd5hoC4MBzlL62P4CYLJ894oWUC7Fccz%2BUR%2BMT%2BU7%2F6yefiv3oq0vAE3dqbxNiNfZ%2BKzVcY997U2bnJjRoehUIEOgh2wLbs5FRkMLUw%2FBo53aUSWLXNUrH2idVe6dR9NxaOGMZ3SE9WSX9%2FykXMwyVeTfveJV7kPgIPr6vteNMoRPfI4NVwqQoG5pNopdJ%2B28aXhJpumYImRhtoU7KZkWDjqEh1TNm5fD9C8eDm4cuEF%2FG0xXUdMx6OzOA3RAo1A40K8FcT4hLzY6FUxLrdvmzf3ix6KOuvs5T0V7lkAw1miLyeezTwjapSEM2QXFoEhksglZ%2Bz6dB0jZbnojinyqDZoeHxLhTIgMczwoc1WtMArWX%2FNe8h5IvsA7rljWtZxoFtwf%2F3%2FIAfegXRtgCDX9JQwtSmGoAz7cVqIzfG3XjYv5HUp%2F2qWZVS3gsumAnGtqLWM%2F3sHj1sBmGkUKzSSYVMiS6NM0XJ3bl9loAZa2xcY2N420%2FeAgTyRsYhdnqQHMrmcN5MX4dOF2TPiEQx2jsjthnrzrtnJ5UGJSZyzTrEcTVGv6oDAWHFe0A2jE7DYhEi0pV3jYdeRiVgCqhT8bvMIT%2BsdQGOqUBenfmAA%2BTJmEdskjlvmYg83J%2FcDM2ErhOFafLa6UtxPZ5hflh83jHf48mL6AfsCqrDmsshP0yvCsuUUJn6lRk9x9yZrMAPGdGV9DaCyGqq%2F8AeLqRsC1%2B2qOlrXv93FAOrSAWwaWWQp%2BIpCV%2F56LQDqyBYCiqsLOKN1gTppFq4vN9pBaE7mnn%2FEH1SaT8RAM%2B8j1GmQNp7ROrg3pESvT4%2FXj4LcDA&X-Amz-Signature=5e518715d41188e997b04103705515b663d3f1624fa038a73dcca6e2ca0f36ec&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4666AXNYPKN%2F20260824%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260824T182314Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjECoaCXVzLXdlc3QtMiJHMEUCIC%2FxJmeRQOVCg2UQZvsVHTyPOeKVmkGjEzSyV3zt5MNbAiEAx3d0M1wfN0QOA2GqgGXaeMKOwHe0NUc0HB8bF4T0a20qiAQI8%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDDI%2FLi9aiuCZQmPhCSrcA1%2B4jw8W4d70oOMA0%2Be9LC6Z8lWy6zGjJjTZo6%2Fd5hoC4MBzlL62P4CYLJ894oWUC7Fccz%2BUR%2BMT%2BU7%2F6yefiv3oq0vAE3dqbxNiNfZ%2BKzVcY997U2bnJjRoehUIEOgh2wLbs5FRkMLUw%2FBo53aUSWLXNUrH2idVe6dR9NxaOGMZ3SE9WSX9%2FykXMwyVeTfveJV7kPgIPr6vteNMoRPfI4NVwqQoG5pNopdJ%2B28aXhJpumYImRhtoU7KZkWDjqEh1TNm5fD9C8eDm4cuEF%2FG0xXUdMx6OzOA3RAo1A40K8FcT4hLzY6FUxLrdvmzf3ix6KOuvs5T0V7lkAw1miLyeezTwjapSEM2QXFoEhksglZ%2Bz6dB0jZbnojinyqDZoeHxLhTIgMczwoc1WtMArWX%2FNe8h5IvsA7rljWtZxoFtwf%2F3%2FIAfegXRtgCDX9JQwtSmGoAz7cVqIzfG3XjYv5HUp%2F2qWZVS3gsumAnGtqLWM%2F3sHj1sBmGkUKzSSYVMiS6NM0XJ3bl9loAZa2xcY2N420%2FeAgTyRsYhdnqQHMrmcN5MX4dOF2TPiEQx2jsjthnrzrtnJ5UGJSZyzTrEcTVGv6oDAWHFe0A2jE7DYhEi0pV3jYdeRiVgCqhT8bvMIT%2BsdQGOqUBenfmAA%2BTJmEdskjlvmYg83J%2FcDM2ErhOFafLa6UtxPZ5hflh83jHf48mL6AfsCqrDmsshP0yvCsuUUJn6lRk9x9yZrMAPGdGV9DaCyGqq%2F8AeLqRsC1%2B2qOlrXv93FAOrSAWwaWWQp%2BIpCV%2F56LQDqyBYCiqsLOKN1gTppFq4vN9pBaE7mnn%2FEH1SaT8RAM%2B8j1GmQNp7ROrg3pESvT4%2FXj4LcDA&X-Amz-Signature=567d8f32a278847eab2e9e51312619ee46ec7311482ac4f0163cbaf90ebd6920&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

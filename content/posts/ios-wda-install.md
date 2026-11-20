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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466Y4U44VWL%2F20261120%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261120T060710Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEFwaCXVzLXdlc3QtMiJGMEQCIFhkX4NpqDkBhB7EF5274HhKII3yq3cgVUB2Np9ircTEAiB8PEzyUhbZgLqmzX2r9fI5dqxJz60VTQ1TkdCrDiSkhCr%2FAwgkEAAaDDYzNzQyMzE4MzgwNSIMv4hJy8kBojvbGP8UKtwD3zdE8eS3Ru0npmxB4Nj%2FZLGWcXHwyOM%2BwYiQ7bLLPl5jMih3igcBQgPSLZnYvet9ycthsX%2B%2FT3cye49YRyJL2v0SbDgarrzWh0Oua3wJa0p%2B9Sw8jDvZ5ftjAJ8O5aPqU8IceIg%2FxRbqmqqubKtzrXPj292ivjrYhnRZAeoW3SjBTSdCv7lcYXw45vhk5DccBTJe%2FdQIr9POlqIPT%2FwxpELq3MEZbnm1uJYOhDMnMDF4NtpaFPuxGdmP38l34ti7gGAIrQx5uNMDmhJZTDwD3yAAYGEUDG76YTRcakBeJf1lWRFcRF%2BbYocuVZvKXuTNtGnq8HOzo%2F2vHw1YrnRnAMsCfD1npRc31fXWnL8CxY1fLhRukG5ntWKz8SvQbEZDLdFXZVXru8X4kpdyi5nsqirwpk%2BVJXRMetEuf7yQ16XyzutrGt4f2qIpsPkeZgZlHxaqYiUWmq6plX2XSvxBPsvLhXnKpDIQ%2BheWye4ZBWBIPsVtzQ1WksG%2Bbzn0SnFuEYTIKouGPc5AFt6SZUjFLhds68spJinIGKGIVO78j0uw0KjNs8aDjJoQ4OBpFsOQ4aLMcEfy99zaWosuHZiNurQeqNfvB6QJumVWcmzLEtF8G%2FU%2BdCctWl%2BDvIQwoof%2F1wY6pgEyjQNxjyIt1c2JGtl%2Bd6tekvNjSgNJJ3GyQfAbPsojxa4DuLSarzMk3PbcIfRGgVMHakLn%2BGt8VSI%2Fs83DjL4V5%2FXBT3mWo5nCYZjgXneOqsft0TvGiS66CIMaT2jGbQ%2FljiG3sUFbOJnIAbTOd61E9t6NrVe%2BmiHqrNSvJhZBawsAxan6LHVf%2B82ErhBVZVN2S3Ab7%2BvR9q3Dxb1Bt7rcm3Kpk1r1&X-Amz-Signature=3141c370f7cc32337a76873a5f0eb628b9517b59196a0a4fdf29324c0cc73678&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466Y4U44VWL%2F20261120%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261120T060710Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEFwaCXVzLXdlc3QtMiJGMEQCIFhkX4NpqDkBhB7EF5274HhKII3yq3cgVUB2Np9ircTEAiB8PEzyUhbZgLqmzX2r9fI5dqxJz60VTQ1TkdCrDiSkhCr%2FAwgkEAAaDDYzNzQyMzE4MzgwNSIMv4hJy8kBojvbGP8UKtwD3zdE8eS3Ru0npmxB4Nj%2FZLGWcXHwyOM%2BwYiQ7bLLPl5jMih3igcBQgPSLZnYvet9ycthsX%2B%2FT3cye49YRyJL2v0SbDgarrzWh0Oua3wJa0p%2B9Sw8jDvZ5ftjAJ8O5aPqU8IceIg%2FxRbqmqqubKtzrXPj292ivjrYhnRZAeoW3SjBTSdCv7lcYXw45vhk5DccBTJe%2FdQIr9POlqIPT%2FwxpELq3MEZbnm1uJYOhDMnMDF4NtpaFPuxGdmP38l34ti7gGAIrQx5uNMDmhJZTDwD3yAAYGEUDG76YTRcakBeJf1lWRFcRF%2BbYocuVZvKXuTNtGnq8HOzo%2F2vHw1YrnRnAMsCfD1npRc31fXWnL8CxY1fLhRukG5ntWKz8SvQbEZDLdFXZVXru8X4kpdyi5nsqirwpk%2BVJXRMetEuf7yQ16XyzutrGt4f2qIpsPkeZgZlHxaqYiUWmq6plX2XSvxBPsvLhXnKpDIQ%2BheWye4ZBWBIPsVtzQ1WksG%2Bbzn0SnFuEYTIKouGPc5AFt6SZUjFLhds68spJinIGKGIVO78j0uw0KjNs8aDjJoQ4OBpFsOQ4aLMcEfy99zaWosuHZiNurQeqNfvB6QJumVWcmzLEtF8G%2FU%2BdCctWl%2BDvIQwoof%2F1wY6pgEyjQNxjyIt1c2JGtl%2Bd6tekvNjSgNJJ3GyQfAbPsojxa4DuLSarzMk3PbcIfRGgVMHakLn%2BGt8VSI%2Fs83DjL4V5%2FXBT3mWo5nCYZjgXneOqsft0TvGiS66CIMaT2jGbQ%2FljiG3sUFbOJnIAbTOd61E9t6NrVe%2BmiHqrNSvJhZBawsAxan6LHVf%2B82ErhBVZVN2S3Ab7%2BvR9q3Dxb1Bt7rcm3Kpk1r1&X-Amz-Signature=5250e31374140e1935b955726976824c491fab8c7676d55ecce720fb36027853&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

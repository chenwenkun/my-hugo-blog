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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466VDAU7ZHM%2F20261012%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261012T235534Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEMX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCNGP2%2Bt6GHCUWfe0cIgL1SmPo8h%2FebGmt0E2aXNWt4HgIhAIxhewSNryPAURCkVVmRL2G6FQZHhz4sdTBWPa6kR3RtKogECI3%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgwaJiCke5lbtwSrCqsq3AMOMhFnHcwNvk2ZZS3ULZeYqDcbHHH4ZfEz0ZHBx0L5%2F3oZ4pKNLpUsUzJEAWphuutfYaDVln%2FUWHvEM2oYTqYVcq5lzy3%2FXLo16OWvl8Z2JRn4UzAEDELbYT0ka8j6sQy82RdIl5rhd6N3HvVMpR3S%2FvXdh%2BT%2B7rg%2B5lIOmjV4cAhoSBkBs4OlcifEy1aFr1cb2IXhdHpi65DJL60s772ziSycVJzJhgKCmb6fMgTkJ2yntkpwSgklR8bD189cerIJ6g8wYuWwWAiJs87zZO7PyHft5hsOP1PR%2BvnNqtEdPQI6JMBNGkNcbkCnDGW3AtmfT%2FF%2B%2BNDiejzPwyMt1UPw1e3SLYUj1jZBm5tEehN%2FbLCuxKf7BbD2%2FHbZwVIGM4IhLf%2BgpkZiEDrbrP3zJSp5F5IKa76Kgh%2BKjDRuxxFqijmWl1Gi2ttjil2FUMTjtm1MAAyzwIsEk62rReHJ85ksUSnF4y5iUPZI5lBM05OQCVRRQRO8Zkpv0B0ndzF6X0MK%2BJPArHQGgTbtDSdp6Vw8STU4e3hBiahYC1lTXFIaYp0wO5VkkCmEdBq2rjUV5djaMurg192SIA5aFHdGqSZevd8As8x90AjmkOvKq0p%2FIi7ec1dv27OACBxRkjDRjrXWBjqkAekG70t8LXk1yZD%2Fk4vyE%2FKsPslV4vp7n7oAyjm5oa5EOPOgAYXilSW%2FhdXvB8SYYa4kVnJ6yOeI0kegceGymFkYaUdBSuSBBcxMvbSehuJ4wSt6x36XzY7zIPQyQCCpfalfkr1JrZLQkCb59kpz4W54KfcKnzjYrTE4fJk668x8eGA05N7VOFLnfeZj4EWTuzJp2UkLFs%2FK2eEIHx8V3u91QBG2&X-Amz-Signature=849c1e131b45b79aa7b261c2a47db5948dd02a46ed99b66a9e21f380113b0899&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466VDAU7ZHM%2F20261012%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261012T235534Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEMX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCNGP2%2Bt6GHCUWfe0cIgL1SmPo8h%2FebGmt0E2aXNWt4HgIhAIxhewSNryPAURCkVVmRL2G6FQZHhz4sdTBWPa6kR3RtKogECI3%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgwaJiCke5lbtwSrCqsq3AMOMhFnHcwNvk2ZZS3ULZeYqDcbHHH4ZfEz0ZHBx0L5%2F3oZ4pKNLpUsUzJEAWphuutfYaDVln%2FUWHvEM2oYTqYVcq5lzy3%2FXLo16OWvl8Z2JRn4UzAEDELbYT0ka8j6sQy82RdIl5rhd6N3HvVMpR3S%2FvXdh%2BT%2B7rg%2B5lIOmjV4cAhoSBkBs4OlcifEy1aFr1cb2IXhdHpi65DJL60s772ziSycVJzJhgKCmb6fMgTkJ2yntkpwSgklR8bD189cerIJ6g8wYuWwWAiJs87zZO7PyHft5hsOP1PR%2BvnNqtEdPQI6JMBNGkNcbkCnDGW3AtmfT%2FF%2B%2BNDiejzPwyMt1UPw1e3SLYUj1jZBm5tEehN%2FbLCuxKf7BbD2%2FHbZwVIGM4IhLf%2BgpkZiEDrbrP3zJSp5F5IKa76Kgh%2BKjDRuxxFqijmWl1Gi2ttjil2FUMTjtm1MAAyzwIsEk62rReHJ85ksUSnF4y5iUPZI5lBM05OQCVRRQRO8Zkpv0B0ndzF6X0MK%2BJPArHQGgTbtDSdp6Vw8STU4e3hBiahYC1lTXFIaYp0wO5VkkCmEdBq2rjUV5djaMurg192SIA5aFHdGqSZevd8As8x90AjmkOvKq0p%2FIi7ec1dv27OACBxRkjDRjrXWBjqkAekG70t8LXk1yZD%2Fk4vyE%2FKsPslV4vp7n7oAyjm5oa5EOPOgAYXilSW%2FhdXvB8SYYa4kVnJ6yOeI0kegceGymFkYaUdBSuSBBcxMvbSehuJ4wSt6x36XzY7zIPQyQCCpfalfkr1JrZLQkCb59kpz4W54KfcKnzjYrTE4fJk668x8eGA05N7VOFLnfeZj4EWTuzJp2UkLFs%2FK2eEIHx8V3u91QBG2&X-Amz-Signature=71777471db50234b2e14752126d5ce18a6fc0e5df4ebb17869051c8629113dad&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

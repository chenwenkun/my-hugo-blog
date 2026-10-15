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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB46627CZXTIV%2F20261015%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261015T155601Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEAcaCXVzLXdlc3QtMiJHMEUCIQDrDH02g7Zv6UOdLmNH4bu11gbUKBo35FMxmJPg5G3dHwIgVfyukrpGAGGuoAoKGhfIp3v1NuHIG64EfhzdHzUiOokqiAQI0P%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDLyx2ZF3z211uxZcrSrcAz96qsmnCps26YxlfI1qL8RKj4EfrAT8lMFe5Lm6IuhVJ8OcmCPj0%2BSqfPpIGM4qQSgj4WGlcAW9Bk3wQoGCp3vW47DTfq%2Fp9YeubeEP61so0o5PrjZTIDO07WytEV03oTBB1vvVT4wbsOqHb8KT%2F6KBPIKQ%2B%2FHL7lScUEy1nUItGVusZkwLA%2FY9yWUB0vnCsDwTVmgo03ouhswnB5by%2BXAOF0hS4Kv01ir1ohmDA37P4pUYWoXRp0%2BUtYBnmh7BvQr3lsRVpNurDeoIoQX0iJgSfIrjOjvZwoCLvKj6TNWcPDFqxAnaz8Uz4PX7aDQUDX8V0fhq%2FL90urrf829hyazHgjcyAiGdCICLN8AYDxEboDH793tWEfsFouhdLkIf1T7kfaxxq3FCBvyhLnwnwNXHgRS2SSdnuuGIlUVuL3ccZPzIqsbVNR0CA75enTQW0KxyiQ7LPBoZbdun1mk%2FCrVmWZi%2B571%2FTsWezg6BmwwTCQNut99oRI56%2B%2BIUmdKQkFwcddYoBTA7fKZJZj7MjraVlNZr9b2RwfgvkHfI%2FFRarMU93jD4yBegAPMslGu%2Bb3UjvlOc0EQPgxXtVlVr9JAQ%2FmrLIwF3ex5%2Bq68wMVVlGPclCff1YSl8bmjjMOrXw9YGOqUBoXLcwvU0H%2BRCld3OTEAe3LvI7UvYi04Qu136KdQ5vLYSp%2BDJnhc9rG3lXCr5Mz6oT95fUCGmbPs7PKPrmGtI5IgWk9eeT4Gd3RCoVHjeMejPaFp%2BdlFA8w0uq1QSXcLC4i7RdsKqz6r2g5m98qJZ%2Fux%2FdElMDx8sHkxocsY8TOBPOfCY3EbZqe6tDGcvSiOkG3SDskSPZitIcpYxAo7eP4K7%2BXQw&X-Amz-Signature=d1a1b53f3be12492d51e987cafa1b2a293a6e09d83ed5fd9f6e798b471370f1b&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB46627CZXTIV%2F20261015%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261015T155601Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEAcaCXVzLXdlc3QtMiJHMEUCIQDrDH02g7Zv6UOdLmNH4bu11gbUKBo35FMxmJPg5G3dHwIgVfyukrpGAGGuoAoKGhfIp3v1NuHIG64EfhzdHzUiOokqiAQI0P%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDLyx2ZF3z211uxZcrSrcAz96qsmnCps26YxlfI1qL8RKj4EfrAT8lMFe5Lm6IuhVJ8OcmCPj0%2BSqfPpIGM4qQSgj4WGlcAW9Bk3wQoGCp3vW47DTfq%2Fp9YeubeEP61so0o5PrjZTIDO07WytEV03oTBB1vvVT4wbsOqHb8KT%2F6KBPIKQ%2B%2FHL7lScUEy1nUItGVusZkwLA%2FY9yWUB0vnCsDwTVmgo03ouhswnB5by%2BXAOF0hS4Kv01ir1ohmDA37P4pUYWoXRp0%2BUtYBnmh7BvQr3lsRVpNurDeoIoQX0iJgSfIrjOjvZwoCLvKj6TNWcPDFqxAnaz8Uz4PX7aDQUDX8V0fhq%2FL90urrf829hyazHgjcyAiGdCICLN8AYDxEboDH793tWEfsFouhdLkIf1T7kfaxxq3FCBvyhLnwnwNXHgRS2SSdnuuGIlUVuL3ccZPzIqsbVNR0CA75enTQW0KxyiQ7LPBoZbdun1mk%2FCrVmWZi%2B571%2FTsWezg6BmwwTCQNut99oRI56%2B%2BIUmdKQkFwcddYoBTA7fKZJZj7MjraVlNZr9b2RwfgvkHfI%2FFRarMU93jD4yBegAPMslGu%2Bb3UjvlOc0EQPgxXtVlVr9JAQ%2FmrLIwF3ex5%2Bq68wMVVlGPclCff1YSl8bmjjMOrXw9YGOqUBoXLcwvU0H%2BRCld3OTEAe3LvI7UvYi04Qu136KdQ5vLYSp%2BDJnhc9rG3lXCr5Mz6oT95fUCGmbPs7PKPrmGtI5IgWk9eeT4Gd3RCoVHjeMejPaFp%2BdlFA8w0uq1QSXcLC4i7RdsKqz6r2g5m98qJZ%2Fux%2FdElMDx8sHkxocsY8TOBPOfCY3EbZqe6tDGcvSiOkG3SDskSPZitIcpYxAo7eP4K7%2BXQw&X-Amz-Signature=ca692115ef96f54701d79e9eb64b0c3f838a2a92ddedf0986821294093867f35&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

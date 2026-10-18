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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4664LA27UQ3%2F20261018%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261018T150345Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEE8aCXVzLXdlc3QtMiJHMEUCIQDXHt7salUg44YolTL9Jd%2BsGetQy8FJlvyBa4zQJ8cvOAIgVGYBKi6OsbVOPQr8h56PZ3Mos7%2FdubWJs43P3l4K7fAq%2FwMIFxAAGgw2Mzc0MjMxODM4MDUiDJzr3XcCKKS%2B1OO0KCrcA85Iuo5XxAiPsy5Is1CixE0RyX42WYZJ7%2BgLGzhDqhyNNPc3WoYCWI2B1sSyEVjX3TjkgelqOr%2FgltHxuwYHRk5WrfrOv1%2B2FhG5AGmjgGk4QF78DHULxNlaj2cS5qKQrHgRvyRToojSsMgCcmlfzzxrU1D2dWACc%2B6gzJm%2BYlgDbMLHgqS%2FGLFKI3M67XYetDtKD%2F8I2cB5%2Bgf%2Fsb6%2BNIsbj%2FgJxJFCz2uSOgxtiYyDYkh0E5b6GF%2FmlcqfEvueV6cQtm%2FlrSTRbxttSEAmbaXE8kFDT3r3OQ6LLXEx3wrsxwqs4YCGTduG6v0xC%2F7xeFPcs7IpwXeWFiH0fL1yEyjmvjo3cxMib14f8SzvXho20YgIZO9pGRiQTrW047vQKEcSD%2BTJYSF3ba6%2BgzDG8%2FPyr7Eq68EZ72EShqZwhhy6EvKG8g0CjiC9Dpmu6%2BENr%2FUILYguPeTTRx4OIAR8JDv%2BZLjJpbSNaGugfodoGj9BJDk8Ca2JLQbFxsm%2ByX6VW%2BRHYQxreZj8LUMt3rDBzFA8zTEACRgqQ5QTNdbVn96LCGj2t%2FJchhd8eDMRx8EPtYLcjF7PycQJ%2BDOx2R%2FkA3o0XdbRzJNFf%2B9qykLy3nMTsfOvjVDysBNpwRlSMJe709YGOqUBAehBHWoYBW9W1DyOjfnWjYQyZ898D%2BdPS16R68nxLQVJhLtDJwRvrKDni5q4lxIR5ZSrTjj3z9dkBFYDeJNtJcpSJ5%2BHGW5WGCGG6xIJCh2%2BG8O4f%2Fhxas9nwpx9vZcdqd8HlMYG8ZfBD1nzbDvMpT7XkxjH0OKPmo8nzeLjthESMi71zBeXnseMxu1hJpMPv9v52rAL0o3gbKsSAaFhEwU5vJIW&X-Amz-Signature=f9441dbdb9ab8850218a37a971f4b381ad757d5b3698b3d19f3268af94e333f4&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4664LA27UQ3%2F20261018%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261018T150345Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEE8aCXVzLXdlc3QtMiJHMEUCIQDXHt7salUg44YolTL9Jd%2BsGetQy8FJlvyBa4zQJ8cvOAIgVGYBKi6OsbVOPQr8h56PZ3Mos7%2FdubWJs43P3l4K7fAq%2FwMIFxAAGgw2Mzc0MjMxODM4MDUiDJzr3XcCKKS%2B1OO0KCrcA85Iuo5XxAiPsy5Is1CixE0RyX42WYZJ7%2BgLGzhDqhyNNPc3WoYCWI2B1sSyEVjX3TjkgelqOr%2FgltHxuwYHRk5WrfrOv1%2B2FhG5AGmjgGk4QF78DHULxNlaj2cS5qKQrHgRvyRToojSsMgCcmlfzzxrU1D2dWACc%2B6gzJm%2BYlgDbMLHgqS%2FGLFKI3M67XYetDtKD%2F8I2cB5%2Bgf%2Fsb6%2BNIsbj%2FgJxJFCz2uSOgxtiYyDYkh0E5b6GF%2FmlcqfEvueV6cQtm%2FlrSTRbxttSEAmbaXE8kFDT3r3OQ6LLXEx3wrsxwqs4YCGTduG6v0xC%2F7xeFPcs7IpwXeWFiH0fL1yEyjmvjo3cxMib14f8SzvXho20YgIZO9pGRiQTrW047vQKEcSD%2BTJYSF3ba6%2BgzDG8%2FPyr7Eq68EZ72EShqZwhhy6EvKG8g0CjiC9Dpmu6%2BENr%2FUILYguPeTTRx4OIAR8JDv%2BZLjJpbSNaGugfodoGj9BJDk8Ca2JLQbFxsm%2ByX6VW%2BRHYQxreZj8LUMt3rDBzFA8zTEACRgqQ5QTNdbVn96LCGj2t%2FJchhd8eDMRx8EPtYLcjF7PycQJ%2BDOx2R%2FkA3o0XdbRzJNFf%2B9qykLy3nMTsfOvjVDysBNpwRlSMJe709YGOqUBAehBHWoYBW9W1DyOjfnWjYQyZ898D%2BdPS16R68nxLQVJhLtDJwRvrKDni5q4lxIR5ZSrTjj3z9dkBFYDeJNtJcpSJ5%2BHGW5WGCGG6xIJCh2%2BG8O4f%2Fhxas9nwpx9vZcdqd8HlMYG8ZfBD1nzbDvMpT7XkxjH0OKPmo8nzeLjthESMi71zBeXnseMxu1hJpMPv9v52rAL0o3gbKsSAaFhEwU5vJIW&X-Amz-Signature=a4da4bb2f481ade755b6925b50669a037fa4d043f505e4a7239a23dc27763eea&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466XTZJ56SZ%2F20261103%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261103T224020Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjENT%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIFP7SQ68P0pseNggqfVoMlBD5lBtaz7j4HmQzFPApNCBAiEA1PsBGbXSrjtoUE0Pkjp4wRrSJOgudVSxuQ93HevLiEgqiAQInf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDPAdbklHP1Nlvfr5kyrcA37yt3HmenHTRDGYrhacemWkVMtjGw0L78L1RT2EEN6Zs01LeVNq%2BjsaOd1gIuU3KsrJgT26jHpUksAKwhhp%2BklYr43DcGZkwqbTdeG9U21AYNhAo7Quy0G6716%2F%2FjzPkL0nlvEFPFGxh6FX4fIAlIYpX%2FuO2DVi2i4Uy8ldzbtmvPsFrxu2Sy0UzfHxp%2FGzQW2HoOfsLWRijiB6rm98qUtlOUwisOH4qm2ohBC2FhU3wQ9q893u5tWXc4OCarM8um%2FPPZvRP0abnKDWjs5vxMCdaxt7FxW45AlcfzO21Wqb%2BLKs4SNcT4vhdGmK3lS%2BjMPuYq8x%2BVMBhkvKYargvHH%2Fyq0e1ejpeTBmztovPHlgsD7FByiAEwXwgPUtoGodxvTsEw5%2FhFUzr1DiiwemjxcT%2FnnPCesBDTRFTAmb80im84IkmMnYwz73czjlsmiGl53GJ3UGu%2BSUhrc3hAie4IxfYKZRODR7x7x%2FXPPnj8h8uzMPR5TZEeARoyNRVDC%2BTU7UGFiwdskdkhRXBLpz6Fws%2BVHOvFGl6M0WkRT2iE%2FVmc9KrobbTLIX2h%2BABRRXC6nzlTbwO4t9tGirunJcMiI%2BqSP%2BSavdIk9gDrdxN%2BnmcIUWmYKCCAgO15GFMNr9qNcGOqUBkF%2BH3ib%2FNcrX0Li%2F6jZ3m30FKH75MDMhGCgdmahYw0RPJmiKCSpwAebSoGsT%2FBMud3q6BDc0XAe9KYtF5%2FAYDDZ2Y5tXF%2BZSQGr3sF1JWlTejuApEPHlFgoFMlQm15%2BzwsAypylT%2FiDaVNXcw5qUYT2OnbULZehlwAVCTjqWVDcex5FbxX%2FwHTDhW5LxZOgY5r%2B59cYgJqPuDLvSvjYxiVNvrAEn&X-Amz-Signature=b9796badee09dd4068311dfecd7263a7fbe3548167036b55412e35a3f5816851&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466XTZJ56SZ%2F20261103%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261103T224020Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjENT%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIFP7SQ68P0pseNggqfVoMlBD5lBtaz7j4HmQzFPApNCBAiEA1PsBGbXSrjtoUE0Pkjp4wRrSJOgudVSxuQ93HevLiEgqiAQInf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDPAdbklHP1Nlvfr5kyrcA37yt3HmenHTRDGYrhacemWkVMtjGw0L78L1RT2EEN6Zs01LeVNq%2BjsaOd1gIuU3KsrJgT26jHpUksAKwhhp%2BklYr43DcGZkwqbTdeG9U21AYNhAo7Quy0G6716%2F%2FjzPkL0nlvEFPFGxh6FX4fIAlIYpX%2FuO2DVi2i4Uy8ldzbtmvPsFrxu2Sy0UzfHxp%2FGzQW2HoOfsLWRijiB6rm98qUtlOUwisOH4qm2ohBC2FhU3wQ9q893u5tWXc4OCarM8um%2FPPZvRP0abnKDWjs5vxMCdaxt7FxW45AlcfzO21Wqb%2BLKs4SNcT4vhdGmK3lS%2BjMPuYq8x%2BVMBhkvKYargvHH%2Fyq0e1ejpeTBmztovPHlgsD7FByiAEwXwgPUtoGodxvTsEw5%2FhFUzr1DiiwemjxcT%2FnnPCesBDTRFTAmb80im84IkmMnYwz73czjlsmiGl53GJ3UGu%2BSUhrc3hAie4IxfYKZRODR7x7x%2FXPPnj8h8uzMPR5TZEeARoyNRVDC%2BTU7UGFiwdskdkhRXBLpz6Fws%2BVHOvFGl6M0WkRT2iE%2FVmc9KrobbTLIX2h%2BABRRXC6nzlTbwO4t9tGirunJcMiI%2BqSP%2BSavdIk9gDrdxN%2BnmcIUWmYKCCAgO15GFMNr9qNcGOqUBkF%2BH3ib%2FNcrX0Li%2F6jZ3m30FKH75MDMhGCgdmahYw0RPJmiKCSpwAebSoGsT%2FBMud3q6BDc0XAe9KYtF5%2FAYDDZ2Y5tXF%2BZSQGr3sF1JWlTejuApEPHlFgoFMlQm15%2BzwsAypylT%2FiDaVNXcw5qUYT2OnbULZehlwAVCTjqWVDcex5FbxX%2FwHTDhW5LxZOgY5r%2B59cYgJqPuDLvSvjYxiVNvrAEn&X-Amz-Signature=ed63e17ac2242fc07444f5250d4bf7ef415930ae1d4767a4e39c4b90cba12647&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

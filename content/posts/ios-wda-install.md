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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466Z3MS2BNJ%2F20260803%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260803T191723Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEDMaCXVzLXdlc3QtMiJGMEQCIGfj5iYiHAmG0GBChIh7MaoHJBUkrE6sOOyBbb9mwnzdAiAKxR%2FCwmz2fT0C13TTZhznNV2coGyKQY3bkb9a1reM9iqIBAj8%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMbwAac%2B%2BySUrIsy6tKtwDKOvGub3SZJnjLNRx%2FgEHpvyGhsxymys%2FpZCcsUIzweAlVvtRlWaZTpSaohoHHIiL%2BU0O4Yj7wtAzjwaDtRLrpjWldwTCGGiIZAK885I9yzPSYuj8ekLBpD8Mt2bk8DOFmKX7YTzKGH1vDUOLtQg%2FtTdVehVKcdtpNc4zIfGaVsf2jTd%2BE6Mpbjz1zjn799CHN1oC986jDx3TsV%2Fgc%2BozfmIfNd4YU2e9rCIL4St5wz%2FhOSMMDBHRw1p04ajvTB%2BsKpuBoPfavhemRf5pZ1btvg33r37bLI%2FKnSj8i7ygNdDYQyxEmKtep46uVGeX70ylOnqyvuslyV9qc777z1qs9JvsJZNXJc1X1ehVlO%2BP1Uj7ZBizQgBO%2FtEoKafYfMqzkE3z4fUMVcnhWPgTsAxJpEbE3bGPb1zarDBtGFLlMzUW%2BkwfIszc04DyguK0YtFG1rYROpshH6G6pWICTe0UA8r1nsax4vll9EzGmn%2BdiW%2BpD%2F1zzEGsnvnJkcOLDOJOu7hpFVTL1EQnvs4usauAoE77XykIlIT8xGbiMy1m8uiFIvTt551gJKyg%2BouvOCkGnYzfP1VDrZvqDLnYmBrXNqJYsKTSRHwAR%2FIz8lilgAkC6dac7AljSPnR4yswjcfD0wY6pgGFQHYI22wtCr36NLy6Y91%2BzEx7k6K7iDrgUy4j09fc54wSTowNmIFpKtd20dTjGycCOM%2FkL3oMRD1DbbZLSw0DNBLce515B%2FCISHjDCFtOVtbNc6jT4EkDL4GZzvm5ps7zWT2%2BZO%2F3%2F1OF9z%2FvRe9%2F4NZhXNKnmAc0Zav7uwF9zfINDPEJI6sviIIAMwNMrtBWvTzoqz2mH9P3ymHXtqzr5zIMkuhi&X-Amz-Signature=d0e3b12a16d8d931835dcfc2e320731b2719f2243eeac37a0b16c1399363937b&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466Z3MS2BNJ%2F20260803%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260803T191723Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEDMaCXVzLXdlc3QtMiJGMEQCIGfj5iYiHAmG0GBChIh7MaoHJBUkrE6sOOyBbb9mwnzdAiAKxR%2FCwmz2fT0C13TTZhznNV2coGyKQY3bkb9a1reM9iqIBAj8%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMbwAac%2B%2BySUrIsy6tKtwDKOvGub3SZJnjLNRx%2FgEHpvyGhsxymys%2FpZCcsUIzweAlVvtRlWaZTpSaohoHHIiL%2BU0O4Yj7wtAzjwaDtRLrpjWldwTCGGiIZAK885I9yzPSYuj8ekLBpD8Mt2bk8DOFmKX7YTzKGH1vDUOLtQg%2FtTdVehVKcdtpNc4zIfGaVsf2jTd%2BE6Mpbjz1zjn799CHN1oC986jDx3TsV%2Fgc%2BozfmIfNd4YU2e9rCIL4St5wz%2FhOSMMDBHRw1p04ajvTB%2BsKpuBoPfavhemRf5pZ1btvg33r37bLI%2FKnSj8i7ygNdDYQyxEmKtep46uVGeX70ylOnqyvuslyV9qc777z1qs9JvsJZNXJc1X1ehVlO%2BP1Uj7ZBizQgBO%2FtEoKafYfMqzkE3z4fUMVcnhWPgTsAxJpEbE3bGPb1zarDBtGFLlMzUW%2BkwfIszc04DyguK0YtFG1rYROpshH6G6pWICTe0UA8r1nsax4vll9EzGmn%2BdiW%2BpD%2F1zzEGsnvnJkcOLDOJOu7hpFVTL1EQnvs4usauAoE77XykIlIT8xGbiMy1m8uiFIvTt551gJKyg%2BouvOCkGnYzfP1VDrZvqDLnYmBrXNqJYsKTSRHwAR%2FIz8lilgAkC6dac7AljSPnR4yswjcfD0wY6pgGFQHYI22wtCr36NLy6Y91%2BzEx7k6K7iDrgUy4j09fc54wSTowNmIFpKtd20dTjGycCOM%2FkL3oMRD1DbbZLSw0DNBLce515B%2FCISHjDCFtOVtbNc6jT4EkDL4GZzvm5ps7zWT2%2BZO%2F3%2F1OF9z%2FvRe9%2F4NZhXNKnmAc0Zav7uwF9zfINDPEJI6sviIIAMwNMrtBWvTzoqz2mH9P3ymHXtqzr5zIMkuhi&X-Amz-Signature=81cb1d4cdabff467e7a50ebbdbf082c00ed19f46a3e89e3689cf07da407c30fc&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

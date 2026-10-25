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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466W3LXZNVU%2F20261025%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261025T200721Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEPz%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIEYRAf8ZUP84P8ZEXHKeZPlG%2BfIXPFE%2BvXeM7suLlNEGAiAZbPeM15elR9vd%2BTEZ5nyDJk6bCXgZEix8N4C4r4niSCqIBAjE%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMPajP5vh6bFyeDlPyKtwDpLgkxlwRHmuf5dp7biEY0AK34ggJXpRho4w1ZCNQr7k8ON4nRrm66Tk%2FtGvTRDSkPFCtMUzDFrEx4Cuh9WEavb29fB2xqy6inTVgLqr0mDlEzRbuWpeD2cdlYaf2bzShIJtyYj0CJclSAkx2uRFIAlD2Cqe7FPMNpIz6r826ts7IobsovkJcf4qAc%2FkWayN8Bt7hjW4ygmBs4NjDbZeHKP4eKm%2Bc3f%2BU8%2BDe4YFE5k4p0N8HPjpZazsOYLU%2BdUb0hsiyIj2Sikg2dHgxpjrflCiBhYtef5w2FY%2BP2wZa9qcnoF%2BpcjTwfN5jR8V43x2EwKsnWiN8mXfK28dicIxpy4usp7gtSk9DLe8AsosFrSrj52lZf0sqWmpCbxU8yAxBglnmgqMXPxAL8533pXNEhN2bTimUbPIbx9nq2IRiS0wGytPaSrutsGUDpcJYZu%2FMlJ4OFO126IWrFp4vebmUQmnTLZlg0a1zv5%2FjWaSXogrRj6xwOPnjydOqa%2Fyeym3GUVgR1Du7c0Mls6HGAwJsX1y0CPsSYmEyRCKD1dsKzWvZQ3huxVa0k43%2FCF2ckeXlgokTOSsCrBmPhaqMGo1t166hZbXqwA1zHjzwzcxLY2lfkq874Upi3G%2FRqcww%2F6%2F51gY6pgFvSdk%2FhX8WvTuUTZD1SvBFkIhKrMBtXftwHQvKaZig98OJbZr9FclPLv%2B6PbinjceTi7hEBMS6Nwilr9zDeriMP91%2Fqv3nU6YDy7lVVQIxqw7iuULeud5ldsHETq3Z9ee4DUqhvyNKWuRc0%2BAIWmZ7yZ%2FIJyyYuVXT%2FUYKM45onP4AtHczyNCzyHby%2FtbavqyY3uH1vtJnsQ4G3vzTxGOnahzyum3S&X-Amz-Signature=25084039ab6e5dc5298006a570ebfcf3dd318c3bf995fa2147af14d6a96071d6&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466W3LXZNVU%2F20261025%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261025T200721Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEPz%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIEYRAf8ZUP84P8ZEXHKeZPlG%2BfIXPFE%2BvXeM7suLlNEGAiAZbPeM15elR9vd%2BTEZ5nyDJk6bCXgZEix8N4C4r4niSCqIBAjE%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMPajP5vh6bFyeDlPyKtwDpLgkxlwRHmuf5dp7biEY0AK34ggJXpRho4w1ZCNQr7k8ON4nRrm66Tk%2FtGvTRDSkPFCtMUzDFrEx4Cuh9WEavb29fB2xqy6inTVgLqr0mDlEzRbuWpeD2cdlYaf2bzShIJtyYj0CJclSAkx2uRFIAlD2Cqe7FPMNpIz6r826ts7IobsovkJcf4qAc%2FkWayN8Bt7hjW4ygmBs4NjDbZeHKP4eKm%2Bc3f%2BU8%2BDe4YFE5k4p0N8HPjpZazsOYLU%2BdUb0hsiyIj2Sikg2dHgxpjrflCiBhYtef5w2FY%2BP2wZa9qcnoF%2BpcjTwfN5jR8V43x2EwKsnWiN8mXfK28dicIxpy4usp7gtSk9DLe8AsosFrSrj52lZf0sqWmpCbxU8yAxBglnmgqMXPxAL8533pXNEhN2bTimUbPIbx9nq2IRiS0wGytPaSrutsGUDpcJYZu%2FMlJ4OFO126IWrFp4vebmUQmnTLZlg0a1zv5%2FjWaSXogrRj6xwOPnjydOqa%2Fyeym3GUVgR1Du7c0Mls6HGAwJsX1y0CPsSYmEyRCKD1dsKzWvZQ3huxVa0k43%2FCF2ckeXlgokTOSsCrBmPhaqMGo1t166hZbXqwA1zHjzwzcxLY2lfkq874Upi3G%2FRqcww%2F6%2F51gY6pgFvSdk%2FhX8WvTuUTZD1SvBFkIhKrMBtXftwHQvKaZig98OJbZr9FclPLv%2B6PbinjceTi7hEBMS6Nwilr9zDeriMP91%2Fqv3nU6YDy7lVVQIxqw7iuULeud5ldsHETq3Z9ee4DUqhvyNKWuRc0%2BAIWmZ7yZ%2FIJyyYuVXT%2FUYKM45onP4AtHczyNCzyHby%2FtbavqyY3uH1vtJnsQ4G3vzTxGOnahzyum3S&X-Amz-Signature=1a38db81ead62b7fdba46badee46d56b3afdf63a900ec4670c7606ca25473c00&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

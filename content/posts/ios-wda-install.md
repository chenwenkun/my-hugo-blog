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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4662YNLC4GM%2F20261027%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261027T024955Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEBsaCXVzLXdlc3QtMiJIMEYCIQCgUmQva3qRZFtmjXxLkaTZk3U5uPVPPT6vDBUBNPBwNwIhALSaPrNfMlcj9q6d0w80jbHBij%2Bzev9tpsO7G7YO8wYIKogECOP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgxcVXFtica2tQxfssQq3AMq5K%2FtrKOGs8%2BWoe2gC01puG6Pyo6AcKbC4kuFI%2BHQqsgxIqr7s5ce2rfUbUtmQyELyQ3emoe%2Bd5T24%2FI27DU1yzjM3lkOT1I3njJf%2F8uy38IMQPz%2B75xglEZQf%2BBsYYFDjfnD1j3nWniKIK0PCvX3ORiQXBHOm%2BRGP7rox5NXDCG3QwYN7a2QGJUvlhTBY71oO8KrzkZZCha%2Bwu4UNmol3bIQ44kBOQDF9zvVK0lvhZ28frFsgEpNnC8OFkVOx98GRIanSPqU6%2FlMVXEUpSAafXtLIjw2iEqYhlUV6reyv4Mt38YQcdxvSBAqmYb2x5s2DMu2DfpLi7vsm13Nok%2FB%2BjGZYeV2eGqMiE6HpbfNwEZlV%2BsKvjWwUSysTHDWC%2Fc6lMCc3%2BqWkbeZak3AY2GCD3jRZW3XEPGexSr%2BV%2F%2FffZM3lQciDa8D%2FOIwjW7DaquOZu4Zu44gHObtAkU%2BpckANl1rG02SFmHeg0vS%2F2C%2FHFnE%2Fih9OVTkDTDQtgF5Tuxcoe7wTOnDnuu2m0fUWcQ%2Fj0o%2FKuHqE3WTxRG85wY8prWOs7raVHqW%2BRAaYBqdLgqc5eZBZSkOnN7kOk%2FjYuD5Mm8a9LMZ0GxZrhcbKPtHECZiCX5CtYY7awxx2TCrloDXBjqkAf9ItmBbn1DI833WKVa5SdNCuaj%2Fn2e0qQZLLwilRiyUj1a9%2FFGaE0THRbTuI9WJwcBKhZiSIAelZbZawFCDLJH2wiaY6kk1i1atmwiv%2Bn8inTJWFVrlhC%2BgRYm1yuf2Z4nfGsa2I2LXdWMf7E2q5U3i7CyzG2t3jQ%2FXwnDslML2JoGXn472tt0%2FKb%2FOJZu4tOCb9GlaPhqgoS2R6v24fBR%2BEUX5&X-Amz-Signature=b83c5a6b0e61c75d560c2a31f6a73a77ab7c21586eb0fa8a5c581f4b815b6eb4&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4662YNLC4GM%2F20261027%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261027T024955Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEBsaCXVzLXdlc3QtMiJIMEYCIQCgUmQva3qRZFtmjXxLkaTZk3U5uPVPPT6vDBUBNPBwNwIhALSaPrNfMlcj9q6d0w80jbHBij%2Bzev9tpsO7G7YO8wYIKogECOP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgxcVXFtica2tQxfssQq3AMq5K%2FtrKOGs8%2BWoe2gC01puG6Pyo6AcKbC4kuFI%2BHQqsgxIqr7s5ce2rfUbUtmQyELyQ3emoe%2Bd5T24%2FI27DU1yzjM3lkOT1I3njJf%2F8uy38IMQPz%2B75xglEZQf%2BBsYYFDjfnD1j3nWniKIK0PCvX3ORiQXBHOm%2BRGP7rox5NXDCG3QwYN7a2QGJUvlhTBY71oO8KrzkZZCha%2Bwu4UNmol3bIQ44kBOQDF9zvVK0lvhZ28frFsgEpNnC8OFkVOx98GRIanSPqU6%2FlMVXEUpSAafXtLIjw2iEqYhlUV6reyv4Mt38YQcdxvSBAqmYb2x5s2DMu2DfpLi7vsm13Nok%2FB%2BjGZYeV2eGqMiE6HpbfNwEZlV%2BsKvjWwUSysTHDWC%2Fc6lMCc3%2BqWkbeZak3AY2GCD3jRZW3XEPGexSr%2BV%2F%2FffZM3lQciDa8D%2FOIwjW7DaquOZu4Zu44gHObtAkU%2BpckANl1rG02SFmHeg0vS%2F2C%2FHFnE%2Fih9OVTkDTDQtgF5Tuxcoe7wTOnDnuu2m0fUWcQ%2Fj0o%2FKuHqE3WTxRG85wY8prWOs7raVHqW%2BRAaYBqdLgqc5eZBZSkOnN7kOk%2FjYuD5Mm8a9LMZ0GxZrhcbKPtHECZiCX5CtYY7awxx2TCrloDXBjqkAf9ItmBbn1DI833WKVa5SdNCuaj%2Fn2e0qQZLLwilRiyUj1a9%2FFGaE0THRbTuI9WJwcBKhZiSIAelZbZawFCDLJH2wiaY6kk1i1atmwiv%2Bn8inTJWFVrlhC%2BgRYm1yuf2Z4nfGsa2I2LXdWMf7E2q5U3i7CyzG2t3jQ%2FXwnDslML2JoGXn472tt0%2FKb%2FOJZu4tOCb9GlaPhqgoS2R6v24fBR%2BEUX5&X-Amz-Signature=c5f5aa9ab1bb789f8ffadf5e8751802eb2229635741b89b09e42ee4b51acfa81&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

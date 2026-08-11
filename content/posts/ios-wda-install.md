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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466SZD6CS6Q%2F20260811%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260811T123916Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEOz%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIH%2FY8l8ItTUl2a7bx2YQ4wbK81iHxzwEcXgdCWD6dIszAiAnIm2YLlHXWplpyH9UfmETJZapBFPvtlmQVZbfrEUGXSqIBAi1%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMETYIDruq1%2Bw6ZCqkKtwDn%2F%2BI7i2AVMY8kRjKyTzxcY7U5G0tFInV6qVWvC22hgRVtsTTVFiV0bBcxi3awRz7i6VBtXZXvf%2FvpjDCl3ZiGSkjnZajW1jdwLhAaxqh4fhshIV7FXIZ21Co5%2B992%2FUuYEATo0fBwUG5TGSHNEXNDsDjosR6%2Fsa4p3L1m%2FrdMfA%2BeSJ3Hi6K3XyBe0iGMEDwr4gVCieF%2FaknS16xrdmea42Krtfcpf%2FilhjEBHdnDN%2BRVtYco5SXplIDFmFNiJLMpLyT2im6urIawPtbAo2Ynx%2FoldARL2SpvszcfOgGAJqkrugbLPOxsu6n7o5Pn9QOe%2FB6zA7Cqn6SUs%2B3ureAIvFZ0A7t0%2B9u5bH6%2FUpN24n2pm7IJNWIL5CMEfR8vPvP3%2B5SkMS91q9e5C%2BBiGjCkeXTp5fxOXwmo34jA9qSZAjJr5SOHbn%2FJ7WEWb15wlk%2BwO9Le%2FhuoPbdOsK8Q%2FE%2FQ1G%2F1beMxnJmxk%2FKQbG56PpBjqqay3kAj6xRizLltG8j3IwVbumQPxZtsmqNVnHxzSvFdexdDca%2Fd%2BvMpYrtqwlSl%2Bv%2BSnZ00lTmf5kxGokEMY%2BiUtcUvojyG8iEHk%2BaZatTH3Sdckhls4L6rdCKLAjyrJHqbadmYx1BRvgw2Zbs0wY6pgFDF1%2FG%2BFwKoZOgr%2B8337iZl3dIIzMqg21FIk%2BINGu%2F3zXr51FK18HJsb7g5Doq6tcaFGsjbJOE0UQ4jTvhpr1r2T%2FDg3sLGHAYcJudVGRKXGrlHyv%2BohmUDXatqsBSdX89sZb2Djl%2FZGxQE5EoV6zgYnctBo7%2Fnfemnm%2FPSzWlrs0IE03cGxsMM2V5Y9RXzU4FxLT5d2RPK89G2I%2FRvC1qR0JbHbSp&X-Amz-Signature=95e443467c8c1d1f6d19e8847c1a27dca69249fede734dd37b6eb5b69260edc7&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466SZD6CS6Q%2F20260811%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260811T123917Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEOz%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIH%2FY8l8ItTUl2a7bx2YQ4wbK81iHxzwEcXgdCWD6dIszAiAnIm2YLlHXWplpyH9UfmETJZapBFPvtlmQVZbfrEUGXSqIBAi1%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMETYIDruq1%2Bw6ZCqkKtwDn%2F%2BI7i2AVMY8kRjKyTzxcY7U5G0tFInV6qVWvC22hgRVtsTTVFiV0bBcxi3awRz7i6VBtXZXvf%2FvpjDCl3ZiGSkjnZajW1jdwLhAaxqh4fhshIV7FXIZ21Co5%2B992%2FUuYEATo0fBwUG5TGSHNEXNDsDjosR6%2Fsa4p3L1m%2FrdMfA%2BeSJ3Hi6K3XyBe0iGMEDwr4gVCieF%2FaknS16xrdmea42Krtfcpf%2FilhjEBHdnDN%2BRVtYco5SXplIDFmFNiJLMpLyT2im6urIawPtbAo2Ynx%2FoldARL2SpvszcfOgGAJqkrugbLPOxsu6n7o5Pn9QOe%2FB6zA7Cqn6SUs%2B3ureAIvFZ0A7t0%2B9u5bH6%2FUpN24n2pm7IJNWIL5CMEfR8vPvP3%2B5SkMS91q9e5C%2BBiGjCkeXTp5fxOXwmo34jA9qSZAjJr5SOHbn%2FJ7WEWb15wlk%2BwO9Le%2FhuoPbdOsK8Q%2FE%2FQ1G%2F1beMxnJmxk%2FKQbG56PpBjqqay3kAj6xRizLltG8j3IwVbumQPxZtsmqNVnHxzSvFdexdDca%2Fd%2BvMpYrtqwlSl%2Bv%2BSnZ00lTmf5kxGokEMY%2BiUtcUvojyG8iEHk%2BaZatTH3Sdckhls4L6rdCKLAjyrJHqbadmYx1BRvgw2Zbs0wY6pgFDF1%2FG%2BFwKoZOgr%2B8337iZl3dIIzMqg21FIk%2BINGu%2F3zXr51FK18HJsb7g5Doq6tcaFGsjbJOE0UQ4jTvhpr1r2T%2FDg3sLGHAYcJudVGRKXGrlHyv%2BohmUDXatqsBSdX89sZb2Djl%2FZGxQE5EoV6zgYnctBo7%2Fnfemnm%2FPSzWlrs0IE03cGxsMM2V5Y9RXzU4FxLT5d2RPK89G2I%2FRvC1qR0JbHbSp&X-Amz-Signature=dc7073473e0ce8487d99ba24805beb060e97e5653a3c465396b0f79cd61cb10f&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

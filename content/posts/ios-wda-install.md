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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466XKE77P2N%2F20260928%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260928T022900Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEGEaCXVzLXdlc3QtMiJHMEUCIEZDZ8Dc1BCK6Idl7UJ%2BXnu5IDzcu7d%2FuqtD%2BZIoFAjnAiEAlEz6N8p3hVCeiotS05DSB5YDLvVBHaeFx4yrXqaUzbMq%2FwMIKhAAGgw2Mzc0MjMxODM4MDUiDMe0WtllDP2wMXwvpyrcA8CcTvuQIc%2BcTjoAzq6FrTxX%2B8WTCvhY4Y2LsOTtFhz5JJtDNiVr9EV70ADvSYSFuHDvnbdVWwgHxktHA2EJeNjL3oLmJNJ7CXycG2iOJGSmP4N8hDChhxjfLR4eWXoK%2FOcCLLfTWT2qYW9KxQxf2JR%2Fc%2BtxooszzD8cXrkk94Uj5Z%2Fi8IkY2rCz%2BGIQE4UusVa%2B1K1n0q3zacE3dJCxLo9yd3gbWEvxPOqRm%2FqinA9gHTx23gYJj80C1FTac6b8INSy8MTDGwAnji2vCwT8h7mI2hIQvnnkP5kvQEIKXNAvDYtb0oVhRROcZsjK2hSVzoabrCeEBAYtQJxO%2FcH%2FPpHxyk0idD%2BP2uVk4KO%2B7%2FBKkkFAUNyRBam3A%2FbMU9XgcCV1%2BSyKPFzjPpq916PK9kl9puJznW6oS%2FWnTOAw%2B1FKilSqqH%2FpdzwvbOoxPJcsKLt1YBs4ilYHSy2TVdH3eHqUNzZgvwiHbj%2Bs2ZoLru0ILwdjiaoio0%2BYyhm%2FpLxIY0jnRrxbY6wgzGXZ35%2B9ruv%2F8T52y9WWnVw98Xx9v6W3FMFdiLhx0H8HaKmAMPAdn0AWHsS%2BYJlanAngJWS7ExCei7BYX6OlhcbHuQDiB2s3rBmlUWxE4lvX0CXbMMf95tUGOqUBUh%2FvHR3fEGHxfZqnQMAqrNTsm8JJXsvSf472EZTnoKXtdpPL0wD5kQ2L%2FVQHtnzXuQHW%2FTPJmJOfG8tBdjI0r9Lo1eSeEJWxhdOEt1iI7PUCa81DiUaranSTLYQN3H5av0TdZ%2FuBeyrs5yX8b5gS1eCE9s2IgM%2F8QIkGsBd0NJd9Z8YKACiRCC%2FHyK0YZb%2BWjcH1ELCBAxs7ImsyGAbZPTUS9sS3&X-Amz-Signature=14e9dd71651d245790bf7712282f6e17f6c187333f30ba63501debe9f313825e&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466XKE77P2N%2F20260928%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260928T022900Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEGEaCXVzLXdlc3QtMiJHMEUCIEZDZ8Dc1BCK6Idl7UJ%2BXnu5IDzcu7d%2FuqtD%2BZIoFAjnAiEAlEz6N8p3hVCeiotS05DSB5YDLvVBHaeFx4yrXqaUzbMq%2FwMIKhAAGgw2Mzc0MjMxODM4MDUiDMe0WtllDP2wMXwvpyrcA8CcTvuQIc%2BcTjoAzq6FrTxX%2B8WTCvhY4Y2LsOTtFhz5JJtDNiVr9EV70ADvSYSFuHDvnbdVWwgHxktHA2EJeNjL3oLmJNJ7CXycG2iOJGSmP4N8hDChhxjfLR4eWXoK%2FOcCLLfTWT2qYW9KxQxf2JR%2Fc%2BtxooszzD8cXrkk94Uj5Z%2Fi8IkY2rCz%2BGIQE4UusVa%2B1K1n0q3zacE3dJCxLo9yd3gbWEvxPOqRm%2FqinA9gHTx23gYJj80C1FTac6b8INSy8MTDGwAnji2vCwT8h7mI2hIQvnnkP5kvQEIKXNAvDYtb0oVhRROcZsjK2hSVzoabrCeEBAYtQJxO%2FcH%2FPpHxyk0idD%2BP2uVk4KO%2B7%2FBKkkFAUNyRBam3A%2FbMU9XgcCV1%2BSyKPFzjPpq916PK9kl9puJznW6oS%2FWnTOAw%2B1FKilSqqH%2FpdzwvbOoxPJcsKLt1YBs4ilYHSy2TVdH3eHqUNzZgvwiHbj%2Bs2ZoLru0ILwdjiaoio0%2BYyhm%2FpLxIY0jnRrxbY6wgzGXZ35%2B9ruv%2F8T52y9WWnVw98Xx9v6W3FMFdiLhx0H8HaKmAMPAdn0AWHsS%2BYJlanAngJWS7ExCei7BYX6OlhcbHuQDiB2s3rBmlUWxE4lvX0CXbMMf95tUGOqUBUh%2FvHR3fEGHxfZqnQMAqrNTsm8JJXsvSf472EZTnoKXtdpPL0wD5kQ2L%2FVQHtnzXuQHW%2FTPJmJOfG8tBdjI0r9Lo1eSeEJWxhdOEt1iI7PUCa81DiUaranSTLYQN3H5av0TdZ%2FuBeyrs5yX8b5gS1eCE9s2IgM%2F8QIkGsBd0NJd9Z8YKACiRCC%2FHyK0YZb%2BWjcH1ELCBAxs7ImsyGAbZPTUS9sS3&X-Amz-Signature=2517f90cc2d4e53a94e8099e5a5e80b95ad894a23163175b0d20d2d799017acf&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

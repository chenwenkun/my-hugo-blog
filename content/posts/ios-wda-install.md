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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466QHIKXKZL%2F20260822%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260822T003621Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEOj%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCNgJ0hUvYBa75OxTbW8ky6epKgcel%2FWkx%2Fm1jQh1c5PAIhAJJtlj2zDDDnIKsGEb22EG5Bg3Yg%2BU8DnPtxJXjQ3AnHKogECLH%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgyOhrVl7CaR9V9AAXcq3AP%2BMb8NNLwivKKCNS6t2j%2Bl97Xo0p58LqeetMvdnWG8uAHhHecp1pmjhEfzrPBQsvzckFZvGQ1haAVl1KuDoj2%2FU8iUgIvKB9QWulQBFpnQZcmK%2F%2BtlVkEOM0qxssKiV44w2EQadNfAQyjewgZiTjd8c%2BMqvgl4ihj5Dk6r%2F1Fp%2FuHcqAf9xQt448Z%2BKLQx5a9VQEcX3pVrDSkzKwCJ0BM3bDpDYJ9eEsz20n5mzMwCcRl%2F24QoswLZOOtyjZhv1GgZCQN0f2afm8zCJpz50u7bDMC0sAC46KZW3mF%2B9EvZJTgEcL5AIO6yKofmt%2B3RIKEI%2F7AFe1hwD4aHW5X8m2LAht0CKmSKqrKt78G7X35h2%2BfMJ7TB4Go7C6XicGYIV%2BsIJzlsjf%2B%2FkoM7K9uymF0eo3eGFIPpZeEtGP9lv4tElBrXcxK16VT3bpK5RZFzpdk2%2BvUAKzLflnsDncUp40hHN82gFA7z9Tdhkk2AC6%2BbmbK7Pafro9MxfqvCBprfxti7xI6uCwLqfbRp%2BdPVP7ZwFtbS6AZsLALpxzq7H8B2eyr%2BNYjzo5%2FjwK8lL09Df%2FFFBnksUBKJUqiYKooPpj9iZRZsLnloV%2BNkJloDf3mvdlaKij0aH0JtoFfiojDuxKPUBjqkAbN2BCgdUr5kcGfP1vEQc9yngI0siM6y0dojaMgORRaks%2Bz0xl9hqWD92OPvdrIRqNnLvPjcj99lhk13jXGUoTtqhh%2B7OERl%2FTBx%2F%2BQNx3rIF3AokpUXaSyeusuUNeNTnRLSfYMckFhcWdFVGkJoGbrDZ5ctPv3IajWdGcw4OFzkCRuPy1DmP%2B7RXDJvXP2%2F1vJoYElqwnEy9uS6LKCCHtzmmb2U&X-Amz-Signature=9525fb31ddf4323193109dc9e585ad95bf40d6c0a5082394025df220e9134b96&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466QHIKXKZL%2F20260822%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260822T003621Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEOj%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCNgJ0hUvYBa75OxTbW8ky6epKgcel%2FWkx%2Fm1jQh1c5PAIhAJJtlj2zDDDnIKsGEb22EG5Bg3Yg%2BU8DnPtxJXjQ3AnHKogECLH%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgyOhrVl7CaR9V9AAXcq3AP%2BMb8NNLwivKKCNS6t2j%2Bl97Xo0p58LqeetMvdnWG8uAHhHecp1pmjhEfzrPBQsvzckFZvGQ1haAVl1KuDoj2%2FU8iUgIvKB9QWulQBFpnQZcmK%2F%2BtlVkEOM0qxssKiV44w2EQadNfAQyjewgZiTjd8c%2BMqvgl4ihj5Dk6r%2F1Fp%2FuHcqAf9xQt448Z%2BKLQx5a9VQEcX3pVrDSkzKwCJ0BM3bDpDYJ9eEsz20n5mzMwCcRl%2F24QoswLZOOtyjZhv1GgZCQN0f2afm8zCJpz50u7bDMC0sAC46KZW3mF%2B9EvZJTgEcL5AIO6yKofmt%2B3RIKEI%2F7AFe1hwD4aHW5X8m2LAht0CKmSKqrKt78G7X35h2%2BfMJ7TB4Go7C6XicGYIV%2BsIJzlsjf%2B%2FkoM7K9uymF0eo3eGFIPpZeEtGP9lv4tElBrXcxK16VT3bpK5RZFzpdk2%2BvUAKzLflnsDncUp40hHN82gFA7z9Tdhkk2AC6%2BbmbK7Pafro9MxfqvCBprfxti7xI6uCwLqfbRp%2BdPVP7ZwFtbS6AZsLALpxzq7H8B2eyr%2BNYjzo5%2FjwK8lL09Df%2FFFBnksUBKJUqiYKooPpj9iZRZsLnloV%2BNkJloDf3mvdlaKij0aH0JtoFfiojDuxKPUBjqkAbN2BCgdUr5kcGfP1vEQc9yngI0siM6y0dojaMgORRaks%2Bz0xl9hqWD92OPvdrIRqNnLvPjcj99lhk13jXGUoTtqhh%2B7OERl%2FTBx%2F%2BQNx3rIF3AokpUXaSyeusuUNeNTnRLSfYMckFhcWdFVGkJoGbrDZ5ctPv3IajWdGcw4OFzkCRuPy1DmP%2B7RXDJvXP2%2F1vJoYElqwnEy9uS6LKCCHtzmmb2U&X-Amz-Signature=854e327e1d25755f7c3bf6097d69bde8ec3a0e79414c9731b51f7ef34d5c852f&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

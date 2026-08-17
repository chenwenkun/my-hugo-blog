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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466YRXHEKSF%2F20260817%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260817T182137Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEIL%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQCgFXRD3qV8W63NXUl0rYRogYcwC1sbZwF0IfivN5ZmYQIgcwWqFIRhE6TGcKG%2BH%2FggEaFDdjEWR6F06CWds0Q4BsQq%2FwMISxAAGgw2Mzc0MjMxODM4MDUiDJ75K%2BLMvB1ZfUKD8ircA%2F1Tq50%2B8vz8EU7jjCO%2BNMsZMDCB1dVLLgVrCs8oLn42qyl%2Bvg7h8CTLkIBOxJe9D%2F1AyHX2FKYh%2BbUaVbpHSJX0H%2Btnp6yPEyRXJr3m2kZzedKoX7SkJdxrCGCfdaeEf2gFR4CwijiBEICw5KUXahdEVZV8ulMdHHMzQsbyzUeBXHebk%2Fahtd%2BUhVXz19UB5HQODQ5oJ%2BFh3AeCvu%2FdiM%2FCVGIFtGHK1qVFjr0csDlruLQQETfC9bHDM8VNaKz7K3nhyEL3MrP5aLoGKWsbQwmgFZQ%2FnZCh%2BHI8a%2BCXPahUuap5P6RleK9glboSjnMSHf8A2sz9vc1idnbXgCmL%2BF1sS1lzPVQew%2Fys9uElG6P%2FxbCxSLqH599ky71ijIx93L7btNTHwO9K%2FdAKYRsbCX0W5qJA8vIaUJyJA4jg3oXb9RMnTvq4Bxk9mUGCf84IFYnnyYXqlTaraiaps5ePL6VJnrqIWNUUexHZyVg3cPEWZrU8nLjQ8PBBCL3JRoDzP%2FT2Kj%2BuhXKeCtP5UZwYrxUSyR7lpCfKUZOOavJOqNDEuVm1zc1aYY2EdemsGu7JBU8sumRQT9dRxOIkYk36wbhRXtOvY%2B7Ili4z8OorbY5wQaVtRqvNO8cT0vYDMPqUjdQGOqUBV8uO70Vmn3nq4YiQYbWI6Rcr1M7cS19bp3FJZqL%2FARfH2qFPftslaAcNVEoWcqR6Dgtvyt6xJwddUBRYL5UvtXw3s7KBUQeIyWgj%2Fqebf74JGKXcWpaFXCT8kp7Yz%2BAapTKr32rGuW1%2FNBYYIJASdEjgJTuLg%2BCmE4oO2SnyZbWbxt74l4f3r4DEr8bK58qRo8RQvZSHW3vDuWqUHXSVACQbzCCW&X-Amz-Signature=4d6d6d8d1f67c83f17b5e0e8b9ef8240d4414682b2cfa2d58be00a80e36c880d&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466YRXHEKSF%2F20260817%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260817T182137Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEIL%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQCgFXRD3qV8W63NXUl0rYRogYcwC1sbZwF0IfivN5ZmYQIgcwWqFIRhE6TGcKG%2BH%2FggEaFDdjEWR6F06CWds0Q4BsQq%2FwMISxAAGgw2Mzc0MjMxODM4MDUiDJ75K%2BLMvB1ZfUKD8ircA%2F1Tq50%2B8vz8EU7jjCO%2BNMsZMDCB1dVLLgVrCs8oLn42qyl%2Bvg7h8CTLkIBOxJe9D%2F1AyHX2FKYh%2BbUaVbpHSJX0H%2Btnp6yPEyRXJr3m2kZzedKoX7SkJdxrCGCfdaeEf2gFR4CwijiBEICw5KUXahdEVZV8ulMdHHMzQsbyzUeBXHebk%2Fahtd%2BUhVXz19UB5HQODQ5oJ%2BFh3AeCvu%2FdiM%2FCVGIFtGHK1qVFjr0csDlruLQQETfC9bHDM8VNaKz7K3nhyEL3MrP5aLoGKWsbQwmgFZQ%2FnZCh%2BHI8a%2BCXPahUuap5P6RleK9glboSjnMSHf8A2sz9vc1idnbXgCmL%2BF1sS1lzPVQew%2Fys9uElG6P%2FxbCxSLqH599ky71ijIx93L7btNTHwO9K%2FdAKYRsbCX0W5qJA8vIaUJyJA4jg3oXb9RMnTvq4Bxk9mUGCf84IFYnnyYXqlTaraiaps5ePL6VJnrqIWNUUexHZyVg3cPEWZrU8nLjQ8PBBCL3JRoDzP%2FT2Kj%2BuhXKeCtP5UZwYrxUSyR7lpCfKUZOOavJOqNDEuVm1zc1aYY2EdemsGu7JBU8sumRQT9dRxOIkYk36wbhRXtOvY%2B7Ili4z8OorbY5wQaVtRqvNO8cT0vYDMPqUjdQGOqUBV8uO70Vmn3nq4YiQYbWI6Rcr1M7cS19bp3FJZqL%2FARfH2qFPftslaAcNVEoWcqR6Dgtvyt6xJwddUBRYL5UvtXw3s7KBUQeIyWgj%2Fqebf74JGKXcWpaFXCT8kp7Yz%2BAapTKr32rGuW1%2FNBYYIJASdEjgJTuLg%2BCmE4oO2SnyZbWbxt74l4f3r4DEr8bK58qRo8RQvZSHW3vDuWqUHXSVACQbzCCW&X-Amz-Signature=994dc88b01e358231fa2ce7eaefeca5c8e22e945f65d71fc88f2e3dfd9162e58&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

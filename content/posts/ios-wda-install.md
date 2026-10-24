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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466ZNMT7FHR%2F20261024%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261024T022558Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjENH%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIDCAFVJ2bzEz8id88hjww2Nx8cbIiYbeJ6BcJeguXw5qAiBSbfd7IQMYkaAxURlU17xrWKKcbe5meB7Nv%2Bs%2BkFq9TyqIBAia%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIM0Y6pPLFMglyk43tbKtwD0feKk3cUaj2GU9rIgtUI%2BlDt2N5nIwqMBec0F%2BnVuONClILuMMRmoG8hI57qyNW%2B%2F1z1GM1WsIUzkd6hUUqdO9WfgdHgIu4SKF0HQChNhOO1i7cpiZQY%2F3%2BIlrj6fNp0r9Vy9QFTHKOXziLESUxZ1hZER301hywK5fYY33Dru4cb8k%2BjkzWMlWSHwHg01zLHZgDNWRkOpaYgzaf4Cmda%2FZg8veRlsB80N7PZNA9PQW7AVrgVAHulQ%2F4aQDsJhd7%2Fth2xJNcdpEyN0WWw7moXxq3LVPZ8r7GjKmC1LqrhBMLYLxB13tB9JOZI8Dp1WiSYpm0VmjCJ7mE%2FJFjZxoNFUREk2JcHjDaS0mxUspb%2Bcuqr8tTQqTbjP%2Bl4WobXgbUFIKjjCSZrbxFjKUXMrO%2B0xm00TbU0Tc8CFDq0OFvbsf0EYa204Nrr%2Bon74zA5f1gHsIN4cElLIzZVhlAJz1fMfW17GX4jOceX4h3%2BU9IHd2opizbGYSizdIk96cQgYIVA3EV%2F42hTe5kwNAHlwCGmvO5j%2BBE6AgagDOD5%2FJUaUbbWx7FYhT3ij961kLrpW0ivFr%2BMzBe34aHMK7vJQ8U1jw4yiryJr50k43w%2Bb%2B7GuJPSldd5D%2BwCj%2B4BOdow4Yzw1gY6pgHGqlT3qOYivbHbbGmyPa%2FnIIXyhYhcNpVNtzxtFhcV6EIvxQvOpxI1yx1okZnJxfL4RYQeA943%2F9l241Dup4cAB0yiKUKfeQE4cp%2FherA61XDS9JahuxbmA4BS4qM9X7hBDQWc80pEKX7u4Jf4fLc25UgbNz7n0ufGnUrtFzFil6xiYAt6Qj%2F7saIQFBvxxRXTZlgo2mF%2F7YnunzC73Lrtd1CcpFb3&X-Amz-Signature=ccfe4617b5a6eaa957a01dfd3d2eca6cdb87cb353e38db5bd0d782d766067f9f&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466ZNMT7FHR%2F20261024%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261024T022558Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjENH%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIDCAFVJ2bzEz8id88hjww2Nx8cbIiYbeJ6BcJeguXw5qAiBSbfd7IQMYkaAxURlU17xrWKKcbe5meB7Nv%2Bs%2BkFq9TyqIBAia%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIM0Y6pPLFMglyk43tbKtwD0feKk3cUaj2GU9rIgtUI%2BlDt2N5nIwqMBec0F%2BnVuONClILuMMRmoG8hI57qyNW%2B%2F1z1GM1WsIUzkd6hUUqdO9WfgdHgIu4SKF0HQChNhOO1i7cpiZQY%2F3%2BIlrj6fNp0r9Vy9QFTHKOXziLESUxZ1hZER301hywK5fYY33Dru4cb8k%2BjkzWMlWSHwHg01zLHZgDNWRkOpaYgzaf4Cmda%2FZg8veRlsB80N7PZNA9PQW7AVrgVAHulQ%2F4aQDsJhd7%2Fth2xJNcdpEyN0WWw7moXxq3LVPZ8r7GjKmC1LqrhBMLYLxB13tB9JOZI8Dp1WiSYpm0VmjCJ7mE%2FJFjZxoNFUREk2JcHjDaS0mxUspb%2Bcuqr8tTQqTbjP%2Bl4WobXgbUFIKjjCSZrbxFjKUXMrO%2B0xm00TbU0Tc8CFDq0OFvbsf0EYa204Nrr%2Bon74zA5f1gHsIN4cElLIzZVhlAJz1fMfW17GX4jOceX4h3%2BU9IHd2opizbGYSizdIk96cQgYIVA3EV%2F42hTe5kwNAHlwCGmvO5j%2BBE6AgagDOD5%2FJUaUbbWx7FYhT3ij961kLrpW0ivFr%2BMzBe34aHMK7vJQ8U1jw4yiryJr50k43w%2Bb%2B7GuJPSldd5D%2BwCj%2B4BOdow4Yzw1gY6pgHGqlT3qOYivbHbbGmyPa%2FnIIXyhYhcNpVNtzxtFhcV6EIvxQvOpxI1yx1okZnJxfL4RYQeA943%2F9l241Dup4cAB0yiKUKfeQE4cp%2FherA61XDS9JahuxbmA4BS4qM9X7hBDQWc80pEKX7u4Jf4fLc25UgbNz7n0ufGnUrtFzFil6xiYAt6Qj%2F7saIQFBvxxRXTZlgo2mF%2F7YnunzC73Lrtd1CcpFb3&X-Amz-Signature=39ade9e27febbf1745c6df53e72244a1047d9fc685ed94581029081120334e84&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466USUVPOEJ%2F20260901%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260901T201645Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEOz%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCpv%2FFdCgGuCxZtJEuhBh%2BkTdqIov1P4M4zm8rBGLVcXwIhAPtTNT4edQ3k%2B8PrZi3%2FEZ1syEyOUEoBk%2FknKbaSTwnQKogECLX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgwhD7SE6%2BfGQfeHXpIq3AMaqBy3j6VTQFsMG0Fx2PpPUvmT%2F1jYuRDuUNggSSJGEXpOXlYcv0N%2F28eVuboCPExMcnMjoQIFgTnX7x1ZNfRHFkUqTYYZx2metUn7McSnygj7jPvLky%2Ba3eMs5hg57N54%2FKYqPyoxOJUoRr49UTOtRmTdLCtVZt05ffmIyh5bZhCcMwzwF05b1V5UB4yLFm5V5xEzSyPB2YU1vyL3cwIIh%2BRPPFPgJfhgbmtDE8bFR8obbYLNau%2BxeV5lVsFlheKJ75o5cOBHKQUgupkRGijLwHMDQVI%2Bdi7lbLu5JCEquZfniRm0VCk1TbCqEi08xUEc%2BOMnZhg7ejom0cbLsf6DzIGLSCHKWO1W2qqH1pLTeKm2FF697Jja6DyRmGp8J9R88Dk9INJwbwe7mxIUwSZx9TF9lFuP%2FlJ7m2xUn25pgDWO2vLG56wOls6Cr%2BXdJ2VPX%2FgU4RGEn2ZbWX2RVZRfokCMPJXzfFUetrZ4bTHqXa5Mls2GnD%2FTsADOJGB4GBtVJ9BWxY3tA01714Zr5cOM8s64jRY8XwG4gE1SA25FY3uItRo%2BDfztOpCW9Mj0kFSuQfLmRkE7tK10iAO5oOVfvteugUCe8zsYtNXlt0e7moUp0fIXyxwSXevBVzCE2dzUBjqkAXtMvsRach6%2F0M2T9%2BpYHBtKu8HjRpmZ9DVfa%2FihLb68vr8JqXvlfW2EcPUSBLaDxleUvzpVlBjObSElJJEfPvGqTWE4JalMFjOkypJAcANBPuohQhm%2FssZlqwZ1hyASwBRKAEgmjcKLSw5KO3DgGE3Dig146Db1v2kkt0zcxwVLIqPzuo0s2fhJrTRo3ILQNo7%2FW08I4iSD%2B9tgsj7LximwuRAU&X-Amz-Signature=bb56b23af3f23d001cb94ec8473b0791f1b7c0267814b707c4dda4650e5c25c6&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466USUVPOEJ%2F20260901%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260901T201645Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEOz%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCpv%2FFdCgGuCxZtJEuhBh%2BkTdqIov1P4M4zm8rBGLVcXwIhAPtTNT4edQ3k%2B8PrZi3%2FEZ1syEyOUEoBk%2FknKbaSTwnQKogECLX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgwhD7SE6%2BfGQfeHXpIq3AMaqBy3j6VTQFsMG0Fx2PpPUvmT%2F1jYuRDuUNggSSJGEXpOXlYcv0N%2F28eVuboCPExMcnMjoQIFgTnX7x1ZNfRHFkUqTYYZx2metUn7McSnygj7jPvLky%2Ba3eMs5hg57N54%2FKYqPyoxOJUoRr49UTOtRmTdLCtVZt05ffmIyh5bZhCcMwzwF05b1V5UB4yLFm5V5xEzSyPB2YU1vyL3cwIIh%2BRPPFPgJfhgbmtDE8bFR8obbYLNau%2BxeV5lVsFlheKJ75o5cOBHKQUgupkRGijLwHMDQVI%2Bdi7lbLu5JCEquZfniRm0VCk1TbCqEi08xUEc%2BOMnZhg7ejom0cbLsf6DzIGLSCHKWO1W2qqH1pLTeKm2FF697Jja6DyRmGp8J9R88Dk9INJwbwe7mxIUwSZx9TF9lFuP%2FlJ7m2xUn25pgDWO2vLG56wOls6Cr%2BXdJ2VPX%2FgU4RGEn2ZbWX2RVZRfokCMPJXzfFUetrZ4bTHqXa5Mls2GnD%2FTsADOJGB4GBtVJ9BWxY3tA01714Zr5cOM8s64jRY8XwG4gE1SA25FY3uItRo%2BDfztOpCW9Mj0kFSuQfLmRkE7tK10iAO5oOVfvteugUCe8zsYtNXlt0e7moUp0fIXyxwSXevBVzCE2dzUBjqkAXtMvsRach6%2F0M2T9%2BpYHBtKu8HjRpmZ9DVfa%2FihLb68vr8JqXvlfW2EcPUSBLaDxleUvzpVlBjObSElJJEfPvGqTWE4JalMFjOkypJAcANBPuohQhm%2FssZlqwZ1hyASwBRKAEgmjcKLSw5KO3DgGE3Dig146Db1v2kkt0zcxwVLIqPzuo0s2fhJrTRo3ILQNo7%2FW08I4iSD%2B9tgsj7LximwuRAU&X-Amz-Signature=5d8189447bd384d60b2c952e807698acb3a7b5465e9adb61c06f5c85f0bbaa18&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

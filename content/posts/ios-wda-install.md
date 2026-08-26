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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466SBIUS2DB%2F20260826%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260826T192907Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEFkaCXVzLXdlc3QtMiJHMEUCIDyYZvIjywwetUaOtJHdBMp1iBa0w04aQ5NmemKdV6tSAiEAguSd%2B84JFxMgYGS%2FkDvesPI9clpE5XJCwdjwaI0OfHQq%2FwMIIhAAGgw2Mzc0MjMxODM4MDUiDM3RJuxdwXUg0K8ALCrcA7qBfup4lb2KXjQXYHDPAY6pZV6xBGB0rzNLVxgF0sURfdBjPTyCyB8n7iU3oPW9kZnS6QvP6hlTFHzETwhP5Z5d6piyi73XuVw2rHzN%2B6YYl69vqVMLl3DBLiXGFpGgbUS17dvFvI9XFboEAjOLB0n3ZHyzZU7cFfF3%2Bi6w4VJYwgit1YThhYQ8c0SIP27w9vAunntMPSU8eMCVjnfHaZ5xpNdVHi1ssBuB00ylupBLZfSw2IUrWy45F2O3oz3Z5d1f4GfM8xGNe%2F5%2BIJacYEyY5sOtslU%2BcynunOSCufjhrsP8nZld0laPSyzkfjy8PaCl7ur4iDlpkjNR5ATnZM%2F7DcEKMRRFu%2FiHBEzBE9tX161Vi1Z76pjhL8aQQl6lrDcd6h9O%2F8HzINkv650iQmG%2FyPrCXLx3KrPvG1WMzFCizBQk67MVeS%2FyP%2F6xCPEHpAxw4F27yZ%2FVX2L2O86l2DKOMEfvNnP9R6Tn5mXx0GDO3kSqJSve7l0CmbEc1o5b4xzwVjNnkAW4KUMANKhyMf6WOZcXBzVE7h0xfAiEdGWby%2Fh9KZ1EROjYyudH1Zs4MC5Ko0X8hL6OiEjoLQZlL9g1DO5C%2B7%2BWsXnm2LcaC8HagluDm9CNORVZ%2Bu%2BYMOe4vNQGOqUBAyqc2azVhpr%2BK9BXc3jYvZepT81iccnxJ%2FNzm8ecYly8fbT%2Fk%2B5nAPbkT%2BNQOYiELQFMdxm88eWhj64P1S4WZPm4p%2BP4ifdnAHBJgNZaATdfrJzNT2zPnOOHM0qJ029C1I1hTSZhlDYK7MBN2C1dHuKgXeewnwK%2FVOgOUxaxwH3rVOixKe2delmWUWe6xXqzpj6xdonnb0cpiFkH%2BP05exvRx0yE&X-Amz-Signature=f8f5b955b250fba75d4de0ff3fcc7c3918c965b2d820f1dd15e96e9fed50bd03&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466SBIUS2DB%2F20260826%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260826T192908Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEFkaCXVzLXdlc3QtMiJHMEUCIDyYZvIjywwetUaOtJHdBMp1iBa0w04aQ5NmemKdV6tSAiEAguSd%2B84JFxMgYGS%2FkDvesPI9clpE5XJCwdjwaI0OfHQq%2FwMIIhAAGgw2Mzc0MjMxODM4MDUiDM3RJuxdwXUg0K8ALCrcA7qBfup4lb2KXjQXYHDPAY6pZV6xBGB0rzNLVxgF0sURfdBjPTyCyB8n7iU3oPW9kZnS6QvP6hlTFHzETwhP5Z5d6piyi73XuVw2rHzN%2B6YYl69vqVMLl3DBLiXGFpGgbUS17dvFvI9XFboEAjOLB0n3ZHyzZU7cFfF3%2Bi6w4VJYwgit1YThhYQ8c0SIP27w9vAunntMPSU8eMCVjnfHaZ5xpNdVHi1ssBuB00ylupBLZfSw2IUrWy45F2O3oz3Z5d1f4GfM8xGNe%2F5%2BIJacYEyY5sOtslU%2BcynunOSCufjhrsP8nZld0laPSyzkfjy8PaCl7ur4iDlpkjNR5ATnZM%2F7DcEKMRRFu%2FiHBEzBE9tX161Vi1Z76pjhL8aQQl6lrDcd6h9O%2F8HzINkv650iQmG%2FyPrCXLx3KrPvG1WMzFCizBQk67MVeS%2FyP%2F6xCPEHpAxw4F27yZ%2FVX2L2O86l2DKOMEfvNnP9R6Tn5mXx0GDO3kSqJSve7l0CmbEc1o5b4xzwVjNnkAW4KUMANKhyMf6WOZcXBzVE7h0xfAiEdGWby%2Fh9KZ1EROjYyudH1Zs4MC5Ko0X8hL6OiEjoLQZlL9g1DO5C%2B7%2BWsXnm2LcaC8HagluDm9CNORVZ%2Bu%2BYMOe4vNQGOqUBAyqc2azVhpr%2BK9BXc3jYvZepT81iccnxJ%2FNzm8ecYly8fbT%2Fk%2B5nAPbkT%2BNQOYiELQFMdxm88eWhj64P1S4WZPm4p%2BP4ifdnAHBJgNZaATdfrJzNT2zPnOOHM0qJ029C1I1hTSZhlDYK7MBN2C1dHuKgXeewnwK%2FVOgOUxaxwH3rVOixKe2delmWUWe6xXqzpj6xdonnb0cpiFkH%2BP05exvRx0yE&X-Amz-Signature=592098a3d60eb20318f6c19b0fe142aa5c18fd0ba6dcebe3448075b2d912810b&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

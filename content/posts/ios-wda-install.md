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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466Z53YU4TS%2F20261106%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261106T040543Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEAwaCXVzLXdlc3QtMiJGMEQCIHyzJCxytfecAY4e4cEDbO4PG%2FRAieWKK2Gd2dpHDeyMAiAB1b9J4aR6aFdtTV4PZZi2a9f8l9AdTCMebOA6Pldk9yqIBAjV%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMsHpuJHAsr0xkPBtYKtwD%2BHKFjusJ12N8KyScL9d93ofkduqFe0wqONxNaF03bTeNiunqsYyMxyo%2F0iUIqC2r8wv4v%2FfkG7dfwKePXhlb1Bv5PnhJFdNi4%2B4L%2BvYANhlqXRDd9%2BPyc3Fl2WH%2F%2FwrTDyGvJLCsO4wm8YIC1AZ7cdbkR8QJUCeRYJmKFzpSet6S%2FjOIoSDnZ58t1AC9l5WBBedNQVoSKX%2BBq1QjlO6cUtTKdIEYlXwFzAZDhYHa84dBSd9cJVm5huclGs8Tvq%2Fy%2BF23n8BPvu53suBjaaki3SHLbeLBs8ECMkSxbbUkacjxqV59%2BNkAINX%2FIpHYhciSHO%2FRLgxVP6U%2B8nE1bz6oZID%2FnXzhllIhYlLgE15EKMYyYWWLD5HeA3NBn%2BEUJPuptpU6DhNLLTektSbUKkot1I7vD%2BE8zdxD%2Fw6S82EbiqIZVaR5cEWst41t9GfiTekYq0BssRVFjzVSU0YQ8bZ%2BxbqmHgEF4PRQWSGqEzZkbhysB6ig0xy1yksswpCrNQFqdf%2B%2BqfOCVSuh1RDqnGLkmuSiEWu8ICgBVQdT99OnloNMri%2FPd2k1pXVGKt0XsOqUPaevjoM7fxB9IduCzEQ2t7OKAFHrnhCVXZgl8rtFFDueeXRSGnAJ2fZ%2BUwMw5qG11wY6pgH3pNh3oQKqSjcibSAirexp79TszTSlNuTcC8G4sF%2BYtWOC%2BfVVHaIupgTEQH0DYR7qzqioAMMJA7u3PkPcIqPbK6%2FylIf5dfmcecgQB1etGB1DEx93oLBVxCBLBvtf81GcTDDiC44xM0yaIhVa4BzTaI3VFpMv7UIy5hXStWMUzL3ptqDiat5h55SzFbZA4WJxsvyGYpNEpVSCtmwz9K0suvMeRFDd&X-Amz-Signature=8caee59681660332372eda4de4a1eb53e37de11c9b67847fb227fba671622fde&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466Z53YU4TS%2F20261106%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261106T040543Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEAwaCXVzLXdlc3QtMiJGMEQCIHyzJCxytfecAY4e4cEDbO4PG%2FRAieWKK2Gd2dpHDeyMAiAB1b9J4aR6aFdtTV4PZZi2a9f8l9AdTCMebOA6Pldk9yqIBAjV%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMsHpuJHAsr0xkPBtYKtwD%2BHKFjusJ12N8KyScL9d93ofkduqFe0wqONxNaF03bTeNiunqsYyMxyo%2F0iUIqC2r8wv4v%2FfkG7dfwKePXhlb1Bv5PnhJFdNi4%2B4L%2BvYANhlqXRDd9%2BPyc3Fl2WH%2F%2FwrTDyGvJLCsO4wm8YIC1AZ7cdbkR8QJUCeRYJmKFzpSet6S%2FjOIoSDnZ58t1AC9l5WBBedNQVoSKX%2BBq1QjlO6cUtTKdIEYlXwFzAZDhYHa84dBSd9cJVm5huclGs8Tvq%2Fy%2BF23n8BPvu53suBjaaki3SHLbeLBs8ECMkSxbbUkacjxqV59%2BNkAINX%2FIpHYhciSHO%2FRLgxVP6U%2B8nE1bz6oZID%2FnXzhllIhYlLgE15EKMYyYWWLD5HeA3NBn%2BEUJPuptpU6DhNLLTektSbUKkot1I7vD%2BE8zdxD%2Fw6S82EbiqIZVaR5cEWst41t9GfiTekYq0BssRVFjzVSU0YQ8bZ%2BxbqmHgEF4PRQWSGqEzZkbhysB6ig0xy1yksswpCrNQFqdf%2B%2BqfOCVSuh1RDqnGLkmuSiEWu8ICgBVQdT99OnloNMri%2FPd2k1pXVGKt0XsOqUPaevjoM7fxB9IduCzEQ2t7OKAFHrnhCVXZgl8rtFFDueeXRSGnAJ2fZ%2BUwMw5qG11wY6pgH3pNh3oQKqSjcibSAirexp79TszTSlNuTcC8G4sF%2BYtWOC%2BfVVHaIupgTEQH0DYR7qzqioAMMJA7u3PkPcIqPbK6%2FylIf5dfmcecgQB1etGB1DEx93oLBVxCBLBvtf81GcTDDiC44xM0yaIhVa4BzTaI3VFpMv7UIy5hXStWMUzL3ptqDiat5h55SzFbZA4WJxsvyGYpNEpVSCtmwz9K0suvMeRFDd&X-Amz-Signature=818745c3ed587053e166478701299238794eeee7b200dd896eb9e638d1ea44d1&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

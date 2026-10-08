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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466XIFBTGIR%2F20261008%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261008T032923Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEFMaCXVzLXdlc3QtMiJIMEYCIQDO7L9KH%2B0xXyY4hZM6ei48jz0nSUWRu5RU18HMww1MwQIhAOXaXMpi6rKC70CkWG8HiUtCLyZHmjrDLPiofk6nqBz5Kv8DCBwQABoMNjM3NDIzMTgzODA1IgxYU6jd45iWqjBRu5sq3ANEx3u9IlTvmNyC7Zcb4GquYh9gY8azPsjSvWIHBqaLtNMAyBJJjuVeaK7n5DXZPwKU5O%2FualPerT1xPRWYsglIGQJk3C6KE7HoiVEdAJeV%2FZuVEouNzrhy6Vjn%2FDCGj%2Bq2JZc3xi%2BKhjtl6VfYSE6uM4RcWaAGRJRxYChkPTTGe0SfEDhJjyib3Z%2BqUkGGWEL5JqUKg9xI97Cmh7dcrRd3dGvGVVlg7w4l2AA1QAJJeCc6cgSCtA%2BGvT3V8lMwiky6HS0bBaTsEkPJ0pGADlK0Y8PeMDBmcKodyQqBsPjKJnj%2FbWwyktroUoPlUK5kqOIhOKDgAL63A16%2Bdh3RI60vi4m2%2FkcHNnkqq0RQiE5vfABW4SQAhgKQMe1yUviE3LLlyS5BWfS0nrpEwVblWrjtemWdpc42EKeWSIUI162HG50C2Qns5qBB5HM370W0dTLIoNicP%2F1hj2pC8TpJt0Hqc1rqmAMfiXn9WjBNTR3saeLrbj%2FtewgbYhqx%2FeenlB0YSpL2POTant8%2FYwLtwRcZpE%2FCb6kdY7uXR%2FjDdUeDZFGvAEQfdKkqFbHQT857XwAoJMDAWMEvXOBPn2JZZvP0DP1q9ZtSXkC8HXhCEbl2FXcJP2yiqaxQFlxZ4TDZjpzWBjqkAbNPk1QRxy8y%2BZwVCE6m1Pb5po42566jbZEVrDzMXWMwTrb%2BzH2jWj80Ng6WMqZfftonG8JjTWNbyN%2BZho5ifk9TRtZXKh65z08UuPuDCVWpdcEi17bjr9r9xI1eaCMXyi3emXg4gdqR8KmHtHr8d4f%2FztBaXVjwdT6opa50FIWS8m9JZV9b5wk85zBiwGfi0%2Bi3MFaTiSOmV4OvatGKF5yWfKBc&X-Amz-Signature=ade437cb2ca8e1c7fe8e643a2ac201b2fc8e829ec461829a20ebaf05b067eba9&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466XIFBTGIR%2F20261008%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261008T032923Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEFMaCXVzLXdlc3QtMiJIMEYCIQDO7L9KH%2B0xXyY4hZM6ei48jz0nSUWRu5RU18HMww1MwQIhAOXaXMpi6rKC70CkWG8HiUtCLyZHmjrDLPiofk6nqBz5Kv8DCBwQABoMNjM3NDIzMTgzODA1IgxYU6jd45iWqjBRu5sq3ANEx3u9IlTvmNyC7Zcb4GquYh9gY8azPsjSvWIHBqaLtNMAyBJJjuVeaK7n5DXZPwKU5O%2FualPerT1xPRWYsglIGQJk3C6KE7HoiVEdAJeV%2FZuVEouNzrhy6Vjn%2FDCGj%2Bq2JZc3xi%2BKhjtl6VfYSE6uM4RcWaAGRJRxYChkPTTGe0SfEDhJjyib3Z%2BqUkGGWEL5JqUKg9xI97Cmh7dcrRd3dGvGVVlg7w4l2AA1QAJJeCc6cgSCtA%2BGvT3V8lMwiky6HS0bBaTsEkPJ0pGADlK0Y8PeMDBmcKodyQqBsPjKJnj%2FbWwyktroUoPlUK5kqOIhOKDgAL63A16%2Bdh3RI60vi4m2%2FkcHNnkqq0RQiE5vfABW4SQAhgKQMe1yUviE3LLlyS5BWfS0nrpEwVblWrjtemWdpc42EKeWSIUI162HG50C2Qns5qBB5HM370W0dTLIoNicP%2F1hj2pC8TpJt0Hqc1rqmAMfiXn9WjBNTR3saeLrbj%2FtewgbYhqx%2FeenlB0YSpL2POTant8%2FYwLtwRcZpE%2FCb6kdY7uXR%2FjDdUeDZFGvAEQfdKkqFbHQT857XwAoJMDAWMEvXOBPn2JZZvP0DP1q9ZtSXkC8HXhCEbl2FXcJP2yiqaxQFlxZ4TDZjpzWBjqkAbNPk1QRxy8y%2BZwVCE6m1Pb5po42566jbZEVrDzMXWMwTrb%2BzH2jWj80Ng6WMqZfftonG8JjTWNbyN%2BZho5ifk9TRtZXKh65z08UuPuDCVWpdcEi17bjr9r9xI1eaCMXyi3emXg4gdqR8KmHtHr8d4f%2FztBaXVjwdT6opa50FIWS8m9JZV9b5wk85zBiwGfi0%2Bi3MFaTiSOmV4OvatGKF5yWfKBc&X-Amz-Signature=dfd0440a3d780412369da7b4fa7522dad0b3d1d3fb8cc6f2431ead6c7ffd7812&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

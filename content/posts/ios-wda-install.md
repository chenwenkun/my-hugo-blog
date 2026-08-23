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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466XAQSVLUG%2F20260823%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260823T062151Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEAMaCXVzLXdlc3QtMiJIMEYCIQDfGIbe5ZfYoFEuQKF7q913%2BFjNph7aaaQEhIWiJVMuWQIhAJouzAkD1%2F8GxTqwXV3EJKk06fhXz%2FIyj4qDyKDYViRvKogECMz%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1Igyl%2BLk3inGpJ3lcQMMq3ANdviPX0gbCQwOcTpbLuCYBBK54Vlv8zmvtFU0KgDRq9P9FGm4mZraLNJBgjyNDrlmAvzmB4q9P7Zyt52KFwj1r6RY1Rf1W4mVJpley%2FYc%2BJ9rJjYtruGmE4hpj60LZQOfs%2BSLej3TddJ0IZTLHIMALR3RU8ufXjtvB4RmVNJPRZeDpcoxwn4CUaCkv%2FwfHJZAWkSwseeD7slNihR4FbV37FOTM01jxsMYje9OzkZy%2BWZWcumsZGd%2Fz351q7m3phjmgI9xJbXnh080aGeY%2F%2FaFBgpu5a9tcnxcUKxvG764wkxmTPLWrgUBKA%2B7S7QIqmEcFc1%2Fx7PGzUL5Jxh8J8SsP0PqDrBsd%2FtwxwRA0iYaLs%2B4%2BDwveMLu3D%2F%2B7m%2F1OqiWtmLQIHX4lP0URylUbIxOqWiuTiKo7Dml%2B2dbB%2BjzyuFmiefEm%2FXNRr6cZYzVXH6y4Yi8u20qIP5UYyKRy06SLyNrtxJFJZHZFicbB3J53J3j9qc5qZ09Gq1vqQoG2APV3p4XN%2BV93ej4Dy3z4vNpvcqLD4MWQ%2FeRG3MMeECzi05T2RhDgv7J66wZ24G6PvmjxgS7oUdpVFWTEpzb8%2Bv9uKNV360OS6XKVApT4LH2wdRMcPER5elx7t2uAqjCQtanUBjqkAcBQk5qI0CvMgx6kXIT%2Bah3Hj31Fayxh%2Br1SSaPPi0rb9qcquK97%2FViHhpwF52wZeTFxgAV%2FFjNtiqhToeE0mihx8dvptwDDlzK9YkpgHAUhdgHctEV8mbYPi0LEx0YBElAz%2BC6%2BqXhUKoaJntcr1mDfJ2xeByiYqfvtrd2BJKRMdgS9aNZ4o3dttfHF3Ud5aHSgyEGSpXH8EuwZlHBt9Rr%2Fhpbr&X-Amz-Signature=84a367d6535b2b91af694c2ff310bed5535321fe63e7f21234edb132c2d98ee2&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466XAQSVLUG%2F20260823%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260823T062151Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEAMaCXVzLXdlc3QtMiJIMEYCIQDfGIbe5ZfYoFEuQKF7q913%2BFjNph7aaaQEhIWiJVMuWQIhAJouzAkD1%2F8GxTqwXV3EJKk06fhXz%2FIyj4qDyKDYViRvKogECMz%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1Igyl%2BLk3inGpJ3lcQMMq3ANdviPX0gbCQwOcTpbLuCYBBK54Vlv8zmvtFU0KgDRq9P9FGm4mZraLNJBgjyNDrlmAvzmB4q9P7Zyt52KFwj1r6RY1Rf1W4mVJpley%2FYc%2BJ9rJjYtruGmE4hpj60LZQOfs%2BSLej3TddJ0IZTLHIMALR3RU8ufXjtvB4RmVNJPRZeDpcoxwn4CUaCkv%2FwfHJZAWkSwseeD7slNihR4FbV37FOTM01jxsMYje9OzkZy%2BWZWcumsZGd%2Fz351q7m3phjmgI9xJbXnh080aGeY%2F%2FaFBgpu5a9tcnxcUKxvG764wkxmTPLWrgUBKA%2B7S7QIqmEcFc1%2Fx7PGzUL5Jxh8J8SsP0PqDrBsd%2FtwxwRA0iYaLs%2B4%2BDwveMLu3D%2F%2B7m%2F1OqiWtmLQIHX4lP0URylUbIxOqWiuTiKo7Dml%2B2dbB%2BjzyuFmiefEm%2FXNRr6cZYzVXH6y4Yi8u20qIP5UYyKRy06SLyNrtxJFJZHZFicbB3J53J3j9qc5qZ09Gq1vqQoG2APV3p4XN%2BV93ej4Dy3z4vNpvcqLD4MWQ%2FeRG3MMeECzi05T2RhDgv7J66wZ24G6PvmjxgS7oUdpVFWTEpzb8%2Bv9uKNV360OS6XKVApT4LH2wdRMcPER5elx7t2uAqjCQtanUBjqkAcBQk5qI0CvMgx6kXIT%2Bah3Hj31Fayxh%2Br1SSaPPi0rb9qcquK97%2FViHhpwF52wZeTFxgAV%2FFjNtiqhToeE0mihx8dvptwDDlzK9YkpgHAUhdgHctEV8mbYPi0LEx0YBElAz%2BC6%2BqXhUKoaJntcr1mDfJ2xeByiYqfvtrd2BJKRMdgS9aNZ4o3dttfHF3Ud5aHSgyEGSpXH8EuwZlHBt9Rr%2Fhpbr&X-Amz-Signature=016f5377e07429802ada6dd3ea35eb0d301cc45b982b5b25c4a347d47d0478de&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

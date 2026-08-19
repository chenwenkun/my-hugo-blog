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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4666HE5UR4Y%2F20260819%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260819T062414Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEKX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIA9L6tOJdUY9R0enbEI7t1y%2BC8RLW7o8dyQG6m8gDyb6AiB6pdEWSEPiSzvEG%2FxaRPC%2BNowjbw1v8nUnrzxi1aQkLir%2FAwhtEAAaDDYzNzQyMzE4MzgwNSIM3EkvBGz4LrIFVKc9KtwDnF0GKZQrWyJ4oehCFZy66a0L%2F6QN1caxUUgLL9GFdERlh8VfXyPcrtdPp0SVaIJqEgZfeDrLiOCd4Yth1B7d2sbpz8uVCrPu6K9IP2xAI%2FItkukhUDkrurLzdn4TokfuCKcNiS4cD5pq006rW8iNefiOuwTqlE1S7FglNdsiNkjABsvyd5YgxP84iRfD3W3T93IzeqBX5JzvyT2QrVjyEc4aZ5AGBlOQx%2FeCERc%2BbUVy4IjqF1QvmcIWdyPP3%2FFgS8RkDje7BZ6zKnbBNbW5qjsNheXq6cO4FxFfHmQCoRwJwhoS%2BBgvam6YWL82XjOIRhf%2F2v7AmTKl8sPOQ2P7vOfdfTY2MYIFe%2F77jqVip8aw1vZxThw%2FXDAumdTt9xNblq0ozeDTyFwskYC5YabKsZ9FDOI52VazzUiIR4rPbGiYfKhXTgYyjfmlDnYJTKa2kLZfeseviSvu9PlnB4IHJVWgLDb5mDdAhun%2FMpxY4D3ooqpzsSTiucJvxYouYtIbwl5Ftm37zB3SDunCvYGj7G7sMrwzFLTkmtnYt2GsLynA3vA2SBcdoqzTqoGBgyvmV0wJBAhwUHof%2FX3GCyolsuofuv1ZeAETsRhl6v%2BHsO5NRUUnLlMAOFUF%2BhYw0t%2BU1AY6pgGkcgNATqMjeVsiFgxtBkUsjdAo6ShVSWp5cfNNHNdFhj0ovzVXQ2Fgsk0zp3LHO%2BChjML2mlumjgg5Ec93v78O2BqQpUw5fRuG6886RnNzAjAkUrLNSkc%2FiTREHcUnr%2FxYtOWGFeMgUPz7bdKUGgsiy0OzLa%2F9Tf0ZJdmfFLVJYoi%2FLqL0Mj%2B8mwicAwKeqJGFTr3jJbCwlgOXb%2F8ZzDSDyE9SYgqz&X-Amz-Signature=661a2230399ee61e0a49e5687abe57b7d112455ad9ba2a52f0563609818782a9&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4666HE5UR4Y%2F20260819%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260819T062415Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEKX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIA9L6tOJdUY9R0enbEI7t1y%2BC8RLW7o8dyQG6m8gDyb6AiB6pdEWSEPiSzvEG%2FxaRPC%2BNowjbw1v8nUnrzxi1aQkLir%2FAwhtEAAaDDYzNzQyMzE4MzgwNSIM3EkvBGz4LrIFVKc9KtwDnF0GKZQrWyJ4oehCFZy66a0L%2F6QN1caxUUgLL9GFdERlh8VfXyPcrtdPp0SVaIJqEgZfeDrLiOCd4Yth1B7d2sbpz8uVCrPu6K9IP2xAI%2FItkukhUDkrurLzdn4TokfuCKcNiS4cD5pq006rW8iNefiOuwTqlE1S7FglNdsiNkjABsvyd5YgxP84iRfD3W3T93IzeqBX5JzvyT2QrVjyEc4aZ5AGBlOQx%2FeCERc%2BbUVy4IjqF1QvmcIWdyPP3%2FFgS8RkDje7BZ6zKnbBNbW5qjsNheXq6cO4FxFfHmQCoRwJwhoS%2BBgvam6YWL82XjOIRhf%2F2v7AmTKl8sPOQ2P7vOfdfTY2MYIFe%2F77jqVip8aw1vZxThw%2FXDAumdTt9xNblq0ozeDTyFwskYC5YabKsZ9FDOI52VazzUiIR4rPbGiYfKhXTgYyjfmlDnYJTKa2kLZfeseviSvu9PlnB4IHJVWgLDb5mDdAhun%2FMpxY4D3ooqpzsSTiucJvxYouYtIbwl5Ftm37zB3SDunCvYGj7G7sMrwzFLTkmtnYt2GsLynA3vA2SBcdoqzTqoGBgyvmV0wJBAhwUHof%2FX3GCyolsuofuv1ZeAETsRhl6v%2BHsO5NRUUnLlMAOFUF%2BhYw0t%2BU1AY6pgGkcgNATqMjeVsiFgxtBkUsjdAo6ShVSWp5cfNNHNdFhj0ovzVXQ2Fgsk0zp3LHO%2BChjML2mlumjgg5Ec93v78O2BqQpUw5fRuG6886RnNzAjAkUrLNSkc%2FiTREHcUnr%2FxYtOWGFeMgUPz7bdKUGgsiy0OzLa%2F9Tf0ZJdmfFLVJYoi%2FLqL0Mj%2B8mwicAwKeqJGFTr3jJbCwlgOXb%2F8ZzDSDyE9SYgqz&X-Amz-Signature=6490026b13fdce70d94a4edc01da52bd30567bc0b9c516dfbbf833a8306ca518&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

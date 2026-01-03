---
title: iOS WDA作为App独立运行
date: '2025-09-25'
tags:
  - 技术
draft: false
author: chenwenkun
toc: false
show_reading_time: true
---
测试系统 16.6 运行闪退

18.3 18.4系统正常安装

代码地址：

本来是 facebook 的项目，目前由 appium 进行维护

代码下载

先在xcode 构建一次，修改Bundle Identifier，勾选自己的 appleid

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466W3F5ZMXC%2F20260103%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260103T122056Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEEoaCXVzLXdlc3QtMiJIMEYCIQCH9MoxNCe41ET9pVWezW3zfL6u5Itqrvxpf10MCtiUYgIhAMezo1n%2FxReQ60N16hClsnaTL1U1XpXZwvFXCH%2FzUQcbKv8DCBMQABoMNjM3NDIzMTgzODA1IgyAndFuB8XbzIAly1Aq3AM835Tt2PsXs%2FmGDciDCWNplLmyg8dxJ8gFur%2FifedoM6oIMKaMNU%2Bj8qhzvUoFoj8dBU18%2F7%2FmuzJKhxPvXUrwBOCeg%2FG1GhRWqPPGMROuf%2F6n1wHzwjZjhrci65%2BzBg7UhKe4sUV0YHmxo8b2h2M5KGXwIfAf9mP7IAMDV7ngX9%2BZjK%2FKCptCHhlrge26IRugb2S6iQtlkYFYINcbgdXwRinepfeQce9LetPisbI2V%2F%2FBEdZOMRWXy6gjbluFXV3EHreoZtN9Zkx6YyQeMVg3Jpl8vsJTL84kzjNHZS41%2Fs5nFkXcxVvJc2onHv2%2FMl9kXQfHqnGswiM%2B5CxwP4CM3x4VuPpasE7MVcKSdliFpPLAWIjh5ODYJ4Yz%2BfSlFaKir5pJEC2s6G58jDGqRIYPGARFCBBexJ1epFjIZyP1MJSua7iqum2k2PdBqal7dGCVSXBzqj684LlGK%2Fx3uRh9C4hehoJfu2djCyCXNuVINwt9PHujgbj%2F3eJuDg5ZhWDe1%2BqvY%2Bd5p%2BKzPei99LkK1f7MnTUATokWFhcgB1tee3tfMPXb0HqBkRLd%2FEuy9s22n8pBBtBg32ZcvjiSGYfhtM%2FzZCWf88jOPgmMkvOUzCYoARbF0fzCZmhQkjCS2ePKBjqkAfo55%2Faa5Oy3sTvkGz3HGh6Mj7JQuGeFda0auEIMUR5988R0NoneS2ZDgFtl5sHpgHjWYlzTBK2H711oJTkGV770E%2BlXx9EJDTWvCBThSEw6UCGu8CJHp%2F0VY9%2FZxlXZP8JPljyu6ekiXmPTHgqjfQ%2F9jn2b2eFuDV8%2Bh6A1yOhez4VBk9Vhi%2BmHpF2ndNvmj0BRf8QfEqBV0flbBv%2F%2FI9kJmnKH&X-Amz-Signature=a3882a23c474efe64eada6592a77873076806e2ff7019ac901af582c98cdd16d&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

```shell
cd /Users/chenwenkun/Downloads/androidandios/iosui/WebDriverAgent/WebDriverAgent
# 使用xcodebuild构建WebDriverAgentRunner用于测试
$ xcodebuild build-for-testing -scheme WebDriverAgentRunner -sdk iphoneos -configuration Release -derivedDataPath /tmp/derivedDataPath

xcodebuild build-for-testing -scheme WebDriverAgentRunner -sdk iphoneos -configuration Release -derivedDataPath /tmp/derivedDataPath -arch arm64
ARCHS=arm64
# 导航到生成的构建目录
$ cd /tmp/derivedDataPath

# 进入Release-iphoneos目录（注意：实际路径可能因环境而异）
$ cd Build/Products/Release-iphoneos

# 创建iOS应用程序打包所需的Payload文件夹结构
# 创建Payload文件夹并将.app文件复制到其中
$ mkdir Payload && cp -r *.app Payload

# 将Payload文件夹压缩为zip文件，然后将扩展名更改为.ipa
# .ipa文件是iOS应用程序的标准分发格式
# 可以使用zip命令进行压缩：zip -r MyApp.ipa Payload
# 或者也可以通过文件管理器进行压缩，然后手动更改扩展名
```

然后：进入到目录 `WebDriverAgentRunner-Runner.app/Frameworks` 把XC开头的文件全部删掉

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466W3F5ZMXC%2F20260103%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260103T122056Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEEoaCXVzLXdlc3QtMiJIMEYCIQCH9MoxNCe41ET9pVWezW3zfL6u5Itqrvxpf10MCtiUYgIhAMezo1n%2FxReQ60N16hClsnaTL1U1XpXZwvFXCH%2FzUQcbKv8DCBMQABoMNjM3NDIzMTgzODA1IgyAndFuB8XbzIAly1Aq3AM835Tt2PsXs%2FmGDciDCWNplLmyg8dxJ8gFur%2FifedoM6oIMKaMNU%2Bj8qhzvUoFoj8dBU18%2F7%2FmuzJKhxPvXUrwBOCeg%2FG1GhRWqPPGMROuf%2F6n1wHzwjZjhrci65%2BzBg7UhKe4sUV0YHmxo8b2h2M5KGXwIfAf9mP7IAMDV7ngX9%2BZjK%2FKCptCHhlrge26IRugb2S6iQtlkYFYINcbgdXwRinepfeQce9LetPisbI2V%2F%2FBEdZOMRWXy6gjbluFXV3EHreoZtN9Zkx6YyQeMVg3Jpl8vsJTL84kzjNHZS41%2Fs5nFkXcxVvJc2onHv2%2FMl9kXQfHqnGswiM%2B5CxwP4CM3x4VuPpasE7MVcKSdliFpPLAWIjh5ODYJ4Yz%2BfSlFaKir5pJEC2s6G58jDGqRIYPGARFCBBexJ1epFjIZyP1MJSua7iqum2k2PdBqal7dGCVSXBzqj684LlGK%2Fx3uRh9C4hehoJfu2djCyCXNuVINwt9PHujgbj%2F3eJuDg5ZhWDe1%2BqvY%2Bd5p%2BKzPei99LkK1f7MnTUATokWFhcgB1tee3tfMPXb0HqBkRLd%2FEuy9s22n8pBBtBg32ZcvjiSGYfhtM%2FzZCWf88jOPgmMkvOUzCYoARbF0fzCZmhQkjCS2ePKBjqkAfo55%2Faa5Oy3sTvkGz3HGh6Mj7JQuGeFda0auEIMUR5988R0NoneS2ZDgFtl5sHpgHjWYlzTBK2H711oJTkGV770E%2BlXx9EJDTWvCBThSEw6UCGu8CJHp%2F0VY9%2FZxlXZP8JPljyu6ekiXmPTHgqjfQ%2F9jn2b2eFuDV8%2Bh6A1yOhez4VBk9Vhi%2BmHpF2ndNvmj0BRf8QfEqBV0flbBv%2F%2FI9kJmnKH&X-Amz-Signature=6e36617391974fa2b1a17add16c8e70675e5379e6a4ae0afbd4ea93ec46cf5f3&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

用zip命令打包出来一个ipa

```shell
zip -r WDA.ipa Payload
```

下载[iOS App Resigner](https://zhida.zhihu.com/search?content_id=237756070&content_type=Article&match_order=1&q=iOS%20App%20Resigner&zd_token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJ6aGlkYV9zZXJ2ZXIiLCJleHAiOjE3NDQzNTQ0ODAsInEiOiJpT1MgQXBwIFJlc2lnbmVyIiwiemhpZGFfc291cmNlIjoiZW50aXR5IiwiY29udGVudF9pZCI6MjM3NzU2MDcwLCJjb250ZW50X3R5cGUiOiJBcnRpY2xlIiwibWF0Y2hfb3JkZXIiOjEsInpkX3Rva2VuIjpudWxsfQ.XGwOKX0ujlvhojSuRT3SlA0sDFnQK-FxDJr60CX6YqU&zhida_source=entity)进行重签名：[https://dantheman827.github.io/ios-app-signer/](https://dantheman827.github.io/ios-app-signer/)

保存为 WDA2.ipa

试了下个人开发者证书可以。

最后用tidevice把IPA装到手机上（iOS17也可以）

```shell
# install tidevice
pip install tidevice

# install WDA2 to phone
tidevice install WDA2.ipa
```

直接点击手机桌面上的WDA图标就可以了

手机浏览器打开测试一下 [http://localhost:8100/status](http://localhost:8100/status)

出现一个长长的JSON就是正常的。

国内手机需要安装

brew install --HEAD libimobiledevice

然后运行iproxy 8100 8100 监听在电脑端

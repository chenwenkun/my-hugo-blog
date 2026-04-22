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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466WALCZ3QV%2F20260422%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260422T185724Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEIv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIC6BG7mUbqrM8c7KiedN25GmqW86NcL3p0ZaBqvJXrnhAiEAuWWAnZKDCCvsiwOC8HM0ykKY2uCfopyvSG2tf2oMe%2B0q%2FwMIVBAAGgw2Mzc0MjMxODM4MDUiDMBeA3bAvjTanvT2aircA4085zDEMuNv32akL5r5MdrT7R%2BB%2F3pj6t6FliUCAO2J2RqfO2KcVNE3%2B5jyx6XDw0ZapnJ9dLUlM4liyB%2FH9Jk%2B5LEta038Xo3nrpbBzrg7F8cZ6gHR6VAia1rIKlpKMXZU%2FTK8N9kwo%2B9q8Xwo5ozS8cONRBiGIkNdzHb0XNX1bs0TpETjElCVay94fbJkpgOgKSmFac1ZKFK8%2BabhEbtZbWWXaqzkZd0PaLF31AOlABUx46RCQJXAIiG32Kus5hzy8AQwhXLFqCKssqqOfnX%2BIDM%2FFVe6cWmmLLS6e1x8McOic41xfKi%2BqGJyezY5x3c4qVBPIrM6ZAznvM7S7%2Bkr0v7GiKsVEHZGmysx58UpBqcW22LTVeJKP%2F6wHiCDidH1qY90QnpBxV9lNUmpIsChIu0h8ddABvtw2pBVs3CnqBQ1M1uVKbfQg36mTpSa%2B2%2FA%2Fw9AJD5rDJ4YZdyAKiGBKgHnW0bcxp9r7yovMX6lPV0FIxuvB83kFk%2FvkHf3FzUbxsa0Kkp4Av5HM6iMlmmlUt9PlKuhaJxkBZT9EBbHMqG3VHDvSTrxoGy%2F0VvdAa7GNoDvZe6loCpRV5EE6DOG%2FkoXXfSgEvgIEbioGIUy1%2FhoFdR1sHpv45lsMKSspM8GOqUBYLoHUKP3V09n0t1CTdI2srNbe5HXz9Hs0oP7o02Fr591jy0ViT2diyHfKmgQttQNDBcAQbXf80fuXDZO0zlepGOTu%2Fr9LbP2GAA3zeqZ%2BojaAJSTIUJwHGWvjqmMtxyJfUZ8N0D0U8z8tVQaObomWHh8ImhkDocmSs4%2F7a7IlbdpNb2YTwJ8JtU4rvkW0uGDDQl6%2BV%2FTXYWYu11Rbl%2Bo0IcQ2Kc1&X-Amz-Signature=7dcaf918f8288ef516524fd3f41eee05a6cafc7cab434c8d5de5518f8edcd051&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466WALCZ3QV%2F20260422%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260422T185724Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEIv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIC6BG7mUbqrM8c7KiedN25GmqW86NcL3p0ZaBqvJXrnhAiEAuWWAnZKDCCvsiwOC8HM0ykKY2uCfopyvSG2tf2oMe%2B0q%2FwMIVBAAGgw2Mzc0MjMxODM4MDUiDMBeA3bAvjTanvT2aircA4085zDEMuNv32akL5r5MdrT7R%2BB%2F3pj6t6FliUCAO2J2RqfO2KcVNE3%2B5jyx6XDw0ZapnJ9dLUlM4liyB%2FH9Jk%2B5LEta038Xo3nrpbBzrg7F8cZ6gHR6VAia1rIKlpKMXZU%2FTK8N9kwo%2B9q8Xwo5ozS8cONRBiGIkNdzHb0XNX1bs0TpETjElCVay94fbJkpgOgKSmFac1ZKFK8%2BabhEbtZbWWXaqzkZd0PaLF31AOlABUx46RCQJXAIiG32Kus5hzy8AQwhXLFqCKssqqOfnX%2BIDM%2FFVe6cWmmLLS6e1x8McOic41xfKi%2BqGJyezY5x3c4qVBPIrM6ZAznvM7S7%2Bkr0v7GiKsVEHZGmysx58UpBqcW22LTVeJKP%2F6wHiCDidH1qY90QnpBxV9lNUmpIsChIu0h8ddABvtw2pBVs3CnqBQ1M1uVKbfQg36mTpSa%2B2%2FA%2Fw9AJD5rDJ4YZdyAKiGBKgHnW0bcxp9r7yovMX6lPV0FIxuvB83kFk%2FvkHf3FzUbxsa0Kkp4Av5HM6iMlmmlUt9PlKuhaJxkBZT9EBbHMqG3VHDvSTrxoGy%2F0VvdAa7GNoDvZe6loCpRV5EE6DOG%2FkoXXfSgEvgIEbioGIUy1%2FhoFdR1sHpv45lsMKSspM8GOqUBYLoHUKP3V09n0t1CTdI2srNbe5HXz9Hs0oP7o02Fr591jy0ViT2diyHfKmgQttQNDBcAQbXf80fuXDZO0zlepGOTu%2Fr9LbP2GAA3zeqZ%2BojaAJSTIUJwHGWvjqmMtxyJfUZ8N0D0U8z8tVQaObomWHh8ImhkDocmSs4%2F7a7IlbdpNb2YTwJ8JtU4rvkW0uGDDQl6%2BV%2FTXYWYu11Rbl%2Bo0IcQ2Kc1&X-Amz-Signature=a8eca33f7313973951aaba417af549b32a19e1d9e0a862dea0d94e86a316b184&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

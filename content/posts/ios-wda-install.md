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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466X2VCFORL%2F20260610%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260610T093846Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEBgaCXVzLXdlc3QtMiJHMEUCIQDj6DCCQJ1upUkcrqLWLMLugOLzX4zWNgPTBRBqn7psEgIgEHAFXanmOY0condsE90OUxTEkTJ8F9urjw%2FZ%2FjWElAwqiAQI4f%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDKU5vWI2h0wPztrvsircA9743wQu1X9sO0mxeoIuUNgrc6qg5ASXQQb02g2JKKaggXTq1sUHOeHDTRA075zDxIFcqU3zvx0yIHhOhfleA%2B532VHFGvBWMoRAtSr9lhp9lwY1xrQiD3arX5fmQJsBq%2B8DTv%2Bg%2BjX%2FaDEOZHT3SG9DCxsgjPiraPqlGql6%2F7l5029GDcVO2ZU1ofIvLXr%2F9CZdNgEnM7pvpQ1aX3twuBjT5peQ8ahDfSQRvgnY4pcc4gG6mdwljQn5TdbPuRjkxgERgI4c79uu1rkoTmZzqHRRZAlMMqKtAJxTkBezy%2F1hU0Mm8wxqe1ppaCwRyomtQETzK5iJ5ocG%2FBdyGdv6L9gVegAZzrOf49uNJuaySiAnvd5eYdAUpej%2FgdkmUwl6dw6JZyuOa%2FXLs4EbJbiHyPE5B%2FWk09JyE6FiXYtjfhNTRn4syg7bc8LPRqYeanUg1cQGxftKdYZPJtUm2gjBWY%2Fc4%2F8E0NnoMeklFCrRx292ORW3YPCbMGsIFt4OaJbRme4Re1LZnO99I0SOz%2Bkle%2Bswim%2Fc%2Bw%2Fzhx9G9b0uAGRCAB9ITuetaOWgACmQnxXMBmjhwIWKSL7Hb2hRrPwJHyd69rdTGuaxq%2FLZkXwVrafNDB5qrES1wmfu8OfcMJ%2BqpNEGOqUBkkZuzAv3FSpRLn3GpcFYZcyDh1CJO9ND5%2BEPHLWrJED0DWFxYlqfk7njd1eTEE9Y5QGJWEd%2B4DcmERirVTE1uJUGvGOKgtWMKGP5d80ZEe8R8qpXly2rdZpOz5p15XYOoM%2BkD0ws4IxcWbviOmBbSYxLLx%2BqfaE2yGIjC3bIJ6kq5Rcs0nfT0a3WmRpaEmdlNRHhbzzSKgKHofdh0ozTsVZce7hF&X-Amz-Signature=1dec04567ef41776f54873183727029ee03173d5bdfc4b47db2c7a405e27562b&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466X2VCFORL%2F20260610%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260610T093846Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEBgaCXVzLXdlc3QtMiJHMEUCIQDj6DCCQJ1upUkcrqLWLMLugOLzX4zWNgPTBRBqn7psEgIgEHAFXanmOY0condsE90OUxTEkTJ8F9urjw%2FZ%2FjWElAwqiAQI4f%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDKU5vWI2h0wPztrvsircA9743wQu1X9sO0mxeoIuUNgrc6qg5ASXQQb02g2JKKaggXTq1sUHOeHDTRA075zDxIFcqU3zvx0yIHhOhfleA%2B532VHFGvBWMoRAtSr9lhp9lwY1xrQiD3arX5fmQJsBq%2B8DTv%2Bg%2BjX%2FaDEOZHT3SG9DCxsgjPiraPqlGql6%2F7l5029GDcVO2ZU1ofIvLXr%2F9CZdNgEnM7pvpQ1aX3twuBjT5peQ8ahDfSQRvgnY4pcc4gG6mdwljQn5TdbPuRjkxgERgI4c79uu1rkoTmZzqHRRZAlMMqKtAJxTkBezy%2F1hU0Mm8wxqe1ppaCwRyomtQETzK5iJ5ocG%2FBdyGdv6L9gVegAZzrOf49uNJuaySiAnvd5eYdAUpej%2FgdkmUwl6dw6JZyuOa%2FXLs4EbJbiHyPE5B%2FWk09JyE6FiXYtjfhNTRn4syg7bc8LPRqYeanUg1cQGxftKdYZPJtUm2gjBWY%2Fc4%2F8E0NnoMeklFCrRx292ORW3YPCbMGsIFt4OaJbRme4Re1LZnO99I0SOz%2Bkle%2Bswim%2Fc%2Bw%2Fzhx9G9b0uAGRCAB9ITuetaOWgACmQnxXMBmjhwIWKSL7Hb2hRrPwJHyd69rdTGuaxq%2FLZkXwVrafNDB5qrES1wmfu8OfcMJ%2BqpNEGOqUBkkZuzAv3FSpRLn3GpcFYZcyDh1CJO9ND5%2BEPHLWrJED0DWFxYlqfk7njd1eTEE9Y5QGJWEd%2B4DcmERirVTE1uJUGvGOKgtWMKGP5d80ZEe8R8qpXly2rdZpOz5p15XYOoM%2BkD0ws4IxcWbviOmBbSYxLLx%2BqfaE2yGIjC3bIJ6kq5Rcs0nfT0a3WmRpaEmdlNRHhbzzSKgKHofdh0ozTsVZce7hF&X-Amz-Signature=d4de89be2fcb409803939b515dd2234072f4ae4b2f85c56798332a1e46768b76&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

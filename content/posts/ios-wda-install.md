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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466622UXCK5%2F20260731%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260731T132924Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEOT%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQD3%2BBGO8rD3yIrD9RDgR5HJmSYLaLn%2F8ZUnbKc1Mbn9JwIgPy37pmXfnoi0ETQy911rD1iDNH0Pj5qTIx%2FImbkCV%2FoqiAQIrf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDFhrR8VMfkfjRhJGtircA%2F2KodlMtC%2FxgdnWKZi75tkMI7iPMdBozATKKi6DTIVfontQfgy0EvmKdCcnhVsYAS9rl0AYo8ie3X80JAIvEdvOksg%2BCAfX1SmodBobTGUEYtKOlV9GjSYmntGiOu89sPshIJNRrG9Rmi2XyOsXh%2FZbf0nT2MJy6VRnQ1uMwEbyj7JGA9BER2v0YgZccnN4QYlw6ZKvOyULv1MnH7M2IP5HzRmewJLmjXd9phjDkJC0o9oDR808m6N7vX7iwJ2GvwanhkqP2YT%2B1W%2FfPNmyxcD5FPMQ1r8tlVz2O%2B50gT0conluxv8z3Q9P%2Fo4%2B4NHMf13CQQGRSORSKQZpNuQ%2FvGfL7eA0%2F%2FPDuXGLiN0KNkA1AU17Xr8pk3EhUsK58WUBXbE2QyGJI15x8p8zGHTgFT4J4VVauK2YVHmwgk9h55dkeFXf6ejLlJLb9CwgNMuwIx%2BvvrrGWD49Tp8U%2B7IYdjQtsdGAR%2B65R8ROmBKpWrkVuSaIoULHFb5pyZjuVfI7yYlCXo2zRtS0tfVFYOgKsebKi8CD7SWmUXGONXVGZ%2Bv%2FWmnSEnIs3FvdVxjGLkG2Xqu8GKdWHWXjCwQm8NsY%2FAl%2BhbJ8DudY5D04Eg5JHdeF5LfJQF%2FSo7c7Nq%2BNMJekstMGOqUBS9GZvsLyxOqzGYmcWeAOFoda25yyWrdYdl7UjzKi9mADxSD0wu0h0CpGzBl5CRD%2F%2F8T%2ByyZ%2F0o28e%2B99%2Fw8YKHBqmtehivHrTB80yMo4s2FoeAxHrU%2B6AY%2Fe7NP1Wv9WyqkZcSvX%2BG5WU0xYYGx83qNuMApAl%2BjIYUBGv53Ry%2FahRdcrR2PYKsSC7asRF7R3Hc3uZrylsbThQ0may2IPLVjobHMr&X-Amz-Signature=55e86caf37a05440f176ba0bc6301d3aa97323a8b1ebf0dc165def911eb1d10d&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466622UXCK5%2F20260731%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260731T132924Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEOT%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQD3%2BBGO8rD3yIrD9RDgR5HJmSYLaLn%2F8ZUnbKc1Mbn9JwIgPy37pmXfnoi0ETQy911rD1iDNH0Pj5qTIx%2FImbkCV%2FoqiAQIrf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDFhrR8VMfkfjRhJGtircA%2F2KodlMtC%2FxgdnWKZi75tkMI7iPMdBozATKKi6DTIVfontQfgy0EvmKdCcnhVsYAS9rl0AYo8ie3X80JAIvEdvOksg%2BCAfX1SmodBobTGUEYtKOlV9GjSYmntGiOu89sPshIJNRrG9Rmi2XyOsXh%2FZbf0nT2MJy6VRnQ1uMwEbyj7JGA9BER2v0YgZccnN4QYlw6ZKvOyULv1MnH7M2IP5HzRmewJLmjXd9phjDkJC0o9oDR808m6N7vX7iwJ2GvwanhkqP2YT%2B1W%2FfPNmyxcD5FPMQ1r8tlVz2O%2B50gT0conluxv8z3Q9P%2Fo4%2B4NHMf13CQQGRSORSKQZpNuQ%2FvGfL7eA0%2F%2FPDuXGLiN0KNkA1AU17Xr8pk3EhUsK58WUBXbE2QyGJI15x8p8zGHTgFT4J4VVauK2YVHmwgk9h55dkeFXf6ejLlJLb9CwgNMuwIx%2BvvrrGWD49Tp8U%2B7IYdjQtsdGAR%2B65R8ROmBKpWrkVuSaIoULHFb5pyZjuVfI7yYlCXo2zRtS0tfVFYOgKsebKi8CD7SWmUXGONXVGZ%2Bv%2FWmnSEnIs3FvdVxjGLkG2Xqu8GKdWHWXjCwQm8NsY%2FAl%2BhbJ8DudY5D04Eg5JHdeF5LfJQF%2FSo7c7Nq%2BNMJekstMGOqUBS9GZvsLyxOqzGYmcWeAOFoda25yyWrdYdl7UjzKi9mADxSD0wu0h0CpGzBl5CRD%2F%2F8T%2ByyZ%2F0o28e%2B99%2Fw8YKHBqmtehivHrTB80yMo4s2FoeAxHrU%2B6AY%2Fe7NP1Wv9WyqkZcSvX%2BG5WU0xYYGx83qNuMApAl%2BjIYUBGv53Ry%2FahRdcrR2PYKsSC7asRF7R3Hc3uZrylsbThQ0may2IPLVjobHMr&X-Amz-Signature=5748883be44610791760149888caf124f1b8a67b90d0c183ef270bcc5384244f&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

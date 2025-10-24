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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466SWSBM6ZQ%2F20251024%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251024T004709Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJj%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCY36nqaCDSMlwJ1YxQmPpeDv8ZrcTwJI7Ic5CXFeAVTwIhANhhlreCdDs1VlOfWzOXqB0ALh6qR7WFO9MD46SiI9z3Kv8DCFEQABoMNjM3NDIzMTgzODA1IgzbTaCOIXy9DRpk%2BvQq3APfDp2NIQ4yJ%2FKlPLNHkpMje%2BIO5UzyuzFKwd4NzUMr7e4SUfjGSVHvxoS1D4aGXHIubHVkadzJkAMoq55ZnXB73DF7hig0mfROOCGw6NU4rDnz4lJGrMvKcuri3XcI5JLxZKPyWf0%2BtB2RmLkDwN0jem4UA%2FZHEeXLn0R93%2FK%2BT%2BnWer%2BFiENBauIm3qytRPITeoZ4zjS4sz4l%2BGzCeHT78MYEIhQRTZiJT9VF77A6SzM4AHXn1gSr%2BLebJkYh7ABdqMsOkHUgIcThJ6fyi8fN8NaI%2BpHoz72WNryw8MZVcA55vNEQ4Ve9O%2BKa0ejDELddvUGxXvqreY6ZARIAhmxoHwzboqJxOpkaZqf3rt%2Fc72qmqF32twGMS5RPK3Ikr8ft%2FW8%2FkPTeGlrPiF1k5glLAa5uHKLAMBR%2BW3CxkXTs4dPp9KwSjKl0Y%2BAGyCwYdTeYaq4WTpDbGttBjUwTt0LB%2BtxL5Ef8N5x%2FaygI4fSxFUee6mRHGf3jAaiN0HJLyJWpPQsTrAcD8gIxOj7LOZLnOwWizn23sVNE9k%2FtRjnhtNIEErudlRoOKZs%2BhjTrQL4p5s60mdUD8Xjwh4ityQQvDIos9F7VtCzn22CTf%2Fo6LTPXPeKN%2BmSRsBItwDDR%2F%2BrHBjqkAWbAFBReqsurpqx0tWs169vBU8VYxn4aDY3%2F6ck5F%2Ff0sUeIXFtSLijG3vA4a52ePJPiNxAxVJ6ji%2BuwA%2Bom4NiN8bjbC3MyF5xv8lN%2BaBD4Z1O29R88bzVbJTb57EeMAJ6Ys2qxqasI51juueuvFrwZh9Zwp4uXeFzrqIZeWnXVld9dYR91bLGvI5cdUN0xaImp4ZdBtFBXUYjMnAUW7gA4PJIB&X-Amz-Signature=105eb1d5bcda7c1010c8317ac16d37ea27f325bf3b360966f7099a25140e20ed&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466SWSBM6ZQ%2F20251024%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251024T004709Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJj%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCY36nqaCDSMlwJ1YxQmPpeDv8ZrcTwJI7Ic5CXFeAVTwIhANhhlreCdDs1VlOfWzOXqB0ALh6qR7WFO9MD46SiI9z3Kv8DCFEQABoMNjM3NDIzMTgzODA1IgzbTaCOIXy9DRpk%2BvQq3APfDp2NIQ4yJ%2FKlPLNHkpMje%2BIO5UzyuzFKwd4NzUMr7e4SUfjGSVHvxoS1D4aGXHIubHVkadzJkAMoq55ZnXB73DF7hig0mfROOCGw6NU4rDnz4lJGrMvKcuri3XcI5JLxZKPyWf0%2BtB2RmLkDwN0jem4UA%2FZHEeXLn0R93%2FK%2BT%2BnWer%2BFiENBauIm3qytRPITeoZ4zjS4sz4l%2BGzCeHT78MYEIhQRTZiJT9VF77A6SzM4AHXn1gSr%2BLebJkYh7ABdqMsOkHUgIcThJ6fyi8fN8NaI%2BpHoz72WNryw8MZVcA55vNEQ4Ve9O%2BKa0ejDELddvUGxXvqreY6ZARIAhmxoHwzboqJxOpkaZqf3rt%2Fc72qmqF32twGMS5RPK3Ikr8ft%2FW8%2FkPTeGlrPiF1k5glLAa5uHKLAMBR%2BW3CxkXTs4dPp9KwSjKl0Y%2BAGyCwYdTeYaq4WTpDbGttBjUwTt0LB%2BtxL5Ef8N5x%2FaygI4fSxFUee6mRHGf3jAaiN0HJLyJWpPQsTrAcD8gIxOj7LOZLnOwWizn23sVNE9k%2FtRjnhtNIEErudlRoOKZs%2BhjTrQL4p5s60mdUD8Xjwh4ityQQvDIos9F7VtCzn22CTf%2Fo6LTPXPeKN%2BmSRsBItwDDR%2F%2BrHBjqkAWbAFBReqsurpqx0tWs169vBU8VYxn4aDY3%2F6ck5F%2Ff0sUeIXFtSLijG3vA4a52ePJPiNxAxVJ6ji%2BuwA%2Bom4NiN8bjbC3MyF5xv8lN%2BaBD4Z1O29R88bzVbJTb57EeMAJ6Ys2qxqasI51juueuvFrwZh9Zwp4uXeFzrqIZeWnXVld9dYR91bLGvI5cdUN0xaImp4ZdBtFBXUYjMnAUW7gA4PJIB&X-Amz-Signature=d81a79023283cfdf0d2d064c2badab7777e33f7267f03109734d91718220cb48&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

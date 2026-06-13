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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4666KRAA3ZT%2F20260613%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260613T190650Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEGsaCXVzLXdlc3QtMiJGMEQCIGF9X2e29D6TJwI6L7yjpSkqiPxNySjXYwNBSf1VaRf3AiAjr1jpAzdemLxTOkCsZUgNlkfUNdiebkjsujzj4CJpuCr%2FAwg0EAAaDDYzNzQyMzE4MzgwNSIMNUWaMtMu4VDDsSxLKtwD3e02AN%2B9zqMA5EYujWUeyX4IT5vsuqp8K%2F7mzhl%2FxWS2pXCRKM52oJFq2ezdHfVJGCZmlIPN4v%2FGJwncnsRvepgA3yp6jNvh5jyFLrHAdGJZuJ940OyDUJHVBOeGn07iOUecAZvfr%2Fo1j5ny0DBOgj7LUQYuO%2FJ4pZh65OkWphT37mQsw1XkhmZCM8nxfMoAlTqhPdYx%2B%2F1lqyVI%2BPp%2FB6qLGQ27u%2ByFAtdAmtUHuf2ePSuSpn%2BaywqNarw%2BZ5I7RUndeFr34DclK0filNXKW%2Fxv9SA5Hx0mffRdis%2BvcEnGL5q1S9s2%2FbX4A0gZrgCJfEGZSVkcavjSMKkXYeKkls2E8VnXBxgW42a67bb8pRJbBsFL9eAIQ2gp1F6P477hPhCOLE5FdgmUF8abOP%2BglMgY50XRbrV9Ki40PJmWpC9qVePHk6mG0c8yJMYuGrp3fiOBpE%2F%2B2wb2hshK5tOIMcnVG%2FgqYti0cwgB1SqLEdLO7w4KzcaMaJZqzbc10aGH3ylIQXuUtS2ErEakVhR72T0lcfEQp2yIZ8Y2gzFsAAaEbrj8fxCOxrLq%2B78Sv8cTg3fdCsqUm74Wmjas%2FTcNkQtv5sZ0RM1vcI2h%2F7gqBQCX8lRb1BaPZh0RYuswpcu20QY6pgHXlAG4hqQknYLauiFGSaMsj2m6JFY7qlS5kfS9FJsorEnbmT%2FtHi1JqFl3HaGAx4RKHGOEG1nX4u0v4VZvP6d0Jsn3ZXpKn8%2BW9%2FZIAp3cgWYqrouGfZgzDcf7ZSYNfNbIjC3qq0bE%2FhxaoETzi2WGc4pnm1ShrLlBnEvRSSCxmnWwmah%2F5sixO%2FFMT2vREd7uF0i2LhQUaKLgG%2BKplqgHc3MakWO5&X-Amz-Signature=a03fad5c92ebb458452a252471c8fd1d13ab66ea6eb8dc777f20bab387b3cc91&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4666KRAA3ZT%2F20260613%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260613T190650Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEGsaCXVzLXdlc3QtMiJGMEQCIGF9X2e29D6TJwI6L7yjpSkqiPxNySjXYwNBSf1VaRf3AiAjr1jpAzdemLxTOkCsZUgNlkfUNdiebkjsujzj4CJpuCr%2FAwg0EAAaDDYzNzQyMzE4MzgwNSIMNUWaMtMu4VDDsSxLKtwD3e02AN%2B9zqMA5EYujWUeyX4IT5vsuqp8K%2F7mzhl%2FxWS2pXCRKM52oJFq2ezdHfVJGCZmlIPN4v%2FGJwncnsRvepgA3yp6jNvh5jyFLrHAdGJZuJ940OyDUJHVBOeGn07iOUecAZvfr%2Fo1j5ny0DBOgj7LUQYuO%2FJ4pZh65OkWphT37mQsw1XkhmZCM8nxfMoAlTqhPdYx%2B%2F1lqyVI%2BPp%2FB6qLGQ27u%2ByFAtdAmtUHuf2ePSuSpn%2BaywqNarw%2BZ5I7RUndeFr34DclK0filNXKW%2Fxv9SA5Hx0mffRdis%2BvcEnGL5q1S9s2%2FbX4A0gZrgCJfEGZSVkcavjSMKkXYeKkls2E8VnXBxgW42a67bb8pRJbBsFL9eAIQ2gp1F6P477hPhCOLE5FdgmUF8abOP%2BglMgY50XRbrV9Ki40PJmWpC9qVePHk6mG0c8yJMYuGrp3fiOBpE%2F%2B2wb2hshK5tOIMcnVG%2FgqYti0cwgB1SqLEdLO7w4KzcaMaJZqzbc10aGH3ylIQXuUtS2ErEakVhR72T0lcfEQp2yIZ8Y2gzFsAAaEbrj8fxCOxrLq%2B78Sv8cTg3fdCsqUm74Wmjas%2FTcNkQtv5sZ0RM1vcI2h%2F7gqBQCX8lRb1BaPZh0RYuswpcu20QY6pgHXlAG4hqQknYLauiFGSaMsj2m6JFY7qlS5kfS9FJsorEnbmT%2FtHi1JqFl3HaGAx4RKHGOEG1nX4u0v4VZvP6d0Jsn3ZXpKn8%2BW9%2FZIAp3cgWYqrouGfZgzDcf7ZSYNfNbIjC3qq0bE%2FhxaoETzi2WGc4pnm1ShrLlBnEvRSSCxmnWwmah%2F5sixO%2FFMT2vREd7uF0i2LhQUaKLgG%2BKplqgHc3MakWO5&X-Amz-Signature=8e030afa40b62aff97f8e97d127a7af7bb3f39683d4272eae83e444685ec8b04&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4667S3IYAPI%2F20260506%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260506T080548Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEND%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIFx%2FLudiOGJUd1lPI5nnJqdlE0Vv%2FnppQBsSayezxeujAiEAjxDVOFdGVYtR3cQiQ0yb%2FdEvaSb%2B7MuI3mGaxaSxrsAqiAQImf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDFY3Sg7foRSci8E9WCrcA4OzqCcblbzEWGOELSPl3DRl0ip%2F4i7Yhl88tzDc4xCraebPSIwPLF1Kw6U%2Bkb15DEtfrIGj3c5kt9CJIVyBDKhP6GVnjmJ4hyD8HEsTfhuDvw%2BBVGpwvpCkXpOV2kHFeAN8Qarytp%2Bppb4bkqqC1Tnyu4J2AjEvFFWY1jdUuQ%2F2DqFZzGCm9bEcXb6uupw3kEkhWzgoCnQRrW%2F9w5XTcLRyj0GfHdXjznYB0UYzWrwzDS7XL8L0Q30iL%2BjDl2z7baHVZ4YrFi1AML4v4H6BwvzbY28IPPfUtClWGbMfmLtiEkG7WBZ9Ee1IMiKiMeAuQhp9boNfyjJe1GbI%2FM1tFRP9dcQmOpwL5hHvN3jCWN6evd3g24ZqusZmZ7%2FDZZe6OM5hnF21%2BkMK8cSHZv6ego%2FfRUImQTp0EErbrwQTiJMOOrUxP8ARY9lGvWUjgsUW5uPly00h1OCKKmKaiIquR3whU%2B5wrPS9ThUAJ5HrhQikPjSQFRfuNWmmY%2BI%2FcxpZxgaG23l6G3adVyDEFDdvK2J%2BWS5fYPNPyKkFkIuS%2BQG6ZR5jh1Fs%2BLlBL%2FM4b5%2FR9ol3iQIYp%2FFzbEvQcRTKUQHQ0f69D9QhfP396Ks92E52c7%2FcRQUHQdJ7MYNwMNnf688GOqUBDOrgZfCtxUApMdH7XrII7lYdyaOoaMzUTgVWmzwuzIkplPcX6e7O7qVIMXJGlFUPbzB080%2Bb06pY%2FFCMRR19pRyf%2FDNl%2BcS95iIJS51%2F3ipH4Uyhi4Uezr2IIZwQPM%2FLiAGfh0PAy2Au9pgFRPt72iX6qsyFS1Jqb%2FyfZ%2F%2BGJ2Tkdw3JF3YljCporwrOwO3pbl0hn%2BMC5XTN66%2BVJkh1TW4pt54X&X-Amz-Signature=c88b4e4c225ba2af20ecb825572a1d8294102bd58ac06d208373e9f4889efba6&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4667S3IYAPI%2F20260506%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260506T080548Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEND%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIFx%2FLudiOGJUd1lPI5nnJqdlE0Vv%2FnppQBsSayezxeujAiEAjxDVOFdGVYtR3cQiQ0yb%2FdEvaSb%2B7MuI3mGaxaSxrsAqiAQImf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDFY3Sg7foRSci8E9WCrcA4OzqCcblbzEWGOELSPl3DRl0ip%2F4i7Yhl88tzDc4xCraebPSIwPLF1Kw6U%2Bkb15DEtfrIGj3c5kt9CJIVyBDKhP6GVnjmJ4hyD8HEsTfhuDvw%2BBVGpwvpCkXpOV2kHFeAN8Qarytp%2Bppb4bkqqC1Tnyu4J2AjEvFFWY1jdUuQ%2F2DqFZzGCm9bEcXb6uupw3kEkhWzgoCnQRrW%2F9w5XTcLRyj0GfHdXjznYB0UYzWrwzDS7XL8L0Q30iL%2BjDl2z7baHVZ4YrFi1AML4v4H6BwvzbY28IPPfUtClWGbMfmLtiEkG7WBZ9Ee1IMiKiMeAuQhp9boNfyjJe1GbI%2FM1tFRP9dcQmOpwL5hHvN3jCWN6evd3g24ZqusZmZ7%2FDZZe6OM5hnF21%2BkMK8cSHZv6ego%2FfRUImQTp0EErbrwQTiJMOOrUxP8ARY9lGvWUjgsUW5uPly00h1OCKKmKaiIquR3whU%2B5wrPS9ThUAJ5HrhQikPjSQFRfuNWmmY%2BI%2FcxpZxgaG23l6G3adVyDEFDdvK2J%2BWS5fYPNPyKkFkIuS%2BQG6ZR5jh1Fs%2BLlBL%2FM4b5%2FR9ol3iQIYp%2FFzbEvQcRTKUQHQ0f69D9QhfP396Ks92E52c7%2FcRQUHQdJ7MYNwMNnf688GOqUBDOrgZfCtxUApMdH7XrII7lYdyaOoaMzUTgVWmzwuzIkplPcX6e7O7qVIMXJGlFUPbzB080%2Bb06pY%2FFCMRR19pRyf%2FDNl%2BcS95iIJS51%2F3ipH4Uyhi4Uezr2IIZwQPM%2FLiAGfh0PAy2Au9pgFRPt72iX6qsyFS1Jqb%2FyfZ%2F%2BGJ2Tkdw3JF3YljCporwrOwO3pbl0hn%2BMC5XTN66%2BVJkh1TW4pt54X&X-Amz-Signature=cd84222f1695a0fdee8dab1e71dac4696cc5aa9ddb57c209f9819a6a8eeeaddf&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

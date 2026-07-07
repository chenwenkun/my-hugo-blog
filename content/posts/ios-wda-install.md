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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466XPPECI4A%2F20260707%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260707T193917Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEKv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCYKi%2FLOyw0%2F9Osp2BDy1ZH2d7OGtqXhZ3p55U0c8s%2F3AIhANo9nUunMRfJ8LMiioG9Hg%2BTexhcXYf5J0h9p3TxFhnxKv8DCHQQABoMNjM3NDIzMTgzODA1IgyWaDlnmyHNJcTlSfoq3AMKzlwHIqakHQ78EO%2BbruIHXDRRexsc5mB7nxWHFMkQtcoOViTRZnDu7Id%2Fa5O1%2BCZkD2c8THWnrD4L3SESpYujF3QuoS6dkekaKdAJLkrEElYxS2qOmaFpBCCIi9P9s%2B9iYe4XWw7pq1CcJXkowfSeZFrULjP9FZ%2BhqcupMEpP%2FXvxJCO6CjLyegaRpeeFR6NFtQX5Dty29v2Of6Ie1F1CvvwXBvxa6%2F7JPsdaz1mFJNLUIHAwif8Z3rV%2BEqzTjNDH4aN0W1QmH1CjEGHzZ%2B4ZbdA9cclAoxlXvW9FxH7HgUWwVTS8l%2BNsn8TbIsRCMxMh%2FLRB96WIgfES7t6ZbytPxFM8X%2BNiuhcAxq7Vyql2fzorXsiixJcc%2BOyhYC3%2FXmaEKkQ%2B7L0kqxx311%2BhBHTwWL0Mmm4mkK6AX%2B2cYXmpn%2FD7AVtzwJcB0%2BJjwOVWATwLQO97ep2kBOdThmrYhUdObIa4xeQ2b7KziOpKnDccfq5iI9jb%2BLfqjbYjm226NcyZMY0sUOueWVbgtaQq3c3BeIBQHCrtYPTl6HTqlUgMPPilXnE1rDrCSITy6o4pEGboyUcOmaoKZJCjsq9n7HlsyhQtZg4biTwYK67isZ%2BY9by43iI%2FQH0x8i4uOTC6mrXSBjqkAdfQrMdDrl01jI1cDrPNzHj8nvZuaGGrP9BGpt4hTwg8c4wXj4iiHVGS8wdNoQ8MFds%2B%2BfSLJNSg1FloNEElGN%2B0kYeqJi6tS5M7Np4KIwf91BuI5F%2FbfaduhRu4GM%2F2LDyA%2B0ww1TXY0VV%2FrT2hLfHYgouR69bFJRBBWOn19NVugAlqwciw4OIN%2FeDYGH0nLzkVEMudz0ru0ACjLmTbE1NUTdF%2B&X-Amz-Signature=cef5802b3a9dfdb44623fbdb0209a006b852fc583668638a76507dd9fa8e4810&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466XPPECI4A%2F20260707%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260707T193917Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEKv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCYKi%2FLOyw0%2F9Osp2BDy1ZH2d7OGtqXhZ3p55U0c8s%2F3AIhANo9nUunMRfJ8LMiioG9Hg%2BTexhcXYf5J0h9p3TxFhnxKv8DCHQQABoMNjM3NDIzMTgzODA1IgyWaDlnmyHNJcTlSfoq3AMKzlwHIqakHQ78EO%2BbruIHXDRRexsc5mB7nxWHFMkQtcoOViTRZnDu7Id%2Fa5O1%2BCZkD2c8THWnrD4L3SESpYujF3QuoS6dkekaKdAJLkrEElYxS2qOmaFpBCCIi9P9s%2B9iYe4XWw7pq1CcJXkowfSeZFrULjP9FZ%2BhqcupMEpP%2FXvxJCO6CjLyegaRpeeFR6NFtQX5Dty29v2Of6Ie1F1CvvwXBvxa6%2F7JPsdaz1mFJNLUIHAwif8Z3rV%2BEqzTjNDH4aN0W1QmH1CjEGHzZ%2B4ZbdA9cclAoxlXvW9FxH7HgUWwVTS8l%2BNsn8TbIsRCMxMh%2FLRB96WIgfES7t6ZbytPxFM8X%2BNiuhcAxq7Vyql2fzorXsiixJcc%2BOyhYC3%2FXmaEKkQ%2B7L0kqxx311%2BhBHTwWL0Mmm4mkK6AX%2B2cYXmpn%2FD7AVtzwJcB0%2BJjwOVWATwLQO97ep2kBOdThmrYhUdObIa4xeQ2b7KziOpKnDccfq5iI9jb%2BLfqjbYjm226NcyZMY0sUOueWVbgtaQq3c3BeIBQHCrtYPTl6HTqlUgMPPilXnE1rDrCSITy6o4pEGboyUcOmaoKZJCjsq9n7HlsyhQtZg4biTwYK67isZ%2BY9by43iI%2FQH0x8i4uOTC6mrXSBjqkAdfQrMdDrl01jI1cDrPNzHj8nvZuaGGrP9BGpt4hTwg8c4wXj4iiHVGS8wdNoQ8MFds%2B%2BfSLJNSg1FloNEElGN%2B0kYeqJi6tS5M7Np4KIwf91BuI5F%2FbfaduhRu4GM%2F2LDyA%2B0ww1TXY0VV%2FrT2hLfHYgouR69bFJRBBWOn19NVugAlqwciw4OIN%2FeDYGH0nLzkVEMudz0ru0ACjLmTbE1NUTdF%2B&X-Amz-Signature=abc362ad37c59096aedd951d3a07cc4a0a3e83bd4eeabd977b03f9e66a9944de&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

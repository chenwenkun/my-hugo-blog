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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4666EJJ5XFJ%2F20251219%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251219T005637Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjENj%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCJKUEPpjyzmcKJ8LANgYST2iLo0FCB9gb9tn8qXrPajwIhAMdN6Wuu8UkqJzwVmmQSHz5bWIpM3PTxtAleC%2Fu68SrBKogECKH%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgynnKxhkZOwxbRpNssq3AOPpBPrELVKR3sFdGpr0urGkKS5glEiY5DVpgoYTvXp2YmJ0XFXYNUU5MS%2BczQwcZ2kKB0BDJ3yQlIeaFMCmhWFtVG3egllEUMElFjP%2BDGOCErqdvY%2FVuGghFNv7YUGNotRGvVVYV%2BLitbYJ33unpoNaDiDTZO1rhl8ussaQzqwvXyJCJa7hwB14X8voiDAuHT%2Fary2ndWO4%2BbgmxGL8toHDhs5OoMWP8S2fotqzypId5gyrqTMousktcI51ZKMC0L6g4HyCBbh%2FSNWDLaSXbm8z%2FBV0PnrQF5AGsHwaQ%2F3X%2FCvfxkoFnth%2F7tYB8HWJ8ffZle5TFuqnS2gBPk3XQ1Raqxbv%2FqB7AVA1gG1WhJHSMGTCcTFdwP8QLXbfdqeNJYQELNUMcc5Ofha3li6txB%2Bgkw01ZR8dfcSSGMwSZpGR7xqLfEff8EkfiGN6FfdH3zxDZ6P8WYjmp2NOP7SVW9pPtqfuYYEnBZNGrglrwyVFri8ZGpb0g5bUY11ZEewVj%2FbnmR%2BDdiH1TbZ3hht2VmF%2BWOmreWQ9pSCWXlwPNwSWwWpJ5R3%2BOsOyi%2BBHS879Krsy0kdHDj%2FXRI568B5OX8CKoFpPoK8ozVkX03noannoZhIqANNyOluenZY%2FzCIrpLKBjqkAUWHYSjQn8xEXPvYCSzf8yd8mSK2ooh3FtuV4Wtg%2Fj2A6p8KA%2FUruF%2FVt0r8yw8tU0mysJ%2Bxbtz677x0sD%2BZyPut4SCQ90el9yfkgxuLRp7Es%2BqOcsQwA3A845bbWpdjEwNKvKRonEpDCTPyourqJsq2gFwPspyiaKXe8J2hBOIlCrkN0SZ4m3cfbD%2BKBFTbChHezuipOlkHSuo6fpvsX5TFPWH4&X-Amz-Signature=e094705356ea306f462199a36c9744183dc396c7c4f7b502cf25b0167165fbf4&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4666EJJ5XFJ%2F20251219%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251219T005637Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjENj%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCJKUEPpjyzmcKJ8LANgYST2iLo0FCB9gb9tn8qXrPajwIhAMdN6Wuu8UkqJzwVmmQSHz5bWIpM3PTxtAleC%2Fu68SrBKogECKH%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgynnKxhkZOwxbRpNssq3AOPpBPrELVKR3sFdGpr0urGkKS5glEiY5DVpgoYTvXp2YmJ0XFXYNUU5MS%2BczQwcZ2kKB0BDJ3yQlIeaFMCmhWFtVG3egllEUMElFjP%2BDGOCErqdvY%2FVuGghFNv7YUGNotRGvVVYV%2BLitbYJ33unpoNaDiDTZO1rhl8ussaQzqwvXyJCJa7hwB14X8voiDAuHT%2Fary2ndWO4%2BbgmxGL8toHDhs5OoMWP8S2fotqzypId5gyrqTMousktcI51ZKMC0L6g4HyCBbh%2FSNWDLaSXbm8z%2FBV0PnrQF5AGsHwaQ%2F3X%2FCvfxkoFnth%2F7tYB8HWJ8ffZle5TFuqnS2gBPk3XQ1Raqxbv%2FqB7AVA1gG1WhJHSMGTCcTFdwP8QLXbfdqeNJYQELNUMcc5Ofha3li6txB%2Bgkw01ZR8dfcSSGMwSZpGR7xqLfEff8EkfiGN6FfdH3zxDZ6P8WYjmp2NOP7SVW9pPtqfuYYEnBZNGrglrwyVFri8ZGpb0g5bUY11ZEewVj%2FbnmR%2BDdiH1TbZ3hht2VmF%2BWOmreWQ9pSCWXlwPNwSWwWpJ5R3%2BOsOyi%2BBHS879Krsy0kdHDj%2FXRI568B5OX8CKoFpPoK8ozVkX03noannoZhIqANNyOluenZY%2FzCIrpLKBjqkAUWHYSjQn8xEXPvYCSzf8yd8mSK2ooh3FtuV4Wtg%2Fj2A6p8KA%2FUruF%2FVt0r8yw8tU0mysJ%2Bxbtz677x0sD%2BZyPut4SCQ90el9yfkgxuLRp7Es%2BqOcsQwA3A845bbWpdjEwNKvKRonEpDCTPyourqJsq2gFwPspyiaKXe8J2hBOIlCrkN0SZ4m3cfbD%2BKBFTbChHezuipOlkHSuo6fpvsX5TFPWH4&X-Amz-Signature=dceb098ac715ed94fd26945f382183e555399bacabaf3b506ac45929da7bafbb&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

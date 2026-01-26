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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466SYUZRHXH%2F20260126%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260126T010342Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEGcaCXVzLXdlc3QtMiJHMEUCIQDE6kJYJ1BM1xvK6kArKBDgYLLr5JNEsLjHUyjaW%2B3dWQIgKbfhW7VSC4e3NnFxbRVhxIXSkmOP0XAK8rjDTZTplpUq%2FwMIMBAAGgw2Mzc0MjMxODM4MDUiDFGGBvYBqQYwhAK9rSrcAymY3kyb97OlfH1iat21X2hO4ztGUIg4Dqw6mEqsRDkngd%2BY%2BSJhVDK6VveuiqYqjJh0zYt%2BcBuPUwAa8hrptcViv832%2FiHWHCjbe%2BphQcrVRtARTTFrwOUvywbaCPfDcTK%2FNge%2FBQRa3b8MVMUp7VXwdMgW6v%2B1FHD9X%2Bd5NOjdXIuVfioJoIosK5vHgsPdlk1hLAtSM7sQPmwTGJHDVx2ZhRweN37TgG%2BvO0%2FdhCIZRSJtz5dpNZQkPcfM0IAUjJS4VKSwMyeznbdey%2FX0sDuL%2BI58qMCxEGT2telSGkjuC%2BfLjKgR96eUGXw6kEasK6Y8CFRXTOnRsx%2FnDmlo6anIzVdd%2F6X8JNq10wSxyY6xrGPS%2FzWZNUKQ1ykZihUO7PPlinv4P2LTFPFZtQD6XDsFO%2BcFf3P4bOVEpd4YZ9UXKQSHOhU3hYK%2FzkQsRQDDu98WSz0cRbk5cVVvH3ygmebUg8oBf4g6Xkkk1lkiPhjV6Rtf5R%2BGCKNa3ogSvsK%2FFp7y5NYshq5p5L5AvGSZ%2FlyLWjVNbS9Sa2r%2BndTbu8Ij4M70IPaJ2Xpeicl5o10xwlI7GkE2zS68eu92INJHYqnMeo%2Bg7km5AwXPTQWBJFqnejFPaZgwEVipXWjSMJqx2ssGOqUBIBhloleKZ7lGg793wGOsCQLHhQ6mWdTEFis7gN%2BOxfJeeoxDsz0xGIxC1mVaeE5adVUCHp%2BWp61S3M0jZDJyAfwe%2FxBn8yJUB6GEgPd%2FzG2oesfFArqHy9dhw09H5k9q0OnJljeXgza1H8Fu%2FLno8ILy2gbi92e6Io0pU7xzk2uhHrXtVhPlnsy95ACYlYZCF4l3h5KYUzpr7tQpifHWAx9NV6%2F0&X-Amz-Signature=3501e047d39ef0bb56b5089890c85e4e2cba1f8db0bc370251be25a128aa378b&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466SYUZRHXH%2F20260126%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260126T010342Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEGcaCXVzLXdlc3QtMiJHMEUCIQDE6kJYJ1BM1xvK6kArKBDgYLLr5JNEsLjHUyjaW%2B3dWQIgKbfhW7VSC4e3NnFxbRVhxIXSkmOP0XAK8rjDTZTplpUq%2FwMIMBAAGgw2Mzc0MjMxODM4MDUiDFGGBvYBqQYwhAK9rSrcAymY3kyb97OlfH1iat21X2hO4ztGUIg4Dqw6mEqsRDkngd%2BY%2BSJhVDK6VveuiqYqjJh0zYt%2BcBuPUwAa8hrptcViv832%2FiHWHCjbe%2BphQcrVRtARTTFrwOUvywbaCPfDcTK%2FNge%2FBQRa3b8MVMUp7VXwdMgW6v%2B1FHD9X%2Bd5NOjdXIuVfioJoIosK5vHgsPdlk1hLAtSM7sQPmwTGJHDVx2ZhRweN37TgG%2BvO0%2FdhCIZRSJtz5dpNZQkPcfM0IAUjJS4VKSwMyeznbdey%2FX0sDuL%2BI58qMCxEGT2telSGkjuC%2BfLjKgR96eUGXw6kEasK6Y8CFRXTOnRsx%2FnDmlo6anIzVdd%2F6X8JNq10wSxyY6xrGPS%2FzWZNUKQ1ykZihUO7PPlinv4P2LTFPFZtQD6XDsFO%2BcFf3P4bOVEpd4YZ9UXKQSHOhU3hYK%2FzkQsRQDDu98WSz0cRbk5cVVvH3ygmebUg8oBf4g6Xkkk1lkiPhjV6Rtf5R%2BGCKNa3ogSvsK%2FFp7y5NYshq5p5L5AvGSZ%2FlyLWjVNbS9Sa2r%2BndTbu8Ij4M70IPaJ2Xpeicl5o10xwlI7GkE2zS68eu92INJHYqnMeo%2Bg7km5AwXPTQWBJFqnejFPaZgwEVipXWjSMJqx2ssGOqUBIBhloleKZ7lGg793wGOsCQLHhQ6mWdTEFis7gN%2BOxfJeeoxDsz0xGIxC1mVaeE5adVUCHp%2BWp61S3M0jZDJyAfwe%2FxBn8yJUB6GEgPd%2FzG2oesfFArqHy9dhw09H5k9q0OnJljeXgza1H8Fu%2FLno8ILy2gbi92e6Io0pU7xzk2uhHrXtVhPlnsy95ACYlYZCF4l3h5KYUzpr7tQpifHWAx9NV6%2F0&X-Amz-Signature=ec4c26c39b1bcf56008ab5ddc93e9fdc7fcd6d4569a755ddc1b11938a7c1cf20&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

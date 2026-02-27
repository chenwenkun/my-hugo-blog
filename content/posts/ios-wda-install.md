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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466QEYPNZDL%2F20260227%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260227T182705Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEHoaCXVzLXdlc3QtMiJHMEUCIQClBNNcspcthpXdXO2zXp1MW5J9rIztu5E1y%2BApm644jwIgLLwL6tFkaZdQkbWNVvn2w%2FPdeSGodGUXna65zIJBAL4q%2FwMIQxAAGgw2Mzc0MjMxODM4MDUiDEEi3pmM%2BHmrYHbM3SrcA05XkNNwJZHpnGg6JL0M%2BC1VSy%2FsqOAcdZAnq95QT0Je1h1F429ylX0sfrp%2ByP1PIowgRXu6weGfafM5e2%2B%2FphiuXhgFH0p%2FPJ%2BjIGQgYd%2BYNkLrxe6q3WqPkkIJt1asU2%2FBkKvfNsGV3RsLNpmLu6Hd2OvBDU7PH0HHC5uYZ%2FZs5XVgdNrnjqNSLKGIRSZLx40Gldrpx1NYo8kIhq%2F2vNnc5T%2Bsq6cWKCN3M7XY%2FBoQlOhAWWfay6WnWEpv9fnRZb5tHAlYCQKGmDEB8V6%2BlrONaeMpI92RaFSn6r0d5PU%2FMMGsRdp9K%2FEnUBPjT4J8IEBYzrNy3oJj2C6c7phxSasJP3T5gWd5UBmVGxrE1yYPxoLTLpvKxMBj0WQ%2BwRgNvH8x%2FgcuUBzapN2%2FMOPOXeXNe1ClNoodPVKXNlHVrTrkxLFcLxcK%2FJMbUlWt39MXjsUNkjsS2YNcqie%2Fw34V1isBced7UJlU%2Bq4JhuzIarLS%2F4nMVwTZob57T3en8plBooJ6r8zSQ3WwmtHTtfglAAG9PizLwA%2BNo1M6W9IY55uUWg%2FJZc1PWWoWMITC7QGuvS2hSOW6yZgBuef1vQQLSKkdZNzEeF%2BvxtfOsjL4KTjN%2F6xS%2BOBCM%2Bu7syKHMPu1h80GOqUBpy%2BKuUkNZyq7ysot2QiWDx9vDhHmFmieLeQZhYHig%2BqxXp9Qap%2BTWhDZ5kHqamYBKo8Dh3cNv8DB53hCA5K0S%2FajsBgp70A9VhGRAJBcxTuY6l3a2R5bOfOgk%2FfMc1meRwAlkGy3OU8WFd%2B7cfdHwPo26V2TQwy2iEs3CfruFvKvSXllBf7B2miZ0uGOB0H0Cc9bbbzEnO32GxWN2yCEYoSLtstC&X-Amz-Signature=bb1567ccaa23cac20473cf6341079ab4505c0ec1a9dc933f5d23ac937bc1249f&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466QEYPNZDL%2F20260227%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260227T182705Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEHoaCXVzLXdlc3QtMiJHMEUCIQClBNNcspcthpXdXO2zXp1MW5J9rIztu5E1y%2BApm644jwIgLLwL6tFkaZdQkbWNVvn2w%2FPdeSGodGUXna65zIJBAL4q%2FwMIQxAAGgw2Mzc0MjMxODM4MDUiDEEi3pmM%2BHmrYHbM3SrcA05XkNNwJZHpnGg6JL0M%2BC1VSy%2FsqOAcdZAnq95QT0Je1h1F429ylX0sfrp%2ByP1PIowgRXu6weGfafM5e2%2B%2FphiuXhgFH0p%2FPJ%2BjIGQgYd%2BYNkLrxe6q3WqPkkIJt1asU2%2FBkKvfNsGV3RsLNpmLu6Hd2OvBDU7PH0HHC5uYZ%2FZs5XVgdNrnjqNSLKGIRSZLx40Gldrpx1NYo8kIhq%2F2vNnc5T%2Bsq6cWKCN3M7XY%2FBoQlOhAWWfay6WnWEpv9fnRZb5tHAlYCQKGmDEB8V6%2BlrONaeMpI92RaFSn6r0d5PU%2FMMGsRdp9K%2FEnUBPjT4J8IEBYzrNy3oJj2C6c7phxSasJP3T5gWd5UBmVGxrE1yYPxoLTLpvKxMBj0WQ%2BwRgNvH8x%2FgcuUBzapN2%2FMOPOXeXNe1ClNoodPVKXNlHVrTrkxLFcLxcK%2FJMbUlWt39MXjsUNkjsS2YNcqie%2Fw34V1isBced7UJlU%2Bq4JhuzIarLS%2F4nMVwTZob57T3en8plBooJ6r8zSQ3WwmtHTtfglAAG9PizLwA%2BNo1M6W9IY55uUWg%2FJZc1PWWoWMITC7QGuvS2hSOW6yZgBuef1vQQLSKkdZNzEeF%2BvxtfOsjL4KTjN%2F6xS%2BOBCM%2Bu7syKHMPu1h80GOqUBpy%2BKuUkNZyq7ysot2QiWDx9vDhHmFmieLeQZhYHig%2BqxXp9Qap%2BTWhDZ5kHqamYBKo8Dh3cNv8DB53hCA5K0S%2FajsBgp70A9VhGRAJBcxTuY6l3a2R5bOfOgk%2FfMc1meRwAlkGy3OU8WFd%2B7cfdHwPo26V2TQwy2iEs3CfruFvKvSXllBf7B2miZ0uGOB0H0Cc9bbbzEnO32GxWN2yCEYoSLtstC&X-Amz-Signature=27eee30ea6d8e48dfcf95645fcc87bb6f3e2f707b46f43c6485b1d5182e32406&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

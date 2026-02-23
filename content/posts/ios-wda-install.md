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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663Y6AAPAD%2F20260223%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260223T011135Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEAkaCXVzLXdlc3QtMiJHMEUCIB7jSVWs9Ig9T89ygBZDv33kDZH4RkmZt029Z6TNnHzcAiEA3E4kJkTNlggXtB3hvuziSCI83WzQTCUxfOVJOiS4IDUqiAQI0v%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDP0rBJRp%2BFqyhwmE5SrcA5PjXr42BUoNQbMyH7ZwVg%2BFrOPqhH0cSXE1As6VY4DrhuQKFeVLFxlNq1bc8Qp0mFxHA9eILpqPkIFXRQpU%2BYv9q4JbfNSY8AIaF9Hy%2BAiLH%2FWdFhWOanm2%2Bn5Xmqu16%2F5wV7icbHHAlCu2icYRZ%2Flmy4TzN2F2h0gpRqCat40qj7LwuVkkEpEALLel2d2bn6oxFL4C45aOB8ieRfoqmFD1JSm%2Fss%2B7B%2BwinQbH4WVn6yz%2B2OzP4D1IexzF690zhnPFxM9khJvES9ecxoLyFsclJdXx9tF1ixvXaqYUqkzKjOeHmWskquaJB%2BRj0YlBZyHoYHTxqFVhnDL%2BzkGNZm8yxdU6LymRNsL7f5mxqmj0LHE%2BdjulOMwNvH45hXRABtG9FKpIHIGKzKFtB9%2FadoevfP%2BS6bLlqeOkbD3NgsgDVo5caPdEgaRY3uIqocLvkBR132yFh9c4Drx%2BNGoKe9jqxCPYYAFt0MLvH4fks6SqfyozMOhY%2BQlHTT%2Fcocv0WVKHLxoCzM8zMA7ZkB02VYg6gw2eJLyw4gwwdhMFMywV4H%2FqtnonPFY3oZjX%2FxNXKL42xmSbjdT1Jte6uOE7C6EG2sfV3ddXN9GtTEQVsuro7BPW74%2B82ImfTZSNMIvD7swGOqUBVFpqNbgsFvkcSJLEkbnEFW43ls5WtPt9BALoJvvBStj4JX%2BFpC5e2aKeCl8MSgJq6eZxF3G1ZPGBxxm1YIbL4uGlnY%2FZ90tjdWN9bIzVG%2BvgEIzs1W3mK4Q7WMS%2FcPbo3G0MTNKwKbKbpUI0GiFIYKfmE9PGkJz5Hb0W3Fp3ZIzHHfltZEBb7dhY17LywDcHUeeOM81djqyw51M2VWJDlje4Ifxw&X-Amz-Signature=26dd13d2d53c386dde7798f619cfe55f2193491c707d2b7a22bf13830abfc3aa&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663Y6AAPAD%2F20260223%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260223T011135Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEAkaCXVzLXdlc3QtMiJHMEUCIB7jSVWs9Ig9T89ygBZDv33kDZH4RkmZt029Z6TNnHzcAiEA3E4kJkTNlggXtB3hvuziSCI83WzQTCUxfOVJOiS4IDUqiAQI0v%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDP0rBJRp%2BFqyhwmE5SrcA5PjXr42BUoNQbMyH7ZwVg%2BFrOPqhH0cSXE1As6VY4DrhuQKFeVLFxlNq1bc8Qp0mFxHA9eILpqPkIFXRQpU%2BYv9q4JbfNSY8AIaF9Hy%2BAiLH%2FWdFhWOanm2%2Bn5Xmqu16%2F5wV7icbHHAlCu2icYRZ%2Flmy4TzN2F2h0gpRqCat40qj7LwuVkkEpEALLel2d2bn6oxFL4C45aOB8ieRfoqmFD1JSm%2Fss%2B7B%2BwinQbH4WVn6yz%2B2OzP4D1IexzF690zhnPFxM9khJvES9ecxoLyFsclJdXx9tF1ixvXaqYUqkzKjOeHmWskquaJB%2BRj0YlBZyHoYHTxqFVhnDL%2BzkGNZm8yxdU6LymRNsL7f5mxqmj0LHE%2BdjulOMwNvH45hXRABtG9FKpIHIGKzKFtB9%2FadoevfP%2BS6bLlqeOkbD3NgsgDVo5caPdEgaRY3uIqocLvkBR132yFh9c4Drx%2BNGoKe9jqxCPYYAFt0MLvH4fks6SqfyozMOhY%2BQlHTT%2Fcocv0WVKHLxoCzM8zMA7ZkB02VYg6gw2eJLyw4gwwdhMFMywV4H%2FqtnonPFY3oZjX%2FxNXKL42xmSbjdT1Jte6uOE7C6EG2sfV3ddXN9GtTEQVsuro7BPW74%2B82ImfTZSNMIvD7swGOqUBVFpqNbgsFvkcSJLEkbnEFW43ls5WtPt9BALoJvvBStj4JX%2BFpC5e2aKeCl8MSgJq6eZxF3G1ZPGBxxm1YIbL4uGlnY%2FZ90tjdWN9bIzVG%2BvgEIzs1W3mK4Q7WMS%2FcPbo3G0MTNKwKbKbpUI0GiFIYKfmE9PGkJz5Hb0W3Fp3ZIzHHfltZEBb7dhY17LywDcHUeeOM81djqyw51M2VWJDlje4Ifxw&X-Amz-Signature=d9b3f7c28e9d98e623bff37e593b628e4dbd9c74aef1efafa61f8a2f54f22900&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

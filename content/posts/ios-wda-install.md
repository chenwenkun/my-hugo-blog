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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466SQDUFFV3%2F20260228%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260228T181855Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJD%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIATjq593exhXPVB7Ta1CUs9fXM2mgM6i4DVhVW%2FbUDXkAiEAuNnGu8%2BuUXns%2FDUpdAgJOiJwfHoCV%2BLA%2F2suU%2BUfXzIq%2FwMIWRAAGgw2Mzc0MjMxODM4MDUiDFb4EOZl3JMu66wz4yrcA0WsjffG0tSB15rcXn9LH4xAAOLkRU%2BOike0mSF7Mjc3xvlj6HtCVfUrY2%2F3S%2B6pKNpBOHio8yYnTrf2zN7Ur4UqS8RC6UyT6GM2IGdPg5goULdlTp5tq6G5NkDqstyxNaUnvFlpf7RDeymOH4s6EtKkWDv2AKdSWI1Npv4OZywj0xB5MOGuwlgNTAZwmhwWCVd5n%2BLG1hPufVDHz%2F2etm3QvN%2FqIPww1ucD6VBh%2BkA3q%2FGf1kdYh5m9D4Ai1%2BLTGyHd0WlO%2BhiUfNlSNAyj%2B1%2FpVC%2FKd%2Bs%2Fg4Vx%2Bbrj%2Fl07pBJrAGBWSDzt2cu4zmY97P963qpw%2F8ggWL4apXugZ63NsqWCdQ0qyb6qlWE%2BbBQ0kmwJyblw2oluzxtsJuyhl%2FQRJpaA9W0Fhw5rs6tmDsjFdFdNc9UHPjDkD0F%2Fsfv06ayxWsZIAuXODwyb%2FWUbhJX9MMK7iKaZ7AB%2FO1AbpO7d0gKDD%2BjkHSN5gDaeiVrViCP6mAvpsS7hLUh%2BBrEpC5hUy2Z4lRWXu4NZRdV00MHFr1aKlhphXLYdqJhOjuTL3P%2Bo6swiC6zG1OGBKdvHfmfnK22sQjTtDB4wKG%2FL%2F8pbm5a7TmMFFVRYYH%2BHREKbarOmE6lyfPGyFGa5MIuejM0GOqUB8324T5sqPrqaslvjI9G9AymRGUT71I184Uowks52X6c3qUo5Y2Uc3O6gTEizd%2FjjedfQNeXGa9jZBJGOBx%2BuYQmQkKQsYDP9vxycY259557IFzOY46MlE42Z3GIrwGh5jvH4K4kfmEwYbJJJHciYQqvnEb4Eb3XRKkdB5O%2FX3iF5jUYjY4cTsujAGJXyh8FfcBUZDi7%2FovFlaTa3xYxeBkQy4%2BPG&X-Amz-Signature=4cb353b8e7a9122b5682a3c960d0a0a9892f5311fa7cf79676b55135c6d6e9ea&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466SQDUFFV3%2F20260228%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260228T181855Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJD%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIATjq593exhXPVB7Ta1CUs9fXM2mgM6i4DVhVW%2FbUDXkAiEAuNnGu8%2BuUXns%2FDUpdAgJOiJwfHoCV%2BLA%2F2suU%2BUfXzIq%2FwMIWRAAGgw2Mzc0MjMxODM4MDUiDFb4EOZl3JMu66wz4yrcA0WsjffG0tSB15rcXn9LH4xAAOLkRU%2BOike0mSF7Mjc3xvlj6HtCVfUrY2%2F3S%2B6pKNpBOHio8yYnTrf2zN7Ur4UqS8RC6UyT6GM2IGdPg5goULdlTp5tq6G5NkDqstyxNaUnvFlpf7RDeymOH4s6EtKkWDv2AKdSWI1Npv4OZywj0xB5MOGuwlgNTAZwmhwWCVd5n%2BLG1hPufVDHz%2F2etm3QvN%2FqIPww1ucD6VBh%2BkA3q%2FGf1kdYh5m9D4Ai1%2BLTGyHd0WlO%2BhiUfNlSNAyj%2B1%2FpVC%2FKd%2Bs%2Fg4Vx%2Bbrj%2Fl07pBJrAGBWSDzt2cu4zmY97P963qpw%2F8ggWL4apXugZ63NsqWCdQ0qyb6qlWE%2BbBQ0kmwJyblw2oluzxtsJuyhl%2FQRJpaA9W0Fhw5rs6tmDsjFdFdNc9UHPjDkD0F%2Fsfv06ayxWsZIAuXODwyb%2FWUbhJX9MMK7iKaZ7AB%2FO1AbpO7d0gKDD%2BjkHSN5gDaeiVrViCP6mAvpsS7hLUh%2BBrEpC5hUy2Z4lRWXu4NZRdV00MHFr1aKlhphXLYdqJhOjuTL3P%2Bo6swiC6zG1OGBKdvHfmfnK22sQjTtDB4wKG%2FL%2F8pbm5a7TmMFFVRYYH%2BHREKbarOmE6lyfPGyFGa5MIuejM0GOqUB8324T5sqPrqaslvjI9G9AymRGUT71I184Uowks52X6c3qUo5Y2Uc3O6gTEizd%2FjjedfQNeXGa9jZBJGOBx%2BuYQmQkKQsYDP9vxycY259557IFzOY46MlE42Z3GIrwGh5jvH4K4kfmEwYbJJJHciYQqvnEb4Eb3XRKkdB5O%2FX3iF5jUYjY4cTsujAGJXyh8FfcBUZDi7%2FovFlaTa3xYxeBkQy4%2BPG&X-Amz-Signature=21b553f6765a8feb94c1b85b6663e62da88727c6d7847537b45f56630cb1a245&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

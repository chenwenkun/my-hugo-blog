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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663QV2DQ4Q%2F20251030%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251030T122128Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEDQaCXVzLXdlc3QtMiJHMEUCIQDD3d6crt8VJrBOloMcVSMwFkeQquxrwrc8iiayiZVgOQIgSIbhLofdoVIG8SVAI8QTIeDR338xJ%2FYsNnm6X4xbRcQqiAQI7f%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDIoUK7IfDqF0B8J42CrcAzBKNZZRLkXd9v0T9OtYxcmSsHPIi22bsA6f9pnSGXlGwMjngkz29zuo8Wv1orCMeo1yn%2BG1RAhxZTCGI63lJBj8zF%2B1P79jfLemCMzCKOwoFV%2FzkaCFxi14JmyDIIAFZkyPMekRaBT5SwfqFc3ZxHFikmfpjj2TEY%2B%2BwE4PAPjxHBgItRdEDkqGXUugrwDtnLVw7OS4GYTva4RH9Us96jfDwjN0OG%2Br%2Fsit%2Bau0Ah0z4m31PjBPu58yCa2siYmU5tYLx7xfM9BgGtRTKvFWJXWpEcXz0bUNSuWuitd3M8d3L1D0BOEEPMGPAuTWEeIug9Y3X8BRXq1ZJ1%2Fi2REBTn8s0aZVnIo6t1NLFdoBv9POcwYHIM6TKSXgJBaWG18lb4Ijlh8cGVUcLQq774WQFsaxquyv1gvzOyf1xvjmN0PIBFEiyUTBZgASdyIBLTij87DrO1H3o6LtDTTqMoFfH6G%2Bb2bFIGW0q4gGWHldD1FdEsDmC3rn8CoLEGy3YHJDvaJsksUSHzguZedU%2B%2FBqwwethCVinPWF%2FlKlClm136QVanDFXargsn2AnTcbLXKES4mRBc0kDxg9q212NgG6ktAPhkrtoUJ1VKYLF8F%2FHfZ4CWMmT701S2ABF1KKMOSqjcgGOqUBc79aixzl7PqNqz3GXWnt15xvf03W5a4wbf1J6uu5htiGVYs7kZNhRK90H41tBYQunqOgCTKIPTCaokpVXxJrfsVni3rsl8aXVMaefkMqHbpaQ4wGKWiFBdz9hCwQcwNQzAhwSggB1EROEKGpVH930akhfDcKUEnTegY%2BGeEWQU5oY6UEd3UILPe6sUKoohRE4NIQPJmFzhS4%2FmSKK6VwE52a%2FvnS&X-Amz-Signature=c1307d1c16a0617d897a7a3a569b89b80da5c9fdeeebf23955555989f6dfe8af&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663QV2DQ4Q%2F20251030%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251030T122128Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEDQaCXVzLXdlc3QtMiJHMEUCIQDD3d6crt8VJrBOloMcVSMwFkeQquxrwrc8iiayiZVgOQIgSIbhLofdoVIG8SVAI8QTIeDR338xJ%2FYsNnm6X4xbRcQqiAQI7f%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDIoUK7IfDqF0B8J42CrcAzBKNZZRLkXd9v0T9OtYxcmSsHPIi22bsA6f9pnSGXlGwMjngkz29zuo8Wv1orCMeo1yn%2BG1RAhxZTCGI63lJBj8zF%2B1P79jfLemCMzCKOwoFV%2FzkaCFxi14JmyDIIAFZkyPMekRaBT5SwfqFc3ZxHFikmfpjj2TEY%2B%2BwE4PAPjxHBgItRdEDkqGXUugrwDtnLVw7OS4GYTva4RH9Us96jfDwjN0OG%2Br%2Fsit%2Bau0Ah0z4m31PjBPu58yCa2siYmU5tYLx7xfM9BgGtRTKvFWJXWpEcXz0bUNSuWuitd3M8d3L1D0BOEEPMGPAuTWEeIug9Y3X8BRXq1ZJ1%2Fi2REBTn8s0aZVnIo6t1NLFdoBv9POcwYHIM6TKSXgJBaWG18lb4Ijlh8cGVUcLQq774WQFsaxquyv1gvzOyf1xvjmN0PIBFEiyUTBZgASdyIBLTij87DrO1H3o6LtDTTqMoFfH6G%2Bb2bFIGW0q4gGWHldD1FdEsDmC3rn8CoLEGy3YHJDvaJsksUSHzguZedU%2B%2FBqwwethCVinPWF%2FlKlClm136QVanDFXargsn2AnTcbLXKES4mRBc0kDxg9q212NgG6ktAPhkrtoUJ1VKYLF8F%2FHfZ4CWMmT701S2ABF1KKMOSqjcgGOqUBc79aixzl7PqNqz3GXWnt15xvf03W5a4wbf1J6uu5htiGVYs7kZNhRK90H41tBYQunqOgCTKIPTCaokpVXxJrfsVni3rsl8aXVMaefkMqHbpaQ4wGKWiFBdz9hCwQcwNQzAhwSggB1EROEKGpVH930akhfDcKUEnTegY%2BGeEWQU5oY6UEd3UILPe6sUKoohRE4NIQPJmFzhS4%2FmSKK6VwE52a%2FvnS&X-Amz-Signature=ed33733ac9d77d3bf032ee275e43abdfef62c97df174910b235c0ea37a65ea0a&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

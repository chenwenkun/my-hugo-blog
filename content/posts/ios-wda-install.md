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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466TUKOWLV3%2F20260412%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260412T012622Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEIn%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCP0nR5W34ymHUz2xbLk7sgB4ozBKZaQv5f9VvkyiFrSwIhALiO5Fl2cH5I3c1xuuxRzfXj9AN0u5Ub045oWOlowt9GKv8DCFIQABoMNjM3NDIzMTgzODA1Igz%2BjM5RbgF%2BwhqIOnQq3AMk9RhJQv25rKngAScMbkTJQjEeCIEnaNgNTaXjIrfdDRvtcz9mhfoDtFsYSnfiW%2BHIkSo3NoytsvE%2F6%2Fck2PFifrSaQqkiK5TTGtVJrply7aC5G0cpgzZRsnFGnxEm0DWfbFYGWMn2lQZiVPw7vTwFpNJvKsp0PbWCbfoD%2FB23DLvX%2Fvh5UKO3h3HnmIwfYY8WG%2B3lmxRDwOLmL3R7QpXdukjZE%2BIII7XmQsYY5agRvmoymZ86lXvfXenE58wyB07N4ogJtvhEiwAEXdzFCYR7KS2%2Bi8rzE0uEb8zTq%2B4isNTWaHJD0BfZ9P0wTnXGMWtIkTD77%2FBc0%2FKTN5BT4hS4lVSq0s9xUMs0ku5bj%2FT5pbp67ePYsuiarSQNzn0koUdCXQs4HwzeSuzB49cvX7ZuxCjO%2B%2FLiBszqfhEy4IPVW0mVI3M8wQeslmCSwN4K92%2BjOTNXws6OddFUq81g4t0nWND%2FHVyzhhDP4kPPi%2B6V2gZi4nLjQsDKRiv4bGUsqEN3z%2B9L6mms4KGbh%2B%2F9VD3vgQF%2F7lkovhXTJ6nS32UB5CbmfSbfhbG5odC5%2Bt%2F%2F%2BQPLa1eBGywsU%2F5ckSe4p85Dm6DvbdfV1meXeYyr2QWeyKw1yd%2FHnyhsKaOKujCE0uvOBjqkAeo9Z0fwEEFRvk574pTCXU%2FMaSuAGM9ZHyXx5YboORwCoLCLLU3DNy%2F47c%2FTrLXDFrBeGYa%2FGcH5gs7iIxWEldya6XYCZxvGKYK7wok3TIGEiMqDnz%2BzHwoSc99qBMF9YdI238x1N3SnmVm5tsDFUu5wPIHp1c0tBmYnAzYZj3FEPjdLXb0KtS36Tf1AXPhv%2FSykYdsyKBXLM%2F7vPaDyApxB7xLd&X-Amz-Signature=5ea430baac3973cbffdbe04d494e6d31750755f892132afeee4d84e8f2b2477a&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466TUKOWLV3%2F20260412%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260412T012622Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEIn%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCP0nR5W34ymHUz2xbLk7sgB4ozBKZaQv5f9VvkyiFrSwIhALiO5Fl2cH5I3c1xuuxRzfXj9AN0u5Ub045oWOlowt9GKv8DCFIQABoMNjM3NDIzMTgzODA1Igz%2BjM5RbgF%2BwhqIOnQq3AMk9RhJQv25rKngAScMbkTJQjEeCIEnaNgNTaXjIrfdDRvtcz9mhfoDtFsYSnfiW%2BHIkSo3NoytsvE%2F6%2Fck2PFifrSaQqkiK5TTGtVJrply7aC5G0cpgzZRsnFGnxEm0DWfbFYGWMn2lQZiVPw7vTwFpNJvKsp0PbWCbfoD%2FB23DLvX%2Fvh5UKO3h3HnmIwfYY8WG%2B3lmxRDwOLmL3R7QpXdukjZE%2BIII7XmQsYY5agRvmoymZ86lXvfXenE58wyB07N4ogJtvhEiwAEXdzFCYR7KS2%2Bi8rzE0uEb8zTq%2B4isNTWaHJD0BfZ9P0wTnXGMWtIkTD77%2FBc0%2FKTN5BT4hS4lVSq0s9xUMs0ku5bj%2FT5pbp67ePYsuiarSQNzn0koUdCXQs4HwzeSuzB49cvX7ZuxCjO%2B%2FLiBszqfhEy4IPVW0mVI3M8wQeslmCSwN4K92%2BjOTNXws6OddFUq81g4t0nWND%2FHVyzhhDP4kPPi%2B6V2gZi4nLjQsDKRiv4bGUsqEN3z%2B9L6mms4KGbh%2B%2F9VD3vgQF%2F7lkovhXTJ6nS32UB5CbmfSbfhbG5odC5%2Bt%2F%2F%2BQPLa1eBGywsU%2F5ckSe4p85Dm6DvbdfV1meXeYyr2QWeyKw1yd%2FHnyhsKaOKujCE0uvOBjqkAeo9Z0fwEEFRvk574pTCXU%2FMaSuAGM9ZHyXx5YboORwCoLCLLU3DNy%2F47c%2FTrLXDFrBeGYa%2FGcH5gs7iIxWEldya6XYCZxvGKYK7wok3TIGEiMqDnz%2BzHwoSc99qBMF9YdI238x1N3SnmVm5tsDFUu5wPIHp1c0tBmYnAzYZj3FEPjdLXb0KtS36Tf1AXPhv%2FSykYdsyKBXLM%2F7vPaDyApxB7xLd&X-Amz-Signature=1531283f00057708d4b781ab964a70555d039f2462d04c1408bf89ae61d5042a&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

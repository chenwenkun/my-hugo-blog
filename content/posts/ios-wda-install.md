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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466QQ53ID3T%2F20260425%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260425T183457Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjENL%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQD%2BhVxhuFlX8JIevayufE4k1eSOjs2rk2Kw3Aqtf2kRsgIgHmgIaIdgtWa%2FkF9GjTwnEQQSLEDHTKIbpaNcHInUqXQqiAQIm%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDImar7Eya88MC1QCXSrcA9YpjtL8J536olAhXN7Ah1FAMG%2BVjnrzv%2Fx3ugNHFOpMUA852RIM94rOYdedoIMTA5iRx1enUKPCufY3fKmdm%2BFxEx1mgMcEFAZhmAmOkA88hHo6ni%2B842%2BnONdNZJIX2jp9Rzx%2F%2FMAY90P04TE6DpZogJLpIzWn4QCKpUXQl6eXCsuS8LaDGbrhYDvsSy4wPUceF6eMJtrJZskERVxx2h5vFOy4sQpAnx1K9hb0pHpBQ0ftgc7rhAaQnT4sW%2F7u5VItH4XD3yIf%2BmFWF9gT5HCkGYLDkZsr3c3NQlcLXaoV63vOTWriDqsRVm8I%2FmAkAu7gPeH0PnP6PVr%2F0bpm2mrwRRHYWQrGqFgbG8yfU%2BzXgKEk%2Fspak49DcDGhfg%2BeWXIhMyT7LTWBQzngPYvTRmVzclYJtflaKYNPB%2Figs7u48q3cmEum%2BE2dZNbhDDgWUH04gEzB7guq3tlVpYTMNBT4dsMJpfN6AwdIdf5hn043%2Bny5V%2FasgWLlkkBtOn7CLjr0xbEORMZq0f9IAr6BiHPQ6LmszYuVZPkg5Fs86s%2Fn6IrpQBhuhSQUBAvGEQWsc9y8BVH7p%2FCSBdYAUqCUAkZsSy7O13HgWgxb8r%2FrpNisAtc6Uz26cKKOOgvIMMyJtM8GOqUB0G294tDRFrBzhzfHpQzKXZDTKFX4k%2FQU1PFo5kbQa1xnJPZTTSUcpfLT5GBm0XkvYoHllGk4wVoZwwiXDe9NYapcdXpvYRJQUT3yFLxX%2FVYMpLSyGqd5Bmlvp0uO0qXyOXTQT4qjw%2FnsdTMUZEK6cY5Q7n%2BTgvCz4regS0hT7D8CZpmIaxRXrRZclCTnLCXMQvo4QFw5JKYtXvFmNdDYuPkFsNdG&X-Amz-Signature=3186506ef3b98cab7617184125b338beda4ecd0ae30532923d105d42e598a441&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466QQ53ID3T%2F20260425%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260425T183457Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjENL%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQD%2BhVxhuFlX8JIevayufE4k1eSOjs2rk2Kw3Aqtf2kRsgIgHmgIaIdgtWa%2FkF9GjTwnEQQSLEDHTKIbpaNcHInUqXQqiAQIm%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDImar7Eya88MC1QCXSrcA9YpjtL8J536olAhXN7Ah1FAMG%2BVjnrzv%2Fx3ugNHFOpMUA852RIM94rOYdedoIMTA5iRx1enUKPCufY3fKmdm%2BFxEx1mgMcEFAZhmAmOkA88hHo6ni%2B842%2BnONdNZJIX2jp9Rzx%2F%2FMAY90P04TE6DpZogJLpIzWn4QCKpUXQl6eXCsuS8LaDGbrhYDvsSy4wPUceF6eMJtrJZskERVxx2h5vFOy4sQpAnx1K9hb0pHpBQ0ftgc7rhAaQnT4sW%2F7u5VItH4XD3yIf%2BmFWF9gT5HCkGYLDkZsr3c3NQlcLXaoV63vOTWriDqsRVm8I%2FmAkAu7gPeH0PnP6PVr%2F0bpm2mrwRRHYWQrGqFgbG8yfU%2BzXgKEk%2Fspak49DcDGhfg%2BeWXIhMyT7LTWBQzngPYvTRmVzclYJtflaKYNPB%2Figs7u48q3cmEum%2BE2dZNbhDDgWUH04gEzB7guq3tlVpYTMNBT4dsMJpfN6AwdIdf5hn043%2Bny5V%2FasgWLlkkBtOn7CLjr0xbEORMZq0f9IAr6BiHPQ6LmszYuVZPkg5Fs86s%2Fn6IrpQBhuhSQUBAvGEQWsc9y8BVH7p%2FCSBdYAUqCUAkZsSy7O13HgWgxb8r%2FrpNisAtc6Uz26cKKOOgvIMMyJtM8GOqUB0G294tDRFrBzhzfHpQzKXZDTKFX4k%2FQU1PFo5kbQa1xnJPZTTSUcpfLT5GBm0XkvYoHllGk4wVoZwwiXDe9NYapcdXpvYRJQUT3yFLxX%2FVYMpLSyGqd5Bmlvp0uO0qXyOXTQT4qjw%2FnsdTMUZEK6cY5Q7n%2BTgvCz4regS0hT7D8CZpmIaxRXrRZclCTnLCXMQvo4QFw5JKYtXvFmNdDYuPkFsNdG&X-Amz-Signature=caee23b116a13910b99473d7e281679661ca6f1e1490beac4b0502536c95f8b7&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4667IPBWAPC%2F20260619%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260619T025328Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEOn%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIC%2BhjdswlV5vwRNDivraryLJN71kES9hTOY431C6HL57AiAL9L6hySdhuDlwmUpknsR%2BbnEBPuUSRkoGLX02Wv2JViqIBAiy%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMhOAMveqi52uph9aeKtwDmsjDlONlN0DXFiI9vtS4oiqa2Vx0yulZjux%2F3Aq5JathPCLAv9uuQxyTy7IRDdApGLMBkjvUFEVviTU574llB0JDtaGx%2BE76QNXrzUtRninYuipBZQ28m%2BG9NMVJiAVQkgF75hXiITEHzf2ZtPtdCvcJjNWUTY9Hwf%2BoVFpaQdSmSOEIz931VKGhbcopHDHUw9SRE%2B%2BXplUlU3bf%2FS%2FX0cbMoFFqekPcyi3QuQjZRaH4cuYix4drGL4c6HwzQqkG1lLKTl%2F9G7%2FGbPU%2FQzQUnDuXlAFxTaD28VHNtceUuTnhbJOy7yx%2Be2ZJaz%2FVE75z47Z2ojv%2FETZkm6jxZVpAOJhr8HNeOveP1HQubVnARtYGdQnoXABerrPV2hndHIhwWw4vrWUQo6zrSt9M20iFtNtCRs5r9D7KHsITWY%2Bo4cyKFNywxwb3xRbOD9AL6O8qm7ngUL0Sy71Ft%2FZcfDf%2FM6hZWoSNwG5h6wUeGaNKfHJkShxIvAd%2FVb2ZKuOylmfm64IVtjwl%2Fy63jd8IeQQUP3VScVQ3yCMG9d0gbWSynKFEVNKf3Es3Dz4WiK92rd5R0vH4yKPHtEQo3iFhJXYOaxvlpBXaQIUYvdm0Ert4AcgCewbA9i%2FfJ7UFilEwxKHS0QY6pgGqDd9oYBFAOBTnf8scHbTZRTNZlt2tbsD5n5zw%2BhTj5tUpi%2FB7buE49sSeeckLnFw5A3%2FwjYui4G3gMvKVmIX6ZPODMttU5wjvauutYFQE6POFHTErVsX5UC7QybLTuUobtFpBuDRMleahipthzOGgkPttWooTEsSkBpSnQD2MqibYo9s92lC9vrWvVyX5hVdQky2wSLQqymAVj62Fetfzevvr%2Fqds&X-Amz-Signature=8323122e78149966ae157fe21db0e991f5fe99e3067d0edce7d5ca0af24a9fd9&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4667IPBWAPC%2F20260619%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260619T025328Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEOn%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIC%2BhjdswlV5vwRNDivraryLJN71kES9hTOY431C6HL57AiAL9L6hySdhuDlwmUpknsR%2BbnEBPuUSRkoGLX02Wv2JViqIBAiy%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMhOAMveqi52uph9aeKtwDmsjDlONlN0DXFiI9vtS4oiqa2Vx0yulZjux%2F3Aq5JathPCLAv9uuQxyTy7IRDdApGLMBkjvUFEVviTU574llB0JDtaGx%2BE76QNXrzUtRninYuipBZQ28m%2BG9NMVJiAVQkgF75hXiITEHzf2ZtPtdCvcJjNWUTY9Hwf%2BoVFpaQdSmSOEIz931VKGhbcopHDHUw9SRE%2B%2BXplUlU3bf%2FS%2FX0cbMoFFqekPcyi3QuQjZRaH4cuYix4drGL4c6HwzQqkG1lLKTl%2F9G7%2FGbPU%2FQzQUnDuXlAFxTaD28VHNtceUuTnhbJOy7yx%2Be2ZJaz%2FVE75z47Z2ojv%2FETZkm6jxZVpAOJhr8HNeOveP1HQubVnARtYGdQnoXABerrPV2hndHIhwWw4vrWUQo6zrSt9M20iFtNtCRs5r9D7KHsITWY%2Bo4cyKFNywxwb3xRbOD9AL6O8qm7ngUL0Sy71Ft%2FZcfDf%2FM6hZWoSNwG5h6wUeGaNKfHJkShxIvAd%2FVb2ZKuOylmfm64IVtjwl%2Fy63jd8IeQQUP3VScVQ3yCMG9d0gbWSynKFEVNKf3Es3Dz4WiK92rd5R0vH4yKPHtEQo3iFhJXYOaxvlpBXaQIUYvdm0Ert4AcgCewbA9i%2FfJ7UFilEwxKHS0QY6pgGqDd9oYBFAOBTnf8scHbTZRTNZlt2tbsD5n5zw%2BhTj5tUpi%2FB7buE49sSeeckLnFw5A3%2FwjYui4G3gMvKVmIX6ZPODMttU5wjvauutYFQE6POFHTErVsX5UC7QybLTuUobtFpBuDRMleahipthzOGgkPttWooTEsSkBpSnQD2MqibYo9s92lC9vrWvVyX5hVdQky2wSLQqymAVj62Fetfzevvr%2Fqds&X-Amz-Signature=ac9d07a39be1fe42ac3326b3898022301a4112baec936b4cbd5bc6deb6ad56b9&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

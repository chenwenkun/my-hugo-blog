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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466T2CJXGTR%2F20251121%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251121T005305Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEDgaCXVzLXdlc3QtMiJGMEQCIHvIykLOaV%2B35eYf9%2BN7NgQ%2BWczI64gdHb%2B%2FPCPcKhNgAiBGPJwWNRXxx9xtYIXH15M95fK90%2BOWteHnQZxoBimgVir%2FAwgBEAAaDDYzNzQyMzE4MzgwNSIMkp0pY9O6NuRoRclnKtwDSxvFFyAdh6NSlbmXYuQAd21VQtwmXV581P3Yjhbc%2B2AiANqm2aHoKYSoPIPsHkdt%2F%2BQ2GbrgA1qF5nfXsz0MVJiZ5%2BaDU0SqmPeUbsGtcFU3Sa5mXrJXdSJNMSy6ErZ4HXADconf2RfnvKUnRIkv7HxJaQHvaWHHft0sC2rlzc8JSAdPaDhLIG4OBhYvNWiU6Xuofx0ZH9g1Kz8eYYJaB2z76kY3aRrtwQQe20BLKM1kdctPSQqfm6RRZojGfNoEj21%2FDo4pWk1UZJZghcIQ8keb31dNW9d6uGyuILBIA%2FSR0hmTHLVjUpiUvLCHEcY9%2Blm9EcGfMye15VK7lYJcmLYTtVBtfUBG%2FQjwxafekSQt6uu%2F7DVxrZUZK8NbpuTFiCAFosTRENgMsgN4VF%2BxicnoPkkQX5s2Dz3owZnBKx%2BIw%2B6H%2F%2FNUh2wb5t84nx%2BcR05kuxeHfCeK7Dkbq186paNrq5Q6SsDQFEyfFXh5JsX7mP5LOPPwpvuMEQ1Z8q4XxMfuaHZ0hkQgNcyeQAZ1MoDj6%2BLMCXQ%2BH12K%2F4DZOFVgPXwvHj173fq1IurL6%2FlZaFvNFer%2BcHlH0BfuwmRwE7j0I8E5fCAx4H0LWKWhGi6tgyBBlvQYdE7rkPIwvdz%2ByAY6pgE5WoEKP2wGl3QxNVdeGyQVkSGFDifztRIz3uXf%2FjO%2BJXbuus9A%2BXGrRIisj7%2FZ%2BCreWUtAsl7WBixNoAd0KBSAv%2BUESJXaAjKDopz%2BNerSGrwDsbPhh6b7TrY3CTWg6uWfP8YqpDJo5QRk8K5QR%2BftnCbujc0E6T75qZdVccHlH65UcMB5nWpKrkGDS8Z3X27cSkbZlOZCOozyoBjo12DeB6DhhrFi&X-Amz-Signature=776e990c8f1d7b71e1fa692bd95d687b11399914ec044ca28d2d68ca6bae2543&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466T2CJXGTR%2F20251121%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251121T005305Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEDgaCXVzLXdlc3QtMiJGMEQCIHvIykLOaV%2B35eYf9%2BN7NgQ%2BWczI64gdHb%2B%2FPCPcKhNgAiBGPJwWNRXxx9xtYIXH15M95fK90%2BOWteHnQZxoBimgVir%2FAwgBEAAaDDYzNzQyMzE4MzgwNSIMkp0pY9O6NuRoRclnKtwDSxvFFyAdh6NSlbmXYuQAd21VQtwmXV581P3Yjhbc%2B2AiANqm2aHoKYSoPIPsHkdt%2F%2BQ2GbrgA1qF5nfXsz0MVJiZ5%2BaDU0SqmPeUbsGtcFU3Sa5mXrJXdSJNMSy6ErZ4HXADconf2RfnvKUnRIkv7HxJaQHvaWHHft0sC2rlzc8JSAdPaDhLIG4OBhYvNWiU6Xuofx0ZH9g1Kz8eYYJaB2z76kY3aRrtwQQe20BLKM1kdctPSQqfm6RRZojGfNoEj21%2FDo4pWk1UZJZghcIQ8keb31dNW9d6uGyuILBIA%2FSR0hmTHLVjUpiUvLCHEcY9%2Blm9EcGfMye15VK7lYJcmLYTtVBtfUBG%2FQjwxafekSQt6uu%2F7DVxrZUZK8NbpuTFiCAFosTRENgMsgN4VF%2BxicnoPkkQX5s2Dz3owZnBKx%2BIw%2B6H%2F%2FNUh2wb5t84nx%2BcR05kuxeHfCeK7Dkbq186paNrq5Q6SsDQFEyfFXh5JsX7mP5LOPPwpvuMEQ1Z8q4XxMfuaHZ0hkQgNcyeQAZ1MoDj6%2BLMCXQ%2BH12K%2F4DZOFVgPXwvHj173fq1IurL6%2FlZaFvNFer%2BcHlH0BfuwmRwE7j0I8E5fCAx4H0LWKWhGi6tgyBBlvQYdE7rkPIwvdz%2ByAY6pgE5WoEKP2wGl3QxNVdeGyQVkSGFDifztRIz3uXf%2FjO%2BJXbuus9A%2BXGrRIisj7%2FZ%2BCreWUtAsl7WBixNoAd0KBSAv%2BUESJXaAjKDopz%2BNerSGrwDsbPhh6b7TrY3CTWg6uWfP8YqpDJo5QRk8K5QR%2BftnCbujc0E6T75qZdVccHlH65UcMB5nWpKrkGDS8Z3X27cSkbZlOZCOozyoBjo12DeB6DhhrFi&X-Amz-Signature=24a6a43858a2685b54d454a780b55e26ec6a255a433e0236cdab4bcfd3e862f7&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

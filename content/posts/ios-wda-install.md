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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4667D6X53V6%2F20251028%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251028T122128Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEAQaCXVzLXdlc3QtMiJGMEQCIBj5c%2BT6zoqCAezm6u7USraRiPkq8wW9D8k75fSYHTCYAiBb5EGqbRtE7zJCJ2Byi2uZpHkXX37Fi8MEiDrdx5u4ZiqIBAi9%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIM6a184eJNxndnlEePKtwDl388ppCuEurCSJnueiD5hUmj0hANsD4gKcFJ0lWdPNV43wltpqLqTyXm69Op8fQ1SPp9TqtpteioBkdIuk5eIxeelokhn8LaUbwCDxSPGKzJqt%2BlZ8obL5rOrgCjX5QBm%2FcAzQEMcZIGX%2FSBpGAcrSXstc8jA0trmr8muBj8JI4uhwsizXAyHq6wiP6fEVVfrDmatZ9s6pnoTzgF4pm2dVmflgh9WVoskglcQoxTUqbPx6jsW56QyZHO7Ws8x0iwcDVkUSeq7SSXs8uzVT7LMIVWehEbUXoUueMM5oyr0XB6cxb%2FEFZQSDE0tK6a2yox2WrikWTHXdyIaGRapbeplyyvzMU%2BhOUrlqJq%2FOxHAyQzPomJ4aVBxanvYprqtMSIsEk85TKFkQaK5FamavcJva3JK9KVjf%2F%2FigbK1TUbf9vQWSqBO7hPkxjggMGiCpZGoukjs0rhqTFQhim7RVLFVa9wqXDobxDPAimNOBfe4ZE5tal4YWvvpd2lCTEGKn7sYl27PH47HQmmoEuwaWsRCvH6i3j593SMraJqk4Vmtz5JgGnLwQGeXqQPSsoCmnpJ938CcZcAVWVAst%2B286Bd4DIFKQl7XATT3mY2KS3vbqn%2F4rgNRmiXJbe%2BGxsw3NyCyAY6pgHO0aHoOn1JYl%2F6pjZmdUqsB7nGMIn4t49IVcyqSH3RNUb5uBEkRQmxv6XF04izEVyVc0oh9kXasvscHR%2F7I%2FTIAdkeD0bBJ4yPScUw7C%2FhCTZHMrSwwDr1gRIHkSOKbJ3%2F1KhVRXdw7lFsq7SKVBByEzUPvZq2v0DKIx%2BZABwmUqWs2OpqMa%2B%2BxZv8ZtwNk9m9Fv6kXt6kTNUwl3WO0dD07bSFRBE4&X-Amz-Signature=c820c9c6a14f6cb9c0ab7af4bb76748c1a720481815589b29f34989beb1380f0&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4667D6X53V6%2F20251028%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251028T122128Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEAQaCXVzLXdlc3QtMiJGMEQCIBj5c%2BT6zoqCAezm6u7USraRiPkq8wW9D8k75fSYHTCYAiBb5EGqbRtE7zJCJ2Byi2uZpHkXX37Fi8MEiDrdx5u4ZiqIBAi9%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIM6a184eJNxndnlEePKtwDl388ppCuEurCSJnueiD5hUmj0hANsD4gKcFJ0lWdPNV43wltpqLqTyXm69Op8fQ1SPp9TqtpteioBkdIuk5eIxeelokhn8LaUbwCDxSPGKzJqt%2BlZ8obL5rOrgCjX5QBm%2FcAzQEMcZIGX%2FSBpGAcrSXstc8jA0trmr8muBj8JI4uhwsizXAyHq6wiP6fEVVfrDmatZ9s6pnoTzgF4pm2dVmflgh9WVoskglcQoxTUqbPx6jsW56QyZHO7Ws8x0iwcDVkUSeq7SSXs8uzVT7LMIVWehEbUXoUueMM5oyr0XB6cxb%2FEFZQSDE0tK6a2yox2WrikWTHXdyIaGRapbeplyyvzMU%2BhOUrlqJq%2FOxHAyQzPomJ4aVBxanvYprqtMSIsEk85TKFkQaK5FamavcJva3JK9KVjf%2F%2FigbK1TUbf9vQWSqBO7hPkxjggMGiCpZGoukjs0rhqTFQhim7RVLFVa9wqXDobxDPAimNOBfe4ZE5tal4YWvvpd2lCTEGKn7sYl27PH47HQmmoEuwaWsRCvH6i3j593SMraJqk4Vmtz5JgGnLwQGeXqQPSsoCmnpJ938CcZcAVWVAst%2B286Bd4DIFKQl7XATT3mY2KS3vbqn%2F4rgNRmiXJbe%2BGxsw3NyCyAY6pgHO0aHoOn1JYl%2F6pjZmdUqsB7nGMIn4t49IVcyqSH3RNUb5uBEkRQmxv6XF04izEVyVc0oh9kXasvscHR%2F7I%2FTIAdkeD0bBJ4yPScUw7C%2FhCTZHMrSwwDr1gRIHkSOKbJ3%2F1KhVRXdw7lFsq7SKVBByEzUPvZq2v0DKIx%2BZABwmUqWs2OpqMa%2B%2BxZv8ZtwNk9m9Fv6kXt6kTNUwl3WO0dD07bSFRBE4&X-Amz-Signature=c0ac7c5a812196ef4d9d314453c17d62407c57e5fc0fbd846b7510e73e783ce5&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

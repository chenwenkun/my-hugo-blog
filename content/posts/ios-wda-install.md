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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466SUJL2H2Z%2F20260101%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260101T010336Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEAwaCXVzLXdlc3QtMiJIMEYCIQCllexivHRLUvZ4umqyvFWYSkvcw1kvpUEX5BTqKLxK8wIhAJiuNQ1PBpyfcuJ09d06J9qcX0iTPG1%2FKu9Lf3sCuIfLKogECNX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgyECP2bUsdZ3YFqXv8q3AN5dSe7CjaedHzDJdc00NbEddZ7lwvH%2F%2FkB0GcMQrugvwsoX%2FUQa8aGz0qJXLpMSvz3OrmCiPcgZS5cuDHDq4yI5AeEZo0Dx9oGfDXHeq9kIqayD8SA4eOQZE5njzowYP153BdDf%2FTCsOszV2cIdLV0JVIWPiuNZdPnjLu4okLNDiY6Y5N2eCKVrmsGSWYU%2BZ7%2BbLgs%2FBYU4rEbOziANCdP8pRjeX6%2FyrQWPK%2FJrF0hxIR0jpdChXnn7c4OSH2IdvgAQVw5KtX9hYcUyL4Ro6gi%2BPI0nNrzy2wWPeVVncqo%2FBR69698IxPfaWsKLxY%2FMFiywi5xixmJXxUxP1YMg%2BA0kWJGyvQwv6WyWSa9NA9U6eppoorUX7i9bMVp%2Ff6HBTA7FBDqc2fz6RJajaQ3JHqE2pUoM45UarpnsHOvY1r23makR0MDMwD5NOrJQKNaC76beFrQKFf6JsCak7HIAvOShdN8orJg3s8fCsGEYqn%2FFwATXeyDMIvIpqO3SNEXsgiTp432LrnmOnneS%2Bb68%2BZfNtFO%2BvP54sqNsUrvfBnzWbygilwCnp8gDX7Y%2B6HeG4zW8u0zN%2BGsMMHWi1WkAPO%2F5hLhLL1i0HHlO0e%2BQcbgqFHTnCoanQRSMVse4TCp9dXKBjqkAR6WTdBqEk%2B9U0LQA7lUXII8PI4WuykQqvqRAX0ryWZEN6wUNOqvdySiDk3KvdKtZWfc92jinvsI%2Bzoe91vsrxPBf7wJE9QpraTtXISS4Dc3%2BNmrERrxktC2lSCTTVf8nDej1y2xrd4GpZkPnWH1UcJ1riDn3VTpfUzAdYgMbnsYXOBgiJ93GqqJhAtNkJCkqfLSXdVqp0xpgsoQnFyMEnVC8w6a&X-Amz-Signature=e57de5b2177ac4224bb63de3eb29996275ab9b286133c093fdea30f0d9e1ca3e&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466SUJL2H2Z%2F20260101%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260101T010336Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEAwaCXVzLXdlc3QtMiJIMEYCIQCllexivHRLUvZ4umqyvFWYSkvcw1kvpUEX5BTqKLxK8wIhAJiuNQ1PBpyfcuJ09d06J9qcX0iTPG1%2FKu9Lf3sCuIfLKogECNX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgyECP2bUsdZ3YFqXv8q3AN5dSe7CjaedHzDJdc00NbEddZ7lwvH%2F%2FkB0GcMQrugvwsoX%2FUQa8aGz0qJXLpMSvz3OrmCiPcgZS5cuDHDq4yI5AeEZo0Dx9oGfDXHeq9kIqayD8SA4eOQZE5njzowYP153BdDf%2FTCsOszV2cIdLV0JVIWPiuNZdPnjLu4okLNDiY6Y5N2eCKVrmsGSWYU%2BZ7%2BbLgs%2FBYU4rEbOziANCdP8pRjeX6%2FyrQWPK%2FJrF0hxIR0jpdChXnn7c4OSH2IdvgAQVw5KtX9hYcUyL4Ro6gi%2BPI0nNrzy2wWPeVVncqo%2FBR69698IxPfaWsKLxY%2FMFiywi5xixmJXxUxP1YMg%2BA0kWJGyvQwv6WyWSa9NA9U6eppoorUX7i9bMVp%2Ff6HBTA7FBDqc2fz6RJajaQ3JHqE2pUoM45UarpnsHOvY1r23makR0MDMwD5NOrJQKNaC76beFrQKFf6JsCak7HIAvOShdN8orJg3s8fCsGEYqn%2FFwATXeyDMIvIpqO3SNEXsgiTp432LrnmOnneS%2Bb68%2BZfNtFO%2BvP54sqNsUrvfBnzWbygilwCnp8gDX7Y%2B6HeG4zW8u0zN%2BGsMMHWi1WkAPO%2F5hLhLL1i0HHlO0e%2BQcbgqFHTnCoanQRSMVse4TCp9dXKBjqkAR6WTdBqEk%2B9U0LQA7lUXII8PI4WuykQqvqRAX0ryWZEN6wUNOqvdySiDk3KvdKtZWfc92jinvsI%2Bzoe91vsrxPBf7wJE9QpraTtXISS4Dc3%2BNmrERrxktC2lSCTTVf8nDej1y2xrd4GpZkPnWH1UcJ1riDn3VTpfUzAdYgMbnsYXOBgiJ93GqqJhAtNkJCkqfLSXdVqp0xpgsoQnFyMEnVC8w6a&X-Amz-Signature=d6922e5af0c2bfe7dd36dafa086eeb7205ded065fdc741bbc14252fb89893ecd&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

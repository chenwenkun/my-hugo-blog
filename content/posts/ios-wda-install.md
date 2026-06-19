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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4664MM2CYZY%2F20260619%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260619T101050Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEPL%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCN%2Fv81uJb2rLzcTDUo6ztTCDI3mAzZorFN%2B%2F7DN4DZKQIhAIm75gDRaFS5IiyI5jHNaSiTCK%2BDT4esQv6jPCu0iuDuKogECLv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgzbaJv9gL0QbG18cYAq3AOJkAvN%2FPrO7srVgBR5uPwDSxNX1q37r0jj38RDZinepfDRODD8wDkAtxJkIXJ6ObhGhLt2weP1cT2%2B0Yig1ZiFG6g8vCBRTb6JbpEWgA48sNCVBnFvDTrNXHZpz7CytTxhtsoFVepWeEVguDANFf%2F1kAmjOhh5ZOH7T3Px8%2FDLvYhVuY4%2FQfLBtrob7hZ%2Bqx%2FzelbUv6utrfAeWNyTIIu38RSKqlXGqUYJhDaW4NGapm1sBuKPbOAOZj%2FVd4%2BRWnfBKoZk1vTFqOmCJI22TTkxbvDoblnn6Gp4QLw%2BcOMdKbERUlWI2mk7UfEYt6JEL8U5BKJEyisvylsAkjLWOoRBMR6k4w8NokwIqNmaH%2Fw3HJzm9TrkG4ZsikAOt1EeNBazsodUfnxPx3kFqjC1VuLZNkd4avwFIHj3eu0UZ%2BD5J2IxcX7BLf2llBm1kadc8Y6YObLwyCg7Jt1VZlBPgMbH4hbRO%2BYLt85%2BygOxTXVibUoQGZDgN%2F%2BTpQ0QA4TpHMgD6v0IAUytKYVH7gpEEYpn4wtupEI6Diy7fvPMwhmfuxkT3%2BuPKIg8yNA6Hq30SewoHP8f19mFQfRLJaFBPffThRv4OFncil6sjf7I8r5jQ3Vjaa4YC9Bw7SrCuDDdmtTRBjqkAYm1QhpGeitmrbdtrssK62fhBK9X01HzmBaLNtR1HDr4oUWg4wqZxK2gO6lK89a%2BOp%2FuLcjo%2F87d0vDhHTX8Yp88OX%2BfiPEoTryx32QLqIdN4Offw1kg3%2BlmyNQz%2Fi14ekqkFMCSiR36IRiD8YrfkwJtkRgRjR4DKoGoqUmTOye62uYkq5l1zltckTco1pDEVpDQA%2BjCj%2FFQMfpmcZ6Dn4kmDtgD&X-Amz-Signature=b3b9ee1ee71bef41a3effcba147843b93150e57622b23e0b76d11b3fa10683ef&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4664MM2CYZY%2F20260619%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260619T101050Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEPL%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCN%2Fv81uJb2rLzcTDUo6ztTCDI3mAzZorFN%2B%2F7DN4DZKQIhAIm75gDRaFS5IiyI5jHNaSiTCK%2BDT4esQv6jPCu0iuDuKogECLv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgzbaJv9gL0QbG18cYAq3AOJkAvN%2FPrO7srVgBR5uPwDSxNX1q37r0jj38RDZinepfDRODD8wDkAtxJkIXJ6ObhGhLt2weP1cT2%2B0Yig1ZiFG6g8vCBRTb6JbpEWgA48sNCVBnFvDTrNXHZpz7CytTxhtsoFVepWeEVguDANFf%2F1kAmjOhh5ZOH7T3Px8%2FDLvYhVuY4%2FQfLBtrob7hZ%2Bqx%2FzelbUv6utrfAeWNyTIIu38RSKqlXGqUYJhDaW4NGapm1sBuKPbOAOZj%2FVd4%2BRWnfBKoZk1vTFqOmCJI22TTkxbvDoblnn6Gp4QLw%2BcOMdKbERUlWI2mk7UfEYt6JEL8U5BKJEyisvylsAkjLWOoRBMR6k4w8NokwIqNmaH%2Fw3HJzm9TrkG4ZsikAOt1EeNBazsodUfnxPx3kFqjC1VuLZNkd4avwFIHj3eu0UZ%2BD5J2IxcX7BLf2llBm1kadc8Y6YObLwyCg7Jt1VZlBPgMbH4hbRO%2BYLt85%2BygOxTXVibUoQGZDgN%2F%2BTpQ0QA4TpHMgD6v0IAUytKYVH7gpEEYpn4wtupEI6Diy7fvPMwhmfuxkT3%2BuPKIg8yNA6Hq30SewoHP8f19mFQfRLJaFBPffThRv4OFncil6sjf7I8r5jQ3Vjaa4YC9Bw7SrCuDDdmtTRBjqkAYm1QhpGeitmrbdtrssK62fhBK9X01HzmBaLNtR1HDr4oUWg4wqZxK2gO6lK89a%2BOp%2FuLcjo%2F87d0vDhHTX8Yp88OX%2BfiPEoTryx32QLqIdN4Offw1kg3%2BlmyNQz%2Fi14ekqkFMCSiR36IRiD8YrfkwJtkRgRjR4DKoGoqUmTOye62uYkq5l1zltckTco1pDEVpDQA%2BjCj%2FFQMfpmcZ6Dn4kmDtgD&X-Amz-Signature=9b2deff25c01dd09975f7fd41a7c06c1ca8d7a392542be68c43d316a25da460f&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

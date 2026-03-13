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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4666GEW4GKW%2F20260313%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260313T063818Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEL7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIGNKanYRidU635zL%2Bdb0UZeqD05BEtRyZC6mhTrxRGsWAiB2WNliyttC%2BaZDkl%2FM6yyu6poFmd3UKqFzbdyqhF1TbSqIBAiH%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMa%2F2ThjriPP1L%2BM9bKtwDXjGfcI7grssG%2FSRplTH8wlZt%2FBIECsiMBIgtCk1yaJiObYE4VQ91lZYR4aZ97mjJ6oe4DaoeMa%2F1ZmoPp%2B0YAdvTawVpXFoRT2VOqp3UK%2FcK4mSb6zF30k7FRCvQ9%2B6IJsj1wWsRBKnV7QZ73Dr2eUy5pOghPT4qeGlnPO6gOdIBDxM7%2BHMEbzdK3UsMAaACG6l6oBqcFYfNM7yo9Q6js%2FmsVmRsJUzxles00LsznY5H4fBbdr%2B3OLHGqr6hLD0a3dRda0m2%2FdU6evxnxx0QtRNa6MHr2HhVfoOAivIuejQ8pPnmwKTYni1VzOzj%2FOx3WwvFFWTVJMxJ9a5I%2FkNOTWEI8DXK4VJT4n8TvI9%2B9jigd30wxBYBAjqPZWywLgqE0I8Byr3RXiTP%2FYGhfE4m4cjpeqQIE%2FPxPlm1C9pivQ2ZTbaZGelPBG8Gze3XbZq8TaPsUp9UeGH8AGeTIMFnFim%2Br6kRAB%2Fj8%2BEE3lRD7rABWuAC%2B1YVIbAid0u2PHNih4HqqqSb9tmIFHWCKPib%2BDW%2BI94JJZSRSthLgyxLouelgMdfVK9qbj165VCAF6wx7ntPqoGPAvBgAR1xPvgOMu8RcAwITd6yiAjTCjx0QNRSbqj20h1NBZlnKC0wlsXOzQY6pgFm0KN%2BpaFg6AmHSx5kp9w4J2O2DCMbgwLcWR681i4uZ8zgiFyhUCSi0SD9fHGS1WJPif3MVtmTgrDQVEwa5EW4%2FdG%2BqXci1VbLOJ5Qa2al9dmQEvjFrvKYt6JF9aZDUNI5yeN5%2FIT31j5tu5nN4H0SOjpXDIiRzGLoM9NxMQ%2B%2BTMKZYUJF7lhRyS2oDNDuDCVRu40ytIcpMop6%2Fl5wEKAWS35eVQBi&X-Amz-Signature=d65c4b8f5a5fd4a186c5555ea6be00824ae280a3c25bdd51f0cadc6fd5b8a023&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4666GEW4GKW%2F20260313%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260313T063818Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEL7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIGNKanYRidU635zL%2Bdb0UZeqD05BEtRyZC6mhTrxRGsWAiB2WNliyttC%2BaZDkl%2FM6yyu6poFmd3UKqFzbdyqhF1TbSqIBAiH%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMa%2F2ThjriPP1L%2BM9bKtwDXjGfcI7grssG%2FSRplTH8wlZt%2FBIECsiMBIgtCk1yaJiObYE4VQ91lZYR4aZ97mjJ6oe4DaoeMa%2F1ZmoPp%2B0YAdvTawVpXFoRT2VOqp3UK%2FcK4mSb6zF30k7FRCvQ9%2B6IJsj1wWsRBKnV7QZ73Dr2eUy5pOghPT4qeGlnPO6gOdIBDxM7%2BHMEbzdK3UsMAaACG6l6oBqcFYfNM7yo9Q6js%2FmsVmRsJUzxles00LsznY5H4fBbdr%2B3OLHGqr6hLD0a3dRda0m2%2FdU6evxnxx0QtRNa6MHr2HhVfoOAivIuejQ8pPnmwKTYni1VzOzj%2FOx3WwvFFWTVJMxJ9a5I%2FkNOTWEI8DXK4VJT4n8TvI9%2B9jigd30wxBYBAjqPZWywLgqE0I8Byr3RXiTP%2FYGhfE4m4cjpeqQIE%2FPxPlm1C9pivQ2ZTbaZGelPBG8Gze3XbZq8TaPsUp9UeGH8AGeTIMFnFim%2Br6kRAB%2Fj8%2BEE3lRD7rABWuAC%2B1YVIbAid0u2PHNih4HqqqSb9tmIFHWCKPib%2BDW%2BI94JJZSRSthLgyxLouelgMdfVK9qbj165VCAF6wx7ntPqoGPAvBgAR1xPvgOMu8RcAwITd6yiAjTCjx0QNRSbqj20h1NBZlnKC0wlsXOzQY6pgFm0KN%2BpaFg6AmHSx5kp9w4J2O2DCMbgwLcWR681i4uZ8zgiFyhUCSi0SD9fHGS1WJPif3MVtmTgrDQVEwa5EW4%2FdG%2BqXci1VbLOJ5Qa2al9dmQEvjFrvKYt6JF9aZDUNI5yeN5%2FIT31j5tu5nN4H0SOjpXDIiRzGLoM9NxMQ%2B%2BTMKZYUJF7lhRyS2oDNDuDCVRu40ytIcpMop6%2Fl5wEKAWS35eVQBi&X-Amz-Signature=6d183b3df88802d21f6ca1ec93477036279cd47f262cbdfc664bee7554a474c8&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

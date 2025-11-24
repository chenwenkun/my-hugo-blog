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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466S3O447X6%2F20251124%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251124T181748Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJL%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIGGUAJtk2a%2FNXxUeXNSwuAtAXBpWLsoOnD2MD9IsIZaZAiEAgCczRyW8f0vO0jSngQOHa8XBhnlH7JrbCm6ChAjYWykq%2FwMIWxAAGgw2Mzc0MjMxODM4MDUiDO7hvB%2FmxLOkVo%2BPnSrcA7BCrboSGSoujsRtwIP7jvdvgeZRfJJCrAheb%2FTfmqFZEPnIsAOszxY1gWL5t212JRxU6egkN8uh49G5qdY0ghmpVqrPJYit8W06Ev9%2F8I6SuMjGYJ0cTuuJCFFP4okb%2FA4eZdGOmNpM1YkkxRb8RDsqnBwegDuDxa5nWEY%2Bl9XR6Z3gObmBt0yX%2BoAzOK0z6pKsG6nPrRSYVubsENtI2bc6c45swGV53gSSKkAIsM4ezyYTopF%2Bwbgz0ksvyDQLTYHQ4O69tmtiNTAIwwNNiNMViY15OranPoW8IZjFerQOI9gOD6fPLZrOQagNWfaEBx46ZvFp7STzUeWUJjzKmxcCtrPhoKpQllwp43J7aQI100t7o4PZiT6rINwieH4YApVF0IndtS%2BpFqmdVWMiPHgMh6gzSPjSprxhe9E1Ns1J1CPlEWx1Zb68TRMhbBfXMVb5TMe2bSO43RKhI%2BuvVqbgisUY4UXwF9CH5aa16OhGIFSSDVII8cFb1S3nej72gvtNPh0DX4fZEr3mj%2BgN7pJr4tUmwPkCKDomUSfbHAPis4yYKXIX02lR8w1ngIR%2FLUkfy9CkNNik9RCI7DkxDlaX1kcWJzuVFAiil5qH8LQ%2BxIJRuGwM2wAKptO5MNyrkskGOqUBbhQdeg0abHVdA1Wt%2BgEeGw9jSf1K%2BKvA3JJK2hxSAueP7WFcznNLZoL844vlCRkb26QKuCphWVEvRPVdajLSGwXKivoi7AAtQuM7%2Fl2Yi0bj7hCRuakLUWQV93qMiTDakh%2FCX%2BsWMhGMyE9ojK06QD%2FhJ5l0MOo1JaN6qa7VlxxhjY0lpNg4%2FiFaemREiyzosI33ujZy56Spazro21fXarlq9e7G&X-Amz-Signature=6a72429091e1689d6d7c0ee03414af32f40fb5de74e64b8453f31295c3e46dfd&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466S3O447X6%2F20251124%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251124T181748Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJL%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIGGUAJtk2a%2FNXxUeXNSwuAtAXBpWLsoOnD2MD9IsIZaZAiEAgCczRyW8f0vO0jSngQOHa8XBhnlH7JrbCm6ChAjYWykq%2FwMIWxAAGgw2Mzc0MjMxODM4MDUiDO7hvB%2FmxLOkVo%2BPnSrcA7BCrboSGSoujsRtwIP7jvdvgeZRfJJCrAheb%2FTfmqFZEPnIsAOszxY1gWL5t212JRxU6egkN8uh49G5qdY0ghmpVqrPJYit8W06Ev9%2F8I6SuMjGYJ0cTuuJCFFP4okb%2FA4eZdGOmNpM1YkkxRb8RDsqnBwegDuDxa5nWEY%2Bl9XR6Z3gObmBt0yX%2BoAzOK0z6pKsG6nPrRSYVubsENtI2bc6c45swGV53gSSKkAIsM4ezyYTopF%2Bwbgz0ksvyDQLTYHQ4O69tmtiNTAIwwNNiNMViY15OranPoW8IZjFerQOI9gOD6fPLZrOQagNWfaEBx46ZvFp7STzUeWUJjzKmxcCtrPhoKpQllwp43J7aQI100t7o4PZiT6rINwieH4YApVF0IndtS%2BpFqmdVWMiPHgMh6gzSPjSprxhe9E1Ns1J1CPlEWx1Zb68TRMhbBfXMVb5TMe2bSO43RKhI%2BuvVqbgisUY4UXwF9CH5aa16OhGIFSSDVII8cFb1S3nej72gvtNPh0DX4fZEr3mj%2BgN7pJr4tUmwPkCKDomUSfbHAPis4yYKXIX02lR8w1ngIR%2FLUkfy9CkNNik9RCI7DkxDlaX1kcWJzuVFAiil5qH8LQ%2BxIJRuGwM2wAKptO5MNyrkskGOqUBbhQdeg0abHVdA1Wt%2BgEeGw9jSf1K%2BKvA3JJK2hxSAueP7WFcznNLZoL844vlCRkb26QKuCphWVEvRPVdajLSGwXKivoi7AAtQuM7%2Fl2Yi0bj7hCRuakLUWQV93qMiTDakh%2FCX%2BsWMhGMyE9ojK06QD%2FhJ5l0MOo1JaN6qa7VlxxhjY0lpNg4%2FiFaemREiyzosI33ujZy56Spazro21fXarlq9e7G&X-Amz-Signature=9f1c2043e6f6bb7a351e29d51ac6d0f8d33e142d964984febdb53e79dc7fe7ae&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466453URPZQ%2F20260307%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260307T062632Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEC4aCXVzLXdlc3QtMiJHMEUCIQDP0kjsHSpGDqEtS%2F4xi2d0gQg68uYiNXNDREyiDfImIgIgR74ullXe7M5XNZ5YU0iqUX%2FQyO%2BVObZe6KqzdoL191MqiAQI9%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDFOHi8EI7f1Wqc8r5yrcA6TMOS6KAdxELRPaV8HLeVNKc90D1%2B4awEZ%2B3RBn07pS3Z%2FYs2anEqof8YFkUL0LIb1c%2FJTscTiQvkyDqrkICfPRZYSgcuuMnbzbxVQDfBrgfHjA7KEjfF%2BHf6rs%2BiruOGT%2BbwdTVswS%2B0Iq51PDxhtSbNNhCDZejIn3UPmjTT6uVM46YEZj6M7OD8e7sBzQVvCODgmPBGMGogY04eidXqeJfhfoSxlSY2xapo5%2F3i%2BYmNDquzjOubgpP4AkVpitzDpCvX5cFOXC5Z7n96q%2FsRhzhAQ7I9VuAx4hFj653xgsRPbzhLH1yB%2F5r65KZyhhhW6e%2FFylmoXW1FB4Cc41aTBhgAcNJ3nBESdLcL4NkbJ5cjlkCz1Ba%2FSVD7%2BV5ar%2B6fo3PjHmm%2B6o96fYZrj88y8%2Bc8efMw604B9Zu3F2x4%2B81r69sH%2FnQvCy%2B8iAMk%2B4sC2umEKDkzXn5txcPUuf0KwkM3RwLeUtYQDwe%2F%2FcE634%2B5xRlnfIgBtRLgMfwlkXw0%2FyyRM5fIQPrW8%2FvDfE98Y3c9ldotE1cmJFOnL%2B2wpHifDWQ%2Bn2lNJomc75HHFNI1xq16mGalZDgvwoz4vRUePUvGfurwcIGS%2BHoBBTjKbZ%2BDr%2Bd7XpPA3ovV3%2BMNT5rs0GOqUBvHg9peVnJ4sW1CP%2FIvgoef%2BceGI%2BW3Ja7XIqV%2BrAcUS3RO9rAnpV%2B4OH7LGwhetCPY%2BgCpdMEXn39chSV9vG3SurSVXRu9wjRKmI%2Bof%2B5EQNjookWt6eaPHKyjNb5MCNcQDz8iajbJFFGVdgbZCeDJ2wG6IHZU8A49nFLP%2B7zWut4zIBxmKGoNPnzqqaIrWG50ICyJw6K9XETc7H98zX0p8mD09G&X-Amz-Signature=93e01e2cf1536b35bd5fbeed0abeac0f16ab0fe7ca2e1a52fbbecb580dd12693&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466453URPZQ%2F20260307%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260307T062632Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEC4aCXVzLXdlc3QtMiJHMEUCIQDP0kjsHSpGDqEtS%2F4xi2d0gQg68uYiNXNDREyiDfImIgIgR74ullXe7M5XNZ5YU0iqUX%2FQyO%2BVObZe6KqzdoL191MqiAQI9%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDFOHi8EI7f1Wqc8r5yrcA6TMOS6KAdxELRPaV8HLeVNKc90D1%2B4awEZ%2B3RBn07pS3Z%2FYs2anEqof8YFkUL0LIb1c%2FJTscTiQvkyDqrkICfPRZYSgcuuMnbzbxVQDfBrgfHjA7KEjfF%2BHf6rs%2BiruOGT%2BbwdTVswS%2B0Iq51PDxhtSbNNhCDZejIn3UPmjTT6uVM46YEZj6M7OD8e7sBzQVvCODgmPBGMGogY04eidXqeJfhfoSxlSY2xapo5%2F3i%2BYmNDquzjOubgpP4AkVpitzDpCvX5cFOXC5Z7n96q%2FsRhzhAQ7I9VuAx4hFj653xgsRPbzhLH1yB%2F5r65KZyhhhW6e%2FFylmoXW1FB4Cc41aTBhgAcNJ3nBESdLcL4NkbJ5cjlkCz1Ba%2FSVD7%2BV5ar%2B6fo3PjHmm%2B6o96fYZrj88y8%2Bc8efMw604B9Zu3F2x4%2B81r69sH%2FnQvCy%2B8iAMk%2B4sC2umEKDkzXn5txcPUuf0KwkM3RwLeUtYQDwe%2F%2FcE634%2B5xRlnfIgBtRLgMfwlkXw0%2FyyRM5fIQPrW8%2FvDfE98Y3c9ldotE1cmJFOnL%2B2wpHifDWQ%2Bn2lNJomc75HHFNI1xq16mGalZDgvwoz4vRUePUvGfurwcIGS%2BHoBBTjKbZ%2BDr%2Bd7XpPA3ovV3%2BMNT5rs0GOqUBvHg9peVnJ4sW1CP%2FIvgoef%2BceGI%2BW3Ja7XIqV%2BrAcUS3RO9rAnpV%2B4OH7LGwhetCPY%2BgCpdMEXn39chSV9vG3SurSVXRu9wjRKmI%2Bof%2B5EQNjookWt6eaPHKyjNb5MCNcQDz8iajbJFFGVdgbZCeDJ2wG6IHZU8A49nFLP%2B7zWut4zIBxmKGoNPnzqqaIrWG50ICyJw6K9XETc7H98zX0p8mD09G&X-Amz-Signature=133b6c6c41da559939fbe386fc67b557914e166b9949e2dbba6ab8180a5b3eba&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

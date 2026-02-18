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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466Q4FNOTBI%2F20260218%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260218T183807Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEKP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIHfkszX6x5Qx5UnElkXDEUtC1mqWBRr%2BP7NxJYQdBclfAiBsW5R2iOMY0HatcoGHtJ%2F3aHmdE3RsajNSd0DAH8VoCSr%2FAwhsEAAaDDYzNzQyMzE4MzgwNSIMiJdQ1101d95rvOT4KtwDxnaikUbhhDBScFzwN9cwU8Hqm4Ok2efKbr7ZsFE1rgOaogEFkTWpvX2HRl4pU%2Ffsa6yy5B%2BoifaINituoeX5fwKv2cSn9DpY6Eh4IHTMb394Q8yGIjPDzlL%2FpdZjLC6HiSw56I7efiPAX%2FGK3S4Y0ahJNMmgwAj37DAmv3YRRtRp0WC5FZYDzDfU%2FpCX3YX5hSbThHtklkg4xZpR00VG4kcR4EcWQ49EldjHceZSCFHaRJwaDxbxfvUppxf45S5duOTovB5Ck4G7jVJ0pdOGsKFEFCHHPuOVxoGKiAk%2BXNKrZL%2Fdj8O9JsgqBXO23qxtLa9O3UFFEmlpFJ1bT6eOZgV6w3Mzi40gF8CYDE3wyIyyV2Uu103UbhavqdKRFWqK1pbFLbs8GVHe2I%2FQ0tqkDsg1NJcIikWa5fbiL1L3CY6ZUDbMSmi6XeO6v9Mngg%2FkuGQJp5PyrzVVtEzhFRa9WmBeWAxrojbNoE8oaNop%2FOo9mZlLELloq32ioiE0Lb2xI5CFM4INCwsRtfFi8AxH3Kmje0PcgofsFo5LjDVpDex%2Ft8dfLPQ4xO6AK0Z4YD3xaMatIwOYuB6knV9oOyYuI4oekvHkeguRxWIVtGs499Cg%2FDQLT9Bw9hwm4sIwuonYzAY6pgH%2BnLuvTZK4zqpMiH9SxvhjehqIdWOVLxGXWRvnwwXyiBMbW5ZIxjFtD3sRX4JoDwt0oqjl2pckaTcrDIzjQEF0DNm%2FPHCQBaqdUNYhxdctAOIV1SPP2RQiyqbv5lgiZZi7ZKLbCL1ijI6wFK83ia3hSAILzIZthxij18zqAR2vyfPacpx1xxP2hXQijAFM16jDXRcyJs3eLMh5hsMdkQX8%2FsdWzFDv&X-Amz-Signature=759c78dcd9e841250742385b63c45e39df5199076ad384ff645e744756439e49&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466Q4FNOTBI%2F20260218%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260218T183807Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEKP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIHfkszX6x5Qx5UnElkXDEUtC1mqWBRr%2BP7NxJYQdBclfAiBsW5R2iOMY0HatcoGHtJ%2F3aHmdE3RsajNSd0DAH8VoCSr%2FAwhsEAAaDDYzNzQyMzE4MzgwNSIMiJdQ1101d95rvOT4KtwDxnaikUbhhDBScFzwN9cwU8Hqm4Ok2efKbr7ZsFE1rgOaogEFkTWpvX2HRl4pU%2Ffsa6yy5B%2BoifaINituoeX5fwKv2cSn9DpY6Eh4IHTMb394Q8yGIjPDzlL%2FpdZjLC6HiSw56I7efiPAX%2FGK3S4Y0ahJNMmgwAj37DAmv3YRRtRp0WC5FZYDzDfU%2FpCX3YX5hSbThHtklkg4xZpR00VG4kcR4EcWQ49EldjHceZSCFHaRJwaDxbxfvUppxf45S5duOTovB5Ck4G7jVJ0pdOGsKFEFCHHPuOVxoGKiAk%2BXNKrZL%2Fdj8O9JsgqBXO23qxtLa9O3UFFEmlpFJ1bT6eOZgV6w3Mzi40gF8CYDE3wyIyyV2Uu103UbhavqdKRFWqK1pbFLbs8GVHe2I%2FQ0tqkDsg1NJcIikWa5fbiL1L3CY6ZUDbMSmi6XeO6v9Mngg%2FkuGQJp5PyrzVVtEzhFRa9WmBeWAxrojbNoE8oaNop%2FOo9mZlLELloq32ioiE0Lb2xI5CFM4INCwsRtfFi8AxH3Kmje0PcgofsFo5LjDVpDex%2Ft8dfLPQ4xO6AK0Z4YD3xaMatIwOYuB6knV9oOyYuI4oekvHkeguRxWIVtGs499Cg%2FDQLT9Bw9hwm4sIwuonYzAY6pgH%2BnLuvTZK4zqpMiH9SxvhjehqIdWOVLxGXWRvnwwXyiBMbW5ZIxjFtD3sRX4JoDwt0oqjl2pckaTcrDIzjQEF0DNm%2FPHCQBaqdUNYhxdctAOIV1SPP2RQiyqbv5lgiZZi7ZKLbCL1ijI6wFK83ia3hSAILzIZthxij18zqAR2vyfPacpx1xxP2hXQijAFM16jDXRcyJs3eLMh5hsMdkQX8%2FsdWzFDv&X-Amz-Signature=70e009a3ccb88729bda44f14924b2732ae3e5c0622c4f93d5ce0ef21b525f391&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

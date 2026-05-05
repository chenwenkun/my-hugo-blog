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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4665QZOM45D%2F20260505%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260505T130946Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEL3%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIFrNM%2B%2FHoW%2FSf9hLxB8sUZchbY2NYarOcXB8sGe3mhmpAiAJQwtHy7xAkCeWzXGCM4W%2BQJReXeSwS3nWKHlxaYa7uSqIBAiG%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIM8DwasQRKvBh6%2F6kcKtwDtHGNxhIeQ%2FQRhm8KgUhkirHT7%2BTUNOVOCCRlraQDYkxZClg0%2FKMROfLbAehG8DS%2B96LbRiA3fgr928TuuYCkyvZ42AvMe9G%2BzYOcg%2BFktLbObAWxUBTnbwbwQcxd9ra7RMcONkonBJYLCtrfOl%2B2qzHhbes5z2ANkWYRaOdHfq25v8FbG98QbftptHSWLAfwFP1FICsLQ3ZQy8gDmbzVHOkn6q8bkaQ89wZ9wNFzF3IubsEA4F%2FierWFNSqGO%2BLykfnUAL30LuiJWJBi1SY999bBnzPOOX6P78MeEGoJp7LXftN8SdNn2y4PkiFwVOHVvvjkCcIiIQx10b8F5IDXmho5cd44NxPDGlr65orKgZv1fH8Tn6eK13C%2Fc6UlSwaOvGCXe0%2FLodcKBlrrA9hFKvBcuUEyZaQeKm3OY6Fs%2Fc2Up%2Fdj54CJOP%2B%2FRYZk6Ast%2FIiL2GWVoKFQRUYkAvlHVARDPPhnLwL6bXmgqPesLV5UMRGJw7fyAzFH86Rin9IoiBd7kkOZZyvOvfGE1OEidTFKj1iQlT%2BNTd9PTFVmXdJ6Ys%2FHDnPtvdaQZQ83psOVRQK2kE95042kWBbucl%2BBolKTjJ%2B1MjyavnDdrYib1uQvG%2FeWk9RTfkaoSSwwh8%2FnzwY6pgGnLhZ9O2AiPU4RoZFUQu9lcH70UtCXI%2BaCXIdBy9Iaco6U9lFP%2FmO897a%2BqVYDR8NNqbe%2FbribpxgENgQQCzlG3GxmLvZA%2Fri0F7BX8d0JI%2BqXSHgAErn1%2BWNNEmLx2S7RO3SMLT71gssXWwtawuAoDE%2FX%2FRZSVgkeqTFJDiJ6EBQKO4RIUo8wv5FSviupGZTLvqEila%2F6t%2BueKA09Sq7wwCkI0VsA&X-Amz-Signature=5ce63105544622058d1166be6804cd7512296a236c29b83e506f9b6c8eb85b5e&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4665QZOM45D%2F20260505%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260505T130946Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEL3%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIFrNM%2B%2FHoW%2FSf9hLxB8sUZchbY2NYarOcXB8sGe3mhmpAiAJQwtHy7xAkCeWzXGCM4W%2BQJReXeSwS3nWKHlxaYa7uSqIBAiG%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIM8DwasQRKvBh6%2F6kcKtwDtHGNxhIeQ%2FQRhm8KgUhkirHT7%2BTUNOVOCCRlraQDYkxZClg0%2FKMROfLbAehG8DS%2B96LbRiA3fgr928TuuYCkyvZ42AvMe9G%2BzYOcg%2BFktLbObAWxUBTnbwbwQcxd9ra7RMcONkonBJYLCtrfOl%2B2qzHhbes5z2ANkWYRaOdHfq25v8FbG98QbftptHSWLAfwFP1FICsLQ3ZQy8gDmbzVHOkn6q8bkaQ89wZ9wNFzF3IubsEA4F%2FierWFNSqGO%2BLykfnUAL30LuiJWJBi1SY999bBnzPOOX6P78MeEGoJp7LXftN8SdNn2y4PkiFwVOHVvvjkCcIiIQx10b8F5IDXmho5cd44NxPDGlr65orKgZv1fH8Tn6eK13C%2Fc6UlSwaOvGCXe0%2FLodcKBlrrA9hFKvBcuUEyZaQeKm3OY6Fs%2Fc2Up%2Fdj54CJOP%2B%2FRYZk6Ast%2FIiL2GWVoKFQRUYkAvlHVARDPPhnLwL6bXmgqPesLV5UMRGJw7fyAzFH86Rin9IoiBd7kkOZZyvOvfGE1OEidTFKj1iQlT%2BNTd9PTFVmXdJ6Ys%2FHDnPtvdaQZQ83psOVRQK2kE95042kWBbucl%2BBolKTjJ%2B1MjyavnDdrYib1uQvG%2FeWk9RTfkaoSSwwh8%2FnzwY6pgGnLhZ9O2AiPU4RoZFUQu9lcH70UtCXI%2BaCXIdBy9Iaco6U9lFP%2FmO897a%2BqVYDR8NNqbe%2FbribpxgENgQQCzlG3GxmLvZA%2Fri0F7BX8d0JI%2BqXSHgAErn1%2BWNNEmLx2S7RO3SMLT71gssXWwtawuAoDE%2FX%2FRZSVgkeqTFJDiJ6EBQKO4RIUo8wv5FSviupGZTLvqEila%2F6t%2BueKA09Sq7wwCkI0VsA&X-Amz-Signature=10b26c80e26d7c84fe080a24dd51fe1d9653ee0f23fa98465a24f17dc6da9d3c&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

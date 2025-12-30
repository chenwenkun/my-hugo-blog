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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466VX4DRRYL%2F20251230%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251230T122320Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEOv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCICRDrA48FRHYLXCBaIbPV2a5QPn8Am2aXyjyP4CAbbgIAiBBxh9mPexwaZFuIjWR9Y0ueqTdDxGtonvOodavpkJtViqIBAi0%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMTxVc%2FJhInPaW3yqCKtwDsn%2Fn6mqbBbQwZ0cXxlw%2FW5jqVDfdBZ0GhrBExfotzExy72g6LqUzW%2Fbm7cF7OdxizkPHbfncSIBuu%2BLUUNmduWRF5CY0RqElQEGQUHOSxUp9zeBI3W2c%2B%2F5kVCneLPBsPXllTSP6eC%2Bw05%2B09sGEEVqoHprequBdj29wLPoXcSKa7MFDnfL2NkTr7Unj9lcHH8xs7wvWgFkup5x%2FA29jwdnbANE%2F4%2Bh%2FHRv7UPivS5T5RpRvxD9VO%2FQVGozQLtlBwJi55tG9u3kHfEq16MoNER62yXWj2X1g0yrQx%2FyB%2F5tqMJymH8NK7%2FcYbMDV4YSHDrPvf%2BzCkaSedxE3eKQLP6AdSIxl1E%2BN6QcBRcJQYNs1soNmUSM%2Br2EXqNPzFUPxLNo8gL%2F19IhLKUMtY%2FoNzmIC59o3mnf8mFiardSaEaV3xbP0i2hUqbQ%2Fg1Mk8oAv3iPf%2FomKhQZJLELBGbq%2F1LUl3aEAISMSA7oJ8%2BxeCmtrhz6AuF1ET8s4u76BcBLAFHvScev2d1vAwxU3ZNrPPlo2xAB5EZ%2BJUGXe2E29QOiTaDGPzq4ch8sH5OfoFAxFueIRpa2%2BI1O1qLmP5%2FMhIwDdJ47ow37F1FQTsJ72cv9W0F0O8rlctz56454wwNnOygY6pgHqeOrnLXNPjJC0u5QsDpf0DaiBcqo%2BR9KVvy23Feyuy1gt0w0JnE29P7qUasJvIaXC8XNb0yPtPP4N38QDo%2BCkSJhngVTDb3kRb9wyjSo2uk8RACLhAcJ%2Bv94Dwo8vJu4cja1qobsdZXkB%2F3EhugG30N6qTGx990487%2B9mjD5VRyGzUI6t06uHU13wbhGLc4tdoQCD5fs75yupNabYJe8PRSJ7r8VK&X-Amz-Signature=c4a88e6eab8522ac1bd857915b2590ec585280ea727a819c249b26c527e4b6f4&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466VX4DRRYL%2F20251230%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251230T122320Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEOv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCICRDrA48FRHYLXCBaIbPV2a5QPn8Am2aXyjyP4CAbbgIAiBBxh9mPexwaZFuIjWR9Y0ueqTdDxGtonvOodavpkJtViqIBAi0%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMTxVc%2FJhInPaW3yqCKtwDsn%2Fn6mqbBbQwZ0cXxlw%2FW5jqVDfdBZ0GhrBExfotzExy72g6LqUzW%2Fbm7cF7OdxizkPHbfncSIBuu%2BLUUNmduWRF5CY0RqElQEGQUHOSxUp9zeBI3W2c%2B%2F5kVCneLPBsPXllTSP6eC%2Bw05%2B09sGEEVqoHprequBdj29wLPoXcSKa7MFDnfL2NkTr7Unj9lcHH8xs7wvWgFkup5x%2FA29jwdnbANE%2F4%2Bh%2FHRv7UPivS5T5RpRvxD9VO%2FQVGozQLtlBwJi55tG9u3kHfEq16MoNER62yXWj2X1g0yrQx%2FyB%2F5tqMJymH8NK7%2FcYbMDV4YSHDrPvf%2BzCkaSedxE3eKQLP6AdSIxl1E%2BN6QcBRcJQYNs1soNmUSM%2Br2EXqNPzFUPxLNo8gL%2F19IhLKUMtY%2FoNzmIC59o3mnf8mFiardSaEaV3xbP0i2hUqbQ%2Fg1Mk8oAv3iPf%2FomKhQZJLELBGbq%2F1LUl3aEAISMSA7oJ8%2BxeCmtrhz6AuF1ET8s4u76BcBLAFHvScev2d1vAwxU3ZNrPPlo2xAB5EZ%2BJUGXe2E29QOiTaDGPzq4ch8sH5OfoFAxFueIRpa2%2BI1O1qLmP5%2FMhIwDdJ47ow37F1FQTsJ72cv9W0F0O8rlctz56454wwNnOygY6pgHqeOrnLXNPjJC0u5QsDpf0DaiBcqo%2BR9KVvy23Feyuy1gt0w0JnE29P7qUasJvIaXC8XNb0yPtPP4N38QDo%2BCkSJhngVTDb3kRb9wyjSo2uk8RACLhAcJ%2Bv94Dwo8vJu4cja1qobsdZXkB%2F3EhugG30N6qTGx990487%2B9mjD5VRyGzUI6t06uHU13wbhGLc4tdoQCD5fs75yupNabYJe8PRSJ7r8VK&X-Amz-Signature=6037e8639aff426d3c8e5bb37e2aeb548223c46ed4d9b151bfa330eb172cd87c&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

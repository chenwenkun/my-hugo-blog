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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466XYNQGQ5U%2F20260413%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260413T012851Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEKH%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIGeSZTzEDNlZZ3ssZUOwkFSBUp4a8%2FPSa8xvOY9lqwVqAiBZadV8UnlDWH1%2FudgFSaFgiSosAXxjj2rxB1i0ubsMjCr%2FAwhqEAAaDDYzNzQyMzE4MzgwNSIMxZ%2FvPoeIsQn9hoxLKtwDZUtEVC6MZjb0tlvGpGHCcU57Pv3mH6yErBZ0ADrnTdkbHo7%2BURNzNakMlRiZd1TGCTg6Ge5QdS%2FX436TlrspwhhdK%2BL36efHZEtCuf7JpWPTJlNIKbm8ds8GUi7FtIaF3edJEjVbAJBB%2FevlJIKDY1tl4esv%2FlSOPi5V51g8Yq%2BGHiB6Wup%2B941T2rpkHLcNY%2B6zWMrCenH2RbFqaKjWtMGpfKAnWYtpWnymvX03XSFDmGVnutxodqlPla%2B8I2QhmUajKGcO0F9%2B9XNUIu30WfWY3e7yADt19y6zmMM9JXNnPeZMS%2FIH2GkSBgWY03%2ByEQn6FiwhDjP%2BsE0QLfy9bpedJqURE0GnDD6Gju3d%2F9k8fPa6XrxuCMrfpvcgRWrLlvyAnZPfG%2B1g1wxkubbIUNjl%2F%2Fg%2BXRSpnaK3g2czBnlKLMZHhS%2FG5e2%2FiMl5Y%2FYD2m7EsZwr3%2By0o8t2CwM4UptSF2Nl6UuJd7ytv6XpdXdw4eV4cGPmulyTwUPCBLgT7UY9AJ3kwlowedIbGx1933G2yTCx6F1Y0S9VjAFiZ0ttRCV6yWkF6PyNWK8NTKGlPdr3JR38ytk%2BcS9qZD3DYEWCFv6%2F6a32MecvFLOLnshOCbV3ip5vFVYomJ0wifzwzgY6pgET6S4j9Bw8qPqXgtzIsflLQySfYJSS67sBoDAAZ1kyQkXud0adrvrV0sIOECnTVVpT1iTuuzMeD762QeYrhB%2BFgF76hhUcjuwa0jeO4vOMdF4fcGobHMzL6sjNtMnf0M%2BOoHf5vXrg9RUu7NBV6TJmfFFiiIKFwIOc7QEXlj309XdVTk2SjugNxcrNGEqwbe%2Bx8CUE7Y%2F0LjE7Ujo%2FyHs5M8yBOg0i&X-Amz-Signature=41e5030014dd388a08c138aada5b22671f753e92cb4bccad3bc53e2ee9125226&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466XYNQGQ5U%2F20260413%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260413T012851Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEKH%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIGeSZTzEDNlZZ3ssZUOwkFSBUp4a8%2FPSa8xvOY9lqwVqAiBZadV8UnlDWH1%2FudgFSaFgiSosAXxjj2rxB1i0ubsMjCr%2FAwhqEAAaDDYzNzQyMzE4MzgwNSIMxZ%2FvPoeIsQn9hoxLKtwDZUtEVC6MZjb0tlvGpGHCcU57Pv3mH6yErBZ0ADrnTdkbHo7%2BURNzNakMlRiZd1TGCTg6Ge5QdS%2FX436TlrspwhhdK%2BL36efHZEtCuf7JpWPTJlNIKbm8ds8GUi7FtIaF3edJEjVbAJBB%2FevlJIKDY1tl4esv%2FlSOPi5V51g8Yq%2BGHiB6Wup%2B941T2rpkHLcNY%2B6zWMrCenH2RbFqaKjWtMGpfKAnWYtpWnymvX03XSFDmGVnutxodqlPla%2B8I2QhmUajKGcO0F9%2B9XNUIu30WfWY3e7yADt19y6zmMM9JXNnPeZMS%2FIH2GkSBgWY03%2ByEQn6FiwhDjP%2BsE0QLfy9bpedJqURE0GnDD6Gju3d%2F9k8fPa6XrxuCMrfpvcgRWrLlvyAnZPfG%2B1g1wxkubbIUNjl%2F%2Fg%2BXRSpnaK3g2czBnlKLMZHhS%2FG5e2%2FiMl5Y%2FYD2m7EsZwr3%2By0o8t2CwM4UptSF2Nl6UuJd7ytv6XpdXdw4eV4cGPmulyTwUPCBLgT7UY9AJ3kwlowedIbGx1933G2yTCx6F1Y0S9VjAFiZ0ttRCV6yWkF6PyNWK8NTKGlPdr3JR38ytk%2BcS9qZD3DYEWCFv6%2F6a32MecvFLOLnshOCbV3ip5vFVYomJ0wifzwzgY6pgET6S4j9Bw8qPqXgtzIsflLQySfYJSS67sBoDAAZ1kyQkXud0adrvrV0sIOECnTVVpT1iTuuzMeD762QeYrhB%2BFgF76hhUcjuwa0jeO4vOMdF4fcGobHMzL6sjNtMnf0M%2BOoHf5vXrg9RUu7NBV6TJmfFFiiIKFwIOc7QEXlj309XdVTk2SjugNxcrNGEqwbe%2Bx8CUE7Y%2F0LjE7Ujo%2FyHs5M8yBOg0i&X-Amz-Signature=a19aade461e5522a97196a6cd89b3e37d83a649b3791dc388a9a190b85e53a59&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

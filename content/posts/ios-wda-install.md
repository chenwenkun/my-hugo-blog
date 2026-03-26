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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466RDI2XVMP%2F20260326%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260326T065642Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEPX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCPNihlY1GXVqjhDw8tKI%2BCzjqqeTzT4VpKUQT8d%2BE1qwIhAJ5LD9YTkA4q%2B8brg6rGDHusXj8mAuJO2maT8%2F8NCWa0KogECL7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgzmgLGCGoszoKZzNtAq3AOjJaIItgRdR7AVkwL4ky%2Fv7hmLSrPUWJkW79B2%2BZDstxscgyjopdlf6zc9lBFkY14fXUPsV4PwUoa2jpfAZT28m5R3QUz7RLCRJQpXY5CgTbKKArrKRjzRBVlwtUbF5IYXhBu48DSE%2FniJmLt5wvTaIK8aWGYedP9QbnwrNczVOtTEtpC%2Fw4BLRPG8PaXjppMdxM%2BFvZDAdHauNiTIAs%2Ffm5u89yQZczyaopIyVn%2BNYCVFZRZKiijPVvT3mP0mYeALe3h%2BvpbUNAAxmDuXeRnAZ%2Fh2vO1Q%2BpuzFsRboWZTELkpnZFkgbYy6A51nAst2Qxq0MSG0aMM5Y7oBoY4q0qQSZd59C9zx2pqi%2F2c8PDTSDYJUb%2BDC6NmvqbOTgEbRUMylWhtig688M9N6Miz5WITf63aiCQ32e7PozHO9LtZgFmUyD3My4KFkVfU%2Fi8vK2aW%2FZvmYQ3Egd0SQIBRng70FiNajBsrhODF02YF70VkbJumtOH%2FjltAEdgX%2FoIkINZs7B%2BzhOkCAtOKh%2FB3EpavVsRHUIII8LOI3%2FgodR9OcYGnr40ay3OwCH2fbFQGnemrb4mNtH2dpZmgiyAakdcqeaA7RI3rNNYEVtPrX0bhiMgPAj8eG8WX3nIJODCr%2FpLOBjqkAZQFp5ucUYCw05fDJyQ1Z3kr5Roxo7w8a0zwVry9xp7%2FlYTDMxVkTuRDTQ4pewLbTZSSpRGhxRp%2BTCEX2%2BiFu8dlHkpCp7GRBQMcVulfK6DUADWPufJUHsWutJq7HAlLMBrCAAuNtkhz0hwEUJ35N5kRxdFiXL4JD2TuTj0YhnZwE4YOnv9Cwor97ix26Kdn5%2BfMrV2YvG0Ly8RGVntrCntou0Nb&X-Amz-Signature=5f5d8e32b0ccb46b4f6775e67547ade92d5f59a899af7fdf402c00aff8dd18cc&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466RDI2XVMP%2F20260326%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260326T065642Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEPX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCPNihlY1GXVqjhDw8tKI%2BCzjqqeTzT4VpKUQT8d%2BE1qwIhAJ5LD9YTkA4q%2B8brg6rGDHusXj8mAuJO2maT8%2F8NCWa0KogECL7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgzmgLGCGoszoKZzNtAq3AOjJaIItgRdR7AVkwL4ky%2Fv7hmLSrPUWJkW79B2%2BZDstxscgyjopdlf6zc9lBFkY14fXUPsV4PwUoa2jpfAZT28m5R3QUz7RLCRJQpXY5CgTbKKArrKRjzRBVlwtUbF5IYXhBu48DSE%2FniJmLt5wvTaIK8aWGYedP9QbnwrNczVOtTEtpC%2Fw4BLRPG8PaXjppMdxM%2BFvZDAdHauNiTIAs%2Ffm5u89yQZczyaopIyVn%2BNYCVFZRZKiijPVvT3mP0mYeALe3h%2BvpbUNAAxmDuXeRnAZ%2Fh2vO1Q%2BpuzFsRboWZTELkpnZFkgbYy6A51nAst2Qxq0MSG0aMM5Y7oBoY4q0qQSZd59C9zx2pqi%2F2c8PDTSDYJUb%2BDC6NmvqbOTgEbRUMylWhtig688M9N6Miz5WITf63aiCQ32e7PozHO9LtZgFmUyD3My4KFkVfU%2Fi8vK2aW%2FZvmYQ3Egd0SQIBRng70FiNajBsrhODF02YF70VkbJumtOH%2FjltAEdgX%2FoIkINZs7B%2BzhOkCAtOKh%2FB3EpavVsRHUIII8LOI3%2FgodR9OcYGnr40ay3OwCH2fbFQGnemrb4mNtH2dpZmgiyAakdcqeaA7RI3rNNYEVtPrX0bhiMgPAj8eG8WX3nIJODCr%2FpLOBjqkAZQFp5ucUYCw05fDJyQ1Z3kr5Roxo7w8a0zwVry9xp7%2FlYTDMxVkTuRDTQ4pewLbTZSSpRGhxRp%2BTCEX2%2BiFu8dlHkpCp7GRBQMcVulfK6DUADWPufJUHsWutJq7HAlLMBrCAAuNtkhz0hwEUJ35N5kRxdFiXL4JD2TuTj0YhnZwE4YOnv9Cwor97ix26Kdn5%2BfMrV2YvG0Ly8RGVntrCntou0Nb&X-Amz-Signature=ccdf4ab680bcc455cfccbd6960919f9f2ddfaa7a67a912d7747b68d6050c28e1&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

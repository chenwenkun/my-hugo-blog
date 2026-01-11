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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB46626QSHU26%2F20260111%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260111T061825Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEAUaCXVzLXdlc3QtMiJHMEUCIC%2BxjLMKc%2FnEQz770vDpn9emaWSqK%2FGdTuSbiKuJ%2FlEUAiEA7r1ayWtHCltpcQosRmNeEo%2BH9lYZdt%2FN2lR9w5cQ3GAqiAQIzv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDDAvjyJQDUorigYwhircAzhcAmEEM6zUfPgBIgCiWjclz%2Ffb8kdMQUt4sfblo3V6B4QqifxYnkUQ7SVkHiwa%2BzNuXYd14xyCRd18MiQraWpeRRDgU%2FDux4u0nZQm6B5YSASjN83zxwhzQ5G5cPYtdtsEnrrmeG9vAN64S6D2ia1fe%2BznnZk6ZBoLcW75R%2FlEncv9nTFydO1aX86bnNIKtF1NCQ1cHFRO0Uf5JX13kC6W0M%2Fyewy%2FW870IM%2BVQ1RQkX2tfG40Mv78keAMmH3ICgHiFiZEOtUbKZQk%2FQrYq6jy67Ev25at7U80EgHWwh41e%2BAy7PKbRLicirJYB%2BMmXaxLJcnM7Zf38A34%2FVix9ZLZIRo5TJkD41h3N2fdiKSJ2voyPiUFVTPjg3D%2BdVk7JUklHV3Q1bOw90mtT2YCmfd8%2Fa9UNWdoFB09zUaf00DQgPL4NHNDU0jS2NmMfjb%2BZe9atvbG8l8BkIzsDS6DGeb2rWOapA7k66jLVZPg27nqV7araWr%2F6%2BgXwyqZ4qWb%2B879808nfyzcbIC8AjzBQChmUsf3kO1Bffw0jRqyTCqYcgXtB50FBnb6AZm1IRAQkzsydd%2FGxoB646HrRMV6n8LAGDJYe1wTogYTqLXKyZXwMHWiDh9rs2v%2Fw4FrMNrbjMsGOqUBUFje%2BdSqtgm1AHhNlizmdfIV%2BUpnvqK3NsD3YZPPPgpwrS6aOeHAtqMBwuXmSzVANvlMN%2FhddIHWkHiqAjxUs1WTnQnVXeN92ts6TIIIyS0Az1iAqW9UnY91mr1VcNvMTNgOoqdj4KnAFrm6fRalg6opfug48Pu6xSc2ku9OOdo5x3%2FP%2Bl1l1tFSs%2F66PdP9AKMeWJoZAYZbiCULzi58KrT9cbgT&X-Amz-Signature=a64d15200df22ffdd607f4d3ae4ad205df402114887c507d08a1a01c34429a27&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB46626QSHU26%2F20260111%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260111T061825Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEAUaCXVzLXdlc3QtMiJHMEUCIC%2BxjLMKc%2FnEQz770vDpn9emaWSqK%2FGdTuSbiKuJ%2FlEUAiEA7r1ayWtHCltpcQosRmNeEo%2BH9lYZdt%2FN2lR9w5cQ3GAqiAQIzv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDDAvjyJQDUorigYwhircAzhcAmEEM6zUfPgBIgCiWjclz%2Ffb8kdMQUt4sfblo3V6B4QqifxYnkUQ7SVkHiwa%2BzNuXYd14xyCRd18MiQraWpeRRDgU%2FDux4u0nZQm6B5YSASjN83zxwhzQ5G5cPYtdtsEnrrmeG9vAN64S6D2ia1fe%2BznnZk6ZBoLcW75R%2FlEncv9nTFydO1aX86bnNIKtF1NCQ1cHFRO0Uf5JX13kC6W0M%2Fyewy%2FW870IM%2BVQ1RQkX2tfG40Mv78keAMmH3ICgHiFiZEOtUbKZQk%2FQrYq6jy67Ev25at7U80EgHWwh41e%2BAy7PKbRLicirJYB%2BMmXaxLJcnM7Zf38A34%2FVix9ZLZIRo5TJkD41h3N2fdiKSJ2voyPiUFVTPjg3D%2BdVk7JUklHV3Q1bOw90mtT2YCmfd8%2Fa9UNWdoFB09zUaf00DQgPL4NHNDU0jS2NmMfjb%2BZe9atvbG8l8BkIzsDS6DGeb2rWOapA7k66jLVZPg27nqV7araWr%2F6%2BgXwyqZ4qWb%2B879808nfyzcbIC8AjzBQChmUsf3kO1Bffw0jRqyTCqYcgXtB50FBnb6AZm1IRAQkzsydd%2FGxoB646HrRMV6n8LAGDJYe1wTogYTqLXKyZXwMHWiDh9rs2v%2Fw4FrMNrbjMsGOqUBUFje%2BdSqtgm1AHhNlizmdfIV%2BUpnvqK3NsD3YZPPPgpwrS6aOeHAtqMBwuXmSzVANvlMN%2FhddIHWkHiqAjxUs1WTnQnVXeN92ts6TIIIyS0Az1iAqW9UnY91mr1VcNvMTNgOoqdj4KnAFrm6fRalg6opfug48Pu6xSc2ku9OOdo5x3%2FP%2Bl1l1tFSs%2F66PdP9AKMeWJoZAYZbiCULzi58KrT9cbgT&X-Amz-Signature=0a6aead5d4c28f0f559d9b578e0154c7550e1e6c22240bd20e2efb3796b8b194&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

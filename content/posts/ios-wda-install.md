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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4664KGHRNFJ%2F20260519%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260519T143417Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEA4aCXVzLXdlc3QtMiJHMEUCIQDd9viz2z4VT6KxIaCP%2FbFxBHPIaXyc1h7Ly%2BMN4eHy4AIgFJ5BtCpVNId5QdcObkmMoWLeuYXp7zoPLmBCwCVLoK8qiAQI1%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDGI0OVcs1H5yLMRIvyrcA8sOPrQ8P1ibAgPPe9s5cu0rc%2Be2GyappgXxrgEY0VXbf2%2FbYKlKqqJ%2FL%2BWGkIF9Q%2FxjVzjvs7rifC77DBRx%2FW04QMTLroIPph8Vk4edPbo%2Fznnrb7QmNmSNt2ZMsmAwqZTFSh2syvWITQfFWFmWTh%2B%2B37FWAMl15Sc%2FwwLZTkClJiGF7zCrzn7lSx4KW60R0RoRvUiuvcxHsvll2elBTdBBxcsYVa1BCa9xcBFh62V%2FJYIwTWeE18OdCpCO%2FVynHnnSDy4AnYjfuu6FSry4WqMqtnyKY9UzxeXEtopqWD1M%2FMxSl%2BRopiG4oBWANRpLVa3GcZ9AXlgesB9gNYWISQoJwjXiV8g8P285c%2BFwSchro6dERKFIQ3QOMBdzG87R7p2Sf890ziHZFzhdSUoZATueihg2s3DcdWlv6eNoDOe%2BvnsJy74A6vsphw2Dgq7KM7iolW9gZ2X7r6NlahUtnpVvWXXhLhL6pG%2BBXOd3tXJ2gyicHIB%2FX26vhHqo1gCuaFoi%2BlaLaoyjJsovVVT2M36iSfz1bnrPFtYZ7%2FTER79b%2BsmJuwBEFhC2tzLxjOGkCM6KXDpRTDEEkfI%2FybNePQMKNsRlkz%2FFCRNyFB%2BUseQ4ivgv3CIJrffhG37qMMPKsdAGOqUBAqidHIZ76y%2FlNINlzSGvnU3Jxaf9%2FcwM1i8YB8pWo%2Bt5ToPns8tIaNbR%2BIhiL2M8FVRNIRQwpHyuizNLt%2BPaGD4G122k0lMwdDLry5PeuInLdpFGj1YNMN2Ud1uOIR5YRquEIpo88tiSAElJh4MTMjTpJ2ub9gT8O8zh03X%2FMbH3rWodBdUvx3mV0vCNeKOVR6zgJzD8U%2BrNinmPnLF37zNkvErR&X-Amz-Signature=10d1dd3d9aedc01d2bec1d9bbfc4879be718c0a75f60c173fcb79bbfe793fc61&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4664KGHRNFJ%2F20260519%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260519T143417Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEA4aCXVzLXdlc3QtMiJHMEUCIQDd9viz2z4VT6KxIaCP%2FbFxBHPIaXyc1h7Ly%2BMN4eHy4AIgFJ5BtCpVNId5QdcObkmMoWLeuYXp7zoPLmBCwCVLoK8qiAQI1%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDGI0OVcs1H5yLMRIvyrcA8sOPrQ8P1ibAgPPe9s5cu0rc%2Be2GyappgXxrgEY0VXbf2%2FbYKlKqqJ%2FL%2BWGkIF9Q%2FxjVzjvs7rifC77DBRx%2FW04QMTLroIPph8Vk4edPbo%2Fznnrb7QmNmSNt2ZMsmAwqZTFSh2syvWITQfFWFmWTh%2B%2B37FWAMl15Sc%2FwwLZTkClJiGF7zCrzn7lSx4KW60R0RoRvUiuvcxHsvll2elBTdBBxcsYVa1BCa9xcBFh62V%2FJYIwTWeE18OdCpCO%2FVynHnnSDy4AnYjfuu6FSry4WqMqtnyKY9UzxeXEtopqWD1M%2FMxSl%2BRopiG4oBWANRpLVa3GcZ9AXlgesB9gNYWISQoJwjXiV8g8P285c%2BFwSchro6dERKFIQ3QOMBdzG87R7p2Sf890ziHZFzhdSUoZATueihg2s3DcdWlv6eNoDOe%2BvnsJy74A6vsphw2Dgq7KM7iolW9gZ2X7r6NlahUtnpVvWXXhLhL6pG%2BBXOd3tXJ2gyicHIB%2FX26vhHqo1gCuaFoi%2BlaLaoyjJsovVVT2M36iSfz1bnrPFtYZ7%2FTER79b%2BsmJuwBEFhC2tzLxjOGkCM6KXDpRTDEEkfI%2FybNePQMKNsRlkz%2FFCRNyFB%2BUseQ4ivgv3CIJrffhG37qMMPKsdAGOqUBAqidHIZ76y%2FlNINlzSGvnU3Jxaf9%2FcwM1i8YB8pWo%2Bt5ToPns8tIaNbR%2BIhiL2M8FVRNIRQwpHyuizNLt%2BPaGD4G122k0lMwdDLry5PeuInLdpFGj1YNMN2Ud1uOIR5YRquEIpo88tiSAElJh4MTMjTpJ2ub9gT8O8zh03X%2FMbH3rWodBdUvx3mV0vCNeKOVR6zgJzD8U%2BrNinmPnLF37zNkvErR&X-Amz-Signature=71edb2ed0bd165266049b03e5983e287d75040d47d099b980777dca4ec87c63a&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

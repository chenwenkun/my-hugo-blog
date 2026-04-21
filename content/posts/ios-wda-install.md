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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4665C6XA5ZE%2F20260421%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260421T012633Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEGAaCXVzLXdlc3QtMiJHMEUCIBo0eJ9ZLezSCRGsrgvQuEAkml3t8pqPTOXzH1ANUYzdAiEAv5b8DGjLFju3Gc4d5xGZH%2BWSSgHlcDWPW%2B8kFvp2VBgq%2FwMIKRAAGgw2Mzc0MjMxODM4MDUiDCEwbUxJ14%2FM1nSSHircA8r02CD7c6QyD7sGpYSpo7WB9Fy0tHMB0%2F8I0CC8BC9eLaPHvdgL1lZlEkAFbu32UQe3mCFiB0TVh42qPLvj5AfVMgSH8bZePhTp%2F49p0L37utfdMXqF0GMjbWIl9GL9kxSEcCEsRgsEEWUf%2Bgx3Ocnr5ZqedbCC2E0kMkqJNhzLl5X2fOL4GshGMMqb7jZCFfHD2dXLkRTrf5OhGBKfKqHxdJCqaSkPsz8ahAQKKvGmvr59RV%2Fo6CvU2%2BUGQYA%2Foaa5gO3dIRrg5CyOrxnrfO5ihUTgT1vy8qi84jyhKQ5pmGJ0X2ZPZ9G%2B0Wwnby3wa3PYl0fHrIh1yw4NTwI9iBBk5t%2BPN55cg8G2bgy2Z400m6zbpuK7ZgEBPthEPt%2BEveXpFUto5Cm0qSIO26pvDmK6sWEmeuCNyFHbCzBUr3YPWDLS%2BESCBrAe%2BN2oj406v5bJc%2FilPQ4L5KCulg%2FoJpdv2xUtHe18G38H3uEj8bG%2B9OL6uXDraIu%2B1%2BbjG4Lh0O8N1GuEpoPEzHXRaX6OCx7wuQEmAV6NzduOvQx%2BfnKSiJaEktrJjmkP9J3u3ARtT1MrTbNEaTLAsFZCbvUXRPaZGJDXlHz1fus8fBWEXlaloJN47eryRSsdtttPMPODm88GOqUBShAK9%2FKk1GjFHJl0bGfrML4UFaR5RvkvQtuNFwr1IvscHZAB0m94FTz%2BbAwlX5wXWEUrQJwErnO%2BRJSXVvyUKgf0%2FhESSr2tXH5LwQ8RlJnAC8OCeepO6kLyMqx9ypCXzBckxuytBcdmi5kzspmpawrzGJoxAer1xZpc5E1GUNLXkvnH5kJdRV9Waa044PwPvtD50SBx0vauJiJrU509Wp%2FE4XQt&X-Amz-Signature=c40d19a6efbe9ea5fdc3b02ebd61fb5cd767252eb554c6a74a8b98bd0aa4db9b&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4665C6XA5ZE%2F20260421%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260421T012633Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEGAaCXVzLXdlc3QtMiJHMEUCIBo0eJ9ZLezSCRGsrgvQuEAkml3t8pqPTOXzH1ANUYzdAiEAv5b8DGjLFju3Gc4d5xGZH%2BWSSgHlcDWPW%2B8kFvp2VBgq%2FwMIKRAAGgw2Mzc0MjMxODM4MDUiDCEwbUxJ14%2FM1nSSHircA8r02CD7c6QyD7sGpYSpo7WB9Fy0tHMB0%2F8I0CC8BC9eLaPHvdgL1lZlEkAFbu32UQe3mCFiB0TVh42qPLvj5AfVMgSH8bZePhTp%2F49p0L37utfdMXqF0GMjbWIl9GL9kxSEcCEsRgsEEWUf%2Bgx3Ocnr5ZqedbCC2E0kMkqJNhzLl5X2fOL4GshGMMqb7jZCFfHD2dXLkRTrf5OhGBKfKqHxdJCqaSkPsz8ahAQKKvGmvr59RV%2Fo6CvU2%2BUGQYA%2Foaa5gO3dIRrg5CyOrxnrfO5ihUTgT1vy8qi84jyhKQ5pmGJ0X2ZPZ9G%2B0Wwnby3wa3PYl0fHrIh1yw4NTwI9iBBk5t%2BPN55cg8G2bgy2Z400m6zbpuK7ZgEBPthEPt%2BEveXpFUto5Cm0qSIO26pvDmK6sWEmeuCNyFHbCzBUr3YPWDLS%2BESCBrAe%2BN2oj406v5bJc%2FilPQ4L5KCulg%2FoJpdv2xUtHe18G38H3uEj8bG%2B9OL6uXDraIu%2B1%2BbjG4Lh0O8N1GuEpoPEzHXRaX6OCx7wuQEmAV6NzduOvQx%2BfnKSiJaEktrJjmkP9J3u3ARtT1MrTbNEaTLAsFZCbvUXRPaZGJDXlHz1fus8fBWEXlaloJN47eryRSsdtttPMPODm88GOqUBShAK9%2FKk1GjFHJl0bGfrML4UFaR5RvkvQtuNFwr1IvscHZAB0m94FTz%2BbAwlX5wXWEUrQJwErnO%2BRJSXVvyUKgf0%2FhESSr2tXH5LwQ8RlJnAC8OCeepO6kLyMqx9ypCXzBckxuytBcdmi5kzspmpawrzGJoxAer1xZpc5E1GUNLXkvnH5kJdRV9Waa044PwPvtD50SBx0vauJiJrU509Wp%2FE4XQt&X-Amz-Signature=109fcd50039474de91f1c799c25a212d5ee70d1f33eaac6f7e0fc29f0d000909&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

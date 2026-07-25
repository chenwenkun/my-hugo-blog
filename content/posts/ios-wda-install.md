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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4665AHQVIRG%2F20260725%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260725T125900Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEFUaCXVzLXdlc3QtMiJHMEUCIQCUcCVxui8b3ZnX%2BCY6BOIhP%2BdNUh6S9MFDQ5yD2aQIywIgCY5O7fqN7HpTkgi6CL6UXRgvo2OrW2VoUnUuDYWixk0q%2FwMIHhAAGgw2Mzc0MjMxODM4MDUiDIq6CTh77QkH0o20yircAxJHvDV4Ftl5rflx1n2SdNBLTnyDLuxq1Zcnyqw8XTefGAFWzS6XbCeVBe14uP%2FdLoDpIpzJkKm5o9W%2FzJahgzhRC%2BgUVYP7Hfx9aurVuyroy0SLxH%2B8ihEAqQJ1zVipn91%2FF1UnhQuBgaw%2FkfOvb%2BoqAYePhe5N2FGlZ6iaFLLd6nZPTh5DTq7zkVxqbipBb1fzVxdtquVDgjBlqNSuSDVePOQZz6GXtSUtB%2BmPRjuvr2XEXYLGt9BEYKV2o4xnLqv4Pby4jN1%2Fpj7a2Yz0hWlRp%2B3ySVbZ0vd0CFbNp%2Fxij%2BTfb4Ouzqob3F%2B3Pf%2FjKbrOOBFNH3yyFjr1%2B%2FRNGfKQIt%2BxWpLGIXNhgJgppzQJ4FB2%2FZqCw%2F0S%2FXArr28BRopgj7rsTwBASa44LloZa6f4Gg6Os7Dci53rGf7ci%2F8eFwI5ozCOZiI5%2BKUCPG8ia8K6qKpkm9Iw%2FSDvlw9xMPKEde6JKycfVjs5C%2Bs6WYoIrg%2BGt8uXJaF76UaKz2GnltJQMTpD9PebbtIHZ0l3PfwZmRLKMAgKqrvEKo31jFAPPSB7dPWAj3uGHkN2AMg%2B5H%2BqR3K4bGQJULa9Lwci0sO0JJtJZiCF9PyBeTCyxdSbM7pWhtI8ffvokFp0MP%2FhktMGOqUBVm66k7CROu2TFHieJWl%2BnFVOJJFoDL%2BLee%2BGgGW2BZvaiAiaVTiHNNSr%2FafOG%2Bw%2FobRZiSvlSk3nG18CBrrIKkCHoTG7lqxc0DDcc0vhFmF3LSQ7IunC0zPadvvduQgogcxWhEge5aR1r8RbFT%2BPyCCVR5Omx9T7JK7x3QTr9VPqrTmjmHlhh%2FTHqUyIWZszMvE2qCMUK0ZP7oSu00Kyu4EDje6N&X-Amz-Signature=26d4284df38c95c92d0fb86097ea4c30e2223992dd215f9f179403f6eafb8b9f&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4665AHQVIRG%2F20260725%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260725T125900Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEFUaCXVzLXdlc3QtMiJHMEUCIQCUcCVxui8b3ZnX%2BCY6BOIhP%2BdNUh6S9MFDQ5yD2aQIywIgCY5O7fqN7HpTkgi6CL6UXRgvo2OrW2VoUnUuDYWixk0q%2FwMIHhAAGgw2Mzc0MjMxODM4MDUiDIq6CTh77QkH0o20yircAxJHvDV4Ftl5rflx1n2SdNBLTnyDLuxq1Zcnyqw8XTefGAFWzS6XbCeVBe14uP%2FdLoDpIpzJkKm5o9W%2FzJahgzhRC%2BgUVYP7Hfx9aurVuyroy0SLxH%2B8ihEAqQJ1zVipn91%2FF1UnhQuBgaw%2FkfOvb%2BoqAYePhe5N2FGlZ6iaFLLd6nZPTh5DTq7zkVxqbipBb1fzVxdtquVDgjBlqNSuSDVePOQZz6GXtSUtB%2BmPRjuvr2XEXYLGt9BEYKV2o4xnLqv4Pby4jN1%2Fpj7a2Yz0hWlRp%2B3ySVbZ0vd0CFbNp%2Fxij%2BTfb4Ouzqob3F%2B3Pf%2FjKbrOOBFNH3yyFjr1%2B%2FRNGfKQIt%2BxWpLGIXNhgJgppzQJ4FB2%2FZqCw%2F0S%2FXArr28BRopgj7rsTwBASa44LloZa6f4Gg6Os7Dci53rGf7ci%2F8eFwI5ozCOZiI5%2BKUCPG8ia8K6qKpkm9Iw%2FSDvlw9xMPKEde6JKycfVjs5C%2Bs6WYoIrg%2BGt8uXJaF76UaKz2GnltJQMTpD9PebbtIHZ0l3PfwZmRLKMAgKqrvEKo31jFAPPSB7dPWAj3uGHkN2AMg%2B5H%2BqR3K4bGQJULa9Lwci0sO0JJtJZiCF9PyBeTCyxdSbM7pWhtI8ffvokFp0MP%2FhktMGOqUBVm66k7CROu2TFHieJWl%2BnFVOJJFoDL%2BLee%2BGgGW2BZvaiAiaVTiHNNSr%2FafOG%2Bw%2FobRZiSvlSk3nG18CBrrIKkCHoTG7lqxc0DDcc0vhFmF3LSQ7IunC0zPadvvduQgogcxWhEge5aR1r8RbFT%2BPyCCVR5Omx9T7JK7x3QTr9VPqrTmjmHlhh%2FTHqUyIWZszMvE2qCMUK0ZP7oSu00Kyu4EDje6N&X-Amz-Signature=85a527dc79a322a4f2b3408c0f8735b285adb1df05d315f9139c471f32bfe25d&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

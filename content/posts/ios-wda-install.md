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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466VHHH552R%2F20260111%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260111T010353Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEPz%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCSWPT9EdkE%2FrzxqFJ7sesIHrdiiWeyeqOjsQyoEH0oBgIhANLPczeaptygIyroILs2X87cq%2FW7bI8Sduudrajpyfo%2BKogECMX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgyNH8cqGfujqv4J1w8q3AOfC5xlnNk1aW9RMURu8T37EFPOqwNBQKFP0tAgyHGE7vcvx8dy64HIte0u71Y0s%2BYE1HbnYkw39AFCH0y1kvoucpUOmwI98hr3ze1P5DXOThVjV89PmWZiP8HVMuLN9tEbn1AmYmRC%2Fj52nrscN8N5eYphXCRG4GAkSrhoOHRH%2FIIJo3G2XBRhZY88GEQX0iTfMuqGBy7LIn%2Fm2P7Qqbhmx2VTxyvsOPMd6vlAjNr7CwE9ftnboDr7m7v%2BmQYPepYwMCAjMPWqri1MWCn3jFf1SygCW914awGDi%2Bes%2BuuN3iMGiEaK14%2BAcYlAugI3pA0fFEOsT%2F1E%2BrPG31sm52mzaDTvE9I5y7cJIQ2rQf%2BVRBE%2FUTYU1OYjmr7dktM3ikjP2QiqQ3NOOSmyDofVbrSX926zp%2BnTf3W0SH6YViUOX5lU9fI5GIzzqEmGgwPFWgKOzcJwpmowuEVXu5E3LBQoVUWyc5rV6NAFsoZI6dN0V3Vrfp9d6oU2kDIqBpaei56kUT6oYGj6Y9Xn7kgk9Sn8IFv6PtwXER7OrEzV7jikEHFxz%2BTryVR9yEyKaOHXSTGsCWe8Iu1XiWx6kwI2aDIXyPBLEdWO2LsSGW966km0yizBv3dPHagumJysnDCH3orLBjqkAZgt9h2pMBvKB%2B%2B5A3VDkjphLPhmnRF6t8s6RtuXsR%2FtKpfXpwNQrtQjnfhwWHWAa5V72%2Bu28t23SieH03klEwms82XrGZmhYjREI60s%2BkDZOCEZvFxJAR8ZcFzwNAidvSFQnijRT0XSnaIl9YLohLuF9YhE6%2BpiGCjf3NekKEUJ1iop06f2jYEj97%2BDEhNis5XnzMhgVaU%2BuJI8P9DZYmaKQRPk&X-Amz-Signature=15220922eadd46c1f1ab96f3edebad72e432dd675c348fd9722a1a97a3a56305&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466VHHH552R%2F20260111%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260111T010353Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEPz%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCSWPT9EdkE%2FrzxqFJ7sesIHrdiiWeyeqOjsQyoEH0oBgIhANLPczeaptygIyroILs2X87cq%2FW7bI8Sduudrajpyfo%2BKogECMX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgyNH8cqGfujqv4J1w8q3AOfC5xlnNk1aW9RMURu8T37EFPOqwNBQKFP0tAgyHGE7vcvx8dy64HIte0u71Y0s%2BYE1HbnYkw39AFCH0y1kvoucpUOmwI98hr3ze1P5DXOThVjV89PmWZiP8HVMuLN9tEbn1AmYmRC%2Fj52nrscN8N5eYphXCRG4GAkSrhoOHRH%2FIIJo3G2XBRhZY88GEQX0iTfMuqGBy7LIn%2Fm2P7Qqbhmx2VTxyvsOPMd6vlAjNr7CwE9ftnboDr7m7v%2BmQYPepYwMCAjMPWqri1MWCn3jFf1SygCW914awGDi%2Bes%2BuuN3iMGiEaK14%2BAcYlAugI3pA0fFEOsT%2F1E%2BrPG31sm52mzaDTvE9I5y7cJIQ2rQf%2BVRBE%2FUTYU1OYjmr7dktM3ikjP2QiqQ3NOOSmyDofVbrSX926zp%2BnTf3W0SH6YViUOX5lU9fI5GIzzqEmGgwPFWgKOzcJwpmowuEVXu5E3LBQoVUWyc5rV6NAFsoZI6dN0V3Vrfp9d6oU2kDIqBpaei56kUT6oYGj6Y9Xn7kgk9Sn8IFv6PtwXER7OrEzV7jikEHFxz%2BTryVR9yEyKaOHXSTGsCWe8Iu1XiWx6kwI2aDIXyPBLEdWO2LsSGW966km0yizBv3dPHagumJysnDCH3orLBjqkAZgt9h2pMBvKB%2B%2B5A3VDkjphLPhmnRF6t8s6RtuXsR%2FtKpfXpwNQrtQjnfhwWHWAa5V72%2Bu28t23SieH03klEwms82XrGZmhYjREI60s%2BkDZOCEZvFxJAR8ZcFzwNAidvSFQnijRT0XSnaIl9YLohLuF9YhE6%2BpiGCjf3NekKEUJ1iop06f2jYEj97%2BDEhNis5XnzMhgVaU%2BuJI8P9DZYmaKQRPk&X-Amz-Signature=aab5e1fc3138e8b62938f7de582808f210526b84f0c7da46f7dd333b259e2150&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466232GMKT7%2F20260530%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260530T081511Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEBAaCXVzLXdlc3QtMiJGMEQCIFg3%2ByXqhBf2yIVR3j9Uhd%2F1abtI9hw67YGc0p0Z7PwMAiBhTD0M4AZJ7gHeSWbn9Iu5r0Rhx8jlpRbZlntDjnzVqyqIBAjZ%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMFWmA9j3OiaR3QDauKtwDLBIG1%2FgE4TMWpuJQcWZqFMmndI6rJ2yFoH4oe3OQ05BUWTMnR0Vck8L06qjZtrIXVRlxx5Ym51vQhmcMskMDUNe6T5nLc44jCiOR83Ik7meeOYxWO69LYWWDs%2FMY%2FK5FTV71eGucDORAkaXxzNGW2RACn%2Bqc4wQZVNNalmiqfClLE42RPyLDDpcFuMaqFLgnWZ1qtImel1OBrygWCBq6%2FSEO%2FRTTPwlP4%2Fie0BROCKscvdgCxzhmdA371wtUwnX05c24a4beuSi786d6unWy3ivFIerET9%2BtAiGzdbDEm1YZoSNUEpOp0ba7LAQn0m13esam6yUx3oI5XNiU34XuLs4Y%2BPn5sKpN3bofK8joB%2F2ynKSyz13jJeZUQ%2By2fcB8lGtnS7CLLkvygQPAWJHyXh9%2FwxgKF2tIzVOw3V0gk9l6oGO4bcX2XvNakRIKyMPg3MgDA91VViVaP1I39FDFEzxOp1vaCUnR84kdkXuukvWvvqvMIDz%2B%2BNF11Pux0BMMcOH2tu4uzbWl%2B%2BkMLwi3rhA67jxb8b9XuEN1paliaCeAFpUSuOjXS7Uo6JPUcnInbw1ph2CDea9x%2FXlAmtWJkQA%2F1nm7CCrqhX0Kd39JVnEMwCEZPjakquJ7%2FB8wvKzq0AY6pgGdB7PzhHiQaivqHWavX5lfZ6Q7AYGZeh6sIlmUXmQ6X%2BthaBhTY8pFLsk3a0mixLgcvsHECCxF3BZ5HbYhDwO8mejgeUb1A2z0BXVIfxYihibvSeeAJLRDkc1vWBjSYfGzzDl7pe2%2FOEuJmLOz9bv1RBGuM7DWHvIP4T66NkFBaxBnh6ZqZVVNGVc%2B%2FNRxP1QLITYAyv%2By8QlWD7iZg3twkVDRpteX&X-Amz-Signature=e3d1303132882d0aba143a82754d037acff92e3ef9ce29dd3bf0614256b19be8&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466232GMKT7%2F20260530%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260530T081511Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEBAaCXVzLXdlc3QtMiJGMEQCIFg3%2ByXqhBf2yIVR3j9Uhd%2F1abtI9hw67YGc0p0Z7PwMAiBhTD0M4AZJ7gHeSWbn9Iu5r0Rhx8jlpRbZlntDjnzVqyqIBAjZ%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMFWmA9j3OiaR3QDauKtwDLBIG1%2FgE4TMWpuJQcWZqFMmndI6rJ2yFoH4oe3OQ05BUWTMnR0Vck8L06qjZtrIXVRlxx5Ym51vQhmcMskMDUNe6T5nLc44jCiOR83Ik7meeOYxWO69LYWWDs%2FMY%2FK5FTV71eGucDORAkaXxzNGW2RACn%2Bqc4wQZVNNalmiqfClLE42RPyLDDpcFuMaqFLgnWZ1qtImel1OBrygWCBq6%2FSEO%2FRTTPwlP4%2Fie0BROCKscvdgCxzhmdA371wtUwnX05c24a4beuSi786d6unWy3ivFIerET9%2BtAiGzdbDEm1YZoSNUEpOp0ba7LAQn0m13esam6yUx3oI5XNiU34XuLs4Y%2BPn5sKpN3bofK8joB%2F2ynKSyz13jJeZUQ%2By2fcB8lGtnS7CLLkvygQPAWJHyXh9%2FwxgKF2tIzVOw3V0gk9l6oGO4bcX2XvNakRIKyMPg3MgDA91VViVaP1I39FDFEzxOp1vaCUnR84kdkXuukvWvvqvMIDz%2B%2BNF11Pux0BMMcOH2tu4uzbWl%2B%2BkMLwi3rhA67jxb8b9XuEN1paliaCeAFpUSuOjXS7Uo6JPUcnInbw1ph2CDea9x%2FXlAmtWJkQA%2F1nm7CCrqhX0Kd39JVnEMwCEZPjakquJ7%2FB8wvKzq0AY6pgGdB7PzhHiQaivqHWavX5lfZ6Q7AYGZeh6sIlmUXmQ6X%2BthaBhTY8pFLsk3a0mixLgcvsHECCxF3BZ5HbYhDwO8mejgeUb1A2z0BXVIfxYihibvSeeAJLRDkc1vWBjSYfGzzDl7pe2%2FOEuJmLOz9bv1RBGuM7DWHvIP4T66NkFBaxBnh6ZqZVVNGVc%2B%2FNRxP1QLITYAyv%2By8QlWD7iZg3twkVDRpteX&X-Amz-Signature=d4859ed6a8a2ac8cb87f20754036b0aeb1240dd8508c0954ee449770d04230e5&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

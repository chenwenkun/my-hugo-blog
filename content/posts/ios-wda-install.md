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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466WLXA55CX%2F20260207%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260207T062925Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEI7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQDQlrPnu1UF9OVVPexDwIumPmV3Lt35K8JA1F30iThINwIhANZTtyxBMTEyG2fkgqcmLVaKsP0Jkexoz8%2FIGOrpdutvKv8DCFcQABoMNjM3NDIzMTgzODA1IgzUaNhkv%2FDX99Xtuq4q3AMFJ99WfX6ZKeefZ2xD%2BAK2Cethem4KZ%2B7VPgJuKOHMFpzUnzyKrFHGK1sEyfBCLK1FcOedTrc%2BOzpyc9E%2BU0rWudfDEp8OR6l2aESYblwGKQpPieuA%2FTu40w5DtpiC5hfJswHE8WWaTOpTQBySfDxIzdvzJt4IQSM4Xcq1v1gmQWBmW%2FoLlloWnP56rRyGMse%2Fx2gL6%2BX29VXbApHhNPPY3bBfFl0Q8EAqk%2FzN2VPg59YyGuBM%2FUIHllMjdTZJ0uhloISHrZdOALmNcGpuVU3raPhKc%2B641332VKoOWc%2F0EhcBr5kT9UkmcE87%2FUP9X0G1cF0%2F6daYI82LbC%2F6BG2790OWXvmK%2FCmuUL5eRa6%2FekjzaglrlBdCGUiPH1PxFMZtVwwrg%2Fv3tF3ybzPEbMaoXLmfuhx%2BtG9Ny6%2Bt4QT89vVv2QC9vWLixCylHmcQQnIVxqtFhsMMGCgtMw%2BHTsXQwb9UsMgj8J58I4oeLcfc9RlEngZzk2T9OcqlOEoq4Seq4lq8BonydtO7WT%2F%2F%2BtZuUdAb5lkGx3t7K3ByABZ44UiHxrVOTY3Fz0MaIHAPymmXPZADCs2Nk%2BnOpP%2Bdt8Xu84aiiRCJTx6z5vlKciRh0gkjIe8IjceLVSBMQjD2rZvMBjqkAQa%2F%2F63OYo%2FrwQ3aYVBpj2MqD2vnUFHw1YZgGCdKyFAQaWkq69MJo%2FAekRQdzA1Ip1WOZRayO8O8jbksPkjG4pjNFL7wJJ4PFfNzWY9wWcobeEeQT%2BnPw%2FxIQ%2F4J9neTFIMvEGKvHmsiUIEkdV1Aknwver4QKvZXN7WjYtrTcXqylbzH%2Bvb%2FOfgHL1Hvoifk1VVwyIUZUtEtINN14t8A6INlg20I&X-Amz-Signature=c02207d9987018015072e7520afe0710b9215a7e4f2c3dbd1108d8ef45bfad9c&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466WLXA55CX%2F20260207%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260207T062925Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEI7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQDQlrPnu1UF9OVVPexDwIumPmV3Lt35K8JA1F30iThINwIhANZTtyxBMTEyG2fkgqcmLVaKsP0Jkexoz8%2FIGOrpdutvKv8DCFcQABoMNjM3NDIzMTgzODA1IgzUaNhkv%2FDX99Xtuq4q3AMFJ99WfX6ZKeefZ2xD%2BAK2Cethem4KZ%2B7VPgJuKOHMFpzUnzyKrFHGK1sEyfBCLK1FcOedTrc%2BOzpyc9E%2BU0rWudfDEp8OR6l2aESYblwGKQpPieuA%2FTu40w5DtpiC5hfJswHE8WWaTOpTQBySfDxIzdvzJt4IQSM4Xcq1v1gmQWBmW%2FoLlloWnP56rRyGMse%2Fx2gL6%2BX29VXbApHhNPPY3bBfFl0Q8EAqk%2FzN2VPg59YyGuBM%2FUIHllMjdTZJ0uhloISHrZdOALmNcGpuVU3raPhKc%2B641332VKoOWc%2F0EhcBr5kT9UkmcE87%2FUP9X0G1cF0%2F6daYI82LbC%2F6BG2790OWXvmK%2FCmuUL5eRa6%2FekjzaglrlBdCGUiPH1PxFMZtVwwrg%2Fv3tF3ybzPEbMaoXLmfuhx%2BtG9Ny6%2Bt4QT89vVv2QC9vWLixCylHmcQQnIVxqtFhsMMGCgtMw%2BHTsXQwb9UsMgj8J58I4oeLcfc9RlEngZzk2T9OcqlOEoq4Seq4lq8BonydtO7WT%2F%2F%2BtZuUdAb5lkGx3t7K3ByABZ44UiHxrVOTY3Fz0MaIHAPymmXPZADCs2Nk%2BnOpP%2Bdt8Xu84aiiRCJTx6z5vlKciRh0gkjIe8IjceLVSBMQjD2rZvMBjqkAQa%2F%2F63OYo%2FrwQ3aYVBpj2MqD2vnUFHw1YZgGCdKyFAQaWkq69MJo%2FAekRQdzA1Ip1WOZRayO8O8jbksPkjG4pjNFL7wJJ4PFfNzWY9wWcobeEeQT%2BnPw%2FxIQ%2F4J9neTFIMvEGKvHmsiUIEkdV1Aknwver4QKvZXN7WjYtrTcXqylbzH%2Bvb%2FOfgHL1Hvoifk1VVwyIUZUtEtINN14t8A6INlg20I&X-Amz-Signature=b43c4efe17c2b2b239e71b86efe4413ea2e53b0782a7e19758adc80328e2f6e3&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4667KEOKLZL%2F20251123%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251123T061557Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEG0aCXVzLXdlc3QtMiJHMEUCIHKzVK%2FPqUdhRdMjzDcq4R44p8ExoOJwumxGJ2xOyoEvAiEAo52X%2FpFsZBKHbw4CyRpECFFwRBa2252Xp8ybSNEd09Qq%2FwMINhAAGgw2Mzc0MjMxODM4MDUiDNSvk2dyBzaZ89PMwyrcA45XLJj236ghL9epqxDDm8it8yTcKHKcveqsTSFDpnKKAHRnlC7bB%2BynqirXSIco0hXC2GwVGNSdEuBLuButjdQHVME9Ky8hSJHW67MizhRMIMfE6jF4x4PUc6Jn%2FwuR2JhtBmQxmxT6wpUJpc%2F8GgTqXv1Jc4ZO3yjkz1aTm%2Bf7i6A0OH6zX2nOgNIkFVoQSRq8C8pZXeboxfPfttKxcsdxt7B24q32%2FHePRsIfWK01fTIRiO5uAMYBQ8mXpcF1ppe9qpbdje%2Fsrcmyy5y%2F5VoHCXhLxfwo0AOwlslzjLHEoLRPd85lJeZb5oqaK8gzdBiB988yP4c3qCwtbZm4G6HMxyo8jvFwasCl%2Bf%2BF2EEdsMcVsHPO2%2BW%2FoG2eZu6X4ZLbrN5nTq5quki6l6prB6GII%2BLca9alHxj25xmlkym%2BXc3HEEwwdaOOOX1X4CfUCBaWZaL0fOlcIyvo6MnRxRhV1vFNO%2BkwslmMbnn1kmFVkLrNma%2BMdSXWQ0I%2FhxCxeEsyIMDQomUMQACcrkGTKJNv98aIwGvt0mKcHt4%2F5KYkulQE5gO7X9ICbKKXK5lDKLQEOTGM9%2Fj592WukH5uR6fMZ2pcUd7gajQP6C1jlXQC0wEYiBlqbpp2h9I5MN%2BjiskGOqUBgJ3gyN1PEAS50Bd4Vc2AeloANCedU2dB%2Fp3mOC4q0yOG0zUJLWKFw67TeH%2B86mJqPB9PMacCPyWFMFXZOHNjIG17ak32oYKhzIEulnJOfbEjRatEhcrtKyhJJYcB9R1b7DeQ%2Bkdm1qhjDsGMA%2FB1ktQg0Ia4ahetxnaZLnTDqcvB4DJvXnIPtxBBO%2FDFPe0RIx%2F2OChdAm8%2FCpZ84w9DQoXfcOVe&X-Amz-Signature=420f10d2f3e3af52f927259f01b6bd521a874577abbb42bc2a68fce4a790b2aa&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4667KEOKLZL%2F20251123%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251123T061557Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEG0aCXVzLXdlc3QtMiJHMEUCIHKzVK%2FPqUdhRdMjzDcq4R44p8ExoOJwumxGJ2xOyoEvAiEAo52X%2FpFsZBKHbw4CyRpECFFwRBa2252Xp8ybSNEd09Qq%2FwMINhAAGgw2Mzc0MjMxODM4MDUiDNSvk2dyBzaZ89PMwyrcA45XLJj236ghL9epqxDDm8it8yTcKHKcveqsTSFDpnKKAHRnlC7bB%2BynqirXSIco0hXC2GwVGNSdEuBLuButjdQHVME9Ky8hSJHW67MizhRMIMfE6jF4x4PUc6Jn%2FwuR2JhtBmQxmxT6wpUJpc%2F8GgTqXv1Jc4ZO3yjkz1aTm%2Bf7i6A0OH6zX2nOgNIkFVoQSRq8C8pZXeboxfPfttKxcsdxt7B24q32%2FHePRsIfWK01fTIRiO5uAMYBQ8mXpcF1ppe9qpbdje%2Fsrcmyy5y%2F5VoHCXhLxfwo0AOwlslzjLHEoLRPd85lJeZb5oqaK8gzdBiB988yP4c3qCwtbZm4G6HMxyo8jvFwasCl%2Bf%2BF2EEdsMcVsHPO2%2BW%2FoG2eZu6X4ZLbrN5nTq5quki6l6prB6GII%2BLca9alHxj25xmlkym%2BXc3HEEwwdaOOOX1X4CfUCBaWZaL0fOlcIyvo6MnRxRhV1vFNO%2BkwslmMbnn1kmFVkLrNma%2BMdSXWQ0I%2FhxCxeEsyIMDQomUMQACcrkGTKJNv98aIwGvt0mKcHt4%2F5KYkulQE5gO7X9ICbKKXK5lDKLQEOTGM9%2Fj592WukH5uR6fMZ2pcUd7gajQP6C1jlXQC0wEYiBlqbpp2h9I5MN%2BjiskGOqUBgJ3gyN1PEAS50Bd4Vc2AeloANCedU2dB%2Fp3mOC4q0yOG0zUJLWKFw67TeH%2B86mJqPB9PMacCPyWFMFXZOHNjIG17ak32oYKhzIEulnJOfbEjRatEhcrtKyhJJYcB9R1b7DeQ%2Bkdm1qhjDsGMA%2FB1ktQg0Ia4ahetxnaZLnTDqcvB4DJvXnIPtxBBO%2FDFPe0RIx%2F2OChdAm8%2FCpZ84w9DQoXfcOVe&X-Amz-Signature=1048eb3db5191451b2db4e60a3d1db9e018bbabf41240bbd01b1e1c0858081b1&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

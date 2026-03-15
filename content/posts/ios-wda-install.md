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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4664RBYDH6S%2F20260315%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260315T182429Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEPb%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQCLMh4NttkVtdzksGu31fraoAEnni2VFyBxgos6EnPF%2BgIgcXKp3auwQhwVX5%2B1HkrhneD4y5hV2D4ut%2FQPSFNfiYcqiAQIv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDFyK2Y9%2B%2FqfQ%2Bdep5CrcA2fE7lhwd%2BD0rVB%2BIWe5tQ%2F9PoziVoJ%2BinSZeiweIgq7ofRdo77thR56ESPjRX%2FcGyC8gwpCz3nQI5qpOuzJ%2B44iF%2B%2B5pCCQ6iwf1GJ59E3J7eyYN3RGW4ivozCzv0iuXaQM%2FCFadb4Pa6W4hVbmME8B1rNSGtibqDTChebf5ezLs14hLQMzWxCo2UPzNyS%2BqctgBF1VnPqIoUjWplfz1yvEnqIOkdMJ2d1aBsYXttZ%2BZlaMkpsOkRiA9NA3TI6mB7Guznxum8D4aRGucNMXd1stxkxPDORGYRaotQNTpUBz%2FlbiI17RtU%2Bo3msKbJEXFoYY8npYpCxL7q1QGNUFciOQgITJ0YceOD%2Fn3KR6uIE%2FcQ%2FNOHdw4F01sNY5tY%2FfASJV3qa3MnbhizrEsxh3V2GqoC%2FkNf1msl%2FlfDrmXGaFnSFOpFfBx4%2F4oOoe05ye5Eu%2BZ9yKvqOknRuyB0WsdD805y7mRYjik92Zh6bBBQcy3ENkwBlzNhYpPjf584Xy%2FRJyBE62%2BnbhyVyqkSO%2FmjmEUkuSGqWXN0T%2Fr6NxzeW7sdjUZKo%2FKPl0bNeLcFq1Ud3c4kYhDZv%2BGYxdINUjENWT499VTLngtrWo4FSbLgIOx2rn8fky%2BXCE3xLuMOz72s0GOqUBNAlV%2BxfEP1RoHjFzPZMSetVJBNs4Iw1JtcZVIKUKEgwjULbYjb0CXNPhZfk7k4jvMELmUuB0xW2kaHNgAFhgLuaBst5zlg4qL3UljbKDks2fksCX8g5ECjMgenRq5s0WFTGcCsAY0fat0f7E7uouv1j0IzMYFHz6IGgH%2FFDdES5Owv9A2tyvMjgv2TwS461nabFPZ1Nsxvxf6lz5rRDyKBF250y7&X-Amz-Signature=b01516949473b09de35425f58e20897e5df94b8ae741b4da4affcd9d30c3c9c3&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4664RBYDH6S%2F20260315%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260315T182429Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEPb%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQCLMh4NttkVtdzksGu31fraoAEnni2VFyBxgos6EnPF%2BgIgcXKp3auwQhwVX5%2B1HkrhneD4y5hV2D4ut%2FQPSFNfiYcqiAQIv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDFyK2Y9%2B%2FqfQ%2Bdep5CrcA2fE7lhwd%2BD0rVB%2BIWe5tQ%2F9PoziVoJ%2BinSZeiweIgq7ofRdo77thR56ESPjRX%2FcGyC8gwpCz3nQI5qpOuzJ%2B44iF%2B%2B5pCCQ6iwf1GJ59E3J7eyYN3RGW4ivozCzv0iuXaQM%2FCFadb4Pa6W4hVbmME8B1rNSGtibqDTChebf5ezLs14hLQMzWxCo2UPzNyS%2BqctgBF1VnPqIoUjWplfz1yvEnqIOkdMJ2d1aBsYXttZ%2BZlaMkpsOkRiA9NA3TI6mB7Guznxum8D4aRGucNMXd1stxkxPDORGYRaotQNTpUBz%2FlbiI17RtU%2Bo3msKbJEXFoYY8npYpCxL7q1QGNUFciOQgITJ0YceOD%2Fn3KR6uIE%2FcQ%2FNOHdw4F01sNY5tY%2FfASJV3qa3MnbhizrEsxh3V2GqoC%2FkNf1msl%2FlfDrmXGaFnSFOpFfBx4%2F4oOoe05ye5Eu%2BZ9yKvqOknRuyB0WsdD805y7mRYjik92Zh6bBBQcy3ENkwBlzNhYpPjf584Xy%2FRJyBE62%2BnbhyVyqkSO%2FmjmEUkuSGqWXN0T%2Fr6NxzeW7sdjUZKo%2FKPl0bNeLcFq1Ud3c4kYhDZv%2BGYxdINUjENWT499VTLngtrWo4FSbLgIOx2rn8fky%2BXCE3xLuMOz72s0GOqUBNAlV%2BxfEP1RoHjFzPZMSetVJBNs4Iw1JtcZVIKUKEgwjULbYjb0CXNPhZfk7k4jvMELmUuB0xW2kaHNgAFhgLuaBst5zlg4qL3UljbKDks2fksCX8g5ECjMgenRq5s0WFTGcCsAY0fat0f7E7uouv1j0IzMYFHz6IGgH%2FFDdES5Owv9A2tyvMjgv2TwS461nabFPZ1Nsxvxf6lz5rRDyKBF250y7&X-Amz-Signature=f34cd73dc92f362c45dbd9ba7dc64b34d15ac7afdccf8b10ee3ba86565bedf81&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

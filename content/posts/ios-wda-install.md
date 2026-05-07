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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4667UE3TY5R%2F20260507%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260507T081331Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEOf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQDR%2FhkKK28HxusbyIzPvLaUNnVcmu2R80bBwcy12ke1nAIgI%2FvYnUo9cAdxfg56OVEj0lVeHE2rd9UzdKGVzFCmwKIqiAQIsP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDMYl7lwF3f4GjIvN2ircA4NvU55IyoY7BhatPUC8KiGAvmj8NJqoOj%2F6VUwyQ35C5oqq3R1WLZoDn8enVU4ujLTx54btb0ybgzZeG%2Bra0YGQIuuY%2FGFtsKk5m7SmgFxMYeYpv%2BPeabMwZFHR51hyoarvDwryONg5soTjZyWdwLqyU%2FGyZOAHl9zlwk3uSt%2BETYsFdFZmeouJnyYY5iwuQ24%2FEQONOqtOOecvD030P0UFciCxXpucztRD2b25pNN7CIt5G%2FixVqeH01utw5W0Va%2Bnn7udw4a4vcePNNBZ1EMQRi8H7v%2FJQcP0FRuhLNQCsNi3%2Be7uQeSbCHf2aMW3UgjSXtXo1%2BDcy%2BXDkuqrwodNlDkbJaF73pqgqVO0Rb5eWFL203LFKwusy5d6prT4njc2%2FLiJrZvjWTE2hXcX7mIEJacGfXX1flYtp06zHL2Ba2aQeuY4bZRKZvtcVknimwbOFWUhNlSxkkjp7CGxPMHSkvCzwX4lxCP%2BV2eCcDJn4OgPvJv75BCQmZ8lC%2B7JRMJ%2Bwr9vZ6PIjYB0SJ2BOcF4QkNX2qKBLmAm19EHuBuNRk%2FQ3OFoJHtr85W2h%2FcxfFlVHcEt8XioqMLEZ2xBJuD5G37QyINJbv%2FeQIGw97vPRocDCtkYnjQSaaAIMNvj8M8GOqUBeEgz3YXLdCJy9X5N1sjV%2BYtAdFg4NJtlMfHT3YRv1IyCtqZaxWfttiJHT%2BO3f4kIYr805z8rpdtB%2FYaNNNEN5aWlVstwRB8xk4UObM1dyr5j9aRBUe1Ayg7OG7n3AFeB1voEUhL0HJpP2hJUKVEsi1DPlHllZyBfo%2BlJeahZ%2BDj1jeE8j8nWRR4NemF6cxYKJICurle%2FikNfGF5wpZtR9fDQd3bA&X-Amz-Signature=f03b7ea40cc5c13049469c548be1f8d5e3938d10815e238ce1ec18ad439218cc&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4667UE3TY5R%2F20260507%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260507T081331Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEOf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQDR%2FhkKK28HxusbyIzPvLaUNnVcmu2R80bBwcy12ke1nAIgI%2FvYnUo9cAdxfg56OVEj0lVeHE2rd9UzdKGVzFCmwKIqiAQIsP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDMYl7lwF3f4GjIvN2ircA4NvU55IyoY7BhatPUC8KiGAvmj8NJqoOj%2F6VUwyQ35C5oqq3R1WLZoDn8enVU4ujLTx54btb0ybgzZeG%2Bra0YGQIuuY%2FGFtsKk5m7SmgFxMYeYpv%2BPeabMwZFHR51hyoarvDwryONg5soTjZyWdwLqyU%2FGyZOAHl9zlwk3uSt%2BETYsFdFZmeouJnyYY5iwuQ24%2FEQONOqtOOecvD030P0UFciCxXpucztRD2b25pNN7CIt5G%2FixVqeH01utw5W0Va%2Bnn7udw4a4vcePNNBZ1EMQRi8H7v%2FJQcP0FRuhLNQCsNi3%2Be7uQeSbCHf2aMW3UgjSXtXo1%2BDcy%2BXDkuqrwodNlDkbJaF73pqgqVO0Rb5eWFL203LFKwusy5d6prT4njc2%2FLiJrZvjWTE2hXcX7mIEJacGfXX1flYtp06zHL2Ba2aQeuY4bZRKZvtcVknimwbOFWUhNlSxkkjp7CGxPMHSkvCzwX4lxCP%2BV2eCcDJn4OgPvJv75BCQmZ8lC%2B7JRMJ%2Bwr9vZ6PIjYB0SJ2BOcF4QkNX2qKBLmAm19EHuBuNRk%2FQ3OFoJHtr85W2h%2FcxfFlVHcEt8XioqMLEZ2xBJuD5G37QyINJbv%2FeQIGw97vPRocDCtkYnjQSaaAIMNvj8M8GOqUBeEgz3YXLdCJy9X5N1sjV%2BYtAdFg4NJtlMfHT3YRv1IyCtqZaxWfttiJHT%2BO3f4kIYr805z8rpdtB%2FYaNNNEN5aWlVstwRB8xk4UObM1dyr5j9aRBUe1Ayg7OG7n3AFeB1voEUhL0HJpP2hJUKVEsi1DPlHllZyBfo%2BlJeahZ%2BDj1jeE8j8nWRR4NemF6cxYKJICurle%2FikNfGF5wpZtR9fDQd3bA&X-Amz-Signature=2dfd02d9a98e8da9a02f28830ecd17613c2e6cc494fcf1f7b4fb1b9808a1d26d&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

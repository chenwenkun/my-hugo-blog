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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4667W7JCIA7%2F20260715%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260715T011946Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEFgaCXVzLXdlc3QtMiJHMEUCIQDt1DG6d4nCmo%2BCwv1dZTrbHsB5gi1lhKpl%2BAqcvxIGYAIgf3GGSaf3veoJhbVoD7K7PQlzlADzNsS2NKyTMo1mb3gq%2FwMIIBAAGgw2Mzc0MjMxODM4MDUiDLIYybUZJ3X1GPcHeCrcA%2BR1JKsr%2BMGpgiMTnz4hwmqIXoiywBk8834rTu9QceMvcAcZCKLkD1Sqo0t4ucSgbrtNTA7NachTIqoNl%2BMEfBFJpcvO2zm91C95pyglq8RFEQonpfnRYPvrHzS%2BNjKyIZyzyR9cMZkPB4FNsk70M0wegDrDtLFyi4gjvHezxmI2%2BGIFB9CLrkLoCsAfwKyhMsdsaHZpojtWcD7%2F%2FzMLlNHhc7jdcEYuMDyjLdnd9ojVtiCbYB3YyePNHPa1XI9CaSl96pDY5lD0t1JwNaFO4%2FAVnp3SXRSjKIIywC3bui8RoDb3GC1hh4VKQP6nJNYjT4ukDEtGT4DMu7sZvKqA9GYJTwDAf4hBV2oJh6OM6I%2BnrBOqFMYs3QO9TwApNOl0SW6%2FnCo%2FvNEuoKXtzMVjMeE0JG%2Ftanp6yd6fM1wMTmCCT0UGM%2B5WPjl%2B6p7zFqy8qAylPO0y8FDTsD6jEKrP1%2Ftmji11iZiqQyrWHt523OIbfqfbd%2B6b%2FClImQGiS3A2Z5xzXsbke%2BUgCQC5AW9so4Fshg%2BuMTGWAa3a5WEqNuGiBZOL7ctFwUD55GrzQ7cWSGd4k%2BlOR1DJuYPmhA%2FC%2B93dKF7ClHFZgeiB8uxQ71k2U1z%2FXgMenzL2hL4uMNiH29IGOqUBecIbSJ80hXc9RkUDT9P1vepnTUeFpvw2etuXdPWbTfhyiEutd5Okp9uHATA5gq5kJufw4Nc4HTrUlIq4cdO%2FRhtfavEHKK2hkEoug3hMNgZg6yD3MZQmXIyLDgx%2B8Y9qnC1JWJMwKYeMnKD4EjC0jz1mKRza9B8rtSIntnVm8aHN44s%2FwencjLk0y3ydT7Xy3LARNH8cjCvqBi0oi5%2BSgSIF%2BB6S&X-Amz-Signature=56219c31cf68678f0517c90af1c44d94adc7dc15f85f3be24ea456f8451e2b22&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4667W7JCIA7%2F20260715%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260715T011946Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEFgaCXVzLXdlc3QtMiJHMEUCIQDt1DG6d4nCmo%2BCwv1dZTrbHsB5gi1lhKpl%2BAqcvxIGYAIgf3GGSaf3veoJhbVoD7K7PQlzlADzNsS2NKyTMo1mb3gq%2FwMIIBAAGgw2Mzc0MjMxODM4MDUiDLIYybUZJ3X1GPcHeCrcA%2BR1JKsr%2BMGpgiMTnz4hwmqIXoiywBk8834rTu9QceMvcAcZCKLkD1Sqo0t4ucSgbrtNTA7NachTIqoNl%2BMEfBFJpcvO2zm91C95pyglq8RFEQonpfnRYPvrHzS%2BNjKyIZyzyR9cMZkPB4FNsk70M0wegDrDtLFyi4gjvHezxmI2%2BGIFB9CLrkLoCsAfwKyhMsdsaHZpojtWcD7%2F%2FzMLlNHhc7jdcEYuMDyjLdnd9ojVtiCbYB3YyePNHPa1XI9CaSl96pDY5lD0t1JwNaFO4%2FAVnp3SXRSjKIIywC3bui8RoDb3GC1hh4VKQP6nJNYjT4ukDEtGT4DMu7sZvKqA9GYJTwDAf4hBV2oJh6OM6I%2BnrBOqFMYs3QO9TwApNOl0SW6%2FnCo%2FvNEuoKXtzMVjMeE0JG%2Ftanp6yd6fM1wMTmCCT0UGM%2B5WPjl%2B6p7zFqy8qAylPO0y8FDTsD6jEKrP1%2Ftmji11iZiqQyrWHt523OIbfqfbd%2B6b%2FClImQGiS3A2Z5xzXsbke%2BUgCQC5AW9so4Fshg%2BuMTGWAa3a5WEqNuGiBZOL7ctFwUD55GrzQ7cWSGd4k%2BlOR1DJuYPmhA%2FC%2B93dKF7ClHFZgeiB8uxQ71k2U1z%2FXgMenzL2hL4uMNiH29IGOqUBecIbSJ80hXc9RkUDT9P1vepnTUeFpvw2etuXdPWbTfhyiEutd5Okp9uHATA5gq5kJufw4Nc4HTrUlIq4cdO%2FRhtfavEHKK2hkEoug3hMNgZg6yD3MZQmXIyLDgx%2B8Y9qnC1JWJMwKYeMnKD4EjC0jz1mKRza9B8rtSIntnVm8aHN44s%2FwencjLk0y3ydT7Xy3LARNH8cjCvqBi0oi5%2BSgSIF%2BB6S&X-Amz-Signature=8728687fd43d73b91ba59e8e79c60fb2258357fdcdc42cb4c1d6eff42c0b3f82&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

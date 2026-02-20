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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466UEWDDCCI%2F20260220%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260220T064125Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEMT%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIAgAdD2MyWdQtYUzrm0jO%2B6dc9SkovyaXekU9qZx58QqAiEA4xcm6dxVPKkQXRY3S8DGGsVBg%2FarRSrLZUIfDcUwLiQqiAQIjf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDFJSBa%2Fjdk5%2BM06aQircA2yC%2FurP1DsgCeZTRACae4qClvQmJN92MlDZ5v9yoJ2zHDBYBTOGya4IoFlkUOl8aUZySW9Qb0fOeBuBPBkqZ5OpKaxXuYAeJvIFe5G1CAKGFA2xoxx5gUUvudoNUUM4fT0J%2FzLkphpc2JQwA7xhWuBKj6KYi18yrz41dT1QV5mPnjQh7vhxk%2F1iXWSj8%2FPPp6uHWUN%2F5Z%2FTHAd6gi%2BBHXOWOtMu7pIHJfuogPPdtR2xRfOkhId6i6VBXr%2BGpffDSafdgt4sU0MZG9mMqXnPHmVnuBpl1mfmXe4b9vVz%2BgM2pXur47D7dvCPdmA%2FIOBvb%2BK%2BPQW%2BB%2FHEGJM%2FijI2gR4%2BEgFQlcNDuim%2B0FMroARTJBdoVlx8nBJITDemFLm04gK6glRo%2B%2F8uZxSqHuOM3gVU%2FYtN6HZWhgYrp2%2BjGOvp3UDvJW%2F7Lnwdvh%2BIOPCE4%2BKE2msNlXHeM%2BXRRFyiqUw52i%2BLNwaur2T%2BhZJR7fo0eNEqNFIM178pNORbuQvpIuSYxZcgpTc5cuJyGZgbO6BF%2Fob%2BOv78nKuvnJIPKvqnxRke7VsTdroKTHoACk9F0aw1wE%2FZpTvAGOCv8CEnQ4Ptji9cIL3OVzd2qkM21YByGl8tT1yfLLGJwSp9MP6338wGOqUBasABhiS4UyssI2AXwT8t7bSKVZNrNWIFMBHfjcR3B5LrruKc6ip1biRqU98rZcdtKfH9%2FEe%2BFOkHXIRXTRwndtWMTpdHEzBKvrXU75XM%2F7sH3FtOOj%2FKIdd9EgSmDNMHxrZnjVmIBx4tnA0TIm6b5vWqZAKv8onH8USoOu3pg%2F5My5Z8%2FmtSu%2FiHg9vag034Ye96USyEtdyUzP1To3kz4%2Ftl0XDJ&X-Amz-Signature=1397511f2b2d1fbd2460d52a82d89107d93dcea7b114127cd9e75cf821d4ae52&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466UEWDDCCI%2F20260220%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260220T064125Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEMT%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIAgAdD2MyWdQtYUzrm0jO%2B6dc9SkovyaXekU9qZx58QqAiEA4xcm6dxVPKkQXRY3S8DGGsVBg%2FarRSrLZUIfDcUwLiQqiAQIjf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDFJSBa%2Fjdk5%2BM06aQircA2yC%2FurP1DsgCeZTRACae4qClvQmJN92MlDZ5v9yoJ2zHDBYBTOGya4IoFlkUOl8aUZySW9Qb0fOeBuBPBkqZ5OpKaxXuYAeJvIFe5G1CAKGFA2xoxx5gUUvudoNUUM4fT0J%2FzLkphpc2JQwA7xhWuBKj6KYi18yrz41dT1QV5mPnjQh7vhxk%2F1iXWSj8%2FPPp6uHWUN%2F5Z%2FTHAd6gi%2BBHXOWOtMu7pIHJfuogPPdtR2xRfOkhId6i6VBXr%2BGpffDSafdgt4sU0MZG9mMqXnPHmVnuBpl1mfmXe4b9vVz%2BgM2pXur47D7dvCPdmA%2FIOBvb%2BK%2BPQW%2BB%2FHEGJM%2FijI2gR4%2BEgFQlcNDuim%2B0FMroARTJBdoVlx8nBJITDemFLm04gK6glRo%2B%2F8uZxSqHuOM3gVU%2FYtN6HZWhgYrp2%2BjGOvp3UDvJW%2F7Lnwdvh%2BIOPCE4%2BKE2msNlXHeM%2BXRRFyiqUw52i%2BLNwaur2T%2BhZJR7fo0eNEqNFIM178pNORbuQvpIuSYxZcgpTc5cuJyGZgbO6BF%2Fob%2BOv78nKuvnJIPKvqnxRke7VsTdroKTHoACk9F0aw1wE%2FZpTvAGOCv8CEnQ4Ptji9cIL3OVzd2qkM21YByGl8tT1yfLLGJwSp9MP6338wGOqUBasABhiS4UyssI2AXwT8t7bSKVZNrNWIFMBHfjcR3B5LrruKc6ip1biRqU98rZcdtKfH9%2FEe%2BFOkHXIRXTRwndtWMTpdHEzBKvrXU75XM%2F7sH3FtOOj%2FKIdd9EgSmDNMHxrZnjVmIBx4tnA0TIm6b5vWqZAKv8onH8USoOu3pg%2F5My5Z8%2FmtSu%2FiHg9vag034Ye96USyEtdyUzP1To3kz4%2Ftl0XDJ&X-Amz-Signature=b93fac0b7605b3c1bfa21a794d20038bcd6b337aef0293f59f0a3f562aa48876&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

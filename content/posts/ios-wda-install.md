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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466ZPO2W7CW%2F20260612%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260612T195118Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEFIaCXVzLXdlc3QtMiJIMEYCIQCbGiZ66R0C7kIETC%2BUS4oNU9lNWNLN5rAETHRAybDUxwIhAPsaKFV7O4RsZWhojReK9vW4YB6WnnCwgrgS1%2Bp9A%2B1AKv8DCBsQABoMNjM3NDIzMTgzODA1IgyIPYCp1OPMdbP2gP8q3AORolqTcSKn9COYjhjqPbxpViqmxMmujYeCSyd22EXv1hXlKFUtzKXKXiy9XlIudGMwl3G4YmslXZP9ag4%2B%2FIPGDWRpkJTb9EikbTWXk1G1WOPEm7F3RAa2cCLs6KZBA0%2BOdPcRqj9yItBY9cHp9Skkx0DLd3LphhFGbpm9xmT0mpHM7wUpzllI%2FB7%2F11AJpS%2FcvhuWgRVglWVDfQh%2F6vVyw0fQqL4IkzrT8nWe36XctB84A7mRBzZ2GSoCEdGTJb1EvRiT9%2FeZRn13EgNrPstePHx4UfypD%2FYgaKqIJJxBqgWcOeLBap4TqsqiqCMmFjR%2FFPpWTcR2PkbUWJ01oetCPvNO%2FNfIdoHOXMSvsKsd2ppYa4TxTTHvSmy8te4F5v1qLVRndCb2nk5SLw7RTgtlT7MhfeuyMWWcu6kQ4i4gpzx%2BxMS6A%2FxDPlD2WyiMP4473A3kvXx0OkiRphsCx%2BFCObQS80EMefbhKC4%2FpNhEE%2FqEVgkd89IqpDucmbzAIJUOzvdgaLTB%2BXgsyY93JzyEFJCYZQm1UNjbTlkz2sKgXGezxEveT5qktEw9AzgK7AcoOhxVDYg7dI%2B88EIYzHblf%2FD9FDo%2BR6Rtne491uejz37wOf8Ms5S%2BiAza2jDFlLHRBjqkAVIPdXwUrPOEnUOrqsaDCPvp0JQQbpYXnnvkr6d%2Fjn%2F0I3sknCdM0giRjUeicyNYypLh5Mn%2FnDvM1FesvzOGT%2FBhCveKDa8NmT0uzj%2BrStSI9ALXAhXKK9nkL%2FQ%2FGsG6YRHLjqTpMpebLZS0rB%2BuEJkVRy6TLo4%2FqK4oJTWXtoiG744dWUPQGLoD7ArLCbZDLxl5JAU18PfGsZbKQ%2F0uZEWyb3dG&X-Amz-Signature=60bb81e9e263b708e6a3af4d7cced1d0fed4a6da451315cc93ada3989cf618b2&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466ZPO2W7CW%2F20260612%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260612T195118Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEFIaCXVzLXdlc3QtMiJIMEYCIQCbGiZ66R0C7kIETC%2BUS4oNU9lNWNLN5rAETHRAybDUxwIhAPsaKFV7O4RsZWhojReK9vW4YB6WnnCwgrgS1%2Bp9A%2B1AKv8DCBsQABoMNjM3NDIzMTgzODA1IgyIPYCp1OPMdbP2gP8q3AORolqTcSKn9COYjhjqPbxpViqmxMmujYeCSyd22EXv1hXlKFUtzKXKXiy9XlIudGMwl3G4YmslXZP9ag4%2B%2FIPGDWRpkJTb9EikbTWXk1G1WOPEm7F3RAa2cCLs6KZBA0%2BOdPcRqj9yItBY9cHp9Skkx0DLd3LphhFGbpm9xmT0mpHM7wUpzllI%2FB7%2F11AJpS%2FcvhuWgRVglWVDfQh%2F6vVyw0fQqL4IkzrT8nWe36XctB84A7mRBzZ2GSoCEdGTJb1EvRiT9%2FeZRn13EgNrPstePHx4UfypD%2FYgaKqIJJxBqgWcOeLBap4TqsqiqCMmFjR%2FFPpWTcR2PkbUWJ01oetCPvNO%2FNfIdoHOXMSvsKsd2ppYa4TxTTHvSmy8te4F5v1qLVRndCb2nk5SLw7RTgtlT7MhfeuyMWWcu6kQ4i4gpzx%2BxMS6A%2FxDPlD2WyiMP4473A3kvXx0OkiRphsCx%2BFCObQS80EMefbhKC4%2FpNhEE%2FqEVgkd89IqpDucmbzAIJUOzvdgaLTB%2BXgsyY93JzyEFJCYZQm1UNjbTlkz2sKgXGezxEveT5qktEw9AzgK7AcoOhxVDYg7dI%2B88EIYzHblf%2FD9FDo%2BR6Rtne491uejz37wOf8Ms5S%2BiAza2jDFlLHRBjqkAVIPdXwUrPOEnUOrqsaDCPvp0JQQbpYXnnvkr6d%2Fjn%2F0I3sknCdM0giRjUeicyNYypLh5Mn%2FnDvM1FesvzOGT%2FBhCveKDa8NmT0uzj%2BrStSI9ALXAhXKK9nkL%2FQ%2FGsG6YRHLjqTpMpebLZS0rB%2BuEJkVRy6TLo4%2FqK4oJTWXtoiG744dWUPQGLoD7ArLCbZDLxl5JAU18PfGsZbKQ%2F0uZEWyb3dG&X-Amz-Signature=90e3f8ca92b6d7447363105bd201480679df9b5ca677435f554582898c6bde65&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

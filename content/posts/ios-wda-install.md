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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466ZPQ63QKB%2F20260327%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260327T123857Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEBQaCXVzLXdlc3QtMiJIMEYCIQCVKHmQafyz%2FKuUVBflyUJqW7EPNITBWx%2Fl6km2vaj7LwIhAIN%2BOx3FbV3wv4YYGo9dJ3hgxcizG4v2SJHwpJUIrzlGKogECN3%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgzHiAQHIqcGsa7YPsUq3APFnYHF0WNheVZ6BxKoIVxKkYCM9pTgqJB9LIHnnJ%2F7dI%2FF1uPMMWKg6Ec8S%2BFlm1GUkxj5K%2Fr2CEvTwUWsmjksaOV3TwCmAD%2BQuqCO%2B5j45jqP5UUYO40hYpNfj3P%2Bmc%2BWbIoNWf2SB542Rm9AO4QTeaaFTv5FtIvVSQL9D35I7X6fDsGxq9whbz2FFJ41Jlt6UGcMvpynxmyX07b%2Fjqy2xhOIbi8O8fq5UKC0Fe%2F1NfUHtFiuKo7lZVne8bBHqAg%2Bx4PFZ4xDFfBOyaYtbJIwlLDZGN9Oy8soi6PGSlTmroXjGlQcjJBwba5dgY2kCKavyW6%2FNdBbHJnHDYxMLtlg0DIqVehkEGmO3kji0xDP04XDineBHjKQas9aXl5DE5UW9pqv7KZ9JPUizI9Ng8U%2FLcSAT%2FZzOWzWEKpDrp%2BYRg2NXU5%2F31Z6B%2FQe4qgTNY3cTawjFc6mQu4na1Y0n1ELkUjjeeNtRG53WwigaHr9B1YqOPK8UUbuB%2FHf6Irifmb9ztobPc8u%2BIaVCFssWPWnku6DivJ2gi0iOh%2FfCbLibZffF5yIz9BlTTaKwM1sUscE4SfSyCp17RdGWRYrROL8c55znBWz10RsZAQbvbZHQr2Sv%2Btb9oE4jFfkrTDx2pnOBjqkAc97UBtc2OtLoGBRqSfT9fvzJVBNWRUxZ4r%2B81AXbzW7c5ejLG%2FKvYdXKaxSvJ8oFk2EAB0qRwVojnlmcMDAITWG4y3hlq2%2FK0UwChWk5X4LDs%2BTb516vIeXFLeeKSEWwTmy3DDAhKWACT30EVPRkURTgnrp4Ff0dwVD1werS6ByiIzCmWqWciwfkkoqJ8O5ZVM8ZELdcUHxNT72NU41tG5s9Yjh&X-Amz-Signature=8aa15cba0e6580e277e0cc5dfd492f0ebf490750e4094423202dbd098bd5ae96&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466ZPQ63QKB%2F20260327%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260327T123857Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEBQaCXVzLXdlc3QtMiJIMEYCIQCVKHmQafyz%2FKuUVBflyUJqW7EPNITBWx%2Fl6km2vaj7LwIhAIN%2BOx3FbV3wv4YYGo9dJ3hgxcizG4v2SJHwpJUIrzlGKogECN3%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgzHiAQHIqcGsa7YPsUq3APFnYHF0WNheVZ6BxKoIVxKkYCM9pTgqJB9LIHnnJ%2F7dI%2FF1uPMMWKg6Ec8S%2BFlm1GUkxj5K%2Fr2CEvTwUWsmjksaOV3TwCmAD%2BQuqCO%2B5j45jqP5UUYO40hYpNfj3P%2Bmc%2BWbIoNWf2SB542Rm9AO4QTeaaFTv5FtIvVSQL9D35I7X6fDsGxq9whbz2FFJ41Jlt6UGcMvpynxmyX07b%2Fjqy2xhOIbi8O8fq5UKC0Fe%2F1NfUHtFiuKo7lZVne8bBHqAg%2Bx4PFZ4xDFfBOyaYtbJIwlLDZGN9Oy8soi6PGSlTmroXjGlQcjJBwba5dgY2kCKavyW6%2FNdBbHJnHDYxMLtlg0DIqVehkEGmO3kji0xDP04XDineBHjKQas9aXl5DE5UW9pqv7KZ9JPUizI9Ng8U%2FLcSAT%2FZzOWzWEKpDrp%2BYRg2NXU5%2F31Z6B%2FQe4qgTNY3cTawjFc6mQu4na1Y0n1ELkUjjeeNtRG53WwigaHr9B1YqOPK8UUbuB%2FHf6Irifmb9ztobPc8u%2BIaVCFssWPWnku6DivJ2gi0iOh%2FfCbLibZffF5yIz9BlTTaKwM1sUscE4SfSyCp17RdGWRYrROL8c55znBWz10RsZAQbvbZHQr2Sv%2Btb9oE4jFfkrTDx2pnOBjqkAc97UBtc2OtLoGBRqSfT9fvzJVBNWRUxZ4r%2B81AXbzW7c5ejLG%2FKvYdXKaxSvJ8oFk2EAB0qRwVojnlmcMDAITWG4y3hlq2%2FK0UwChWk5X4LDs%2BTb516vIeXFLeeKSEWwTmy3DDAhKWACT30EVPRkURTgnrp4Ff0dwVD1werS6ByiIzCmWqWciwfkkoqJ8O5ZVM8ZELdcUHxNT72NU41tG5s9Yjh&X-Amz-Signature=1fd31045529e19c819c719d33d587c368ca83fd5c9b4c6f7c9d1604692d2039a&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

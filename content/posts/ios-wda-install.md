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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466R25RTLT4%2F20260625%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260625T021059Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEHgaCXVzLXdlc3QtMiJIMEYCIQDGcrrgfcwq91A6X0L8dR5rE2Iq7FWOZIqzvlKGfADB%2FAIhAKeHbd6KONTojU9ROAHj%2BlGWAxpDxqHNXPd8yUC9%2By4GKv8DCEEQABoMNjM3NDIzMTgzODA1Igxf3sR3laR4bfFkNfUq3APImhKpJB2gQYdatOMxtir7Y1Ez1lTzFP3bmS1UZkak395la8L09VB2U%2BbsJJFBwzJCVV%2F%2BHD1lw7YTGedYPNzBa5ML02Qj8yl45lya5QTPkcQX9JidxZyL%2Fv7uLl7FTyXWTe4wnqYeh1ZfhQCTnmD5J%2FORJlft1qjSzUBEtsfJikSeqc%2BRYnDH5DkBxgXMvHWNOFw%2BXylBPc%2FuDvmO3j0D9PEtnhbpbMbjehlAau2yMu149HRdX%2FuUhQ8PqgxJLd651yGS1gI4wgnH4saa8ZmqtLzTxKxy3OHPuvOaFm9bAb99U1qC486aJ%2FnfE27qP7wA4KgdXEo5ng9Ka8G4rhIsG%2BTE72Zzpsu2Hqh41GZSMtc6sY6bNEzULk75iC2h3waj6dZKYlYP%2B4%2B7JsMB6frdxydqKmj1CO4dEawS9F3WCtrucFwXBGG5YK7Q3UzjY7OEAJQp18jw7oim1jXusyadcxSf5nqMfWtrJbz7XvszeQVuuwLXI6cAiky5S6wn%2BK7xaAM9XOrCyo69mf3aMQp2l0df9bc1HGoigI0GZS%2Fhf2vxPkAmkrSZYbL50BFKQbWCU13NohP55nb0HqbCqhn%2FGjWxT6TLtvZYB%2FPfHt4MhbW6uZBjd9Ah6b1sEDC11fHRBjqkAYUTpzkYBVCOIx9ejdeeyX6SRRYS7f0FpUVwfeLV5OsL021kQhIieQ2jiA5EmLk7jv6hl8PflE2qCk%2BGQzycE3SlwJNUkgkNEhyPBiciAHedkO7I76HonptMmqEP2hrlLr5x7jaNmtU2TE6FiYhUvg8%2BIxO5DLv4M7gl%2FfIEXlu5Jw9kXGSdvSKu3vOFfmi4aJBxdH41WrVaRjBYrRiNt2dl39W6&X-Amz-Signature=d30b4d62d84b90551b17451428c57210f65631a84f502d75651c5fe47c9e1d1b&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466R25RTLT4%2F20260625%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260625T021059Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEHgaCXVzLXdlc3QtMiJIMEYCIQDGcrrgfcwq91A6X0L8dR5rE2Iq7FWOZIqzvlKGfADB%2FAIhAKeHbd6KONTojU9ROAHj%2BlGWAxpDxqHNXPd8yUC9%2By4GKv8DCEEQABoMNjM3NDIzMTgzODA1Igxf3sR3laR4bfFkNfUq3APImhKpJB2gQYdatOMxtir7Y1Ez1lTzFP3bmS1UZkak395la8L09VB2U%2BbsJJFBwzJCVV%2F%2BHD1lw7YTGedYPNzBa5ML02Qj8yl45lya5QTPkcQX9JidxZyL%2Fv7uLl7FTyXWTe4wnqYeh1ZfhQCTnmD5J%2FORJlft1qjSzUBEtsfJikSeqc%2BRYnDH5DkBxgXMvHWNOFw%2BXylBPc%2FuDvmO3j0D9PEtnhbpbMbjehlAau2yMu149HRdX%2FuUhQ8PqgxJLd651yGS1gI4wgnH4saa8ZmqtLzTxKxy3OHPuvOaFm9bAb99U1qC486aJ%2FnfE27qP7wA4KgdXEo5ng9Ka8G4rhIsG%2BTE72Zzpsu2Hqh41GZSMtc6sY6bNEzULk75iC2h3waj6dZKYlYP%2B4%2B7JsMB6frdxydqKmj1CO4dEawS9F3WCtrucFwXBGG5YK7Q3UzjY7OEAJQp18jw7oim1jXusyadcxSf5nqMfWtrJbz7XvszeQVuuwLXI6cAiky5S6wn%2BK7xaAM9XOrCyo69mf3aMQp2l0df9bc1HGoigI0GZS%2Fhf2vxPkAmkrSZYbL50BFKQbWCU13NohP55nb0HqbCqhn%2FGjWxT6TLtvZYB%2FPfHt4MhbW6uZBjd9Ah6b1sEDC11fHRBjqkAYUTpzkYBVCOIx9ejdeeyX6SRRYS7f0FpUVwfeLV5OsL021kQhIieQ2jiA5EmLk7jv6hl8PflE2qCk%2BGQzycE3SlwJNUkgkNEhyPBiciAHedkO7I76HonptMmqEP2hrlLr5x7jaNmtU2TE6FiYhUvg8%2BIxO5DLv4M7gl%2FfIEXlu5Jw9kXGSdvSKu3vOFfmi4aJBxdH41WrVaRjBYrRiNt2dl39W6&X-Amz-Signature=14820645add6454c020d874b8502ca398c63a16423b3133134d562a9431de088&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

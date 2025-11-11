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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466RSKQVBKT%2F20251111%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251111T181540Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEFoaCXVzLXdlc3QtMiJIMEYCIQC2emjpP79Hj%2FGixfUCjvVCbEDheu9G2gfIDppgoRt3dAIhAKQIRDQDgJLrCiRs3D1JE%2B%2BRLpRDHsbKFytgSpAC0o0wKv8DCCMQABoMNjM3NDIzMTgzODA1Igw7P%2BFVbxuASUtQa0Iq3AMqs8stl8iRV4zt1AXoSe2b3wWmqqz13208%2BXHI1LEf7N%2B7cHdQlsagUiZpVDJ35qTF0FKierHdoWK6r8POmp3clwCp18tdKZyns3Gn3hA6h4GEvhngKBEbuQrfuGSOGGyQN2iJoEgC%2BgG8Bb2geLyjUCb1jxNUiSGJ%2BHaUlAEUH0qovmO4EEnu1iJYqbuy9AmOIAeHNXqpXQD4k2mpOeAWGrjniQde0PoYPQWWE%2FbW7v7mXZ6fVmbIt%2Fy6R4FI0D2Yv6RQ73XjMuzRlslkQyadpxf8L4yN825VN6Xtu0ah0wweFOs049tjtvpHlRPLWY%2ByoVOcim60qEThYCZZ8QEzU7uDy68iOzWkRG3CzaoVqjhk2pK3uelFfcwt93UoY9%2Bh4WLI7A%2FFC5n%2FF6tqg9hDL3azACBHxE9pTGnl9gOnTKcmcN3RjNiXZ7BzKIuwvhszovKku8yPnWYfo%2FmRsDk1GE9EaYAmbK2%2BAA0WSqYOD2R%2BFasDIPIyOAhGF2wdAM0pC0lXmVdalHCxM8itSLxRGFknIksvMHoVcQA0dXRlG60NUuWj8Imhwd99uhpgcTxhvYONySsAqoOyG5W6pU0RfF%2BmCtlr4oX5yB3H5OUhti%2Fyu8njn9rBOkIe8jCB883IBjqkAenJqVQaNE0Nianmj%2FeIEiF6l3Fb2jercmZD%2F9Q6Or3bkLGq%2BCscIhXmYWOiwSvcfbjVAy24yewkIXj3JUZkDZ4T3N4bOhPWZTpQXNkI8EytMoJj%2BBK%2FFYWTj%2FMKgyqyR4PzR%2BwJka5OMTaqp7My8TmOwij5Km%2B%2B5ojWimddXyMtb13SNc3i2QX1QXGpnnz5jeYKBI%2FZfwsoO0qGVF0rPEEGXJWV&X-Amz-Signature=60ec8654a9dbf566c266aa4cb66286f0cc2364fe052323a17f784478cc2754d8&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466RSKQVBKT%2F20251111%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251111T181540Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEFoaCXVzLXdlc3QtMiJIMEYCIQC2emjpP79Hj%2FGixfUCjvVCbEDheu9G2gfIDppgoRt3dAIhAKQIRDQDgJLrCiRs3D1JE%2B%2BRLpRDHsbKFytgSpAC0o0wKv8DCCMQABoMNjM3NDIzMTgzODA1Igw7P%2BFVbxuASUtQa0Iq3AMqs8stl8iRV4zt1AXoSe2b3wWmqqz13208%2BXHI1LEf7N%2B7cHdQlsagUiZpVDJ35qTF0FKierHdoWK6r8POmp3clwCp18tdKZyns3Gn3hA6h4GEvhngKBEbuQrfuGSOGGyQN2iJoEgC%2BgG8Bb2geLyjUCb1jxNUiSGJ%2BHaUlAEUH0qovmO4EEnu1iJYqbuy9AmOIAeHNXqpXQD4k2mpOeAWGrjniQde0PoYPQWWE%2FbW7v7mXZ6fVmbIt%2Fy6R4FI0D2Yv6RQ73XjMuzRlslkQyadpxf8L4yN825VN6Xtu0ah0wweFOs049tjtvpHlRPLWY%2ByoVOcim60qEThYCZZ8QEzU7uDy68iOzWkRG3CzaoVqjhk2pK3uelFfcwt93UoY9%2Bh4WLI7A%2FFC5n%2FF6tqg9hDL3azACBHxE9pTGnl9gOnTKcmcN3RjNiXZ7BzKIuwvhszovKku8yPnWYfo%2FmRsDk1GE9EaYAmbK2%2BAA0WSqYOD2R%2BFasDIPIyOAhGF2wdAM0pC0lXmVdalHCxM8itSLxRGFknIksvMHoVcQA0dXRlG60NUuWj8Imhwd99uhpgcTxhvYONySsAqoOyG5W6pU0RfF%2BmCtlr4oX5yB3H5OUhti%2Fyu8njn9rBOkIe8jCB883IBjqkAenJqVQaNE0Nianmj%2FeIEiF6l3Fb2jercmZD%2F9Q6Or3bkLGq%2BCscIhXmYWOiwSvcfbjVAy24yewkIXj3JUZkDZ4T3N4bOhPWZTpQXNkI8EytMoJj%2BBK%2FFYWTj%2FMKgyqyR4PzR%2BwJka5OMTaqp7My8TmOwij5Km%2B%2B5ojWimddXyMtb13SNc3i2QX1QXGpnnz5jeYKBI%2FZfwsoO0qGVF0rPEEGXJWV&X-Amz-Signature=10019af64a852b747a8b32e7b34e841aa6387c63efc15424e4365abb6adfbfc9&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

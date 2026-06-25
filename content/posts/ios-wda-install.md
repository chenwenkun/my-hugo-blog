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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466QQTV2D5M%2F20260625%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260625T194421Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEIr%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCrbO0eUHfpghSmWXUvK%2B3sLU9csly1ZE5aimnt5cOf0wIhAMYKl8a0A9WZ9NtyvPw9WMqaxulVzUa3SFC9nFfoa%2F4lKv8DCFMQABoMNjM3NDIzMTgzODA1Igyld9SltTUo3XsUb54q3APXoxmoCLisTjLa%2FvLFBLtqlRc0KMu0E3yjGAgHmYTTdBeNHTj3DS5bgXJOyde1KUVvzvP%2BdjIj6xmtPk0eWSkj3j0b0Ln2v4vvLCGovyGcarcNNmxKpXmWDrqam4pV5TyFrxZRA2p4%2Ff3%2B5EQEzy9Y6g9ygEdoJ7aUUimJivpOS%2BYL55lHcX8qXHCrdF8w1wkxd%2BuEp6r%2BY5QSqgUQ1SoQAEJkH100wZPC4FVJbFhabz5EXXIzQRr5fBg3jMntztImraDUZ4bjG0132xsmYkL0WLMnDwVAotuWV7QoXsT6dynJAVM1HkY1zKSgDglKFcbld67DFeo1geSuMUCzYMeRpvheXc4kGezAblfKlEQ2w8DTql9OO0mIsStpOwXn7uD0v1g1Qp3f4k8JCFqpwIhjhC1MiakDHQSwuar%2FV1oZB9%2FYRD8bRhN8Nhzfam3iOnuotcI5VnCbGtWmQdObbLZPoZ5ope%2FmEWqxtclIfkTLOOBMeVZuZz3eiWpxSxlB%2B8lrG6juy%2BmVyhGkShMHdp9CrcD%2BdZKOCOTHD6MTT3OVmlco%2BTeedY8tfwTQKreA1Acx%2FxCW%2BfTChK1g8DhHTnyaiEnGW91WACXHE3rCdy1G9msT2trEnx%2F3QoQXejCG3PXRBjqkAbCzZxDAbx%2BgNU5dWLfnXUoLsJceCafUiR7rPITUVvFreRPOTbN8XDTYi8b8c2OWM8E8nTApSU9mrcRafjSkjD37f9oAzPHG8LWxmv%2BojYBaYq7QDI0R0pw8sb8QiIFspyU21wS8ReBeENIhTtgjJXSpwzf3EqTVBOy5pdf%2BMny%2BpPffwJsYgfOEilji3ZwTZixVlfib1nKNPAbYIY%2B%2Bi0DaEnOf&X-Amz-Signature=235dcaea85c07bb722d8c928e3f2ad129c75a421c545054e009c8b8b2a551eda&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466QQTV2D5M%2F20260625%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260625T194421Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEIr%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCrbO0eUHfpghSmWXUvK%2B3sLU9csly1ZE5aimnt5cOf0wIhAMYKl8a0A9WZ9NtyvPw9WMqaxulVzUa3SFC9nFfoa%2F4lKv8DCFMQABoMNjM3NDIzMTgzODA1Igyld9SltTUo3XsUb54q3APXoxmoCLisTjLa%2FvLFBLtqlRc0KMu0E3yjGAgHmYTTdBeNHTj3DS5bgXJOyde1KUVvzvP%2BdjIj6xmtPk0eWSkj3j0b0Ln2v4vvLCGovyGcarcNNmxKpXmWDrqam4pV5TyFrxZRA2p4%2Ff3%2B5EQEzy9Y6g9ygEdoJ7aUUimJivpOS%2BYL55lHcX8qXHCrdF8w1wkxd%2BuEp6r%2BY5QSqgUQ1SoQAEJkH100wZPC4FVJbFhabz5EXXIzQRr5fBg3jMntztImraDUZ4bjG0132xsmYkL0WLMnDwVAotuWV7QoXsT6dynJAVM1HkY1zKSgDglKFcbld67DFeo1geSuMUCzYMeRpvheXc4kGezAblfKlEQ2w8DTql9OO0mIsStpOwXn7uD0v1g1Qp3f4k8JCFqpwIhjhC1MiakDHQSwuar%2FV1oZB9%2FYRD8bRhN8Nhzfam3iOnuotcI5VnCbGtWmQdObbLZPoZ5ope%2FmEWqxtclIfkTLOOBMeVZuZz3eiWpxSxlB%2B8lrG6juy%2BmVyhGkShMHdp9CrcD%2BdZKOCOTHD6MTT3OVmlco%2BTeedY8tfwTQKreA1Acx%2FxCW%2BfTChK1g8DhHTnyaiEnGW91WACXHE3rCdy1G9msT2trEnx%2F3QoQXejCG3PXRBjqkAbCzZxDAbx%2BgNU5dWLfnXUoLsJceCafUiR7rPITUVvFreRPOTbN8XDTYi8b8c2OWM8E8nTApSU9mrcRafjSkjD37f9oAzPHG8LWxmv%2BojYBaYq7QDI0R0pw8sb8QiIFspyU21wS8ReBeENIhTtgjJXSpwzf3EqTVBOy5pdf%2BMny%2BpPffwJsYgfOEilji3ZwTZixVlfib1nKNPAbYIY%2B%2Bi0DaEnOf&X-Amz-Signature=aeee3af6f5abe93d6dde1198a3de6234afaa27489dbd682d1afb422141334912&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

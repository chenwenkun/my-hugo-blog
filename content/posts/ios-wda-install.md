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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466V2YPSLWX%2F20260217%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260217T064441Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEH4aCXVzLXdlc3QtMiJIMEYCIQDOGjjPqq%2BQ6cIlctPRwtyj2KIJfW253cR37ZoBkTAwNQIhAIxcPryyRTQjhfeW0gJHcmV0FRB8iDRE3sazLqz0ueeXKv8DCEcQABoMNjM3NDIzMTgzODA1Igz0c1BRWD6beTf5YaMq3APIGNLWNCAAawoTHDxmlgDSpKeCYYPfDp%2FEoFXvX2gVXUBXogVEr1wbxWhkIQI5G6mIrHTt6syvY8ojtBlMPit1b3R0BU%2FwSEr3tvYTE6sPKMGTt%2BIgsEqSlpkTVAMtN1OWnWVycKMbJwe%2FB9YJdi%2B5o%2B4jlHhHalvBR9sd2%2F1Jvt1t9FJLOkmin5c%2FNVZMoJmeGr00w5M8JKqQOleA6kOulz%2B%2B3OZ8OUGvJaJmB4mkjI3hQxkiTn4OpKZF3PHZeFR7oQBO4JiEKeFiFKPGNzUNQ7Ba23bOP%2Be7wdtsDN%2FMollCIJLk54knzMZfFJsUd5JbofUvHTLnCmzIEP4I%2Fzmy6EawlBMtqZcDXxpu%2FzMxPxM%2BKNtBoCvVK8W72fl24Xip6aiCvbEJGXnvuwtDeTkhJoCcaOexA9HD6BR6ZSsdI6Y6VKxH5u4SKo5NNrEnQK%2FuDhDwps21WioZfBFGQaIYC41X5TNMb0fP34LAASlRpV6QvtyvwRSTlz92j8XjXd8yXdxGAwEB6S%2Bco61uHSC6DoLm9Z61MdT8UAEPA6gyNlDDR8OOI8OIRJikw2J9Dsm9JuuWrNFed13jwEae8ZmaNbZeyhMbMBph21Fxm8mzD9Z3G3mXQwFGBx%2BC2jCGj9DMBjqkAUJ6j6WqZY5fXZQeRSymJZ6lbwcqoQ2xYsn7RzePkZrl9e9ooYT2tZ9QiHTQMkA3gHnWUjMydSjdYcL0iCKbqGOX4W5nnejBTxqyp7aY4jrYCCnYH0stGB%2B7baDze7bPpLN9%2BDnzOJKaT2VXXvfChpo2gwsIbu387fYJFWQPZFrF%2B7BIm1CZZIan%2Byi1M46CUsgT%2BwWeF0if0PVk%2F9vEUnqnYCn%2B&X-Amz-Signature=0a838aceb69041416015556d9c393665a67f3b162ece4ecce334fd0db5de6bcf&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466V2YPSLWX%2F20260217%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260217T064441Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEH4aCXVzLXdlc3QtMiJIMEYCIQDOGjjPqq%2BQ6cIlctPRwtyj2KIJfW253cR37ZoBkTAwNQIhAIxcPryyRTQjhfeW0gJHcmV0FRB8iDRE3sazLqz0ueeXKv8DCEcQABoMNjM3NDIzMTgzODA1Igz0c1BRWD6beTf5YaMq3APIGNLWNCAAawoTHDxmlgDSpKeCYYPfDp%2FEoFXvX2gVXUBXogVEr1wbxWhkIQI5G6mIrHTt6syvY8ojtBlMPit1b3R0BU%2FwSEr3tvYTE6sPKMGTt%2BIgsEqSlpkTVAMtN1OWnWVycKMbJwe%2FB9YJdi%2B5o%2B4jlHhHalvBR9sd2%2F1Jvt1t9FJLOkmin5c%2FNVZMoJmeGr00w5M8JKqQOleA6kOulz%2B%2B3OZ8OUGvJaJmB4mkjI3hQxkiTn4OpKZF3PHZeFR7oQBO4JiEKeFiFKPGNzUNQ7Ba23bOP%2Be7wdtsDN%2FMollCIJLk54knzMZfFJsUd5JbofUvHTLnCmzIEP4I%2Fzmy6EawlBMtqZcDXxpu%2FzMxPxM%2BKNtBoCvVK8W72fl24Xip6aiCvbEJGXnvuwtDeTkhJoCcaOexA9HD6BR6ZSsdI6Y6VKxH5u4SKo5NNrEnQK%2FuDhDwps21WioZfBFGQaIYC41X5TNMb0fP34LAASlRpV6QvtyvwRSTlz92j8XjXd8yXdxGAwEB6S%2Bco61uHSC6DoLm9Z61MdT8UAEPA6gyNlDDR8OOI8OIRJikw2J9Dsm9JuuWrNFed13jwEae8ZmaNbZeyhMbMBph21Fxm8mzD9Z3G3mXQwFGBx%2BC2jCGj9DMBjqkAUJ6j6WqZY5fXZQeRSymJZ6lbwcqoQ2xYsn7RzePkZrl9e9ooYT2tZ9QiHTQMkA3gHnWUjMydSjdYcL0iCKbqGOX4W5nnejBTxqyp7aY4jrYCCnYH0stGB%2B7baDze7bPpLN9%2BDnzOJKaT2VXXvfChpo2gwsIbu387fYJFWQPZFrF%2B7BIm1CZZIan%2Byi1M46CUsgT%2BwWeF0if0PVk%2F9vEUnqnYCn%2B&X-Amz-Signature=82dabce2e290d20a48f1e1bf89aa0975162f041cc484f60d989091bf1e340cb6&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

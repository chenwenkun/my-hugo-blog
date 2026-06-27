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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466QXJEPYT2%2F20260627%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260627T130730Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjELP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQDwDYKjksoVTY9VAZ0pX3e8gpv7mP50V6hExd84oYRrGwIhAKIL059htr4YHzps0mnH569j6tJswgTHmSkIHn6iypTzKv8DCHsQABoMNjM3NDIzMTgzODA1IgwhfhUbj%2F5ykWO7rYYq3AMo%2F4lkCovow5Z6z1lgtSwF5dZ3yDh1ffThWVyj5PoOQW29LotkXA5JzmMo5IgyNTQtgVYoTT47W5PhLotWNEWSEm0Mt%2BAnymsOOGhKcGzs7f39pJ4oSmLoeqksPI72%2Fe2lKEYcTNEyX%2FYH5Kj5I2pt5MYl57PkaebqJdR51C%2FPzpmJYoa%2F81C63kR2UtsFLo7nTLmPiET7yNJOI%2F2q9rZ1KoOHpKrkF3w4Er3mxUE60l3OG6W%2BzYFJ0J5ToLXi6xFGVOGNfl8Yt0hvJ2k84iCnBn9Lh9vlY9bKVWKUR2zdQZUc8K4cR5na41jSOCxhNMF1V6SBffvlpUngPZ%2BjbXaTJ8Ll%2FyFZB%2Bttjo%2F%2FYb4E3hghxeLr%2BmLbTeiVQWIe4wvFiwt%2BH5VWXeQ%2BjidhF8LJQCJfGddJekDKZB5nUqstbq9gLitzRdwMgPV0Mtw3bgQGgCImgYAihZeIIyyLbCgmZYrcxSihCOnSskFj%2BCYYI6ooEz7T7APtaiuUwCQXkSUcPdT%2BM4b05sesVnB5FjUQT6HT%2FkK1%2B0%2BMbsCccMrNUZCAje9U5e93Pis%2F0Ifb4woo%2Bk0GPB0U07iXybbm5TkiDP3ornr5vlCcckGLLyKPUkYHgciB2nTuitna0zD5xv7RBjqkAc4bZ%2BdXkVjwA6t68izvdZGDdU0tdnuZKoPmbIJVYwBOKIpYxAhSvqIJk99or7wGEUpyBnDNSFU5qkv7EWJagcz2fo4EJYZxkFQPTr9JjqdgcKAIxJercIi%2FjCTLvIYSOq8taijZ%2B%2BfFM3zlLyIxUDgTjbKlYsUuDMH38ytY%2B%2B7lIRcHAq%2BaQcq%2F6LYOZZMAn%2FFD%2FWw7pCSWjL5M07I5WtBrrr3Q&X-Amz-Signature=d8dbbcec15ff1bd785a08375f9e63467cf6650eb5b691220ca5463ea04e23b38&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466QXJEPYT2%2F20260627%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260627T130730Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjELP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQDwDYKjksoVTY9VAZ0pX3e8gpv7mP50V6hExd84oYRrGwIhAKIL059htr4YHzps0mnH569j6tJswgTHmSkIHn6iypTzKv8DCHsQABoMNjM3NDIzMTgzODA1IgwhfhUbj%2F5ykWO7rYYq3AMo%2F4lkCovow5Z6z1lgtSwF5dZ3yDh1ffThWVyj5PoOQW29LotkXA5JzmMo5IgyNTQtgVYoTT47W5PhLotWNEWSEm0Mt%2BAnymsOOGhKcGzs7f39pJ4oSmLoeqksPI72%2Fe2lKEYcTNEyX%2FYH5Kj5I2pt5MYl57PkaebqJdR51C%2FPzpmJYoa%2F81C63kR2UtsFLo7nTLmPiET7yNJOI%2F2q9rZ1KoOHpKrkF3w4Er3mxUE60l3OG6W%2BzYFJ0J5ToLXi6xFGVOGNfl8Yt0hvJ2k84iCnBn9Lh9vlY9bKVWKUR2zdQZUc8K4cR5na41jSOCxhNMF1V6SBffvlpUngPZ%2BjbXaTJ8Ll%2FyFZB%2Bttjo%2F%2FYb4E3hghxeLr%2BmLbTeiVQWIe4wvFiwt%2BH5VWXeQ%2BjidhF8LJQCJfGddJekDKZB5nUqstbq9gLitzRdwMgPV0Mtw3bgQGgCImgYAihZeIIyyLbCgmZYrcxSihCOnSskFj%2BCYYI6ooEz7T7APtaiuUwCQXkSUcPdT%2BM4b05sesVnB5FjUQT6HT%2FkK1%2B0%2BMbsCccMrNUZCAje9U5e93Pis%2F0Ifb4woo%2Bk0GPB0U07iXybbm5TkiDP3ornr5vlCcckGLLyKPUkYHgciB2nTuitna0zD5xv7RBjqkAc4bZ%2BdXkVjwA6t68izvdZGDdU0tdnuZKoPmbIJVYwBOKIpYxAhSvqIJk99or7wGEUpyBnDNSFU5qkv7EWJagcz2fo4EJYZxkFQPTr9JjqdgcKAIxJercIi%2FjCTLvIYSOq8taijZ%2B%2BfFM3zlLyIxUDgTjbKlYsUuDMH38ytY%2B%2B7lIRcHAq%2BaQcq%2F6LYOZZMAn%2FFD%2FWw7pCSWjL5M07I5WtBrrr3Q&X-Amz-Signature=dd1961d76eb5feb6e8c6598d07749c344a5392bb82340e42df20b98a33365aa6&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663EDHTSX3%2F20260211%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260211T124242Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEPT%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIA4TWc8JYDHwVnXUabeoYlo2t6%2FEbl7pf82n4uiOhFLTAiEAm1shDU3Xc6atgLFWIm5cFB51OdVo2tV9Q%2FS%2FCoQ1Y1EqiAQIvf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDLMkbB9TbnX1jBlqdCrcA8Kbhiv6j9eMqNKjiZDUYbaYn3k4oJL1YzHcZ3BvqVhmN6znoQluPv%2FyXT6Ulpk7rl6QI1bPFvIeMQvrv8li1QZEFsOfBiAD3UMnbSTBSnqXgJfd%2BmnI5dx7iGxkW9M%2FFUvH0MMLhiz2ij%2Bvtkh43TA77sLoVlSa9fd0%2BBFm%2BP8etxF54eGDpdpjcQTTGIQfffRcD3hMvxlxhEtoCqjreOlpBZSZyS9SorbiDZX9amqch2UYSjcHVwlITjYhz1Id1WKQujTjhFhg70V%2BX4wOxDpoZffqD%2BQkb7ZNlV%2Byapw4BtEEDo8yfpz9nSNpvgYi0JVr%2FLQisBzvcCN8NC3aI9bnB2cTpqPi%2FJtursVTSSkqond4CE9K7IswJLHvFGRTP8rVItjNwRS8oxgQSpIldZWgh6OmAy4gLfhWFQRE%2BxJH2lrRaVoH1UYPbGxoTnjHY3zb8UqvwV%2F90%2BPv131BmP0wjo0a%2B3BI%2FageOS2UZMPiJ5sx%2FD2q3XVNwA4mZ4eD23XHqodZM4JgrihhkM10coqbAWu4G70Cf40FASDfSmTxWcL%2FNPTiNkonmU88K7C67RU2CXNj%2FggcBW3gCwNJ4YFkBuVYmhWp1j%2BJcwUX%2F1Tr8arnfX7nqMXE4WInMMngscwGOqUB4yhxDH0D%2BHysHhn3YkaqnGEOWl9f%2F4PNx%2BGIx6YEJX9ptPRNphPRFOXBWteq07zv%2BDipuM7Vzdk3bwjgnuO1Bvt02a%2FvXZ6jyV6plfSwVmpi7XmpO4DcUl4suB9qw9MyOND%2But7tdJhk9hDMqrNKczZbZdRklzbMcx7W%2BonkyEf%2BU4etcYwJIGZmjBQr0UpheLXbroXxPZwGE%2Fgwdxs7APbfUWFh&X-Amz-Signature=4cda5fe89b4d820f0c73138aeca90820d9c39351c4b305446c98a61bc5c8c7ad&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663EDHTSX3%2F20260211%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260211T124242Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEPT%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIA4TWc8JYDHwVnXUabeoYlo2t6%2FEbl7pf82n4uiOhFLTAiEAm1shDU3Xc6atgLFWIm5cFB51OdVo2tV9Q%2FS%2FCoQ1Y1EqiAQIvf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDLMkbB9TbnX1jBlqdCrcA8Kbhiv6j9eMqNKjiZDUYbaYn3k4oJL1YzHcZ3BvqVhmN6znoQluPv%2FyXT6Ulpk7rl6QI1bPFvIeMQvrv8li1QZEFsOfBiAD3UMnbSTBSnqXgJfd%2BmnI5dx7iGxkW9M%2FFUvH0MMLhiz2ij%2Bvtkh43TA77sLoVlSa9fd0%2BBFm%2BP8etxF54eGDpdpjcQTTGIQfffRcD3hMvxlxhEtoCqjreOlpBZSZyS9SorbiDZX9amqch2UYSjcHVwlITjYhz1Id1WKQujTjhFhg70V%2BX4wOxDpoZffqD%2BQkb7ZNlV%2Byapw4BtEEDo8yfpz9nSNpvgYi0JVr%2FLQisBzvcCN8NC3aI9bnB2cTpqPi%2FJtursVTSSkqond4CE9K7IswJLHvFGRTP8rVItjNwRS8oxgQSpIldZWgh6OmAy4gLfhWFQRE%2BxJH2lrRaVoH1UYPbGxoTnjHY3zb8UqvwV%2F90%2BPv131BmP0wjo0a%2B3BI%2FageOS2UZMPiJ5sx%2FD2q3XVNwA4mZ4eD23XHqodZM4JgrihhkM10coqbAWu4G70Cf40FASDfSmTxWcL%2FNPTiNkonmU88K7C67RU2CXNj%2FggcBW3gCwNJ4YFkBuVYmhWp1j%2BJcwUX%2F1Tr8arnfX7nqMXE4WInMMngscwGOqUB4yhxDH0D%2BHysHhn3YkaqnGEOWl9f%2F4PNx%2BGIx6YEJX9ptPRNphPRFOXBWteq07zv%2BDipuM7Vzdk3bwjgnuO1Bvt02a%2FvXZ6jyV6plfSwVmpi7XmpO4DcUl4suB9qw9MyOND%2But7tdJhk9hDMqrNKczZbZdRklzbMcx7W%2BonkyEf%2BU4etcYwJIGZmjBQr0UpheLXbroXxPZwGE%2Fgwdxs7APbfUWFh&X-Amz-Signature=42c19d2c6864e437285323b602e72718cfa355a199e12f819974defd6c9a1e81&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

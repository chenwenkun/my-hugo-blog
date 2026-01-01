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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466RFYGOFIO%2F20260101%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260101T122304Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEBwaCXVzLXdlc3QtMiJHMEUCIQCbx4M91YSns9bgjzcvah7S%2Byf45EQn7U4fzJRXJQL3MwIgWm8ydw98hAUvu3YprDyVEh6ZdppsFmQnB1qrWEp7jDUqiAQI5f%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDFoLMKnWBuccXEwxYyrcAxhYdSp8DKhCVzlLT0HvgnyNtu7V4dR%2F4MloIoy9Fe7Q8Oto7ITJ0yIlRKm5rOP9%2BoBoYtn9Ylu1Rbzy3rwYbsKja88Zul20iIwkMrYdns5mdykzTpfGFYSVnHdjbZ2wNcEFmq%2F8z79wHrYucmq3b3Vn6DVYbvUs5NM6FdkZvyuUK5buVBXOU2UF%2FS8F%2FfSwQoRCZLMVzKPi%2Bciy9wBlBmm%2BlNVtw7hNH8MfNrlEvALybYdA9JnV4ZPviivzjWdBraEKlJrI5DWPpmSThLynKd9MzE9xpR7mQqeQNAMEyWPUsLSppF%2FcwwpO6Br5Peaq8skePC0n6g6MdXX2ZCQcsCfuVRe1I1aaNSWSLeiaBaIDm2ts1f51%2F7%2B1M8JjzWTpUhjmyL9bSC2z7zYH%2BeAmEgVBBJuA7K%2FFp6dkLZWFaMPeH7xuTJCH8%2FPFJ23rXzChNNEFehHTEdXvoS%2FBE6vXc8L1HhPBINuRx%2BIcX%2B3%2BMLhUnKWxCykV%2FmDJrvBp%2B1HOePnnjENxjPfSvIuLXBaNzmSzVIdoIQXu1KlbHcEoZaEwmrRh1X7stl%2FbayKY6dlcmuikk%2BNgA0PAC4pS9ScvdU1xluCnPLjdrWMwbiLYLMHj2q8N6MpUAZeV8kzgMMnC2coGOqUB1UQ3b6TSBQLx%2FPIxNuF7OUUHuk6UXqCLf%2FtS6yj%2BWtsYiWGgwCB4LUA%2FeUSVfkTBOdFk7Em9DHe4JlYoQrpqnFRVdJcddtUgqLPauXM5qXB%2FRJddSxnduJwbPFrpdRg3%2Fwn6h2GVBHfX66ef4jaNCmzmgm0t%2Fiq0RQ4ksLKpxYXu5rfqTNTyRCIJpqlNPZDADb7Xp4ZQF%2BZ%2F4Ar3xzKllzipIZK8&X-Amz-Signature=c8ef5aeb17204eb6325d108ab1fc2761444e21694d2c8551bb99c059bee1e37e&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466RFYGOFIO%2F20260101%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260101T122304Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEBwaCXVzLXdlc3QtMiJHMEUCIQCbx4M91YSns9bgjzcvah7S%2Byf45EQn7U4fzJRXJQL3MwIgWm8ydw98hAUvu3YprDyVEh6ZdppsFmQnB1qrWEp7jDUqiAQI5f%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDFoLMKnWBuccXEwxYyrcAxhYdSp8DKhCVzlLT0HvgnyNtu7V4dR%2F4MloIoy9Fe7Q8Oto7ITJ0yIlRKm5rOP9%2BoBoYtn9Ylu1Rbzy3rwYbsKja88Zul20iIwkMrYdns5mdykzTpfGFYSVnHdjbZ2wNcEFmq%2F8z79wHrYucmq3b3Vn6DVYbvUs5NM6FdkZvyuUK5buVBXOU2UF%2FS8F%2FfSwQoRCZLMVzKPi%2Bciy9wBlBmm%2BlNVtw7hNH8MfNrlEvALybYdA9JnV4ZPviivzjWdBraEKlJrI5DWPpmSThLynKd9MzE9xpR7mQqeQNAMEyWPUsLSppF%2FcwwpO6Br5Peaq8skePC0n6g6MdXX2ZCQcsCfuVRe1I1aaNSWSLeiaBaIDm2ts1f51%2F7%2B1M8JjzWTpUhjmyL9bSC2z7zYH%2BeAmEgVBBJuA7K%2FFp6dkLZWFaMPeH7xuTJCH8%2FPFJ23rXzChNNEFehHTEdXvoS%2FBE6vXc8L1HhPBINuRx%2BIcX%2B3%2BMLhUnKWxCykV%2FmDJrvBp%2B1HOePnnjENxjPfSvIuLXBaNzmSzVIdoIQXu1KlbHcEoZaEwmrRh1X7stl%2FbayKY6dlcmuikk%2BNgA0PAC4pS9ScvdU1xluCnPLjdrWMwbiLYLMHj2q8N6MpUAZeV8kzgMMnC2coGOqUB1UQ3b6TSBQLx%2FPIxNuF7OUUHuk6UXqCLf%2FtS6yj%2BWtsYiWGgwCB4LUA%2FeUSVfkTBOdFk7Em9DHe4JlYoQrpqnFRVdJcddtUgqLPauXM5qXB%2FRJddSxnduJwbPFrpdRg3%2Fwn6h2GVBHfX66ef4jaNCmzmgm0t%2Fiq0RQ4ksLKpxYXu5rfqTNTyRCIJpqlNPZDADb7Xp4ZQF%2BZ%2F4Ar3xzKllzipIZK8&X-Amz-Signature=6c9af8e3e3832ecf3749e82ca39ec33680df3b3264d21ccdd495ec3ff9f1b10a&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

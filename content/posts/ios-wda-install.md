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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4666D4TEOZR%2F20251116%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251116T121901Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEMf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCICLlQ%2BFhITws2vjpXJ%2FtAk2Was%2FkZfHLiuLUjwNaN%2FIQAiBxbK53aTeSI8NOGDHrP129hxzUEmxs50DqhoDK%2FZ4btiqIBAiQ%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMj3olGHNNkn4kw8ekKtwDs%2FWMmzrD4QqLH%2F0Aue5ozJzNneJEmrs%2Ffdcifqxd3OZZhDTqMvzQuELtQMHPZzPdNMxy1N2wX8BShrPnUPYOKhMmudVtHii7F1I2piJNWRdihQj6HwrfNphsLESOImCMvCro0WHSM%2BB1xLlhS%2BvFf2djCwGXd1zD9PR1BSeg08qNAEiCzaRFBNFYuGctSOol8TkS6Fl%2BZrMXcocycWLQkQcwDfeDZAu95NFi%2BrrSWtur2DwuwzFTSiFH9uLTksgT90K2mfE8iCuuorCQ8bz1ao9NiwXzoKzqwcVN%2FW28OaZE7GuN8IHNsDnsLbsZ1182y3xf5IkQMLEiHDzB2VWmkJ2Kntfh1%2B7SQuxo1Sp%2BzLw1PzEL2FJjHaaaaF%2BZncQq2IhSMdv7J%2FhALe4eZ7UDQC4IgOoSPuIV0YZMqLC%2FwCkLoUrigZotR8M8WvBd%2BuJIIzgoNq1SysfcQ1qWzERlQ8dMKC4LOSb5Vae6%2FZ0RYPP0HBLetJxmIrn8Yu%2BHqcFlWqyo1sHETPHrLs0BCU5cEhIhQ46aVIO%2Bk7XFL3HKSD7gyjtDJpX8thuH8z%2FnRzfqWNsgkKfCp7e8LefePRmN7mhOhjWQULwaJiKmSkSf0uSN6kCd0mxnJQbTUT0w%2FvTlyAY6pgHCakfcAwfRw2ZzXcxTRjE4kqT4XMku%2F9T4sqqF2FGiFtAeuHyWDSZYs3kWcsF695v87xGI198X0EUE9yrjXLj3lcjBK%2F5vhVXiM%2FX3MI1o0oqmYGaGxt%2FDYaJpMX6VtkAEUzgEG33kOIoB0kxsocD72F0zeq0W%2FNUc4n40S7WDS9YxRRBzWotxdPbpy4nmEcLjTJPxPp3q9A0yK7l0BKG3jbq5hNVX&X-Amz-Signature=723f58e57fb7b9f44142364deb3726648624c822b10e76c8fe70c4abf22ad895&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4666D4TEOZR%2F20251116%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251116T121901Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEMf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCICLlQ%2BFhITws2vjpXJ%2FtAk2Was%2FkZfHLiuLUjwNaN%2FIQAiBxbK53aTeSI8NOGDHrP129hxzUEmxs50DqhoDK%2FZ4btiqIBAiQ%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMj3olGHNNkn4kw8ekKtwDs%2FWMmzrD4QqLH%2F0Aue5ozJzNneJEmrs%2Ffdcifqxd3OZZhDTqMvzQuELtQMHPZzPdNMxy1N2wX8BShrPnUPYOKhMmudVtHii7F1I2piJNWRdihQj6HwrfNphsLESOImCMvCro0WHSM%2BB1xLlhS%2BvFf2djCwGXd1zD9PR1BSeg08qNAEiCzaRFBNFYuGctSOol8TkS6Fl%2BZrMXcocycWLQkQcwDfeDZAu95NFi%2BrrSWtur2DwuwzFTSiFH9uLTksgT90K2mfE8iCuuorCQ8bz1ao9NiwXzoKzqwcVN%2FW28OaZE7GuN8IHNsDnsLbsZ1182y3xf5IkQMLEiHDzB2VWmkJ2Kntfh1%2B7SQuxo1Sp%2BzLw1PzEL2FJjHaaaaF%2BZncQq2IhSMdv7J%2FhALe4eZ7UDQC4IgOoSPuIV0YZMqLC%2FwCkLoUrigZotR8M8WvBd%2BuJIIzgoNq1SysfcQ1qWzERlQ8dMKC4LOSb5Vae6%2FZ0RYPP0HBLetJxmIrn8Yu%2BHqcFlWqyo1sHETPHrLs0BCU5cEhIhQ46aVIO%2Bk7XFL3HKSD7gyjtDJpX8thuH8z%2FnRzfqWNsgkKfCp7e8LefePRmN7mhOhjWQULwaJiKmSkSf0uSN6kCd0mxnJQbTUT0w%2FvTlyAY6pgHCakfcAwfRw2ZzXcxTRjE4kqT4XMku%2F9T4sqqF2FGiFtAeuHyWDSZYs3kWcsF695v87xGI198X0EUE9yrjXLj3lcjBK%2F5vhVXiM%2FX3MI1o0oqmYGaGxt%2FDYaJpMX6VtkAEUzgEG33kOIoB0kxsocD72F0zeq0W%2FNUc4n40S7WDS9YxRRBzWotxdPbpy4nmEcLjTJPxPp3q9A0yK7l0BKG3jbq5hNVX&X-Amz-Signature=7331ce7a5302deb5e464cb58a36e501496fd1da34b172c04294c8af4e57af757&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466VIJ3CYKP%2F20260503%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260503T074628Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEIj%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQDa%2F0eQJLRVz9vdPiPJVprgbYLzMf5mBaCphmNrZUjHugIgT4wrORr%2BBEjP%2FqLnNVKslEdSmA9Kh8DfR8bfgKVaFhkq%2FwMIURAAGgw2Mzc0MjMxODM4MDUiDBjCHorlghddhGBjVCrcA8g56axPb90ZSe4nw1%2F%2Fv2wNqe9mFW5NBvef0ISmO2KtUk%2BN5bEBqxf51g4LoYjIjVlSTdxWEvzci3fw4qWTEGkniwPDiCIgRCuPx0BiDr332kSEWQp01Ui7%2BU1A5gc10P%2F1f9RDVh4qyFYkoKZ1ctWXM%2FcP2pEz2QPzg8EC8KqtH1WTypHkQThb%2B5OpWKF07yWZ2FKCe%2FAiZB0pGqBUbcMIz5uX20%2FYwla990HLA%2B8XYZfynKLP3hvQjrxaX7efkEKUhMOk9K6I0%2FUcgOuH7sty%2FuteaBQTxsW3Qjn9f6VN13pdTgzEG5%2BlvZag3V%2B7RXZgBIvkSFG9nVIwKAPIMy1%2F1wMY2xsyrfEyLfZ5UAVVTLF%2BJsRU6Qgm7XAu0c%2Fzmt957zXFr1uuvE4tNxDhvyPdQXCUlTjr9zp%2B6zrxmLqCA70riO%2BpmUB7d8jT4Xu8dFCYxlHkvtSnxhNbUswaPWsyBYxXbYKecFUnp0ZY7ehbbe8O5l9%2FV6ePHKYLcmgw6c8GEfN1IZLGeeGVqjN8YxSVmOngqCjYMxTLr9VHuo0KI%2BO2NIU0Di1l8wIm0SQEIq8sWxGkipJYSYKEoFtMhtx7KzYE%2FgHZz7rDUOTwerPjcfTlkTuc9ZiQxfIGMIv5288GOqUB%2FnYxuc%2BlNScGM3v28BHL83%2BrcOqceafK8etzHlZSOYcFjznRNMKUxrHRCDvjtDKZnwl4JwKMjzRBbyI5gXXZNaUyEOvmp%2Ftnu5ESK1nRZrLDz9Oqt3laFjx2yET%2BMW4GeQdFWzX6mqWs%2B2nVu9W%2FGSVRTqf%2BOgKauKhJXODQnkR5gVUbOPRfZo0W%2BJuQMaitup4sxxIFr8grUFbdwEgGFWWvuNhI&X-Amz-Signature=78b2f25793127fca330ba10c44479401ba7b26e349b3558c78fcf80f3b7c8bdd&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466VIJ3CYKP%2F20260503%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260503T074628Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEIj%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQDa%2F0eQJLRVz9vdPiPJVprgbYLzMf5mBaCphmNrZUjHugIgT4wrORr%2BBEjP%2FqLnNVKslEdSmA9Kh8DfR8bfgKVaFhkq%2FwMIURAAGgw2Mzc0MjMxODM4MDUiDBjCHorlghddhGBjVCrcA8g56axPb90ZSe4nw1%2F%2Fv2wNqe9mFW5NBvef0ISmO2KtUk%2BN5bEBqxf51g4LoYjIjVlSTdxWEvzci3fw4qWTEGkniwPDiCIgRCuPx0BiDr332kSEWQp01Ui7%2BU1A5gc10P%2F1f9RDVh4qyFYkoKZ1ctWXM%2FcP2pEz2QPzg8EC8KqtH1WTypHkQThb%2B5OpWKF07yWZ2FKCe%2FAiZB0pGqBUbcMIz5uX20%2FYwla990HLA%2B8XYZfynKLP3hvQjrxaX7efkEKUhMOk9K6I0%2FUcgOuH7sty%2FuteaBQTxsW3Qjn9f6VN13pdTgzEG5%2BlvZag3V%2B7RXZgBIvkSFG9nVIwKAPIMy1%2F1wMY2xsyrfEyLfZ5UAVVTLF%2BJsRU6Qgm7XAu0c%2Fzmt957zXFr1uuvE4tNxDhvyPdQXCUlTjr9zp%2B6zrxmLqCA70riO%2BpmUB7d8jT4Xu8dFCYxlHkvtSnxhNbUswaPWsyBYxXbYKecFUnp0ZY7ehbbe8O5l9%2FV6ePHKYLcmgw6c8GEfN1IZLGeeGVqjN8YxSVmOngqCjYMxTLr9VHuo0KI%2BO2NIU0Di1l8wIm0SQEIq8sWxGkipJYSYKEoFtMhtx7KzYE%2FgHZz7rDUOTwerPjcfTlkTuc9ZiQxfIGMIv5288GOqUB%2FnYxuc%2BlNScGM3v28BHL83%2BrcOqceafK8etzHlZSOYcFjznRNMKUxrHRCDvjtDKZnwl4JwKMjzRBbyI5gXXZNaUyEOvmp%2Ftnu5ESK1nRZrLDz9Oqt3laFjx2yET%2BMW4GeQdFWzX6mqWs%2B2nVu9W%2FGSVRTqf%2BOgKauKhJXODQnkR5gVUbOPRfZo0W%2BJuQMaitup4sxxIFr8grUFbdwEgGFWWvuNhI&X-Amz-Signature=8a7eb42f44f4a0ce8e3c3b446bc76fa6b2e307dd02ef7ffb87725b0fd7872038&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

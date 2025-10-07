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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4665LX4N4BE%2F20251007%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251007T181548Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEBEaCXVzLXdlc3QtMiJIMEYCIQDhCo0QPE3REBVM9wLID%2FCibsXYyMKc2dU63%2FN5GUaqDQIhAJdxjqt%2FHLQ4c4khSI5wwDQ5oAsykkeD2E6ZJ4PpSGCeKogECKr%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1Igw5L%2FOgBA2WAlWNOE4q3AOsWbfGaLpc%2Bs2YlOptSJj37%2FdWcE08eVzyXxNaK%2BEvj4y7hMOOS9%2BJlBHVlSY7Sz%2BboMjTewV%2Fs2Hw1F20QlB30zaQoHN9ADlQAaJ996SeiKGY%2FWNSWRoqoa%2FYznGmgtVhnLe8uAgZVd6%2FhmZWbETOXVAtPomjcSiBCBYxy7%2BlT2cRuOhZNbVe1NMeQwMkwVNWty8a3NNMCQAjhqSNH5YyIJHKqEYo2JdjsM8qPaYYdwZ3hdQCT00oyg2Rzsi5Cg2EH88Qef8ujlP4z8h7MRIs78mzhrjiSy%2BwXWGyvqIjcVnxUzUnYpVmN6WoO%2B%2FkO5VA294igyNhGuWtUL0v0yPkKUNb%2B1ypvsWgC0TTI8m04QUldcJrDRdU8ai6g6zRe6Of0Z0Qgi5oqtb7s0rcEozYF3uQmrEryjCzFu2Ediphbzmvu%2B6so3%2Fq%2FQuF91SLvPitn23wmbOG3mI1mU9CwrflZROejP2Ml45h9KfNM5BCBAF7Gx3Y6EF%2B6lnlMCLB8OdeLoOrmYnZHfFpxrWGNKRptFsF1%2BhQQtZPxJGfR2oSj8ja4ltgheFBOWWaKbl9wKK546AlFSmX3O13ztKfHtPEvXsufZYNidoCJq47QtCluDkPUbJ%2FOrc3r6e%2FOzDklZXHBjqkAaUznMmcF8zVRwwknNRrcAIlIqfs6sSlDPgV0mpIbSxJHA5lrsFiNXCvsdKNAZmGXFpGvAwBWRXWUpciyk3HfTLJXMwdyc3%2By0t5nZcg0%2BI2FR2d5cmRdlTk9QaYzE9BR3odVTYKkrooQSiWz9%2B19EcHajXQJN57MWtPdsIV6zmp03UKm3%2FHJy4xWSymamYRFkxyiLxGUV4kUqjxMDM%2FrvPSr5Dy&X-Amz-Signature=ea3c345f02b858775c0211e8162362d4578deb692722311d4f0391fad6f77870&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4665LX4N4BE%2F20251007%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251007T181548Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEBEaCXVzLXdlc3QtMiJIMEYCIQDhCo0QPE3REBVM9wLID%2FCibsXYyMKc2dU63%2FN5GUaqDQIhAJdxjqt%2FHLQ4c4khSI5wwDQ5oAsykkeD2E6ZJ4PpSGCeKogECKr%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1Igw5L%2FOgBA2WAlWNOE4q3AOsWbfGaLpc%2Bs2YlOptSJj37%2FdWcE08eVzyXxNaK%2BEvj4y7hMOOS9%2BJlBHVlSY7Sz%2BboMjTewV%2Fs2Hw1F20QlB30zaQoHN9ADlQAaJ996SeiKGY%2FWNSWRoqoa%2FYznGmgtVhnLe8uAgZVd6%2FhmZWbETOXVAtPomjcSiBCBYxy7%2BlT2cRuOhZNbVe1NMeQwMkwVNWty8a3NNMCQAjhqSNH5YyIJHKqEYo2JdjsM8qPaYYdwZ3hdQCT00oyg2Rzsi5Cg2EH88Qef8ujlP4z8h7MRIs78mzhrjiSy%2BwXWGyvqIjcVnxUzUnYpVmN6WoO%2B%2FkO5VA294igyNhGuWtUL0v0yPkKUNb%2B1ypvsWgC0TTI8m04QUldcJrDRdU8ai6g6zRe6Of0Z0Qgi5oqtb7s0rcEozYF3uQmrEryjCzFu2Ediphbzmvu%2B6so3%2Fq%2FQuF91SLvPitn23wmbOG3mI1mU9CwrflZROejP2Ml45h9KfNM5BCBAF7Gx3Y6EF%2B6lnlMCLB8OdeLoOrmYnZHfFpxrWGNKRptFsF1%2BhQQtZPxJGfR2oSj8ja4ltgheFBOWWaKbl9wKK546AlFSmX3O13ztKfHtPEvXsufZYNidoCJq47QtCluDkPUbJ%2FOrc3r6e%2FOzDklZXHBjqkAaUznMmcF8zVRwwknNRrcAIlIqfs6sSlDPgV0mpIbSxJHA5lrsFiNXCvsdKNAZmGXFpGvAwBWRXWUpciyk3HfTLJXMwdyc3%2By0t5nZcg0%2BI2FR2d5cmRdlTk9QaYzE9BR3odVTYKkrooQSiWz9%2B19EcHajXQJN57MWtPdsIV6zmp03UKm3%2FHJy4xWSymamYRFkxyiLxGUV4kUqjxMDM%2FrvPSr5Dy&X-Amz-Signature=fd0b2ac05f206b85356c282b8458809ff98e62c480ecddf51b5b4f3a58336324&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

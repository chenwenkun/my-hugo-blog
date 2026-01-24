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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466WPRSOFMQ%2F20260124%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260124T122152Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEEMaCXVzLXdlc3QtMiJGMEQCIHOVjw5RbHr5jF%2B1zMidFqr65Q5evT0RblQdAJ1Mx6ANAiBvcJi849sDUM74HV%2BaZUnE%2Bd%2FsHOZGLZwiaCShxgrZSir%2FAwgMEAAaDDYzNzQyMzE4MzgwNSIMAGNq78XmPB3kM0ySKtwDOw%2B4%2Ftok%2F%2FNHlLx6TwtWaNRf58alJsm%2BYPYSksb%2BM6aj5wIfk65AXVHf%2Bxk%2BtgPh26PhLXptD6ddJr3tog0w6Fmeu5ar9pmJsJyiwsT5iF4frppZi222ODBYHgyuTLNYS8xLHOKXKtkpxKm8xLBYCKBm13zSeLr4iDe27ewSeTVGFA41ytCcrggkIqrYs8LMY9zndD2nqF7jRfKTbpZv34M3ch8HS94m%2BYev2Z4yFqex%2BoIjc1Btk69FWYY8G1Jx8tmv7dHfenZecWK7dCnO%2B0U0y6WAlkGntLa71dXoCJDm68Z9t69JEElWOxD5QULXxftU3qZsGj70HaOm8EchCytHW7E20Yyp1YTZstWpZjV%2BBwmEKCQQB86vVHrcXgH9KLm%2FnqgYIhGNClIfkioygsvn%2Fsk5AT2YmWM%2FtxrArGG94sgcq7BG1ndCqm664QNaxsL3Bjlf2opIhiheJJE%2BbbxBSusimFXlXh9AnWdjmor76U3HjpV5cnUuIQW7AX1%2BSDQDGEcKmZ%2Fy04aYnpWbOe1t%2B%2FhK5W63yF3a1KgdWt3jSfmRp8tsc7ts6oLa9Tb3D6e90QcrtYpY%2FKTR2g4QDex5vyrVQ%2BZUM3nkds5sdYQ2I7nP52ZgDmjeppUwzMDSywY6pgFS42di4hdQCOFtFmDi1NDFdhghYNNS%2BwibHx3e2Bm8dxlPrc8DvjWt%2Fh3HDhv1vRDZA2mzFhXTuqb57UwD62GwyHj8KTarT5WrW9H8DBvpGN60Gg5ixyFRilH5kMyxdrmPDqMhobyh59hKJxXL%2FYP3tWW6JZ3kfUUGmoeWdBYanvAQH37%2B7B9KOYPF81Dt2qAAMEkYctFC3YleHbebPapuwxHqiyVz&X-Amz-Signature=3935e9312f24f860a43515ff7fb2bb84fc0f6460593a24ea3c6b700ed3a7a692&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466WPRSOFMQ%2F20260124%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260124T122152Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEEMaCXVzLXdlc3QtMiJGMEQCIHOVjw5RbHr5jF%2B1zMidFqr65Q5evT0RblQdAJ1Mx6ANAiBvcJi849sDUM74HV%2BaZUnE%2Bd%2FsHOZGLZwiaCShxgrZSir%2FAwgMEAAaDDYzNzQyMzE4MzgwNSIMAGNq78XmPB3kM0ySKtwDOw%2B4%2Ftok%2F%2FNHlLx6TwtWaNRf58alJsm%2BYPYSksb%2BM6aj5wIfk65AXVHf%2Bxk%2BtgPh26PhLXptD6ddJr3tog0w6Fmeu5ar9pmJsJyiwsT5iF4frppZi222ODBYHgyuTLNYS8xLHOKXKtkpxKm8xLBYCKBm13zSeLr4iDe27ewSeTVGFA41ytCcrggkIqrYs8LMY9zndD2nqF7jRfKTbpZv34M3ch8HS94m%2BYev2Z4yFqex%2BoIjc1Btk69FWYY8G1Jx8tmv7dHfenZecWK7dCnO%2B0U0y6WAlkGntLa71dXoCJDm68Z9t69JEElWOxD5QULXxftU3qZsGj70HaOm8EchCytHW7E20Yyp1YTZstWpZjV%2BBwmEKCQQB86vVHrcXgH9KLm%2FnqgYIhGNClIfkioygsvn%2Fsk5AT2YmWM%2FtxrArGG94sgcq7BG1ndCqm664QNaxsL3Bjlf2opIhiheJJE%2BbbxBSusimFXlXh9AnWdjmor76U3HjpV5cnUuIQW7AX1%2BSDQDGEcKmZ%2Fy04aYnpWbOe1t%2B%2FhK5W63yF3a1KgdWt3jSfmRp8tsc7ts6oLa9Tb3D6e90QcrtYpY%2FKTR2g4QDex5vyrVQ%2BZUM3nkds5sdYQ2I7nP52ZgDmjeppUwzMDSywY6pgFS42di4hdQCOFtFmDi1NDFdhghYNNS%2BwibHx3e2Bm8dxlPrc8DvjWt%2Fh3HDhv1vRDZA2mzFhXTuqb57UwD62GwyHj8KTarT5WrW9H8DBvpGN60Gg5ixyFRilH5kMyxdrmPDqMhobyh59hKJxXL%2FYP3tWW6JZ3kfUUGmoeWdBYanvAQH37%2B7B9KOYPF81Dt2qAAMEkYctFC3YleHbebPapuwxHqiyVz&X-Amz-Signature=57eb05b39ae9b9af85da6798d30f70b3e837797d344eda123cebab10ba08a0ff&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

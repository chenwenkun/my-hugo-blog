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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466SP3R4TXU%2F20260516%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260516T125702Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEML%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQDodkSgIKEk7BA3kFGb3%2F%2BcxTLuiSRGAA6OCm7tTcbu0gIhAJDDh16ogxyYpYHzC6%2FHuNPJT1yv5gW4bqfC6g%2FCrdYyKogECIr%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgyeLFmsWt03UBZzI0Yq3APaVYtkMsSabwPS5JR1MXkB6ecx%2BwJEB6H1OxgnLxv4CI%2Bq7JRNTmaicTHwgiE8MpBNAk81IFwWz2wDBKwMGWjYDy1eaUS%2F160CFb4GIEv83uBNkgnob%2FUBIiJYSw4OZmitnyNvFnYZxoy7NKIMGmU7sXdkSm24vL4ZJYZLb1aVidA8lPFpK07MqTRFlsGIRDVEbRoVxlTkq84pXNqcRpFKac6b6tQGw0drJgPKK5MkR9M88ilG%2BUcJd%2F32NjjjXg%2Fd1RzIDvjlw9YtjKrpczR708iVbCo7ADuKRRQ23hg69EfFecq9bOrdCrb6d%2F6BmyUtjnjqarBBDWFcW08E5mtU%2F1w8dn39oAjGWFFBKpP2VzlYr%2Fko97m69%2FJO57ZFsh8PWzqFQcwgeMr4QhMSECyv2otKwngeZunbefDW%2BTvFw4Mm6ll%2B5qy05GfFR8DxRTXkBI%2FWBHfEny065UATVBGQKaawjU%2F5VEq2K9pmBHZAKrETnR2nfCUMQTutvmn%2BtnE8RjjEMJvStpR9Y%2FHNeOXW%2FSmWIwd%2F8NRY7QVpvvz0HdTT7%2FRDADCZwyMUNoswzp5y7obcC7998KuNzxZftL%2BTSPpm0NweHYihb%2FfkaFCu0gLYp3t9OecplGtFezDn7KDQBjqkASEVpBghi7GUY0T201%2F6OnD0X%2BY6cBuSJFNu2Itmtgzt0X0V7%2FiodhGWd3XoDGdugotHHAz%2BWStGWf5F1vcujF5YS0rfqzZ%2Bqp6cW8jQvh5%2FkPTiUdiGosjTnZMlBLwAOpWbRrXKvN2XQEqtxirBmkeOF6vVoIGwlcURu3fQZOv8BfrttT5o60UqdWiLvtpAKKGhh6AlFTiWMZ6wN8G%2FcWjZYvJJ&X-Amz-Signature=5c1a32ea7a0fe7c70a472915451241dcdc84847d337bd46a14c63c359df0da97&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466SP3R4TXU%2F20260516%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260516T125702Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEML%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQDodkSgIKEk7BA3kFGb3%2F%2BcxTLuiSRGAA6OCm7tTcbu0gIhAJDDh16ogxyYpYHzC6%2FHuNPJT1yv5gW4bqfC6g%2FCrdYyKogECIr%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgyeLFmsWt03UBZzI0Yq3APaVYtkMsSabwPS5JR1MXkB6ecx%2BwJEB6H1OxgnLxv4CI%2Bq7JRNTmaicTHwgiE8MpBNAk81IFwWz2wDBKwMGWjYDy1eaUS%2F160CFb4GIEv83uBNkgnob%2FUBIiJYSw4OZmitnyNvFnYZxoy7NKIMGmU7sXdkSm24vL4ZJYZLb1aVidA8lPFpK07MqTRFlsGIRDVEbRoVxlTkq84pXNqcRpFKac6b6tQGw0drJgPKK5MkR9M88ilG%2BUcJd%2F32NjjjXg%2Fd1RzIDvjlw9YtjKrpczR708iVbCo7ADuKRRQ23hg69EfFecq9bOrdCrb6d%2F6BmyUtjnjqarBBDWFcW08E5mtU%2F1w8dn39oAjGWFFBKpP2VzlYr%2Fko97m69%2FJO57ZFsh8PWzqFQcwgeMr4QhMSECyv2otKwngeZunbefDW%2BTvFw4Mm6ll%2B5qy05GfFR8DxRTXkBI%2FWBHfEny065UATVBGQKaawjU%2F5VEq2K9pmBHZAKrETnR2nfCUMQTutvmn%2BtnE8RjjEMJvStpR9Y%2FHNeOXW%2FSmWIwd%2F8NRY7QVpvvz0HdTT7%2FRDADCZwyMUNoswzp5y7obcC7998KuNzxZftL%2BTSPpm0NweHYihb%2FfkaFCu0gLYp3t9OecplGtFezDn7KDQBjqkASEVpBghi7GUY0T201%2F6OnD0X%2BY6cBuSJFNu2Itmtgzt0X0V7%2FiodhGWd3XoDGdugotHHAz%2BWStGWf5F1vcujF5YS0rfqzZ%2Bqp6cW8jQvh5%2FkPTiUdiGosjTnZMlBLwAOpWbRrXKvN2XQEqtxirBmkeOF6vVoIGwlcURu3fQZOv8BfrttT5o60UqdWiLvtpAKKGhh6AlFTiWMZ6wN8G%2FcWjZYvJJ&X-Amz-Signature=d845ddb5bac6985c98fe8e80cbf5fb8de111003a7c9b19c9f270def9da5371dd&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466QA6PAC7T%2F20260711%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260711T125326Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEAIaCXVzLXdlc3QtMiJHMEUCIEHdECDhIDvsYldAN7Q2MN1AZsydRNeZGrv6Rq%2Fkr0JAAiEApeByIoGuJt%2BEQSQ9kWdIyuVpD6QrMe86LJkXGrjX4aYqiAQIy%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDCuMsF7bibgs4DOVXyrcA%2Fr8l%2B24EjCoCtckWkRAdBCI1i%2FJYdu7afUcJeZofz7iqiBYhrStr8CWOsPMSfa1xEdTSvVHaZRh0LJmExPobICZgaq7ntBsYvaKHb7p0enuGMmlQw2cx5RBH164ZheYkwTEg%2BdBAODGWrMiUHO%2BeQ0SzpUL%2BjbaiKEO7zB7D3iARd2GLxCR6G19AmLVgjlSOLoRX%2BK6VlfI%2F7MiVHY202aUeHYiz7kHBKgZ9AEDuCR8z0mdxBWBnZKyjcMmIkY%2FvoVfxm8ut3BiiFxRXWOsVBZ2uXB%2FIm4XlQp2mGtWCyU1FqD8sSkk%2B1XSdpfe1cXCx%2BXdeM%2BtjwjhIVwAQ69pv1rIi9TRonEFUbudb7%2B5IkTRuznveYXIaxq5qf1GsSXqo9ADodkcDQft44Y7XJZDJOHzVJRM0%2FV8yn2HWtYQ8WklxXO6u6R7qTTrxCHfuQ3jci1SaI8K2bRiUEwwPoQFC3Q9LSL3TbOsXlDLAnZrdj8DBtt9FxTJ%2Fz%2BuWQPpqZy7mwT6LFRfbIHxIzHuB4Q7zkEa3le4TOccp8Bw%2BIpCDS36osi28cWwWrKtxKaXWRvQ3MbUQSUrR86X7HBuE0mzneYry7MTuJW2ZcPvp6bEHBFutG8dlSwnMWRofs7OMNCkyNIGOqUBikQc6xZbxUJZOUdNZiZpRzLmo4OP717NG4i8bvUGbiUZFJONtq26Cr7kXSQDFrWaccz%2F4YU6iGfNd6uiry2KfKetrCPbP8lBuptBCcQkdV5kGnYXMHZWlrB%2Fk1w9XeV6eqDsJN8qvOA0MFKSgfbc1BjvMQ8uZe3isesrzywpHwWSxGTXt9i15YRBYkzTRxe3WAEiSaIsUpdTDxhOo5Ej8t9%2FQBcB&X-Amz-Signature=436c65db4d1cbc6a597a07085dea545bc7ec49f3d7796f1d6a6cf538b92580b7&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466QA6PAC7T%2F20260711%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260711T125326Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEAIaCXVzLXdlc3QtMiJHMEUCIEHdECDhIDvsYldAN7Q2MN1AZsydRNeZGrv6Rq%2Fkr0JAAiEApeByIoGuJt%2BEQSQ9kWdIyuVpD6QrMe86LJkXGrjX4aYqiAQIy%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDCuMsF7bibgs4DOVXyrcA%2Fr8l%2B24EjCoCtckWkRAdBCI1i%2FJYdu7afUcJeZofz7iqiBYhrStr8CWOsPMSfa1xEdTSvVHaZRh0LJmExPobICZgaq7ntBsYvaKHb7p0enuGMmlQw2cx5RBH164ZheYkwTEg%2BdBAODGWrMiUHO%2BeQ0SzpUL%2BjbaiKEO7zB7D3iARd2GLxCR6G19AmLVgjlSOLoRX%2BK6VlfI%2F7MiVHY202aUeHYiz7kHBKgZ9AEDuCR8z0mdxBWBnZKyjcMmIkY%2FvoVfxm8ut3BiiFxRXWOsVBZ2uXB%2FIm4XlQp2mGtWCyU1FqD8sSkk%2B1XSdpfe1cXCx%2BXdeM%2BtjwjhIVwAQ69pv1rIi9TRonEFUbudb7%2B5IkTRuznveYXIaxq5qf1GsSXqo9ADodkcDQft44Y7XJZDJOHzVJRM0%2FV8yn2HWtYQ8WklxXO6u6R7qTTrxCHfuQ3jci1SaI8K2bRiUEwwPoQFC3Q9LSL3TbOsXlDLAnZrdj8DBtt9FxTJ%2Fz%2BuWQPpqZy7mwT6LFRfbIHxIzHuB4Q7zkEa3le4TOccp8Bw%2BIpCDS36osi28cWwWrKtxKaXWRvQ3MbUQSUrR86X7HBuE0mzneYry7MTuJW2ZcPvp6bEHBFutG8dlSwnMWRofs7OMNCkyNIGOqUBikQc6xZbxUJZOUdNZiZpRzLmo4OP717NG4i8bvUGbiUZFJONtq26Cr7kXSQDFrWaccz%2F4YU6iGfNd6uiry2KfKetrCPbP8lBuptBCcQkdV5kGnYXMHZWlrB%2Fk1w9XeV6eqDsJN8qvOA0MFKSgfbc1BjvMQ8uZe3isesrzywpHwWSxGTXt9i15YRBYkzTRxe3WAEiSaIsUpdTDxhOo5Ej8t9%2FQBcB&X-Amz-Signature=98842b2d0a34aea71c3e5c63130fec158da146a56e28a3a811dc1fff3e756fdf&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

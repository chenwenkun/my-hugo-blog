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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4666Q44FWN2%2F20260713%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260713T191013Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEDoaCXVzLXdlc3QtMiJIMEYCIQD6gf6IzSIrvRGH0O4%2BAv%2FowsQayyNaTZlt8L02U5SAHQIhAL9ZsoZXtV1YQMgHkJJQVOTcMTAoEH7k0P7prsW25RU2Kv8DCAMQABoMNjM3NDIzMTgzODA1IgwRSEDgQOnSFBVJRYcq3ANJMDpu3R0aehS%2FwOctAsAfrRo8CcrxPu9snDStXDaHI67lxhZO2MUusDVV8otn93i5JTysOtqt6ahT1rCB5rd1X3InfqNI3PrfdNqFCbZ8ugqVPyNvkf1Ona4hM0WxUPmxBtra9eld6o1y1m5pbhYA5P8Ru0bE37b5CWuHPZOrGZ4Iuc1hygjrqs4uxUkieSF4KwswfoPj4gh1FAyr8SPW36uE8%2FF6CcfzwTpZCTuqcLVwLFIPCMLmlOWiT9Y0n3vTPJBWXE%2FM6gDL2l2Dz4A7IhzFVlm%2FRHJvY2NwCl9Ws2ZtyBhk7ucRvFKvxj23adyuwdw7Fgl3MpW1elDRSRv31vnqulnqgx62bR1zy1848P1Mg0h%2FXQ5XWsbo9C2BR9DS3%2F9ScentH0fo5WlnbgBPd6Dhnw53uGqAhweZ%2Fe64ojzyJdcP%2F2stdD2tN71WxxtElqmKezhIfMum4KYQ%2BPc9d%2B93BAPl3PCLrmYra0Pr4jTiW%2FLaRcyUybugHmfg2j5NuwmCFNwhlGWlEnhmwRX%2BFcwTPBNCuRpvYP65tQa3Vgj8xVyw%2BpWCB%2Fcvf0NO5yBfjqfKTBNzLSzu02TREAfeVQVmq0KUSExijZ8nvDUDBQ8e%2Fip4%2F6LpzRSZfDCy1NTSBjqkAZegaOf9sbUIYnI%2F21CcYhzjtuwzpJRnGdF2%2FDumccFRhR4IPB7Zg57PmiLLyONePsYPg9VNQHW6jegznIoHhlaP3XJl2OE2l1WGkxHFLjH%2FQrnqEwCy8SlkwxR6%2FKOW8M9UqC6TI4nmCSUxGpauFNOT5Kbb8dvdt7r9LVOoaDZpwuLcrYmOKr2CiAJfvKzFanXvmUFPcRIXn2mmHzTisZ13m9Pi&X-Amz-Signature=4bd45c01f1bc619e324b9b3f985e06c9c118041836264488fccce9c8551834b2&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4666Q44FWN2%2F20260713%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260713T191013Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEDoaCXVzLXdlc3QtMiJIMEYCIQD6gf6IzSIrvRGH0O4%2BAv%2FowsQayyNaTZlt8L02U5SAHQIhAL9ZsoZXtV1YQMgHkJJQVOTcMTAoEH7k0P7prsW25RU2Kv8DCAMQABoMNjM3NDIzMTgzODA1IgwRSEDgQOnSFBVJRYcq3ANJMDpu3R0aehS%2FwOctAsAfrRo8CcrxPu9snDStXDaHI67lxhZO2MUusDVV8otn93i5JTysOtqt6ahT1rCB5rd1X3InfqNI3PrfdNqFCbZ8ugqVPyNvkf1Ona4hM0WxUPmxBtra9eld6o1y1m5pbhYA5P8Ru0bE37b5CWuHPZOrGZ4Iuc1hygjrqs4uxUkieSF4KwswfoPj4gh1FAyr8SPW36uE8%2FF6CcfzwTpZCTuqcLVwLFIPCMLmlOWiT9Y0n3vTPJBWXE%2FM6gDL2l2Dz4A7IhzFVlm%2FRHJvY2NwCl9Ws2ZtyBhk7ucRvFKvxj23adyuwdw7Fgl3MpW1elDRSRv31vnqulnqgx62bR1zy1848P1Mg0h%2FXQ5XWsbo9C2BR9DS3%2F9ScentH0fo5WlnbgBPd6Dhnw53uGqAhweZ%2Fe64ojzyJdcP%2F2stdD2tN71WxxtElqmKezhIfMum4KYQ%2BPc9d%2B93BAPl3PCLrmYra0Pr4jTiW%2FLaRcyUybugHmfg2j5NuwmCFNwhlGWlEnhmwRX%2BFcwTPBNCuRpvYP65tQa3Vgj8xVyw%2BpWCB%2Fcvf0NO5yBfjqfKTBNzLSzu02TREAfeVQVmq0KUSExijZ8nvDUDBQ8e%2Fip4%2F6LpzRSZfDCy1NTSBjqkAZegaOf9sbUIYnI%2F21CcYhzjtuwzpJRnGdF2%2FDumccFRhR4IPB7Zg57PmiLLyONePsYPg9VNQHW6jegznIoHhlaP3XJl2OE2l1WGkxHFLjH%2FQrnqEwCy8SlkwxR6%2FKOW8M9UqC6TI4nmCSUxGpauFNOT5Kbb8dvdt7r9LVOoaDZpwuLcrYmOKr2CiAJfvKzFanXvmUFPcRIXn2mmHzTisZ13m9Pi&X-Amz-Signature=23c9c8cb18431989fff1ac0a9918cc48bddbf8db39db672ecb233b6dec2a1556&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

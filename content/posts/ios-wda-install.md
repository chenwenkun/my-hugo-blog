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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466S3G5PPZ4%2F20260514%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260514T020751Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEIb%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIHSYiHuXUqcc10aZ%2FlYShavTnZkkM9dYT2nmIR%2Bob6IHAiBj5IfhbGnnkbt8LO7bc3M6nsmMK%2Bj0nlP4ccCzLU0%2Bmir%2FAwhPEAAaDDYzNzQyMzE4MzgwNSIMdWpsgR03lDp4sUaBKtwD5ti6iGt5P8oSS5wx3Rnp0ruK8%2BFjyb34UTAvkDHa%2BJe5G2MQlDV8RSl71weqfgtsUbtq0oWdwXdQLsr%2FoMiFFf9PNtubY55RHC5OV%2FbUiXbcXYLRU2ZRu2LU3sjffbjLxuxl3PMrUFWBx85oc7%2Fd6beDJJzPFXFVbqwPrnQaQUeg5M2nhCJD0brlrJPB44FqMD4yDApmShxDEDtzn4zu5vli7SZQhaDRUDrEC0hadY8xmNvoq5qlImSvZtwnSleEgrf9nZDBfK1Azx5s9ViLAhW9cv23%2FC25hmxW971WyqALEcPbIur8EnCrPm75lVAIYdkU1JX0XXHx3ao7L473hphmz%2Bkq%2FFyzlNfg%2B9SP4YTuyrgjD2w8RGsjz8BQlIKfPwhPI0t9Otkt6Chd3EESSkt4MZRyMoOq8d7Kt0cqliu2rATlCmUShdij10MDOYPMgROIjomXV6M1qn8o7WrycMWbZG2iuSsucUVPQrwkh0Tw11MEseLeMzRPJANPEfEJupZR6XLxso1S1uAcHA1Hc0CtsP0NMkwvIfqsvuaLF0bAO2qGrz6puk9wV5EeB5dBlpy%2FOiGRMDmH%2Bukog9Vqn0LSPGm8CEaJ3W%2BrGzwA%2Fh4vgWLMp2ssQCezizEwgtqT0AY6pgFf2kXpPs4ZmlsjhLiFyt1IKgpY%2BUP%2Fi7g%2B3ZLemYySmmqIPbIpVINTk0Fqlf2vg1cYechfWMno71%2BeJPVDbKNGZAXpDGhoOhjoU0NcgBfaivGE6nH0sbwnNpazmxhx43geNj8NkgLCn5LeVmU96X28FPSonxa6fsmMGK5UmWm16M%2B0XGkUsoVAVLd7iPcj2ehqAlpsMuXmvQVOgHK01XMIG%2B86e%2B8i&X-Amz-Signature=faa93f482a10dc4cee471291f5c237ae07fd3ac4917a86c9090bbc5c2bb3ef96&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466S3G5PPZ4%2F20260514%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260514T020751Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEIb%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIHSYiHuXUqcc10aZ%2FlYShavTnZkkM9dYT2nmIR%2Bob6IHAiBj5IfhbGnnkbt8LO7bc3M6nsmMK%2Bj0nlP4ccCzLU0%2Bmir%2FAwhPEAAaDDYzNzQyMzE4MzgwNSIMdWpsgR03lDp4sUaBKtwD5ti6iGt5P8oSS5wx3Rnp0ruK8%2BFjyb34UTAvkDHa%2BJe5G2MQlDV8RSl71weqfgtsUbtq0oWdwXdQLsr%2FoMiFFf9PNtubY55RHC5OV%2FbUiXbcXYLRU2ZRu2LU3sjffbjLxuxl3PMrUFWBx85oc7%2Fd6beDJJzPFXFVbqwPrnQaQUeg5M2nhCJD0brlrJPB44FqMD4yDApmShxDEDtzn4zu5vli7SZQhaDRUDrEC0hadY8xmNvoq5qlImSvZtwnSleEgrf9nZDBfK1Azx5s9ViLAhW9cv23%2FC25hmxW971WyqALEcPbIur8EnCrPm75lVAIYdkU1JX0XXHx3ao7L473hphmz%2Bkq%2FFyzlNfg%2B9SP4YTuyrgjD2w8RGsjz8BQlIKfPwhPI0t9Otkt6Chd3EESSkt4MZRyMoOq8d7Kt0cqliu2rATlCmUShdij10MDOYPMgROIjomXV6M1qn8o7WrycMWbZG2iuSsucUVPQrwkh0Tw11MEseLeMzRPJANPEfEJupZR6XLxso1S1uAcHA1Hc0CtsP0NMkwvIfqsvuaLF0bAO2qGrz6puk9wV5EeB5dBlpy%2FOiGRMDmH%2Bukog9Vqn0LSPGm8CEaJ3W%2BrGzwA%2Fh4vgWLMp2ssQCezizEwgtqT0AY6pgFf2kXpPs4ZmlsjhLiFyt1IKgpY%2BUP%2Fi7g%2B3ZLemYySmmqIPbIpVINTk0Fqlf2vg1cYechfWMno71%2BeJPVDbKNGZAXpDGhoOhjoU0NcgBfaivGE6nH0sbwnNpazmxhx43geNj8NkgLCn5LeVmU96X28FPSonxa6fsmMGK5UmWm16M%2B0XGkUsoVAVLd7iPcj2ehqAlpsMuXmvQVOgHK01XMIG%2B86e%2B8i&X-Amz-Signature=4c13c659b2bfe65a36460bb9dac593040d2790efd6be101da6625c2a7446658e&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

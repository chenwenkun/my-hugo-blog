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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466T433OHM5%2F20260407%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260407T125603Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEBwaCXVzLXdlc3QtMiJGMEQCICSqFhHltV05JtUpyblZWM%2F1Bl6nu7xtekwzsup9Uy06AiAP6X%2F9H9ONv0ajPgN95SsXhUIe4JooUGL2r5YGX1bS7CqIBAjl%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMWBMGjMPaa4aBRXWsKtwD5CTtFKKzP2Ozonh8I964vunSpAg1BRciS542t79mb0GGSNKIzpGh70ebgKBdFyns7ZqsVBvZi4NjnMDga9rUlVHb9lFHL5ZqZ1v38KlIYBgIVxXxhFTnftsBjzMPHMwaUjfvj4%2FhwP5Ixu0dfRdv1BOF%2BLhtm8H1VagtFovtYICgZOr%2BeSNxg2EP%2Bv0p0avadJOmiRmOLtQVf9ZNWyBa6fxVE8rhMkXJRP553eJrGZsWlKl78KDwkWZMmbIusxxlcLODGmqQG2uDmTbg8CWy0or%2Bs292esngD%2BDtIjZn7XoOFOYmbf7wBp4319P%2BI8Ry%2BQj8SIJ4RdkAFU%2FKzPPrsgp5hcjF8YvXbqXZ119FafI6exlkMlzpHfISIZ9tYi0Jb61ihAMbDPbjnORJm5UgOi0%2F%2B1H8FNYk5oIUm5eTKsmC71OWu8gT93JsZ%2BttUeVHCqPE8dUfKmKLJGamBkxp0j0NT6KoXCtUYxTW6gjdLx%2BFCuWJ%2BOjMSYrJGrh9QBurveiV%2Fg%2B7dVVv3htNAvS6Ex%2Fu2btNKFqrTpqwZeIZAMG4d6flC%2BvBnQFEzUTsNAwnOfBnU13xrTwRPFP1Owp30XURKig4Ybs2p8H2s3YpcqpeuDT6fVGu3wx9toUwhODTzgY6pgGXU1yEYyDsn5uHRdi%2BaecYSAyb8t93kGCALO9tpGi0aLEAfHVDsARpp4HGY%2BwXObs8o6Nu5DuYXZ1MeZuE6DlLR8YcnAj8RoC2lWAyyPdeEP3EfhaYZeJC6%2FVqjRBX7RAfqqpM1Nx6tFs0pvNASzw9mhYzS03jg6sDzUDvmwpXnoC2k8v%2F%2FEcRQmd0%2FsVT6REjsQU6HD%2BM9fVqK5fRPchTQ4h9SqyZ&X-Amz-Signature=452257b36d93344c87d9c0950908f66b07c4a2184cb063794d325be615793ca1&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466T433OHM5%2F20260407%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260407T125603Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEBwaCXVzLXdlc3QtMiJGMEQCICSqFhHltV05JtUpyblZWM%2F1Bl6nu7xtekwzsup9Uy06AiAP6X%2F9H9ONv0ajPgN95SsXhUIe4JooUGL2r5YGX1bS7CqIBAjl%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMWBMGjMPaa4aBRXWsKtwD5CTtFKKzP2Ozonh8I964vunSpAg1BRciS542t79mb0GGSNKIzpGh70ebgKBdFyns7ZqsVBvZi4NjnMDga9rUlVHb9lFHL5ZqZ1v38KlIYBgIVxXxhFTnftsBjzMPHMwaUjfvj4%2FhwP5Ixu0dfRdv1BOF%2BLhtm8H1VagtFovtYICgZOr%2BeSNxg2EP%2Bv0p0avadJOmiRmOLtQVf9ZNWyBa6fxVE8rhMkXJRP553eJrGZsWlKl78KDwkWZMmbIusxxlcLODGmqQG2uDmTbg8CWy0or%2Bs292esngD%2BDtIjZn7XoOFOYmbf7wBp4319P%2BI8Ry%2BQj8SIJ4RdkAFU%2FKzPPrsgp5hcjF8YvXbqXZ119FafI6exlkMlzpHfISIZ9tYi0Jb61ihAMbDPbjnORJm5UgOi0%2F%2B1H8FNYk5oIUm5eTKsmC71OWu8gT93JsZ%2BttUeVHCqPE8dUfKmKLJGamBkxp0j0NT6KoXCtUYxTW6gjdLx%2BFCuWJ%2BOjMSYrJGrh9QBurveiV%2Fg%2B7dVVv3htNAvS6Ex%2Fu2btNKFqrTpqwZeIZAMG4d6flC%2BvBnQFEzUTsNAwnOfBnU13xrTwRPFP1Owp30XURKig4Ybs2p8H2s3YpcqpeuDT6fVGu3wx9toUwhODTzgY6pgGXU1yEYyDsn5uHRdi%2BaecYSAyb8t93kGCALO9tpGi0aLEAfHVDsARpp4HGY%2BwXObs8o6Nu5DuYXZ1MeZuE6DlLR8YcnAj8RoC2lWAyyPdeEP3EfhaYZeJC6%2FVqjRBX7RAfqqpM1Nx6tFs0pvNASzw9mhYzS03jg6sDzUDvmwpXnoC2k8v%2F%2FEcRQmd0%2FsVT6REjsQU6HD%2BM9fVqK5fRPchTQ4h9SqyZ&X-Amz-Signature=91c6d79ea9e1b7e14351b1a8c43b1d99f181926aa159756e698dee50a40adaa5&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466UY63YQGZ%2F20260706%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260706T095342Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEIn%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIAL9D5al2GP%2B7UCvA1eMfV6agB8RjcLoe4wZ2%2BzzBSPJAiBiVZF%2B5vZeGqV7KL9fhBGoK0t8ftwUg1Pvb8RwoKY%2B5Sr%2FAwhREAAaDDYzNzQyMzE4MzgwNSIMaaaEA%2BlWXb66zDQ2KtwDOx8AnIQbCMEBYcfWQM7XyPvhGThz4eTZeb5ordHH1082Hshjaz8GAhR3%2BX0U4FzSaQ5aoEsuFHytJXkinJoItMQZPjCtJYM4srwUtrMi37KLn%2FxMZ4HtpPfXqVGRAAab%2BgilVkaZvOwTpY%2BYl5gwxveDWXtZowS5f7HxVNh6oiUcSs42NKyyWFXlPt0AEz6UDaaVFeiJdCPxy%2F%2F26Q0uYVkbhWBJzicze%2BxEJ7gSw5PcDxT0tq%2F%2BFeOGnSs1SubLrdXXG0tRdgnRBcHSMDR5j3R6vCrCi2xLJwoxJsDgGDD7QjU%2FNJxFdRsVycUrmOvCDiiYO4xkw%2BTbXsvdhN4symQj9rfshjiYxEjdXYzK9k7ERbvEsNAEoDFtPmldeeEVYZJLwNQzq4Jj8dMDE7%2B0XcPuoh79MBsxMHVWs2RhWmXzDBiR2akLMApT%2B9LIG0RRGciO%2FQ%2BNJeLKeYF6X63MjB9UYAcfhs%2BfoXybV93tvBEXN4koouh8X%2BgENpzpYHY0C55kKCCgl%2FfkNL3tvh%2F8CPDm3m7HVhuO670V1%2BI8frOYd2rtLhV%2FR9zVkJLdQRnHY7EhluewEipQxUeHUqq5t67zQyEJuV%2FlHZfqIIZq9wtnMfUoSjkOSj6LD6owgsut0gY6pgHMLpC2Zmor2QZeLfD%2Frqqj%2FY93PzPzxxUeM8FAPf9p8CrACAtB%2BP7SS9rYlHQsFEvdbqkaj5%2FTbyEkSK7edGIj9M0WfW3ZSEyEKQys5YWhJ%2Bv821USo4sFNOaF9QVn8AaCKyHMGABpTDsAeKvuYPMaC3SB2%2F8XbxSLFqseRG2kmbrIR14%2B0XQ3eVinTRfX0H%2BH1WNyOz73JhkzxdhNBlCZ4nRF1IZF&X-Amz-Signature=e689c453088667075bf1e84797164f987c3a32a90181a82fbb9c037ac85f14a3&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466UY63YQGZ%2F20260706%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260706T095342Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEIn%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIAL9D5al2GP%2B7UCvA1eMfV6agB8RjcLoe4wZ2%2BzzBSPJAiBiVZF%2B5vZeGqV7KL9fhBGoK0t8ftwUg1Pvb8RwoKY%2B5Sr%2FAwhREAAaDDYzNzQyMzE4MzgwNSIMaaaEA%2BlWXb66zDQ2KtwDOx8AnIQbCMEBYcfWQM7XyPvhGThz4eTZeb5ordHH1082Hshjaz8GAhR3%2BX0U4FzSaQ5aoEsuFHytJXkinJoItMQZPjCtJYM4srwUtrMi37KLn%2FxMZ4HtpPfXqVGRAAab%2BgilVkaZvOwTpY%2BYl5gwxveDWXtZowS5f7HxVNh6oiUcSs42NKyyWFXlPt0AEz6UDaaVFeiJdCPxy%2F%2F26Q0uYVkbhWBJzicze%2BxEJ7gSw5PcDxT0tq%2F%2BFeOGnSs1SubLrdXXG0tRdgnRBcHSMDR5j3R6vCrCi2xLJwoxJsDgGDD7QjU%2FNJxFdRsVycUrmOvCDiiYO4xkw%2BTbXsvdhN4symQj9rfshjiYxEjdXYzK9k7ERbvEsNAEoDFtPmldeeEVYZJLwNQzq4Jj8dMDE7%2B0XcPuoh79MBsxMHVWs2RhWmXzDBiR2akLMApT%2B9LIG0RRGciO%2FQ%2BNJeLKeYF6X63MjB9UYAcfhs%2BfoXybV93tvBEXN4koouh8X%2BgENpzpYHY0C55kKCCgl%2FfkNL3tvh%2F8CPDm3m7HVhuO670V1%2BI8frOYd2rtLhV%2FR9zVkJLdQRnHY7EhluewEipQxUeHUqq5t67zQyEJuV%2FlHZfqIIZq9wtnMfUoSjkOSj6LD6owgsut0gY6pgHMLpC2Zmor2QZeLfD%2Frqqj%2FY93PzPzxxUeM8FAPf9p8CrACAtB%2BP7SS9rYlHQsFEvdbqkaj5%2FTbyEkSK7edGIj9M0WfW3ZSEyEKQys5YWhJ%2Bv821USo4sFNOaF9QVn8AaCKyHMGABpTDsAeKvuYPMaC3SB2%2F8XbxSLFqseRG2kmbrIR14%2B0XQ3eVinTRfX0H%2BH1WNyOz73JhkzxdhNBlCZ4nRF1IZF&X-Amz-Signature=136979e53d64cd16cf3f343f0aa44803080e9a93f302e50fbecbb654b47989f0&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

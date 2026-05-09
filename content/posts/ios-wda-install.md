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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466XSK6F77B%2F20260509%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260509T015447Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEBEaCXVzLXdlc3QtMiJIMEYCIQCaHijVZxhH46VkL5NfZnnJiU3832c%2F%2BON6eaGWBi3umwIhAOIWx0qqoSiGjKzNt170kFR%2BG17UB3eJU0sSCuLfhceQKogECNr%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgxTyutO%2BkqFnmA2ojAq3AMeL0BYfX5ejUYvXnBjGGYvM1uN2P8kc2yiSagK9ZolVWiKB5DbU%2FOYPYfahh5lXHGGY0%2FvMt2zeB7CS2QMekV%2FUYJm%2FEUWt%2FQBx1Vw3PvID9gZ61q8v7psb1bdJxtkV4yCcV1Xh39tB481rf4XRvMnCUQB0qfK%2FEgHSmGK3cxbs%2FTXcjlKQ1JewqDRIfrlsR8ylhqhe2tJoy5uN8SCon8SbfSlV3fYqx5byBdgzQ28B2vOY8e2AvGee2QOzzH2et6FioBMgoa%2F0MD5rr1F3MiMCwiMjRkYL5ZZhPSEHkgB3umUpFwqv%2FUAJG5evzIkSFU7cDf%2Ba7Pe5C22TbUAp1s1PSfjZJTrvg4ZQ0ecGK4AY%2BsN6lyQIoNBwTINCA5Q7Ima7acgrOiPxwxvEpNAXoBp8xk%2BIktJrKnBvt1N3H%2FBibJH7OwvWIrzicf0kS3e23UEDcI7o94jLbA2%2BQWb3zDiGYRe9jMAi64MbHvAz08Y9CoVudTLY%2FUV0jZ3YV3KTVQ%2Fp0XVZ2ONyrFdDP55xKXFM4fP%2BgN%2BIFQINXDuYPQx1XSwGwA2zoFAYQINQH%2FjYUibbMkvzj8%2Fgr7oBNZkr1a3gh%2FlJXFbFYFf9EINxlC7VINYjsQf5cPHpDC6%2BzDSivrPBjqkAT%2Fzi3ioVY02wZBo%2B7OvPkusjAcrvM8sywALathlbCsWveOhZ8OQXqFuom4cgmrBd6AMbrzohOxzUMcLUl9wGBvaNYPsVIXS3AUjBlM9Ad8n9nl2KlVsdBS8ILa17wFRHd6N5u%2BvCEPrBdJpFGC5ICJA%2FBRVJ1Fz8J%2BEjr6la4n8RkAs28D57Do1U89YOw0HNStisBQb0ZcV5bSm6jhIUSB04ujq&X-Amz-Signature=539e840a9baea67e6ebc35da651d1942d1bf6dbd521dd2200e9a205701897c29&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466XSK6F77B%2F20260509%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260509T015447Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEBEaCXVzLXdlc3QtMiJIMEYCIQCaHijVZxhH46VkL5NfZnnJiU3832c%2F%2BON6eaGWBi3umwIhAOIWx0qqoSiGjKzNt170kFR%2BG17UB3eJU0sSCuLfhceQKogECNr%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgxTyutO%2BkqFnmA2ojAq3AMeL0BYfX5ejUYvXnBjGGYvM1uN2P8kc2yiSagK9ZolVWiKB5DbU%2FOYPYfahh5lXHGGY0%2FvMt2zeB7CS2QMekV%2FUYJm%2FEUWt%2FQBx1Vw3PvID9gZ61q8v7psb1bdJxtkV4yCcV1Xh39tB481rf4XRvMnCUQB0qfK%2FEgHSmGK3cxbs%2FTXcjlKQ1JewqDRIfrlsR8ylhqhe2tJoy5uN8SCon8SbfSlV3fYqx5byBdgzQ28B2vOY8e2AvGee2QOzzH2et6FioBMgoa%2F0MD5rr1F3MiMCwiMjRkYL5ZZhPSEHkgB3umUpFwqv%2FUAJG5evzIkSFU7cDf%2Ba7Pe5C22TbUAp1s1PSfjZJTrvg4ZQ0ecGK4AY%2BsN6lyQIoNBwTINCA5Q7Ima7acgrOiPxwxvEpNAXoBp8xk%2BIktJrKnBvt1N3H%2FBibJH7OwvWIrzicf0kS3e23UEDcI7o94jLbA2%2BQWb3zDiGYRe9jMAi64MbHvAz08Y9CoVudTLY%2FUV0jZ3YV3KTVQ%2Fp0XVZ2ONyrFdDP55xKXFM4fP%2BgN%2BIFQINXDuYPQx1XSwGwA2zoFAYQINQH%2FjYUibbMkvzj8%2Fgr7oBNZkr1a3gh%2FlJXFbFYFf9EINxlC7VINYjsQf5cPHpDC6%2BzDSivrPBjqkAT%2Fzi3ioVY02wZBo%2B7OvPkusjAcrvM8sywALathlbCsWveOhZ8OQXqFuom4cgmrBd6AMbrzohOxzUMcLUl9wGBvaNYPsVIXS3AUjBlM9Ad8n9nl2KlVsdBS8ILa17wFRHd6N5u%2BvCEPrBdJpFGC5ICJA%2FBRVJ1Fz8J%2BEjr6la4n8RkAs28D57Do1U89YOw0HNStisBQb0ZcV5bSm6jhIUSB04ujq&X-Amz-Signature=204a6ea388758da8f850e56d485128d1c51f7283d6ed81b490a7969d9c866464&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

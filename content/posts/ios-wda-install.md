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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466UO5WTCCS%2F20260318%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260318T065019Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEDYaCXVzLXdlc3QtMiJHMEUCIQCxw8VR3rKSozFy25tZz7GYd9O34ndWUn1ysKQDl5%2FyswIgbjYjOc9Gv5KmDYELbDKCNAQ0VJwGz1y4iH%2FYv9lI5xIqiAQI%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDFlxFIoezfYNLx1N9CrcA6M5HvNfE93ULY5fZB7lcsLi7k%2BgM%2FQDYhdkWaYPqAo71hagIQl8z%2F7EBlhmKaRYz1mJV5wUlgWAe7t1mscjVGTNJzb2KMzD2yDSlcq3p3nsIGZuXx%2BY%2F9uNdtEliqBrjdJ9mb8TNIm9vZs2ZCiUMtYswOZrl8leYa7grIHBE7AzvW92T%2FWMxyWQxUyC8lwvLLYmwirmGdRSFKVreGdEA4ePCnxxqGYFsdA%2FG0l6b1zpYtAT0ekPNla7%2FdsZ8ItMkaabgSYNF%2F1XDmSr4NNAHveqfwuJnQ9xZ9enTyLcbf37xSHSCm2rwCg1sTV86WWm%2FG4N9N726XaVy7uuUvv%2B1XG0U00Ul%2BnRKouRdtTHZAwg4EqagY2BUVniXyoZSpcozaWywpeBzLsbUfjzm8kwoJz8JzBqQjMVQ4Rk3ap2RWFaGAqaoJL66z7IxvLeEA7vy3pSUsk9xY%2BWhn788%2BsmzeSMVV7hYtE%2BTdahLz85yYN7%2F5iCK3OLCi4yFhPXjd%2FsE%2FUsbrszs7RlkFkMbABTfkQ3jpj7oH7puQ0KUg4eJZlPB2Sj08cOBZn8Ql1%2FByPbU37Pv1IIeLnquPK3ZxpZgZNorrfTcfx%2FbsooGbUwykwDTmC%2FzSSBQnVKltf8MLv36M0GOqUBl%2Fd5iaSEVtzQkkgd%2F%2BSbP0xn0FvkCBZHUzZwcnxmvtPPG6GoWnl4wfYSQfqnzqJ0iFYADfBUvvVp8iTFoU%2FhGprxF%2B%2BAnvglsTlbgVokgtPDu1uIeAkqE3Y%2B0nVXy2uH2wXJ0HFyE8QDMqc4vVJuos5opRFTOi73%2FzZpoG58ieVJFshBUqz0yrMuAnUfujiuXafE8mMsP1Nez2cWLpc4wDMrRMOL&X-Amz-Signature=c4264c9888016ce359d20ee61597609028d833f9f0e432d40d17a3a752111414&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466UO5WTCCS%2F20260318%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260318T065019Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEDYaCXVzLXdlc3QtMiJHMEUCIQCxw8VR3rKSozFy25tZz7GYd9O34ndWUn1ysKQDl5%2FyswIgbjYjOc9Gv5KmDYELbDKCNAQ0VJwGz1y4iH%2FYv9lI5xIqiAQI%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDFlxFIoezfYNLx1N9CrcA6M5HvNfE93ULY5fZB7lcsLi7k%2BgM%2FQDYhdkWaYPqAo71hagIQl8z%2F7EBlhmKaRYz1mJV5wUlgWAe7t1mscjVGTNJzb2KMzD2yDSlcq3p3nsIGZuXx%2BY%2F9uNdtEliqBrjdJ9mb8TNIm9vZs2ZCiUMtYswOZrl8leYa7grIHBE7AzvW92T%2FWMxyWQxUyC8lwvLLYmwirmGdRSFKVreGdEA4ePCnxxqGYFsdA%2FG0l6b1zpYtAT0ekPNla7%2FdsZ8ItMkaabgSYNF%2F1XDmSr4NNAHveqfwuJnQ9xZ9enTyLcbf37xSHSCm2rwCg1sTV86WWm%2FG4N9N726XaVy7uuUvv%2B1XG0U00Ul%2BnRKouRdtTHZAwg4EqagY2BUVniXyoZSpcozaWywpeBzLsbUfjzm8kwoJz8JzBqQjMVQ4Rk3ap2RWFaGAqaoJL66z7IxvLeEA7vy3pSUsk9xY%2BWhn788%2BsmzeSMVV7hYtE%2BTdahLz85yYN7%2F5iCK3OLCi4yFhPXjd%2FsE%2FUsbrszs7RlkFkMbABTfkQ3jpj7oH7puQ0KUg4eJZlPB2Sj08cOBZn8Ql1%2FByPbU37Pv1IIeLnquPK3ZxpZgZNorrfTcfx%2FbsooGbUwykwDTmC%2FzSSBQnVKltf8MLv36M0GOqUBl%2Fd5iaSEVtzQkkgd%2F%2BSbP0xn0FvkCBZHUzZwcnxmvtPPG6GoWnl4wfYSQfqnzqJ0iFYADfBUvvVp8iTFoU%2FhGprxF%2B%2BAnvglsTlbgVokgtPDu1uIeAkqE3Y%2B0nVXy2uH2wXJ0HFyE8QDMqc4vVJuos5opRFTOi73%2FzZpoG58ieVJFshBUqz0yrMuAnUfujiuXafE8mMsP1Nez2cWLpc4wDMrRMOL&X-Amz-Signature=779185ac1ba0e670077385eff193246e79ae85cc34a9067c3bbfd5dadb204080&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

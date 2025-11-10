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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466SGM7YK45%2F20251110%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251110T122209Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEDwaCXVzLXdlc3QtMiJIMEYCIQDtQKV9e2NkYKw9L%2BT4erhxeDxMl%2FPRgjHh68GlwA%2B%2FLwIhAI9zq%2F2JApaza9lNaLAjmfdVKW2O3R1ETl8%2F4huSZ5mIKv8DCAUQABoMNjM3NDIzMTgzODA1Igy%2B4a6Py86IP89Wavcq3AOWeTuAM%2FLMhxOY4S52b5Hn5wt3eVV4CM%2FV6mCtcqPaDN6FKlvTDaxJjNTteDLyRY%2BbYC%2BXYCBWWaQZyeUpVC1F5xBEHdxBQvvnFh33qmDwLkalKz9HFDvUESiadsJwo01vohh17O%2BoxCNOM%2Bdzz%2FSWzE4NBh8%2BXaLedkWrY7XiCN3SNG5nw0NieWrco5lCjY%2FlCCGvzRY0B%2BUAKmr6yTR9yvcHRQiZU%2FaeeAq9xsV5gkuTk3%2FOZlYqF7jYxxVVsOyBrOmpQS7shp0q39ryjSkGRxBj86bc8RZwRX7IQlriRigoKlbMzwE7fpEVaV9MjFyPS3P7LXsWZRq8E0cXRbWTXxTVjkWy1fg%2F3lFmhqHQ2szJSpXiKi4fHhYnvM15%2FrVrt5dTEMtJqbE38y3WTK4yu0IpZCP8tmF5m65H9kM8MxouHUBy9gQcirDjIsUFXZoNqZPN7ht3YIz5bjhdPKUqVkCTX6w5sUYGditmZFk0ROTtmYpNA9SsfcM6dO2hbUXIr4cqSuFUTxZcIt7d4GvCaCOZxb0ViD2AxFxVJqew%2BxieDusRTtkNtApfUhUNJwrYtQDq%2FzqA9a%2BQetuxGBBN6dysiiyMlZQjsWcsz799h8%2Fno8vJGGj7IQ0sUjCBosfIBjqkAfQzLSbREFdm8JtiijZwb0fnODP9OLm9y9FHoVLAyUsvXa6w3weRnzm%2Fl8Huwg%2FiUKT0aN2cdh1waPTRXbAluCwiI%2BnPZRJE1oodI%2BVCeT%2FzslnVrOEKHw5w03%2FPxc4eL%2BeJNLdLiavWzSP7bLuUwCcONon%2Fqtfx0PbPGCTWulWWTm357pAGY0TQM8TAvoiJgMLUuqoklHcql455Sh1BuBHLiyOQ&X-Amz-Signature=e79b045ca64403b8ec2d6dea1d91b5c53dc61a68b92e7c7494f80d050e46589d&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466SGM7YK45%2F20251110%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251110T122209Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEDwaCXVzLXdlc3QtMiJIMEYCIQDtQKV9e2NkYKw9L%2BT4erhxeDxMl%2FPRgjHh68GlwA%2B%2FLwIhAI9zq%2F2JApaza9lNaLAjmfdVKW2O3R1ETl8%2F4huSZ5mIKv8DCAUQABoMNjM3NDIzMTgzODA1Igy%2B4a6Py86IP89Wavcq3AOWeTuAM%2FLMhxOY4S52b5Hn5wt3eVV4CM%2FV6mCtcqPaDN6FKlvTDaxJjNTteDLyRY%2BbYC%2BXYCBWWaQZyeUpVC1F5xBEHdxBQvvnFh33qmDwLkalKz9HFDvUESiadsJwo01vohh17O%2BoxCNOM%2Bdzz%2FSWzE4NBh8%2BXaLedkWrY7XiCN3SNG5nw0NieWrco5lCjY%2FlCCGvzRY0B%2BUAKmr6yTR9yvcHRQiZU%2FaeeAq9xsV5gkuTk3%2FOZlYqF7jYxxVVsOyBrOmpQS7shp0q39ryjSkGRxBj86bc8RZwRX7IQlriRigoKlbMzwE7fpEVaV9MjFyPS3P7LXsWZRq8E0cXRbWTXxTVjkWy1fg%2F3lFmhqHQ2szJSpXiKi4fHhYnvM15%2FrVrt5dTEMtJqbE38y3WTK4yu0IpZCP8tmF5m65H9kM8MxouHUBy9gQcirDjIsUFXZoNqZPN7ht3YIz5bjhdPKUqVkCTX6w5sUYGditmZFk0ROTtmYpNA9SsfcM6dO2hbUXIr4cqSuFUTxZcIt7d4GvCaCOZxb0ViD2AxFxVJqew%2BxieDusRTtkNtApfUhUNJwrYtQDq%2FzqA9a%2BQetuxGBBN6dysiiyMlZQjsWcsz799h8%2Fno8vJGGj7IQ0sUjCBosfIBjqkAfQzLSbREFdm8JtiijZwb0fnODP9OLm9y9FHoVLAyUsvXa6w3weRnzm%2Fl8Huwg%2FiUKT0aN2cdh1waPTRXbAluCwiI%2BnPZRJE1oodI%2BVCeT%2FzslnVrOEKHw5w03%2FPxc4eL%2BeJNLdLiavWzSP7bLuUwCcONon%2Fqtfx0PbPGCTWulWWTm357pAGY0TQM8TAvoiJgMLUuqoklHcql455Sh1BuBHLiyOQ&X-Amz-Signature=64d0777f533d984204b6c76b34273017c029a75552ae08b077c33c16595b431b&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

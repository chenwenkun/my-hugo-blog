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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663ACXPIZV%2F20260619%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260619T192356Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEPv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIHrlGN%2BZuUxlWGDteXFAJruTbLTC2jnOWwOUGRVOEQP4AiAUjvJJQor%2BlRx1yOhgAH%2BzblW5uDKg9jq74fMUa%2F8rSCqIBAjE%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMiReCedAcG02eItZYKtwDqmU6qYSZrgDcWRO%2F3UGCTYv0QfPJokFVr9YrYD%2FmNyLxozNyElx1VRebN%2FPbPWVDlqFoBiWiVNLAh6HzEmKh925sGZE%2FOBE7X%2FHH%2BAlhSj%2FyXFe3vrQA0MIHXZyZZWkdEC8MKNhjSS1uTYrF69Osme5io3ERpWHTytF%2BYhbSHQyqWem84YnLWtUpsRUeQzjFgqC21FhUpeHeqGNvo0HFZmd3qkxL9gKCx1yxVGyJtM16oBgD%2F%2BtR8RyvWRl4FX6Ox19feDwH%2BkfHESExIJX4XRJxQcwA4gdA15cxHHlxFtvfsfGjUboh9suQcs0Xai02k%2BXVkiQoDeAIxuJWJDD0SQ6Kg28jGzvz7UN3vvckztL7pFgO5bsWL49LBH%2BFK8Hv7SOACojOhUCFhFHa8O%2BYR320N70%2BC2W%2BNlw%2Bmkl6UYDSX8Sap4SqfNDBWznAEZFv2ojNZAqx%2FA5eRu1GUivQOhxi%2Bbkt%2Bvlu5YqYPMWzn58s59UdqnLJwqFK8%2F2Bjj1L0701eUKs6TsXntFoD49l3xLET0M7dIOYzBZi2uaHku6mvFiEw6nNSSrZSh4uC57YslIlp6GFgfr1BxTLpLXrgyKw3KWDVAWUKgyzk0HqRHgDH9n0XvX6vSiUkgcw9qDW0QY6pgF4MopRlnqYApe2E3edWyGXYJCP2fSw1uJFoyCT5gMIYFRnlc3Y1S735MelKXYMiZuvCnDhJVeaQYMDNxtGZXgmNezJT%2FjEIpIp3qe%2F%2BDyY0IMI%2BS2w59WPVyrEK%2B2fr5QRv0GrYRm2TitpG%2B4xnBDgyBcrZVDgAH0mxB%2FTJ16bMKU4A7jN9deRqHG9OtQqQQrCTkH2%2F8VS8Ldb3fHsEaphhGL0Ursz&X-Amz-Signature=950fcab9e683f6d22e83390c9c353801f50d1ce0acf75dd9dbf83b4a2317caa7&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663ACXPIZV%2F20260619%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260619T192356Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEPv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIHrlGN%2BZuUxlWGDteXFAJruTbLTC2jnOWwOUGRVOEQP4AiAUjvJJQor%2BlRx1yOhgAH%2BzblW5uDKg9jq74fMUa%2F8rSCqIBAjE%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMiReCedAcG02eItZYKtwDqmU6qYSZrgDcWRO%2F3UGCTYv0QfPJokFVr9YrYD%2FmNyLxozNyElx1VRebN%2FPbPWVDlqFoBiWiVNLAh6HzEmKh925sGZE%2FOBE7X%2FHH%2BAlhSj%2FyXFe3vrQA0MIHXZyZZWkdEC8MKNhjSS1uTYrF69Osme5io3ERpWHTytF%2BYhbSHQyqWem84YnLWtUpsRUeQzjFgqC21FhUpeHeqGNvo0HFZmd3qkxL9gKCx1yxVGyJtM16oBgD%2F%2BtR8RyvWRl4FX6Ox19feDwH%2BkfHESExIJX4XRJxQcwA4gdA15cxHHlxFtvfsfGjUboh9suQcs0Xai02k%2BXVkiQoDeAIxuJWJDD0SQ6Kg28jGzvz7UN3vvckztL7pFgO5bsWL49LBH%2BFK8Hv7SOACojOhUCFhFHa8O%2BYR320N70%2BC2W%2BNlw%2Bmkl6UYDSX8Sap4SqfNDBWznAEZFv2ojNZAqx%2FA5eRu1GUivQOhxi%2Bbkt%2Bvlu5YqYPMWzn58s59UdqnLJwqFK8%2F2Bjj1L0701eUKs6TsXntFoD49l3xLET0M7dIOYzBZi2uaHku6mvFiEw6nNSSrZSh4uC57YslIlp6GFgfr1BxTLpLXrgyKw3KWDVAWUKgyzk0HqRHgDH9n0XvX6vSiUkgcw9qDW0QY6pgF4MopRlnqYApe2E3edWyGXYJCP2fSw1uJFoyCT5gMIYFRnlc3Y1S735MelKXYMiZuvCnDhJVeaQYMDNxtGZXgmNezJT%2FjEIpIp3qe%2F%2BDyY0IMI%2BS2w59WPVyrEK%2B2fr5QRv0GrYRm2TitpG%2B4xnBDgyBcrZVDgAH0mxB%2FTJ16bMKU4A7jN9deRqHG9OtQqQQrCTkH2%2F8VS8Ldb3fHsEaphhGL0Ursz&X-Amz-Signature=f0d89513633c4abedaf851fb6a1250c3b20a4cf9d4a845aaa8a98b6b432972a7&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

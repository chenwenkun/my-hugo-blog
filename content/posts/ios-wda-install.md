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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466Q53CLY4U%2F20260105%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260105T122501Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEHsaCXVzLXdlc3QtMiJIMEYCIQDQbmwD7pUgIdpWPgQsZUWzdyqriqdgKJQ7uTlZs%2BEJyQIhAIw5Stymna3U6W3VatPtRK%2F7%2Fml6tG1DXEIOB9ZvzTpaKv8DCEQQABoMNjM3NDIzMTgzODA1Igxv1XUp%2BHqfjFTjBY0q3ANfDDPtWLUonNGC8vdYuvBalNhMeoS16T4IR3sM4t3XC%2FWt9i2WzTU2gKtTHgN%2FORdDau%2BR1ZUXOdGD9MsvgQ5I3gp2htIS0YI62NI8Xot27AZolcXE0%2Frx%2FMte6qrLhtljREgB1wdq6D4x1%2FQNhqJItoCGqcQJeolrvHDf4M7mEwx5EAuxKy%2FxzSJLrVAuSRY6RkSq2l4Fq6%2FGThpzxERqmEB%2FgLRd3F0kYr%2BZBwmPxBzK8yZh74h9yp2ZASL9%2FhQK1%2BlMkLD%2FbpgQGZjLCib%2BHwXEEve%2FV%2Bj6KQToOSJyr0AAYPMExKYNrQmJEX4w8zdsiiQHNDCBaV2wF7BUI8kaUMMJjbI2qerIAzEWb5X%2B%2Ba4fnVq9W%2BRDUqgysew6vZYJuqxnVuvbcd7zxC%2Boo5MNyBNpCMo6GeCnAv6C8XBq0D%2B4AiHIY6s5SnVrbp%2FaIRrZAel0pvNG3aJcMSCApIW5RNIJkeeOqqk6ifV4aXEIpOHe0NNWLjy%2BkIcvsrYsS3NYvGF1RU6woKQ9Flo%2BqVV%2BUeu%2BJ9QKTHvqUg7cbmD3Th%2Fvyz8jk%2FM5EVld0TqbYOb%2BDZxdzzVvzoptfUl0JkO9ZIfbIIeHi8DsyUIXYtBQPV48c3TCh021HbwZ7jCIse7KBjqkAVAMzr6vxIgwSZl%2BsN6%2FUyptNFBDcnQf81Y0b9RDJt7ZsrRUXMfURzWw%2BHBdv2mdj6eXHz2S%2FfAmh%2BtK%2FNwGuQgyGgdD9yi%2FkZyoIes9ueSxrz7RefRjfTLwF6UuPRYFulb%2FxFXGwVMUYceqx6qGnbUK8f3ahnmR6G3FDx0u11lXe4jZTH1vam0ThL0MDfAQ98anYKf1r02DazuNrO2RiNZ24n%2BC&X-Amz-Signature=c325b37acb67a3eaeba4abf04823c01ea3469a535171ee43f08eb76e335eacfd&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466Q53CLY4U%2F20260105%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260105T122501Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEHsaCXVzLXdlc3QtMiJIMEYCIQDQbmwD7pUgIdpWPgQsZUWzdyqriqdgKJQ7uTlZs%2BEJyQIhAIw5Stymna3U6W3VatPtRK%2F7%2Fml6tG1DXEIOB9ZvzTpaKv8DCEQQABoMNjM3NDIzMTgzODA1Igxv1XUp%2BHqfjFTjBY0q3ANfDDPtWLUonNGC8vdYuvBalNhMeoS16T4IR3sM4t3XC%2FWt9i2WzTU2gKtTHgN%2FORdDau%2BR1ZUXOdGD9MsvgQ5I3gp2htIS0YI62NI8Xot27AZolcXE0%2Frx%2FMte6qrLhtljREgB1wdq6D4x1%2FQNhqJItoCGqcQJeolrvHDf4M7mEwx5EAuxKy%2FxzSJLrVAuSRY6RkSq2l4Fq6%2FGThpzxERqmEB%2FgLRd3F0kYr%2BZBwmPxBzK8yZh74h9yp2ZASL9%2FhQK1%2BlMkLD%2FbpgQGZjLCib%2BHwXEEve%2FV%2Bj6KQToOSJyr0AAYPMExKYNrQmJEX4w8zdsiiQHNDCBaV2wF7BUI8kaUMMJjbI2qerIAzEWb5X%2B%2Ba4fnVq9W%2BRDUqgysew6vZYJuqxnVuvbcd7zxC%2Boo5MNyBNpCMo6GeCnAv6C8XBq0D%2B4AiHIY6s5SnVrbp%2FaIRrZAel0pvNG3aJcMSCApIW5RNIJkeeOqqk6ifV4aXEIpOHe0NNWLjy%2BkIcvsrYsS3NYvGF1RU6woKQ9Flo%2BqVV%2BUeu%2BJ9QKTHvqUg7cbmD3Th%2Fvyz8jk%2FM5EVld0TqbYOb%2BDZxdzzVvzoptfUl0JkO9ZIfbIIeHi8DsyUIXYtBQPV48c3TCh021HbwZ7jCIse7KBjqkAVAMzr6vxIgwSZl%2BsN6%2FUyptNFBDcnQf81Y0b9RDJt7ZsrRUXMfURzWw%2BHBdv2mdj6eXHz2S%2FfAmh%2BtK%2FNwGuQgyGgdD9yi%2FkZyoIes9ueSxrz7RefRjfTLwF6UuPRYFulb%2FxFXGwVMUYceqx6qGnbUK8f3ahnmR6G3FDx0u11lXe4jZTH1vam0ThL0MDfAQ98anYKf1r02DazuNrO2RiNZ24n%2BC&X-Amz-Signature=e02a36e87f7def59f865ba95cb92c6a38c7a0255fdc7b5e840ee4154dcdfb481&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

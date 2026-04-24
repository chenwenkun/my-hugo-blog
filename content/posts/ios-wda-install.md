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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663OKLKND5%2F20260424%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260424T012942Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEKX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCjFgd%2BgjwG6x36ZBxzgf%2FijoyXDWI8NCCVFZ1bI3YH4gIhAKC9oy0S1ewcIVELzMc7o4cANvCZWaUMQJ1cOQmfyJWWKv8DCG4QABoMNjM3NDIzMTgzODA1IgxPrGw6g3Iex2scNToq3AORgciSXYmV86gHBydXCv9XqO5W0CJMvXRbDJ4sWAw8rhyUI7fdOkWZWIB4o2ojujOpg6aEOZnI7860hr%2FQyBkWzaPM4vm8DvSknN1HTFZ%2FKER6H0kk0Lfi1b4Qwsj0rNZVw0ZJqJiaVIQ9V94QCatvnvUPBlXUS%2FoYIIGeeHa6YEdE68USBWVRAZevthaLBIoHNko65CYPhTxsXd3LO3Srk0h41XgYjZ%2FqajSeEQ3m6iCM3qUHSqtb3CBrSb9ZIvrY7xAIW5VUiTtfm2oY0oN4BE6ovsDpmhhb5dj%2BKNbj1oUPwqaAKSU%2B2Y4rxtOjkn%2BuUDu8WFpT2UNR40ISBsPNHinvNJECfzBLvDxRnH2oaktVkj5twqf3lhVwg0AfT8RVi1eLfBRkgdjXjUllEfsKMc5vk2S0HqOG3j4%2Fc78HYVd0lir4pNm6l4mdi6pu%2BV%2FVfUIMFZihoqakhnZVIRJ%2F2AizhOgO068Dty1rwV%2BwVeeUU6LjymHdEs6vnJ%2Bzlu6Gy7dBflHi0ZCONqxmlwdTcGf4ACaSszcEDs5BAhYjsaLU%2FKlu0vPuY3Hmv0TS7TX5GtI9H3KGFLBMaUOd5GYIHiEeF4xM9bfAS%2FZ9AlweEL7Hm9Wg%2Bp4hwYTxtjDKi6rPBjqkAbFnAPCA%2BL4de6yp%2B3JlY8N6jQ7Xz1Ll5CkEwNQTfbOyXbnZeyNNl7hrPepS39TelrVdrY5fnPLVdgsGLcdBECek3TRCU%2BKQFUCdf%2BmxBClb59a0vAeNRNr8TJmQPra%2BVD7bXPzQlGgxr6gyAwDNI3tBzGX%2Fh0tVLC82djQHTqbsMOQQk6DwlVsJLOorkbHxXHmL4ZmY3MhOzkPlYlQPpWYWQfm1&X-Amz-Signature=38d1a56d02aebace9a2525d97b9aeca1092a53acd4e91c7c881929de5f6e4f48&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663OKLKND5%2F20260424%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260424T012942Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEKX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCjFgd%2BgjwG6x36ZBxzgf%2FijoyXDWI8NCCVFZ1bI3YH4gIhAKC9oy0S1ewcIVELzMc7o4cANvCZWaUMQJ1cOQmfyJWWKv8DCG4QABoMNjM3NDIzMTgzODA1IgxPrGw6g3Iex2scNToq3AORgciSXYmV86gHBydXCv9XqO5W0CJMvXRbDJ4sWAw8rhyUI7fdOkWZWIB4o2ojujOpg6aEOZnI7860hr%2FQyBkWzaPM4vm8DvSknN1HTFZ%2FKER6H0kk0Lfi1b4Qwsj0rNZVw0ZJqJiaVIQ9V94QCatvnvUPBlXUS%2FoYIIGeeHa6YEdE68USBWVRAZevthaLBIoHNko65CYPhTxsXd3LO3Srk0h41XgYjZ%2FqajSeEQ3m6iCM3qUHSqtb3CBrSb9ZIvrY7xAIW5VUiTtfm2oY0oN4BE6ovsDpmhhb5dj%2BKNbj1oUPwqaAKSU%2B2Y4rxtOjkn%2BuUDu8WFpT2UNR40ISBsPNHinvNJECfzBLvDxRnH2oaktVkj5twqf3lhVwg0AfT8RVi1eLfBRkgdjXjUllEfsKMc5vk2S0HqOG3j4%2Fc78HYVd0lir4pNm6l4mdi6pu%2BV%2FVfUIMFZihoqakhnZVIRJ%2F2AizhOgO068Dty1rwV%2BwVeeUU6LjymHdEs6vnJ%2Bzlu6Gy7dBflHi0ZCONqxmlwdTcGf4ACaSszcEDs5BAhYjsaLU%2FKlu0vPuY3Hmv0TS7TX5GtI9H3KGFLBMaUOd5GYIHiEeF4xM9bfAS%2FZ9AlweEL7Hm9Wg%2Bp4hwYTxtjDKi6rPBjqkAbFnAPCA%2BL4de6yp%2B3JlY8N6jQ7Xz1Ll5CkEwNQTfbOyXbnZeyNNl7hrPepS39TelrVdrY5fnPLVdgsGLcdBECek3TRCU%2BKQFUCdf%2BmxBClb59a0vAeNRNr8TJmQPra%2BVD7bXPzQlGgxr6gyAwDNI3tBzGX%2Fh0tVLC82djQHTqbsMOQQk6DwlVsJLOorkbHxXHmL4ZmY3MhOzkPlYlQPpWYWQfm1&X-Amz-Signature=b39451fb06e65913a37796b7e1f937ddacdb61387e2dec08418aeacf38a10ba3&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663CNPXHAQ%2F20251030%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251030T005405Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjECgaCXVzLXdlc3QtMiJGMEQCIEzbrnsNf2WJkjLGLSaKkVlW5mDDWTVHsARv%2BVaiXTpSAiBxlrGlUsyOKP4oIJjrEemNF4B8WLiP0gyWO58trsxQwSqIBAjh%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIM%2FbVUBxlIKCpXl9itKtwDeEdT1BUjKA6KkM9%2BAuJWAXTaZIfOJy2XPrTNUDfUtkk0UZ9LsRUqXNCsFDKtzBBt5vrWsew2WfOaw6%2Bti2lvQZEvHFpHB9qLMLKKLJ46j2miHzvIkjMtjgCMvfI7AiAI4hgH1CcVn8PnVDseioMQZrUk6Ek1ZJiQTAVRhVhmkh5nFi9a4m6SxvzfoU883AwUCbv%2FI%2Fl2tIpMNoyCUcr9zKkae5nOGHx%2B1hz8i%2FgkDpBU3CMnV6kDNARf7KS38vYSzrrYNmx%2B4bGeLYmBWoS%2BKwv11T0QzSD1CsAq2FawCtZ7zItlY%2BrT8vQNiLIdICRrpbW9o%2BNszr2dlkDB6Zm7eo%2BMWpyYaAPXtp6vgUnAvhRHpfFYuvI689b5XfeBcZwT8rLk%2F3z5%2B%2FbG6QTARGoV1WQJNiXgQxyPMJ2iOwr7XPh7xtV5rmKQCBI%2Ft3sNC4s5dGuiX0ISKaG9c6AWorD4hp0rDDmx%2FIhAO8MT9dJikPYKcZ4Wq7IxptFOzkodmEVDacCWzOoT0PVzyC8xCSyxhLDpUzWqb8j4yJA1utT%2BxEB8x9zWc24nUe3mHs8QhUJAnGwYxmRgI9x70WmzPe0UhnAE5YpJ6zNJpgJwKx%2F8vrWEKxARKzrOxRtFUwEwotSKyAY6pgE7g%2FL0ggeTxHMLe7dEILaO%2BF4%2FzNN03x0dO%2BQPybkos85ePhVlAcWyeoRUDYGg%2FYCFcuVVVr5OvbHq0i4gJFf0tLHSBHGV4ap1s0YhcDT8CmE2J%2F81d8aP8lZTudvTzwC7CIQS8JmITlvFUdblZmcNLr%2B8ud1r3okzHRCdEVkFmBIMjtlE71aD1IixnHx%2BObwJ0fXeClaGLCaUiWXoNTDOUbRAt2dr&X-Amz-Signature=d2331f64d8996968e2e9b66c9f6677393d4410b15113a891bc44fcf5fe24938f&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663CNPXHAQ%2F20251030%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251030T005404Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjECgaCXVzLXdlc3QtMiJGMEQCIEzbrnsNf2WJkjLGLSaKkVlW5mDDWTVHsARv%2BVaiXTpSAiBxlrGlUsyOKP4oIJjrEemNF4B8WLiP0gyWO58trsxQwSqIBAjh%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIM%2FbVUBxlIKCpXl9itKtwDeEdT1BUjKA6KkM9%2BAuJWAXTaZIfOJy2XPrTNUDfUtkk0UZ9LsRUqXNCsFDKtzBBt5vrWsew2WfOaw6%2Bti2lvQZEvHFpHB9qLMLKKLJ46j2miHzvIkjMtjgCMvfI7AiAI4hgH1CcVn8PnVDseioMQZrUk6Ek1ZJiQTAVRhVhmkh5nFi9a4m6SxvzfoU883AwUCbv%2FI%2Fl2tIpMNoyCUcr9zKkae5nOGHx%2B1hz8i%2FgkDpBU3CMnV6kDNARf7KS38vYSzrrYNmx%2B4bGeLYmBWoS%2BKwv11T0QzSD1CsAq2FawCtZ7zItlY%2BrT8vQNiLIdICRrpbW9o%2BNszr2dlkDB6Zm7eo%2BMWpyYaAPXtp6vgUnAvhRHpfFYuvI689b5XfeBcZwT8rLk%2F3z5%2B%2FbG6QTARGoV1WQJNiXgQxyPMJ2iOwr7XPh7xtV5rmKQCBI%2Ft3sNC4s5dGuiX0ISKaG9c6AWorD4hp0rDDmx%2FIhAO8MT9dJikPYKcZ4Wq7IxptFOzkodmEVDacCWzOoT0PVzyC8xCSyxhLDpUzWqb8j4yJA1utT%2BxEB8x9zWc24nUe3mHs8QhUJAnGwYxmRgI9x70WmzPe0UhnAE5YpJ6zNJpgJwKx%2F8vrWEKxARKzrOxRtFUwEwotSKyAY6pgE7g%2FL0ggeTxHMLe7dEILaO%2BF4%2FzNN03x0dO%2BQPybkos85ePhVlAcWyeoRUDYGg%2FYCFcuVVVr5OvbHq0i4gJFf0tLHSBHGV4ap1s0YhcDT8CmE2J%2F81d8aP8lZTudvTzwC7CIQS8JmITlvFUdblZmcNLr%2B8ud1r3okzHRCdEVkFmBIMjtlE71aD1IixnHx%2BObwJ0fXeClaGLCaUiWXoNTDOUbRAt2dr&X-Amz-Signature=2e34cdefe5ae9698fc5b6077b04efdc591856aedd176834a590a9306e33e6ce2&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

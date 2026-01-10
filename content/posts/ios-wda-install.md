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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4664TNJIM6Q%2F20260110%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260110T181654Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEPj%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQDnIEtsEq2r4hvwlybwAXg1SAsk1kr17wcTgv1f2WPaSgIhAKx3coaaY1sjby49L1LMjeqLTGKL5oOtJ8AJxPY2fE8xKogECMH%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgwHAR8xdnu2Yhtjgskq3AOz1NW4mG5xuE3yxhLXKrXUjFbsuSr5%2FXBx6R5ay2SHEPjFZVgMlzwds%2FJYO%2BVgi7bn4cnMHCi9KL1uG9GJkqU%2FdBDPmMv3hOKtRYmxyP8SMHS%2FJqsxac%2FXAf1GBqnROCOMhKIpT25%2Fykev7n62mNmbUJnrwYUyfux4%2B6TDRBpBlw0r6bXtzo%2FcE4DEXih3twnBK0BmY9Ff7r0uCGjvBJtsCaABRG3XVmU%2FIQdTyv7YQihYiit4VddCgUIMhqR6JY76%2BrtIWERGjZFL8o58uQYp7BNyHBH38hJ6BLhEmsRYdGZouYOE7U9pZUcv%2Fvezn85%2FZ1EnGnbAfp4RxO4S6HBWf0O0J6EAdCClZKPUyDzsoE5lmEwZVmqGHgZtcSAQXT8PE4SlOsc08bHU%2BTSDAyo70SSGrJzt3RdufNokUFXJgmnMTqPrt873vO9vczaO8905SHA%2F0AE0MkgkTdVfz7wf9aDNKWNYIyjLOqICRXD5vHZramYlYjVKZlo%2F8pZmq%2FQxCa6qrXHo%2FU5Sd4ZH4WrIyPAfui4rZE7qbwTMLcZOHdzVq2IuH0WILglXZTH7tvY1R0ypK9OmbBXyPTPp%2Fh2Woapi%2FsPNjFOcD6si5CWkHZzl341eyo1VuuRwTTDz3YnLBjqkAQBE1rwuyOJ9khQVhgdullGKomMip5QIhCaERMQDbyxZHtch%2BK85O2QuPDtTXLCP8WATfR66am5XsZWjOZjXGlAywTLLEBw%2ByKPz0KR2xoRWm2yyMT0RQRD%2FAZuc5LIR%2FYUeXQODKv%2B9cs2dTvBt9cthbCKHHJ5j1GUg6CzCWqSLM79jWgJYJ9jdu4U9OwAbRe1XCuejv%2BoITTJ0AJt68i%2FI4WAq&X-Amz-Signature=a3530a6f835c7d7f270e9d52d955dcbda9c24b1bd70084252af9f42648e765b9&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4664TNJIM6Q%2F20260110%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260110T181654Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEPj%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQDnIEtsEq2r4hvwlybwAXg1SAsk1kr17wcTgv1f2WPaSgIhAKx3coaaY1sjby49L1LMjeqLTGKL5oOtJ8AJxPY2fE8xKogECMH%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgwHAR8xdnu2Yhtjgskq3AOz1NW4mG5xuE3yxhLXKrXUjFbsuSr5%2FXBx6R5ay2SHEPjFZVgMlzwds%2FJYO%2BVgi7bn4cnMHCi9KL1uG9GJkqU%2FdBDPmMv3hOKtRYmxyP8SMHS%2FJqsxac%2FXAf1GBqnROCOMhKIpT25%2Fykev7n62mNmbUJnrwYUyfux4%2B6TDRBpBlw0r6bXtzo%2FcE4DEXih3twnBK0BmY9Ff7r0uCGjvBJtsCaABRG3XVmU%2FIQdTyv7YQihYiit4VddCgUIMhqR6JY76%2BrtIWERGjZFL8o58uQYp7BNyHBH38hJ6BLhEmsRYdGZouYOE7U9pZUcv%2Fvezn85%2FZ1EnGnbAfp4RxO4S6HBWf0O0J6EAdCClZKPUyDzsoE5lmEwZVmqGHgZtcSAQXT8PE4SlOsc08bHU%2BTSDAyo70SSGrJzt3RdufNokUFXJgmnMTqPrt873vO9vczaO8905SHA%2F0AE0MkgkTdVfz7wf9aDNKWNYIyjLOqICRXD5vHZramYlYjVKZlo%2F8pZmq%2FQxCa6qrXHo%2FU5Sd4ZH4WrIyPAfui4rZE7qbwTMLcZOHdzVq2IuH0WILglXZTH7tvY1R0ypK9OmbBXyPTPp%2Fh2Woapi%2FsPNjFOcD6si5CWkHZzl341eyo1VuuRwTTDz3YnLBjqkAQBE1rwuyOJ9khQVhgdullGKomMip5QIhCaERMQDbyxZHtch%2BK85O2QuPDtTXLCP8WATfR66am5XsZWjOZjXGlAywTLLEBw%2ByKPz0KR2xoRWm2yyMT0RQRD%2FAZuc5LIR%2FYUeXQODKv%2B9cs2dTvBt9cthbCKHHJ5j1GUg6CzCWqSLM79jWgJYJ9jdu4U9OwAbRe1XCuejv%2BoITTJ0AJt68i%2FI4WAq&X-Amz-Signature=15a60e3889f7b361d986431b9204615f9b2b63b18c88662d99f2e5652763c9dd&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466RHXV4QSI%2F20260730%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260730T132459Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEM7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIArSGKgJnrv%2F2n9HoiFSZVCE6ukQZ42tS8WlEsvFTG6IAiBzJbWy5%2FnFBNaDfZezrckNXAZ2SdR0s49C8tCxxWRTiyqIBAiW%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMrtwhWYLTiPNFZNLdKtwDGdWI8mY6XxXTaYxj8CmHt0Uagkp9eXk7F%2FXpXouedTg9jxW%2F38KZqQDenTH7e2XPPytT9Rer3ET%2BDoPIHpejluBwkCiKvrF4xEJqP1m1N%2B31uN11Ke7AB9nfcd12fnlQHyCMDlWBvdhGfgJG%2BmJR%2B7cPcqj%2Fa057QIQ7H61KMfDp6njg9hz1zuKAqyLNaFgt6X2X%2Fp%2BEMkhKDBMuzmJvQOEVn5g5TCHh8bu8CS8JIWmO4vSWDkaJojmmTLFLBx7iks2EwsytQGyPe%2Fk%2BbU%2FD%2Br7NC23JiWvQ9gGcXlClhkF7HeFtXKDGlwFZ9WfkreoUuyhEpvziC%2FzqGN%2BAE2vM06uoAxMwGrrWhnqO25XD15M2xsGbGy5MKRkOrSmHnE3eqGPxIfa8AjuAbbPfRFPGx%2BbBMpaSuR1IzPMbpNhe%2BMC6fQ%2FaGtEk9UCJ%2Bm3CD4l0sfCUYc%2Bf8ZqI1s1OZvI%2BQP6XZ5tCX8TJhpW8Idlk3sRqk4TXA%2FkhttHN2G9Q7Nom9bxjUf3aGCEqh%2FFPEVJOSi7hTAXArhrscSGqvQ1tludIeoA5ohUG9KmOx3SOhQOGV%2B9tgGYW38aMAW9j5Dr3UC7nEag2byf5%2FBAcl8rQ%2FntrH7MTkTiJCYmgjUAwqp6t0wY6pgGoYc8xP75T1NIhOD4AgvlZ8dGw5T79hSxczXAMh9rhegjHzO9P9SzW9Rflpr6RezRta2k3QP%2FMXYGPhXaDqsaVAAyOpI9ai3A%2BNtqh0OTnHqo0cW13b3us2US%2F4VaSXR1bmF1MTWvqXYK1lOhNh3N92%2FJe9ZWxpFtPTYhVn3ChAu35Fa5wacBPVKAR2EzkNr6Fgh09760IBYeHU2TxOottbrJOJfNG&X-Amz-Signature=bee7f506399c2ba4c549f2009b9f5bc6fa63c30fec56e67b6641074e8eafd43d&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466RHXV4QSI%2F20260730%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260730T132459Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEM7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIArSGKgJnrv%2F2n9HoiFSZVCE6ukQZ42tS8WlEsvFTG6IAiBzJbWy5%2FnFBNaDfZezrckNXAZ2SdR0s49C8tCxxWRTiyqIBAiW%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMrtwhWYLTiPNFZNLdKtwDGdWI8mY6XxXTaYxj8CmHt0Uagkp9eXk7F%2FXpXouedTg9jxW%2F38KZqQDenTH7e2XPPytT9Rer3ET%2BDoPIHpejluBwkCiKvrF4xEJqP1m1N%2B31uN11Ke7AB9nfcd12fnlQHyCMDlWBvdhGfgJG%2BmJR%2B7cPcqj%2Fa057QIQ7H61KMfDp6njg9hz1zuKAqyLNaFgt6X2X%2Fp%2BEMkhKDBMuzmJvQOEVn5g5TCHh8bu8CS8JIWmO4vSWDkaJojmmTLFLBx7iks2EwsytQGyPe%2Fk%2BbU%2FD%2Br7NC23JiWvQ9gGcXlClhkF7HeFtXKDGlwFZ9WfkreoUuyhEpvziC%2FzqGN%2BAE2vM06uoAxMwGrrWhnqO25XD15M2xsGbGy5MKRkOrSmHnE3eqGPxIfa8AjuAbbPfRFPGx%2BbBMpaSuR1IzPMbpNhe%2BMC6fQ%2FaGtEk9UCJ%2Bm3CD4l0sfCUYc%2Bf8ZqI1s1OZvI%2BQP6XZ5tCX8TJhpW8Idlk3sRqk4TXA%2FkhttHN2G9Q7Nom9bxjUf3aGCEqh%2FFPEVJOSi7hTAXArhrscSGqvQ1tludIeoA5ohUG9KmOx3SOhQOGV%2B9tgGYW38aMAW9j5Dr3UC7nEag2byf5%2FBAcl8rQ%2FntrH7MTkTiJCYmgjUAwqp6t0wY6pgGoYc8xP75T1NIhOD4AgvlZ8dGw5T79hSxczXAMh9rhegjHzO9P9SzW9Rflpr6RezRta2k3QP%2FMXYGPhXaDqsaVAAyOpI9ai3A%2BNtqh0OTnHqo0cW13b3us2US%2F4VaSXR1bmF1MTWvqXYK1lOhNh3N92%2FJe9ZWxpFtPTYhVn3ChAu35Fa5wacBPVKAR2EzkNr6Fgh09760IBYeHU2TxOottbrJOJfNG&X-Amz-Signature=d338fb920e9c4d10b27865a35753af02aec7aa8e550b05a3b7448a323db89bd2&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466QTYTQRHL%2F20251129%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251129T061623Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEP3%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQC3J0RoZLZ90FY04HIFqh2Moh%2BrFDxmBpDxQk4M5mePrQIgPnqzprTSCwAhhmTzbqt4LyLEV2hZT3I6Gwt8E3eD6wsqiAQIxv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDA7yaC43u7015rG%2FECrcAzxn4qHNqsyJbCbvICtQOTsnjv6mxvDnoo2%2FNOk7cGYZKZKWxwgs%2B7ru8lDgkoruSmuJ%2Fa7zrTQTXjPzM5Mb7SG2ixcz0SynlHAMyzrYSCKExqGkft7xLsuZ5HX5srHhAO%2ByoSytteXsLaWAqJbgJdRMBaura%2FKzEwi%2FuClC2s5Mh%2BvShIVRiMtc1SL%2FSgElqQuygj2kGBPHAAVjHjZ2bG4UH4txQi1t0eP4Hw645ENMfqK7Hy8CWUeRx0gJQj0nf8G209CN5%2FA6UqknnAKesrGee5%2FuCYm5G5O2Lhv%2BU903wW7qHAKzWwDnE52beCaXQeRJKHymmcOfF6YXtyfXs5tSga5yskt8p6AwGz%2B1DaYgMuqbnbMriWH9%2Fru%2BSV8bj0w0uhI9WGBYFY9JSUqKJa2FLeZg%2FgzAY8SQZ0LUgPXcO3MlEdMeqO%2Fx1kjbrAHyQgGrp%2Bg%2FUcmlkWSH02BTxjEVjmRX4SAFzQkiMAMnZjb9w1gfdkO7YHbe9HdJa8gmxaTnllx0HZ2vySDbJ2QcjHXJF0ecy3%2FZC9d0a%2FIaqD4%2FGjCksKzdmi7CuiQqTlR6rsnj4f03LzOMgt0qCaKo1UEzhtt7dUmN%2BL7md81oeAE2w%2FlSsSfXxaz4N%2FEJMNfxqckGOqUBUDK02TfFuk1OHqUb2IqwWCNisjI6Ql0j74Qu3AGlK8pVVZpXkwvuWfUc2Q%2BzqkjmsxCQjeipoF%2FAa8LDY%2BgMPikMJiutbNQaLH9MDG3aQBO8SyQnJWZlHTTBJeCWclTslF1mIdk34u1PYx%2BcGoul9%2BRszrmELhpGvtIKIUzEbU3Be%2FOavY6jXOOHwc0k%2BSQekfh8XhWUDZLEijPZJEUj5i4jlW4Q&X-Amz-Signature=5442844ee215c1210d07f428ecd71a345feccddf2a65c140692939c5a4b224a1&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466QTYTQRHL%2F20251129%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251129T061623Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEP3%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQC3J0RoZLZ90FY04HIFqh2Moh%2BrFDxmBpDxQk4M5mePrQIgPnqzprTSCwAhhmTzbqt4LyLEV2hZT3I6Gwt8E3eD6wsqiAQIxv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDA7yaC43u7015rG%2FECrcAzxn4qHNqsyJbCbvICtQOTsnjv6mxvDnoo2%2FNOk7cGYZKZKWxwgs%2B7ru8lDgkoruSmuJ%2Fa7zrTQTXjPzM5Mb7SG2ixcz0SynlHAMyzrYSCKExqGkft7xLsuZ5HX5srHhAO%2ByoSytteXsLaWAqJbgJdRMBaura%2FKzEwi%2FuClC2s5Mh%2BvShIVRiMtc1SL%2FSgElqQuygj2kGBPHAAVjHjZ2bG4UH4txQi1t0eP4Hw645ENMfqK7Hy8CWUeRx0gJQj0nf8G209CN5%2FA6UqknnAKesrGee5%2FuCYm5G5O2Lhv%2BU903wW7qHAKzWwDnE52beCaXQeRJKHymmcOfF6YXtyfXs5tSga5yskt8p6AwGz%2B1DaYgMuqbnbMriWH9%2Fru%2BSV8bj0w0uhI9WGBYFY9JSUqKJa2FLeZg%2FgzAY8SQZ0LUgPXcO3MlEdMeqO%2Fx1kjbrAHyQgGrp%2Bg%2FUcmlkWSH02BTxjEVjmRX4SAFzQkiMAMnZjb9w1gfdkO7YHbe9HdJa8gmxaTnllx0HZ2vySDbJ2QcjHXJF0ecy3%2FZC9d0a%2FIaqD4%2FGjCksKzdmi7CuiQqTlR6rsnj4f03LzOMgt0qCaKo1UEzhtt7dUmN%2BL7md81oeAE2w%2FlSsSfXxaz4N%2FEJMNfxqckGOqUBUDK02TfFuk1OHqUb2IqwWCNisjI6Ql0j74Qu3AGlK8pVVZpXkwvuWfUc2Q%2BzqkjmsxCQjeipoF%2FAa8LDY%2BgMPikMJiutbNQaLH9MDG3aQBO8SyQnJWZlHTTBJeCWclTslF1mIdk34u1PYx%2BcGoul9%2BRszrmELhpGvtIKIUzEbU3Be%2FOavY6jXOOHwc0k%2BSQekfh8XhWUDZLEijPZJEUj5i4jlW4Q&X-Amz-Signature=859fd325f7259f75de7c6dc5a3116e840041aff9bb57d8a1a552aa0b9d9c91a8&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

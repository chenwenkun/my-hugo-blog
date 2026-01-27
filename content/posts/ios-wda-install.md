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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466VZRDGIUE%2F20260127%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260127T010213Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEID%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQDB1zCsCxdJSCfg8IpyttIeOpvJJEG4k%2BhsjvrUS8mYngIgDtEDo7abxfT%2BapfzF4Qh%2Bhl4hZC17SSgWHvgyqFlGacq%2FwMISRAAGgw2Mzc0MjMxODM4MDUiDH2OFkBrZimQDW7xSircA9Rk7o8L95aLT6H64mq%2FQx7ho%2F38eX71TMbm9EBtFDLTI7ujXWvkWgLmHWiqphwx2kwfVYyk2ODh7UgnJkvcCTO7wXRPCzSgpal7Dzjf7RUdbSms6SH7h5uqsdDo3WMUBywSSgyFGDxEqyZv5lE%2FH9XwB53Lesi8Rjvp3l9%2BPvNWX048LWf13YiLcmLulYue8cqVou2Tt%2Byc42scqHOGK05%2Fd3qcU%2FqpVZGRXBaaEJHJzZXqeggH9KAqjDqI45NB%2FpOiQ9HCWd1wAKG2d1%2Bi4nXgyqIIrkHX1gxeUCDrKpbGtflbBItUd8vf8pJKJ5XJ82QZesLRlUjPBA7ZovS7uukdUlnbifMfUBt9gpFiNzZun2v%2Bnumnv1i5arnMFC4Qz0pv4nF%2FlIXAvGVxzV4vYcAK%2FXun%2BqtFmeezWBvxmfu5BhYulkiOxkvmxnTCn9SQKpb088vMkwbQL5bdBmHh0oquRiRhv4u0FBFR69jTOBTGHtneh3R2yxisJkdBBOXLaKWleFhK1%2FonDwRztBpNZU1FSxSsFjo2LUKkrijm3vyeQ7Whbgo6HV8rlPh7laH9STb9Q%2Fkh9%2FVNNhO6EysNodKHsGCr6J0%2FSK7cKZulxLvRv13Jwf6oXBGyuOlXMOj%2B38sGOqUB7o4PDswfSuYTOiCnuaMwJxByN7x0%2B87jV63ub2GcyD4WAcWm02v4UtsGKWZpKr0cTcGR6oFM9cH8J2pLyrJ%2Bp%2FiuAQoow6e7y4F5FnNDt0UGIssDYwQ3yJAzYtZ97beu7lJ0EEuFKfQBqH0G4XeRgcLDjTQhFMIFV%2BW%2BpIRaSpxfUC84o3mEw7I1KusaSlk7w0WnLxGDWRQhP9UlzdE60FHnVije&X-Amz-Signature=d62ac30ecd52a729dd206346157a0338b9db6d74679be9f33c4e58f98d922b8d&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466VZRDGIUE%2F20260127%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260127T010213Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEID%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQDB1zCsCxdJSCfg8IpyttIeOpvJJEG4k%2BhsjvrUS8mYngIgDtEDo7abxfT%2BapfzF4Qh%2Bhl4hZC17SSgWHvgyqFlGacq%2FwMISRAAGgw2Mzc0MjMxODM4MDUiDH2OFkBrZimQDW7xSircA9Rk7o8L95aLT6H64mq%2FQx7ho%2F38eX71TMbm9EBtFDLTI7ujXWvkWgLmHWiqphwx2kwfVYyk2ODh7UgnJkvcCTO7wXRPCzSgpal7Dzjf7RUdbSms6SH7h5uqsdDo3WMUBywSSgyFGDxEqyZv5lE%2FH9XwB53Lesi8Rjvp3l9%2BPvNWX048LWf13YiLcmLulYue8cqVou2Tt%2Byc42scqHOGK05%2Fd3qcU%2FqpVZGRXBaaEJHJzZXqeggH9KAqjDqI45NB%2FpOiQ9HCWd1wAKG2d1%2Bi4nXgyqIIrkHX1gxeUCDrKpbGtflbBItUd8vf8pJKJ5XJ82QZesLRlUjPBA7ZovS7uukdUlnbifMfUBt9gpFiNzZun2v%2Bnumnv1i5arnMFC4Qz0pv4nF%2FlIXAvGVxzV4vYcAK%2FXun%2BqtFmeezWBvxmfu5BhYulkiOxkvmxnTCn9SQKpb088vMkwbQL5bdBmHh0oquRiRhv4u0FBFR69jTOBTGHtneh3R2yxisJkdBBOXLaKWleFhK1%2FonDwRztBpNZU1FSxSsFjo2LUKkrijm3vyeQ7Whbgo6HV8rlPh7laH9STb9Q%2Fkh9%2FVNNhO6EysNodKHsGCr6J0%2FSK7cKZulxLvRv13Jwf6oXBGyuOlXMOj%2B38sGOqUB7o4PDswfSuYTOiCnuaMwJxByN7x0%2B87jV63ub2GcyD4WAcWm02v4UtsGKWZpKr0cTcGR6oFM9cH8J2pLyrJ%2Bp%2FiuAQoow6e7y4F5FnNDt0UGIssDYwQ3yJAzYtZ97beu7lJ0EEuFKfQBqH0G4XeRgcLDjTQhFMIFV%2BW%2BpIRaSpxfUC84o3mEw7I1KusaSlk7w0WnLxGDWRQhP9UlzdE60FHnVije&X-Amz-Signature=0e6b43009ee585b8a3be1fd18d346f0feebffae5817e879eaa67be70e033e0ae&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

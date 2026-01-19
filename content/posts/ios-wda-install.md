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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466WUGHVKHJ%2F20260119%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260119T062420Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEMX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIH93V4LTjl6G20foe5hhq2OPObDpo2SLRspQmeCYeSrtAiEAnamjpbRzGIps6yMuUvwzkUWlPvo1uYmwGTHh1%2BCm%2BGIqiAQIjv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDBs1%2FKH4hQOuuUkFCCrcAyXNS3kAoKDcam7cab6cYcQudJo478sopVeZKUtW7AmrDapQRRAKWX8fIqqPxz6uV%2Fex%2FjUK%2FfSV1i4bqD1VdBis%2F2dYZ6o0F%2FYxPSqX1bYCgb7uTTDDuzj2AetUfE7h1m95wV%2FYAHrM9ixb%2F3bezPI54wtBbrNGjvAOpHUep28ot7sNa4vTL37GeAupZEHYijCC0YZIisO368pKAOyo3DOR8r6F8uM%2FinuvlX2X2rIMlxwYu1ZyQKc1SHdy8s%2BpB%2FCiNxD%2Frg6ieGTVaIgsmxiIhTrvP0SW5VsUAePGUKuJIlFiuOVywAGoJznlEdbk0%2BKpBTScQ0CWKgT1gE6LRmXZrjZsyq35lgYraONf3e5LXA5ii%2BdhTVQzcmmbAt0jpA5WAU7x0EsUzrgOCyA%2FVIhLAo8EEpNlZUfDqLehx%2Fo57t1nw33oqSQka9sb5ZCT%2F9zoSxUXp%2BED3lxfq5aFJT6s93D%2FShOIor1BB%2B1hlwCkAu04o5F5jhldnUw84nLXsEnD9L7Lz%2BW3L7UKjCHymZ%2BSuqpQj1WAdl%2FmWCFy02l1Ee9zQ2NiWA8KrAFTXfLYZjQPVKo%2BM%2BW2CoxVvvcVCXnQefwEhqlzX7ioSZ4iWOmeDtL3OgDbVL08UY9nMIT4tssGOqUB8casLFF%2BlFndzossZVxRGFBuqEOy1Vb8GgQDptNwKfTZqmbftR0m89WLENvLjb7O8nlJd%2F0mQDLG%2B21GYuLB3O9qGkVLdgoy4OmD4NJ31iQzAXvbsJ3WJeZmP3ubwZno5LnPkzngSljDdhoDV3LdUsmFN6u5nrdekQlhw5R5TUdO9lhzYWEjwzfrh1OqUI8gDg%2F2vP7Pjf9z8Wi0QNDzPpqKsCSY&X-Amz-Signature=2e139c525a4991b2f4823b99e84440f1fc1106ed60f4e6f311ab41ba8ab83ccd&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466WUGHVKHJ%2F20260119%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260119T062420Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEMX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIH93V4LTjl6G20foe5hhq2OPObDpo2SLRspQmeCYeSrtAiEAnamjpbRzGIps6yMuUvwzkUWlPvo1uYmwGTHh1%2BCm%2BGIqiAQIjv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDBs1%2FKH4hQOuuUkFCCrcAyXNS3kAoKDcam7cab6cYcQudJo478sopVeZKUtW7AmrDapQRRAKWX8fIqqPxz6uV%2Fex%2FjUK%2FfSV1i4bqD1VdBis%2F2dYZ6o0F%2FYxPSqX1bYCgb7uTTDDuzj2AetUfE7h1m95wV%2FYAHrM9ixb%2F3bezPI54wtBbrNGjvAOpHUep28ot7sNa4vTL37GeAupZEHYijCC0YZIisO368pKAOyo3DOR8r6F8uM%2FinuvlX2X2rIMlxwYu1ZyQKc1SHdy8s%2BpB%2FCiNxD%2Frg6ieGTVaIgsmxiIhTrvP0SW5VsUAePGUKuJIlFiuOVywAGoJznlEdbk0%2BKpBTScQ0CWKgT1gE6LRmXZrjZsyq35lgYraONf3e5LXA5ii%2BdhTVQzcmmbAt0jpA5WAU7x0EsUzrgOCyA%2FVIhLAo8EEpNlZUfDqLehx%2Fo57t1nw33oqSQka9sb5ZCT%2F9zoSxUXp%2BED3lxfq5aFJT6s93D%2FShOIor1BB%2B1hlwCkAu04o5F5jhldnUw84nLXsEnD9L7Lz%2BW3L7UKjCHymZ%2BSuqpQj1WAdl%2FmWCFy02l1Ee9zQ2NiWA8KrAFTXfLYZjQPVKo%2BM%2BW2CoxVvvcVCXnQefwEhqlzX7ioSZ4iWOmeDtL3OgDbVL08UY9nMIT4tssGOqUB8casLFF%2BlFndzossZVxRGFBuqEOy1Vb8GgQDptNwKfTZqmbftR0m89WLENvLjb7O8nlJd%2F0mQDLG%2B21GYuLB3O9qGkVLdgoy4OmD4NJ31iQzAXvbsJ3WJeZmP3ubwZno5LnPkzngSljDdhoDV3LdUsmFN6u5nrdekQlhw5R5TUdO9lhzYWEjwzfrh1OqUI8gDg%2F2vP7Pjf9z8Wi0QNDzPpqKsCSY&X-Amz-Signature=d0fcda5dfd960842f3ee65c7dce9a05747476badf1a598a2c0144655fac3e805&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

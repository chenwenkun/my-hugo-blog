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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4662RXO3IO5%2F20260303%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260303T011223Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEMj%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQDfpfTVfKQipSKI3pieglzoVJHzrBU%2BnZnnpng%2BxwQ2EAIgfTDD%2BCVtFgd871A1jW2bUVQbp4Flr6P2akuow%2FCx5pMqiAQIkP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDMIxzG%2BNZqrp4lbs1CrcA%2B98wSbGtFOE9Yd9Ceyyc3WweaHGZeP%2B57kBoUzFFP4B4AA%2FzuF4Iz7tZGrEJkMMk6IqEJS1WzjpBFMrQyogOanLk0Kziuey420vtK03UeNyx6zoPTHtrkPCMp%2FclmhxS%2Fwnih8j3%2FqrxpGxzhDRGKzxoWUlmwLC4AwHFbUiEqqwjjoFx05kGXy9e9%2Fvi%2FDJBHhYajHAtRSKvER3tf%2BP4FoBZiwckTGHQYbEM88PM5ahfEb7f8UKWYEHkBXHD7Ev0lit1KBw%2BFgFbY7GOfChHzlPcFJl4wtZ5ViFSlsWs0ik3XLZ3a2BgCaikYJgogXneUtTEAt5F6rrfq9cbFtVYr9MXJiDf5%2FNXZBg2r6T3O%2Fsxw9%2Fduy4mq%2Fe9brvsrPWscpfsAMkVgS1Vwso2GeUqNeiwNF%2BK7yALEGjVKEyY%2BFOJAO%2BETPYFrcoONL%2BpWGIsfIn4qOolOUk9%2BJ04q9cz%2BhsVmdaFk3Byg%2BkVbuIi3ud0lv6gHoOkwxHGUcqbeqyurzIzUbZlD%2FQCZNK29cIPHGciNB4iVdCAWcs%2F%2FJ7CI0jjFJfbf5fjIW6gVCkBKeu5Df2Zm426E15xHCw07dnzjEbVWbjIyDyiFr6ghxGheePXPvu363vbmpUTLsFMPK1mM0GOqUBPXPDD5RZV%2Fnz7IC1ZQkl2m07ultHcPF5OV5a95RNrBzPsE2KQ2ESDZsC%2B1OlhvnMWuBIPY9HjxKs2FRuyWKb0icrR34lSBbgZyeQxd3XsBopbePRRG9GNKUGYel8Nw9KuIZYocsceeN9%2Bw5QWWHtOsTImoqtkStpQXIcI8bmg%2F1LR3v2nAe4jkCrFA96zC3l0rpGTyA7w8Ps30uXJGKwd210%2FL%2By&X-Amz-Signature=e67b16ee50741e76e1cd8a71da90042852d7402053abd8f0504d3fd190a150a5&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4662RXO3IO5%2F20260303%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260303T011223Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEMj%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQDfpfTVfKQipSKI3pieglzoVJHzrBU%2BnZnnpng%2BxwQ2EAIgfTDD%2BCVtFgd871A1jW2bUVQbp4Flr6P2akuow%2FCx5pMqiAQIkP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDMIxzG%2BNZqrp4lbs1CrcA%2B98wSbGtFOE9Yd9Ceyyc3WweaHGZeP%2B57kBoUzFFP4B4AA%2FzuF4Iz7tZGrEJkMMk6IqEJS1WzjpBFMrQyogOanLk0Kziuey420vtK03UeNyx6zoPTHtrkPCMp%2FclmhxS%2Fwnih8j3%2FqrxpGxzhDRGKzxoWUlmwLC4AwHFbUiEqqwjjoFx05kGXy9e9%2Fvi%2FDJBHhYajHAtRSKvER3tf%2BP4FoBZiwckTGHQYbEM88PM5ahfEb7f8UKWYEHkBXHD7Ev0lit1KBw%2BFgFbY7GOfChHzlPcFJl4wtZ5ViFSlsWs0ik3XLZ3a2BgCaikYJgogXneUtTEAt5F6rrfq9cbFtVYr9MXJiDf5%2FNXZBg2r6T3O%2Fsxw9%2Fduy4mq%2Fe9brvsrPWscpfsAMkVgS1Vwso2GeUqNeiwNF%2BK7yALEGjVKEyY%2BFOJAO%2BETPYFrcoONL%2BpWGIsfIn4qOolOUk9%2BJ04q9cz%2BhsVmdaFk3Byg%2BkVbuIi3ud0lv6gHoOkwxHGUcqbeqyurzIzUbZlD%2FQCZNK29cIPHGciNB4iVdCAWcs%2F%2FJ7CI0jjFJfbf5fjIW6gVCkBKeu5Df2Zm426E15xHCw07dnzjEbVWbjIyDyiFr6ghxGheePXPvu363vbmpUTLsFMPK1mM0GOqUBPXPDD5RZV%2Fnz7IC1ZQkl2m07ultHcPF5OV5a95RNrBzPsE2KQ2ESDZsC%2B1OlhvnMWuBIPY9HjxKs2FRuyWKb0icrR34lSBbgZyeQxd3XsBopbePRRG9GNKUGYel8Nw9KuIZYocsceeN9%2Bw5QWWHtOsTImoqtkStpQXIcI8bmg%2F1LR3v2nAe4jkCrFA96zC3l0rpGTyA7w8Ps30uXJGKwd210%2FL%2By&X-Amz-Signature=17d1fc453eeb86d44047fcee6c4638ee17d5c02f647121a0fe2e304e74742f41&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

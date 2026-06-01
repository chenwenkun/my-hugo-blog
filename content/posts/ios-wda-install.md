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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466Z24ESSQO%2F20260601%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260601T171450Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEEkaCXVzLXdlc3QtMiJHMEUCIQC%2F1gQFV7JL%2Fx%2Bd5UHtpM%2Bt4BpWdM50HOJQEdFOIottAAIgMDpAAF76r5xhrSXaCk2iI77d8fyk6MSBfvi4qRVSkxEq%2FwMIEhAAGgw2Mzc0MjMxODM4MDUiDPndtyOrIj884xe2aCrcA3dnaBgOHXp9MX%2FtuVpSLJU%2FJFn5ZzAQ668IcAnCcxEUXmzknM3yqX2ltHeCjJPVEjnPoN8lcP6P1GPPebjaYVQ8EXVfyhujMhstLsiK4uR6%2Fkz3qNwMl6xcG5N5I61Et1Y%2BcCDPQUSZwZECNpC%2FWHKORKGdGhovUe6jodj0i2wVKVPb%2B0Y4xDsUHfLwNcqILnkVF%2F6%2B11Tj0I4M1j8echhMeUdSGEtlL2o2partX7wJY5SJdKu5wl%2FynIiFPsETGIKFkiWPCiFjbFvWXFmjCTvuTOZLorORfNolGmA0KUAPkt7fWFWgAIstcepfJ7JXrf6wT7Bb5aKreZe2JUTcoit1giDqe%2BfHy1MbzJnUxS0KCh4HRNLFfT9zjNwUlIZzp1Xi4R0tgt7rXuQwTFdYbnEhb1dmyj%2B4juIxwypNVQN6hcvdNjOyT4pdbzQLnix0Ar3qhidnOPtw4OMEjly%2B1onP3Fa5xQttXsdCXFON4cmzbGOV3BLPuKr1Jo9L%2FyrE6xXKE%2B%2Bk%2BZEmhxPhAouXlcI%2FujEqISIsR8GsDDUBprMAaEV38aDC%2BHaYZNi%2B7vmogu4%2BQDHupFvE2C7v7s%2FhboIcnStVB9VqB5eTSUE4lLfxcT3gjrujcICvufFUMNXq9tAGOqUBPmkEsMsA%2FpXi%2BtUW2JdBGv1FfUDrGmB57TGP2HHHXzlSkj6ArWRsAYjYl3NGSFc2IIOqe1EGnu9Ln%2FLbI565GKUooxj0F6O8lREWQmW2ChyCO3JFbaOqxWku7ZNnMEcoZ9sO%2B6UDzYRICiRLGVZgjcPIqz6KlGpRfNIhVvldw9DsveiXJ7cn%2F1gz9Aq%2FpM9oP7hGKL03VusEtoDKc474sec46otF&X-Amz-Signature=0379a8403adeeb90935c495519c03aba3486432ab71ab245838d3a4d35e4836d&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466Z24ESSQO%2F20260601%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260601T171450Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEEkaCXVzLXdlc3QtMiJHMEUCIQC%2F1gQFV7JL%2Fx%2Bd5UHtpM%2Bt4BpWdM50HOJQEdFOIottAAIgMDpAAF76r5xhrSXaCk2iI77d8fyk6MSBfvi4qRVSkxEq%2FwMIEhAAGgw2Mzc0MjMxODM4MDUiDPndtyOrIj884xe2aCrcA3dnaBgOHXp9MX%2FtuVpSLJU%2FJFn5ZzAQ668IcAnCcxEUXmzknM3yqX2ltHeCjJPVEjnPoN8lcP6P1GPPebjaYVQ8EXVfyhujMhstLsiK4uR6%2Fkz3qNwMl6xcG5N5I61Et1Y%2BcCDPQUSZwZECNpC%2FWHKORKGdGhovUe6jodj0i2wVKVPb%2B0Y4xDsUHfLwNcqILnkVF%2F6%2B11Tj0I4M1j8echhMeUdSGEtlL2o2partX7wJY5SJdKu5wl%2FynIiFPsETGIKFkiWPCiFjbFvWXFmjCTvuTOZLorORfNolGmA0KUAPkt7fWFWgAIstcepfJ7JXrf6wT7Bb5aKreZe2JUTcoit1giDqe%2BfHy1MbzJnUxS0KCh4HRNLFfT9zjNwUlIZzp1Xi4R0tgt7rXuQwTFdYbnEhb1dmyj%2B4juIxwypNVQN6hcvdNjOyT4pdbzQLnix0Ar3qhidnOPtw4OMEjly%2B1onP3Fa5xQttXsdCXFON4cmzbGOV3BLPuKr1Jo9L%2FyrE6xXKE%2B%2Bk%2BZEmhxPhAouXlcI%2FujEqISIsR8GsDDUBprMAaEV38aDC%2BHaYZNi%2B7vmogu4%2BQDHupFvE2C7v7s%2FhboIcnStVB9VqB5eTSUE4lLfxcT3gjrujcICvufFUMNXq9tAGOqUBPmkEsMsA%2FpXi%2BtUW2JdBGv1FfUDrGmB57TGP2HHHXzlSkj6ArWRsAYjYl3NGSFc2IIOqe1EGnu9Ln%2FLbI565GKUooxj0F6O8lREWQmW2ChyCO3JFbaOqxWku7ZNnMEcoZ9sO%2B6UDzYRICiRLGVZgjcPIqz6KlGpRfNIhVvldw9DsveiXJ7cn%2F1gz9Aq%2FpM9oP7hGKL03VusEtoDKc474sec46otF&X-Amz-Signature=836b6a55d7e6c79aad658896eea49edeffda1c901f3b392f63636a204fbcd332&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

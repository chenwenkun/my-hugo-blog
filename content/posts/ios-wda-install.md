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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4666RCWYLPL%2F20260712%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260712T075758Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEBgaCXVzLXdlc3QtMiJHMEUCIQDx%2Ba4VCYF5AMROXAWMDgRRITAfuq%2Fo1p9KJgFmV5FKrwIgPSfoURH3%2FYVSNPfdedwkWeREL0crM1WKGHq88xHupPoqiAQI4f%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDHffTZnr%2F1ah0NHZoyrcA8RubHqJyo3EOnKDKdsm4bRtSmF%2BJbLdRtFTewQ5R1TvCnISTinhhdD9Reyqd9GL1R2E%2FTH4qV5K7dR5gPIRrN3i042sI0lnLP%2FoXxmq%2BIimK9ckfhq5PpFjdLpVVbdiMvAUyBLl71PwKx%2BLedyOpDZkiL0roNpDPcg1ntjM1YXJenRoqompzQ5awX8ak9OXKHfov4pcE6UH%2FRUuXsf20yy350%2FoVKW7rT49ePxQG3qXJhRwAvJNkR8VjA%2FJciEf1KlHuNpW%2B6%2Fft8AXsWm0L59huQdD4BaB%2Fm0iGbqMXycLdVge1cDlMc7SQ7ztSvGoc3bNuHPsET3E9L6bAUggYb1MCnlxP5jJ%2FA6Eew%2Bb0i92XkFDevXIQqZ6mCLe%2FcV65poRLjwKU1lKr6uB0uQyT140z5fRN%2F2yep%2FMgsAofBfLX4PvvOJL9AGMg5vUuCPn08x8mvENcV4uFZ9wbzhcu5jYMKlWSLKtde%2Fof7eAWZbLdbVh2ZLed77B5MH%2FlvfsWPK5ItSqQWj%2Fp%2FFeSx0JnVCVzQhbw8tP59rkOJkFdssHF0qdm9Efs3rIu%2FSmL1V565WtC7vp5mRXqAR1weqMO%2BX6VM2WEQ2JXB0cUSc8Xvg7Emo64xWzqfNbIkntMJqJzdIGOqUB2gv7wmuZwvG75jmmow13Wm8n5I57X4ZwsMAaS1Kw4QtKd%2BD8DI5ySu4kur7Afuj4RpkVAJr%2F3Rce2j1QMEABKa5sNp%2BV0v2hWbcQfzKVZfk7Gj5JIi%2BCtaRZxkgXg4uu2JfNt1YMzhezziycryKea3UPryR%2FcqW%2FSY9Pfp99gL3nmMDQh4NfOUyb9j5VcbiU9IegSQUMr3A4eVRt%2FKjp736ops4p&X-Amz-Signature=829944b977b254020dc0deb56c549b5ae4e2255f1a369579826638421fc77627&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4666RCWYLPL%2F20260712%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260712T075757Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEBgaCXVzLXdlc3QtMiJHMEUCIQDx%2Ba4VCYF5AMROXAWMDgRRITAfuq%2Fo1p9KJgFmV5FKrwIgPSfoURH3%2FYVSNPfdedwkWeREL0crM1WKGHq88xHupPoqiAQI4f%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDHffTZnr%2F1ah0NHZoyrcA8RubHqJyo3EOnKDKdsm4bRtSmF%2BJbLdRtFTewQ5R1TvCnISTinhhdD9Reyqd9GL1R2E%2FTH4qV5K7dR5gPIRrN3i042sI0lnLP%2FoXxmq%2BIimK9ckfhq5PpFjdLpVVbdiMvAUyBLl71PwKx%2BLedyOpDZkiL0roNpDPcg1ntjM1YXJenRoqompzQ5awX8ak9OXKHfov4pcE6UH%2FRUuXsf20yy350%2FoVKW7rT49ePxQG3qXJhRwAvJNkR8VjA%2FJciEf1KlHuNpW%2B6%2Fft8AXsWm0L59huQdD4BaB%2Fm0iGbqMXycLdVge1cDlMc7SQ7ztSvGoc3bNuHPsET3E9L6bAUggYb1MCnlxP5jJ%2FA6Eew%2Bb0i92XkFDevXIQqZ6mCLe%2FcV65poRLjwKU1lKr6uB0uQyT140z5fRN%2F2yep%2FMgsAofBfLX4PvvOJL9AGMg5vUuCPn08x8mvENcV4uFZ9wbzhcu5jYMKlWSLKtde%2Fof7eAWZbLdbVh2ZLed77B5MH%2FlvfsWPK5ItSqQWj%2Fp%2FFeSx0JnVCVzQhbw8tP59rkOJkFdssHF0qdm9Efs3rIu%2FSmL1V565WtC7vp5mRXqAR1weqMO%2BX6VM2WEQ2JXB0cUSc8Xvg7Emo64xWzqfNbIkntMJqJzdIGOqUB2gv7wmuZwvG75jmmow13Wm8n5I57X4ZwsMAaS1Kw4QtKd%2BD8DI5ySu4kur7Afuj4RpkVAJr%2F3Rce2j1QMEABKa5sNp%2BV0v2hWbcQfzKVZfk7Gj5JIi%2BCtaRZxkgXg4uu2JfNt1YMzhezziycryKea3UPryR%2FcqW%2FSY9Pfp99gL3nmMDQh4NfOUyb9j5VcbiU9IegSQUMr3A4eVRt%2FKjp736ops4p&X-Amz-Signature=7f5a79c758bcf325552079e2e2ed65bbb811071ea4508b289a35a01b70768652&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

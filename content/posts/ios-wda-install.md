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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4662GLK7PFX%2F20260502%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260502T014746Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEGoaCXVzLXdlc3QtMiJIMEYCIQCXiepsTNPSiaucB17y0bYwRhfENO%2FHlblrgc7IcKaanAIhAI3paDPUdeKhktnvsJfPVg5t1XKLARiVPB7lULo5GL0wKv8DCDMQABoMNjM3NDIzMTgzODA1IgxIKBwA3b6ltBXyhEcq3AOLNIX74iWVVx5qDEhwP%2BEuLsl68bwCznXxaKJRNdes6GRguX92kezEtEllnzKF92cgJ8rzVbTrEGVxOdhPVvKKWEG%2FUFgkF4k%2F%2FhNoiIqv3nqCg3vzjAmgsfGBHJZBM%2BNCGUV8s5Vf93ih2Qn3%2BnXWuH2fvO%2BUedDItwiLTE0P0FWwzF%2FRqWhEkAYacaumfYN9%2BLCiqz720dLpZe%2BIKofVLWX3adwaBIWlbbAccz6dC2VuaR1%2BQDqePbjrg%2Fgam%2BxD7DXH1UXG4ysLwxrTopQ103K8N6mUnlb8WKO2wIuPvgHlmXwaOKSbSkTJ4oQ5o1%2B3XyCsQM0J8F1btc7jtobKv%2F%2BHYNxZHjK8WBe3HudXURsJDxDKnon31qNFRxw6hfHWtrX3u87kZ3qvuK13fObtBoHNOQfVvpTa4%2Bh5LqLLnwBOAL0Ypb8xyZU8nSkGMWRtxGUWZTqg23cFwPeGtEGxmRypvihUYSf%2FSH05ZS10Udd0fDPviNr9cgNAl%2FgBElestkL%2BTpXBfEl2CneMgVUjcOsDBPur9ujCL0ifsx6iLE2OtI3BZCguTV%2FBHvTVTRFDcg2TQD4Atcx%2BriMMwu4NTA2e3%2Bqm%2FG1OOxZLtMy3BHuTz4NHlL8MlV8NfjClqNXPBjqkAddRuFO2qrwKcVDySDelhGwfOhXFCAJauvOivODPxVoS5XHTsVdZA7RDAPnML3xwKGEj5VY8mhAAW7kIaCfL3bJaoi8n8vWI63f87ECZfcIzEp9W9%2BnWqNAatS7evwxAe9%2BWbtf%2FWqhS%2Fz1wlkUa91zP1qcNn60%2FyniiF6Bvr2LjGPcZeT%2FA%2B0Gw1Hrsimyfoa44G47oouMbsncmK06O1icnhv7T&X-Amz-Signature=f3e9b3503cda199279d997a57da5fd24e5cbbb303af2aa0c151b9df2d039258c&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4662GLK7PFX%2F20260502%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260502T014746Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEGoaCXVzLXdlc3QtMiJIMEYCIQCXiepsTNPSiaucB17y0bYwRhfENO%2FHlblrgc7IcKaanAIhAI3paDPUdeKhktnvsJfPVg5t1XKLARiVPB7lULo5GL0wKv8DCDMQABoMNjM3NDIzMTgzODA1IgxIKBwA3b6ltBXyhEcq3AOLNIX74iWVVx5qDEhwP%2BEuLsl68bwCznXxaKJRNdes6GRguX92kezEtEllnzKF92cgJ8rzVbTrEGVxOdhPVvKKWEG%2FUFgkF4k%2F%2FhNoiIqv3nqCg3vzjAmgsfGBHJZBM%2BNCGUV8s5Vf93ih2Qn3%2BnXWuH2fvO%2BUedDItwiLTE0P0FWwzF%2FRqWhEkAYacaumfYN9%2BLCiqz720dLpZe%2BIKofVLWX3adwaBIWlbbAccz6dC2VuaR1%2BQDqePbjrg%2Fgam%2BxD7DXH1UXG4ysLwxrTopQ103K8N6mUnlb8WKO2wIuPvgHlmXwaOKSbSkTJ4oQ5o1%2B3XyCsQM0J8F1btc7jtobKv%2F%2BHYNxZHjK8WBe3HudXURsJDxDKnon31qNFRxw6hfHWtrX3u87kZ3qvuK13fObtBoHNOQfVvpTa4%2Bh5LqLLnwBOAL0Ypb8xyZU8nSkGMWRtxGUWZTqg23cFwPeGtEGxmRypvihUYSf%2FSH05ZS10Udd0fDPviNr9cgNAl%2FgBElestkL%2BTpXBfEl2CneMgVUjcOsDBPur9ujCL0ifsx6iLE2OtI3BZCguTV%2FBHvTVTRFDcg2TQD4Atcx%2BriMMwu4NTA2e3%2Bqm%2FG1OOxZLtMy3BHuTz4NHlL8MlV8NfjClqNXPBjqkAddRuFO2qrwKcVDySDelhGwfOhXFCAJauvOivODPxVoS5XHTsVdZA7RDAPnML3xwKGEj5VY8mhAAW7kIaCfL3bJaoi8n8vWI63f87ECZfcIzEp9W9%2BnWqNAatS7evwxAe9%2BWbtf%2FWqhS%2Fz1wlkUa91zP1qcNn60%2FyniiF6Bvr2LjGPcZeT%2FA%2B0Gw1Hrsimyfoa44G47oouMbsncmK06O1icnhv7T&X-Amz-Signature=1dcf02092f3aa78563b168bb5d816987e93a3b8c574cd0269e7cc52d614fddd6&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

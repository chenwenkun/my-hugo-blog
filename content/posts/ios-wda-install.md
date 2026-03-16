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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466SNDHUHUN%2F20260316%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260316T012004Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEAAaCXVzLXdlc3QtMiJHMEUCIBVJaeX2jgb3pIjUiRKdfh%2Boyts3%2Bu4hZJTLwLdIyN8IAiEA%2FwW%2F1pCXscvUoliNSZTdW%2BX4gGlPbkHhciYQJ4uAfZMqiAQIyf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDFwU4YA3N1BAlPju7yrcA1QD2p2h3u3UHKkfdKWHdupwae%2BxEPayA5WLQqvWuWBdU2vxl4XZm5UaOm2tmcqkjTdy4FWhxrKOFf9V6DlYkKy5bBYwL0ukkza84xAgy5Efup8Ih8Wb8gH2WN5uRFnjiehQN01CH9JyrL1npWR%2FHqYp0JKXEPzm2dXjuRQUhSkAi7KPxagfmwg9WKZAdQm%2BPyh23n3Otx616dM%2FcSPFX5J1NxPYieM%2BtYzkisxvDrdIt9y3%2FTpXBz2%2F33LylzWwyajZroo5wlyJKu156WmPSYMkJQuSiei2VWxFh37HArN3M%2Bwz47E9Kyuqz3O2CnCbqMxHVAreHS4y7Q%2Ba3V7cCxsIXCDIRZ5hvoQCF4p0LnY77pMJOxdNuPUvTAcG92NyMeM00Dc3awvMYNCZ3yC043QOrL%2FfrGWs3AVxb3a3Nm4xM9VbzwKcCfMSCUUvU1944uBevDUIBmaZqgd6Nkv%2FFM8kBqWJXCIkdDx1v7NcfFxtWlyOTFHIX8pxvpf8fYP1pwT%2BV%2FBLMaIzPUi3yddRV6BHbczOnDpAKF7TghSxRezINtLeWFd4sfj%2BzIePolpjy5S2QxN5odPsdExePhlhEfrQYSQHAhJ9vWTJIvIGH9LTjNbiwvG7eS5on6XlMKmX3c0GOqUB5y0omQy5MKlDMosUzlreEpSeQqmdTjMLSuRxeEkKeq1Hd8qtvP1ENpElEqmyIXhb4s1FjOeG1%2B8SDZOoz8MsUZM7kmHyrsszbRes69d4VxVuPiLMsqbaulujVOXQWNpxgBQ4oC1uZHFBch8TlAxjvGQ6vn%2Baj8D2DRg7nDEdEQ%2FHsR3upu%2FlonKYEmWLOhqTsyIbhH0%2Bh2b8DTzJrnL3JUgm8glw&X-Amz-Signature=7a088c38de88392ff463aadab4183ecf2e14f7167e9e8c7c280efeb235b28a15&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466SNDHUHUN%2F20260316%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260316T012004Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEAAaCXVzLXdlc3QtMiJHMEUCIBVJaeX2jgb3pIjUiRKdfh%2Boyts3%2Bu4hZJTLwLdIyN8IAiEA%2FwW%2F1pCXscvUoliNSZTdW%2BX4gGlPbkHhciYQJ4uAfZMqiAQIyf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDFwU4YA3N1BAlPju7yrcA1QD2p2h3u3UHKkfdKWHdupwae%2BxEPayA5WLQqvWuWBdU2vxl4XZm5UaOm2tmcqkjTdy4FWhxrKOFf9V6DlYkKy5bBYwL0ukkza84xAgy5Efup8Ih8Wb8gH2WN5uRFnjiehQN01CH9JyrL1npWR%2FHqYp0JKXEPzm2dXjuRQUhSkAi7KPxagfmwg9WKZAdQm%2BPyh23n3Otx616dM%2FcSPFX5J1NxPYieM%2BtYzkisxvDrdIt9y3%2FTpXBz2%2F33LylzWwyajZroo5wlyJKu156WmPSYMkJQuSiei2VWxFh37HArN3M%2Bwz47E9Kyuqz3O2CnCbqMxHVAreHS4y7Q%2Ba3V7cCxsIXCDIRZ5hvoQCF4p0LnY77pMJOxdNuPUvTAcG92NyMeM00Dc3awvMYNCZ3yC043QOrL%2FfrGWs3AVxb3a3Nm4xM9VbzwKcCfMSCUUvU1944uBevDUIBmaZqgd6Nkv%2FFM8kBqWJXCIkdDx1v7NcfFxtWlyOTFHIX8pxvpf8fYP1pwT%2BV%2FBLMaIzPUi3yddRV6BHbczOnDpAKF7TghSxRezINtLeWFd4sfj%2BzIePolpjy5S2QxN5odPsdExePhlhEfrQYSQHAhJ9vWTJIvIGH9LTjNbiwvG7eS5on6XlMKmX3c0GOqUB5y0omQy5MKlDMosUzlreEpSeQqmdTjMLSuRxeEkKeq1Hd8qtvP1ENpElEqmyIXhb4s1FjOeG1%2B8SDZOoz8MsUZM7kmHyrsszbRes69d4VxVuPiLMsqbaulujVOXQWNpxgBQ4oC1uZHFBch8TlAxjvGQ6vn%2Baj8D2DRg7nDEdEQ%2FHsR3upu%2FlonKYEmWLOhqTsyIbhH0%2Bh2b8DTzJrnL3JUgm8glw&X-Amz-Signature=b5fdbe8a65d032135eb27acde4c7b4b95e137b05a0aeb511e9781ceed55cd6ea&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

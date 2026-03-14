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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466WCTLDGIX%2F20260314%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260314T010840Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjENH%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQDjeAaffvl1Jrf00B6woc9UPBDD4j0PskzzjVJc8mz4iQIhAID31M3%2FyKGelW8xmJ5t6ijagL%2FSWGZ%2FauCbmYF3d0xUKogECJr%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgxLQN1HKCLuowuI2AEq3AMKaAtsyBds9UtZkTbkl7OvcKexktaTEhVUBVGCJxWiG7DKRxly3jvOuh6xzch9E1gklIw8aza6qn7gLBGn5fHgLjgNwc7lQbAuSKl7YiE8lEwz94I84TJaStKU%2B9g9wmZbvJpyUr03y9I8DCWdPGWDrLlCdO2IcE36YtDcynlTI9WAGTT71Kd%2B9uVLsiFwM%2BN8mjrTSI73lUHvvN4tnN8ZTm0cGPI3rEJkCddDE0Arx6WviG3pQ6Z4ggdbnvCpxiqxD9aodraZi0Pok7eDLkntZ42Z5mpneuT9PoT2NDGGT%2BBPJThmq681J7%2BjVZku237SQBw8dBO1CTpBa8Q6Avgz8epP%2FSH8TRrroGG6OhUDdClGEvA4szDHDMd%2BOG5F9JiJcW3xIDjBa7MXrzc%2BoWbKE6n93pKFFM2nulTBhLX6GGdyCqgXaO3qgwxsZtm7qE2ElRc%2F2PRlHBB1%2FkysctldB%2F1BLgfp%2FZDejc821twe0PQf8oXeGwLZOYTJbjB2lnxpx9eFXC17dfjM2vxv9J3%2BWuHvK4ADPBvELRKvXcUmjzKhZEwkS9FNSCvIRej8nYbPk25u74gUYl2Fo9to36EzNA6rM4lkxiHeDhhU2I1cGQxArTRj8i9uNSElADCZ3NLNBjqkAfWDT1%2BkIGzqYRTQ1g5jbomSneR93KShZYQh5XoYbO9R91Sqf%2BgnW3AcDHOx5yNU4Kw%2FMrLpy3dprDd8mweGPQtz9ZLbsKnL96XyP2E9RbI9Qa0F8%2F57ztOloGsstWOlc9XEzb3330T%2Fzun7oK14LNjfXlSs44KMdsPcrTDJ0D1b4mqpaKDS5fAATv56TTeDn%2BrTlky2%2FQXwcNf96vs40ev7CxaE&X-Amz-Signature=615ac1ac3f7d71ab1028a2b4c34bf9b39ef18f64e4ce0a0f08910bc82bf89f7e&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466WCTLDGIX%2F20260314%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260314T010840Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjENH%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQDjeAaffvl1Jrf00B6woc9UPBDD4j0PskzzjVJc8mz4iQIhAID31M3%2FyKGelW8xmJ5t6ijagL%2FSWGZ%2FauCbmYF3d0xUKogECJr%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgxLQN1HKCLuowuI2AEq3AMKaAtsyBds9UtZkTbkl7OvcKexktaTEhVUBVGCJxWiG7DKRxly3jvOuh6xzch9E1gklIw8aza6qn7gLBGn5fHgLjgNwc7lQbAuSKl7YiE8lEwz94I84TJaStKU%2B9g9wmZbvJpyUr03y9I8DCWdPGWDrLlCdO2IcE36YtDcynlTI9WAGTT71Kd%2B9uVLsiFwM%2BN8mjrTSI73lUHvvN4tnN8ZTm0cGPI3rEJkCddDE0Arx6WviG3pQ6Z4ggdbnvCpxiqxD9aodraZi0Pok7eDLkntZ42Z5mpneuT9PoT2NDGGT%2BBPJThmq681J7%2BjVZku237SQBw8dBO1CTpBa8Q6Avgz8epP%2FSH8TRrroGG6OhUDdClGEvA4szDHDMd%2BOG5F9JiJcW3xIDjBa7MXrzc%2BoWbKE6n93pKFFM2nulTBhLX6GGdyCqgXaO3qgwxsZtm7qE2ElRc%2F2PRlHBB1%2FkysctldB%2F1BLgfp%2FZDejc821twe0PQf8oXeGwLZOYTJbjB2lnxpx9eFXC17dfjM2vxv9J3%2BWuHvK4ADPBvELRKvXcUmjzKhZEwkS9FNSCvIRej8nYbPk25u74gUYl2Fo9to36EzNA6rM4lkxiHeDhhU2I1cGQxArTRj8i9uNSElADCZ3NLNBjqkAfWDT1%2BkIGzqYRTQ1g5jbomSneR93KShZYQh5XoYbO9R91Sqf%2BgnW3AcDHOx5yNU4Kw%2FMrLpy3dprDd8mweGPQtz9ZLbsKnL96XyP2E9RbI9Qa0F8%2F57ztOloGsstWOlc9XEzb3330T%2Fzun7oK14LNjfXlSs44KMdsPcrTDJ0D1b4mqpaKDS5fAATv56TTeDn%2BrTlky2%2FQXwcNf96vs40ev7CxaE&X-Amz-Signature=e49a5ffd47fd7add2be3df3a40601b87c096340d54f1b22b85e0d13111e15d4a&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

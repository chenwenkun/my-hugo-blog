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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4662YCKJ24U%2F20251109%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251109T181428Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjECkaCXVzLXdlc3QtMiJIMEYCIQDIh%2FpNJBW6G0p1M%2FBlHlS6AQrv0B8jUc%2B%2Bc9oDhnyDcgIhAMBCq1BUHYOlFm7P9isoqqCn125SRmAN1rF8OMurQEGpKogECPL%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1Igze84%2BN4c8YOfR%2F0kkq3AM7%2FMElbME%2BvLkayonR6Dd55HUd%2BIEsmossdydrWYOJfDKKe6R7hZE2iBaU2aHOlsHNq8wnm2s%2BU8I6mQKlXRBRW%2BWbjI0FrQ%2FTSJR6pu0vSk4OCImu0z6fl4%2BiMo%2BDDyljY97rnp9YZtZ8jyWf3KEHCxIGV%2FLvMS5jYN0LbV7j059zIbNuLDl58NwKG9WzYFbdD6gK2x7a%2FwptJnR4esdwd845vKUYwD%2BrqqqjQRuvFMTFBa7gGgDNM%2B2J6eBTxBquAzKd0Mw8zI7M6ENvjniN0Xd7m3968%2B0yVUyH30K46z2ZwPW9eNZPvyQFl7zPS3b3EEVqGbWrHQ30JGebn6Vs8XRInKOP6KKYmQXf663qmuat2d7i4qrvc9sezWp4ZbuHSM66tR8yV2QOZtbcpRkuu3EoiKtgXd0lcQQyOIUfW94vp5c90zsO2LhoqfbTNmcUCL2lHvKi4aktZ6yOElcBluSd7VNJztZRwzi1mcdBQciq0XIcyge2%2B4BOl2OoyrXWzSRIRU4eL5SzK5XC2rn8xCHnMP4JI2aEmceN8vOBpBa8RHJFQpo5OctoYoCKrZUAMM0MDKoF3ViN%2FPWon4BAfhKY1Ds7Y%2FdWTuJyvR2JaY5XyS2%2FK6U%2BzF31EDDKlcPIBjqkAQZNzEDGbjerItuuBXnNFa%2F4vS4LAV9HaWEP7halT04igpSovzVezTlgAW01uA2jLLSLn73gzOfgH3oz8n9iNXhlIW%2FWWBjIW8juR8HZLNkPTzOOk4bORE5Mx1FUdwuMCsF1kGuStxyYEBGMyQup%2BTQ0Qk%2BwL54W1mgWLs7MKTGZvfB863QV1%2FL9r0nh6UfENaAw95hVtgZZHxEtCLjNULpo9agN&X-Amz-Signature=62e2cf666623854574c675dbb9ef4c9463238c535339686899d524100a818761&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4662YCKJ24U%2F20251109%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251109T181428Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjECkaCXVzLXdlc3QtMiJIMEYCIQDIh%2FpNJBW6G0p1M%2FBlHlS6AQrv0B8jUc%2B%2Bc9oDhnyDcgIhAMBCq1BUHYOlFm7P9isoqqCn125SRmAN1rF8OMurQEGpKogECPL%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1Igze84%2BN4c8YOfR%2F0kkq3AM7%2FMElbME%2BvLkayonR6Dd55HUd%2BIEsmossdydrWYOJfDKKe6R7hZE2iBaU2aHOlsHNq8wnm2s%2BU8I6mQKlXRBRW%2BWbjI0FrQ%2FTSJR6pu0vSk4OCImu0z6fl4%2BiMo%2BDDyljY97rnp9YZtZ8jyWf3KEHCxIGV%2FLvMS5jYN0LbV7j059zIbNuLDl58NwKG9WzYFbdD6gK2x7a%2FwptJnR4esdwd845vKUYwD%2BrqqqjQRuvFMTFBa7gGgDNM%2B2J6eBTxBquAzKd0Mw8zI7M6ENvjniN0Xd7m3968%2B0yVUyH30K46z2ZwPW9eNZPvyQFl7zPS3b3EEVqGbWrHQ30JGebn6Vs8XRInKOP6KKYmQXf663qmuat2d7i4qrvc9sezWp4ZbuHSM66tR8yV2QOZtbcpRkuu3EoiKtgXd0lcQQyOIUfW94vp5c90zsO2LhoqfbTNmcUCL2lHvKi4aktZ6yOElcBluSd7VNJztZRwzi1mcdBQciq0XIcyge2%2B4BOl2OoyrXWzSRIRU4eL5SzK5XC2rn8xCHnMP4JI2aEmceN8vOBpBa8RHJFQpo5OctoYoCKrZUAMM0MDKoF3ViN%2FPWon4BAfhKY1Ds7Y%2FdWTuJyvR2JaY5XyS2%2FK6U%2BzF31EDDKlcPIBjqkAQZNzEDGbjerItuuBXnNFa%2F4vS4LAV9HaWEP7halT04igpSovzVezTlgAW01uA2jLLSLn73gzOfgH3oz8n9iNXhlIW%2FWWBjIW8juR8HZLNkPTzOOk4bORE5Mx1FUdwuMCsF1kGuStxyYEBGMyQup%2BTQ0Qk%2BwL54W1mgWLs7MKTGZvfB863QV1%2FL9r0nh6UfENaAw95hVtgZZHxEtCLjNULpo9agN&X-Amz-Signature=ab121462682d4e7f8bf6bbe9c60ad1b2d33687a9f257a67d8ca7e9a9a1553c0f&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

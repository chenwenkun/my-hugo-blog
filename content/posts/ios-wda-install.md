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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4665OEC725K%2F20260409%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260409T125810Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEEsaCXVzLXdlc3QtMiJIMEYCIQDxub52Y6vg%2FCN75390%2F0P1aeF2OePgqqI1nICeRVmAOAIhALbXYFy5lDXBJY9fUgeiZJpIA6tFlGiGeKIrIuxjRfcdKv8DCBQQABoMNjM3NDIzMTgzODA1IgwUrVZyHoQ7fJDV1NEq3AOfmNVtvJV%2FrTLGOzi199WqhZ5EZXKg8Saav2Fl3eAa5M%2BcEEB5vtSQUhS%2FKH2plGBiEZeTkzeRzaNekddgje%2FHTXVNc1%2BH1q2BcX297qC8X1bJ2RSKyGDpqKdfvnoLu0X%2BqaOyPaULR1Ro0p3pTQ4ngaocoR%2BCNXqSciHFqVv3siVczV4x1FPBsht0kbQS2%2F%2BeJZZRAO9J2JnDRW6XGGZ7v%2BITryf%2BKWrVPXWH1F5i5srv91Kuc3vYnjhoEJALGcVDFuiJNvDOVfZ%2Fvp3cdVsFJz97BKL%2Bn68YKt3KttvVpE%2Blav0HoMSK56BA%2BlJZE8K4ttv1yJKncW9Sm3c3ONL6FO23gm7OhlF8KSCkLgPSGQI%2F77YPgJ0JL6yvs5m3bRuHbn7y1VXkvTgXP6wbiAeNtTIexl1PY1hIeVghS%2B%2FgZdutJv88fNcPoilJAWd%2FrxmsWzf4VzKojwylyJ%2FXdRsAoAbnllXtjl6z6ExpiK%2FhO0aEx6Gky5zGFpt7BM0XsLzhlU6uaj1TsF6QuEFBAi03LI8yEqofI%2FgevI6nvd64hVedNkh4tVTL2C7cD6iYSLGuSBoV2PaXYdYric10QyIjbIgbRPdQR%2BfjPdNUTqJ%2BpmiZMEhP%2BnO9GJ%2F2vTCMlN7OBjqkATlPSWi3TBtHgglb1MlTwMp5en3EphaYitCMfVaRH8voS7atbid%2B%2Bxt735fkpboOcH4NmNfr6JI8%2BAXGPw3hGfkIondr2P56fxcUtENkQ9DzuzSd87X7f9x5Zgw%2FpeSTNLrmJqN4%2FWYbyKLD5Q4QNeRlqZxu%2B%2F7lIONvyTDVID4NO9IDg26DDS0iTzHksJzYAvNdH5KkHKvhXFJ%2F%2FJ%2FOtWWmGPs0&X-Amz-Signature=8906be1fadd5f20058537c7b2eee1af3f1ed1cfd756df4b12ac2433a657ea8b2&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4665OEC725K%2F20260409%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260409T125810Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEEsaCXVzLXdlc3QtMiJIMEYCIQDxub52Y6vg%2FCN75390%2F0P1aeF2OePgqqI1nICeRVmAOAIhALbXYFy5lDXBJY9fUgeiZJpIA6tFlGiGeKIrIuxjRfcdKv8DCBQQABoMNjM3NDIzMTgzODA1IgwUrVZyHoQ7fJDV1NEq3AOfmNVtvJV%2FrTLGOzi199WqhZ5EZXKg8Saav2Fl3eAa5M%2BcEEB5vtSQUhS%2FKH2plGBiEZeTkzeRzaNekddgje%2FHTXVNc1%2BH1q2BcX297qC8X1bJ2RSKyGDpqKdfvnoLu0X%2BqaOyPaULR1Ro0p3pTQ4ngaocoR%2BCNXqSciHFqVv3siVczV4x1FPBsht0kbQS2%2F%2BeJZZRAO9J2JnDRW6XGGZ7v%2BITryf%2BKWrVPXWH1F5i5srv91Kuc3vYnjhoEJALGcVDFuiJNvDOVfZ%2Fvp3cdVsFJz97BKL%2Bn68YKt3KttvVpE%2Blav0HoMSK56BA%2BlJZE8K4ttv1yJKncW9Sm3c3ONL6FO23gm7OhlF8KSCkLgPSGQI%2F77YPgJ0JL6yvs5m3bRuHbn7y1VXkvTgXP6wbiAeNtTIexl1PY1hIeVghS%2B%2FgZdutJv88fNcPoilJAWd%2FrxmsWzf4VzKojwylyJ%2FXdRsAoAbnllXtjl6z6ExpiK%2FhO0aEx6Gky5zGFpt7BM0XsLzhlU6uaj1TsF6QuEFBAi03LI8yEqofI%2FgevI6nvd64hVedNkh4tVTL2C7cD6iYSLGuSBoV2PaXYdYric10QyIjbIgbRPdQR%2BfjPdNUTqJ%2BpmiZMEhP%2BnO9GJ%2F2vTCMlN7OBjqkATlPSWi3TBtHgglb1MlTwMp5en3EphaYitCMfVaRH8voS7atbid%2B%2Bxt735fkpboOcH4NmNfr6JI8%2BAXGPw3hGfkIondr2P56fxcUtENkQ9DzuzSd87X7f9x5Zgw%2FpeSTNLrmJqN4%2FWYbyKLD5Q4QNeRlqZxu%2B%2F7lIONvyTDVID4NO9IDg26DDS0iTzHksJzYAvNdH5KkHKvhXFJ%2F%2FJ%2FOtWWmGPs0&X-Amz-Signature=e66c68601c1cc7b431523ca2943deb05fe236a8a6f8c64c2264f2de66c71e885&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

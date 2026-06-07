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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663SCX6F5G%2F20260607%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260607T190457Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjENr%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQD5w6tpr9AgKu8mcaAMYaZjPP2PUD%2BrcXs7Eub8NBc7%2FgIgHoTny36WtLWBVEQPY001VMnLc8EOomuhTqBuBwBGOjoqiAQIo%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDGf9hnkh%2BL%2BI5y2ldCrcA%2FQDwgLiaF4cSncIVLggM2H97cPaxhK8uxC1fdF%2F53BlQecGEfqH%2FwahlT18FUCqpGWBoIDOO2gWoWb3TmqoMpYYmj6ejh700fdgP6BMk7nYDBUiFUk46qiyry7HwXq4OOXm3oZS%2Fu0ggjCSx%2FKABrsKs0G4eNO%2BF5tI3%2FxakWeXBWYu7RkVaaNN41VbpV6LAMG4YB%2Fo%2BZ4l6gp4MKc%2FOiP0p5k3DEiCtzsalV9SokbLWIybCcZ%2Bnox2Elffipw7KTJG%2BpeVGewMU0NKW2XCSXcZLKMW%2Bhri9gjzlM9Ifp6keVr5fIa%2FabKdUu%2BjJhjddRAmYyA7CrQ4ImVpKNPFP2eoXZjIFgf61MQMrG31fse7%2Fq0WDNd1eJoyq2R6a%2BhaeBl7hWHVc1eMqgoA7VAuMp4uyiY8WO%2FNSsWk9qLkDTrWZUl3HZM21wyWUqZ6eAYBX8rknw23rigyPW%2B2m%2B8PHPl7oAZ1hYfOnNKFLaoO6%2F6lxVkAgy5S%2B41eQFNkczLgmnerThiTaGhEYCVk77L%2B1uoFqlKAgAvCx1abfYjuWwCjAkfAj7v7mwuIPPk%2B3SMywVPguvoZ5UCcxgS%2BDscwmPGxr7zsekV1OLGKGqvC3RtlGRimYyrpAlGJ26v%2BMKLjltEGOqUB83bSdFbL0061xASl1fskngE8pyx1pS3qHTTX%2FeOV2TuWaR%2BfH2ZrOYgXw4VERfiUzivFrGenb9oZXnoCu2GuiSXENKBBsAcrEVNC9MY%2FbI%2F%2F8qY%2FQPJXG8hTucZLFfczLsEs3jVejGfQsdyoDt22wYCkqIxUHuKSUcqHOJpof%2FJVA6dVL8Ffvh3bhYT4Tpg%2FvVB4imTQ5SbjC78p1nTYPOgzC8zl&X-Amz-Signature=967b6241554685736b9e3ef0ba65d3f565ee30ec650180260d0bf770870dc9f8&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663SCX6F5G%2F20260607%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260607T190457Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjENr%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQD5w6tpr9AgKu8mcaAMYaZjPP2PUD%2BrcXs7Eub8NBc7%2FgIgHoTny36WtLWBVEQPY001VMnLc8EOomuhTqBuBwBGOjoqiAQIo%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDGf9hnkh%2BL%2BI5y2ldCrcA%2FQDwgLiaF4cSncIVLggM2H97cPaxhK8uxC1fdF%2F53BlQecGEfqH%2FwahlT18FUCqpGWBoIDOO2gWoWb3TmqoMpYYmj6ejh700fdgP6BMk7nYDBUiFUk46qiyry7HwXq4OOXm3oZS%2Fu0ggjCSx%2FKABrsKs0G4eNO%2BF5tI3%2FxakWeXBWYu7RkVaaNN41VbpV6LAMG4YB%2Fo%2BZ4l6gp4MKc%2FOiP0p5k3DEiCtzsalV9SokbLWIybCcZ%2Bnox2Elffipw7KTJG%2BpeVGewMU0NKW2XCSXcZLKMW%2Bhri9gjzlM9Ifp6keVr5fIa%2FabKdUu%2BjJhjddRAmYyA7CrQ4ImVpKNPFP2eoXZjIFgf61MQMrG31fse7%2Fq0WDNd1eJoyq2R6a%2BhaeBl7hWHVc1eMqgoA7VAuMp4uyiY8WO%2FNSsWk9qLkDTrWZUl3HZM21wyWUqZ6eAYBX8rknw23rigyPW%2B2m%2B8PHPl7oAZ1hYfOnNKFLaoO6%2F6lxVkAgy5S%2B41eQFNkczLgmnerThiTaGhEYCVk77L%2B1uoFqlKAgAvCx1abfYjuWwCjAkfAj7v7mwuIPPk%2B3SMywVPguvoZ5UCcxgS%2BDscwmPGxr7zsekV1OLGKGqvC3RtlGRimYyrpAlGJ26v%2BMKLjltEGOqUB83bSdFbL0061xASl1fskngE8pyx1pS3qHTTX%2FeOV2TuWaR%2BfH2ZrOYgXw4VERfiUzivFrGenb9oZXnoCu2GuiSXENKBBsAcrEVNC9MY%2FbI%2F%2F8qY%2FQPJXG8hTucZLFfczLsEs3jVejGfQsdyoDt22wYCkqIxUHuKSUcqHOJpof%2FJVA6dVL8Ffvh3bhYT4Tpg%2FvVB4imTQ5SbjC78p1nTYPOgzC8zl&X-Amz-Signature=8092e8b6850308e0d6939b7f88acd5b07594d19edc5bc10ce1ffa5a10a58fd46&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

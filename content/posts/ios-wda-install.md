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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4667MFOF24L%2F20251114%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251114T005338Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJD%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQCvAO%2Fkazlx8zmgY1gF9Q3BzHntZgqN8X2V69V4SBN5wgIgZxMVvrHEgVcevJiWTg%2BsYCUGJMcnTCey7%2BPDRnOVguwq%2FwMIWRAAGgw2Mzc0MjMxODM4MDUiDDT44e55RpMRXHchEircA8mKOC9y3ojwm88r4BFyhH0Yk1Wi6nUeTlIHTDcBw65ZNIoPoUB0eqHga1mQ4MZ%2FyAarGSfzQIPjGcJxG8MWx0pyQf0aTVEZZTP7U549XPl7xpRtz6sxujmHXpHgXXM27Qs8SS0ZcflxWTQcCVnrfiV9FkQTkwHIiDUBnxeqO1U1FfTjDXY87GTKtzdVvbzY0%2Fg7DdrTrYSVbSoq%2FCr0l5N1DLX3gFByOQIaOlpN9VXNcd07epiqHOoWum1uGKEtBSw3e%2BoEbzWhXsdS7BYT1UB86euEKKxDEJ7wbLET8Un%2FNmDX1fhBLBu2Uq9MZmpM%2B1NX0NOcsgw2TPVk%2Fnd3akt06d9IpZDxyPwP1dv095kI%2BQ4Jg4UEjA%2B5nPl1n8bFHPpaVbvQ8fwMUuLHzclG6ls0ZoyF4oBEQDpSbNdnnM328Fmt4y08Z3%2BlrINRuHCwLrqKP8nN6T2lCn0oDMwZ%2FFzZwf8o3fUy4MESQI02Q5E%2BEJl6SNBGkyeFvCNEN%2FTq2Hf9zQN0Au%2F2gAw0jLIqGPVTWTN2cu5GPuLC53KxeiS4D2IsW3iyLBUkXZ2LWVv4TaW5OVy5HYa%2BiYGa5gRqtiOPPWodJKwa%2BOHVDnrTEhtwdnYHsDelzP6gK66lMKvm2cgGOqUBzyLFB5lWFabhVzYc2ZMtSotUzXIJLxKBdQEiVVZx0tRCcrF9MNOQKTLrZZj8It53zOZ3%2BXKSG2xJmCpDyXoSefsbIUCxvbmF5v4lQjpSrTLafftFYKPsYzyUG%2BERRBfa4sm970mg0OYBQXqOXRTgDS6zJCf9Is4K8LxOxAziW1sm6hrDl%2BniwDmrhxE794SvFyM%2BSemEj87bSdvzT2e3L883GXot&X-Amz-Signature=3601ff7a0a05ac24b80e690e2063af3bc1a1fb604f485f0ae61f6ad236fdbc04&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4667MFOF24L%2F20251114%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251114T005338Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJD%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQCvAO%2Fkazlx8zmgY1gF9Q3BzHntZgqN8X2V69V4SBN5wgIgZxMVvrHEgVcevJiWTg%2BsYCUGJMcnTCey7%2BPDRnOVguwq%2FwMIWRAAGgw2Mzc0MjMxODM4MDUiDDT44e55RpMRXHchEircA8mKOC9y3ojwm88r4BFyhH0Yk1Wi6nUeTlIHTDcBw65ZNIoPoUB0eqHga1mQ4MZ%2FyAarGSfzQIPjGcJxG8MWx0pyQf0aTVEZZTP7U549XPl7xpRtz6sxujmHXpHgXXM27Qs8SS0ZcflxWTQcCVnrfiV9FkQTkwHIiDUBnxeqO1U1FfTjDXY87GTKtzdVvbzY0%2Fg7DdrTrYSVbSoq%2FCr0l5N1DLX3gFByOQIaOlpN9VXNcd07epiqHOoWum1uGKEtBSw3e%2BoEbzWhXsdS7BYT1UB86euEKKxDEJ7wbLET8Un%2FNmDX1fhBLBu2Uq9MZmpM%2B1NX0NOcsgw2TPVk%2Fnd3akt06d9IpZDxyPwP1dv095kI%2BQ4Jg4UEjA%2B5nPl1n8bFHPpaVbvQ8fwMUuLHzclG6ls0ZoyF4oBEQDpSbNdnnM328Fmt4y08Z3%2BlrINRuHCwLrqKP8nN6T2lCn0oDMwZ%2FFzZwf8o3fUy4MESQI02Q5E%2BEJl6SNBGkyeFvCNEN%2FTq2Hf9zQN0Au%2F2gAw0jLIqGPVTWTN2cu5GPuLC53KxeiS4D2IsW3iyLBUkXZ2LWVv4TaW5OVy5HYa%2BiYGa5gRqtiOPPWodJKwa%2BOHVDnrTEhtwdnYHsDelzP6gK66lMKvm2cgGOqUBzyLFB5lWFabhVzYc2ZMtSotUzXIJLxKBdQEiVVZx0tRCcrF9MNOQKTLrZZj8It53zOZ3%2BXKSG2xJmCpDyXoSefsbIUCxvbmF5v4lQjpSrTLafftFYKPsYzyUG%2BERRBfa4sm970mg0OYBQXqOXRTgDS6zJCf9Is4K8LxOxAziW1sm6hrDl%2BniwDmrhxE794SvFyM%2BSemEj87bSdvzT2e3L883GXot&X-Amz-Signature=3b017f716e21060de96d553b244a70d934730be427af1fbb933e059ea2024ca8&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

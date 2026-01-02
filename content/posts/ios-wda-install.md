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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466XFQ4JIGK%2F20260102%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260102T061936Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjECkaCXVzLXdlc3QtMiJIMEYCIQC8wyH6VEDxclb3r%2BVdk2oAulc55%2BGO7bSNxjp5vNTuwQIhAOGe9rHAFrutTInAbNbIhV8hCNwKKYTjdJ0VxegBptPIKogECPL%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1Igzeo%2BcIAoleR3q7FQ0q3AMfpZNTBm31aKGf65zLtVEamLjLzEj08dEAX0j3Aa7lDOmzXi3ZNMXB6PPtvzRTAlprA0Wi58QClMurOrjYOiGalivQRf622GLbv9NbHQP9ZVx8ZROJYP3fCGaqYlrPUGu%2F7T0MJ9zlbowBgV0%2FQU8VeFqNGdJqeDVS5yrrkIV9%2FEj4FL5j4gfGU6EQjvTvCMl22Oq0FvbSUCTeDs79u7%2F7Gr9aMuZ%2Fgm9ps5Gk8GnZQLvE53nFkyO%2BB3dMKjL7SIlTSWtmTZRro9giCdSktbA9runzYaQuBEpxo%2F%2F16Y589xMEkekM1Ux6JVBCHtTys5FAvpKOTS%2FYLz%2FpBryqWhcSWO8xISYrAoE2%2Bw7gXx4BdNUFMADipM%2F4wvYRS9dCzwa2lSMC3wTnStkgBir4YTSFYv463UkYAub%2Fk2dbO2RQVaj7aYJ9N%2F7UOd40xPw5TlNJR96WWQBNaNI%2FFENS9AXsWWGUMWW3Trc9SOx2czt0zquVbRKX9dDQM7qMRpm5FMMPVgykV4W05KCFprRNI6UMyiCx4pfwvkzhK0w6iLouZO6ABuJGV%2BDQDo%2FowaCdQQb7YXs0Yi7V8tKz13DrCaikbl7NvkqIcOf19dpHOue2qY3v5z645FkkgNthWjDJs9zKBjqkATUgU2VRIGkAgx96kPsBXjpZNocVxLCuF0Mnyfe0yPLEAUdAxxGAY2WLTZgXUVkAg4thg0k8Ic%2BUc%2BvccnTZW5Zf4RLRa8aQd1XXXywDiC0FShxxa736oeeJar%2FwARyVnbNboDZwgdfiZco%2FpiHPVsTCjtYn4o82c9ErNw9ClvmqVuv9YsOpaAOHj0yl9jcf8kj31gKywlrmZAuGZslcPA768ig1&X-Amz-Signature=1b672dc76a1ac5b91d062ea18085a0a69276c19ea1bbe98e4f0888d3e8a049a3&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466XFQ4JIGK%2F20260102%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260102T061936Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjECkaCXVzLXdlc3QtMiJIMEYCIQC8wyH6VEDxclb3r%2BVdk2oAulc55%2BGO7bSNxjp5vNTuwQIhAOGe9rHAFrutTInAbNbIhV8hCNwKKYTjdJ0VxegBptPIKogECPL%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1Igzeo%2BcIAoleR3q7FQ0q3AMfpZNTBm31aKGf65zLtVEamLjLzEj08dEAX0j3Aa7lDOmzXi3ZNMXB6PPtvzRTAlprA0Wi58QClMurOrjYOiGalivQRf622GLbv9NbHQP9ZVx8ZROJYP3fCGaqYlrPUGu%2F7T0MJ9zlbowBgV0%2FQU8VeFqNGdJqeDVS5yrrkIV9%2FEj4FL5j4gfGU6EQjvTvCMl22Oq0FvbSUCTeDs79u7%2F7Gr9aMuZ%2Fgm9ps5Gk8GnZQLvE53nFkyO%2BB3dMKjL7SIlTSWtmTZRro9giCdSktbA9runzYaQuBEpxo%2F%2F16Y589xMEkekM1Ux6JVBCHtTys5FAvpKOTS%2FYLz%2FpBryqWhcSWO8xISYrAoE2%2Bw7gXx4BdNUFMADipM%2F4wvYRS9dCzwa2lSMC3wTnStkgBir4YTSFYv463UkYAub%2Fk2dbO2RQVaj7aYJ9N%2F7UOd40xPw5TlNJR96WWQBNaNI%2FFENS9AXsWWGUMWW3Trc9SOx2czt0zquVbRKX9dDQM7qMRpm5FMMPVgykV4W05KCFprRNI6UMyiCx4pfwvkzhK0w6iLouZO6ABuJGV%2BDQDo%2FowaCdQQb7YXs0Yi7V8tKz13DrCaikbl7NvkqIcOf19dpHOue2qY3v5z645FkkgNthWjDJs9zKBjqkATUgU2VRIGkAgx96kPsBXjpZNocVxLCuF0Mnyfe0yPLEAUdAxxGAY2WLTZgXUVkAg4thg0k8Ic%2BUc%2BvccnTZW5Zf4RLRa8aQd1XXXywDiC0FShxxa736oeeJar%2FwARyVnbNboDZwgdfiZco%2FpiHPVsTCjtYn4o82c9ErNw9ClvmqVuv9YsOpaAOHj0yl9jcf8kj31gKywlrmZAuGZslcPA768ig1&X-Amz-Signature=30ecedbe9de542c3149cc19bf65ede65d6bae83c8a0a9084ec38bf5424542541&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466T3XYE3EH%2F20260216%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260216T123804Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEGwaCXVzLXdlc3QtMiJHMEUCIB838DM3Aqr5qfwtFKXlIcp4f9mdLtHEeIgivkVmQj15AiEAtBqyzs0z%2F5vkIlFjHaZv%2BZyyKP3KGjT%2BTpSGdQSK1Qoq%2FwMINRAAGgw2Mzc0MjMxODM4MDUiDJs%2BtP2Zs3Ei0z3WdircA4SIEJdp3nVVYj7xSzOkMaGvJfk0lG4H536VaHXEhIW7VVRU1e4HMcgIbB7%2FXAOm7bal6av5Xn%2F4uqfTsvHrV7zJmKr4kIq3%2B2W36iF4vjJGDiY4tqNqoPdAd%2FuOKlYPazcpw9P5xNGLuK0dzA9rPz0PV%2FS79yCDMCAVzsBtmXHGboO%2FmGEbnOEDQJnBpwC3QWF4OidIUBVbVfF%2B5TWLmb%2BBr%2FJ8piWtDAkOflJ%2FygF4cOMA%2BQSeMYit9voDvRCDCeOua0MIwfMPKISIsp3ssT3Ig0uVfEMqhmPGe7AEs0e%2B%2Bw5Q0yx7xHvJ6vQ3pTbl6AG5ANTGNsVCyfgfT5izSgiAy2zpfWTNJkB8%2FcEF3%2Bdk7vXR2oh71VcK4B4J9QbtO4DzY02JBMT0rPJpDa9aFUNkpv1zm%2BfEbYZslK%2FCDYNVZjukmMaQy1fRN9aRaO0df%2F%2FvWHkeS43uRwPLeh2eUL1PiJREKJKVpJfwfef%2BLbbr44Q1kewM8G7qEc1ohMy2NxpcPeizhoCZRLXfZeAECqhUBqfvXYONCSrhwkNJcBz9YmDpW0BJyOPatHTN2rJ2Y7hmNKIKepYNpnOsvFi4hy%2F%2BBjnvutqRjf3i2LnJn44BhO2iwi%2BRjqmbe3WoMIKBzMwGOqUBljDnp9dOPZfX3FDFOk2q9nTi%2B1UHia3AV3SjZ8rFGtV2XL%2B%2FF4ff0P5PXRJd9ZNSVJwgatPq2lhsPUcqheOYXcnjyi7A61ax1GQSZv6pKFJrQwpEVANI1Ut%2F9BKgBpqRYhzS2cvhpqx9RncIhDc%2BAbRCoaXy0XlES3LxOHJ1oFJAPFKYeTrlbOtmUbo2EBha4QwsJ1cVP5QHXSy6oxWsASQKV5nx&X-Amz-Signature=9af1850bc79bca12b4670c78edbea86ee85e01755177001dfef10821d128f3cb&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466T3XYE3EH%2F20260216%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260216T123804Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEGwaCXVzLXdlc3QtMiJHMEUCIB838DM3Aqr5qfwtFKXlIcp4f9mdLtHEeIgivkVmQj15AiEAtBqyzs0z%2F5vkIlFjHaZv%2BZyyKP3KGjT%2BTpSGdQSK1Qoq%2FwMINRAAGgw2Mzc0MjMxODM4MDUiDJs%2BtP2Zs3Ei0z3WdircA4SIEJdp3nVVYj7xSzOkMaGvJfk0lG4H536VaHXEhIW7VVRU1e4HMcgIbB7%2FXAOm7bal6av5Xn%2F4uqfTsvHrV7zJmKr4kIq3%2B2W36iF4vjJGDiY4tqNqoPdAd%2FuOKlYPazcpw9P5xNGLuK0dzA9rPz0PV%2FS79yCDMCAVzsBtmXHGboO%2FmGEbnOEDQJnBpwC3QWF4OidIUBVbVfF%2B5TWLmb%2BBr%2FJ8piWtDAkOflJ%2FygF4cOMA%2BQSeMYit9voDvRCDCeOua0MIwfMPKISIsp3ssT3Ig0uVfEMqhmPGe7AEs0e%2B%2Bw5Q0yx7xHvJ6vQ3pTbl6AG5ANTGNsVCyfgfT5izSgiAy2zpfWTNJkB8%2FcEF3%2Bdk7vXR2oh71VcK4B4J9QbtO4DzY02JBMT0rPJpDa9aFUNkpv1zm%2BfEbYZslK%2FCDYNVZjukmMaQy1fRN9aRaO0df%2F%2FvWHkeS43uRwPLeh2eUL1PiJREKJKVpJfwfef%2BLbbr44Q1kewM8G7qEc1ohMy2NxpcPeizhoCZRLXfZeAECqhUBqfvXYONCSrhwkNJcBz9YmDpW0BJyOPatHTN2rJ2Y7hmNKIKepYNpnOsvFi4hy%2F%2BBjnvutqRjf3i2LnJn44BhO2iwi%2BRjqmbe3WoMIKBzMwGOqUBljDnp9dOPZfX3FDFOk2q9nTi%2B1UHia3AV3SjZ8rFGtV2XL%2B%2FF4ff0P5PXRJd9ZNSVJwgatPq2lhsPUcqheOYXcnjyi7A61ax1GQSZv6pKFJrQwpEVANI1Ut%2F9BKgBpqRYhzS2cvhpqx9RncIhDc%2BAbRCoaXy0XlES3LxOHJ1oFJAPFKYeTrlbOtmUbo2EBha4QwsJ1cVP5QHXSy6oxWsASQKV5nx&X-Amz-Signature=30d3be5a36361b8bf8b1f7fccc0da93307d34d0bafe5c0a9161215ff52db5b0e&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

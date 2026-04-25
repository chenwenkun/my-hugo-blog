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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466QMXUKMHY%2F20260425%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260425T012244Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEMH%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQDL7KBQDeTN72qZJxbssDZ4B8Z%2FU9Qv7%2FBOwpLBcYbW%2BAIgCY%2FTtpG0WAHIyFZDFM64Ek%2Bh3KRaGc210d1OzsU8gcgqiAQIiv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDMHqvLKQO7iPtPR67yrcA5fRVxLbSBkFg%2Bo8ZX3otGKqwgusoUxmSPdr5gGoQwMB7INceMIxV1572eF09yymcwf6BemzSWTolWRSNWsfQnRJHdDvfC%2F2EYKJlXmuuduCUfng2LKlNqXev5K4SIP4ZoHByxlkx3NWC5MG4s59FCxmrnaGpqBwdQzSpU5%2BB4XdonFYsLS8tRv9VAwFqN%2FOoTdYgi6ljm9NVenEiZl3%2BjGvKnm0pY5HE2SoihMH6Z9rUjNXmQjWnR8RGHlmvHsLEWClc95GrhoJY1sPVpCTotxOf2RAG7St134tLqAJxIWdpco3EDAXmG67U29m7JymP7khi0nWuMhnFx9OKgWk32KxcsJFHwmhTpXy1rguSlY5R5KbkijjbFhpYWt2knSRDXUJ9%2B0GJqdSx438hBRT8r%2BY55T5X%2FNnmqCXgWRgrjzwzSWjk6b9c40kLc5BsxTbytURDB4KRpyMvWceTZTH34U5PTREqbrNuesDHPT2opbUuGHkIb%2Ff3CLZ7A%2FsU4fnHyoPWWB%2BcG5r59VHKif%2BA%2FhshEDf1LAbtUAF8PoRc9p0HUk%2B4LH8arZf5jykd0Lg6Xka6S92EIWIOgaRdU1xdeNMdNMkEmHawBL3WstX5cwD4ufuHfC5ZIKuznn1MNWYsM8GOqUB6lhKZ15nb7u48PPAgIjY0UeSPWpy6xvKaK3X3jh1CQpy8M6nAg7lHxu1z9IaEFP2q2Vh%2B5Qy817Ycfy7WdEF18VIh%2B%2BQiLlovXnbo9ipd%2FYt9eBcga3OQ1B2VEDff3YOIgrfEZREo2bTuN675gDv43miXtpDkSJfOW6tqLTG181rbj%2BdxLaixJyWA7fUuSmhT3J982RFnryC7gZj8Zwz20SHxEGJ&X-Amz-Signature=dad0f34a7c782ff2d687faa4fbafc52148c8409400e4423e429796a1a5f9f991&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466QMXUKMHY%2F20260425%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260425T012244Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEMH%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQDL7KBQDeTN72qZJxbssDZ4B8Z%2FU9Qv7%2FBOwpLBcYbW%2BAIgCY%2FTtpG0WAHIyFZDFM64Ek%2Bh3KRaGc210d1OzsU8gcgqiAQIiv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDMHqvLKQO7iPtPR67yrcA5fRVxLbSBkFg%2Bo8ZX3otGKqwgusoUxmSPdr5gGoQwMB7INceMIxV1572eF09yymcwf6BemzSWTolWRSNWsfQnRJHdDvfC%2F2EYKJlXmuuduCUfng2LKlNqXev5K4SIP4ZoHByxlkx3NWC5MG4s59FCxmrnaGpqBwdQzSpU5%2BB4XdonFYsLS8tRv9VAwFqN%2FOoTdYgi6ljm9NVenEiZl3%2BjGvKnm0pY5HE2SoihMH6Z9rUjNXmQjWnR8RGHlmvHsLEWClc95GrhoJY1sPVpCTotxOf2RAG7St134tLqAJxIWdpco3EDAXmG67U29m7JymP7khi0nWuMhnFx9OKgWk32KxcsJFHwmhTpXy1rguSlY5R5KbkijjbFhpYWt2knSRDXUJ9%2B0GJqdSx438hBRT8r%2BY55T5X%2FNnmqCXgWRgrjzwzSWjk6b9c40kLc5BsxTbytURDB4KRpyMvWceTZTH34U5PTREqbrNuesDHPT2opbUuGHkIb%2Ff3CLZ7A%2FsU4fnHyoPWWB%2BcG5r59VHKif%2BA%2FhshEDf1LAbtUAF8PoRc9p0HUk%2B4LH8arZf5jykd0Lg6Xka6S92EIWIOgaRdU1xdeNMdNMkEmHawBL3WstX5cwD4ufuHfC5ZIKuznn1MNWYsM8GOqUB6lhKZ15nb7u48PPAgIjY0UeSPWpy6xvKaK3X3jh1CQpy8M6nAg7lHxu1z9IaEFP2q2Vh%2B5Qy817Ycfy7WdEF18VIh%2B%2BQiLlovXnbo9ipd%2FYt9eBcga3OQ1B2VEDff3YOIgrfEZREo2bTuN675gDv43miXtpDkSJfOW6tqLTG181rbj%2BdxLaixJyWA7fUuSmhT3J982RFnryC7gZj8Zwz20SHxEGJ&X-Amz-Signature=c322df0c0ba26f3c931b41533b8abca6b44b79b90b07a58861a04e83926f9aee&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

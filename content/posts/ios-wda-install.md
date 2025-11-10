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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466ROOYDEU7%2F20251110%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251110T181636Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEEEaCXVzLXdlc3QtMiJHMEUCIBwFDMm0gsW41%2B8182eXlx8Gc1AzoJHSgmaQdxbQyDR1AiEAvsQr8Zck4nWQmBATwybCesCX5OD0D2EGlOBwNNsur4Iq%2FwMICRAAGgw2Mzc0MjMxODM4MDUiDHjUdtjGcbh32PhhxSrcA%2B0GVtsRjUtmVJudBghgsocXSwPc4QmXFv3KlmT3IINzggRHo2U%2FedBAZTQxu8EZ4sNZrXkOKOVkI%2FGasBLwIeF%2BZKMfwgy3FlQSBoJ1tBGkqL2VMppACF3oSKA6VGzmv3MhDtrL9xSMxTUOks8qg7DMApYMukL3iQKfLk0Ju13AzYu3vzXyr1wIdwYyQ1YyoHYmf9Qm8AbZWuJ0D7N2dnWChAbZ9TApjQRyLZcY%2Bva1QCgZ%2Ft%2FqY84BnsVy6cTqY8nvclrMJeZjw1p3asOY5Adkv0h%2FQ1DJHrJ9zLD2XmyDBhXInkIQiF4moJXPnD0%2BeWA2Wa8UNB7EmO0nbuUoRexNeby%2B4Ig34Cb99VygVITlan6H721AJeNApGQ7VDrBLevclenJiqJQvQ3P2tfxsqte3a%2FU0GebDPA8bj8R8TQKX5I7V6Bc1S5z0Gb9sh83T8H5PbAEIcX756ob8XAXozLXiZGwcqcnuWUm6%2FAobl8BzIhvY1MUX4elpY5vSCJB8v%2BF3EbSHyYFNsDhc2HGhpG1SBHTgtr04Z7dPhmqoRPCl6B3Iin9U%2FflCCMTfJU%2Bq43s0ulO6u8v2nfagf8uo0TBq7Og3f0IGme10TltrHS0u0JudYktWneHOnGEMLShyMgGOqUB1uju0h6ePplSwh3wjdDlKcWvfhrUSSz47kRB6Wqvx2WG%2BXIQvaDeYfsody1W1xHgwYdXezKKBLCT0lGLjSVaqzzkQMRvpAVVlg5SDpQQMRxzzt39mRwUuTEBS16wRNqY0Pk3D45cwSBcH1777V6Ikihncm1ZJ80fUhIDW2BfdRe1doC0yV7N5AIY1rCEkZbdccKGBpkN3IFnUBfjLXp9SICC48B0&X-Amz-Signature=2a5a55c6205b7603f58820c494a54890f81305004419b2fede5550a06770b509&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466ROOYDEU7%2F20251110%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251110T181636Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEEEaCXVzLXdlc3QtMiJHMEUCIBwFDMm0gsW41%2B8182eXlx8Gc1AzoJHSgmaQdxbQyDR1AiEAvsQr8Zck4nWQmBATwybCesCX5OD0D2EGlOBwNNsur4Iq%2FwMICRAAGgw2Mzc0MjMxODM4MDUiDHjUdtjGcbh32PhhxSrcA%2B0GVtsRjUtmVJudBghgsocXSwPc4QmXFv3KlmT3IINzggRHo2U%2FedBAZTQxu8EZ4sNZrXkOKOVkI%2FGasBLwIeF%2BZKMfwgy3FlQSBoJ1tBGkqL2VMppACF3oSKA6VGzmv3MhDtrL9xSMxTUOks8qg7DMApYMukL3iQKfLk0Ju13AzYu3vzXyr1wIdwYyQ1YyoHYmf9Qm8AbZWuJ0D7N2dnWChAbZ9TApjQRyLZcY%2Bva1QCgZ%2Ft%2FqY84BnsVy6cTqY8nvclrMJeZjw1p3asOY5Adkv0h%2FQ1DJHrJ9zLD2XmyDBhXInkIQiF4moJXPnD0%2BeWA2Wa8UNB7EmO0nbuUoRexNeby%2B4Ig34Cb99VygVITlan6H721AJeNApGQ7VDrBLevclenJiqJQvQ3P2tfxsqte3a%2FU0GebDPA8bj8R8TQKX5I7V6Bc1S5z0Gb9sh83T8H5PbAEIcX756ob8XAXozLXiZGwcqcnuWUm6%2FAobl8BzIhvY1MUX4elpY5vSCJB8v%2BF3EbSHyYFNsDhc2HGhpG1SBHTgtr04Z7dPhmqoRPCl6B3Iin9U%2FflCCMTfJU%2Bq43s0ulO6u8v2nfagf8uo0TBq7Og3f0IGme10TltrHS0u0JudYktWneHOnGEMLShyMgGOqUB1uju0h6ePplSwh3wjdDlKcWvfhrUSSz47kRB6Wqvx2WG%2BXIQvaDeYfsody1W1xHgwYdXezKKBLCT0lGLjSVaqzzkQMRvpAVVlg5SDpQQMRxzzt39mRwUuTEBS16wRNqY0Pk3D45cwSBcH1777V6Ikihncm1ZJ80fUhIDW2BfdRe1doC0yV7N5AIY1rCEkZbdccKGBpkN3IFnUBfjLXp9SICC48B0&X-Amz-Signature=0af7cf7583cee40451b317fb368309d10a650d1087fa3aee2689ba01d608059b&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

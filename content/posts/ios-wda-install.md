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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466TQUIUH2H%2F20251116%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251116T181422Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjENH%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIDoS4lBSC7zWimZbLVgK9OffiCTjdehj30GFlKK9Ww1BAiEA4BoArgHHBvmWVk9isfDW8gL3xdD2bD%2B5XbNnnMJlRFkqiAQImf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDGUFhveTl2PtcfZ41CrcA2XuJGcctQ04mKJpDoJyl0LZ849X4ruIOHZE9iE%2BjIQEbLOkdTcHSomY4ocw9CGPrwh74ZOdQ8sRMpAXjUXhjCG%2F0vILD8IIhRFGFum0o%2F6Rvg2kRswKTIHRofETNirlo3w8BSg9kwB8j0bZLmPs1Ph%2Fxjlko4kPCm13UBgBPyOfhLXo%2BI96HqjZD4hOcYd2gM9Qr9jWUH39ODKTttFkNdFr70ZwwiDJ%2FU999RNN8EvZb1VXj7KQrTx2YCGcC3PRv4ECn9anpeZ2KkadJ0x%2BST9cvOXxreKJxn2hMSyLeH7vB69ACbyu%2FdojK8wDEdanCdUUVjy9%2BcA2ilNp%2F3xSTGMK3RH8gNnDetRasJ9MRO3TiJlcyLqDwNl%2BBRaBciN3U7tG1GNNdrxpDW5L9Ccg%2BOx3r176txAeq1BntyeEx4ts1ap5o2qsx208pbs6TIpnUSbMVccZIKUHE0Ri7MYzE5iW14rNHalCB%2B%2Fe9h88A%2Bm%2BmLbMyoYtgRXLosSEWj1BKr9zwg26AdOZUH1y5D7KU4e0K5eT4J7JUKp2XgFMZinXgwT3vOuWLCxLay2hGyVtg1xj4QfT%2BGW6IGXUDjGFryxAYtiCZuKRM5YC6%2B%2Fe8KJszSpBz5GB57YcgSgkMJDz58gGOqUBW6B7QPFZ4sqaCv9V6E1CAoZ47fUXcQFwAPVN43sH%2BpdsRm5TrdUpn7aQ2R1Bv6RAIdx519vfjTYbNucORKPSH0Xq0ZxR1IVJkjSNbXOEOv6jmeDXt7dipJvazjkJfaBoojAEm8cvR%2FoHpoNCzyefnobrQxKxA1r8pWeZXJbzmdVA1xEnKlYx2%2BAPW5G%2B7DfWTiKaQhsU2mob3iEnnf2ZNsO2IJdD&X-Amz-Signature=5df6b47ba868ba6691739d7812a2f6cda25dca2c4c730c9d8ec221ee65cf45d1&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466TQUIUH2H%2F20251116%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251116T181422Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjENH%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIDoS4lBSC7zWimZbLVgK9OffiCTjdehj30GFlKK9Ww1BAiEA4BoArgHHBvmWVk9isfDW8gL3xdD2bD%2B5XbNnnMJlRFkqiAQImf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDGUFhveTl2PtcfZ41CrcA2XuJGcctQ04mKJpDoJyl0LZ849X4ruIOHZE9iE%2BjIQEbLOkdTcHSomY4ocw9CGPrwh74ZOdQ8sRMpAXjUXhjCG%2F0vILD8IIhRFGFum0o%2F6Rvg2kRswKTIHRofETNirlo3w8BSg9kwB8j0bZLmPs1Ph%2Fxjlko4kPCm13UBgBPyOfhLXo%2BI96HqjZD4hOcYd2gM9Qr9jWUH39ODKTttFkNdFr70ZwwiDJ%2FU999RNN8EvZb1VXj7KQrTx2YCGcC3PRv4ECn9anpeZ2KkadJ0x%2BST9cvOXxreKJxn2hMSyLeH7vB69ACbyu%2FdojK8wDEdanCdUUVjy9%2BcA2ilNp%2F3xSTGMK3RH8gNnDetRasJ9MRO3TiJlcyLqDwNl%2BBRaBciN3U7tG1GNNdrxpDW5L9Ccg%2BOx3r176txAeq1BntyeEx4ts1ap5o2qsx208pbs6TIpnUSbMVccZIKUHE0Ri7MYzE5iW14rNHalCB%2B%2Fe9h88A%2Bm%2BmLbMyoYtgRXLosSEWj1BKr9zwg26AdOZUH1y5D7KU4e0K5eT4J7JUKp2XgFMZinXgwT3vOuWLCxLay2hGyVtg1xj4QfT%2BGW6IGXUDjGFryxAYtiCZuKRM5YC6%2B%2Fe8KJszSpBz5GB57YcgSgkMJDz58gGOqUBW6B7QPFZ4sqaCv9V6E1CAoZ47fUXcQFwAPVN43sH%2BpdsRm5TrdUpn7aQ2R1Bv6RAIdx519vfjTYbNucORKPSH0Xq0ZxR1IVJkjSNbXOEOv6jmeDXt7dipJvazjkJfaBoojAEm8cvR%2FoHpoNCzyefnobrQxKxA1r8pWeZXJbzmdVA1xEnKlYx2%2BAPW5G%2B7DfWTiKaQhsU2mob3iEnnf2ZNsO2IJdD&X-Amz-Signature=f7f53b3621e495638e38110048bcef8c623162a6c4fa0da84e6a6695f5c0971a&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

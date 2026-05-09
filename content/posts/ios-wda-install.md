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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466WOWSVUBU%2F20260509%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260509T074128Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEBcaCXVzLXdlc3QtMiJIMEYCIQC%2FiprLEHOsibWrTduEB%2FsS7B31ezsSmHrhLa4U7q6QOwIhAI1vFR66FhLRchkDWlurhNJK2AyoOmKE%2FF1Gdl1joyx5KogECOD%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1Igw%2FTeUX0NM%2BaKMtECUq3ANPUwtuTrxMHYdYuzlzAjZGTO5OJ58NeI6d0kBgDUAg%2Bor3TYfJhM%2BNMbPWz06D5lXqrF0bm%2BWmyR6uPg9kqs3ED%2B3AdNiI4MeS7qX3hLpa9T9I4gwMca0QhbO2OUHrhfw%2FzKa3XCY4fnFO4lj9YVaJM3RqH7oRgnGIMEzTX8U8qJxkpeCVBS7lviadnXPpO%2FEUKoQaymq1m7SJXFTSbOez8wghtHBLzgp2PcTfooJt%2BYR52IH4Ezl%2BLmmdgDDB81X4P9l7F5yx%2Ble3gAgdadvSrPPzvg3%2F5SVBTfA%2FCBcKS12RMN0N2s6Illz8zEmkc4mmDQzTP4hTKqwvqXpuZWsLg4uqmWTWhLZCqVIGKF%2FYA%2BbGxZnLdnrEqWv7lsKqOUYkU5RVPng2ZaSVFnqZ388SG2Th%2BHn%2FAnE3d3SBHpZ9RILBgsBTVy6d9c%2FUgIsglh%2F4GYdfabNaJbCg1EZsG9fgPjvAFrvccII4jtb6%2BLaN0wEku1hNrh1hZ4hfz0dLlsZWK9F9bYD2tqy8RsMN8aF1G%2Bc9w4M1nBrBwCKyiTntsethXbZT%2BgCyPHQVbVPGq21OiVWM0RFa76ZbGySamQSdTG6ciK%2FX7aDKgZCX3g919xlXrD1DDHPsDaBRSTDst%2FvPBjqkAU81x9Mkb2%2FJ0oiU9hO1oG05rAUu5bYsAJ8CewtddixDqUngz7kcspTA7Na63CJTJcyPK4WVjVGTPYY%2B%2BdB%2FGAutIY9HpVPPPy%2BWdM3HK4E93Sq610TCNgRKN%2Bhfho4aOCKV8RBE5MxPNxvOpgEDFpUZH708Mt2iRZ%2BaLp2UPME5KYqXaPlZp00HGwE9UgRkB9DZ%2Byodxjx6AA2c39T%2BZPvZpsRV&X-Amz-Signature=7a395ff8ac70d20fc292e54a9669b25c5cf1125aff78ff7cd3efe53aa94b2719&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466WOWSVUBU%2F20260509%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260509T074128Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEBcaCXVzLXdlc3QtMiJIMEYCIQC%2FiprLEHOsibWrTduEB%2FsS7B31ezsSmHrhLa4U7q6QOwIhAI1vFR66FhLRchkDWlurhNJK2AyoOmKE%2FF1Gdl1joyx5KogECOD%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1Igw%2FTeUX0NM%2BaKMtECUq3ANPUwtuTrxMHYdYuzlzAjZGTO5OJ58NeI6d0kBgDUAg%2Bor3TYfJhM%2BNMbPWz06D5lXqrF0bm%2BWmyR6uPg9kqs3ED%2B3AdNiI4MeS7qX3hLpa9T9I4gwMca0QhbO2OUHrhfw%2FzKa3XCY4fnFO4lj9YVaJM3RqH7oRgnGIMEzTX8U8qJxkpeCVBS7lviadnXPpO%2FEUKoQaymq1m7SJXFTSbOez8wghtHBLzgp2PcTfooJt%2BYR52IH4Ezl%2BLmmdgDDB81X4P9l7F5yx%2Ble3gAgdadvSrPPzvg3%2F5SVBTfA%2FCBcKS12RMN0N2s6Illz8zEmkc4mmDQzTP4hTKqwvqXpuZWsLg4uqmWTWhLZCqVIGKF%2FYA%2BbGxZnLdnrEqWv7lsKqOUYkU5RVPng2ZaSVFnqZ388SG2Th%2BHn%2FAnE3d3SBHpZ9RILBgsBTVy6d9c%2FUgIsglh%2F4GYdfabNaJbCg1EZsG9fgPjvAFrvccII4jtb6%2BLaN0wEku1hNrh1hZ4hfz0dLlsZWK9F9bYD2tqy8RsMN8aF1G%2Bc9w4M1nBrBwCKyiTntsethXbZT%2BgCyPHQVbVPGq21OiVWM0RFa76ZbGySamQSdTG6ciK%2FX7aDKgZCX3g919xlXrD1DDHPsDaBRSTDst%2FvPBjqkAU81x9Mkb2%2FJ0oiU9hO1oG05rAUu5bYsAJ8CewtddixDqUngz7kcspTA7Na63CJTJcyPK4WVjVGTPYY%2B%2BdB%2FGAutIY9HpVPPPy%2BWdM3HK4E93Sq610TCNgRKN%2Bhfho4aOCKV8RBE5MxPNxvOpgEDFpUZH708Mt2iRZ%2BaLp2UPME5KYqXaPlZp00HGwE9UgRkB9DZ%2Byodxjx6AA2c39T%2BZPvZpsRV&X-Amz-Signature=835fd054f5ac50f8a9d8695a1d6cb78ba161dc3db20e3d62a8e4cfa2e147d5ac&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

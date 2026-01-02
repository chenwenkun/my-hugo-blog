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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4666CODKPCW%2F20260102%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260102T181738Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEDcaCXVzLXdlc3QtMiJHMEUCIArhd0kYw95gkzpNRaHFwxNQ%2BpGjecq7bBzB%2FAnkL%2BFVAiEAjdj3fnip2IWeoU9FR5ueboFeI%2Fo3Uglx5kMw8YL3fDgq%2FwMIABAAGgw2Mzc0MjMxODM4MDUiDPHUYqU5xthqhvEqySrcA2voALLAKTFbSeARlL5w1YJeNe%2B1tBwg1RS1i5ZtsnZ%2B2ZmIfaVH6E%2FdUV98xQVtHoRxv%2BuPHIj51ypF9zgehQ7TMiK3FsXzp0DYzjaTR3W%2BQAqeDbGqAbRdpmZKJGD3BqRkuH3Al6rAGlskkpL8m1JqSXsHTI8R7lpUt%2FhmUkKeo488EzdAo4qkoOnyRIaQB7ZLJW2IWorf4V2ccU0c%2BOMUJ%2FfeLZj1og1873UFG4JW7CNxIgN3H8V9unjcwdjqeuAof1qJdlppmsFw5AQZKD3M1qymrj%2Fwvls68Yl8XguNIfBsZ5niGpWW0ietlPPxTpOorjiiZaDU6WliNF5WAjgbvi%2FfXfdr%2FFiWiixHOvJfh44yHEHJRxnhpe8kAqPGBh91WMpxiBhLWPSGArSmqSksjvN5PqtcinrWtzmQXxTdi2rJcMSmh2dNWbj7G68cL%2BIytL4k%2BIGmen7x%2BsDIsdOMnldAW8QDt7SEA7Q2GrKEsO3yAyZoyp0lbeZATg7hgLIKAEhqAmxQjBxbfhh%2BYYaPPzwzGhiEU4hoFhic68Am1Q%2Fp4fjX4rQLT5QpHJ2b4i9RdayVSQ6uvfGABO1sA1lYyL6AraSeJeBy6uSf7m535RI8Y%2BSq8JAvtG8fMOmt38oGOqUBR3xDEkRSpPH2htjaEbBJrr6sUAhKboJY%2Fb7H4ddZamEWCkRcXWsyT0x5vso2DYthntKNYjVypVri4VduoXDkv1ddQpzrSZElQGOIYW4o7J%2BYuUOsvFe3MSrnMg9jgSyKJkiY8rBO7DVcx6jIEjOfcOs57FjGBQlrW2INkzVfeQ71jd%2BChHfygP2tOrbfCKcf2%2BsTnCtDsrqoepkzYv2NQ00ojy%2BT&X-Amz-Signature=ad241f9aee0f57ca0c36067ed0371209fdea0f8de0aceba61fbcff8d4bde6a2d&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4666CODKPCW%2F20260102%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260102T181738Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEDcaCXVzLXdlc3QtMiJHMEUCIArhd0kYw95gkzpNRaHFwxNQ%2BpGjecq7bBzB%2FAnkL%2BFVAiEAjdj3fnip2IWeoU9FR5ueboFeI%2Fo3Uglx5kMw8YL3fDgq%2FwMIABAAGgw2Mzc0MjMxODM4MDUiDPHUYqU5xthqhvEqySrcA2voALLAKTFbSeARlL5w1YJeNe%2B1tBwg1RS1i5ZtsnZ%2B2ZmIfaVH6E%2FdUV98xQVtHoRxv%2BuPHIj51ypF9zgehQ7TMiK3FsXzp0DYzjaTR3W%2BQAqeDbGqAbRdpmZKJGD3BqRkuH3Al6rAGlskkpL8m1JqSXsHTI8R7lpUt%2FhmUkKeo488EzdAo4qkoOnyRIaQB7ZLJW2IWorf4V2ccU0c%2BOMUJ%2FfeLZj1og1873UFG4JW7CNxIgN3H8V9unjcwdjqeuAof1qJdlppmsFw5AQZKD3M1qymrj%2Fwvls68Yl8XguNIfBsZ5niGpWW0ietlPPxTpOorjiiZaDU6WliNF5WAjgbvi%2FfXfdr%2FFiWiixHOvJfh44yHEHJRxnhpe8kAqPGBh91WMpxiBhLWPSGArSmqSksjvN5PqtcinrWtzmQXxTdi2rJcMSmh2dNWbj7G68cL%2BIytL4k%2BIGmen7x%2BsDIsdOMnldAW8QDt7SEA7Q2GrKEsO3yAyZoyp0lbeZATg7hgLIKAEhqAmxQjBxbfhh%2BYYaPPzwzGhiEU4hoFhic68Am1Q%2Fp4fjX4rQLT5QpHJ2b4i9RdayVSQ6uvfGABO1sA1lYyL6AraSeJeBy6uSf7m535RI8Y%2BSq8JAvtG8fMOmt38oGOqUBR3xDEkRSpPH2htjaEbBJrr6sUAhKboJY%2Fb7H4ddZamEWCkRcXWsyT0x5vso2DYthntKNYjVypVri4VduoXDkv1ddQpzrSZElQGOIYW4o7J%2BYuUOsvFe3MSrnMg9jgSyKJkiY8rBO7DVcx6jIEjOfcOs57FjGBQlrW2INkzVfeQ71jd%2BChHfygP2tOrbfCKcf2%2BsTnCtDsrqoepkzYv2NQ00ojy%2BT&X-Amz-Signature=638eb0025997088d1b25fd6fce9521cacf0272a93ff62b6c2e305ff2a1d8edaa&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466TJZJ4XXB%2F20260703%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260703T015351Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEDcaCXVzLXdlc3QtMiJIMEYCIQC%2FSa78xar2k5L2FHMb%2F%2FPh81GOXkUbvkKVNz9ResCHqQIhALy1FURZMB6e3gG%2FsLuEkjeUSH%2FXy4QJhV%2Bv2JvkXSKVKv8DCAAQABoMNjM3NDIzMTgzODA1Igz42bQjVNYeM1wznjUq3ANYQbOI0nCnoIPTA1LGz%2F%2BHEqlHSIN4T3ymxbslfWRUkn0FFlhcvt7GRwEzuqKTeleHoagc6%2Bx1c8vtLH6qZZkEndBvdOkFoP7CU7iGN2MeSWAr%2FKsD2sTNmruu7KSwQVKG4d490Jxz14wm06jMZ1Rv%2BPdRWatNVr7A85U1EpPRiC5osdvPDMy4Z7flKaJ9SbOwQQZCN9sM8j5a8CZC7YLyAjHu2ysvh8ByIhluwa7E4VROmcD118WEdACDuSr5nkpDgYCIHe6QetP3pzT3G0CKECkqLxytQI6a9YjoqwdCIwIdUanWe3ZibEuFweGVbFVEvUwBiMCmMv%2B8eKD9853W%2FFObibLZYxGfn4c4r5%2FGveyLxPHMQpvEPeA9rvPFe%2BgSwnRtzqkUqCS59ROLylnThLL49%2F1CvBOT3vsyLvJ%2BBdwma1DyHidMm8E%2Bn4m0AGvXY82wFwbNrrFmvTqH2gYTBQTr4pZh%2B2o7nhOoKJXK5hOzVrNPfMkah%2Beizs1CZuzXAMuGdsTbq3DCMU0Hb4hE1vRGF9GauOyMeB5WHoGzWVK6cQ%2F4wPrjx1Z4ifh0J3RdGqU7ACMBdy199MnXpOMfgpSicfNPKdDegLzAZP%2FvnjeTOIrasJGo0PaaxTDm0pvSBjqkASoMOW5vY8%2FMjGbm1PzhVzq95l%2BRcRXQH6m8rKGM5Y5mJ9VaAnGrjahlzyPIk9B3zCDiesz%2BZjjUJOtt273BtxCHY8TXy8HbraUGId9H1FX0wMZREBZE6N2dQk3bilcRfRut%2BS9t9lweNz%2FdhPyxjkPNXj9tiVsLcpG2EEEETHP796p70xRYXRV9K0acegMwAEjpicxRjHge2FRcdrjzDXIZZMed&X-Amz-Signature=5138450773fae5c2000e10f3b78f7149b9338aca80d2d85f140e8c913baa3cda&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466TJZJ4XXB%2F20260703%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260703T015351Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEDcaCXVzLXdlc3QtMiJIMEYCIQC%2FSa78xar2k5L2FHMb%2F%2FPh81GOXkUbvkKVNz9ResCHqQIhALy1FURZMB6e3gG%2FsLuEkjeUSH%2FXy4QJhV%2Bv2JvkXSKVKv8DCAAQABoMNjM3NDIzMTgzODA1Igz42bQjVNYeM1wznjUq3ANYQbOI0nCnoIPTA1LGz%2F%2BHEqlHSIN4T3ymxbslfWRUkn0FFlhcvt7GRwEzuqKTeleHoagc6%2Bx1c8vtLH6qZZkEndBvdOkFoP7CU7iGN2MeSWAr%2FKsD2sTNmruu7KSwQVKG4d490Jxz14wm06jMZ1Rv%2BPdRWatNVr7A85U1EpPRiC5osdvPDMy4Z7flKaJ9SbOwQQZCN9sM8j5a8CZC7YLyAjHu2ysvh8ByIhluwa7E4VROmcD118WEdACDuSr5nkpDgYCIHe6QetP3pzT3G0CKECkqLxytQI6a9YjoqwdCIwIdUanWe3ZibEuFweGVbFVEvUwBiMCmMv%2B8eKD9853W%2FFObibLZYxGfn4c4r5%2FGveyLxPHMQpvEPeA9rvPFe%2BgSwnRtzqkUqCS59ROLylnThLL49%2F1CvBOT3vsyLvJ%2BBdwma1DyHidMm8E%2Bn4m0AGvXY82wFwbNrrFmvTqH2gYTBQTr4pZh%2B2o7nhOoKJXK5hOzVrNPfMkah%2Beizs1CZuzXAMuGdsTbq3DCMU0Hb4hE1vRGF9GauOyMeB5WHoGzWVK6cQ%2F4wPrjx1Z4ifh0J3RdGqU7ACMBdy199MnXpOMfgpSicfNPKdDegLzAZP%2FvnjeTOIrasJGo0PaaxTDm0pvSBjqkASoMOW5vY8%2FMjGbm1PzhVzq95l%2BRcRXQH6m8rKGM5Y5mJ9VaAnGrjahlzyPIk9B3zCDiesz%2BZjjUJOtt273BtxCHY8TXy8HbraUGId9H1FX0wMZREBZE6N2dQk3bilcRfRut%2BS9t9lweNz%2FdhPyxjkPNXj9tiVsLcpG2EEEETHP796p70xRYXRV9K0acegMwAEjpicxRjHge2FRcdrjzDXIZZMed&X-Amz-Signature=ec04c160b41595b71dadbe767f2e1c9bf6a14ef1ba0df3526eb7cda12aa6248e&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

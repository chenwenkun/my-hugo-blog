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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466ZKT3PLIP%2F20251113%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251113T122217Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEIT%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIFxF6suYu3ac62AiRwVV5dUAyRvcDxGiRrruPrh%2FjoSEAiEAgttMwoYsZpdNEcbr3dteq%2BjMeMewnMcU9eddya6Uaj4q%2FwMITRAAGgw2Mzc0MjMxODM4MDUiDCpOcapyyCWu2%2FuIfyrcA4g7m9m7KvE9ljMStQw4%2BV1GMF30rhTRSQWlJEEIUvHKTRlvT2T0HkWA5T5siTh586v16PfjDalbxDubNIfiW4PeuAeTullPX0mY5l65GiFcTAFeyVD7bdJzqOl39EVecNywdZuiwYdlIF6PBPMLRgioaaJSgVEKU4pih6ZEykJJ7R9VRUKLbGlxqMC2NFrYl7Oai8uoirImf4kmmQu%2BUaPQlJDA903y8ySnaWv8IV4P%2BAKQFCLvZOIxZzQp%2BI%2BTqOcHbIEQvUM%2Fes20UYztk8DgFyWKgArBJP5rcb1CgXpJMNkqzVVz2E4YsxXNrgC1D4tszYoJi25Z8zcU%2BTmdDHIdROW%2BoBbjtdIBUY7iOMPQu8dNfI6mTWT8%2FY4Nj%2Bc3jnd%2FhcdXxKNgDDiDaBRYZdKMjtMaQCK67oyEkI2cUoXFS0ojF2gag%2B07P2Tao4Lt7d%2BM3ZHO1EzEje3M3bR62zhS%2FkfdyZoDTMuFvAuaa52tMlXJWJyZiiuiIADjmrv%2BI5gR5sz4hbKyMKddkpMNsE%2Be%2FmK%2BVR8RG%2BNl5r268lnWV%2BDI4xg6%2B14CRrnvm4D%2FJEepKvIcHpckJtb%2BixRYGRPES2%2BVJpNqU3T8oos%2FNNbLGa4nlkDwTCFGHXhQML6W18gGOqUBb%2FXNjCgZ4Cgg5i1OLhVfU5hIaQaSpRFMP2vhNpbzABN8QfiaDN1HewJ0g%2B8Kngy2Q2SsxO4UeTJKtRzjAMMxXjMep%2BMt9BlDSW8yueNrPMBwBANpzSql0DOySIsZCmcDBryTP1C08jGm1vJyLQfSMbzIg0G6IqwSBJVXUgZDfubyYK4HTxE8%2FSvjukEgY6hp65A8Smj5u9cQFYajLgCRvwhq4mfj&X-Amz-Signature=70fcdaf3520a6d5e8b9d9ca7e5831e671a0bd705a2abd29b05fa836385cde219&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466ZKT3PLIP%2F20251113%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251113T122218Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEIT%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIFxF6suYu3ac62AiRwVV5dUAyRvcDxGiRrruPrh%2FjoSEAiEAgttMwoYsZpdNEcbr3dteq%2BjMeMewnMcU9eddya6Uaj4q%2FwMITRAAGgw2Mzc0MjMxODM4MDUiDCpOcapyyCWu2%2FuIfyrcA4g7m9m7KvE9ljMStQw4%2BV1GMF30rhTRSQWlJEEIUvHKTRlvT2T0HkWA5T5siTh586v16PfjDalbxDubNIfiW4PeuAeTullPX0mY5l65GiFcTAFeyVD7bdJzqOl39EVecNywdZuiwYdlIF6PBPMLRgioaaJSgVEKU4pih6ZEykJJ7R9VRUKLbGlxqMC2NFrYl7Oai8uoirImf4kmmQu%2BUaPQlJDA903y8ySnaWv8IV4P%2BAKQFCLvZOIxZzQp%2BI%2BTqOcHbIEQvUM%2Fes20UYztk8DgFyWKgArBJP5rcb1CgXpJMNkqzVVz2E4YsxXNrgC1D4tszYoJi25Z8zcU%2BTmdDHIdROW%2BoBbjtdIBUY7iOMPQu8dNfI6mTWT8%2FY4Nj%2Bc3jnd%2FhcdXxKNgDDiDaBRYZdKMjtMaQCK67oyEkI2cUoXFS0ojF2gag%2B07P2Tao4Lt7d%2BM3ZHO1EzEje3M3bR62zhS%2FkfdyZoDTMuFvAuaa52tMlXJWJyZiiuiIADjmrv%2BI5gR5sz4hbKyMKddkpMNsE%2Be%2FmK%2BVR8RG%2BNl5r268lnWV%2BDI4xg6%2B14CRrnvm4D%2FJEepKvIcHpckJtb%2BixRYGRPES2%2BVJpNqU3T8oos%2FNNbLGa4nlkDwTCFGHXhQML6W18gGOqUBb%2FXNjCgZ4Cgg5i1OLhVfU5hIaQaSpRFMP2vhNpbzABN8QfiaDN1HewJ0g%2B8Kngy2Q2SsxO4UeTJKtRzjAMMxXjMep%2BMt9BlDSW8yueNrPMBwBANpzSql0DOySIsZCmcDBryTP1C08jGm1vJyLQfSMbzIg0G6IqwSBJVXUgZDfubyYK4HTxE8%2FSvjukEgY6hp65A8Smj5u9cQFYajLgCRvwhq4mfj&X-Amz-Signature=7ada51201e7d2365e191f33b8a844200018f35cc384f5fd6e5acde057cc829c2&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

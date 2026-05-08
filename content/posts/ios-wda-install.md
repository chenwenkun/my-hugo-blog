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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4664XH426Z2%2F20260508%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260508T020052Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEPn%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIBUX0kg1BgA167tsv%2F0xbmU4vIugw%2BLrJyIL%2BFFnIJeIAiEAksf%2Bt2dmzofOQC%2F1BF9YMWe%2B92mUqCajzOM9LhK4P3IqiAQIwv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDB1tpO8vjgVvbMvcVCrcA%2F5d6FL8NLvE7Kx4YzUCBKiD1%2BiwvqdbOGQh9fX5OguFmVWz6jmyO5guQotvvB5RTX3P7g6KQ%2FjcYAsOhCFgf6ocXIRuYFgB3H2qtk872lig96WulwqhSs4CQ%2FRE12TY6pmm4ZiBDb2OJ3esYity9iOsxUxz%2FWBi1G6RKevV6VhbAt7IvogP2hNvwaIAVhUGc1Hb%2BTDI6cyAs1xYIpZ0C6e4Ubg5kIDZO%2BA1mUHFQN%2BatmGz6byHnNi1wwtIYXhICPgMaRRsYl5ChM242Dp3ChrGKroKAQjolpJaFyYwYTrS4dJXKN1mOqgJotXxznUBXmkBNd7YOhY1QW53qt8XGa%2Bt9rDWNDTdo3NO5eRfshflTxSRkvVIlU9DE2kLbH404Yppc5zagwsjy22l1nQh%2B61X9%2FzbrPr2aPBj0tWtqBacOAWXPTjzalMcZW%2BB2g%2BWqzvVvUqip6bdXH7yXYJ4uTss3zxz%2FBVisBOZLD1e6ttutY00gAM7jiFx%2FeeIKja%2Fpmoq7Y6ZlbT7E9tyHW4XBZ2KjOEQZAKuG5OCE8raaWj4%2Fw70%2BUdrsGKumL4EQUpQf%2F0l6ZYk8aC46wz9T94oNY0emKyw963Bnv4bw%2FpxLYvjiWOqAfyY2l3yRG4gMIfy9M8GOqUB%2BP8G%2FqVHXuOWVv5H38KsSGmgt1sS8XTNQLMtugX%2BhBG%2BqjyX9WlEOnz%2FvOfzjOdoZiWRBeWIwkV%2F1o7VM%2FLYMvSDvmGTpuFFEnEeOCnUqgB%2BElVproJ0oPmxx6jjVL0MSNOLQEaWnCNYv4jWOFnSutqRpQ6otZV2BvV0NFmdvlSvSrOAUlvvsii6uQVTeZ%2Ba0SXs5ChFlBNqbi8HR2fm%2BH44iY8p&X-Amz-Signature=8385350100d49dc2622f63bca4c591df9785c798d8d42408b4ab2fd975d75591&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4664XH426Z2%2F20260508%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260508T020052Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEPn%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIBUX0kg1BgA167tsv%2F0xbmU4vIugw%2BLrJyIL%2BFFnIJeIAiEAksf%2Bt2dmzofOQC%2F1BF9YMWe%2B92mUqCajzOM9LhK4P3IqiAQIwv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDB1tpO8vjgVvbMvcVCrcA%2F5d6FL8NLvE7Kx4YzUCBKiD1%2BiwvqdbOGQh9fX5OguFmVWz6jmyO5guQotvvB5RTX3P7g6KQ%2FjcYAsOhCFgf6ocXIRuYFgB3H2qtk872lig96WulwqhSs4CQ%2FRE12TY6pmm4ZiBDb2OJ3esYity9iOsxUxz%2FWBi1G6RKevV6VhbAt7IvogP2hNvwaIAVhUGc1Hb%2BTDI6cyAs1xYIpZ0C6e4Ubg5kIDZO%2BA1mUHFQN%2BatmGz6byHnNi1wwtIYXhICPgMaRRsYl5ChM242Dp3ChrGKroKAQjolpJaFyYwYTrS4dJXKN1mOqgJotXxznUBXmkBNd7YOhY1QW53qt8XGa%2Bt9rDWNDTdo3NO5eRfshflTxSRkvVIlU9DE2kLbH404Yppc5zagwsjy22l1nQh%2B61X9%2FzbrPr2aPBj0tWtqBacOAWXPTjzalMcZW%2BB2g%2BWqzvVvUqip6bdXH7yXYJ4uTss3zxz%2FBVisBOZLD1e6ttutY00gAM7jiFx%2FeeIKja%2Fpmoq7Y6ZlbT7E9tyHW4XBZ2KjOEQZAKuG5OCE8raaWj4%2Fw70%2BUdrsGKumL4EQUpQf%2F0l6ZYk8aC46wz9T94oNY0emKyw963Bnv4bw%2FpxLYvjiWOqAfyY2l3yRG4gMIfy9M8GOqUB%2BP8G%2FqVHXuOWVv5H38KsSGmgt1sS8XTNQLMtugX%2BhBG%2BqjyX9WlEOnz%2FvOfzjOdoZiWRBeWIwkV%2F1o7VM%2FLYMvSDvmGTpuFFEnEeOCnUqgB%2BElVproJ0oPmxx6jjVL0MSNOLQEaWnCNYv4jWOFnSutqRpQ6otZV2BvV0NFmdvlSvSrOAUlvvsii6uQVTeZ%2Ba0SXs5ChFlBNqbi8HR2fm%2BH44iY8p&X-Amz-Signature=e14f092033ae2b1490d9c77f433f76f87d8cf675dceecc55eecf851c7051d7d8&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

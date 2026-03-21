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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4662JNWWQLU%2F20260321%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260321T010637Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEHUaCXVzLXdlc3QtMiJHMEUCIQCJRTiFn%2FHl9DmPjaTU6uZ1BKjU0zQSF5reXHPPGzevOAIgBHYwiW130N3oc%2FPpQ%2FKT4DU0Os%2FOCFrCFh%2BGvCTPvkwq%2FwMIPhAAGgw2Mzc0MjMxODM4MDUiDLWYIOQlI613OtXmRCrcA1madjAzZp%2BbW1Wmkifsuy427ofDy3HFriJQwF9NiM3wL0ZskQMrw1aPjUkCOEKtjAohc8rzLKb2OJwkggZEdp7onP6neO4Ir7yx0rI9omo3vB32dfxiEFeqgS%2BHB2I33TMPnSLNOQaFFU4%2BDtinL9ATAw88xONvpYvpMHjH4GP8I3yOxBEbW0jnn5%2FQPaQ2MAe88ybtwynO24is1Dv5URKIWPNbN0Pc9E1VEQmaTPmDCQWst7Vscj3IE73nqiiRJsZsAQpmNxj7A%2BkLXcYRHxc%2Fyqgnx5H9IOrs0Cvu6gucHs0rmBMywXW2TsS7mzw2U2X7wPmWbvF5LYB2i1NRJocp7a6RQRYDdjvWCmMCFTPBacnqjY7xezHLnBNNnZGttiYNRMxR2tS5uTF2o%2Fq%2FKcIMOBJZd0gqykBf3jL6uDqdIrErccJfBlVlOZnYsJg4vKUseSFHVSAZ%2B3LDiw08enp61HNc6qYgnDrN%2FPfBdyc1lsGpFFAtZt%2FlLU91znlOWYSPmsWM6KdAolMAPfMy4MNrllR19wI%2FiVt6VmloBKp7iUe6nJ0a4uDSgaNAQeOeT7bHO31WsJlCccF4ryoSIJMmrsrf9QBHlJwW1OAeUyv5hmsNfn1s%2BLOlEtl4MPHd9s0GOqUBEuTs4Tr3NsZLxWb5UqVtSqYm%2B%2BUR8Q1TqhbwHEAS8Sqb6zD%2BCLfuBEgW786Xv14upYy%2F1xSEEFlCigXCinx9ocxV19ZQxBvHXwuPTG9LISh%2F9U4%2FS1y%2BQI%2Fj37bDMYiZFT9RWSq1elGIe4q%2BdfB4e1Z0g4L93Num7eC1vKRydvtO1oByXrPkUaZQ4mSgsKazkyZhp12f51Ew6TyRfdNkYg7v7NQ5&X-Amz-Signature=7c9106251e6f2ee08de9de56b19f0e88131cfbb4f3daabcfba751cfb1087aece&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4662JNWWQLU%2F20260321%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260321T010637Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEHUaCXVzLXdlc3QtMiJHMEUCIQCJRTiFn%2FHl9DmPjaTU6uZ1BKjU0zQSF5reXHPPGzevOAIgBHYwiW130N3oc%2FPpQ%2FKT4DU0Os%2FOCFrCFh%2BGvCTPvkwq%2FwMIPhAAGgw2Mzc0MjMxODM4MDUiDLWYIOQlI613OtXmRCrcA1madjAzZp%2BbW1Wmkifsuy427ofDy3HFriJQwF9NiM3wL0ZskQMrw1aPjUkCOEKtjAohc8rzLKb2OJwkggZEdp7onP6neO4Ir7yx0rI9omo3vB32dfxiEFeqgS%2BHB2I33TMPnSLNOQaFFU4%2BDtinL9ATAw88xONvpYvpMHjH4GP8I3yOxBEbW0jnn5%2FQPaQ2MAe88ybtwynO24is1Dv5URKIWPNbN0Pc9E1VEQmaTPmDCQWst7Vscj3IE73nqiiRJsZsAQpmNxj7A%2BkLXcYRHxc%2Fyqgnx5H9IOrs0Cvu6gucHs0rmBMywXW2TsS7mzw2U2X7wPmWbvF5LYB2i1NRJocp7a6RQRYDdjvWCmMCFTPBacnqjY7xezHLnBNNnZGttiYNRMxR2tS5uTF2o%2Fq%2FKcIMOBJZd0gqykBf3jL6uDqdIrErccJfBlVlOZnYsJg4vKUseSFHVSAZ%2B3LDiw08enp61HNc6qYgnDrN%2FPfBdyc1lsGpFFAtZt%2FlLU91znlOWYSPmsWM6KdAolMAPfMy4MNrllR19wI%2FiVt6VmloBKp7iUe6nJ0a4uDSgaNAQeOeT7bHO31WsJlCccF4ryoSIJMmrsrf9QBHlJwW1OAeUyv5hmsNfn1s%2BLOlEtl4MPHd9s0GOqUBEuTs4Tr3NsZLxWb5UqVtSqYm%2B%2BUR8Q1TqhbwHEAS8Sqb6zD%2BCLfuBEgW786Xv14upYy%2F1xSEEFlCigXCinx9ocxV19ZQxBvHXwuPTG9LISh%2F9U4%2FS1y%2BQI%2Fj37bDMYiZFT9RWSq1elGIe4q%2BdfB4e1Z0g4L93Num7eC1vKRydvtO1oByXrPkUaZQ4mSgsKazkyZhp12f51Ew6TyRfdNkYg7v7NQ5&X-Amz-Signature=851e5ada448e4a7a3eeb79b4ff824426b244d96d7e88f37a60fcbe6540852c05&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

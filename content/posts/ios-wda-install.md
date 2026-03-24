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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466RPI3WZQY%2F20260324%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260324T184802Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjENL%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQCROIcI8dky2LYgPr8x2BrkdF%2BFqyssomFsQfEB%2F%2BKmegIgf%2FuGKtSX4oM5W8P78MKyKA7r2Z9gJTxcMS5GnihsfigqiAQIm%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDP6x9Xp1%2Bi6zhKbcjSrcA%2BcL5%2FoX%2BhHjmPlEOiwFjIlGGhcD%2Bqtw4eA1b2TrFpgJCz88KyWu%2Bnwlk7VfA3v1wQOgeNHUCx8vVc0iAJGpZaoVRngOrFP1MQDHPDnq0Make6elgbzl%2FKfZXanhLcbvRVd1VYniIQkZp0ZYdvldZkqiiz8uCF9zhGs8jPDqJeKkdhhlfqK5zgkC8pny6ND%2B11hP9VijQQTUJmQbkAmEoisdYtONbIZEcwMJO7dZXiJr5qvdjDLdSryFtKSp8il0D5u4bh05IL%2FwuFl%2BooaW5ONfc7hrPWDPDqlPx9mqclshV%2FtHiZWV78G704UAWY6g6i0SD9g0Hni%2BHSsXP9aFEXGb7xEOL1Fu1%2FmgIJ0KLeNLctTfbKkfVvuJqZ3vig9ArZfbpiC9qYm2sfrV7%2BFHuLKw6q2yCK7kzcR%2F4koA7NBS7zayFQGVR%2FWaiP8iZ8enENdIofpqRVfg43FXlS9Bd%2Bc9I1b%2FNSo0ZEpToGppvLvSye34wTG0hAoXvLQ6k4BUiOAK7ExRGXxPK2vpp9C333F2GZPQMh%2FROeZjadCf4cBimjGp3GnpO6iUh%2BGxLF8yybJI5yr2odoWAdzM7tgu1T7ZAE30rnB1yR58EWhb6gyC0IBzZ%2BrANFniyjcOMLGpi84GOqUB1eOI7yQ2lU26aEW0KLZ59rzMDzOaVEMKdgqNhsFnaBARMc26vBZCRC1xc2fqB3pB8CLFQNRK2k18%2FroEgQAR0wmILMYW%2BscBwrSTc52PEKTDOZawzeG3kZF%2Bpq9AJ4i5l8UnNaxlqJkbmrbkbzKg8Ont3eTpxIa4oVvAhXNzm5ueMFRrFAMwyzVhU2cF8yWLATyuxpBqIIpfLzPyYzh1DGnt%2BnNn&X-Amz-Signature=b469c9c8931d34043e20962f984b99bf47d5eb676101bc3256a2672bffeebf67&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466RPI3WZQY%2F20260324%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260324T184803Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjENL%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQCROIcI8dky2LYgPr8x2BrkdF%2BFqyssomFsQfEB%2F%2BKmegIgf%2FuGKtSX4oM5W8P78MKyKA7r2Z9gJTxcMS5GnihsfigqiAQIm%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDP6x9Xp1%2Bi6zhKbcjSrcA%2BcL5%2FoX%2BhHjmPlEOiwFjIlGGhcD%2Bqtw4eA1b2TrFpgJCz88KyWu%2Bnwlk7VfA3v1wQOgeNHUCx8vVc0iAJGpZaoVRngOrFP1MQDHPDnq0Make6elgbzl%2FKfZXanhLcbvRVd1VYniIQkZp0ZYdvldZkqiiz8uCF9zhGs8jPDqJeKkdhhlfqK5zgkC8pny6ND%2B11hP9VijQQTUJmQbkAmEoisdYtONbIZEcwMJO7dZXiJr5qvdjDLdSryFtKSp8il0D5u4bh05IL%2FwuFl%2BooaW5ONfc7hrPWDPDqlPx9mqclshV%2FtHiZWV78G704UAWY6g6i0SD9g0Hni%2BHSsXP9aFEXGb7xEOL1Fu1%2FmgIJ0KLeNLctTfbKkfVvuJqZ3vig9ArZfbpiC9qYm2sfrV7%2BFHuLKw6q2yCK7kzcR%2F4koA7NBS7zayFQGVR%2FWaiP8iZ8enENdIofpqRVfg43FXlS9Bd%2Bc9I1b%2FNSo0ZEpToGppvLvSye34wTG0hAoXvLQ6k4BUiOAK7ExRGXxPK2vpp9C333F2GZPQMh%2FROeZjadCf4cBimjGp3GnpO6iUh%2BGxLF8yybJI5yr2odoWAdzM7tgu1T7ZAE30rnB1yR58EWhb6gyC0IBzZ%2BrANFniyjcOMLGpi84GOqUB1eOI7yQ2lU26aEW0KLZ59rzMDzOaVEMKdgqNhsFnaBARMc26vBZCRC1xc2fqB3pB8CLFQNRK2k18%2FroEgQAR0wmILMYW%2BscBwrSTc52PEKTDOZawzeG3kZF%2Bpq9AJ4i5l8UnNaxlqJkbmrbkbzKg8Ont3eTpxIa4oVvAhXNzm5ueMFRrFAMwyzVhU2cF8yWLATyuxpBqIIpfLzPyYzh1DGnt%2BnNn&X-Amz-Signature=c1cb7f2d64abbb7a75883cc16b5a27de6faf620ee610245f15f4127e1d8249e5&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

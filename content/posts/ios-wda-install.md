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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663T5AFDTB%2F20260414%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260414T130013Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEMX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIFyAS2VVtyTqSox9l8SlLYqnrHfp%2FASAG0%2FrfbpPHkCDAiEA5uuOJEjMYxhyfScgCXtqVjhiZCbez0OaWyMUEykIv1MqiAQIjv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDCqORod0kgdxFc8fbircAxml3QScb%2BJC0Q187ye4dnTNVMhIR3wnxqwktLvNGp%2FYmuI52JvGJQWfTKBMsiY5S54XJH8uDQPJNXRxk%2BhvGstLYGhUT5YI%2B72WQc0qHPbCMNkJLA8i5Ue2cFqJA043S8L5vudZPGsAFCHPmYd8Q2huQgm9llU4amW7KSnW9qzLXWPJVV4FJeGqLiDjLGv3n%2F8khI8zUj01t3TUAnISv8Tmb%2FA5GsfPzvew01Uo8qYcLCX1e3TWoQshvNSgEkHSTR1BEHXrLhqfXtYJgimH2hGcP3Y%2BLizhQlk3gratiwXPTvxX7BX9YJ4xhlkwfeyXZma1nJsSN%2FMXSqisURQLulElSoA0wFTbRBQvsxGtKay95bHCq9G8NG3Wdi1c6fbGVwV7etRIFZrV9n804aaCtz1sgmNKwNRzBVJaYmon5iuUAhJnzpDbG%2FSOmLRmGuuLmykF41xbLqZlwJOLKKztMNM7B1Yx6pNmbCXx%2FBll63YYt4J6fYvmp423nXwRzd3j5kbJKFD0v7Q3j9HJO0xdm1fJjve%2FAWFIIFI6aCeFahAfEkgASjldOZUxzDj8S8Vp%2F%2F6zDG3rkFotSLegGFM4oqHrwMWCucVlws1yuR4ebPnkT9QqadpEbsRz6IwvMKfp%2BM4GOqUBaoSbJVo5RxEJtc37MxJOjcnbrzh5u1xcmDM1H%2BcH2o10arK%2BHar%2FdmirVaXfUjQy3iew5XuDrIntsE%2Fqf%2BUyt5ADcjKv4UQTtUKMhA6aZrswcOHdlQ10EROz6yIRLkNPN8zOiJGhvoCYAzAtAWqOqf1Am%2FXXRjmmQqNYQ%2Bi5tzf5CKPem3oAcUG2xS0yMZqkVq6%2FtIhuhl7W5yniH8xlgKyc4Ied&X-Amz-Signature=8472e93e572455163dcb43a7ba7b1c16df8cb44480dc2c2ae2697381756411b6&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663T5AFDTB%2F20260414%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260414T130013Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEMX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIFyAS2VVtyTqSox9l8SlLYqnrHfp%2FASAG0%2FrfbpPHkCDAiEA5uuOJEjMYxhyfScgCXtqVjhiZCbez0OaWyMUEykIv1MqiAQIjv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDCqORod0kgdxFc8fbircAxml3QScb%2BJC0Q187ye4dnTNVMhIR3wnxqwktLvNGp%2FYmuI52JvGJQWfTKBMsiY5S54XJH8uDQPJNXRxk%2BhvGstLYGhUT5YI%2B72WQc0qHPbCMNkJLA8i5Ue2cFqJA043S8L5vudZPGsAFCHPmYd8Q2huQgm9llU4amW7KSnW9qzLXWPJVV4FJeGqLiDjLGv3n%2F8khI8zUj01t3TUAnISv8Tmb%2FA5GsfPzvew01Uo8qYcLCX1e3TWoQshvNSgEkHSTR1BEHXrLhqfXtYJgimH2hGcP3Y%2BLizhQlk3gratiwXPTvxX7BX9YJ4xhlkwfeyXZma1nJsSN%2FMXSqisURQLulElSoA0wFTbRBQvsxGtKay95bHCq9G8NG3Wdi1c6fbGVwV7etRIFZrV9n804aaCtz1sgmNKwNRzBVJaYmon5iuUAhJnzpDbG%2FSOmLRmGuuLmykF41xbLqZlwJOLKKztMNM7B1Yx6pNmbCXx%2FBll63YYt4J6fYvmp423nXwRzd3j5kbJKFD0v7Q3j9HJO0xdm1fJjve%2FAWFIIFI6aCeFahAfEkgASjldOZUxzDj8S8Vp%2F%2F6zDG3rkFotSLegGFM4oqHrwMWCucVlws1yuR4ebPnkT9QqadpEbsRz6IwvMKfp%2BM4GOqUBaoSbJVo5RxEJtc37MxJOjcnbrzh5u1xcmDM1H%2BcH2o10arK%2BHar%2FdmirVaXfUjQy3iew5XuDrIntsE%2Fqf%2BUyt5ADcjKv4UQTtUKMhA6aZrswcOHdlQ10EROz6yIRLkNPN8zOiJGhvoCYAzAtAWqOqf1Am%2FXXRjmmQqNYQ%2Bi5tzf5CKPem3oAcUG2xS0yMZqkVq6%2FtIhuhl7W5yniH8xlgKyc4Ied&X-Amz-Signature=23a93a6fd97bf83e6ca9d6e1153ccae47d35ad1561ba37b9bff2c0d3b1e657c4&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

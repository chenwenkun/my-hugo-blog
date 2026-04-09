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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4665P5XTWZ4%2F20260409%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260409T070942Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEEYaCXVzLXdlc3QtMiJGMEQCIBy4O7YaqXdvdmnEED7h2AknLAFDgMTvl%2FizSN5n%2FaKyAiARIPbK1EOx7kec0mMpHUfcHoBGYZNRSeIvvVa3Pl0tmSr%2FAwgOEAAaDDYzNzQyMzE4MzgwNSIMAUKtmTTdo57V5SnbKtwDfUtFCFyx66W%2Bo0B%2FIOVEiIXfy5T3BQx1BMavvp5ydPOOcQ8pXJpiu%2BAPrAYPCILmTMXarJRA2f1Ee96gZu7bQXQ7QiEtacoaqEx6B%2B0fpzCU21HzH%2BRAgB%2BUIBrAZ20Abc9PGUhfCWp7u8dTc9hT2CbOnQJVrgpKV4hKPrsrERoCA2DwSK7KtGNAPo7o%2FSWMYLjIVM%2FWYeGJIICPyi9nWklCL8ad1KDiQDzUS%2B2WtHScGWjPaGiNhULnhRirHoKL4EymXy580vkaSff27SrmYmVZMJLUl37JCRuRlAkhmXrkROOgJrALrMchBJTHJeGJnPvGMIrWqCgQA81O4FSY%2BCdvtClRA2F4bX9lxSeN6%2F8tFSYXUL0c1%2BTSXSR1Vgoe1vGnNi%2FnMb0RSqwQb8UbcwQr7DDZICqjp8K6INHeIEW4VjSEoXzcHSuV1XpxSBhtjE8qLxGa4k%2BgEFFZKezg6SpEFLOfMc38mJS5s90j41YO6EtqlIC3QVbPGAam0GmjkueWQiJQ%2FgKf7MDT9hOm%2BIe7I7BdSn7hTp%2BgUGO9l3lkJR7qjvhPG5zQ86RHDDiPhLlbOJHgir5qW%2Fqccce%2FxtdgxX85Xw2tOfI6XKpZ7gjhNVadWPSX%2Bxtub7Ewxu%2FczgY6pgEuAQVtSG%2Ft2hPzcMmqyrMX5SEh8sJHs4BLkfY1JN4KLNti6oRDoXzffOqU7CIMT5mCsEqTwNt%2BJL6QcSTD8bHSVE%2FknQvjaZbZh03q7uP2gLmvgDpg7zCOpHnDoBI4svoAZZXAJL%2Ff0P6FMSqxnVnZ1rCbsmZXF%2ByMM6f2dtT4oVSPbCKdWnaqobXFphFWiJkzS2b9D7ggRSi4DSjUhjhc9bmqfxqy&X-Amz-Signature=71450a37493eb6b4264fd391bf72b4e9601358ddb1ce4923c5dfc8af34db1573&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4665P5XTWZ4%2F20260409%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260409T070942Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEEYaCXVzLXdlc3QtMiJGMEQCIBy4O7YaqXdvdmnEED7h2AknLAFDgMTvl%2FizSN5n%2FaKyAiARIPbK1EOx7kec0mMpHUfcHoBGYZNRSeIvvVa3Pl0tmSr%2FAwgOEAAaDDYzNzQyMzE4MzgwNSIMAUKtmTTdo57V5SnbKtwDfUtFCFyx66W%2Bo0B%2FIOVEiIXfy5T3BQx1BMavvp5ydPOOcQ8pXJpiu%2BAPrAYPCILmTMXarJRA2f1Ee96gZu7bQXQ7QiEtacoaqEx6B%2B0fpzCU21HzH%2BRAgB%2BUIBrAZ20Abc9PGUhfCWp7u8dTc9hT2CbOnQJVrgpKV4hKPrsrERoCA2DwSK7KtGNAPo7o%2FSWMYLjIVM%2FWYeGJIICPyi9nWklCL8ad1KDiQDzUS%2B2WtHScGWjPaGiNhULnhRirHoKL4EymXy580vkaSff27SrmYmVZMJLUl37JCRuRlAkhmXrkROOgJrALrMchBJTHJeGJnPvGMIrWqCgQA81O4FSY%2BCdvtClRA2F4bX9lxSeN6%2F8tFSYXUL0c1%2BTSXSR1Vgoe1vGnNi%2FnMb0RSqwQb8UbcwQr7DDZICqjp8K6INHeIEW4VjSEoXzcHSuV1XpxSBhtjE8qLxGa4k%2BgEFFZKezg6SpEFLOfMc38mJS5s90j41YO6EtqlIC3QVbPGAam0GmjkueWQiJQ%2FgKf7MDT9hOm%2BIe7I7BdSn7hTp%2BgUGO9l3lkJR7qjvhPG5zQ86RHDDiPhLlbOJHgir5qW%2Fqccce%2FxtdgxX85Xw2tOfI6XKpZ7gjhNVadWPSX%2Bxtub7Ewxu%2FczgY6pgEuAQVtSG%2Ft2hPzcMmqyrMX5SEh8sJHs4BLkfY1JN4KLNti6oRDoXzffOqU7CIMT5mCsEqTwNt%2BJL6QcSTD8bHSVE%2FknQvjaZbZh03q7uP2gLmvgDpg7zCOpHnDoBI4svoAZZXAJL%2Ff0P6FMSqxnVnZ1rCbsmZXF%2ByMM6f2dtT4oVSPbCKdWnaqobXFphFWiJkzS2b9D7ggRSi4DSjUhjhc9bmqfxqy&X-Amz-Signature=3691082d94d928b68ee43bce8a32931523071550fd45a86eca4012ccefd18e7e&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

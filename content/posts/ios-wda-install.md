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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB46673SUK5FB%2F20251103%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251103T122211Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJT%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQCjFouomckYmptkByjegLuCdOcXjecMJ36FkPTJRIotJAIgdMh6EEVAJ5j%2BP5AwEmhh9mh3XP%2BPUGBhFSSOQ4mBLJ8q%2FwMIXRAAGgw2Mzc0MjMxODM4MDUiDHw%2F%2FHDS3C%2BcSLoRIircA4KevMqCMCeq%2BimQWuOTrbIXrFTevXdp5hFQI1m%2Fltq%2BqWl93cpkVAPC8FdlG7w4tinZqY696ZlQ6rrMI65cBERRVpLZx5mpyci%2Bq%2Fs7thfMqvSD6%2Bg1qbsrwfVWmcymWXgq9Rae0QbNP7gbwXdXpD18SHo%2BrSsyarM926moUTu8xm3e7pfRtMbMELITNtKsnyNNfq8L3sVLOZAjcqFT5kXuF%2BlZ8fB2RxqSj6vm4yECHasOavC06O98LIP1%2BQiQ7H%2Be3Hv8R4Qu2goCRxTivhDKaNvP1kvE0L8XfMeBKBcuK0jNmdUU1FmjyZ18C%2BNyXjfWAkK%2BDw52WhCNpEHWzY2RfWT7zsaIVSOzIG09CCHA5hHSoL9nuTGX9U3JVOQg%2FRs9YZQA5xJxRDV11V6d6WrUg5wI39bTcNoFvOAvsmspSNV2SAc1GeehphZUKbnGQOFbUJd335UKkMBsEVsKJ8H%2FSPK322y83qXnabsX2YOzPfhFj1H7K6t4L%2FN%2F7EBhIy16%2BIXePJ7L1mBfdtuqo%2FY1Wdu1avRT8Vc4TD%2FDuz8yC5foNqsHWOP%2FqCsHc4QXi7nGNd9%2FZqF5JkAx2Y%2BwWfVLHyvxbe9Kz2JaYWQrkgPmKytg113tpJ61KFauMM63osgGOqUB2Xix%2Bk8LHYH1ZvpNfESxi3AUqxztgET6a%2FBLNpfUDhJdu%2BtdDjux%2FlQtlnFG4HZ0GcChKIhA0gsrq1bqC5NDIFvQ9yAIr%2B5vuArtRGG%2BK2zdtrRt10%2BCAPAvEVLdpSfqyeqTbL%2BGYlKD27CwmTRH%2FeykEdlIebw8DBCzoX85SNchOykY1HOyMC1uxIavbC5nPSjTs2T4ransFPmXxsh9AdqYdGDj&X-Amz-Signature=fe9f09de12d58ebf04e8280e87c422514fbf951226927832f2c8427fb1978057&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB46673SUK5FB%2F20251103%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251103T122211Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJT%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQCjFouomckYmptkByjegLuCdOcXjecMJ36FkPTJRIotJAIgdMh6EEVAJ5j%2BP5AwEmhh9mh3XP%2BPUGBhFSSOQ4mBLJ8q%2FwMIXRAAGgw2Mzc0MjMxODM4MDUiDHw%2F%2FHDS3C%2BcSLoRIircA4KevMqCMCeq%2BimQWuOTrbIXrFTevXdp5hFQI1m%2Fltq%2BqWl93cpkVAPC8FdlG7w4tinZqY696ZlQ6rrMI65cBERRVpLZx5mpyci%2Bq%2Fs7thfMqvSD6%2Bg1qbsrwfVWmcymWXgq9Rae0QbNP7gbwXdXpD18SHo%2BrSsyarM926moUTu8xm3e7pfRtMbMELITNtKsnyNNfq8L3sVLOZAjcqFT5kXuF%2BlZ8fB2RxqSj6vm4yECHasOavC06O98LIP1%2BQiQ7H%2Be3Hv8R4Qu2goCRxTivhDKaNvP1kvE0L8XfMeBKBcuK0jNmdUU1FmjyZ18C%2BNyXjfWAkK%2BDw52WhCNpEHWzY2RfWT7zsaIVSOzIG09CCHA5hHSoL9nuTGX9U3JVOQg%2FRs9YZQA5xJxRDV11V6d6WrUg5wI39bTcNoFvOAvsmspSNV2SAc1GeehphZUKbnGQOFbUJd335UKkMBsEVsKJ8H%2FSPK322y83qXnabsX2YOzPfhFj1H7K6t4L%2FN%2F7EBhIy16%2BIXePJ7L1mBfdtuqo%2FY1Wdu1avRT8Vc4TD%2FDuz8yC5foNqsHWOP%2FqCsHc4QXi7nGNd9%2FZqF5JkAx2Y%2BwWfVLHyvxbe9Kz2JaYWQrkgPmKytg113tpJ61KFauMM63osgGOqUB2Xix%2Bk8LHYH1ZvpNfESxi3AUqxztgET6a%2FBLNpfUDhJdu%2BtdDjux%2FlQtlnFG4HZ0GcChKIhA0gsrq1bqC5NDIFvQ9yAIr%2B5vuArtRGG%2BK2zdtrRt10%2BCAPAvEVLdpSfqyeqTbL%2BGYlKD27CwmTRH%2FeykEdlIebw8DBCzoX85SNchOykY1HOyMC1uxIavbC5nPSjTs2T4ransFPmXxsh9AdqYdGDj&X-Amz-Signature=cb57edcc744aa1d996c65fb485877f39a44a28f68c912813557f8415f380ac7c&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

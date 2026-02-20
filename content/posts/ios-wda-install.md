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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4666B5GXY46%2F20260220%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260220T010848Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEMD%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQCgpIvLOqanrKoNOtR1B5RcqlSI4YsmeEwlecQn8aDZ4gIgBwhpzxEb81ezQsAu62y9t8Yq%2Ft7JzXidzK%2FszUFnip4qiAQIif%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDL7yXUav5GPefm6kLSrcA04RtzkPCFgrL1hFx7OSy6KLwGVhLML4sQ98QpjwAzB4I6po%2B8%2Fm%2FbcDABea875dvgZ1IhDUxyFHpQP212E8GcgGN963zK5auHvoyytg6W8BDqGkcg%2ByAnhv0WXB176OJN73NxbjWvSpU2f0ePM2LH9xEcY8jOFs%2B3FaHk%2FEENfkS7zm9gybGs7k79pfu4%2FYTzNvo%2BHzSlLsxqdVDRO68h95%2FgoSmKi5W3YbCKzg1jYx%2FPriPEV0HQ3MnDhZPfD0amWh8kjY5f9nfP4hoUZQPK2%2BPBP5ZCAXrIcyh4ySQcNdAOKvbhheQg%2B1Y6JPxulf3pz2lsDoQEQQ5Lnw3rWElpM2DFwhnMhqmg7mb0UTpUAoovJw%2F1I7cK2gx2Zoovj5njq8K1NXbI%2FAauyk0X7%2BBWshuIXbpC4gB%2BE6zbAjUJyyAGj45GEhvzgTDeoLJbctNN25xagTjpagn7DoFlSMcy%2BgU6KWZyfrKD0ZuUtnnQN%2BRetfiQV1q64cdCbqclU4ky72EFUxQak5sAZI8xHp8OHIuur3zgxOq%2FM21DVN1FA3vb8sgYmffGPoYpvTrx7l2uuREtAUtfyre3IZmUHUgMB3AmGdSCj8sYeS4Sf16JgmGW0rpAlShmmrdTg%2BMNa%2B3swGOqUB2oxzbiSj3Ju9A1aR9c98sSQ9Cp27xj9Lzd2nqRGqBSJ8NbF5rWKKL3YG1VfFg8Oke2dAwwazNnbVUuFlVPmHl3Va%2BCI7Ei%2FTHQb5ctTiUIh0ehlzv84VmEd8xzGcjDcjqT%2BKLSDaEwmXtD6kldDiGu9r3mhV%2Fz5fNkgN5Pj8EvH40c1gMhVeApDN8aqieXBiETyRSSZIZCMhbhuP3YrTsH5hE%2BqN&X-Amz-Signature=60ddc6bac480d2adbf519ea71dabf0dd22645c27b2923f519b8c34c80dabd7f8&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4666B5GXY46%2F20260220%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260220T010848Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEMD%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQCgpIvLOqanrKoNOtR1B5RcqlSI4YsmeEwlecQn8aDZ4gIgBwhpzxEb81ezQsAu62y9t8Yq%2Ft7JzXidzK%2FszUFnip4qiAQIif%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDL7yXUav5GPefm6kLSrcA04RtzkPCFgrL1hFx7OSy6KLwGVhLML4sQ98QpjwAzB4I6po%2B8%2Fm%2FbcDABea875dvgZ1IhDUxyFHpQP212E8GcgGN963zK5auHvoyytg6W8BDqGkcg%2ByAnhv0WXB176OJN73NxbjWvSpU2f0ePM2LH9xEcY8jOFs%2B3FaHk%2FEENfkS7zm9gybGs7k79pfu4%2FYTzNvo%2BHzSlLsxqdVDRO68h95%2FgoSmKi5W3YbCKzg1jYx%2FPriPEV0HQ3MnDhZPfD0amWh8kjY5f9nfP4hoUZQPK2%2BPBP5ZCAXrIcyh4ySQcNdAOKvbhheQg%2B1Y6JPxulf3pz2lsDoQEQQ5Lnw3rWElpM2DFwhnMhqmg7mb0UTpUAoovJw%2F1I7cK2gx2Zoovj5njq8K1NXbI%2FAauyk0X7%2BBWshuIXbpC4gB%2BE6zbAjUJyyAGj45GEhvzgTDeoLJbctNN25xagTjpagn7DoFlSMcy%2BgU6KWZyfrKD0ZuUtnnQN%2BRetfiQV1q64cdCbqclU4ky72EFUxQak5sAZI8xHp8OHIuur3zgxOq%2FM21DVN1FA3vb8sgYmffGPoYpvTrx7l2uuREtAUtfyre3IZmUHUgMB3AmGdSCj8sYeS4Sf16JgmGW0rpAlShmmrdTg%2BMNa%2B3swGOqUB2oxzbiSj3Ju9A1aR9c98sSQ9Cp27xj9Lzd2nqRGqBSJ8NbF5rWKKL3YG1VfFg8Oke2dAwwazNnbVUuFlVPmHl3Va%2BCI7Ei%2FTHQb5ctTiUIh0ehlzv84VmEd8xzGcjDcjqT%2BKLSDaEwmXtD6kldDiGu9r3mhV%2Fz5fNkgN5Pj8EvH40c1gMhVeApDN8aqieXBiETyRSSZIZCMhbhuP3YrTsH5hE%2BqN&X-Amz-Signature=175ca41f1a23df86611f578295762f1017971cbb4f986f29a5812d88d434911a&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

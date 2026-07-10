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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4662VARH7ND%2F20260710%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260710T091628Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEOj%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIGr%2FueE9VqISMZ5D4bxo7MxkJ2GXv083vf23FzrgfKSoAiBWEN5P9svbNNH68DU%2FqBgWlsTprlCAy86Nd8%2FgyqYAiiqIBAix%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMciHvEFjfrvBt541SKtwDFrKZp6wtNhl3JEevvoJrbA%2FVsNWTu5HANZFNTLr0Vvj6TBkAfbatUnYoqu0lcDxflNhpMGHHFhz%2BU%2BqJ2vkjjFEjMf%2FYaHywpD0pSCf5L2UGlV62r2BxMq8gRO%2FCLVQntUkRiPJeGeL1YD%2B94lTAzLo3yaxHqZopGt9MXwFvfTn2zJ5G%2FCl6m9ynXlkZTDV4Pgj0HNe5RpFVofUR1%2Bl9t2YCdW9Wdr4aeji%2FjZcHUtthyEVeRpT4dNt27YpOvhY%2BqGqaecBNnHG8M%2FAH7ev9so4vx%2BerH%2BVBLDzMmGIoJGan5OyDIxiD%2FJdDH8P2g61BBpPYvW%2FNEm76YejaTSfTPB4AZmVjfzWwsxeoIaM5iTqW6tuNb3Muf7%2BOm3jj8QWgc1L4ScDM8Pww9tZ%2BwXrhWl74PcFebsSFvNNaj5LmOgStoEswvSR5zEg1RmwVLbHh38xFwdBjtdQrXisig4Je4Wt7eFhEca4uHBdpUxpEaueLUGCRvHOfBAA2aEefF%2BpJitDXdmgfijlDNA%2FYBH0XMuDfIM7dYJFUPsydh7fcOb5%2BV2N064iarZ7%2BJH2lWX8ElL3756yRhcAivM%2FOP3UIZXw8voJs6H56vfY%2FonTYyrdkFeYYKR5lKXr%2FNlUw8sfC0gY6pgEr0rG6U1YFDRKHbk%2FvodCPnTXzqw6T7wYtq0i1Mut508BtLFE7PmZGAjmskhXTwTNlXkT%2F1A1gAuPO8CArVY85snY45PJT3aPTSmhWRaXF9eIaCsZMJzeCR%2FsIqfqNTFWpqga06jPorWFQmtqPR26HzINPcVY0Oc1vsXv17O9eAcwK89mwnpKR1mo0hEHzRhVnOrXrDik7oO3GyJe%2FeIuEfoTJbGk0&X-Amz-Signature=54ffd268df25f8cc4e819584ca2e4d07c02f4efac403f6967f01cd4fc748eb98&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4662VARH7ND%2F20260710%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260710T091628Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEOj%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIGr%2FueE9VqISMZ5D4bxo7MxkJ2GXv083vf23FzrgfKSoAiBWEN5P9svbNNH68DU%2FqBgWlsTprlCAy86Nd8%2FgyqYAiiqIBAix%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMciHvEFjfrvBt541SKtwDFrKZp6wtNhl3JEevvoJrbA%2FVsNWTu5HANZFNTLr0Vvj6TBkAfbatUnYoqu0lcDxflNhpMGHHFhz%2BU%2BqJ2vkjjFEjMf%2FYaHywpD0pSCf5L2UGlV62r2BxMq8gRO%2FCLVQntUkRiPJeGeL1YD%2B94lTAzLo3yaxHqZopGt9MXwFvfTn2zJ5G%2FCl6m9ynXlkZTDV4Pgj0HNe5RpFVofUR1%2Bl9t2YCdW9Wdr4aeji%2FjZcHUtthyEVeRpT4dNt27YpOvhY%2BqGqaecBNnHG8M%2FAH7ev9so4vx%2BerH%2BVBLDzMmGIoJGan5OyDIxiD%2FJdDH8P2g61BBpPYvW%2FNEm76YejaTSfTPB4AZmVjfzWwsxeoIaM5iTqW6tuNb3Muf7%2BOm3jj8QWgc1L4ScDM8Pww9tZ%2BwXrhWl74PcFebsSFvNNaj5LmOgStoEswvSR5zEg1RmwVLbHh38xFwdBjtdQrXisig4Je4Wt7eFhEca4uHBdpUxpEaueLUGCRvHOfBAA2aEefF%2BpJitDXdmgfijlDNA%2FYBH0XMuDfIM7dYJFUPsydh7fcOb5%2BV2N064iarZ7%2BJH2lWX8ElL3756yRhcAivM%2FOP3UIZXw8voJs6H56vfY%2FonTYyrdkFeYYKR5lKXr%2FNlUw8sfC0gY6pgEr0rG6U1YFDRKHbk%2FvodCPnTXzqw6T7wYtq0i1Mut508BtLFE7PmZGAjmskhXTwTNlXkT%2F1A1gAuPO8CArVY85snY45PJT3aPTSmhWRaXF9eIaCsZMJzeCR%2FsIqfqNTFWpqga06jPorWFQmtqPR26HzINPcVY0Oc1vsXv17O9eAcwK89mwnpKR1mo0hEHzRhVnOrXrDik7oO3GyJe%2FeIuEfoTJbGk0&X-Amz-Signature=5240ae3d6bb978ae49f41da376114ca5b56cc6cf205d9c529a544981ba75b29d&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

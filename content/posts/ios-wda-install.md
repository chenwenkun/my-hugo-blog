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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4666B6M2QMM%2F20251227%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251227T122100Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJ%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQDm1W5UmfGnL9cauiYUjCLezNMzUbchonoL%2FY8GczvDHQIhAIghoWDez9t2Ih5b69AteZy3RpQXQdyzBcr%2B8PABukLBKv8DCGgQABoMNjM3NDIzMTgzODA1Igz2CNEwdJsjqrKF71kq3AM4B1CEilXMggerUOp%2FrpSv2HW1NCNVitJNKS7ZyfS6SW5GT2QFEvfNi%2FWoVdJdLdgwZo4KxFGg3RNig3NPS8XMK61uk0G%2Bm0i9bG7%2B4R%2FY%2F4CtcfGgMwrv8Rvs9tQ6rC%2BAoBaFjFNDpE%2BlBpONgQuzMxcSrg17TFJJ51oUvGqxDgH1BI4BGah2HV1skD2HEZo%2BAPSxRzzCMJr%2Fa4yN6u%2BdRMpuQPQboYqeBA7LYQvcGf%2BXirruaU9Uj1yuzgESK7jOy%2FMEG5V5FcQbWXUsYHtsZ66Vvj%2F5GFk%2BBMGjiXeS1aBXO1o%2BZ92%2BI6Z2xTs0bqe6OG1AzPhVsmx6Ugi%2FOfibkOgoNYpKd%2BCUICJQD1d7W0NTa5PGd59QNxi%2Bq6H6UwN8riBbIdDpccl8AgfGCh8RooX%2FeK2p4j2CB9BgqPVgE%2FEkFcVfBsg7OqC5WGxz1FjtBv%2F59X3QpSsG59RzgGOTPlXde8IkIE7jZ8p3KR%2FU4%2F%2F%2F%2B06SpkOSN1%2BKd2qeJqJtuaV3ZvMG7IBEvodA0YF9n2VSUCy%2FFT6hF7CqQr8rcDz%2B01OW8oXmVkr9dbCTJtzsEH8e5pb32dh%2BWoohaDxHllJz4KK9NLTVc5ZKyvCfYmL8Tt%2Fw5k7yW8r6WDCA%2Fr3KBjqkAbQwYjns%2FQKFRLjsSzlltj%2FvmJ4EFQMFvuq8iOdDW%2F26dVjriae2m1TYqKMfxRfxmr5tjKi1H3RIcS8embnAyOOu8PnCBab9jYiuYgO%2BbFFtdNb7muNu3ksJn5nzTonxDt02xFoiLGRKByHcUQCUEs7VMxd1gOMVCJjNaE0JXDaSNACYENIWHDHaxuhdIubyy%2FRSoMBCpcoa4PY0dZgepdhb9ghD&X-Amz-Signature=b897d2bd02f9f34a6206dc936eea2e421076e45c94e53579daab6dcc7de42a36&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4666B6M2QMM%2F20251227%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251227T122100Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJ%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQDm1W5UmfGnL9cauiYUjCLezNMzUbchonoL%2FY8GczvDHQIhAIghoWDez9t2Ih5b69AteZy3RpQXQdyzBcr%2B8PABukLBKv8DCGgQABoMNjM3NDIzMTgzODA1Igz2CNEwdJsjqrKF71kq3AM4B1CEilXMggerUOp%2FrpSv2HW1NCNVitJNKS7ZyfS6SW5GT2QFEvfNi%2FWoVdJdLdgwZo4KxFGg3RNig3NPS8XMK61uk0G%2Bm0i9bG7%2B4R%2FY%2F4CtcfGgMwrv8Rvs9tQ6rC%2BAoBaFjFNDpE%2BlBpONgQuzMxcSrg17TFJJ51oUvGqxDgH1BI4BGah2HV1skD2HEZo%2BAPSxRzzCMJr%2Fa4yN6u%2BdRMpuQPQboYqeBA7LYQvcGf%2BXirruaU9Uj1yuzgESK7jOy%2FMEG5V5FcQbWXUsYHtsZ66Vvj%2F5GFk%2BBMGjiXeS1aBXO1o%2BZ92%2BI6Z2xTs0bqe6OG1AzPhVsmx6Ugi%2FOfibkOgoNYpKd%2BCUICJQD1d7W0NTa5PGd59QNxi%2Bq6H6UwN8riBbIdDpccl8AgfGCh8RooX%2FeK2p4j2CB9BgqPVgE%2FEkFcVfBsg7OqC5WGxz1FjtBv%2F59X3QpSsG59RzgGOTPlXde8IkIE7jZ8p3KR%2FU4%2F%2F%2F%2B06SpkOSN1%2BKd2qeJqJtuaV3ZvMG7IBEvodA0YF9n2VSUCy%2FFT6hF7CqQr8rcDz%2B01OW8oXmVkr9dbCTJtzsEH8e5pb32dh%2BWoohaDxHllJz4KK9NLTVc5ZKyvCfYmL8Tt%2Fw5k7yW8r6WDCA%2Fr3KBjqkAbQwYjns%2FQKFRLjsSzlltj%2FvmJ4EFQMFvuq8iOdDW%2F26dVjriae2m1TYqKMfxRfxmr5tjKi1H3RIcS8embnAyOOu8PnCBab9jYiuYgO%2BbFFtdNb7muNu3ksJn5nzTonxDt02xFoiLGRKByHcUQCUEs7VMxd1gOMVCJjNaE0JXDaSNACYENIWHDHaxuhdIubyy%2FRSoMBCpcoa4PY0dZgepdhb9ghD&X-Amz-Signature=568fdd6a9035ba63ee4c978e99f947acdccca3c070fb51c83094437ffd845589&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

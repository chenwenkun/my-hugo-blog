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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466T5P4NBOH%2F20260525%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260525T022808Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJH%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIGtP%2BWCuO3%2B3vuRWUSIL4WYaNbWbiR%2FC3uh9oO0gxrKwAiAYJR8xHBweN0iaEZcsBnOdH26KcVc1DOaGl4oBN9O%2Feyr%2FAwhaEAAaDDYzNzQyMzE4MzgwNSIMfxqNjRinpeS8UCcVKtwD9H%2BAh3howCLPIEJ2o3ghdh6sCEYYQ3Gt4caPQUPKfALgMbEOe9NjC%2FTdZ%2F2NKxMuTdeUhnOlMXDqIO%2FOxrzYhANWNbspWo9Sl08Zjc7SVB1D6XnoHmW8kXLC3y06RPkPdTDNAaeOXi1GX483IQxwpuJcPh2WHgaWs%2B6ummSHhK1VeJC8OHyVdSK%2BmXT%2B9it0MBBgZyAOFmtlB9R9fXI%2BQFRajoDyBxYj%2BqCf8TG%2FlusfCmKGn1xvQgbQaJPCmQJaMo9B%2FLy4JMdsW%2FJLwuT34gwzJgRhN5L77aakIh%2FlBXm03EWSC0v2d8sTsxExKg75RlcVwvvCgUa7ZqnIy723CesxTBFDNIx%2Biym937YZ4qVkAMnwhQ7dpESRmp1xBk0%2F00CnIGxG9hzBCyZ%2B%2BLP8KRWFcAuVpcfD05gJfg%2BKF9r3vottWQIYGj3dsrRmP%2B%2BTRggOgoCUngkpJh2xw9VzP%2B9yhN7XXrYBmMjL66K2zZygpXRgIBvW6pqAErzkF4so9gezgeVgBmmfYTP%2FaL8HNPZRk3DhzZROGhcuUDanGgu2Y20cF59DbXwC1Za3%2FaqMEsyMqwE4Uf1Qj1kIJMmDLQe3RpeGQUh5fjez9VYwK5IDECeK53Z8aEaFQfIw47TO0AY6pgFa1k3bhO0R6KakD2QNWBAqyBB5ArU3CYfM%2F%2B2khp%2Bf5B2aSUAv3x5%2FK9yPfQ%2FwiGkcRixo1SRZU4HkOiVr2Uk0%2FPwOPNBJ9HeSD5GCUukwc5SPnszpTwh%2FB2iamJwDn78k1aPMd%2BpZ7ix1KIzZcH1A80wAnAMdnWU8EHt5kB0URiNEsHuea03zgM5F1wMKLKKn4DDT%2FYqfqZMuo4NoQ%2B8OO03CkOFl&X-Amz-Signature=8ea29f44b6b5b91da58946c9b4b2b69d5d93cc0df266c7412fb248a7505c71ee&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466T5P4NBOH%2F20260525%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260525T022808Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJH%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIGtP%2BWCuO3%2B3vuRWUSIL4WYaNbWbiR%2FC3uh9oO0gxrKwAiAYJR8xHBweN0iaEZcsBnOdH26KcVc1DOaGl4oBN9O%2Feyr%2FAwhaEAAaDDYzNzQyMzE4MzgwNSIMfxqNjRinpeS8UCcVKtwD9H%2BAh3howCLPIEJ2o3ghdh6sCEYYQ3Gt4caPQUPKfALgMbEOe9NjC%2FTdZ%2F2NKxMuTdeUhnOlMXDqIO%2FOxrzYhANWNbspWo9Sl08Zjc7SVB1D6XnoHmW8kXLC3y06RPkPdTDNAaeOXi1GX483IQxwpuJcPh2WHgaWs%2B6ummSHhK1VeJC8OHyVdSK%2BmXT%2B9it0MBBgZyAOFmtlB9R9fXI%2BQFRajoDyBxYj%2BqCf8TG%2FlusfCmKGn1xvQgbQaJPCmQJaMo9B%2FLy4JMdsW%2FJLwuT34gwzJgRhN5L77aakIh%2FlBXm03EWSC0v2d8sTsxExKg75RlcVwvvCgUa7ZqnIy723CesxTBFDNIx%2Biym937YZ4qVkAMnwhQ7dpESRmp1xBk0%2F00CnIGxG9hzBCyZ%2B%2BLP8KRWFcAuVpcfD05gJfg%2BKF9r3vottWQIYGj3dsrRmP%2B%2BTRggOgoCUngkpJh2xw9VzP%2B9yhN7XXrYBmMjL66K2zZygpXRgIBvW6pqAErzkF4so9gezgeVgBmmfYTP%2FaL8HNPZRk3DhzZROGhcuUDanGgu2Y20cF59DbXwC1Za3%2FaqMEsyMqwE4Uf1Qj1kIJMmDLQe3RpeGQUh5fjez9VYwK5IDECeK53Z8aEaFQfIw47TO0AY6pgFa1k3bhO0R6KakD2QNWBAqyBB5ArU3CYfM%2F%2B2khp%2Bf5B2aSUAv3x5%2FK9yPfQ%2FwiGkcRixo1SRZU4HkOiVr2Uk0%2FPwOPNBJ9HeSD5GCUukwc5SPnszpTwh%2FB2iamJwDn78k1aPMd%2BpZ7ix1KIzZcH1A80wAnAMdnWU8EHt5kB0URiNEsHuea03zgM5F1wMKLKKn4DDT%2FYqfqZMuo4NoQ%2B8OO03CkOFl&X-Amz-Signature=8eb978aa7c0662c26e9ad0b57798fe6e04962c5d7f9d01ceb6026cfc009372dc&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

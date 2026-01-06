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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663E4NNG6Z%2F20260106%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260106T122506Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJT%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQDeHWVZpFCYD%2FAiLv%2FyP8E6319hdiSWv2p8H3zlVPkaigIhANyCGs9cWsPVgDczlmr2Hm96%2FK5HXu29wMzdGZmtTkEAKv8DCFwQABoMNjM3NDIzMTgzODA1IgyYDRTt9Xqdf4ZOWe0q3ANTcU%2Fc3rWAuOQP2Kw0olo%2FVNcSRhB23gNPnNJIA%2Beo33FaIQJ4tTWrYmsdnTTg2q9NgnuGIIAqlC6%2F4Kmg5MB%2F6So7lMQqYWPIURf00tLj%2FsSFsBtp9GfCaMsFfvzCP2jMuXsCGbAyk3kuAeWbVvwA%2BmDTGsFKK2ezP2MKYlbvQ9a3%2Fw5QvkdAdJfDJtus5%2FGiP1W%2Fg40VNvX%2B5%2BhGGaAkSYpsvzU%2B3Fen5sa7YQ12WuQB1IDZdvSgkCle%2BeK1xU0uQArtZEtUT2oIhXl6qxhDVThH%2BSXcl4edfPogz45eBnru%2BOkfp%2Br8dfT%2BmV%2FN7ux%2B6VcDlBwCRtHeNnz25uFPjUVIsf%2BPI51sJbD6i5%2F0T1wCClGmLfZYA4tKwTOZIv6c7g89D2Vug0IiBuQf88Nz7%2Bmzblg7ZXz7rY1gAGm%2BvU55UkIqJMku6KBczjB6cTHJlSGCqyV1tFMyMo4lFO2b686D4JFSg6GncXS9SqD5cm%2BR3bfumLszqw3%2Fpk3TR6%2FuKKhF9obQUpxR7pQiOT0Krjw8%2Bop9xJ0gfj%2BB0bqUurMX0Ue0XBuqpcC3GwOjCcNjPpIr90WfIMD58se5jQXtuOAKrlhw3M2PV%2BmOWGCVukYKBUyWShPJXKcxaDCb3%2FPKBjqkAc1b%2BQlqORbmZfWBKSvSbgcxTHi9wWb9vT5uXG6r5RwoNOCl8a8vg4ix2YBWGLnhraWrupWhiUhOY91lUPbBVr519YakF2zjDLRk6fcmrwMUAz%2BNn%2BkH0K1CWqF4zWP2Ixh18L5GgHMqpawVMVK2mc%2F1ZycSl%2Fm24ilZLeZsia%2F7Ut%2Bqb9rmB0%2Bxe0Xd6NWiO7oDDsrE4c7WWKbtdvymDKNytr4h&X-Amz-Signature=f1b7ef5f3e41f447e969a4e8a1da817c3bcc507a1fbce8d00ddc4520f72c6e4f&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663E4NNG6Z%2F20260106%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260106T122506Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJT%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQDeHWVZpFCYD%2FAiLv%2FyP8E6319hdiSWv2p8H3zlVPkaigIhANyCGs9cWsPVgDczlmr2Hm96%2FK5HXu29wMzdGZmtTkEAKv8DCFwQABoMNjM3NDIzMTgzODA1IgyYDRTt9Xqdf4ZOWe0q3ANTcU%2Fc3rWAuOQP2Kw0olo%2FVNcSRhB23gNPnNJIA%2Beo33FaIQJ4tTWrYmsdnTTg2q9NgnuGIIAqlC6%2F4Kmg5MB%2F6So7lMQqYWPIURf00tLj%2FsSFsBtp9GfCaMsFfvzCP2jMuXsCGbAyk3kuAeWbVvwA%2BmDTGsFKK2ezP2MKYlbvQ9a3%2Fw5QvkdAdJfDJtus5%2FGiP1W%2Fg40VNvX%2B5%2BhGGaAkSYpsvzU%2B3Fen5sa7YQ12WuQB1IDZdvSgkCle%2BeK1xU0uQArtZEtUT2oIhXl6qxhDVThH%2BSXcl4edfPogz45eBnru%2BOkfp%2Br8dfT%2BmV%2FN7ux%2B6VcDlBwCRtHeNnz25uFPjUVIsf%2BPI51sJbD6i5%2F0T1wCClGmLfZYA4tKwTOZIv6c7g89D2Vug0IiBuQf88Nz7%2Bmzblg7ZXz7rY1gAGm%2BvU55UkIqJMku6KBczjB6cTHJlSGCqyV1tFMyMo4lFO2b686D4JFSg6GncXS9SqD5cm%2BR3bfumLszqw3%2Fpk3TR6%2FuKKhF9obQUpxR7pQiOT0Krjw8%2Bop9xJ0gfj%2BB0bqUurMX0Ue0XBuqpcC3GwOjCcNjPpIr90WfIMD58se5jQXtuOAKrlhw3M2PV%2BmOWGCVukYKBUyWShPJXKcxaDCb3%2FPKBjqkAc1b%2BQlqORbmZfWBKSvSbgcxTHi9wWb9vT5uXG6r5RwoNOCl8a8vg4ix2YBWGLnhraWrupWhiUhOY91lUPbBVr519YakF2zjDLRk6fcmrwMUAz%2BNn%2BkH0K1CWqF4zWP2Ixh18L5GgHMqpawVMVK2mc%2F1ZycSl%2Fm24ilZLeZsia%2F7Ut%2Bqb9rmB0%2Bxe0Xd6NWiO7oDDsrE4c7WWKbtdvymDKNytr4h&X-Amz-Signature=1da518b8f1f0892771b8d480cbb928a7099f61f3d3ad474d44a7dca324a2c58f&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

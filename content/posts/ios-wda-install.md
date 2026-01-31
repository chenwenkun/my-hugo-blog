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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466X7AYEP4J%2F20260131%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260131T122445Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEOv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQC5rTZNoViAfIUaus00VPGFn1mJw1clS3d4jIAaGt6XBwIhAM3E8dYHMQ%2FOLTHiZ2V9qRv6gljYP7D16T9y1%2F%2FXXNL6KogECLT%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgwsD1d1vjnEDJvgu20q3AP5Oqh6MOsU4FV2aXEt56IBtw5g2RISrs5lZ2mxtETIOekKgsiPWNtN1fVflE0bv1WKdpAzqows%2FJPdwxRvlLO5Har73MjcUgBxfEo7Ssv55Pqzc3YpO0c4EybGoUUUyKNsXG%2B7zNMq94J1%2FiMnOkZ%2B6fwd4LO7lGoBKEoJa1ISlu1YhD3BIPbDgSQYkhqmgMBlc9uigwuCkITHFWPGhymR65vzbmB7pX%2F1zvrPMWQPOsgGUKtMRlai3nQRm8hZ2Q7caXZ%2FiXVcACtXJcUy5a7ngNRZBWVKinfJ7Jr1ra7jeomleYvpPbOUeXf%2BPE0YZ3RHXrHsnPyIFg7rVBDb2YRkqcgi9wX6s7hzOoFGQ4S4IsubnBZT7nPqFqEryQiBDKmJEnd9kq99EkjVCUm70G6uOHCdUk0mcIUlBFlrMc41RMRSkkUhHMg%2F2EwaOwiR0lipiTCjp5vsa0aQmjvvCY9AybDkC6Dc6VQ64D2dQ87a6cmHGn%2FtQHZ8qq7E6qp97qIr5GcBdoqKyIf2jVnMUvc3LUJD7jLvlmoHrtRUwp5suRwhfPrVxx0pufylDxGPH7rnzJeRMdYf7szsJvSssUVOzhgpGvu%2Fd5yD%2F9EvZ3CJPmWx2iklXvEFTq8DjjC2vPfLBjqkAZ1x9lMEVUCu2yzTeICAXgC0YncBxWIZBa6JHgst8SGuvDzvtG23pu5bzCkMrZVxqs7UBAr4KQ2JNQ8IeB%2BtZxa%2FqJgYFvfQOQcQSuz%2BHnLvlMVlqYQ0TGhMDhlqMU7pVvM3lob08TsPcfZT6RtUNmaFgXJP7wtuux7KyNJruOktXYyi2deUr%2BxJ2KhMNl7wu9RjKvfXMEgkLj7BzVID7IiEKaAR&X-Amz-Signature=6cfaad6e008219133e766a77fee019e65f313dd5f6bb8d1bb3cb7eb9b862caa6&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466X7AYEP4J%2F20260131%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260131T122445Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEOv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQC5rTZNoViAfIUaus00VPGFn1mJw1clS3d4jIAaGt6XBwIhAM3E8dYHMQ%2FOLTHiZ2V9qRv6gljYP7D16T9y1%2F%2FXXNL6KogECLT%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgwsD1d1vjnEDJvgu20q3AP5Oqh6MOsU4FV2aXEt56IBtw5g2RISrs5lZ2mxtETIOekKgsiPWNtN1fVflE0bv1WKdpAzqows%2FJPdwxRvlLO5Har73MjcUgBxfEo7Ssv55Pqzc3YpO0c4EybGoUUUyKNsXG%2B7zNMq94J1%2FiMnOkZ%2B6fwd4LO7lGoBKEoJa1ISlu1YhD3BIPbDgSQYkhqmgMBlc9uigwuCkITHFWPGhymR65vzbmB7pX%2F1zvrPMWQPOsgGUKtMRlai3nQRm8hZ2Q7caXZ%2FiXVcACtXJcUy5a7ngNRZBWVKinfJ7Jr1ra7jeomleYvpPbOUeXf%2BPE0YZ3RHXrHsnPyIFg7rVBDb2YRkqcgi9wX6s7hzOoFGQ4S4IsubnBZT7nPqFqEryQiBDKmJEnd9kq99EkjVCUm70G6uOHCdUk0mcIUlBFlrMc41RMRSkkUhHMg%2F2EwaOwiR0lipiTCjp5vsa0aQmjvvCY9AybDkC6Dc6VQ64D2dQ87a6cmHGn%2FtQHZ8qq7E6qp97qIr5GcBdoqKyIf2jVnMUvc3LUJD7jLvlmoHrtRUwp5suRwhfPrVxx0pufylDxGPH7rnzJeRMdYf7szsJvSssUVOzhgpGvu%2Fd5yD%2F9EvZ3CJPmWx2iklXvEFTq8DjjC2vPfLBjqkAZ1x9lMEVUCu2yzTeICAXgC0YncBxWIZBa6JHgst8SGuvDzvtG23pu5bzCkMrZVxqs7UBAr4KQ2JNQ8IeB%2BtZxa%2FqJgYFvfQOQcQSuz%2BHnLvlMVlqYQ0TGhMDhlqMU7pVvM3lob08TsPcfZT6RtUNmaFgXJP7wtuux7KyNJruOktXYyi2deUr%2BxJ2KhMNl7wu9RjKvfXMEgkLj7BzVID7IiEKaAR&X-Amz-Signature=35a750734b80fda1ac027e8cce6b28a5c1c723bd44861a1d326ff8e67047b7f3&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

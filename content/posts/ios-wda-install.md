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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466T57TJ272%2F20260405%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260405T012259Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEOH%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQDrwtFsIokPrlAE5Hr1NMunnvh%2BZkSqynH5mQuiGujEGgIgex1dRsAIGfp%2FIoDYnQqOD2Q%2FHkatYS9ijAVfsuDf4BIqiAQIqv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDKQHzodVsqTcPhPMnCrcAx%2Bmq0Ok4wNpe6Oj642IooEVkmzAg2nPBsB10JRKr48sxh7WYT1vyZ96PscA0KBBvl5th%2Bov5Hf%2BH2P%2FtsWLLeP%2BCEaPS5yYc06n2C%2BACpCtaoWjh65sHV6cmnLMWL9%2FiF52NddQn0T%2BdntByNR7WdUH4P66HdkHSJT%2F9H99cwcMdWuj%2FRzqI%2FX7hN9kuaJzd4Ww3LGgDqzw4%2B4Wa6Atzw2tozNHc8Gc72T34GfKR5k3wOdoQe8LOQ2AxpbUtm9XAl9ueEycOxJLyPMWGJBKU96zk5Vc2SSjdo3MMpUWEbGVsRzQC1Jc%2FlYMqpSroiZw3iyVOeXTq9VKw0cVVkO7dvRsllJIYl5xudA4zwu4b0%2FmKUZcrPGmO7iqw1OqBpGYoAwfi5wP53eiLhmkzpMWfBok%2BA5MbIvLF%2F6G3P6gUlsRPfCuFflxBmMVWMX5wbMqQutiUSP6IuQLkIv%2BkULG0YY1nCOrYRCHuCQP3tzexh3gqZra2qmSlCtV9OZRNJrw%2FzklY4g%2Bt2FwXaXqhOIpxdQr9Hx%2F9il7nuG32JOhty%2F%2BNYxfUFhWf%2Bh02vaK02zfsz7mYOoxRjpxLjA%2BlvT2zVfmsA4mxehENRUPAKYPIY6RpBRtleROpJsXpKrnMKPoxs4GOqUBb04ATZEJx2tdHgolpSZx5o5uQVuY55NE1iXUv1WS0Szbf9jIff6MpWyIdK9xqh29XADTP26ylvicMYah%2F5TXX5QqOn0PQi6rJh3dKHSD6Z3jGAFFVBUk4%2B9u0gSuHsxXw1kq2EqIkhZuECSssffMXQb3p7WN5NkS7%2FOU8%2BkAlUzgi5xyiBagCUgcYW75QTKU1ZEupumUXJn0hEgIMnAEfFaCOLTm&X-Amz-Signature=42038404f98623b208af1ec785a02e20b20b591f2adfe0d0a02b2fec0210c9e0&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466T57TJ272%2F20260405%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260405T012259Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEOH%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQDrwtFsIokPrlAE5Hr1NMunnvh%2BZkSqynH5mQuiGujEGgIgex1dRsAIGfp%2FIoDYnQqOD2Q%2FHkatYS9ijAVfsuDf4BIqiAQIqv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDKQHzodVsqTcPhPMnCrcAx%2Bmq0Ok4wNpe6Oj642IooEVkmzAg2nPBsB10JRKr48sxh7WYT1vyZ96PscA0KBBvl5th%2Bov5Hf%2BH2P%2FtsWLLeP%2BCEaPS5yYc06n2C%2BACpCtaoWjh65sHV6cmnLMWL9%2FiF52NddQn0T%2BdntByNR7WdUH4P66HdkHSJT%2F9H99cwcMdWuj%2FRzqI%2FX7hN9kuaJzd4Ww3LGgDqzw4%2B4Wa6Atzw2tozNHc8Gc72T34GfKR5k3wOdoQe8LOQ2AxpbUtm9XAl9ueEycOxJLyPMWGJBKU96zk5Vc2SSjdo3MMpUWEbGVsRzQC1Jc%2FlYMqpSroiZw3iyVOeXTq9VKw0cVVkO7dvRsllJIYl5xudA4zwu4b0%2FmKUZcrPGmO7iqw1OqBpGYoAwfi5wP53eiLhmkzpMWfBok%2BA5MbIvLF%2F6G3P6gUlsRPfCuFflxBmMVWMX5wbMqQutiUSP6IuQLkIv%2BkULG0YY1nCOrYRCHuCQP3tzexh3gqZra2qmSlCtV9OZRNJrw%2FzklY4g%2Bt2FwXaXqhOIpxdQr9Hx%2F9il7nuG32JOhty%2F%2BNYxfUFhWf%2Bh02vaK02zfsz7mYOoxRjpxLjA%2BlvT2zVfmsA4mxehENRUPAKYPIY6RpBRtleROpJsXpKrnMKPoxs4GOqUBb04ATZEJx2tdHgolpSZx5o5uQVuY55NE1iXUv1WS0Szbf9jIff6MpWyIdK9xqh29XADTP26ylvicMYah%2F5TXX5QqOn0PQi6rJh3dKHSD6Z3jGAFFVBUk4%2B9u0gSuHsxXw1kq2EqIkhZuECSssffMXQb3p7WN5NkS7%2FOU8%2BkAlUzgi5xyiBagCUgcYW75QTKU1ZEupumUXJn0hEgIMnAEfFaCOLTm&X-Amz-Signature=e39127cdbc403a9693727b891b00a29c29c75d5839871f85e23e2524c9c38fea&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466WD7QUYP2%2F20260423%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260423T072136Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIH5IPZYLj%2FVCGIj9216GxmoxLlxcJNw0YtE%2BXNptx%2FcQAiAm8AukHUB5GN%2Bu4XM5zvw5ZmfalWU7BtkylV4JWDaYNSr%2FAwhgEAAaDDYzNzQyMzE4MzgwNSIMd9nlM7bnrBmR%2B1lYKtwD9vVxjs5MwzR%2FjPsvni6OGnSXDl0KYEscTnaSeWH4V2zelN6qDswBOoFvYl47hRQZGiLF3xExA03k77pnFxAE8A7VnBP0Reda%2Bk53NLM967L9tSF1zuHFQTpVfKmrIdwidg7ujmVVeQjFRZvNbqqEPETKq8XvNOd%2FyFlCHGvBlrDO07xITalrYlFGfeDqPzfXbtxPhI4QB4ZfvAeHWSE5Tnnhn6WczHndZEaqiHHdf4wYGa2dDp2XINwp8bOo3liftT7zXcTVZc6cI1gyb1t0g8yUfROO3XQTNQv5tnKK3BRMV1aTf3OTpniezw%2B957M2KxlVS3zPI2jUgxs8XJeKN%2BgtSNXT15aiDPCRlBrEyf9XhJd1aMjj3qkFL0LIHfWr5XxwJCwwWEd8P07zRD1x1p3wVTh7v2%2BQphD0L6Q3ZL%2B0GJPaIofWaZLXMqXWGH%2F4x2xvHVBjhagtkxS5uuYh55n%2BsEARlBUBFspighGfuZRTHVDp51vxfxNbFVTJ%2BTexszbUYfJ%2Bo1hfUwW49NDSKyY2SA7eyOnvU9JBV8nvcBabjubWR614Juq0nvNp43DplZ60bMQp6jaUnaPWgj1SpAMf6ei0WCy%2BffPQ%2FG9V0DpgbEVb9Qx8kaMoWlwwhYynzwY6pgE3Rbp8JJWYPQrwtxjx%2FhCNwP6b3lkP87SYQSOGpQCX2nPTRqIUcXp4piSDjKCaXP34QHdyVWkZKYZcOLYdiczFVUZoXIlc592W%2BWVxgVKLDgBQUTMdE6jBpIOKvsJ3aOg977WvV8dxc5ST35CKhsjapRr6ZRuPaTRsMUa5fgYBMF3VNFU37JiKx5J%2B3Vh4Az5FHEhNYmTQNEaYuksapoI%2FCZDSJ7fp&X-Amz-Signature=7593bde8dd6128833f20554946e06d523b55f6b520a54a71a00be95440962695&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466WD7QUYP2%2F20260423%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260423T072136Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIH5IPZYLj%2FVCGIj9216GxmoxLlxcJNw0YtE%2BXNptx%2FcQAiAm8AukHUB5GN%2Bu4XM5zvw5ZmfalWU7BtkylV4JWDaYNSr%2FAwhgEAAaDDYzNzQyMzE4MzgwNSIMd9nlM7bnrBmR%2B1lYKtwD9vVxjs5MwzR%2FjPsvni6OGnSXDl0KYEscTnaSeWH4V2zelN6qDswBOoFvYl47hRQZGiLF3xExA03k77pnFxAE8A7VnBP0Reda%2Bk53NLM967L9tSF1zuHFQTpVfKmrIdwidg7ujmVVeQjFRZvNbqqEPETKq8XvNOd%2FyFlCHGvBlrDO07xITalrYlFGfeDqPzfXbtxPhI4QB4ZfvAeHWSE5Tnnhn6WczHndZEaqiHHdf4wYGa2dDp2XINwp8bOo3liftT7zXcTVZc6cI1gyb1t0g8yUfROO3XQTNQv5tnKK3BRMV1aTf3OTpniezw%2B957M2KxlVS3zPI2jUgxs8XJeKN%2BgtSNXT15aiDPCRlBrEyf9XhJd1aMjj3qkFL0LIHfWr5XxwJCwwWEd8P07zRD1x1p3wVTh7v2%2BQphD0L6Q3ZL%2B0GJPaIofWaZLXMqXWGH%2F4x2xvHVBjhagtkxS5uuYh55n%2BsEARlBUBFspighGfuZRTHVDp51vxfxNbFVTJ%2BTexszbUYfJ%2Bo1hfUwW49NDSKyY2SA7eyOnvU9JBV8nvcBabjubWR614Juq0nvNp43DplZ60bMQp6jaUnaPWgj1SpAMf6ei0WCy%2BffPQ%2FG9V0DpgbEVb9Qx8kaMoWlwwhYynzwY6pgE3Rbp8JJWYPQrwtxjx%2FhCNwP6b3lkP87SYQSOGpQCX2nPTRqIUcXp4piSDjKCaXP34QHdyVWkZKYZcOLYdiczFVUZoXIlc592W%2BWVxgVKLDgBQUTMdE6jBpIOKvsJ3aOg977WvV8dxc5ST35CKhsjapRr6ZRuPaTRsMUa5fgYBMF3VNFU37JiKx5J%2B3Vh4Az5FHEhNYmTQNEaYuksapoI%2FCZDSJ7fp&X-Amz-Signature=0f8b3a35a3c98ab8cff25696e4bcb8bd9a36e132cbff6975fdf70e81288ccfa6&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

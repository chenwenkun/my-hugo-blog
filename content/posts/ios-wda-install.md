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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466TCRWMW5V%2F20251107%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251107T061726Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEO7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIGglTEfSQziVytD20BkfBvwSxTHJAAUbfEOmw%2FHslFybAiBj3prcrbs7wjC6OYqoLDX1G6FMKjNqSCJHo0zgRhvc2iqIBAi3%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMlA28cuUHJ1yKpqqVKtwD1s2V6hT2Pnvi44qIdfXw9jsZ2RjCaB4gd5m7k4Tbxf54VBxB2ZnheqsIhQMFtPaRjBFYGf08Ppfq0cggz3phBL0%2BKOEwGb8v99JAitPdT6i8GbijCy9uFWsbGYuPPKbiBiDi5Zh5fjG9vHCinY3iH48fCBWjUN7zMs93h9%2Bvrvax0w%2BtAYEFwmSKA%2BXSmOf%2F7L%2FpH4PyQUmIQzz4fQlv%2F3lBNZyzcnBUoC3AW2CCDDRDgBA1fkeynZTcAn6%2BI%2FoscODFAn7OHdBoFm9U2mEGcta%2BfkGQq0hY70m0NMoKAEufYLCmuv3fMEFrK7iuU13MByVaf41HYjHGGPHtHH52U8%2BrUGOn4Rdpm%2Bnt%2FQSmVgsKWmunXmQbfkwB0zYN9oGdTc%2BXvwp47isw3ST2JWlG8uI55aHSl1fr%2F3bRnnJl85tQfTkFvTkq%2F8QiHMJGiYmv9yMJYWaCEqCruqOWHaILlrpXA4AGtrGesPtr3ubwzsgXmcYzYZclUwr%2BvqcDjWohHhHVYayBfMo2iCTX1ZdSr7VQBc8NEXO3n1eXoiQIuAg40TlvmbBjPrK2z04MGGJvh3Z9QYoPivFNdzdlypeYZmSmUwjLUyFSq%2FIPuX98knXiss5czap35cgUxU0wmo62yAY6pgHedxQmgL%2BzW1qmr6JZFw3b5m6OBhN0a3eWl6WNemIIDgXLR2YK%2B5wtDG64NE9KU7Mvrv4AC86oxUSkBMAich%2BMfFBLSL8Oo7K6zIzH43K0s81QwETmXDtdaVOiF6hx%2FS4FQSU8Lw4YtB3ojvt%2F8IQLWfhDpC9A7zAipe8iYGTkyRkUkpkng3Cqt4vO9SLQMyshAUtVtRRJjHpxShVmcG98se06rLE1&X-Amz-Signature=db1634934a46e1458828523a904b692d71e47d96c4b9f9c4fb218ba1541c90c6&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466TCRWMW5V%2F20251107%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251107T061726Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEO7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIGglTEfSQziVytD20BkfBvwSxTHJAAUbfEOmw%2FHslFybAiBj3prcrbs7wjC6OYqoLDX1G6FMKjNqSCJHo0zgRhvc2iqIBAi3%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMlA28cuUHJ1yKpqqVKtwD1s2V6hT2Pnvi44qIdfXw9jsZ2RjCaB4gd5m7k4Tbxf54VBxB2ZnheqsIhQMFtPaRjBFYGf08Ppfq0cggz3phBL0%2BKOEwGb8v99JAitPdT6i8GbijCy9uFWsbGYuPPKbiBiDi5Zh5fjG9vHCinY3iH48fCBWjUN7zMs93h9%2Bvrvax0w%2BtAYEFwmSKA%2BXSmOf%2F7L%2FpH4PyQUmIQzz4fQlv%2F3lBNZyzcnBUoC3AW2CCDDRDgBA1fkeynZTcAn6%2BI%2FoscODFAn7OHdBoFm9U2mEGcta%2BfkGQq0hY70m0NMoKAEufYLCmuv3fMEFrK7iuU13MByVaf41HYjHGGPHtHH52U8%2BrUGOn4Rdpm%2Bnt%2FQSmVgsKWmunXmQbfkwB0zYN9oGdTc%2BXvwp47isw3ST2JWlG8uI55aHSl1fr%2F3bRnnJl85tQfTkFvTkq%2F8QiHMJGiYmv9yMJYWaCEqCruqOWHaILlrpXA4AGtrGesPtr3ubwzsgXmcYzYZclUwr%2BvqcDjWohHhHVYayBfMo2iCTX1ZdSr7VQBc8NEXO3n1eXoiQIuAg40TlvmbBjPrK2z04MGGJvh3Z9QYoPivFNdzdlypeYZmSmUwjLUyFSq%2FIPuX98knXiss5czap35cgUxU0wmo62yAY6pgHedxQmgL%2BzW1qmr6JZFw3b5m6OBhN0a3eWl6WNemIIDgXLR2YK%2B5wtDG64NE9KU7Mvrv4AC86oxUSkBMAich%2BMfFBLSL8Oo7K6zIzH43K0s81QwETmXDtdaVOiF6hx%2FS4FQSU8Lw4YtB3ojvt%2F8IQLWfhDpC9A7zAipe8iYGTkyRkUkpkng3Cqt4vO9SLQMyshAUtVtRRJjHpxShVmcG98se06rLE1&X-Amz-Signature=591dd34f2f8c923fa9776d9c2a8801a7c58ba1d496649576a95fb4dba96d27f0&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466Q34ROEXU%2F20251123%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251123T121825Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEHIaCXVzLXdlc3QtMiJIMEYCIQDNHc%2FBDXgESJfJCyhhbmjYKRtr%2BKpmTACShtXN6bE9cgIhAOiI6CXFQVBYtqvh9qKVSU%2B%2F3mK6aTdEvQAyVdp9JLh2Kv8DCDsQABoMNjM3NDIzMTgzODA1Igz7JBljBE2l9Fbd6%2B0q3APWQgk0gGYRvv%2FyfyBJRC3WN0CosIUcJcklkkN%2Fxp2HuoQ1fnROY4nd5GPLv7U1gojcXrXOGkN0dF6vvUFuasfOszDwCFWYjXj%2FbGoqL8edAv%2B9pOU0IYpkz5GJcJTRj6GHtxcueLo%2FsNCaj4qUK9aM84oyzyaD9i7Eq2EdexUNrKihU8zwbte1BqlR7cAB1g0K8NYRxcVpaAfSgs8bYI4PVnYFc2OkSWY00fAzbAsdI5tdfV%2Bk2%2Byg1ac7MpJV1gV73nkAYd08B0rRytnzWOSvccExGnn%2FL2NbQQURODAAnv56Vn5dTmBuf5DsTNFuzINauMMWxqcUD5FdjrFB%2BRQDqc7u%2BLKuIxzAopB21EPv%2BZPMznaPWfPMv%2F0kflIqtqFxaIAAo4xOyhSaMt8FjC0JaamSZFR6HHWC5XnfGtZaT5RDjOIY4zj6wVW%2Bj5ErTC6mSpj189ir9NNmuhs8EdlhxKzydbK47uay9FKMslBfHz3SpA%2F%2FJeQSpBm9qerSKB16wx76Rayp1rBMG8FGLFtSS%2B%2BSo1f2NClIotdDmaploRJzbwI5rM84%2F6ohmF4BSLXciwufcJciqU23DbPp1PZPnHfbdVsbJSf389ijBnTYkak5glnub04DoKPlezDtsIvJBjqkAWBPs%2FTqnSPWxf85G5k14FWA37jDKa2F%2FWNHOGIhxN8P%2BJ24BymHNCpTlHgV7fwwyH%2BeZ7FBIDxX%2FoVvlVvYMuGodyh%2BeAJtnzpMHCA6A3hOAOc3tOzvKHkjkcRvvtl07luRE1IJXyWvh6kWf93w7vfQwc4uv8%2F6AzQ9g%2F6BQ2ljFRX%2FOE9luI26hpdOE%2BF%2F3XeA5hc4EMy9qpxjPsDb6P0Z0Wv6&X-Amz-Signature=93d9bf24a1a3bd0fbcc63c622d6a02943c454fb8bf5ba4cca8148996e0ecaaea&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466Q34ROEXU%2F20251123%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251123T121825Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEHIaCXVzLXdlc3QtMiJIMEYCIQDNHc%2FBDXgESJfJCyhhbmjYKRtr%2BKpmTACShtXN6bE9cgIhAOiI6CXFQVBYtqvh9qKVSU%2B%2F3mK6aTdEvQAyVdp9JLh2Kv8DCDsQABoMNjM3NDIzMTgzODA1Igz7JBljBE2l9Fbd6%2B0q3APWQgk0gGYRvv%2FyfyBJRC3WN0CosIUcJcklkkN%2Fxp2HuoQ1fnROY4nd5GPLv7U1gojcXrXOGkN0dF6vvUFuasfOszDwCFWYjXj%2FbGoqL8edAv%2B9pOU0IYpkz5GJcJTRj6GHtxcueLo%2FsNCaj4qUK9aM84oyzyaD9i7Eq2EdexUNrKihU8zwbte1BqlR7cAB1g0K8NYRxcVpaAfSgs8bYI4PVnYFc2OkSWY00fAzbAsdI5tdfV%2Bk2%2Byg1ac7MpJV1gV73nkAYd08B0rRytnzWOSvccExGnn%2FL2NbQQURODAAnv56Vn5dTmBuf5DsTNFuzINauMMWxqcUD5FdjrFB%2BRQDqc7u%2BLKuIxzAopB21EPv%2BZPMznaPWfPMv%2F0kflIqtqFxaIAAo4xOyhSaMt8FjC0JaamSZFR6HHWC5XnfGtZaT5RDjOIY4zj6wVW%2Bj5ErTC6mSpj189ir9NNmuhs8EdlhxKzydbK47uay9FKMslBfHz3SpA%2F%2FJeQSpBm9qerSKB16wx76Rayp1rBMG8FGLFtSS%2B%2BSo1f2NClIotdDmaploRJzbwI5rM84%2F6ohmF4BSLXciwufcJciqU23DbPp1PZPnHfbdVsbJSf389ijBnTYkak5glnub04DoKPlezDtsIvJBjqkAWBPs%2FTqnSPWxf85G5k14FWA37jDKa2F%2FWNHOGIhxN8P%2BJ24BymHNCpTlHgV7fwwyH%2BeZ7FBIDxX%2FoVvlVvYMuGodyh%2BeAJtnzpMHCA6A3hOAOc3tOzvKHkjkcRvvtl07luRE1IJXyWvh6kWf93w7vfQwc4uv8%2F6AzQ9g%2F6BQ2ljFRX%2FOE9luI26hpdOE%2BF%2F3XeA5hc4EMy9qpxjPsDb6P0Z0Wv6&X-Amz-Signature=d9457d55d942b62b2a86b62f2325bda4da312fe0745393d3084f42cbc9b4761c&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

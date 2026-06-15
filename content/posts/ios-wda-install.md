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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466SIATKAOC%2F20260615%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260615T165443Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJn%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIAH5hJUk%2FrLZheAx6dkHhG%2Fd4XYXt17kKvgAiy9APbSAAiEAl%2F2WNmRZrmTsW55awH92lmyPdUiDDBtTZGxGVgPjUkoq%2FwMIYhAAGgw2Mzc0MjMxODM4MDUiDC6LS98b8FGfJD54HircA8%2FroNE3rWDFvHkQJROPYnTwkdats%2BtTsILmZ2Vew5WvhHlx%2BYjWSirDUIOaIiMLsv1tlsMxWmzpGpB9IRTbIj4gBhv2eu0xV9DJqV0whU9BfbIqM7ouxJdamESXbw5lSQR0SPNN3hbibtqAwpQz7EvKE6eFSto7Ffb2kSIjX99Kv%2FYhviDtychXR2Rr%2BejzJ%2Bc2AxvJ%2BbeQE%2BrjhyO9mXZkekr3g5aLAIA3pRoS3%2FJpfSD1qLCXr1x07tsLfyVyRbxG65CMYitA4CjqzhO47ciWZq8f9lWrQDGc2KwE%2BATmgndk3UHK9bfGKrCKkwBdvDfGa41SUiE2VhbTiwLo1as6K9QRocOyOFr1sXcioaLFRo0mStlpYxdsLH9ciGB7nXe4pcp%2FPKfRExWcQ%2FbDM%2FH3%2F6cWOdlHNr9pw0ZjQLaOF1JyB78FWoLvytV6qhQYTGu%2FzYufczQXmf%2BkvWCcuQbMDj6KTxpu8a%2BNROiOcBp0qqHwPpEsPZStjPTp4pwB7VRZJiLGErfzSU9mb0%2FEevHTliCv6LIJ0pdciYLwAm3%2BHewke2gnJsIbOs47Bro%2FPHuXXOIUx2Vo09N40zzkS7UkhsBgOv7b413o0s6NdfdsfT9DOamqbDNA3Z2AMOnNwNEGOqUB%2BcjzZ0tjFe2zDv82TSyKa0f2DYnJ2hjHAglz8AP%2FF5%2BxRzQHFMQetxXEjKQylG0cty9LGHcYUMr88%2BMjT7MdOzN%2FM9lLjfuh8ygojwww4XuwxrwbXpsUdybBm5nzWRvuYB1CoSPsJhF1bOSg7uHLsE3X1YBLiLsDj0I3hPGuJB%2Fwf08SH00XJ2ZUaOrhKjUmxPGmriPWjBfpergRHuYgs7odaPSo&X-Amz-Signature=e9024e71dd7a15975e1597e889b4a3b850d8d197dfb227e0c96c7010a0299f61&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466SIATKAOC%2F20260615%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260615T165443Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJn%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIAH5hJUk%2FrLZheAx6dkHhG%2Fd4XYXt17kKvgAiy9APbSAAiEAl%2F2WNmRZrmTsW55awH92lmyPdUiDDBtTZGxGVgPjUkoq%2FwMIYhAAGgw2Mzc0MjMxODM4MDUiDC6LS98b8FGfJD54HircA8%2FroNE3rWDFvHkQJROPYnTwkdats%2BtTsILmZ2Vew5WvhHlx%2BYjWSirDUIOaIiMLsv1tlsMxWmzpGpB9IRTbIj4gBhv2eu0xV9DJqV0whU9BfbIqM7ouxJdamESXbw5lSQR0SPNN3hbibtqAwpQz7EvKE6eFSto7Ffb2kSIjX99Kv%2FYhviDtychXR2Rr%2BejzJ%2Bc2AxvJ%2BbeQE%2BrjhyO9mXZkekr3g5aLAIA3pRoS3%2FJpfSD1qLCXr1x07tsLfyVyRbxG65CMYitA4CjqzhO47ciWZq8f9lWrQDGc2KwE%2BATmgndk3UHK9bfGKrCKkwBdvDfGa41SUiE2VhbTiwLo1as6K9QRocOyOFr1sXcioaLFRo0mStlpYxdsLH9ciGB7nXe4pcp%2FPKfRExWcQ%2FbDM%2FH3%2F6cWOdlHNr9pw0ZjQLaOF1JyB78FWoLvytV6qhQYTGu%2FzYufczQXmf%2BkvWCcuQbMDj6KTxpu8a%2BNROiOcBp0qqHwPpEsPZStjPTp4pwB7VRZJiLGErfzSU9mb0%2FEevHTliCv6LIJ0pdciYLwAm3%2BHewke2gnJsIbOs47Bro%2FPHuXXOIUx2Vo09N40zzkS7UkhsBgOv7b413o0s6NdfdsfT9DOamqbDNA3Z2AMOnNwNEGOqUB%2BcjzZ0tjFe2zDv82TSyKa0f2DYnJ2hjHAglz8AP%2FF5%2BxRzQHFMQetxXEjKQylG0cty9LGHcYUMr88%2BMjT7MdOzN%2FM9lLjfuh8ygojwww4XuwxrwbXpsUdybBm5nzWRvuYB1CoSPsJhF1bOSg7uHLsE3X1YBLiLsDj0I3hPGuJB%2Fwf08SH00XJ2ZUaOrhKjUmxPGmriPWjBfpergRHuYgs7odaPSo&X-Amz-Signature=30973162c7c8b62a329e39899f05234726b336208029d1012b6f9939e2c9bc6a&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

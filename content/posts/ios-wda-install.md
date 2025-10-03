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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB46626X4FJHY%2F20251003%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251003T061535Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEKX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQDUqDUKMAU2phPJgenNARypxNjKHl1cf2xPdY7NLZsxZAIgJChVxU06GjCeBCKi4hWo3nZ3Eyds%2F6QSke20yCgG%2BZAq%2FwMIPhAAGgw2Mzc0MjMxODM4MDUiDHUs0r6JCDRLUyCEbircAxCKa6qGHrzH%2Fi6ehQDenjBd5yysNGQiLS6fPwykmNALzzo5BopTmmnf2nIJ1Js1lBWlvSYuHTZOww9PHoqK2qIc3zpImAEKTvYNjPUUSWLiqIjKOcflHfjMA40rWJpkAV5twUwYY2MzrCKbN6vbY%2Ba4d1EvTRBEJztfmqxVN%2B1zIotj4ngkEcfA%2BwmyycsfclPx9z2TLjW95wKfP9IN82UIM8CbKIYGlGZnktjlocAukT0K15P1kqpH15OR91MjzfpahM%2BoWqWOZiCyR5SedVkTd4LAxu%2B%2FBVGIcj0Zow9vTVf0fU7JNFepicLrl55KQatAIdV3iROTIG4JaziYD%2F0ChVOCtT%2BF0ZDYThZXblTgAGzcVZF6omTxFuN8psFeRcqIkKsnynnI8NnS8vGrAUwrp8En7ZbVhaDi1SNnkGlVGyFbShgC8ACWfVpHBunc3oYp0ZMF2VJ4AKnwchIaHpkItHc30kRAz8sieh110aElUEtXKiBoiJ3oErLn6lxb9WyQ%2BNlJA%2FaAHX%2Fzy5povPblxeNBEIwvOEHv3iWK0aO7IO5hN8NPHbdwXbhqaar5tOceT4uMOUqChWMRmd7CGnTU3ZgDDqtGoGlLvxyIpo7Xn%2BF%2FDg3vL88dx%2BX0MKuh%2FcYGOqUBlKARfjJcb9Z7TNaz4O%2FCAgQQCro%2B5lyogPdlvLaBZ3t0j%2FscGg4gr2cXKrbtvORgxNkfe5aHNkueAJtSMMeIxiy51RgEXGzLzoQb0gX3dJ6ztGUA24MN%2F9KxBUcqBqTgRLBB3HcSiqQmTY2sK4ZR38YJwlK1DQPfuY18%2FyJGa%2Fx0X44e8SjLeuLt8ZFSenBV0gqRWlsWxT9%2BdwfmLODbRrLZiZkx&X-Amz-Signature=3c3d1fdb91469defe634c20fcbb1c6af1ec8d74ebe04301064802a9506823c94&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB46626X4FJHY%2F20251003%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251003T061535Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEKX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQDUqDUKMAU2phPJgenNARypxNjKHl1cf2xPdY7NLZsxZAIgJChVxU06GjCeBCKi4hWo3nZ3Eyds%2F6QSke20yCgG%2BZAq%2FwMIPhAAGgw2Mzc0MjMxODM4MDUiDHUs0r6JCDRLUyCEbircAxCKa6qGHrzH%2Fi6ehQDenjBd5yysNGQiLS6fPwykmNALzzo5BopTmmnf2nIJ1Js1lBWlvSYuHTZOww9PHoqK2qIc3zpImAEKTvYNjPUUSWLiqIjKOcflHfjMA40rWJpkAV5twUwYY2MzrCKbN6vbY%2Ba4d1EvTRBEJztfmqxVN%2B1zIotj4ngkEcfA%2BwmyycsfclPx9z2TLjW95wKfP9IN82UIM8CbKIYGlGZnktjlocAukT0K15P1kqpH15OR91MjzfpahM%2BoWqWOZiCyR5SedVkTd4LAxu%2B%2FBVGIcj0Zow9vTVf0fU7JNFepicLrl55KQatAIdV3iROTIG4JaziYD%2F0ChVOCtT%2BF0ZDYThZXblTgAGzcVZF6omTxFuN8psFeRcqIkKsnynnI8NnS8vGrAUwrp8En7ZbVhaDi1SNnkGlVGyFbShgC8ACWfVpHBunc3oYp0ZMF2VJ4AKnwchIaHpkItHc30kRAz8sieh110aElUEtXKiBoiJ3oErLn6lxb9WyQ%2BNlJA%2FaAHX%2Fzy5povPblxeNBEIwvOEHv3iWK0aO7IO5hN8NPHbdwXbhqaar5tOceT4uMOUqChWMRmd7CGnTU3ZgDDqtGoGlLvxyIpo7Xn%2BF%2FDg3vL88dx%2BX0MKuh%2FcYGOqUBlKARfjJcb9Z7TNaz4O%2FCAgQQCro%2B5lyogPdlvLaBZ3t0j%2FscGg4gr2cXKrbtvORgxNkfe5aHNkueAJtSMMeIxiy51RgEXGzLzoQb0gX3dJ6ztGUA24MN%2F9KxBUcqBqTgRLBB3HcSiqQmTY2sK4ZR38YJwlK1DQPfuY18%2FyJGa%2Fx0X44e8SjLeuLt8ZFSenBV0gqRWlsWxT9%2BdwfmLODbRrLZiZkx&X-Amz-Signature=5d202b213a93b4720e02236c62de0e692bc4003e004344c55dfb149515a27370&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

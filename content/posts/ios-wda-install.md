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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466UKQEPDFK%2F20260421%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260421T125915Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEG0aCXVzLXdlc3QtMiJIMEYCIQDtcC881G%2FhiOmdv3gPwhwWsv44dTBIZhIw18eelHDA0AIhAMJUe3oM08LGFadhr4bUKUmStHPilGKhXT1B6wHzAx5gKv8DCDYQABoMNjM3NDIzMTgzODA1Igzas1YjHEhQaNHG%2BsQq3ANWFfn%2BTgShkIB1Pj7Gnyq%2FN5YXBrCGH4unCSxNa3GqlKM%2BBIw0XYEIT0xSkL3ANjLMaYGOp1ofpkgBiPLVT6pui%2BaHg4sjYeixXAMPrKqbBHtzT9v5%2FNmAlHC%2FERpzN0MyNxUmaaOePuDhz3lvQ3LhiZxkp%2F9UYS7sAl%2FT0P9t%2Bkzt3uBq4W1RJSmmJEholZs5MTUSjAmYhUsjTw1Ym8yBMrCAJcX2wiKz1UA5As%2BEc8pbj4bzpl7RC5CjEb%2FWFbVB1jKEMo9Pj0AWOIdYUcRBYrOGxW24ZrbJW6rd0XasVMq2%2F6SD1K4lGNoEXOh7UO2p9Djps3hVvkvpC9pMjlmceIEwK8sc5xbZ97jGV8wgqcz4gKf96ZNyb5Ly3RpLh1OjcdfqtkB5v%2FFP%2BqWSnQSRtWQcSuzeU27RCJesRC7kyqYvKxUxbSo%2FvLWDdXvw%2FLLRdFqSbIw2q1oKEJzH%2FLmAYIScSjoAZf6aUpKIwvihFDmdWF2ALicyPbNHeipoKQjX7DYXB1XvkR3SJ%2BSObb3tSgPYXZzJhiZe%2FNs2cp3oB1hBhfpkkBo7a5Ro6jffigVdifZ2ddNHqGFA9yys3txCmvUyGxC6GI5UdKXKIUlumunFF9hdb7VgM5lTLDCW4Z3PBjqkAUqzfzPlHFbnikrRs21H3k44yRTPcr5qnd6%2F5CHrCsTOSi1sNwoczhkteZJh04j5J0LOWVNs1wTktxD3hbVixsmCBfPsok7xCm%2FeIyfhk9oehi0isVIfDInU5y%2FZuNvwR%2FbJmKRd36wVcp%2FCYQyWUF5UWE5w6lbohzpjxQQxLLfsGFltuLEP61c8NasdRtBYyU0uOcxc2bfUX4pmoI%2Fuqll29jFQ&X-Amz-Signature=5d466ba01283c686d92f9428770c717888700bf12608846ba6508a752b7e588c&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466UKQEPDFK%2F20260421%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260421T125915Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEG0aCXVzLXdlc3QtMiJIMEYCIQDtcC881G%2FhiOmdv3gPwhwWsv44dTBIZhIw18eelHDA0AIhAMJUe3oM08LGFadhr4bUKUmStHPilGKhXT1B6wHzAx5gKv8DCDYQABoMNjM3NDIzMTgzODA1Igzas1YjHEhQaNHG%2BsQq3ANWFfn%2BTgShkIB1Pj7Gnyq%2FN5YXBrCGH4unCSxNa3GqlKM%2BBIw0XYEIT0xSkL3ANjLMaYGOp1ofpkgBiPLVT6pui%2BaHg4sjYeixXAMPrKqbBHtzT9v5%2FNmAlHC%2FERpzN0MyNxUmaaOePuDhz3lvQ3LhiZxkp%2F9UYS7sAl%2FT0P9t%2Bkzt3uBq4W1RJSmmJEholZs5MTUSjAmYhUsjTw1Ym8yBMrCAJcX2wiKz1UA5As%2BEc8pbj4bzpl7RC5CjEb%2FWFbVB1jKEMo9Pj0AWOIdYUcRBYrOGxW24ZrbJW6rd0XasVMq2%2F6SD1K4lGNoEXOh7UO2p9Djps3hVvkvpC9pMjlmceIEwK8sc5xbZ97jGV8wgqcz4gKf96ZNyb5Ly3RpLh1OjcdfqtkB5v%2FFP%2BqWSnQSRtWQcSuzeU27RCJesRC7kyqYvKxUxbSo%2FvLWDdXvw%2FLLRdFqSbIw2q1oKEJzH%2FLmAYIScSjoAZf6aUpKIwvihFDmdWF2ALicyPbNHeipoKQjX7DYXB1XvkR3SJ%2BSObb3tSgPYXZzJhiZe%2FNs2cp3oB1hBhfpkkBo7a5Ro6jffigVdifZ2ddNHqGFA9yys3txCmvUyGxC6GI5UdKXKIUlumunFF9hdb7VgM5lTLDCW4Z3PBjqkAUqzfzPlHFbnikrRs21H3k44yRTPcr5qnd6%2F5CHrCsTOSi1sNwoczhkteZJh04j5J0LOWVNs1wTktxD3hbVixsmCBfPsok7xCm%2FeIyfhk9oehi0isVIfDInU5y%2FZuNvwR%2FbJmKRd36wVcp%2FCYQyWUF5UWE5w6lbohzpjxQQxLLfsGFltuLEP61c8NasdRtBYyU0uOcxc2bfUX4pmoI%2Fuqll29jFQ&X-Amz-Signature=f6258659597647a95b46daae014c4cf44ccff2f9cc7affc0e867556980cda878&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

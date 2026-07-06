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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466US7WE7FS%2F20260706%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260706T145623Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEI%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCurUyRQHU6xAuVFg22A9ljyNTzkEnaaQBSWAagp8RxiAIhAIlkyDADpLoc7861ydyStmRW4JREDAVPE%2FtLRwQi%2FJqsKv8DCFgQABoMNjM3NDIzMTgzODA1IgxQ7to27AXH1zp3gLcq3AMKxrj7P7Uj4VmOCVf3ERWtP3t7EZe5dr7mRvzWR3nd3F%2FWgOvAWIwTsVwa758EFICpMYH8yyomLySmBeKejkp4CQv8w5CXlO9oX5puNHGQ5pEcei2jZvewZIBzxjn9aJIfVIbKNpqrcRtH1uFRDSBwy96ttGWYE1RTWdryNB6vNi%2FQfjEoBTsYLOIvn9PQXyEVv0G1sCKb1ZGGosXjmyDAo3oQesrx1Ive1%2FkVwRO9KttDj%2FeczfrOOoUaVkz3CQ%2BLe7ZgiR7SqNiBbHHv%2BJHSdWA7aBtHV2hYrfuRedF2sj%2Bk6m4ogb6S9p1mVBqYJGLDxzOIU6uzMGoqsvOawJFr8gBFpqZdO8%2BLEs9qKtmabh0CiHol%2B%2FZ3Hdf3LcYpdVYpImDE0qKFjzzH01JUxeC3DrpDdGuP8qIXjv1xtwN5%2F7rGMnlnH5HKPCvqZdwHHuQsA0UfkqsefTLPNAng7C4sNv68YM%2F7hp1d264JQVypVfBlw5LNh75M2O%2B7urTn72ypAQcSCiEgYUXMzqZBPkrHDkg0YeuYiplQNmT8KnFjaHaLrZnuJgsM445Utoi%2Fri%2BuRC%2Bpg%2BA%2BBtJ%2BsOgajxP8hgt9ow4ZVf%2F3kEQTXgMOPSXimHgMM8YmSrSCLDDt967SBjqkAZPWMb70fuj1aUFauTMB1PsfuY1u7U13pZS9Y8x5wILE4%2BK7gz9pFlWxda07Q02pYEaF0KUvtLFPAR26NFPVIQiI%2FW0fLK3uKgj1gOQXtShvQn3n%2BFF6EcSVNgoWYdYsyZucYHuZ0WI2XXarMwF%2FOYC1%2F%2BJ1zUVdbwsBKzU6FbZz0u0bcAcZWemh%2FFr%2BpPkDi0Do%2BEJ0kqdITPXjZNaAcfSChQTB&X-Amz-Signature=af9d5798b232a6673c1b9282c5119e21c487fc81a37ba6d992180079e08f0121&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466US7WE7FS%2F20260706%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260706T145623Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEI%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCurUyRQHU6xAuVFg22A9ljyNTzkEnaaQBSWAagp8RxiAIhAIlkyDADpLoc7861ydyStmRW4JREDAVPE%2FtLRwQi%2FJqsKv8DCFgQABoMNjM3NDIzMTgzODA1IgxQ7to27AXH1zp3gLcq3AMKxrj7P7Uj4VmOCVf3ERWtP3t7EZe5dr7mRvzWR3nd3F%2FWgOvAWIwTsVwa758EFICpMYH8yyomLySmBeKejkp4CQv8w5CXlO9oX5puNHGQ5pEcei2jZvewZIBzxjn9aJIfVIbKNpqrcRtH1uFRDSBwy96ttGWYE1RTWdryNB6vNi%2FQfjEoBTsYLOIvn9PQXyEVv0G1sCKb1ZGGosXjmyDAo3oQesrx1Ive1%2FkVwRO9KttDj%2FeczfrOOoUaVkz3CQ%2BLe7ZgiR7SqNiBbHHv%2BJHSdWA7aBtHV2hYrfuRedF2sj%2Bk6m4ogb6S9p1mVBqYJGLDxzOIU6uzMGoqsvOawJFr8gBFpqZdO8%2BLEs9qKtmabh0CiHol%2B%2FZ3Hdf3LcYpdVYpImDE0qKFjzzH01JUxeC3DrpDdGuP8qIXjv1xtwN5%2F7rGMnlnH5HKPCvqZdwHHuQsA0UfkqsefTLPNAng7C4sNv68YM%2F7hp1d264JQVypVfBlw5LNh75M2O%2B7urTn72ypAQcSCiEgYUXMzqZBPkrHDkg0YeuYiplQNmT8KnFjaHaLrZnuJgsM445Utoi%2Fri%2BuRC%2Bpg%2BA%2BBtJ%2BsOgajxP8hgt9ow4ZVf%2F3kEQTXgMOPSXimHgMM8YmSrSCLDDt967SBjqkAZPWMb70fuj1aUFauTMB1PsfuY1u7U13pZS9Y8x5wILE4%2BK7gz9pFlWxda07Q02pYEaF0KUvtLFPAR26NFPVIQiI%2FW0fLK3uKgj1gOQXtShvQn3n%2BFF6EcSVNgoWYdYsyZucYHuZ0WI2XXarMwF%2FOYC1%2F%2BJ1zUVdbwsBKzU6FbZz0u0bcAcZWemh%2FFr%2BpPkDi0Do%2BEJ0kqdITPXjZNaAcfSChQTB&X-Amz-Signature=cb5db603b2ecd5436b55f88de9f82e34076d971227ae8367909189e190e2789f&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

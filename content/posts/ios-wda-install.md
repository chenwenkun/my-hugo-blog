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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466ZPMJPLFE%2F20260630%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260630T192958Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEAEaCXVzLXdlc3QtMiJIMEYCIQCq9%2FcahkgZvoABArp8uOOaZg1X5ziL4l%2BtShqb99u%2FYQIhANjFLiYNlWNghyklU1lz8li72jcqudnDSFJ7J8COl40pKogECMr%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgxrnXziFpXdT5AAB1oq3APi9dCWLQERpyvGC4oiNQW6ZLDPOAsWtbguCtCczqP3uhyVcyWLs%2FdMHZoxEPuap7Q7EbaBMCJxm%2BckN9sAS4KN5klvJVnK%2FQQAuWRFnQXY4oPDUs9MI1t3E08UvZWZNc1J3Pqiz5Hgijj3tnhZrOyosEd6SEHAxhbyqlF5QKM8s8fZdC8CkIGiV66Ke90xucPjwV2r%2FztkXB4tAFNK44hrvx2XnmSUfW3gPAz93wFpVA4uXG344GNmjjP3r8gYMM7oF6ziP7Ts3mddh%2FUZfN8fQVzYwbZIjb%2Fymbx6lk5l5Z3H26T0KxbIno3BVDX%2Fag0ziBqqcg3aOiAY7aTtk0d%2FU8FcAi4%2Fwvm%2F%2FqMy%2FIgD41SZe2%2FT3svweDsHAKcm1mrUGd00ee8gjcrCN7eohDILT5xR7Egx9nTj0w9Z5WXBI2XVvHJTxus3aXw%2BpW%2B2jOf9rqcsMpkDKPriQc3Ndq56wrWUEKyEKZpIM6A5eJMbuva48MKUt2MoJ%2FIq9kY6TsC3WLpxURSzGxcXLy6OHMymIUIPEOq4C8XkVAiF%2B7BJFrrUCqh6mhKn%2F3J8eMKqsglOrCroQxtk3Bbx2PFtpcXm1V43QYtziezAnRm8CGsGLt3lIKUViEfoF3JPNjCN3o%2FSBjqkAY%2BRmx7SXql8EVUO%2F8AT0TBW3THe3SEWvp0h1o4wxUaKeux1qL7P1i%2F%2Fqy2zMEq2sSZYcHAkHKGP0%2FDQexsCwQldZU9KLqcbPtVnBIfw3LWMbvphHvtjxg6xDtw9ikHbhJiSan%2Fos7c4iNlFcBUTYheNy1vYiW4QnXaNgniLouK2OMrwBjvssk94WexFkMp3U%2FQfgybjt4cUCgMcXO3eo1kXvOGJ&X-Amz-Signature=f3b59f5bb54feee85e71fe6dbbe20b35d4acea70934e5fffb61fb2f7b8711040&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466ZPMJPLFE%2F20260630%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260630T192958Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEAEaCXVzLXdlc3QtMiJIMEYCIQCq9%2FcahkgZvoABArp8uOOaZg1X5ziL4l%2BtShqb99u%2FYQIhANjFLiYNlWNghyklU1lz8li72jcqudnDSFJ7J8COl40pKogECMr%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgxrnXziFpXdT5AAB1oq3APi9dCWLQERpyvGC4oiNQW6ZLDPOAsWtbguCtCczqP3uhyVcyWLs%2FdMHZoxEPuap7Q7EbaBMCJxm%2BckN9sAS4KN5klvJVnK%2FQQAuWRFnQXY4oPDUs9MI1t3E08UvZWZNc1J3Pqiz5Hgijj3tnhZrOyosEd6SEHAxhbyqlF5QKM8s8fZdC8CkIGiV66Ke90xucPjwV2r%2FztkXB4tAFNK44hrvx2XnmSUfW3gPAz93wFpVA4uXG344GNmjjP3r8gYMM7oF6ziP7Ts3mddh%2FUZfN8fQVzYwbZIjb%2Fymbx6lk5l5Z3H26T0KxbIno3BVDX%2Fag0ziBqqcg3aOiAY7aTtk0d%2FU8FcAi4%2Fwvm%2F%2FqMy%2FIgD41SZe2%2FT3svweDsHAKcm1mrUGd00ee8gjcrCN7eohDILT5xR7Egx9nTj0w9Z5WXBI2XVvHJTxus3aXw%2BpW%2B2jOf9rqcsMpkDKPriQc3Ndq56wrWUEKyEKZpIM6A5eJMbuva48MKUt2MoJ%2FIq9kY6TsC3WLpxURSzGxcXLy6OHMymIUIPEOq4C8XkVAiF%2B7BJFrrUCqh6mhKn%2F3J8eMKqsglOrCroQxtk3Bbx2PFtpcXm1V43QYtziezAnRm8CGsGLt3lIKUViEfoF3JPNjCN3o%2FSBjqkAY%2BRmx7SXql8EVUO%2F8AT0TBW3THe3SEWvp0h1o4wxUaKeux1qL7P1i%2F%2Fqy2zMEq2sSZYcHAkHKGP0%2FDQexsCwQldZU9KLqcbPtVnBIfw3LWMbvphHvtjxg6xDtw9ikHbhJiSan%2Fos7c4iNlFcBUTYheNy1vYiW4QnXaNgniLouK2OMrwBjvssk94WexFkMp3U%2FQfgybjt4cUCgMcXO3eo1kXvOGJ&X-Amz-Signature=0eb57ab98cde4c8b1380a86016e4c5eb25e5095066cc5d1fae0fd37a092868d7&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

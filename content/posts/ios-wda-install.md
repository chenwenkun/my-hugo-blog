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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466YKAG6P55%2F20251108%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251108T061507Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEAUaCXVzLXdlc3QtMiJGMEQCIBEBktefSlWPNztoPNkzWVvVmPZIPLWgopCEOCiSeDzyAiA9x7hOLvaDa2hLpW9FcLVooOWFnAx7zFJTBcoNePOlNyqIBAjO%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMC9TloD1njqLjxXNBKtwD07FM7xYgu2%2FmZH7VR%2F6kBBijxgp7zwI1e3EpJOUl9hBbuhSEg3JpwYrYukrh6aDG4BAm7rjBA46YCjw1ZjKSf6xEyVBFyhjT6Hms5swP3XVrD1eJJwhChZpan06AGd%2B4JZBUCawp7yVWLkjsTiF3H1KGYFlrzH2mJBBOq00tNGIvo7V%2B6tD4hZ61cQIAl3nTCdU6%2Fzk%2FRqCaNROX8y9aPL2pUcfDiXjYZvR4DS5q7J7%2FzO8c%2BsAE%2FjvsifcDkpIwOnbWJDP8NlfoAbs6MpWYonQP0zhv7XRUb3tk0FrWmu%2BqZ%2BmQHHJdF%2BNkuuwq3G6xfCQpge%2BVzPYRmj9zsOdmVQHCABBD%2FrG4FenD%2FV5VLOAR1zTrN6cpBbmUfiKkFqjMn3dUQnRmqtaGiljxwuNOhO2PlzmhF06dGR1qG0E7zYrvFGZoIPBqH%2BSaEUqXIPDCQsVwV0%2Bupsefc6CTS1Dhgxap7gLgAwZAUPSbv33TscORizR9o9f%2FM6hU6FJMRvfeWiOZW7KDju8TvsRf1MpnFdcEHkcrr%2Fq7Fn%2B7g9j6uXKM7DTcNi7nEA4ubLgzWFBTnZmziuSN9TxQ1T1MEnVP%2FvN4b3ajckdTCVYhLMokySQ7Oa6Xswlq%2Fz4%2BJSAwmKS7yAY6pgGPBNtUh56TAQNDJkXWlNSlvcLxCTFkSxiCad6ZbP281G6VRQhmMdmPnaAoZfSoqodQiMWt2NZsxORyiFNXm6Tg2w%2Fr1WDMtHAXn4qQzGIElgonaRusTO9kwHk603ghU%2BMbwz1xk2EMCe%2Fb8MKmzb1qZzX1FvkMfZSakMO%2FS8%2F95pYQVLF2jGlar8PHoLVD%2FymctFg6svFfwe9NqsxCx%2BqeRJW%2ByETq&X-Amz-Signature=ea0f79efd7bdf6af551e5acbed986c6661e1db8a4257ad3c9f9dcbe612ec6be9&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466YKAG6P55%2F20251108%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251108T061507Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEAUaCXVzLXdlc3QtMiJGMEQCIBEBktefSlWPNztoPNkzWVvVmPZIPLWgopCEOCiSeDzyAiA9x7hOLvaDa2hLpW9FcLVooOWFnAx7zFJTBcoNePOlNyqIBAjO%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMC9TloD1njqLjxXNBKtwD07FM7xYgu2%2FmZH7VR%2F6kBBijxgp7zwI1e3EpJOUl9hBbuhSEg3JpwYrYukrh6aDG4BAm7rjBA46YCjw1ZjKSf6xEyVBFyhjT6Hms5swP3XVrD1eJJwhChZpan06AGd%2B4JZBUCawp7yVWLkjsTiF3H1KGYFlrzH2mJBBOq00tNGIvo7V%2B6tD4hZ61cQIAl3nTCdU6%2Fzk%2FRqCaNROX8y9aPL2pUcfDiXjYZvR4DS5q7J7%2FzO8c%2BsAE%2FjvsifcDkpIwOnbWJDP8NlfoAbs6MpWYonQP0zhv7XRUb3tk0FrWmu%2BqZ%2BmQHHJdF%2BNkuuwq3G6xfCQpge%2BVzPYRmj9zsOdmVQHCABBD%2FrG4FenD%2FV5VLOAR1zTrN6cpBbmUfiKkFqjMn3dUQnRmqtaGiljxwuNOhO2PlzmhF06dGR1qG0E7zYrvFGZoIPBqH%2BSaEUqXIPDCQsVwV0%2Bupsefc6CTS1Dhgxap7gLgAwZAUPSbv33TscORizR9o9f%2FM6hU6FJMRvfeWiOZW7KDju8TvsRf1MpnFdcEHkcrr%2Fq7Fn%2B7g9j6uXKM7DTcNi7nEA4ubLgzWFBTnZmziuSN9TxQ1T1MEnVP%2FvN4b3ajckdTCVYhLMokySQ7Oa6Xswlq%2Fz4%2BJSAwmKS7yAY6pgGPBNtUh56TAQNDJkXWlNSlvcLxCTFkSxiCad6ZbP281G6VRQhmMdmPnaAoZfSoqodQiMWt2NZsxORyiFNXm6Tg2w%2Fr1WDMtHAXn4qQzGIElgonaRusTO9kwHk603ghU%2BMbwz1xk2EMCe%2Fb8MKmzb1qZzX1FvkMfZSakMO%2FS8%2F95pYQVLF2jGlar8PHoLVD%2FymctFg6svFfwe9NqsxCx%2BqeRJW%2ByETq&X-Amz-Signature=be45e578e3cf79c4dd669bd4afca573fbe2aa2f6d0511187ade9dd307103884b&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466QWPO2IJV%2F20260713%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260713T084612Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEC8aCXVzLXdlc3QtMiJHMEUCIH%2BEgf%2BcJEwkb6FVQ7UfdFmNFJgx3YTEojhL%2BQNzJ%2BEaAiEAszRmc7kUBvPuPdmpIuR0KMaCSrEsDk3LRM4h9hVbFKQqiAQI%2BP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDKYmMvnE7e4qH5A%2BxyrcAwqZ0F%2BAXzNFN2zzaqe00UxIu97MTKcznwuuAntKp13GwYOvam6tkssUtGJrlxdmI%2FPA%2FlmzZqfUsKyh5xqQa2vlpqxMdq78bZ9Gv0Yynx914ydcPz3R0MdJDdddUX2RYNPT5cuWMPBQEPR%2FkKhBKFpcaZ0t0PVOAaey%2F3C%2F9Eq7V4HCizQvXQO%2FBzjZkUchGt7NIJzYWHvq5piepaXre4sDcfwgq9pr9PtOEOPyKYiD0U449GmZd3zy8pHZD8W2o1bqqtB9a7K1%2FT1p079I5Cc5CD5Sxj9wMUs1hxsQwup967lXgo4%2F07otidErWwwWzgBcXv5XCR4TmZ75kznHw6D7riekp86u9uk5uT593y%2B0yS3avtLTEOG6BrEGbG%2B9UGJy5NTkDbDTjBOwGcbD%2FOecHYgvHFjCqTXzNVDBqjopgXWab8tCBc0zfcdQXRVWssc4%2FBOeuvzbJvm2eISnXLljHtyuoTrwQRVWs%2FhG%2BITusdOoKGCGS1YY1cwV1FtTfTXwOS%2BjNleMKqwhPThSpKg%2FtTh4ZXuBmhBqXBm7QR9qGMctvMauu4beNe0BPvYa%2FBXfEWMsEuEu%2FrmT0nWG9WTu8ZUPu2fatC98yAwiBMkioIVEG4mDAUFUmGkFMISc0tIGOqUB%2B8XuFU%2FCCfFoC11fYYX5%2B4mwg2NXXPhqF6JxUWpmqO7eeFpTt7G71QGZt4zkz0HfsgFIMmDJ%2Fk1pTX3I3BBW4gH%2BxASSsCCmyY5Wf%2BH4PZHANDy9g%2BaXmIFLc%2FTMmBYncBJsSGUAfKCenpYh6XCwR0SF2x5Xw29W5FM43j3%2BbpaTqv95oHMd1rAYj1RqYQo4rR8e5NjnrdrhT%2Fk2lq%2Fas9i%2BO25j&X-Amz-Signature=9e4e187cedc93d8fc5b7185fee7dc38535e6a01861683208688236a3453d8d4a&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466QWPO2IJV%2F20260713%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260713T084612Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEC8aCXVzLXdlc3QtMiJHMEUCIH%2BEgf%2BcJEwkb6FVQ7UfdFmNFJgx3YTEojhL%2BQNzJ%2BEaAiEAszRmc7kUBvPuPdmpIuR0KMaCSrEsDk3LRM4h9hVbFKQqiAQI%2BP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDKYmMvnE7e4qH5A%2BxyrcAwqZ0F%2BAXzNFN2zzaqe00UxIu97MTKcznwuuAntKp13GwYOvam6tkssUtGJrlxdmI%2FPA%2FlmzZqfUsKyh5xqQa2vlpqxMdq78bZ9Gv0Yynx914ydcPz3R0MdJDdddUX2RYNPT5cuWMPBQEPR%2FkKhBKFpcaZ0t0PVOAaey%2F3C%2F9Eq7V4HCizQvXQO%2FBzjZkUchGt7NIJzYWHvq5piepaXre4sDcfwgq9pr9PtOEOPyKYiD0U449GmZd3zy8pHZD8W2o1bqqtB9a7K1%2FT1p079I5Cc5CD5Sxj9wMUs1hxsQwup967lXgo4%2F07otidErWwwWzgBcXv5XCR4TmZ75kznHw6D7riekp86u9uk5uT593y%2B0yS3avtLTEOG6BrEGbG%2B9UGJy5NTkDbDTjBOwGcbD%2FOecHYgvHFjCqTXzNVDBqjopgXWab8tCBc0zfcdQXRVWssc4%2FBOeuvzbJvm2eISnXLljHtyuoTrwQRVWs%2FhG%2BITusdOoKGCGS1YY1cwV1FtTfTXwOS%2BjNleMKqwhPThSpKg%2FtTh4ZXuBmhBqXBm7QR9qGMctvMauu4beNe0BPvYa%2FBXfEWMsEuEu%2FrmT0nWG9WTu8ZUPu2fatC98yAwiBMkioIVEG4mDAUFUmGkFMISc0tIGOqUB%2B8XuFU%2FCCfFoC11fYYX5%2B4mwg2NXXPhqF6JxUWpmqO7eeFpTt7G71QGZt4zkz0HfsgFIMmDJ%2Fk1pTX3I3BBW4gH%2BxASSsCCmyY5Wf%2BH4PZHANDy9g%2BaXmIFLc%2FTMmBYncBJsSGUAfKCenpYh6XCwR0SF2x5Xw29W5FM43j3%2BbpaTqv95oHMd1rAYj1RqYQo4rR8e5NjnrdrhT%2Fk2lq%2Fas9i%2BO25j&X-Amz-Signature=23553ed45fec1d722dc587dc2cd0e6cd4d44029e34730310186c6849d906d533&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

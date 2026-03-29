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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466R2JTJ5EX%2F20260329%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260329T182649Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEEsaCXVzLXdlc3QtMiJIMEYCIQDkm6WvIZuphGdneT49RnY8s39lCAPZ5JE%2FeSLikKddNAIhANwAvkzPbgbo4ZtJ%2BzAfbSYKts5dK96akF6IUyj8XWGeKv8DCBMQABoMNjM3NDIzMTgzODA1Igy6TPrsIxZcZiEVKUcq3ANLlqL2uAtb3Us8NhYFxIK5AjWWf4FAcTq8YfnNl37HnV3zLl40O%2BO4V325x2vUHrO7ZzFgeaJx7T4lACD2P4IBhVHy65uyJJlA3ic3CYDKCXYFNeZqkqthtGk5sLjEc5s8o5%2BEGBbEUPXG47dtDCFKJ4z9uU32Acmt4e0SvuubjEBeqstABxiDpSsPvGKdiM3GE1B1clku0qBCEOQ%2FlDFwtT%2F%2FcJUWxtmRJAZOks73TzyAdL7ndFdLNGQk2%2BcAgPSwy1sTjiTwbeFq3guqGh9SVWHDMDnbfYir%2BOKDvGG%2Fc7iXVUVVb2hsHABsgoSSBQYcbPnqcEFAAZuMyz4HWeXH9PBktuVeFrDAK4tVu6GXUl3gbwqQ3Xgocx8yj6rhYgL4i%2FjGISEM6djQ1XjgkCt6PChXafSsNGHlTNVWM4NMLIL%2BULUwmz6oMGIswgqN9YZvFq8Qx107aVPcDVzkSTUmAZIXyoTpjwPdWUHxtVj9m6k0M31WULq7e%2Fcatxnc%2BRdvqix8fpBZxW%2BwasyfrONIQZl6ZiICHD%2BTugfisMdcX8E1kdDN0MQtLJTgp80q%2F2njdafJrOmWAVDlY4JbnGGgQDP2oo0aNH1hripnEE%2FC9kskRdHw87hOUgaEbDDl2qXOBjqkAfKiyQOZN39n0T28sWowhcznjPpQyEDwRGsGb%2FGzub2Wha1J%2B0qfD7FFLf1eUD3QT5mnVRtOYeOaAnjgx7qYjA%2F%2FPGOVa5vqzZVJEYxD%2BWmaqnPlzzBtCPgoXz9gysgEfzKho5r5RjjdwNEo7feQknvYdyszvLbVz7SEY0RKxpXMssMizYIjYWNATZlRTjiKY%2FOBGIS15HRyZz5FFi3NeL2jWamv&X-Amz-Signature=c24b0245c0119788fbd077b45768b3a894c283c0a9333005dfa7f2958a4fe5a1&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466R2JTJ5EX%2F20260329%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260329T182649Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEEsaCXVzLXdlc3QtMiJIMEYCIQDkm6WvIZuphGdneT49RnY8s39lCAPZ5JE%2FeSLikKddNAIhANwAvkzPbgbo4ZtJ%2BzAfbSYKts5dK96akF6IUyj8XWGeKv8DCBMQABoMNjM3NDIzMTgzODA1Igy6TPrsIxZcZiEVKUcq3ANLlqL2uAtb3Us8NhYFxIK5AjWWf4FAcTq8YfnNl37HnV3zLl40O%2BO4V325x2vUHrO7ZzFgeaJx7T4lACD2P4IBhVHy65uyJJlA3ic3CYDKCXYFNeZqkqthtGk5sLjEc5s8o5%2BEGBbEUPXG47dtDCFKJ4z9uU32Acmt4e0SvuubjEBeqstABxiDpSsPvGKdiM3GE1B1clku0qBCEOQ%2FlDFwtT%2F%2FcJUWxtmRJAZOks73TzyAdL7ndFdLNGQk2%2BcAgPSwy1sTjiTwbeFq3guqGh9SVWHDMDnbfYir%2BOKDvGG%2Fc7iXVUVVb2hsHABsgoSSBQYcbPnqcEFAAZuMyz4HWeXH9PBktuVeFrDAK4tVu6GXUl3gbwqQ3Xgocx8yj6rhYgL4i%2FjGISEM6djQ1XjgkCt6PChXafSsNGHlTNVWM4NMLIL%2BULUwmz6oMGIswgqN9YZvFq8Qx107aVPcDVzkSTUmAZIXyoTpjwPdWUHxtVj9m6k0M31WULq7e%2Fcatxnc%2BRdvqix8fpBZxW%2BwasyfrONIQZl6ZiICHD%2BTugfisMdcX8E1kdDN0MQtLJTgp80q%2F2njdafJrOmWAVDlY4JbnGGgQDP2oo0aNH1hripnEE%2FC9kskRdHw87hOUgaEbDDl2qXOBjqkAfKiyQOZN39n0T28sWowhcznjPpQyEDwRGsGb%2FGzub2Wha1J%2B0qfD7FFLf1eUD3QT5mnVRtOYeOaAnjgx7qYjA%2F%2FPGOVa5vqzZVJEYxD%2BWmaqnPlzzBtCPgoXz9gysgEfzKho5r5RjjdwNEo7feQknvYdyszvLbVz7SEY0RKxpXMssMizYIjYWNATZlRTjiKY%2FOBGIS15HRyZz5FFi3NeL2jWamv&X-Amz-Signature=41710b3d2eb2258253f03db6d101d6245084c0c8de7b8ee7b2bbc2aaf0957397&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

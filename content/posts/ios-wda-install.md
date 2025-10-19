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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466ZT743GDH%2F20251019%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251019T005700Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEBwaCXVzLXdlc3QtMiJIMEYCIQCudOJi5zzmVgB6RMw0Eg3vnf9o1FCoBIcjD%2B%2BW0Nd7qwIhALW3mzAc6ZwdP%2B93Oiit3%2B3C0KPQ9ZvhJG9z5KhdbdisKogECMX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgxHxVDCGJP4jIGPUoEq3AMkEfrlGF8SefMdsuV4Bs30QYPTMxoTaUs8DjCM9KKZ8yQK0Fa9%2BfFDxYJ0PyBIzyYi04UCTtBSWBl98mQp5%2BpfntXAbRxo4EvCiPBJVuhTYhDWntLGdiBqR%2BqIgBIi4N%2FHbMzSf5KFYrzADH94rmSd7yv7nANR6fp0vg0mvPbBA3fMjoLNHKzs9Hd%2BiaY6RZY5xcLt2RNz9BPJF1XM0ZOsTck6ZguHUjTNJ2DoUpnuIlWjrsM65IqW7hE%2FsmfCtToJWb5KBKu4u8H%2B8GGbYhN9btmuV1y1Y%2Fd7N%2Ba9Bp8Kn830b%2FP8wRRvGEMnaWWmgOuZl4qNC2LTgC7ImCQ1lprg5TwGmDhBrRe2bugznv%2BHRGUPRB68OvVKmcR7YtZ%2FgFeyiFLG20j8%2FJpwkA8po6coTHEGGkbiCzv5N8qDfnzKKXcN0%2B7Hyx3yhpmuACJ0mxP2T7Z5DlO9oo3BTAolWA0zTISoH4bTPnhJU5y2svCsg6G%2FZuLlVUmUsZA4kb8jNZrA5gFo74gkWYGAQZJYJyidKQukezq24rNr9Zqi5M4prQnT0Y7y%2Fe3TIXNxOheyzO%2Bs3Cj8D2QYiRrCK2I6Y1Zy1bLMYWn2Z%2BqVuScBapyJS5mGpZlqZNbWcIBKdjCn3c%2FHBjqkAfNIVf2YzyWAawrI4Xrn3J%2BHUoRp%2Fsr6A4KvIV1YuxhxVDyXgN9AUOrr5sloAFs4Ov61X%2BhSDRG1SnVXFi%2FQHYvcs3ejMMjzOpWZy8REnAdFD0GAmIAR4iXsb7R9uBgFZcEyAvxw2okvOvy4ExQXEdw9jmX2Q5ov9tSXgoQIb5O%2B1mfvjIHFjgWngaxYy5mTexsW2MxMXnFUifLeGLewo4ujCwvV&X-Amz-Signature=54c5b2d3c3c7ab89ec4cc9a171c42aa06be5de77ebbdd635d7f71c5bb8d98399&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466ZT743GDH%2F20251019%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251019T005700Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEBwaCXVzLXdlc3QtMiJIMEYCIQCudOJi5zzmVgB6RMw0Eg3vnf9o1FCoBIcjD%2B%2BW0Nd7qwIhALW3mzAc6ZwdP%2B93Oiit3%2B3C0KPQ9ZvhJG9z5KhdbdisKogECMX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgxHxVDCGJP4jIGPUoEq3AMkEfrlGF8SefMdsuV4Bs30QYPTMxoTaUs8DjCM9KKZ8yQK0Fa9%2BfFDxYJ0PyBIzyYi04UCTtBSWBl98mQp5%2BpfntXAbRxo4EvCiPBJVuhTYhDWntLGdiBqR%2BqIgBIi4N%2FHbMzSf5KFYrzADH94rmSd7yv7nANR6fp0vg0mvPbBA3fMjoLNHKzs9Hd%2BiaY6RZY5xcLt2RNz9BPJF1XM0ZOsTck6ZguHUjTNJ2DoUpnuIlWjrsM65IqW7hE%2FsmfCtToJWb5KBKu4u8H%2B8GGbYhN9btmuV1y1Y%2Fd7N%2Ba9Bp8Kn830b%2FP8wRRvGEMnaWWmgOuZl4qNC2LTgC7ImCQ1lprg5TwGmDhBrRe2bugznv%2BHRGUPRB68OvVKmcR7YtZ%2FgFeyiFLG20j8%2FJpwkA8po6coTHEGGkbiCzv5N8qDfnzKKXcN0%2B7Hyx3yhpmuACJ0mxP2T7Z5DlO9oo3BTAolWA0zTISoH4bTPnhJU5y2svCsg6G%2FZuLlVUmUsZA4kb8jNZrA5gFo74gkWYGAQZJYJyidKQukezq24rNr9Zqi5M4prQnT0Y7y%2Fe3TIXNxOheyzO%2Bs3Cj8D2QYiRrCK2I6Y1Zy1bLMYWn2Z%2BqVuScBapyJS5mGpZlqZNbWcIBKdjCn3c%2FHBjqkAfNIVf2YzyWAawrI4Xrn3J%2BHUoRp%2Fsr6A4KvIV1YuxhxVDyXgN9AUOrr5sloAFs4Ov61X%2BhSDRG1SnVXFi%2FQHYvcs3ejMMjzOpWZy8REnAdFD0GAmIAR4iXsb7R9uBgFZcEyAvxw2okvOvy4ExQXEdw9jmX2Q5ov9tSXgoQIb5O%2B1mfvjIHFjgWngaxYy5mTexsW2MxMXnFUifLeGLewo4ujCwvV&X-Amz-Signature=4d8026fe88050de4e62f4b2b55a0ada3436b3935f6e31d284e8b83a0f709a9d6&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

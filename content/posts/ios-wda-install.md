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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB46646UYWDA5%2F20260327%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260327T011910Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEAcaCXVzLXdlc3QtMiJGMEQCIHsedxaiSSDQazBhXk3pyLTOQGbI%2B1WcRuE3JNrfcW4BAiAZ%2FiAHAFoiHkPoBZMUZknnCp31LKMno38GvBtRLM0EVSqIBAjQ%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMKHJZXxa%2F%2FP%2BcTwlOKtwDJGc3gxl9Q9xcVsHMYUnjUQD%2Fc0I1R1dJrRDw53KDkjns%2F%2Bn7L%2BgxX3gF2s0QMJx1ikxMSJWS%2FCaIErB7TfNT8w%2FCKNlyYHrkilkHUXD09XG5zNPyi1kh8GOFhWmZbYS7VIcJjfO%2FsCnWuJFsJ%2F9XY%2FPQoFwcQh1S%2FSlQ4azuMlzS0qZVarVBrj%2BmRbyszyYUuSUYIaZp6G4dJ40G%2FVc1i6kTxSgFJ8fK3sHs2vb9f4mhx7CuNNsfkrM4jJyVz5M1jrQU8R7Ak%2FfdkHRtgVAvbcxffOPVbwsqJr8mOsNwED9uBSULYmQIUBpTaVM5tcSb4dx%2BWtvdqqH7dbAfUe7Mf%2BldkdZs3VHtGEZXWR9oivY4jSGeO70I5Q%2FKRW2jIyXBkHe7QputVu0FEeMqfeqoIk2Obx4hlkriyERspv%2FhDYavggnh1pHjnRynF54FS0tvsTik0T%2FALV2sY3%2F7h6N1898gmwySSStrz8KdUZcVOYJu3eNscQLRP2jLuPk7AVdCuOLbJkgDKvibOSXqoT4oku0AwRFNsOmNkkXqDRgbj5QYjUXjSwnq3SAAK1iXuI1QGuBd5tQM9Dc77KY7a5H3GYuBeI0ID%2FBHuL4qyHHvp4AExUwn%2BGOiPMVgP6Qw4%2BmWzgY6pgF5rbfmVaiOzf3SF1Y98R609TJlzRnK4SSkaD6mSorQbbyH3pCYgxRT005wR0TvFRjquRu9CYgGFDiYpqJmhEXns%2FONXoUP1DFxHGjw%2FGh5qPmgtX2DaUWSsYMLSqCgvVn5SWjX%2Fq0%2F%2BfssaYHZsYFNI6eZZ8L2Xtvuafe8QRZ2hrn1b7%2ByQNIdhEkAS8syimTbOuPb8S1WhjrHOPph7sdXDu4W8B5P&X-Amz-Signature=f9abcee22681a3ab44aca21ae62001f5f557beb364a3246a7e716d07155cef8b&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB46646UYWDA5%2F20260327%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260327T011910Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEAcaCXVzLXdlc3QtMiJGMEQCIHsedxaiSSDQazBhXk3pyLTOQGbI%2B1WcRuE3JNrfcW4BAiAZ%2FiAHAFoiHkPoBZMUZknnCp31LKMno38GvBtRLM0EVSqIBAjQ%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMKHJZXxa%2F%2FP%2BcTwlOKtwDJGc3gxl9Q9xcVsHMYUnjUQD%2Fc0I1R1dJrRDw53KDkjns%2F%2Bn7L%2BgxX3gF2s0QMJx1ikxMSJWS%2FCaIErB7TfNT8w%2FCKNlyYHrkilkHUXD09XG5zNPyi1kh8GOFhWmZbYS7VIcJjfO%2FsCnWuJFsJ%2F9XY%2FPQoFwcQh1S%2FSlQ4azuMlzS0qZVarVBrj%2BmRbyszyYUuSUYIaZp6G4dJ40G%2FVc1i6kTxSgFJ8fK3sHs2vb9f4mhx7CuNNsfkrM4jJyVz5M1jrQU8R7Ak%2FfdkHRtgVAvbcxffOPVbwsqJr8mOsNwED9uBSULYmQIUBpTaVM5tcSb4dx%2BWtvdqqH7dbAfUe7Mf%2BldkdZs3VHtGEZXWR9oivY4jSGeO70I5Q%2FKRW2jIyXBkHe7QputVu0FEeMqfeqoIk2Obx4hlkriyERspv%2FhDYavggnh1pHjnRynF54FS0tvsTik0T%2FALV2sY3%2F7h6N1898gmwySSStrz8KdUZcVOYJu3eNscQLRP2jLuPk7AVdCuOLbJkgDKvibOSXqoT4oku0AwRFNsOmNkkXqDRgbj5QYjUXjSwnq3SAAK1iXuI1QGuBd5tQM9Dc77KY7a5H3GYuBeI0ID%2FBHuL4qyHHvp4AExUwn%2BGOiPMVgP6Qw4%2BmWzgY6pgF5rbfmVaiOzf3SF1Y98R609TJlzRnK4SSkaD6mSorQbbyH3pCYgxRT005wR0TvFRjquRu9CYgGFDiYpqJmhEXns%2FONXoUP1DFxHGjw%2FGh5qPmgtX2DaUWSsYMLSqCgvVn5SWjX%2Fq0%2F%2BfssaYHZsYFNI6eZZ8L2Xtvuafe8QRZ2hrn1b7%2ByQNIdhEkAS8syimTbOuPb8S1WhjrHOPph7sdXDu4W8B5P&X-Amz-Signature=bcd288e46fc8d27b75b29b37197e0d799c931425191e45ac14fa87f59cc7489e&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

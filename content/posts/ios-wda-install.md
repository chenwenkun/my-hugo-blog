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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4666I3PA2F6%2F20251027%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251027T005644Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEOD%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCLbyoqb%2Bf1vdiov53VBmwM5kUqpFJ%2F3iUKsBoi8Ep3zQIhAIfQD%2Biwi8CRRL%2BWuuPV4HgtbG7yJRdRKfMytlgCwWcMKogECJn%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgyCN4z8Z2%2BU1WSh7MQq3ANOAwCY%2BHDCnC7gZNgGwxw2r2gvQPzAbN5xw9YAPAvJrLZUD%2FgIwd5JfhYvf8Sfqy%2FPa6abTeWwihhJ8eymxWW3EUod3MSrTYppk75JarsKxM8xfMqZNQDGcLJU1qtLQUZGvuuBVE7ZoC3QWALvNNyPkDWBp1ECjhRZcnhG8%2B3v7qtXDJxOGZhS062JYmDqNmga3c%2FlcR9V0OP55rqae22kDV3HNUGLWCW2l%2Fa%2FSqf17%2FE9CLNaB8guWc0tOokxVJIJihW5wNpMvuHnRb8UvfRXC9lUUFlBifheT3fojRz0jowIG8bgc%2FIq21C3wWvjbMO1gYLInG1jM6jjLcPbK7NRhKEWdLLxkJqAdwKO%2Fr%2FJp69BlnJQskeck6VPxAzXKp9brb5V2a%2B13X4bBRgGxIf5WUPnA4n%2FltcM8dnYXs%2BU6atKVN25%2BjC91kQtkz1dH5hejZf1Bdymxk6QiR9c1iIIyFFWmxmW7fkSCgyWv9jLrMCQGdceL6czlaaoWtcmEcAu5CherSWKxawnLNmS9uGlHmqKRYU%2B9KEReVVi1X3PW4OIY3GnRI6lLqwIad3OqhuZEEX3SiQzBUBfq5U%2FwUJN36o3FfDxuEQI6Xs4F%2BhqOUNYnBh4RZGImoZL7zDQ8PrHBjqkARk8%2FauHQCu%2FVGvBNdTEN5tqpI9HPjfRj1Y4YxJKrFBDLc4z%2Ful1qGgeOKiO3gsTc2pE1GvcUCztLD9is%2FDxwlGosCbmGlxny6IKxClQV3osizx7MsOv5rbvAPzCE5YC8P02WA2u8N%2FcjQ5RrpKwqvkviYQzxqR2K51Zaytbeoycg9ahu%2FCqmxcunwiWLAMaU4E%2BioIvKLvmjPsKH98dKEEQVSTT&X-Amz-Signature=6eb4b6fa26b1e4a7d93f85b66a6785252dccc2ea76940737e1d336b053f1af4a&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4666I3PA2F6%2F20251027%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251027T005644Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEOD%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCLbyoqb%2Bf1vdiov53VBmwM5kUqpFJ%2F3iUKsBoi8Ep3zQIhAIfQD%2Biwi8CRRL%2BWuuPV4HgtbG7yJRdRKfMytlgCwWcMKogECJn%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgyCN4z8Z2%2BU1WSh7MQq3ANOAwCY%2BHDCnC7gZNgGwxw2r2gvQPzAbN5xw9YAPAvJrLZUD%2FgIwd5JfhYvf8Sfqy%2FPa6abTeWwihhJ8eymxWW3EUod3MSrTYppk75JarsKxM8xfMqZNQDGcLJU1qtLQUZGvuuBVE7ZoC3QWALvNNyPkDWBp1ECjhRZcnhG8%2B3v7qtXDJxOGZhS062JYmDqNmga3c%2FlcR9V0OP55rqae22kDV3HNUGLWCW2l%2Fa%2FSqf17%2FE9CLNaB8guWc0tOokxVJIJihW5wNpMvuHnRb8UvfRXC9lUUFlBifheT3fojRz0jowIG8bgc%2FIq21C3wWvjbMO1gYLInG1jM6jjLcPbK7NRhKEWdLLxkJqAdwKO%2Fr%2FJp69BlnJQskeck6VPxAzXKp9brb5V2a%2B13X4bBRgGxIf5WUPnA4n%2FltcM8dnYXs%2BU6atKVN25%2BjC91kQtkz1dH5hejZf1Bdymxk6QiR9c1iIIyFFWmxmW7fkSCgyWv9jLrMCQGdceL6czlaaoWtcmEcAu5CherSWKxawnLNmS9uGlHmqKRYU%2B9KEReVVi1X3PW4OIY3GnRI6lLqwIad3OqhuZEEX3SiQzBUBfq5U%2FwUJN36o3FfDxuEQI6Xs4F%2BhqOUNYnBh4RZGImoZL7zDQ8PrHBjqkARk8%2FauHQCu%2FVGvBNdTEN5tqpI9HPjfRj1Y4YxJKrFBDLc4z%2Ful1qGgeOKiO3gsTc2pE1GvcUCztLD9is%2FDxwlGosCbmGlxny6IKxClQV3osizx7MsOv5rbvAPzCE5YC8P02WA2u8N%2FcjQ5RrpKwqvkviYQzxqR2K51Zaytbeoycg9ahu%2FCqmxcunwiWLAMaU4E%2BioIvKLvmjPsKH98dKEEQVSTT&X-Amz-Signature=1704cdf4140dcd707bae8acf181e417a13199aa357aa3cc6ea9e531ac235f5a0&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

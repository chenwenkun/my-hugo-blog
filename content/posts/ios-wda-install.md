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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4664PR2CC4A%2F20260704%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260704T082218Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEFgaCXVzLXdlc3QtMiJHMEUCIQC7uLrKKedVqWESXjwLb1ULuUyn3znrtkcXh9c7tmqYVwIgVt3K%2FSJezp9e%2BEFCFZHTDXdYVwTNvzdFQigzVf5QGEcq%2FwMIIRAAGgw2Mzc0MjMxODM4MDUiDGNF7Rt3EjlSInsp2ircA5fmKmxipTJfL2goikBoQZDZyYYHvDqmW8VPDgEcO42sBIxLx%2BZmOQrGbuf1xFD4I7SUG0IAZwBtsGOLcGEdsnYtHgI8MlntDN4EfO53C1jLaXS022H6AM1OiFZ%2FqLp2Buyk6pwefYZiW4Q%2BuTbtaHAPwY5wXl%2BIqS4g3j8z9cmuXU2uZfxVmhSQBq7c%2FgbhVGYaf4scZK0gaudmMq6gR66mS9nwCixI7b7DEQBWTlGsAUat1J6dmd0c%2B8ALWwV4B2olmi3zTW4sHSrVM4kMFgMN62fgUnMNMWz2RXupswd8yMXusyJJWOV9y4DXrBegsxT4rhhtwXN9gkgGbtYalFvdji7%2F3cV8qLgJI95A2hEm%2BOsa6p89n42PjDABsgvtoY6vcp0R9Oe0NIAdlCf8B%2FfoLVDBjsNdLzF9eUt%2Faj%2FfkJ0lTWtD%2B6GGIL0nsBV39%2FI%2FCuyp%2FX84OxWfE94k0zBLtXnILgEf%2FPSnNi%2BcyBsft%2BZB4ilBIsHBG9z6ccjeG8wTSDwTTo20vy%2BLEFT9bX2xc%2BBmzjylRZDiSi8KKV21qiyfUaNRkFVRDCGqoxQu953IjTdEpOyx3I6ioPiAS0NJJ%2FeZcQc3DKYV3hF6GrM4kCUa0Z3qwjmNqEckMO31otIGOqUBCHf0Z63xrsenwzhFNidJqTg5oCzTgmvhafIBT7s2K3GNjoaZpsH7Msjqav9is9XaO3MAKdUvNvxwbJ0VewpGXQaVuitY7UjxF5Wiy11t1LBEUwVcAuqZsE9yaN73UMpG2lxcEfq%2B8PThWqmM3FjCzipWaN1hudHGP5aLgQFJkQlWNACagKK%2FVDrBqNbTOVpt31A9J9GXsodjjxN8He1bLTmEXnKM&X-Amz-Signature=45c1dc1ec6ca49d3beae103612c8a85b1532ff491067b6bc3ee8e98ff5548951&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4664PR2CC4A%2F20260704%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260704T082218Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEFgaCXVzLXdlc3QtMiJHMEUCIQC7uLrKKedVqWESXjwLb1ULuUyn3znrtkcXh9c7tmqYVwIgVt3K%2FSJezp9e%2BEFCFZHTDXdYVwTNvzdFQigzVf5QGEcq%2FwMIIRAAGgw2Mzc0MjMxODM4MDUiDGNF7Rt3EjlSInsp2ircA5fmKmxipTJfL2goikBoQZDZyYYHvDqmW8VPDgEcO42sBIxLx%2BZmOQrGbuf1xFD4I7SUG0IAZwBtsGOLcGEdsnYtHgI8MlntDN4EfO53C1jLaXS022H6AM1OiFZ%2FqLp2Buyk6pwefYZiW4Q%2BuTbtaHAPwY5wXl%2BIqS4g3j8z9cmuXU2uZfxVmhSQBq7c%2FgbhVGYaf4scZK0gaudmMq6gR66mS9nwCixI7b7DEQBWTlGsAUat1J6dmd0c%2B8ALWwV4B2olmi3zTW4sHSrVM4kMFgMN62fgUnMNMWz2RXupswd8yMXusyJJWOV9y4DXrBegsxT4rhhtwXN9gkgGbtYalFvdji7%2F3cV8qLgJI95A2hEm%2BOsa6p89n42PjDABsgvtoY6vcp0R9Oe0NIAdlCf8B%2FfoLVDBjsNdLzF9eUt%2Faj%2FfkJ0lTWtD%2B6GGIL0nsBV39%2FI%2FCuyp%2FX84OxWfE94k0zBLtXnILgEf%2FPSnNi%2BcyBsft%2BZB4ilBIsHBG9z6ccjeG8wTSDwTTo20vy%2BLEFT9bX2xc%2BBmzjylRZDiSi8KKV21qiyfUaNRkFVRDCGqoxQu953IjTdEpOyx3I6ioPiAS0NJJ%2FeZcQc3DKYV3hF6GrM4kCUa0Z3qwjmNqEckMO31otIGOqUBCHf0Z63xrsenwzhFNidJqTg5oCzTgmvhafIBT7s2K3GNjoaZpsH7Msjqav9is9XaO3MAKdUvNvxwbJ0VewpGXQaVuitY7UjxF5Wiy11t1LBEUwVcAuqZsE9yaN73UMpG2lxcEfq%2B8PThWqmM3FjCzipWaN1hudHGP5aLgQFJkQlWNACagKK%2FVDrBqNbTOVpt31A9J9GXsodjjxN8He1bLTmEXnKM&X-Amz-Signature=fe5d321672fb5353e71f60d4bf369a702f88fbe99a48dbd2e538ab60e1644aa2&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

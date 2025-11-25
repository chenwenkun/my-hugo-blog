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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB46652GDSG2N%2F20251125%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251125T181749Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEKr%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQCJk8Q4B0TYV2jgR2PzLPhQh5CMbCA6YKG8cN%2FGykxlvQIgT4qPR0lUgzdRC45q1uTA9ajTFSbjZU7n60qn5UN6s0wq%2FwMIchAAGgw2Mzc0MjMxODM4MDUiDJfPfICXmlh%2BKnEHoCrcA%2Fm%2FIWAmDwQrrPEUZjsRGWYIDwKbXbgtK9U2F4te8Cg9kHQE8ZRkjTgqcfv4GxDwJjznrNlQR9ie5tD8zxE6agCpXSIByqXF%2BeY3HYJhsumy1JU%2BnCkvw8EzAzfNXIfdybU%2BrD9W%2FD5Q0QsK4mpxxx2YP27QgV0h%2FbCsdjTmXJO%2BNbp%2BQ7bT%2F7hFu2jdvsErEVHzxpVedCNMaaJaI1J4gEGCwxdl1y3lCex4L4kv5dp9Cv6rkskvZg%2BdkxiyjaoCk2exFY3N5YrbD5N%2BQMhe0mEvFdpdbs15PT0EBHdVfo41vgD9XzQ30q8wyaEtFcIaNHT6Rue6v8QmJz4hAgpmHgTL1IR%2FoBKVLNMY%2B2eUXUZqmKDAR3EN6mACQVmYIMVyajhpbI%2B8a5CxMgSwPQVe4GODkU%2F0GS88gI8xGNrMW%2BgvrWYFitAW%2FOLeRlnG1qt2l9BYoFeSvZYVbQS62WdUksVEgPZfFgZJkNZlGxLvg7FxQuo4oE4HlMeBGHOHf8up4Btx%2BCejmDaB4Y6DXv2i2GEw%2Fv5ORb3I8zs0atKLwDqqcWgIh7%2F3XXU%2Bllglz4d43DELYrSyhUC85fULiYrxCD7nrIv0Oari0pePY1M6qEC6uXvGhFZ0loPCIS3wMJ7Ll8kGOqUB2HKW6qOXhiTup1D0TQ%2BFDvj9fF5iFqkK4M1TyEg72r1oJdJJQrGcGk1JowDCkwVdcNI2cggqzYk27DdYRODQytO8ot5oSKE2zyO0g0B0zLNtPZAR0s7PtW4KgIsHQKkMoQEm1Vz7RW29W00e%2Buipsb1AD1Fx16075FpVkF7iSxZct0H1dQhERE%2FBP6s1jahFG4%2FDE8udfkg6Vd9bnnz22swC4qRH&X-Amz-Signature=bda1cbbada1021d940ab03b63a62bec5c69aead68075faa5428eb2db9e9d6ccd&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB46652GDSG2N%2F20251125%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251125T181749Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEKr%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQCJk8Q4B0TYV2jgR2PzLPhQh5CMbCA6YKG8cN%2FGykxlvQIgT4qPR0lUgzdRC45q1uTA9ajTFSbjZU7n60qn5UN6s0wq%2FwMIchAAGgw2Mzc0MjMxODM4MDUiDJfPfICXmlh%2BKnEHoCrcA%2Fm%2FIWAmDwQrrPEUZjsRGWYIDwKbXbgtK9U2F4te8Cg9kHQE8ZRkjTgqcfv4GxDwJjznrNlQR9ie5tD8zxE6agCpXSIByqXF%2BeY3HYJhsumy1JU%2BnCkvw8EzAzfNXIfdybU%2BrD9W%2FD5Q0QsK4mpxxx2YP27QgV0h%2FbCsdjTmXJO%2BNbp%2BQ7bT%2F7hFu2jdvsErEVHzxpVedCNMaaJaI1J4gEGCwxdl1y3lCex4L4kv5dp9Cv6rkskvZg%2BdkxiyjaoCk2exFY3N5YrbD5N%2BQMhe0mEvFdpdbs15PT0EBHdVfo41vgD9XzQ30q8wyaEtFcIaNHT6Rue6v8QmJz4hAgpmHgTL1IR%2FoBKVLNMY%2B2eUXUZqmKDAR3EN6mACQVmYIMVyajhpbI%2B8a5CxMgSwPQVe4GODkU%2F0GS88gI8xGNrMW%2BgvrWYFitAW%2FOLeRlnG1qt2l9BYoFeSvZYVbQS62WdUksVEgPZfFgZJkNZlGxLvg7FxQuo4oE4HlMeBGHOHf8up4Btx%2BCejmDaB4Y6DXv2i2GEw%2Fv5ORb3I8zs0atKLwDqqcWgIh7%2F3XXU%2Bllglz4d43DELYrSyhUC85fULiYrxCD7nrIv0Oari0pePY1M6qEC6uXvGhFZ0loPCIS3wMJ7Ll8kGOqUB2HKW6qOXhiTup1D0TQ%2BFDvj9fF5iFqkK4M1TyEg72r1oJdJJQrGcGk1JowDCkwVdcNI2cggqzYk27DdYRODQytO8ot5oSKE2zyO0g0B0zLNtPZAR0s7PtW4KgIsHQKkMoQEm1Vz7RW29W00e%2Buipsb1AD1Fx16075FpVkF7iSxZct0H1dQhERE%2FBP6s1jahFG4%2FDE8udfkg6Vd9bnnz22swC4qRH&X-Amz-Signature=aa0cf700a6e25bbff391e3b8fa5398ba94c5ea030df0653c5ea685705bb9d371&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

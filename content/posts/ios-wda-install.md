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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663RS4LMYV%2F20251221%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251221T061724Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEA4aCXVzLXdlc3QtMiJHMEUCIQDnP7OByHLWAUJgfLLQyIT0dNe4YD5EPYyzicOt%2F2qZ9AIgebCbbJ6oPMsU5Ab%2FzcYeNbCKT%2Fh%2FV5U%2F57IZz0eikdoqiAQI1%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDAMnxcwsuEz21f7WISrcA0r9MNqUeWFjkjBO0CpeqwfCPF7CE5yJ%2Fl%2BK2AbOabC0ti6xgzI6SBv%2BQ1zmt3gJfU%2B5yd5h0n%2FCPBuzSBY%2F%2ByaXkZdF3nIafiTRX9aONfTZ%2F7KSA7vlrxnjnxQyHKMVxWfkuIUy%2F7s3t3JcElyQqghATfTcScYAk3MgjX0H9YH%2FldZkOOpI30UzX9clUqX4MnoaVXLpNUz4DBsWLPDQ0SIMdYvSgW5w7fjYbvPVHOfB0q56o1rw4i1OJZmihjpDCjuFTTBKRpcEWjEWcXKoZIdbQH%2FtdDSJj0aIyB6z57PValjULW7dMIDv0XyCRIBodbdgTKjHYZtEQox%2BehvJOa0EOYusVecLhSz7fXaAeU5fkA9HpSoOlYCTJtA7lWgrChLm%2FZz21g5d9zF4HNvnrZcT5CLpIbb9OChSYaUYrNtsCff8G0G6UlNyGJKDHSCFChA6Oxb7263fDi9zUfjpyidZvE4c4%2FkTLdTJVfH4jeFLO8dRxW%2Bsb2OmkF0Ix1GjNRZRplVzOy4nh0ln9x%2BlTUwm2G019zzh3s8eC%2BHlcnKM3y%2FrS41tzo1ztubFPSaov5TFGQLBRiVeCUACTYVvhpmkQrRBhPmZYdEs%2BtsojMngzttw2pD9xb1wv%2F%2B9MIiKnsoGOqUBbQ3%2Bm1%2BMO0o%2B0b6yaFJsHebfhi4JpUP9B7CLlACT96m8GNs2gSFb4wfhbr%2FUhESOOlclI8BW%2FT9VVHeO6dkGfMtN489azkHelbXvlw0HPZ8HKFsWBce%2BobGdM3QJypmXM9WhmTtpBBrjmlTQoSf5KpoBOuULFEXvNMY2Ca7%2FyX7CLMETgH0oF0Mazn0KvQ5LIIVnEFwHxpcGq2LjzqL%2FCF2%2F9ios&X-Amz-Signature=90e19fdcaaff7d97deea59bb271a60afca4f594018211d53658926de3c1d3639&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663RS4LMYV%2F20251221%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251221T061724Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEA4aCXVzLXdlc3QtMiJHMEUCIQDnP7OByHLWAUJgfLLQyIT0dNe4YD5EPYyzicOt%2F2qZ9AIgebCbbJ6oPMsU5Ab%2FzcYeNbCKT%2Fh%2FV5U%2F57IZz0eikdoqiAQI1%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDAMnxcwsuEz21f7WISrcA0r9MNqUeWFjkjBO0CpeqwfCPF7CE5yJ%2Fl%2BK2AbOabC0ti6xgzI6SBv%2BQ1zmt3gJfU%2B5yd5h0n%2FCPBuzSBY%2F%2ByaXkZdF3nIafiTRX9aONfTZ%2F7KSA7vlrxnjnxQyHKMVxWfkuIUy%2F7s3t3JcElyQqghATfTcScYAk3MgjX0H9YH%2FldZkOOpI30UzX9clUqX4MnoaVXLpNUz4DBsWLPDQ0SIMdYvSgW5w7fjYbvPVHOfB0q56o1rw4i1OJZmihjpDCjuFTTBKRpcEWjEWcXKoZIdbQH%2FtdDSJj0aIyB6z57PValjULW7dMIDv0XyCRIBodbdgTKjHYZtEQox%2BehvJOa0EOYusVecLhSz7fXaAeU5fkA9HpSoOlYCTJtA7lWgrChLm%2FZz21g5d9zF4HNvnrZcT5CLpIbb9OChSYaUYrNtsCff8G0G6UlNyGJKDHSCFChA6Oxb7263fDi9zUfjpyidZvE4c4%2FkTLdTJVfH4jeFLO8dRxW%2Bsb2OmkF0Ix1GjNRZRplVzOy4nh0ln9x%2BlTUwm2G019zzh3s8eC%2BHlcnKM3y%2FrS41tzo1ztubFPSaov5TFGQLBRiVeCUACTYVvhpmkQrRBhPmZYdEs%2BtsojMngzttw2pD9xb1wv%2F%2B9MIiKnsoGOqUBbQ3%2Bm1%2BMO0o%2B0b6yaFJsHebfhi4JpUP9B7CLlACT96m8GNs2gSFb4wfhbr%2FUhESOOlclI8BW%2FT9VVHeO6dkGfMtN489azkHelbXvlw0HPZ8HKFsWBce%2BobGdM3QJypmXM9WhmTtpBBrjmlTQoSf5KpoBOuULFEXvNMY2Ca7%2FyX7CLMETgH0oF0Mazn0KvQ5LIIVnEFwHxpcGq2LjzqL%2FCF2%2F9ios&X-Amz-Signature=f9c5e17ec975f80f0e281ab31ba81e01d5f2a20e5e38a124fce54498ffd2252c&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

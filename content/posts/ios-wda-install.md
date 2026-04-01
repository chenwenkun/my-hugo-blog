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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466ZPEBCNGW%2F20260401%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260401T012717Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEIH%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIF4OySZ83KArdqow4d0A1adMPfXtEdC8WsNsHuy%2BzMndAiBbGgmwV1AMuWOVPZdxgjWY41u3t%2FSbmP6Rj3igREKsSyr%2FAwhKEAAaDDYzNzQyMzE4MzgwNSIMGZVcLw0gQkOj9NE1KtwDKTFl0Xetv28NNnJuWCUdp8FzoLMf7RFXE22ZkXw4c7S771TdvH9Tx6veOF6BIAx%2BW4w%2FBJGJhdgIx%2Fq4WZVTRRooETF6bYnE8Kz%2BzG%2Fh8pHjCVOP9IkLBh%2Bo1UrGo6QuqregNtIj%2BIBcYLBaLonF6273uUO3%2BKTU6jRb3o7bY1xRF4wg8%2Fs54%2BWBPk%2Fr0pO%2FzAdJaMZ4pK37wrzzT3XAntDAF62r3a5uJ6bL6eY9xehY%2Bk5oVYogbLH2fSV1uWswqhAmfpP8BUu7hoQt1I9GbEFp1GgTFl%2BzoZVl5OjO2zD%2BNR8yRkzjZizWJS7DfyUG87vEst9b8qp8A4892MmzmNqnibfVLjzqCIC1kbDzCoOApPt92GgwFfqCoUn%2FiSlAUKA1Dtxx%2B2EsWy7FqwHQUNFKhSV%2FbU5VTp2Bs56c7ozAYKgbvfA8mWmWX1v%2FF8c9fkcFRO%2B5BAwXbScocQXcX1RLDJOR5LlWCwFNOjEPEt20venfTN2BqvifW7JCZ%2FWYWK%2BLyeJS2%2FnT3Iet06Afief5zrFen0qoHOyY2GqMIW6INwuEJJFXT5%2Bao0By9PcY%2BauFSas47KqIIiXyDuRz9s0fsG%2F7pLDpTINezhwsXVLq5XRAYfaGAhRXhx0w5t%2BxzgY6pgE1hsM2%2B6iKVPQYjHwXsTa4q0Zl6vnt8aaMVjEdbBuRKkBsezonLq5Wyc9u4ONxMa3weiFhCa4P9YGIj7XQUjCNz8e2LYgcfA5%2BhrEdDiQdwPEDHruBmsUcHJUHFNDHtEKW3fy0bqfpTWyQb3aZ2MDcW5Ketfk%2FTqYDoImP6huAEhi6mvO%2FxeGJQi6sk2MuPbwlVp5%2BiJ7UB1O8YpVjM%2BPx7anmksd4&X-Amz-Signature=c1fc7cf0697fc6ea8f7766686bb41464f8e555e48659eb4dbeba8caab06582bb&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466ZPEBCNGW%2F20260401%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260401T012717Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEIH%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIF4OySZ83KArdqow4d0A1adMPfXtEdC8WsNsHuy%2BzMndAiBbGgmwV1AMuWOVPZdxgjWY41u3t%2FSbmP6Rj3igREKsSyr%2FAwhKEAAaDDYzNzQyMzE4MzgwNSIMGZVcLw0gQkOj9NE1KtwDKTFl0Xetv28NNnJuWCUdp8FzoLMf7RFXE22ZkXw4c7S771TdvH9Tx6veOF6BIAx%2BW4w%2FBJGJhdgIx%2Fq4WZVTRRooETF6bYnE8Kz%2BzG%2Fh8pHjCVOP9IkLBh%2Bo1UrGo6QuqregNtIj%2BIBcYLBaLonF6273uUO3%2BKTU6jRb3o7bY1xRF4wg8%2Fs54%2BWBPk%2Fr0pO%2FzAdJaMZ4pK37wrzzT3XAntDAF62r3a5uJ6bL6eY9xehY%2Bk5oVYogbLH2fSV1uWswqhAmfpP8BUu7hoQt1I9GbEFp1GgTFl%2BzoZVl5OjO2zD%2BNR8yRkzjZizWJS7DfyUG87vEst9b8qp8A4892MmzmNqnibfVLjzqCIC1kbDzCoOApPt92GgwFfqCoUn%2FiSlAUKA1Dtxx%2B2EsWy7FqwHQUNFKhSV%2FbU5VTp2Bs56c7ozAYKgbvfA8mWmWX1v%2FF8c9fkcFRO%2B5BAwXbScocQXcX1RLDJOR5LlWCwFNOjEPEt20venfTN2BqvifW7JCZ%2FWYWK%2BLyeJS2%2FnT3Iet06Afief5zrFen0qoHOyY2GqMIW6INwuEJJFXT5%2Bao0By9PcY%2BauFSas47KqIIiXyDuRz9s0fsG%2F7pLDpTINezhwsXVLq5XRAYfaGAhRXhx0w5t%2BxzgY6pgE1hsM2%2B6iKVPQYjHwXsTa4q0Zl6vnt8aaMVjEdbBuRKkBsezonLq5Wyc9u4ONxMa3weiFhCa4P9YGIj7XQUjCNz8e2LYgcfA5%2BhrEdDiQdwPEDHruBmsUcHJUHFNDHtEKW3fy0bqfpTWyQb3aZ2MDcW5Ketfk%2FTqYDoImP6huAEhi6mvO%2FxeGJQi6sk2MuPbwlVp5%2BiJ7UB1O8YpVjM%2BPx7anmksd4&X-Amz-Signature=54539c526b7fc44a22c23c4069865057204d015006b64619fbf3f3c22632e162&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

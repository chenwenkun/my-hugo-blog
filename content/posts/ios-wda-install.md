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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466QLGNMV7F%2F20251015%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251015T181628Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjENL%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCSg861JULW8QXWdY6aVkgowhz1NMds39UCfSeFAHzAFgIhANE5UMmf0N0h%2B9Zbz2bMl6%2BIhv2F1r6dPfW%2F%2Fb1vil7oKv8DCHsQABoMNjM3NDIzMTgzODA1IgwZdgFTrry14erPPNQq3ANEKd0YVkLUsf%2F8Jqtt2ve%2FH%2FIVYYoIJT2vlF%2B4ozUuYyckIto70Kk4PbmFpVK%2BdL1xGDQb9zCQAFs8t4jQjki3QAQJB4FmOaacjcpalhk%2B2uX6kHj%2FEuRQTHxY%2BHz1LzXdQCk9zMK%2BDmdDAuSelUc%2B%2Be3c1dNrL1XMeYs%2FxMI%2FclUweWsUMMEL1CjmQMJOH1Y%2FfVZD5xZcP3qOAo1U4aFfFzCm2N4H16mAaGRnbA%2F2dy%2B5NEqBvM5OcgJkG65gwCUIPw1fpZjHm580uJ3JUX031FTcnNIsh7jZTFYbe8vfJdSL0AaFEsA2vVuDNgLiMKVBdlI89qjRg2fllbcqPipBwLlagkN%2BJxbLWX3JUPGkbDEjOT0%2B9lPOWw3ex1TQXAc%2BowHPnDmV0J4sKCwS6vBt%2BKjR44AIe%2FKiGeb%2FdmAuO%2BIjvzxfUr%2FGWPBa%2Bg%2Fx8T8XvkM7tQrvFar6sIckWfnMWEs%2FQNNWUZNpOcxV%2F3Hk9gmWJgPhL5kytLLbj1r3%2BgUHiyVDvpxLxbahhvlOZNxOVRuTxi0s7YhRKVpJeWHHJ5WnEiAJbIfYOI7yyz1i4ZPatVHXfiOikbTcNKI6dGnqkfEuPP2xkPmR26N9u0xKYgvqhDmZc4v42H30TzC2v7%2FHBjqkAc7J%2FMgHvEfBvwciDbkx%2F6YL6yCmciBegg6Rj3E%2FyJtFCf%2BrK%2FspHmX%2FdUvFOa2MKIOTSgdSq7V35doU4QD9dQdjVWzTcpPQ5ZTp%2BTJbGSG5g6fTDH%2Bxn7GSCoWjA6JzjKONjpN2SE9PEecDP%2FGkHkkSySdUVVUcMkJBxC6X7IoDfngZybyVAlAtom5jbunOFbwdmUDZeyOQGDjAV2lASf1Rqua0&X-Amz-Signature=0adc11034d794d078bce65c17323761fe50026e43de0a4264dbd2ce640db8ab2&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466QLGNMV7F%2F20251015%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251015T181628Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjENL%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCSg861JULW8QXWdY6aVkgowhz1NMds39UCfSeFAHzAFgIhANE5UMmf0N0h%2B9Zbz2bMl6%2BIhv2F1r6dPfW%2F%2Fb1vil7oKv8DCHsQABoMNjM3NDIzMTgzODA1IgwZdgFTrry14erPPNQq3ANEKd0YVkLUsf%2F8Jqtt2ve%2FH%2FIVYYoIJT2vlF%2B4ozUuYyckIto70Kk4PbmFpVK%2BdL1xGDQb9zCQAFs8t4jQjki3QAQJB4FmOaacjcpalhk%2B2uX6kHj%2FEuRQTHxY%2BHz1LzXdQCk9zMK%2BDmdDAuSelUc%2B%2Be3c1dNrL1XMeYs%2FxMI%2FclUweWsUMMEL1CjmQMJOH1Y%2FfVZD5xZcP3qOAo1U4aFfFzCm2N4H16mAaGRnbA%2F2dy%2B5NEqBvM5OcgJkG65gwCUIPw1fpZjHm580uJ3JUX031FTcnNIsh7jZTFYbe8vfJdSL0AaFEsA2vVuDNgLiMKVBdlI89qjRg2fllbcqPipBwLlagkN%2BJxbLWX3JUPGkbDEjOT0%2B9lPOWw3ex1TQXAc%2BowHPnDmV0J4sKCwS6vBt%2BKjR44AIe%2FKiGeb%2FdmAuO%2BIjvzxfUr%2FGWPBa%2Bg%2Fx8T8XvkM7tQrvFar6sIckWfnMWEs%2FQNNWUZNpOcxV%2F3Hk9gmWJgPhL5kytLLbj1r3%2BgUHiyVDvpxLxbahhvlOZNxOVRuTxi0s7YhRKVpJeWHHJ5WnEiAJbIfYOI7yyz1i4ZPatVHXfiOikbTcNKI6dGnqkfEuPP2xkPmR26N9u0xKYgvqhDmZc4v42H30TzC2v7%2FHBjqkAc7J%2FMgHvEfBvwciDbkx%2F6YL6yCmciBegg6Rj3E%2FyJtFCf%2BrK%2FspHmX%2FdUvFOa2MKIOTSgdSq7V35doU4QD9dQdjVWzTcpPQ5ZTp%2BTJbGSG5g6fTDH%2Bxn7GSCoWjA6JzjKONjpN2SE9PEecDP%2FGkHkkSySdUVVUcMkJBxC6X7IoDfngZybyVAlAtom5jbunOFbwdmUDZeyOQGDjAV2lASf1Rqua0&X-Amz-Signature=6bc4ae69a4bad148ef5638c4f23be60b18ae650ead02c4cbf1f3f1490d36a142&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

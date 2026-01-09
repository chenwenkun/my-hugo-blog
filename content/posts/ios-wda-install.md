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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4662WB2BBZP%2F20260109%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260109T122415Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjENz%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIEXWvLl5wtez7q5x%2BZO54B6JtZc6p6tQRAmNv%2FD0sZ4MAiEAi3AZoVT0CM6EKTf9PegXT%2BWVRu117TFtfQGlJfcYRWMqiAQIpf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDAHzk7M1yuDo0yjNxCrcAw%2FN%2FvSZDf2v5Ip4M8U%2FpMY3gP%2Fn2bnJ51lxjBo0VgZWv%2F6%2Fw8iRxcNL0S7TkFtQfVo%2B1acDZBMdvuP5UmwBPeuxc9rI7txIuv7OBA%2F8FD9arcjcd0ejnxLsrir%2FCgki0QhZIJw5fuDHEEms8a%2FBY10zHS50WBq5Pqz4bVzxsvpx784wFXmj1MBBjvdnbEv6s%2Bv%2Fv9qoSeQk5jbc25Z4xfXE8kiAaGahBwEcKfu%2FhAFM3Uzxrd5cYcQZ6UIyeKbjomRuXPWymyzgZhwM42fHhWTlkuTkBNwFz1idJpXxlSGmVCgr1BKejYaTwpH1MlYfx112hRzW%2Bpzi%2Boa7vceYlFFXrIARVz9hk4Ra%2B3Vir2ryXwz8JQ3l%2FtIsYDCyygAKAIaaS2uYr3L%2FJHqqdvzFMY73wAZKdWMtiDoz4BBRIHzTuS6zzJZVB3iaUq1fY%2BpNboVoDmSVf6egEj5j7kKnY32%2FFXhkw9f1WGYHi2%2BDe84inECft7A0Lr5AAkz1nkQprH48YjMbJf8fcpt9ZSz7TVH9zehvPsKEJADfLaStdelVgwYuO2czyHDtdTjpenQxKyJbKmuLb42N174KS89K7hWVVAdJfscdhUJTaBeF%2BFIcpmREgHyUgEd2cTuQMNzig8sGOqUB1R7zqjpA83O2juFlMordN3294th2WNO04PbBrBJ7%2FswcyDTpCtn0laW7UUaKUQyzLgQZf0oLJ4aPaoT9aVSK7GYX6e6DhgbpbZlLyNpufiV7HGhGWi896UAZhH6EZU1Wjyhi5hqseJO%2FrjY5BIUFvPfJsIapZi0aGcJfoGvDsdWNY9pHpKivkDZBGEh%2F4KECAIHidYAcie4Sx2Yjo1a9dEdDBMsO&X-Amz-Signature=20399959c3c2cb75462e8c8732b0010350ccdcbb6201fbba6f7fe6c7ea465014&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4662WB2BBZP%2F20260109%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260109T122415Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjENz%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIEXWvLl5wtez7q5x%2BZO54B6JtZc6p6tQRAmNv%2FD0sZ4MAiEAi3AZoVT0CM6EKTf9PegXT%2BWVRu117TFtfQGlJfcYRWMqiAQIpf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDAHzk7M1yuDo0yjNxCrcAw%2FN%2FvSZDf2v5Ip4M8U%2FpMY3gP%2Fn2bnJ51lxjBo0VgZWv%2F6%2Fw8iRxcNL0S7TkFtQfVo%2B1acDZBMdvuP5UmwBPeuxc9rI7txIuv7OBA%2F8FD9arcjcd0ejnxLsrir%2FCgki0QhZIJw5fuDHEEms8a%2FBY10zHS50WBq5Pqz4bVzxsvpx784wFXmj1MBBjvdnbEv6s%2Bv%2Fv9qoSeQk5jbc25Z4xfXE8kiAaGahBwEcKfu%2FhAFM3Uzxrd5cYcQZ6UIyeKbjomRuXPWymyzgZhwM42fHhWTlkuTkBNwFz1idJpXxlSGmVCgr1BKejYaTwpH1MlYfx112hRzW%2Bpzi%2Boa7vceYlFFXrIARVz9hk4Ra%2B3Vir2ryXwz8JQ3l%2FtIsYDCyygAKAIaaS2uYr3L%2FJHqqdvzFMY73wAZKdWMtiDoz4BBRIHzTuS6zzJZVB3iaUq1fY%2BpNboVoDmSVf6egEj5j7kKnY32%2FFXhkw9f1WGYHi2%2BDe84inECft7A0Lr5AAkz1nkQprH48YjMbJf8fcpt9ZSz7TVH9zehvPsKEJADfLaStdelVgwYuO2czyHDtdTjpenQxKyJbKmuLb42N174KS89K7hWVVAdJfscdhUJTaBeF%2BFIcpmREgHyUgEd2cTuQMNzig8sGOqUB1R7zqjpA83O2juFlMordN3294th2WNO04PbBrBJ7%2FswcyDTpCtn0laW7UUaKUQyzLgQZf0oLJ4aPaoT9aVSK7GYX6e6DhgbpbZlLyNpufiV7HGhGWi896UAZhH6EZU1Wjyhi5hqseJO%2FrjY5BIUFvPfJsIapZi0aGcJfoGvDsdWNY9pHpKivkDZBGEh%2F4KECAIHidYAcie4Sx2Yjo1a9dEdDBMsO&X-Amz-Signature=e9afda3d9cd3266f9d8ffa2e4fe5750b8dd83d1ce9b2f6553396dffcabd0a236&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

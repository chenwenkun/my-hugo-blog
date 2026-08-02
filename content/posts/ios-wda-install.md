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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466VVYVJPLP%2F20260802%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260802T080330Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEBAaCXVzLXdlc3QtMiJIMEYCIQDS3tJnwrUufwvLdqI5lanpS9aksbUQv7T29Dugiu9QfwIhANt2XWQqtiuRc9IgkP4b8m6B4s%2B4EHdKNTKaNK3k%2B5XtKogECNn%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1Igx1KSajKkor9PR1Wmsq3APXDkOYKr2fmhsLlw4o9DJNsVrBhulcxKEK%2FjWO%2B12LGAukEHcywJ6egfwpyaIodg97%2F3RoQg4DXUc%2BZzVRzDz9mCDa2RQIKnMHwtltjMjkK5NO2W9XHWeIC00EM4a7M96Ru7KyWB8jb7K4EH209tea9dRl3WFYxBtciz2Ts%2F%2FrnROHAVXdnfsfe16ZUjrkEZXiE%2BO86bxfG4SC9vfSDZKM4IfjuNFGetJB93%2F9wBh0hznY8i%2Ba1FJHHKs0kasSBRsfRuknnN%2BklfRWLeAG1X5pt1RRNxSbaSAo%2Bp50xsFpGrqSdCuKB%2BsOnh%2BXk0d9Gz%2BNh%2F6xa1%2BRG9i4QcZFpAq2wRI%2Bg48Hekge7apTizbzsYZemaxiKmkCaMlNcr5jczueC6C3nUgt%2FLdUVddzNNengvW2kNEgZQGx6m8SbcpaJXH0z7Z7ELxwK8IwNTG4HBYGjqpJNq1IGTXXiIAy5jcd7vkfx4KqFDNJd24hGgZzQm8qnYwDekIYYpMP7c87%2FBAs%2B2XLMNkm7TTWMDbsGX7MeKEWY95n%2B48XjOyAQZC9U7xZxLM8qArVBYHAZSSoEJVpq56eXBNLxYGKnnCQZ94Qfic0nGjLd50d4mnz%2BSDBF0vCZGSQvwRBbxwffjCV8rvTBjqkAahgaoJvdvf3W%2BFP63sUfIgATu8yPyEYMoA4BsyBMbimlIAITw4iOqbzxQLocZ%2BOVgoIDQg7%2FhoOekwUCAN%2BxdiDF1jQ1rv1D%2FMsVavE32GEwzni8XbMnCkeo0TJhyzmo5WUsiPQUBBzduPopCRtE0RagT3naUjNW0TQzdC8mzFiI0mY1yygQK%2BJo5h8074Vksf09ayoYDaLe7aP0flKqeCNbVGg&X-Amz-Signature=0681db3b0fb629e1cf71cd8995963a960edc6f82ea09d0e076111c9854f8db37&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466VVYVJPLP%2F20260802%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260802T080330Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEBAaCXVzLXdlc3QtMiJIMEYCIQDS3tJnwrUufwvLdqI5lanpS9aksbUQv7T29Dugiu9QfwIhANt2XWQqtiuRc9IgkP4b8m6B4s%2B4EHdKNTKaNK3k%2B5XtKogECNn%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1Igx1KSajKkor9PR1Wmsq3APXDkOYKr2fmhsLlw4o9DJNsVrBhulcxKEK%2FjWO%2B12LGAukEHcywJ6egfwpyaIodg97%2F3RoQg4DXUc%2BZzVRzDz9mCDa2RQIKnMHwtltjMjkK5NO2W9XHWeIC00EM4a7M96Ru7KyWB8jb7K4EH209tea9dRl3WFYxBtciz2Ts%2F%2FrnROHAVXdnfsfe16ZUjrkEZXiE%2BO86bxfG4SC9vfSDZKM4IfjuNFGetJB93%2F9wBh0hznY8i%2Ba1FJHHKs0kasSBRsfRuknnN%2BklfRWLeAG1X5pt1RRNxSbaSAo%2Bp50xsFpGrqSdCuKB%2BsOnh%2BXk0d9Gz%2BNh%2F6xa1%2BRG9i4QcZFpAq2wRI%2Bg48Hekge7apTizbzsYZemaxiKmkCaMlNcr5jczueC6C3nUgt%2FLdUVddzNNengvW2kNEgZQGx6m8SbcpaJXH0z7Z7ELxwK8IwNTG4HBYGjqpJNq1IGTXXiIAy5jcd7vkfx4KqFDNJd24hGgZzQm8qnYwDekIYYpMP7c87%2FBAs%2B2XLMNkm7TTWMDbsGX7MeKEWY95n%2B48XjOyAQZC9U7xZxLM8qArVBYHAZSSoEJVpq56eXBNLxYGKnnCQZ94Qfic0nGjLd50d4mnz%2BSDBF0vCZGSQvwRBbxwffjCV8rvTBjqkAahgaoJvdvf3W%2BFP63sUfIgATu8yPyEYMoA4BsyBMbimlIAITw4iOqbzxQLocZ%2BOVgoIDQg7%2FhoOekwUCAN%2BxdiDF1jQ1rv1D%2FMsVavE32GEwzni8XbMnCkeo0TJhyzmo5WUsiPQUBBzduPopCRtE0RagT3naUjNW0TQzdC8mzFiI0mY1yygQK%2BJo5h8074Vksf09ayoYDaLe7aP0flKqeCNbVGg&X-Amz-Signature=53a57f798c7a14f5ab3886536c6d7295600b174afc5008e974530c8ce28a0579&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466T3XQYVUT%2F20260407%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260407T070337Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEBcaCXVzLXdlc3QtMiJHMEUCIQDO8dygg8vv83wgpX0I%2FNCvPTJ8b1lEDAMFDPhLUpotDAIgMxzu1kNwuqDOsBmj6fb7BNDkn%2BpsOlcWh0wm9fwZdyAqiAQI4P%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDJhuNcRobq6RkYGfGSrcA8uL2FOFGIA0JmKboKwF49frYc9lr2edRTrGEYAcb%2F8Kx6DTvReIxHxXRuUEfE24a3%2F%2Bebh75Dfj9kD66nnxeC3q3AuNQ1LzbZcpq20QYMbJABWljU0mb7z6XsDGOITH69tuoN%2Fnu6U7AOisZ2lyhmZ0PcaBtYyn%2Fw61Gn8sHw%2BWIQbAZTgYm5PhUOUGgJM38uUTMslgjr%2FTSjTCZWQ5vQhx7o2VKBkQE9N501CK8DODQYP8FJbCao3Cgd%2BNXXyQvFjD%2Bo2O%2FiEl7gYeviCF02UDZDN%2BWT1iMlBXHWNa4TOtoDdiTfkCrRD2ArfNfuM05egJ7Jy5LxdSjykJeLPB4r2KxBLIqIjYQEy5dyiGyo8MVtrAkcm7xfD8%2Fj48oxUfIeU5kBsaFPMljYaAPGCLqSUaQpUEOL1bSLhgG%2BVT5lCqpUNCDj3voyGDSY5bdy8QrlgYmrAZRKfgWTkHwiqWAD9IOT1WP1g05o%2BJPKz16017b6qQS5iosh6p5eAjwSdwsH2aCxgI5C7BVDeh4vpqdCqkU9e8m3MvBrgGl2Da%2FzruERj2fC7pTp3vjPAHvC4YepAAs6%2FSQi6vFnqoEpTLLTghagOEqST%2FKms%2FaathG4ar6IP8AjD6XViQyzoyMMHL0s4GOqUBoqSH%2BeJ4F6SmAjmPM%2B6TXrAsEWXrIabDyTrg%2BbB%2Bu%2BSnPs0RFV4p%2BZvIm97dSCVJhP0BK7IMBhyxKNCYhCeCYDX2hjlTluOH6K%2Bv0dzeB8oA1EPk2TmQykp3tr0FmP6JoUC7t81lqTTs8rhGhpKh%2BWcJkSuHhltQz%2BQxlfyQnkOt6ThFbLuAZGC7KVTevx4%2FH%2FhgyIXcky%2B30u90cDdVTRGUcCzd&X-Amz-Signature=be6bba6d453aea771227717f33a1a6eb686efe0abbd914fe01caf9013a151415&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466T3XQYVUT%2F20260407%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260407T070337Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEBcaCXVzLXdlc3QtMiJHMEUCIQDO8dygg8vv83wgpX0I%2FNCvPTJ8b1lEDAMFDPhLUpotDAIgMxzu1kNwuqDOsBmj6fb7BNDkn%2BpsOlcWh0wm9fwZdyAqiAQI4P%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDJhuNcRobq6RkYGfGSrcA8uL2FOFGIA0JmKboKwF49frYc9lr2edRTrGEYAcb%2F8Kx6DTvReIxHxXRuUEfE24a3%2F%2Bebh75Dfj9kD66nnxeC3q3AuNQ1LzbZcpq20QYMbJABWljU0mb7z6XsDGOITH69tuoN%2Fnu6U7AOisZ2lyhmZ0PcaBtYyn%2Fw61Gn8sHw%2BWIQbAZTgYm5PhUOUGgJM38uUTMslgjr%2FTSjTCZWQ5vQhx7o2VKBkQE9N501CK8DODQYP8FJbCao3Cgd%2BNXXyQvFjD%2Bo2O%2FiEl7gYeviCF02UDZDN%2BWT1iMlBXHWNa4TOtoDdiTfkCrRD2ArfNfuM05egJ7Jy5LxdSjykJeLPB4r2KxBLIqIjYQEy5dyiGyo8MVtrAkcm7xfD8%2Fj48oxUfIeU5kBsaFPMljYaAPGCLqSUaQpUEOL1bSLhgG%2BVT5lCqpUNCDj3voyGDSY5bdy8QrlgYmrAZRKfgWTkHwiqWAD9IOT1WP1g05o%2BJPKz16017b6qQS5iosh6p5eAjwSdwsH2aCxgI5C7BVDeh4vpqdCqkU9e8m3MvBrgGl2Da%2FzruERj2fC7pTp3vjPAHvC4YepAAs6%2FSQi6vFnqoEpTLLTghagOEqST%2FKms%2FaathG4ar6IP8AjD6XViQyzoyMMHL0s4GOqUBoqSH%2BeJ4F6SmAjmPM%2B6TXrAsEWXrIabDyTrg%2BbB%2Bu%2BSnPs0RFV4p%2BZvIm97dSCVJhP0BK7IMBhyxKNCYhCeCYDX2hjlTluOH6K%2Bv0dzeB8oA1EPk2TmQykp3tr0FmP6JoUC7t81lqTTs8rhGhpKh%2BWcJkSuHhltQz%2BQxlfyQnkOt6ThFbLuAZGC7KVTevx4%2FH%2FhgyIXcky%2B30u90cDdVTRGUcCzd&X-Amz-Signature=562779109d801c1cc6d9d4f9cffa65dfc1bcabab3ea42600a350ab3969b9e459&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

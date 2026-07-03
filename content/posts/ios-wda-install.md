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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466VFLUUIAY%2F20260703%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260703T190014Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEEsaCXVzLXdlc3QtMiJGMEQCICrbPVxskhfaeAytb%2BZV46Zzq3yQ2wZXPFGhuZxOnspMAiAfcpB4ZgrKQyN6%2BHKTtqNB0R7QTpDxKLzNsvRC90w6byr%2FAwgUEAAaDDYzNzQyMzE4MzgwNSIMV8WF%2FyjLINYNklhPKtwDYLW0dbiN3o%2BM1FpAturRm6lPIjOnzqfpYCyCGGFs5ClmHRK9%2FCvDABdBS%2BTaWQGDnjznxISr3Jk3tNtpA%2ByxdV0D08GVj%2FTXBN3v%2B824IOHhVWgvrhtVZSPPFBEW2PpL5oZVafHwzLa19G5f%2FYd2jdW00%2BOPkRTBbPpRXmzLbawg9vkevr1K2AcJwlQHNHkFEW6N05OH6dp%2BrP7DXSBAmmQQay7SJAA8E1pj6GO6P1%2F9Vsk2GZZCS01sFMvKM45qTnum51OeGyauyKPYvuWm586ZDhV9E%2B4QEDRCq1lHmnYpivtO2P%2FX3W5lWo2%2BP6bf2AXW90fJzxZyCecKxNLN%2F21cUl3RcH%2BMlFBKOPYMyudkRROT%2Fw6qx84z%2FxEzMUO18DoYjP9DvYO1krdxkHdiv5u13gWmh6u1WYgUp%2BJ%2BZnuqRx5Cigz7c%2BymP%2FWXWO4oN02WL1gMNnkuCcoePl%2BJthFQ4lQ7MvqQ3BlAiKm7emjuK9VXOSTV5wg70BZJhLI5KCQLC2%2B8XrhhzEsG3Ovng%2FKjBpxUk7lZSnK6KSKofLG%2BcQOUXE3owk5pvTgJeB7bd8IA0WzkGP8zdWxjgWbeffs4fsQi5BkNwFXVgFWLJrbOOKuKvlRFLI80W%2B0wiYug0gY6pgEzzD1fuJ10Hia7i5d%2Bu9KSEFgmqUWyx3YFyL8f70wsTsrTs%2BXoEt%2BBykmRNf3ePqpbDRZpDod0K%2B2pb2zcX9zgUzGlKeFJOyhCyxA48j2pYzRPkfv3Qtjdr7o1%2BHliJN9v6y3tzHD5kVzhJb0q%2BI5WOvmCU6zGF%2FETvJbrDB4EQQqr8yWVOq6bJFc2508OOOZd082xyeBnCc92cH31B3Y7pNws6oZt&X-Amz-Signature=565e64d8b9c010025f3b951c9af36b26da6c9b6f9b6bbaea8fe478a0f4f29077&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466VFLUUIAY%2F20260703%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260703T190014Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEEsaCXVzLXdlc3QtMiJGMEQCICrbPVxskhfaeAytb%2BZV46Zzq3yQ2wZXPFGhuZxOnspMAiAfcpB4ZgrKQyN6%2BHKTtqNB0R7QTpDxKLzNsvRC90w6byr%2FAwgUEAAaDDYzNzQyMzE4MzgwNSIMV8WF%2FyjLINYNklhPKtwDYLW0dbiN3o%2BM1FpAturRm6lPIjOnzqfpYCyCGGFs5ClmHRK9%2FCvDABdBS%2BTaWQGDnjznxISr3Jk3tNtpA%2ByxdV0D08GVj%2FTXBN3v%2B824IOHhVWgvrhtVZSPPFBEW2PpL5oZVafHwzLa19G5f%2FYd2jdW00%2BOPkRTBbPpRXmzLbawg9vkevr1K2AcJwlQHNHkFEW6N05OH6dp%2BrP7DXSBAmmQQay7SJAA8E1pj6GO6P1%2F9Vsk2GZZCS01sFMvKM45qTnum51OeGyauyKPYvuWm586ZDhV9E%2B4QEDRCq1lHmnYpivtO2P%2FX3W5lWo2%2BP6bf2AXW90fJzxZyCecKxNLN%2F21cUl3RcH%2BMlFBKOPYMyudkRROT%2Fw6qx84z%2FxEzMUO18DoYjP9DvYO1krdxkHdiv5u13gWmh6u1WYgUp%2BJ%2BZnuqRx5Cigz7c%2BymP%2FWXWO4oN02WL1gMNnkuCcoePl%2BJthFQ4lQ7MvqQ3BlAiKm7emjuK9VXOSTV5wg70BZJhLI5KCQLC2%2B8XrhhzEsG3Ovng%2FKjBpxUk7lZSnK6KSKofLG%2BcQOUXE3owk5pvTgJeB7bd8IA0WzkGP8zdWxjgWbeffs4fsQi5BkNwFXVgFWLJrbOOKuKvlRFLI80W%2B0wiYug0gY6pgEzzD1fuJ10Hia7i5d%2Bu9KSEFgmqUWyx3YFyL8f70wsTsrTs%2BXoEt%2BBykmRNf3ePqpbDRZpDod0K%2B2pb2zcX9zgUzGlKeFJOyhCyxA48j2pYzRPkfv3Qtjdr7o1%2BHliJN9v6y3tzHD5kVzhJb0q%2BI5WOvmCU6zGF%2FETvJbrDB4EQQqr8yWVOq6bJFc2508OOOZd082xyeBnCc92cH31B3Y7pNws6oZt&X-Amz-Signature=d7732a52a5104743b828ed518c41542de0d79a8962da599bb7b39477a42e601a&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

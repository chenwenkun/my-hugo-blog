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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466RBDGO3FL%2F20251208%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251208T181825Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEOH%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIDmfEzOrkVaZ1cqyeo9woOCgaki6and5FaU0zMiPrS6QAiEAvxTnjFSVIxAX76d0an0femuvas%2Feyb299VnTlgxgcGEqiAQIqv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDDbjG77kfHXriTW1kSrcA6W%2BL9qgfc9hh09tKJP45aGg5R9NYMHeDgweAohEA7tD1XXqElheaBqT0vk3kS1pmEofXs2GlaN%2FxixaECYmlqcKBEG7r5eSsxhJhKUYip58T8Dp%2FLl48jMu3rlI4IR0hfds5H1cNq3jQ5C1KttPuAErKXEF8SbeAe3e7mJ8pnAOmsD5zt5r8TW%2FwWTlCVb05Ps0SZEJBvFasZr9022AXsT0GANuq5JUVIMdWhcPR5ANDXgz1Ycc67YWrI7IbXIE8GRwiDvCuuW8iWbsR9qP%2BeOlJsK0ib%2BsZkenXcnsiihslkklsjnF4QTYqeEaNMmuHix8Q%2BSlRGI%2B4rWrBHUOSl9GbdCPWJCBuTk1hhPV8VzUAttATobTz%2F2Vr2vkZLh3IA%2FxDr83MVHBDHoIUIQpExVmlyivZ2yNxJhS6EXJqc%2Bc0TTxWhT4Ogw3v9PYWE3B72%2BYm7wGxfecqrpDFYvxfor6wvL3yWdhaI9MgGd10IPET4N7W5%2BCex72EmpArUpqz46Z0kgwtnXOO1gTuVEcyDpkpaZPhCrec1RNY8Flf9AzixzpjXpQEngm9DqxWgwZN%2Bn%2F50sdjEGXsUwtMmArjxkqhAk5qg4JqK4CjiOi4iFVMI9ShxsoGWoTfa%2FiMImH3MkGOqUBl6dezskbdhSRL61tu5RIxvJPmqP%2FXpPcY7gV8%2BEH7zz%2BDcx2HjeDi8kmgsS87AkADQYGCPttV3kH7cZL0z5xv3a6m4dVYurjOJcvY%2FYEg7eC4cLvuNMgv8%2BFn9TqhPObMeBhcpGELVoSIJXHjEkKmIB9G%2BQXDu%2Fs2BjSJI4zCxe27%2FymlZK6eDIMhbSw7DB%2FbHpJwP1igvfadurwSRwdmQbppn5M&X-Amz-Signature=af1f16ddf3d26e115617839d29c6c478cf372e0e32c167c08707023532ae574c&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466RBDGO3FL%2F20251208%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251208T181825Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEOH%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIDmfEzOrkVaZ1cqyeo9woOCgaki6and5FaU0zMiPrS6QAiEAvxTnjFSVIxAX76d0an0femuvas%2Feyb299VnTlgxgcGEqiAQIqv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDDbjG77kfHXriTW1kSrcA6W%2BL9qgfc9hh09tKJP45aGg5R9NYMHeDgweAohEA7tD1XXqElheaBqT0vk3kS1pmEofXs2GlaN%2FxixaECYmlqcKBEG7r5eSsxhJhKUYip58T8Dp%2FLl48jMu3rlI4IR0hfds5H1cNq3jQ5C1KttPuAErKXEF8SbeAe3e7mJ8pnAOmsD5zt5r8TW%2FwWTlCVb05Ps0SZEJBvFasZr9022AXsT0GANuq5JUVIMdWhcPR5ANDXgz1Ycc67YWrI7IbXIE8GRwiDvCuuW8iWbsR9qP%2BeOlJsK0ib%2BsZkenXcnsiihslkklsjnF4QTYqeEaNMmuHix8Q%2BSlRGI%2B4rWrBHUOSl9GbdCPWJCBuTk1hhPV8VzUAttATobTz%2F2Vr2vkZLh3IA%2FxDr83MVHBDHoIUIQpExVmlyivZ2yNxJhS6EXJqc%2Bc0TTxWhT4Ogw3v9PYWE3B72%2BYm7wGxfecqrpDFYvxfor6wvL3yWdhaI9MgGd10IPET4N7W5%2BCex72EmpArUpqz46Z0kgwtnXOO1gTuVEcyDpkpaZPhCrec1RNY8Flf9AzixzpjXpQEngm9DqxWgwZN%2Bn%2F50sdjEGXsUwtMmArjxkqhAk5qg4JqK4CjiOi4iFVMI9ShxsoGWoTfa%2FiMImH3MkGOqUBl6dezskbdhSRL61tu5RIxvJPmqP%2FXpPcY7gV8%2BEH7zz%2BDcx2HjeDi8kmgsS87AkADQYGCPttV3kH7cZL0z5xv3a6m4dVYurjOJcvY%2FYEg7eC4cLvuNMgv8%2BFn9TqhPObMeBhcpGELVoSIJXHjEkKmIB9G%2BQXDu%2Fs2BjSJI4zCxe27%2FymlZK6eDIMhbSw7DB%2FbHpJwP1igvfadurwSRwdmQbppn5M&X-Amz-Signature=7b227b98a4652b4776b4a8aa46aecb8c670db7b2ab8651ac72ae7dd938cba920&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

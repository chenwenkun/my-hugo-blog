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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466UEY34ZOW%2F20251017%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251017T181351Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEP3%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIBe4Ft8EFt3D8QpBKxaR8q%2Fj9p91H%2Fuu2sk84c3zhgc5AiB%2F9rjHO%2F%2BY21M0InGQ1VEvOEtJICSjOnPnjOvzTHAPFSqIBAim%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMeHNwXz3tGr1EQsK3KtwDtl4xHAvbVzcgGV%2BQhuyA8nGaD30BNz6JHcajp58xaoQnokbAVn1YiX4VLWg3dJmLSwuWounkZVOH2vPTaFJ%2Byq3AU%2FL36daBvgQWE6cYwKcP8iuQ55KZDhowWqQHXDZEn2Qli6LRTtvgMGi0RJhTBEKEHEN7VneiorLh53HmsT0o%2FJSx4O5TJqmbrMqV9Xr3Cuf%2FYvJKKbvCIfabDTtrlh4vxCsXBOpeY0nUF5muWo%2BCHARW9rkvSHR%2B1AaYAnOHY2kYCyt%2BuWXlYTcGOsj3ZmAGNFOt2qk%2FhPIHJ2JPzOOfoxawJpXKdPX5fOsdjwAzFmt5o9GxRmlsLJ5pCJpEQPRfMwRviHplUk6pwzzbOjT%2BMFEqNyQKEySfsOg0V76JJLXR3Z6uu8vjMaiWwCj73D%2BmF55%2BlHfUyfYVG4cGEv1edKHFhTIT5n1jK2GFb%2BZqNLOjOHMnU8PtZ1BTLxon7KtMMBMGDvK1pgrOlnG6ieW1ElvH%2Bmc81PaB17ythLUzwNcgenJl%2FJaXPNxugiG%2FjI6t9uGrlAcJCjGhi6HxngRcqFqWQsup0soHq2EMIPygNRihQ8QdJygf%2BvI7BlTCePZkByMiH%2BfX3CD5qdadcltN09TBTuneYVLtkHYwyvbIxwY6pgFcHTzFYJyoyWYOWSQXRQDkfScGgLl%2BRWvvGdbt4g3d%2B8vRZwKDfjDuH616B5m3hpEiP317gsDqB2MzyVEMbfVKad70WHbAwFujeH%2BpZC7zPUyO%2F4pLSZ2dLfX4OjYr5MJ8Z3b%2FQNYCYPKk0AiP%2FwhYcv1jxLx5AKgjkZZt0%2FACG1DYysP8IoLZyrcKGXKjTUsIvd1KgJ%2BqfZT0szypchwd09IiPVuu&X-Amz-Signature=83ab1566f210b5fc6a4d95d400a0ef30dfd78736adaac416320f6337dfe8e4ef&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466UEY34ZOW%2F20251017%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251017T181351Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEP3%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIBe4Ft8EFt3D8QpBKxaR8q%2Fj9p91H%2Fuu2sk84c3zhgc5AiB%2F9rjHO%2F%2BY21M0InGQ1VEvOEtJICSjOnPnjOvzTHAPFSqIBAim%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMeHNwXz3tGr1EQsK3KtwDtl4xHAvbVzcgGV%2BQhuyA8nGaD30BNz6JHcajp58xaoQnokbAVn1YiX4VLWg3dJmLSwuWounkZVOH2vPTaFJ%2Byq3AU%2FL36daBvgQWE6cYwKcP8iuQ55KZDhowWqQHXDZEn2Qli6LRTtvgMGi0RJhTBEKEHEN7VneiorLh53HmsT0o%2FJSx4O5TJqmbrMqV9Xr3Cuf%2FYvJKKbvCIfabDTtrlh4vxCsXBOpeY0nUF5muWo%2BCHARW9rkvSHR%2B1AaYAnOHY2kYCyt%2BuWXlYTcGOsj3ZmAGNFOt2qk%2FhPIHJ2JPzOOfoxawJpXKdPX5fOsdjwAzFmt5o9GxRmlsLJ5pCJpEQPRfMwRviHplUk6pwzzbOjT%2BMFEqNyQKEySfsOg0V76JJLXR3Z6uu8vjMaiWwCj73D%2BmF55%2BlHfUyfYVG4cGEv1edKHFhTIT5n1jK2GFb%2BZqNLOjOHMnU8PtZ1BTLxon7KtMMBMGDvK1pgrOlnG6ieW1ElvH%2Bmc81PaB17ythLUzwNcgenJl%2FJaXPNxugiG%2FjI6t9uGrlAcJCjGhi6HxngRcqFqWQsup0soHq2EMIPygNRihQ8QdJygf%2BvI7BlTCePZkByMiH%2BfX3CD5qdadcltN09TBTuneYVLtkHYwyvbIxwY6pgFcHTzFYJyoyWYOWSQXRQDkfScGgLl%2BRWvvGdbt4g3d%2B8vRZwKDfjDuH616B5m3hpEiP317gsDqB2MzyVEMbfVKad70WHbAwFujeH%2BpZC7zPUyO%2F4pLSZ2dLfX4OjYr5MJ8Z3b%2FQNYCYPKk0AiP%2FwhYcv1jxLx5AKgjkZZt0%2FACG1DYysP8IoLZyrcKGXKjTUsIvd1KgJ%2BqfZT0szypchwd09IiPVuu&X-Amz-Signature=55225b5bfc6e03f45130e73475c10649b241e42ba5719c8181e05ec18ddc1164&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

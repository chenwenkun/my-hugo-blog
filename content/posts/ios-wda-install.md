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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466RMZFCO6K%2F20260327%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260327T184211Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEBkaCXVzLXdlc3QtMiJHMEUCIGuzcJZA9%2B12BVwI%2BXXQWbwjdSC1vKilDKnCNb%2BdKb6sAiEAmU5k7ux2S9hZU54thjpD3Ew6O08COd8dxTg2L3E3SewqiAQI4f%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDFQCUL524ZHGpc3gEyrcA5%2BKuu59BBzuxKM94z5zrMTJGj2uZNYf7i9eEFD9Gu8x6qCiyleLUX3rdj4xZ1seD9wisxwwZu5dM507dlcEvQoq4T17%2FT%2FgR8CsElEQ1PupXrWUF4hhUSTK4BwS7JWHbuObcXipWH7qwkL8KvTYaFhpmyrMFg%2FY%2FvHtQogGo6EEzo0TkmQsovNHGOE%2FeXn8CvlgzOsXZ67wUQgtYwvyga81cGY5QhcDgG2ah7kVpVSUMr5wtz2RBZ2bH16RMpjI4PXhI189yLju22ns6O63nhznTsfkwSqgWAhANnM5NuvYWVEvK5pgPmzmIixXHjcmVbLTJ7j6PcleEv2rqCm4YEOpzHFDFv9vki1REawBWUHXECLdyq9kIQFBswWgExE1iHa916iB8COzzamOSAkM90s4%2BY6San0p9%2Fce7XkZmM4MbtQEwTitMKScF1TSCr%2FCGOYvwSG5zMes8SlrZBA1uxzbXMn0l7Pt92kadMoQA7Khn%2Bk2ZiIidfnrQx2%2BIQ%2F%2FeFMCoTH1vp46A9VvMT71Jg0ygvYxgs6%2B5FLiwzGkj8UDYJveXGnFQg4lNWUzUNG5KIMeJn5L%2F5UjY1rWfi%2BTmx8GTsKbrZAbU3maf50RpAkE%2BHbaNVAWFosjtyibMI3ems4GOqUBnS6Ciuo4kn7Jnp5O45uK17BKzRigXJ3qwKt%2FK7u7mjSAWP9gMKJ3XXdQkk4OuDQ0zbOqUKEyqMg3YdVQCyCrs92l4aBRwH4VV56oa6a4CezUpPWNuM6HNnMDdPPIRqVGvbnEN4A1XsMjoczYCGkKBcyttG6y7m6K%2BUaehYvsb1G7ymWfPGpD456xhvIBgnuMq8l2Wnofx9gLuXB5pOYLwUfKhfzK&X-Amz-Signature=1900f96c495189482e6b23ca00f5e5e5a5360b5bff612728882ad11ee102d011&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466RMZFCO6K%2F20260327%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260327T184211Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEBkaCXVzLXdlc3QtMiJHMEUCIGuzcJZA9%2B12BVwI%2BXXQWbwjdSC1vKilDKnCNb%2BdKb6sAiEAmU5k7ux2S9hZU54thjpD3Ew6O08COd8dxTg2L3E3SewqiAQI4f%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDFQCUL524ZHGpc3gEyrcA5%2BKuu59BBzuxKM94z5zrMTJGj2uZNYf7i9eEFD9Gu8x6qCiyleLUX3rdj4xZ1seD9wisxwwZu5dM507dlcEvQoq4T17%2FT%2FgR8CsElEQ1PupXrWUF4hhUSTK4BwS7JWHbuObcXipWH7qwkL8KvTYaFhpmyrMFg%2FY%2FvHtQogGo6EEzo0TkmQsovNHGOE%2FeXn8CvlgzOsXZ67wUQgtYwvyga81cGY5QhcDgG2ah7kVpVSUMr5wtz2RBZ2bH16RMpjI4PXhI189yLju22ns6O63nhznTsfkwSqgWAhANnM5NuvYWVEvK5pgPmzmIixXHjcmVbLTJ7j6PcleEv2rqCm4YEOpzHFDFv9vki1REawBWUHXECLdyq9kIQFBswWgExE1iHa916iB8COzzamOSAkM90s4%2BY6San0p9%2Fce7XkZmM4MbtQEwTitMKScF1TSCr%2FCGOYvwSG5zMes8SlrZBA1uxzbXMn0l7Pt92kadMoQA7Khn%2Bk2ZiIidfnrQx2%2BIQ%2F%2FeFMCoTH1vp46A9VvMT71Jg0ygvYxgs6%2B5FLiwzGkj8UDYJveXGnFQg4lNWUzUNG5KIMeJn5L%2F5UjY1rWfi%2BTmx8GTsKbrZAbU3maf50RpAkE%2BHbaNVAWFosjtyibMI3ems4GOqUBnS6Ciuo4kn7Jnp5O45uK17BKzRigXJ3qwKt%2FK7u7mjSAWP9gMKJ3XXdQkk4OuDQ0zbOqUKEyqMg3YdVQCyCrs92l4aBRwH4VV56oa6a4CezUpPWNuM6HNnMDdPPIRqVGvbnEN4A1XsMjoczYCGkKBcyttG6y7m6K%2BUaehYvsb1G7ymWfPGpD456xhvIBgnuMq8l2Wnofx9gLuXB5pOYLwUfKhfzK&X-Amz-Signature=99cae0dca4c4d1e1f039af302047b3a1b76f2a432f9907e13c80656aac02e949&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

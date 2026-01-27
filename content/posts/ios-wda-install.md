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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466UPAXPRMX%2F20260127%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260127T062122Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEIb%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIHf2DkMdRak3PSTvUijlNA51hQr%2F6f8tQpeTp5ZWhLSbAiAInAvHk0kBolk6ywUn35pNdk3UaVMucwxkRF2BqY5RCyr%2FAwhPEAAaDDYzNzQyMzE4MzgwNSIMVVJRZifyD2JhTy7CKtwDpr%2Bq%2FdbFprhlBdn6RSFTR1O5BYuN0CushERbg2joi5s%2Bcwnf9PCUYcEIGo%2Fl9NOk2VJ3CilA9sKGIXXUvG9dHz42Ftdd2YVkrA13Ey6IIf2Z4rvqEgdM1%2F2Otddjn5aAMAu0tozeHhcejVeEev4t95mw9Xh79IkE0TpWHGfSZASrTZjC7eqHzYnoPeknnK89Wd24PpiOwRs8FNA%2BKVnUMtqi2fTq%2FC%2F7VcyOzHNbX1ZQfhpF1skeg22xmaFOh2ccNx9ILHSebzwWO3e4I0%2BiLaOfJS0JDNhLKZsDiGSaxKOzXnFdWB%2FYEAlpJ5XopYAN8qKSNhoUcoaJsqda4HopBVFLu951Ur81KvrOJSiPliZbdsM5j2OpmTmJAZ7gUanNK11ZMAVsHoC9nlYKn74p4l9zRrxT1oNAeqT7soPyJhkHQjYiCpxoQVsWmWZF2APNlRgz4UvbxnfPS7rmoatpNySs5wA25JVH9k4tQFllhOP0HL%2FpVlYf3DtzqNUd6uoMaSiuvH7SxPtRZBEjP7l7snKQfE9c2nbMWup2SAPRR8PQplW9hhq1EPS0AP4FIiA7LNz%2FOXtg8CAnhSCntFVutmrXol5Wyv5RbP98P7MsM13XsbA4uyNyzzkUsb4wpJvhywY6pgGsROuvXplBjq%2FjTPgEh6Ozskx5oFQrPtoL5%2BEefz6BLbNJlc9YGJhgtPAuqO1C7L8cRKGkXelXHnlkXRMLvEWlCi52SaC8ZScfwWg8bk%2BbOHuk3keyVW90gPmJSvDl0gJKHf2WMw2IelK2kOVk8twBrezVJwMQyYmpUISGSF0ZSALqRFy6U3VsVyjCnw02HbrBgcKkYkEt%2BHpKgxNj06dQKZe94KQh&X-Amz-Signature=b4feef1f025bba5ffeebaceea2ccbadddb28533f9ee68df97a35a4f97ab23699&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466UPAXPRMX%2F20260127%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260127T062122Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEIb%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIHf2DkMdRak3PSTvUijlNA51hQr%2F6f8tQpeTp5ZWhLSbAiAInAvHk0kBolk6ywUn35pNdk3UaVMucwxkRF2BqY5RCyr%2FAwhPEAAaDDYzNzQyMzE4MzgwNSIMVVJRZifyD2JhTy7CKtwDpr%2Bq%2FdbFprhlBdn6RSFTR1O5BYuN0CushERbg2joi5s%2Bcwnf9PCUYcEIGo%2Fl9NOk2VJ3CilA9sKGIXXUvG9dHz42Ftdd2YVkrA13Ey6IIf2Z4rvqEgdM1%2F2Otddjn5aAMAu0tozeHhcejVeEev4t95mw9Xh79IkE0TpWHGfSZASrTZjC7eqHzYnoPeknnK89Wd24PpiOwRs8FNA%2BKVnUMtqi2fTq%2FC%2F7VcyOzHNbX1ZQfhpF1skeg22xmaFOh2ccNx9ILHSebzwWO3e4I0%2BiLaOfJS0JDNhLKZsDiGSaxKOzXnFdWB%2FYEAlpJ5XopYAN8qKSNhoUcoaJsqda4HopBVFLu951Ur81KvrOJSiPliZbdsM5j2OpmTmJAZ7gUanNK11ZMAVsHoC9nlYKn74p4l9zRrxT1oNAeqT7soPyJhkHQjYiCpxoQVsWmWZF2APNlRgz4UvbxnfPS7rmoatpNySs5wA25JVH9k4tQFllhOP0HL%2FpVlYf3DtzqNUd6uoMaSiuvH7SxPtRZBEjP7l7snKQfE9c2nbMWup2SAPRR8PQplW9hhq1EPS0AP4FIiA7LNz%2FOXtg8CAnhSCntFVutmrXol5Wyv5RbP98P7MsM13XsbA4uyNyzzkUsb4wpJvhywY6pgGsROuvXplBjq%2FjTPgEh6Ozskx5oFQrPtoL5%2BEefz6BLbNJlc9YGJhgtPAuqO1C7L8cRKGkXelXHnlkXRMLvEWlCi52SaC8ZScfwWg8bk%2BbOHuk3keyVW90gPmJSvDl0gJKHf2WMw2IelK2kOVk8twBrezVJwMQyYmpUISGSF0ZSALqRFy6U3VsVyjCnw02HbrBgcKkYkEt%2BHpKgxNj06dQKZe94KQh&X-Amz-Signature=013cef5b10fbf6dc790974a329b7e925ffce7ae3af3432b8ef3703091b0f033f&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663FZQJVGD%2F20251102%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251102T121819Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEHwaCXVzLXdlc3QtMiJIMEYCIQCbc2X5%2F0ilguJTYO4s%2FlfU1caA2HDlLrUWxAn%2B1vQQ9gIhAMzMa7KF%2Frjjujoz2F1Fw3HFkFsy5sKkT%2FrIGBHiKiCsKv8DCEUQABoMNjM3NDIzMTgzODA1Igzdho7TFGBVfXePs8Aq3AN%2BMMGIVwRHOpLK4yI39UQF9rmGBY6LzNVBv6vsyy7uYYU59jLvatC66vRFUAhf5rohUD7hGvgo9YLBqlMQa1SzGjfjNvEZS5V6sPzhvegpUAQ1eUJmCG26w9Hx6Q%2FrePhh6hFc%2F6yimD6fwoM2IOhuDpfHIulr49AYsbFaiBA3Iy%2BDt96Qio%2BsOKqzzASRElw9SEmPcvOGc4FY2dCHuWbu%2B77JfMiD3O9QSpTtbkALNlVtLSoz2QrPPEcyr6i7FqTJyy2RZ2vTf6dnQJsRIBIMrtZq0RqYtdrzzS%2B7hBPU8JhwhbMb1xv2w8oohDJB9CH8NqCosTGUBOKgeONB1QakoM%2FQ85BqnrhmrEJ2fEaV37HNgTOQ3n8WylsPDCDpBoQau%2Br8Rb2K3JY1KB95H5t4dj2lzRQgAbR1iWPWQOPlL0AN2LS5PHMKBZybkiIQJxYEJ5iyjRiP36SHXa%2B771DdMOZBtbhpRikRpVEsxMho1Bm0zhF%2BB0PbFri%2FerWpCuv2XLdA6JiyFWtvz5cxjX4x3I3b1wemSx9JSgiMim8jfiMO%2BY3yr92mkj9AbyOhYbzszvq8OAJOfvM7dus4k2SXE94r%2B4wAIsUwa6173urf2ISNN7wgj2gKrclQxDD2i53IBjqkAXNHacQiTR706jlAMOgGNWAXJXBe3wKCX8tJS8njyQTTZ4Bk0JCElO%2BIxAq4%2FqdFY4EdfdVK0ifOEeFCJ6nIBGXwnBs%2Ff1U8mRoGHRVZAPXcqgPlq2%2BHUvYvCBB7GZaN3PUCX00yBTZkmpxheMutSIdwuJ3EpXLyIjgv%2BXj9v8Z%2Bva14D5nWwzYb81OqHI0iR%2BNBVDBs%2Fv5nbjpTxdt%2BYGXt7aBf&X-Amz-Signature=0ad65dce619f95bf304cea4e6d72b7511d2068146e9dc5b32cc261d6a7333a58&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663FZQJVGD%2F20251102%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251102T121819Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEHwaCXVzLXdlc3QtMiJIMEYCIQCbc2X5%2F0ilguJTYO4s%2FlfU1caA2HDlLrUWxAn%2B1vQQ9gIhAMzMa7KF%2Frjjujoz2F1Fw3HFkFsy5sKkT%2FrIGBHiKiCsKv8DCEUQABoMNjM3NDIzMTgzODA1Igzdho7TFGBVfXePs8Aq3AN%2BMMGIVwRHOpLK4yI39UQF9rmGBY6LzNVBv6vsyy7uYYU59jLvatC66vRFUAhf5rohUD7hGvgo9YLBqlMQa1SzGjfjNvEZS5V6sPzhvegpUAQ1eUJmCG26w9Hx6Q%2FrePhh6hFc%2F6yimD6fwoM2IOhuDpfHIulr49AYsbFaiBA3Iy%2BDt96Qio%2BsOKqzzASRElw9SEmPcvOGc4FY2dCHuWbu%2B77JfMiD3O9QSpTtbkALNlVtLSoz2QrPPEcyr6i7FqTJyy2RZ2vTf6dnQJsRIBIMrtZq0RqYtdrzzS%2B7hBPU8JhwhbMb1xv2w8oohDJB9CH8NqCosTGUBOKgeONB1QakoM%2FQ85BqnrhmrEJ2fEaV37HNgTOQ3n8WylsPDCDpBoQau%2Br8Rb2K3JY1KB95H5t4dj2lzRQgAbR1iWPWQOPlL0AN2LS5PHMKBZybkiIQJxYEJ5iyjRiP36SHXa%2B771DdMOZBtbhpRikRpVEsxMho1Bm0zhF%2BB0PbFri%2FerWpCuv2XLdA6JiyFWtvz5cxjX4x3I3b1wemSx9JSgiMim8jfiMO%2BY3yr92mkj9AbyOhYbzszvq8OAJOfvM7dus4k2SXE94r%2B4wAIsUwa6173urf2ISNN7wgj2gKrclQxDD2i53IBjqkAXNHacQiTR706jlAMOgGNWAXJXBe3wKCX8tJS8njyQTTZ4Bk0JCElO%2BIxAq4%2FqdFY4EdfdVK0ifOEeFCJ6nIBGXwnBs%2Ff1U8mRoGHRVZAPXcqgPlq2%2BHUvYvCBB7GZaN3PUCX00yBTZkmpxheMutSIdwuJ3EpXLyIjgv%2BXj9v8Z%2Bva14D5nWwzYb81OqHI0iR%2BNBVDBs%2Fv5nbjpTxdt%2BYGXt7aBf&X-Amz-Signature=cdda152a7b1613fd1a3f414d64841556cc3af9c6aed3802567f105d29d5950fc&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

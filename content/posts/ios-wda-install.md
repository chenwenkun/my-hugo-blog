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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466TAOGOW6F%2F20251202%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251202T005501Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEEAaCXVzLXdlc3QtMiJGMEQCIHlcG5hADgT8t%2Fd880wCzPr7VkxN%2FvxSwmKN%2BD8dz9PHAiB3hgs8p3MDJeTXCCFFEL6xxXb%2FOSNOfE4PTsfwACy8Kir%2FAwgJEAAaDDYzNzQyMzE4MzgwNSIMKxRbaHwgJ5cpfCbTKtwD9NO6PVC3n27dHketw08Hh81PnVxrfy942Dbd1Jd4djPCGcwUbLEb3MtsSGLybsRf6w6Wzn9GrMO6k9uQFcTpmNjpkCHq47n52AJIh2r3BcQAlyCS0O49CD8txh%2FBKAZVgECvNi6Okp9%2FKhSr2f4xBVe8oT3GrIml4hGpYIITqQN3ruqhzVqwhXhvBsN3%2FvLnn%2Bx2Be8De4etUFS1ZGdASC%2Bs26O8OTQAO3nJ%2B7COltUEYC2GA%2BgOtmDXIbzIX5mNM%2Foi8j8iyVPHBVRmMN%2BXUz45D3IrtNAa8S2KjOocCv2Z13Yb2SjpqVumHTpic1MaLRKpv0IJCBBkPl8fFp4ULp7faZgvjsf6B7cMHhvsc%2Bekwh59GOiT6H8OKrtyA8xXjZ%2F8KvAFPF76o39c7nK6Ztn2pgSTw4gxtpL1o31pLvYcc%2FPZNieMceXrXsLf9B%2BEBUGyaPapgzwYduNtZBDpVJ4MATgO6EoUQG8my1uzwaez9v2q73wu%2FOKd2ChAhuXMEnrpZb4CBIhY6fk247xpa6HyEy6PkHWdH4agfWtBJpeRFHL8h2JBfMQ%2F40El8rWrkdE6qTQoGhQkJlQoP3uR9uJSktsw9KNxmtzj0y0CfsaYHLWZh8kLKbnp0fIw9d24yQY6pgEnVWU3hMyMiG0msA4YLx%2F8iE81IHtfh%2BjUGtl1MOyKn6249xd9qY9BhGWwF8VCP4M3BKE4yc3eqw7L1v4MWNTZtiBXL4Xn6W43bxIEIV7jlkM9WP88mhxZ%2BELzgjz3aYk2xgtpzB1x3tWFOUjOLKip5B2XBY%2BiC8fWoTl%2F34NhnSGrebmVhepMTn%2BuiXQyrQ6ykeDyfS%2Ftm8acQUX4lbNBPFOuzM%2Fq&X-Amz-Signature=67ec7f754738e7a3aea91e03921aac460a88f4067b2cc95c89289f06745c6e5b&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466TAOGOW6F%2F20251202%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251202T005501Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEEAaCXVzLXdlc3QtMiJGMEQCIHlcG5hADgT8t%2Fd880wCzPr7VkxN%2FvxSwmKN%2BD8dz9PHAiB3hgs8p3MDJeTXCCFFEL6xxXb%2FOSNOfE4PTsfwACy8Kir%2FAwgJEAAaDDYzNzQyMzE4MzgwNSIMKxRbaHwgJ5cpfCbTKtwD9NO6PVC3n27dHketw08Hh81PnVxrfy942Dbd1Jd4djPCGcwUbLEb3MtsSGLybsRf6w6Wzn9GrMO6k9uQFcTpmNjpkCHq47n52AJIh2r3BcQAlyCS0O49CD8txh%2FBKAZVgECvNi6Okp9%2FKhSr2f4xBVe8oT3GrIml4hGpYIITqQN3ruqhzVqwhXhvBsN3%2FvLnn%2Bx2Be8De4etUFS1ZGdASC%2Bs26O8OTQAO3nJ%2B7COltUEYC2GA%2BgOtmDXIbzIX5mNM%2Foi8j8iyVPHBVRmMN%2BXUz45D3IrtNAa8S2KjOocCv2Z13Yb2SjpqVumHTpic1MaLRKpv0IJCBBkPl8fFp4ULp7faZgvjsf6B7cMHhvsc%2Bekwh59GOiT6H8OKrtyA8xXjZ%2F8KvAFPF76o39c7nK6Ztn2pgSTw4gxtpL1o31pLvYcc%2FPZNieMceXrXsLf9B%2BEBUGyaPapgzwYduNtZBDpVJ4MATgO6EoUQG8my1uzwaez9v2q73wu%2FOKd2ChAhuXMEnrpZb4CBIhY6fk247xpa6HyEy6PkHWdH4agfWtBJpeRFHL8h2JBfMQ%2F40El8rWrkdE6qTQoGhQkJlQoP3uR9uJSktsw9KNxmtzj0y0CfsaYHLWZh8kLKbnp0fIw9d24yQY6pgEnVWU3hMyMiG0msA4YLx%2F8iE81IHtfh%2BjUGtl1MOyKn6249xd9qY9BhGWwF8VCP4M3BKE4yc3eqw7L1v4MWNTZtiBXL4Xn6W43bxIEIV7jlkM9WP88mhxZ%2BELzgjz3aYk2xgtpzB1x3tWFOUjOLKip5B2XBY%2BiC8fWoTl%2F34NhnSGrebmVhepMTn%2BuiXQyrQ6ykeDyfS%2Ftm8acQUX4lbNBPFOuzM%2Fq&X-Amz-Signature=d97fecbcc152add1d5373c8e9cda3a302fd9552922b181adaa3ca834fd21969d&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663YC3JK54%2F20260422%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260422T012504Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEHQaCXVzLXdlc3QtMiJHMEUCIQDY02Q%2Bi0WKiCvJecE3WIgjmlZl%2B8DDrvi3NIBr4hSKCQIgS%2FXY3Zno%2F92rIKHjouQFUnQ84Fno0xVSpYMW63kgKaYq%2FwMIPRAAGgw2Mzc0MjMxODM4MDUiDBSwIS72o7hlfcKU7CrcA9Rd82OjXiSDIMiuwYYjuyYDF6kvRU1GQ8Vs5sCytSJWhNtaZC5iZNW%2FlnbGHoDtwuOlFqWydHRoLE80d%2Bg66rlUIGZsio9M4sIaQHtIiAez9aBscRguC%2F6Wl4npLeCs%2B8V%2BTrLDJmfsiCZw1cDqeKuAdYM1nP1Yap7ivCoSQLB8t9QV7PaRlcisyaDeNVDn4V0OeT13WF49Oo9STDbNfJ%2BSC3oJDBaSl1iNeT5R8L7Rn2gCbXd7Y2HGlD1NWRRyQc9ySfkoA4i4XjJGwBm6qcolWZ%2B%2FVmbQc384tX0HjOm6hmEL5U5zGRdb2YSDtsD9X21rIGFApNwk9lXwfU06m4vMHrYwLTCIpEBSrrcwQupC7edtV41b8BrGDIYzj2OJcsHsZHzQ9vTSzoYbeNcqwrGCyfJ7rDgTf9pkRLRIlNtJZvbjjuIGCnTzN4KfkRGH%2BL6Ar%2FZoRBjcJWWKiKKtGZbX1Kxt3x8hLPAPZy47u5V2qgnvAn2MMBqwAmCQwzmO6v2YVpKs5PQGeA8eR9syBTeXEFtv4N%2FTkjVIJ0Y8Vof%2FeD7VFCo2mKWgn%2BJ5sHZrFok3ftGmeZ63%2FJRA9yd%2FKnpYbONNuyHYwBIZMh3Ctpk%2FsfYKy1FdvyjwNgLsMNGrn88GOqUBBIpELzQMNSJ7ja52fuGxfBLHLopVBABe8LDwYoPlYL1KV2UBMIVWF01hj5iYYFEmGeWx0WOC5b3%2FowsSI4Pkaw%2FEhlMiLgntto5S6mBEZ5vagc2clE7TJDPg%2BEeHzvtIsEg6iEAodLU52qFyqQrXOECD1mikT4uE2rdtjNtWOcHOKW%2FEOrEmlrZuYUPT%2FITFww0HexlCzrd7IjujAXcLJKW9ODwL&X-Amz-Signature=b18cc95ef418b71e049d61199e1bdfd48201443c17fae26478ac9b337fdf5a3e&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663YC3JK54%2F20260422%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260422T012504Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEHQaCXVzLXdlc3QtMiJHMEUCIQDY02Q%2Bi0WKiCvJecE3WIgjmlZl%2B8DDrvi3NIBr4hSKCQIgS%2FXY3Zno%2F92rIKHjouQFUnQ84Fno0xVSpYMW63kgKaYq%2FwMIPRAAGgw2Mzc0MjMxODM4MDUiDBSwIS72o7hlfcKU7CrcA9Rd82OjXiSDIMiuwYYjuyYDF6kvRU1GQ8Vs5sCytSJWhNtaZC5iZNW%2FlnbGHoDtwuOlFqWydHRoLE80d%2Bg66rlUIGZsio9M4sIaQHtIiAez9aBscRguC%2F6Wl4npLeCs%2B8V%2BTrLDJmfsiCZw1cDqeKuAdYM1nP1Yap7ivCoSQLB8t9QV7PaRlcisyaDeNVDn4V0OeT13WF49Oo9STDbNfJ%2BSC3oJDBaSl1iNeT5R8L7Rn2gCbXd7Y2HGlD1NWRRyQc9ySfkoA4i4XjJGwBm6qcolWZ%2B%2FVmbQc384tX0HjOm6hmEL5U5zGRdb2YSDtsD9X21rIGFApNwk9lXwfU06m4vMHrYwLTCIpEBSrrcwQupC7edtV41b8BrGDIYzj2OJcsHsZHzQ9vTSzoYbeNcqwrGCyfJ7rDgTf9pkRLRIlNtJZvbjjuIGCnTzN4KfkRGH%2BL6Ar%2FZoRBjcJWWKiKKtGZbX1Kxt3x8hLPAPZy47u5V2qgnvAn2MMBqwAmCQwzmO6v2YVpKs5PQGeA8eR9syBTeXEFtv4N%2FTkjVIJ0Y8Vof%2FeD7VFCo2mKWgn%2BJ5sHZrFok3ftGmeZ63%2FJRA9yd%2FKnpYbONNuyHYwBIZMh3Ctpk%2FsfYKy1FdvyjwNgLsMNGrn88GOqUBBIpELzQMNSJ7ja52fuGxfBLHLopVBABe8LDwYoPlYL1KV2UBMIVWF01hj5iYYFEmGeWx0WOC5b3%2FowsSI4Pkaw%2FEhlMiLgntto5S6mBEZ5vagc2clE7TJDPg%2BEeHzvtIsEg6iEAodLU52qFyqQrXOECD1mikT4uE2rdtjNtWOcHOKW%2FEOrEmlrZuYUPT%2FITFww0HexlCzrd7IjujAXcLJKW9ODwL&X-Amz-Signature=f59e5fd05eb582dd8e5cd71c87523af35b4fb92eac7c60adc63b5e89f1af4679&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466XHNGKKFY%2F20260427%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260427T014745Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEPD%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIHY%2BUEBeNBksq4sgQNwqF%2FySClMtHCy8r52DD%2Fg%2Bmw4eAiBybceIASWIYV81%2FVIv0e4UDvVu48XswYn5GSh0xYiERCqIBAi5%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMnLs0UT3lCaMrTLIpKtwDO8geLB7dfUNDzvzfFEU7bWT1V2GQl1dbtFhiX%2F4rEZr7g3%2F9BuTtfRbQhr%2FF2D0eYsHI9bsXdKtL5epKBXWKMSU2ffmZnViMKR%2B%2B6Yq5X%2FkTCZqydgtLn7U7dv%2FYCZAPi%2FgIjbHVwT8rxMM71JGUvO1jfaiKKJC1HRAU2GrSdmckejSYWD%2FHggZ%2BP6E7kNlmJgjvrNqY7lUSx5HZNGmXqYGEVjOWeOC0pfoZAWEkpuG7fRSIw8oPySIwDGSAAZSsa8djdUm6GnOR5eabvCnjYj1nAQ3QqceqLHDxbnT%2FH41h9mKN93LcY5IjcScd0y65QuXJBQ%2FtRhrQ1Gwu443S6DuBFOdbIO9aHJr00kZQw1wH7OhOO8VZGUDxN3qal33PXMWW1pYT3ded0ZBrDicC1FOFMSC%2BP6j2ON2MkZrQTJAfQ1UFPG3F7NBhhzEIbUyMJZhmA0%2F4WwrOeXYXezIjgYC1kHojlh2sddVceNrDhaJCGaGvSlOUi2EXIO0bcBoKf9on1j4RAXRWvfjQBrher6t%2F%2FnMCv77Hh2RRjb9gtiENpIjPC%2FILDaaOe3rrZWoueYPiVWPkZOS7rKSZW7gJGmBN%2B3UAWxSAePN5vuN4Hjw4U62YATM%2BFeiqN7Ywk9K6zwY6pgFKk2wruO43LG1koUXjgzu%2F05aoPuCijbavDyWT1gRU2xfLvU%2B734KJNy48bkMYBLzQs7cBBYYUKIZhXBcR1sB0K9IDpcqYrmnzMun2474yiSNa82lQhsq30feqm%2Bk7Rjyu2JB2WfQp2xLoL4c11kecLeN15KWFqFAMeCWbvlkW3l4oqtl9llNB%2FSQrubL0ySj5cffVkraZWC%2BO2c3fsQIn2qr6D4yc&X-Amz-Signature=a044b6b6868ed41591f18468de3b30fd4afdc719fdcc933a94e2a13f021c7302&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466XHNGKKFY%2F20260427%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260427T014745Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEPD%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIHY%2BUEBeNBksq4sgQNwqF%2FySClMtHCy8r52DD%2Fg%2Bmw4eAiBybceIASWIYV81%2FVIv0e4UDvVu48XswYn5GSh0xYiERCqIBAi5%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMnLs0UT3lCaMrTLIpKtwDO8geLB7dfUNDzvzfFEU7bWT1V2GQl1dbtFhiX%2F4rEZr7g3%2F9BuTtfRbQhr%2FF2D0eYsHI9bsXdKtL5epKBXWKMSU2ffmZnViMKR%2B%2B6Yq5X%2FkTCZqydgtLn7U7dv%2FYCZAPi%2FgIjbHVwT8rxMM71JGUvO1jfaiKKJC1HRAU2GrSdmckejSYWD%2FHggZ%2BP6E7kNlmJgjvrNqY7lUSx5HZNGmXqYGEVjOWeOC0pfoZAWEkpuG7fRSIw8oPySIwDGSAAZSsa8djdUm6GnOR5eabvCnjYj1nAQ3QqceqLHDxbnT%2FH41h9mKN93LcY5IjcScd0y65QuXJBQ%2FtRhrQ1Gwu443S6DuBFOdbIO9aHJr00kZQw1wH7OhOO8VZGUDxN3qal33PXMWW1pYT3ded0ZBrDicC1FOFMSC%2BP6j2ON2MkZrQTJAfQ1UFPG3F7NBhhzEIbUyMJZhmA0%2F4WwrOeXYXezIjgYC1kHojlh2sddVceNrDhaJCGaGvSlOUi2EXIO0bcBoKf9on1j4RAXRWvfjQBrher6t%2F%2FnMCv77Hh2RRjb9gtiENpIjPC%2FILDaaOe3rrZWoueYPiVWPkZOS7rKSZW7gJGmBN%2B3UAWxSAePN5vuN4Hjw4U62YATM%2BFeiqN7Ywk9K6zwY6pgFKk2wruO43LG1koUXjgzu%2F05aoPuCijbavDyWT1gRU2xfLvU%2B734KJNy48bkMYBLzQs7cBBYYUKIZhXBcR1sB0K9IDpcqYrmnzMun2474yiSNa82lQhsq30feqm%2Bk7Rjyu2JB2WfQp2xLoL4c11kecLeN15KWFqFAMeCWbvlkW3l4oqtl9llNB%2FSQrubL0ySj5cffVkraZWC%2BO2c3fsQIn2qr6D4yc&X-Amz-Signature=fedb2beb8af688c02a1ca96cbe2f8868a516e0a81d4b763916d91aaf3d8352ab&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

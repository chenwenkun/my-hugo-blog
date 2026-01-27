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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466Q5TMSX7T%2F20260127%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260127T182354Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJH%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCICW8uRYUpjUbbRU8cqtmYzqvMy86uKFkWSChE7%2Fhb552AiAe4e3LL6hMj25f7OOk126k6HyO7j6ryG7LkP%2FwOj4MpCr%2FAwhaEAAaDDYzNzQyMzE4MzgwNSIMlYhJdUzPC7ZyQ7dLKtwDsyVF4j9T8uAlayZ5iaV9WxkPtZTGITTZs1X5N8pL%2Bnti901hmHI480u%2FAb38JSlTrEXNpbKQ%2B7LJGADK2sRpeYspbHy8s19L2vkNbMj31cr%2Fpy4nQ5dF7lSLaif1rcIXadh81aA7gyiIC%2BfN2haqddYhzLd0sR0TfvTODkGI7EmA4x0lIe14v6uBAxXmyYtl%2F4f6a3ODFGs01MHXO%2BZZkDpgp0OuoHxngoBztVX8Z9hvWeW6%2B9ltKMd%2FEg66OBh9nGQJoIf80DLYvSKILKWruFLOrzCAK641A53hfAhGXtFl0idqcg7DfHgfrHtt%2BMkakGXsXzQeASLcIj2JNLBaRh9pou0Q3o8A8GwPL8XofTLeb%2FKuv5iEsZIC5C%2BGKJvcWPyQaEwurnfbcY9qr26%2BTY9I4EKd53zG7YUaN6iAntk2Tq5KPQe2E6b89ZuSxoeZCVOM4F5hicD9O4Cuua1LS3kp0SPIeCzQi%2BMHPAF8Ske555kDuTN%2FtPHBylUX7aVLZZe%2B347E0l29c2iT20KbNfow6eiCrhu%2FOtpC02qWBld2PSlsOXkpVxq%2FdFanIzio5vHANbVPW%2FrBL2I1TmXR%2FL4bg9ZBzY7Jm%2FB8%2FRPbvFI6faChpbeTsjjtfPcw%2FtLjywY6pgFUKbIczMyAL79VV%2BSGWtDvz6OkrSOfAGVJdIb3MWkyQ0qPAYInIPhkP5qoGRuv5nd2n8cBWu5uBnJ%2BKPP2mCVgt74p58JOmia0q%2FfsxqX2M1wswTVDtNJgJDT4%2B6xP%2B1zzvXVGkV2M6%2BEHgV52dO4Z5u60azWNZ%2BuZEfVpkxfGMEq4yJc1%2B%2FCYjHIJMMhMA12RRgXXZT8mfvD0A8Uu5HCFov4EF%2BDo&X-Amz-Signature=c3947c94e270d6260907faf2a623d1ceef5532a908b827cbab626448516d943a&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466Q5TMSX7T%2F20260127%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260127T182354Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJH%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCICW8uRYUpjUbbRU8cqtmYzqvMy86uKFkWSChE7%2Fhb552AiAe4e3LL6hMj25f7OOk126k6HyO7j6ryG7LkP%2FwOj4MpCr%2FAwhaEAAaDDYzNzQyMzE4MzgwNSIMlYhJdUzPC7ZyQ7dLKtwDsyVF4j9T8uAlayZ5iaV9WxkPtZTGITTZs1X5N8pL%2Bnti901hmHI480u%2FAb38JSlTrEXNpbKQ%2B7LJGADK2sRpeYspbHy8s19L2vkNbMj31cr%2Fpy4nQ5dF7lSLaif1rcIXadh81aA7gyiIC%2BfN2haqddYhzLd0sR0TfvTODkGI7EmA4x0lIe14v6uBAxXmyYtl%2F4f6a3ODFGs01MHXO%2BZZkDpgp0OuoHxngoBztVX8Z9hvWeW6%2B9ltKMd%2FEg66OBh9nGQJoIf80DLYvSKILKWruFLOrzCAK641A53hfAhGXtFl0idqcg7DfHgfrHtt%2BMkakGXsXzQeASLcIj2JNLBaRh9pou0Q3o8A8GwPL8XofTLeb%2FKuv5iEsZIC5C%2BGKJvcWPyQaEwurnfbcY9qr26%2BTY9I4EKd53zG7YUaN6iAntk2Tq5KPQe2E6b89ZuSxoeZCVOM4F5hicD9O4Cuua1LS3kp0SPIeCzQi%2BMHPAF8Ske555kDuTN%2FtPHBylUX7aVLZZe%2B347E0l29c2iT20KbNfow6eiCrhu%2FOtpC02qWBld2PSlsOXkpVxq%2FdFanIzio5vHANbVPW%2FrBL2I1TmXR%2FL4bg9ZBzY7Jm%2FB8%2FRPbvFI6faChpbeTsjjtfPcw%2FtLjywY6pgFUKbIczMyAL79VV%2BSGWtDvz6OkrSOfAGVJdIb3MWkyQ0qPAYInIPhkP5qoGRuv5nd2n8cBWu5uBnJ%2BKPP2mCVgt74p58JOmia0q%2FfsxqX2M1wswTVDtNJgJDT4%2B6xP%2B1zzvXVGkV2M6%2BEHgV52dO4Z5u60azWNZ%2BuZEfVpkxfGMEq4yJc1%2B%2FCYjHIJMMhMA12RRgXXZT8mfvD0A8Uu5HCFov4EF%2BDo&X-Amz-Signature=f108732a6add1a81ea9ac1dda1fea19e421d3858727069aa16e9d9b07e998a05&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

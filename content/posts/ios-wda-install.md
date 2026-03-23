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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB46646VPKCZU%2F20260323%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260323T124105Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjELT%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQC1sk92oVFtkJkIQJGPYgUdX%2Bdsqh6EskcHj7so%2BVdatAIhAOpUR6YcyQwaCBxYlMNPkOVcPT8FiwhJgrzwcAZN9%2B6LKv8DCHwQABoMNjM3NDIzMTgzODA1Igz0hAAqRiV%2BTdRoP2Qq3AMvGAsLyMMw%2BNjtljwhUMJsg5bi%2F6x%2FKcutrLY%2FJiiSP5sCqWS7Aj2x4IOaokC9VMantCVJoTV6LnwcJTRZ8Ucu%2FQQeHA0uQuMOkRhk2v0LvW1BXqf7Dn2u0yiADwcHb51pub9uMvwMWCSVrXTpvc5yda%2BYzGP4P3YSIQuM11hTLQB227sr62ibL6tD1Yo00o9GagIHpfqkAOgFNoWnEX4jWDhANDmAx4gkw3Asz8MuqaFGdM9BFQ6ZICMb8MAvzsb3sFg%2FYRWlH32WGhnxKf9nEze2G%2FlaP59HxJ7xTDJhZzWUAtLfmDWWcEmP%2FtBgLms4ejkGHoiVksqhmydAlKw44K0uKXXj3axV%2BQzrh7YQDZAVdcnZaNoJYvFOrZizVNEsecQp3JJLZktmvtsWV6Ll84MO7oRle2TUmbLbq3WwHl2QvYh%2FIRNdemqECrtIvRRo079i02Btu1POcjoz0Y9C7JHu1fFRtDRgmJrQUnYiD5DY2tCRUqbCLSELeOfxwR27uEiVJU9ZJte7OyRW2%2BVqMS2qvTdZgqy%2B57KZwt1eOsrBSs5MpbMCyXuu7I9KB63ZmslaGAGuBqBTj27%2FV%2FxVNGvePYJTCark33JgdH4YmfGZcwk8KV9uQWLHjzDdxITOBjqkAf35XigH%2F2%2B42D6yKBhWomiErCXGimzCXzu59mlDlciXqOP9sJWChsw0PQwPvaRuvDuFcbl9SCwFa9vT%2BGjc%2B9rMsfaTErXDCi%2BzUxTOtEz2VYVTYZm7Qjjvgq%2Biow35vmeShLICAVsCTJ65clz%2FYK%2B4dxYKHK9bC5n%2BvEIsF8HUJFOLsdyIHvW55bIoT1Z%2FDH9eMlF%2By5ENBXsedUuy34emjexq&X-Amz-Signature=80207ad51cea84636e5a85283e98799344e870d61bbe425c44fc634786cff225&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB46646VPKCZU%2F20260323%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260323T124105Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjELT%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQC1sk92oVFtkJkIQJGPYgUdX%2Bdsqh6EskcHj7so%2BVdatAIhAOpUR6YcyQwaCBxYlMNPkOVcPT8FiwhJgrzwcAZN9%2B6LKv8DCHwQABoMNjM3NDIzMTgzODA1Igz0hAAqRiV%2BTdRoP2Qq3AMvGAsLyMMw%2BNjtljwhUMJsg5bi%2F6x%2FKcutrLY%2FJiiSP5sCqWS7Aj2x4IOaokC9VMantCVJoTV6LnwcJTRZ8Ucu%2FQQeHA0uQuMOkRhk2v0LvW1BXqf7Dn2u0yiADwcHb51pub9uMvwMWCSVrXTpvc5yda%2BYzGP4P3YSIQuM11hTLQB227sr62ibL6tD1Yo00o9GagIHpfqkAOgFNoWnEX4jWDhANDmAx4gkw3Asz8MuqaFGdM9BFQ6ZICMb8MAvzsb3sFg%2FYRWlH32WGhnxKf9nEze2G%2FlaP59HxJ7xTDJhZzWUAtLfmDWWcEmP%2FtBgLms4ejkGHoiVksqhmydAlKw44K0uKXXj3axV%2BQzrh7YQDZAVdcnZaNoJYvFOrZizVNEsecQp3JJLZktmvtsWV6Ll84MO7oRle2TUmbLbq3WwHl2QvYh%2FIRNdemqECrtIvRRo079i02Btu1POcjoz0Y9C7JHu1fFRtDRgmJrQUnYiD5DY2tCRUqbCLSELeOfxwR27uEiVJU9ZJte7OyRW2%2BVqMS2qvTdZgqy%2B57KZwt1eOsrBSs5MpbMCyXuu7I9KB63ZmslaGAGuBqBTj27%2FV%2FxVNGvePYJTCark33JgdH4YmfGZcwk8KV9uQWLHjzDdxITOBjqkAf35XigH%2F2%2B42D6yKBhWomiErCXGimzCXzu59mlDlciXqOP9sJWChsw0PQwPvaRuvDuFcbl9SCwFa9vT%2BGjc%2B9rMsfaTErXDCi%2BzUxTOtEz2VYVTYZm7Qjjvgq%2Biow35vmeShLICAVsCTJ65clz%2FYK%2B4dxYKHK9bC5n%2BvEIsF8HUJFOLsdyIHvW55bIoT1Z%2FDH9eMlF%2By5ENBXsedUuy34emjexq&X-Amz-Signature=5a2d3143b2ac5f1e632f4d15fb14c767e6c89f43c1b0b3aab12e7624d17d9fac&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

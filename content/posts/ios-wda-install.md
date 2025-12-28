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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466TUWY5QOO%2F20251228%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251228T122111Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjELz%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCzFWkca%2FgvNyJC6mXJdlxyeUbhoR99Ug4OKj9DJN4XRwIhAIxdYa53fA6BFAySiiIAezGg60PU1o00oeZrHbekYyz0KogECIX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgxhNZSGhAixAANxj18q3APZ19CIdnUTlSsgM2T%2FJIhr7MOMqMe%2Br%2BQhcpsd%2F5xv5Kre8sv%2Fr%2FaCjwx%2F%2F5QsD4VxZWZMyUeJTDRG%2FTYQ2NIifC6R88%2Fld%2FRQU07ZoANN6FScc4o6Z5eyC1qq1xupykMpAjwOKoA2jfCpDgG0u1aWd3z9NX3HmVqXqOY6kT%2FYz5yMx25UptbBxBB9CKT5TWfSwVu%2B6e20cN7Il60u7iQvYhW5h78omTEOQzgOkSv33y2thzKLVizFacDSikDianlQRIjbglJBohu9YGChe0kKID0v%2FaDfo%2FqrQcp%2FFVPiFUBQOyNcL7fTIBmid3Gw0ovxD%2Fs8eLO2CS%2BuBM0qSIVsJaeudK2OutiqZf%2FC%2B4ewWcPzoipz2%2BN9PiqIfHgVDTYhxK7HkyCbtKQRO26Unt7aeedTmwBaceW7hGzcjwvnKtZ9ZeOTWwtdc7qcgk7IhUkqjo%2F9kymZyhedvdcxkrgJ%2Fn2lHEU%2Bsvb2SIKObaLVjfxawE4F7kg4Ylbza11JBMPz8GW1Hrf5rSPH9rLI5R0DHehS3QejAmUbglG1lmTBkMHVxWj63FzZ5p1jGl14PqFvKfU9MbGEXb1xiKZJ%2FyqQOwpoPk6ab2xblWBi2Xcb4rA3jJKLVADSmE2WODCtsMTKBjqkAZw9OiLlubRsAwaqiUSn%2FJWAwHvzb15PxfEduxcvUIdnKalOTlq8KIREe2oMkh%2Baw7BlRGuRx1L%2FWZkX8HVERkYOrPZBcj2UuVs6c9Hpmys9RyAafnYPTdPDytx6lzl%2FGEbsRqHKRb81pPVm%2BqyKSevU5b%2F1UuMhaOJOMr2eHPSWt%2FoCnne0Lg0LYdqRyQEZtTkXvRUZX0oTXD%2BCbEu6DX4saxJs&X-Amz-Signature=1745ec72e2c4e94916ecbe1fd58d7f9e31fc8c0321711ca4ddac5eae97d0365f&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466TUWY5QOO%2F20251228%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251228T122111Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjELz%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCzFWkca%2FgvNyJC6mXJdlxyeUbhoR99Ug4OKj9DJN4XRwIhAIxdYa53fA6BFAySiiIAezGg60PU1o00oeZrHbekYyz0KogECIX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgxhNZSGhAixAANxj18q3APZ19CIdnUTlSsgM2T%2FJIhr7MOMqMe%2Br%2BQhcpsd%2F5xv5Kre8sv%2Fr%2FaCjwx%2F%2F5QsD4VxZWZMyUeJTDRG%2FTYQ2NIifC6R88%2Fld%2FRQU07ZoANN6FScc4o6Z5eyC1qq1xupykMpAjwOKoA2jfCpDgG0u1aWd3z9NX3HmVqXqOY6kT%2FYz5yMx25UptbBxBB9CKT5TWfSwVu%2B6e20cN7Il60u7iQvYhW5h78omTEOQzgOkSv33y2thzKLVizFacDSikDianlQRIjbglJBohu9YGChe0kKID0v%2FaDfo%2FqrQcp%2FFVPiFUBQOyNcL7fTIBmid3Gw0ovxD%2Fs8eLO2CS%2BuBM0qSIVsJaeudK2OutiqZf%2FC%2B4ewWcPzoipz2%2BN9PiqIfHgVDTYhxK7HkyCbtKQRO26Unt7aeedTmwBaceW7hGzcjwvnKtZ9ZeOTWwtdc7qcgk7IhUkqjo%2F9kymZyhedvdcxkrgJ%2Fn2lHEU%2Bsvb2SIKObaLVjfxawE4F7kg4Ylbza11JBMPz8GW1Hrf5rSPH9rLI5R0DHehS3QejAmUbglG1lmTBkMHVxWj63FzZ5p1jGl14PqFvKfU9MbGEXb1xiKZJ%2FyqQOwpoPk6ab2xblWBi2Xcb4rA3jJKLVADSmE2WODCtsMTKBjqkAZw9OiLlubRsAwaqiUSn%2FJWAwHvzb15PxfEduxcvUIdnKalOTlq8KIREe2oMkh%2Baw7BlRGuRx1L%2FWZkX8HVERkYOrPZBcj2UuVs6c9Hpmys9RyAafnYPTdPDytx6lzl%2FGEbsRqHKRb81pPVm%2BqyKSevU5b%2F1UuMhaOJOMr2eHPSWt%2FoCnne0Lg0LYdqRyQEZtTkXvRUZX0oTXD%2BCbEu6DX4saxJs&X-Amz-Signature=b88cfbbfaebd888a77b7ff2d0730371023b2f827e49d31b0a249405bd6d2b4b9&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

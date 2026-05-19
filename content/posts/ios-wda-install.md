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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466YBVCNR5Z%2F20260519%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260519T085705Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEAkaCXVzLXdlc3QtMiJHMEUCIQC8fY9LvwO1xR2ylnTHAUcOUqVZyU1ZXkRZBgeRZIMTPQIgE7Uwy771qi9Kqx%2BI8gOUdYMLYozEr%2FN41nTSG8TsdLoqiAQI0v%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDIibWaEsGQqyWeerXSrcA4tnhdA4SdVhe3Vefh3RsE0aOlw0lwIlQIrA%2B1k0gU9mg%2B8%2F%2BdZApLs0PIKjBFBBWDKGusRI3R7YIIsY5R86BbsOEXNEpdqgVMz0jil3btjVXiuyMGdCrupc%2BuZlpobOKqfEGmSFgWDS5nmOYmR7%2B07MNioBkXWWo881Jk05klayNfrBI9m9lCyluLOhCZVh2etJAa4pRJjshzgcWPZdv0mwgvyf7%2F%2Fet4hURzYG60%2FT2usatvI2OLgST%2FIp44GmygbqrjptQ911hdtETydVCoInyAd%2BDImgchdODhSfSDMrzfSO%2BhP0317cSOrIM%2FcdjzBeGlP34XGKGMldc%2BOe06nK%2FgY5MMx8gQFIxeGKGKSNIWIB8HODWCPdVonoo1N3cPGHdmtXs7is4g25QRfAg3TMhsXEgeBpqgz0gRAKno62tT62WMR0sZIhSBd35QiiCJLF653rTfPzxwKlGHua9wITkRMlQw4hdPkDcETWCzkr75CbMNQCGIWDk6iH%2BrfcDYLeNj26KqcckLbUFIRvVRbyEm1x6CKCmA7AcTDLa3STZwYaYbGzvUMRGX3Q3L10meJzcf8zQB6s2JT%2BIBCK10el7%2B39wBEmHQWv%2FI9Jt%2BMFxYqIz12NHJXJ00U4MJnEsNAGOqUBmrK2NzRyoRV6d68y9ZZ1klHr2Wx5hUXMnq8KEILbmahFzjRxy5RAEbr8s%2BXsVl73bzPvFg5BV3BoDOPzVHbA6x1oob8tILclhrqpjpIOK8ITXUj%2Bts6No7rLDCynpZfWOLmjynnvFb%2FHrBDjso9OaDelp8zM58e9GVIypxsqz7mRZjJ4YmGf0ah5BLuFdy%2BizcCsGu%2Fga3we%2F%2FK2xgvwYPmSCBaP&X-Amz-Signature=a539d935a3907f63d0c7288a1926d482ef0c09e920393aac3fa306d4af1b72af&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466YBVCNR5Z%2F20260519%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260519T085705Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEAkaCXVzLXdlc3QtMiJHMEUCIQC8fY9LvwO1xR2ylnTHAUcOUqVZyU1ZXkRZBgeRZIMTPQIgE7Uwy771qi9Kqx%2BI8gOUdYMLYozEr%2FN41nTSG8TsdLoqiAQI0v%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDIibWaEsGQqyWeerXSrcA4tnhdA4SdVhe3Vefh3RsE0aOlw0lwIlQIrA%2B1k0gU9mg%2B8%2F%2BdZApLs0PIKjBFBBWDKGusRI3R7YIIsY5R86BbsOEXNEpdqgVMz0jil3btjVXiuyMGdCrupc%2BuZlpobOKqfEGmSFgWDS5nmOYmR7%2B07MNioBkXWWo881Jk05klayNfrBI9m9lCyluLOhCZVh2etJAa4pRJjshzgcWPZdv0mwgvyf7%2F%2Fet4hURzYG60%2FT2usatvI2OLgST%2FIp44GmygbqrjptQ911hdtETydVCoInyAd%2BDImgchdODhSfSDMrzfSO%2BhP0317cSOrIM%2FcdjzBeGlP34XGKGMldc%2BOe06nK%2FgY5MMx8gQFIxeGKGKSNIWIB8HODWCPdVonoo1N3cPGHdmtXs7is4g25QRfAg3TMhsXEgeBpqgz0gRAKno62tT62WMR0sZIhSBd35QiiCJLF653rTfPzxwKlGHua9wITkRMlQw4hdPkDcETWCzkr75CbMNQCGIWDk6iH%2BrfcDYLeNj26KqcckLbUFIRvVRbyEm1x6CKCmA7AcTDLa3STZwYaYbGzvUMRGX3Q3L10meJzcf8zQB6s2JT%2BIBCK10el7%2B39wBEmHQWv%2FI9Jt%2BMFxYqIz12NHJXJ00U4MJnEsNAGOqUBmrK2NzRyoRV6d68y9ZZ1klHr2Wx5hUXMnq8KEILbmahFzjRxy5RAEbr8s%2BXsVl73bzPvFg5BV3BoDOPzVHbA6x1oob8tILclhrqpjpIOK8ITXUj%2Bts6No7rLDCynpZfWOLmjynnvFb%2FHrBDjso9OaDelp8zM58e9GVIypxsqz7mRZjJ4YmGf0ah5BLuFdy%2BizcCsGu%2Fga3we%2F%2FK2xgvwYPmSCBaP&X-Amz-Signature=b917b9bd73431515e5331b4731336f9728ff44a13f3ebd7662fd862d7fb63aee&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

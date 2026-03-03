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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466XD36GWQN%2F20260303%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260303T183416Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjENr%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCuvKrs0cGk1reyj%2FA6p8yGRxAPFSvxt1r2QSysFoQ8XQIhAPuNRPM%2B7luKeSseBg5rPPjKo%2FdqY0hBsMG538Ma8bLPKogECKL%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1Igy6vIa8Hqw5biZEoBMq3AOXKcy8G9e3C0rEtPVqheMvSnH%2BedkBBwXFcxRH6RbhIHHBVyjBiGQOG9vnOaGOG4vU3%2BWI34Jma69UTU7lSy6ZFd2F1%2FqanujAPuCl8%2BJ2z50sEdZQaYK7qX40O2aQdCUFciqLu%2BGPiQBz2mi8VA%2BMbvl1CPlrNGb3YSDVNEoXqVY%2BEOWr0mXJL6NdQ7hC5Uswd9ZOuPlX%2ByZl8VZiLXc7zfNiT7uVhi5ELZ7fT8Z0RWmTOD%2FS4I9wD%2FvXwtRDnwffmdf1KUjANs0mcHS0MRqjoc6o3SsnpvGb%2B951HwNJJ%2BaIWXeBvTl5YaqXwI8L1uKWe5YTsVj9QMjpoMEJlYBrPqb%2FfynLn3C%2Bt1o8kctqPZRcQo4TCYFNUctWcqaiqMfgzuIiWTvMKZkarL4f0IqdKiNVaWtDzuShSlOnaNkTVNOROYr%2Fp2Tm%2Fa2lfSCB2RqZRw5kDsdg8Bs4xOh4JzzjviUisIK98lz6R39CnzsMqtOI09oCDmkJ9V1IJtzf3Yjp4X85u0n%2FahJYt8PitAu1Jn%2F9AYkbaYowyzDd8%2FsNAcotsEe2OjPm43WUGgkLFJAXkFudEaMdBWdDnBcYObLOP2jHIFAo98lRgskpsd4hGf7m6aoXYgjRBbPeHjCus5zNBjqkAdbs2zfLup5lH7jXWWkDcuhA1fstpcR3hFVlpSodrq0Tv846WmGmKOhmJQ0y5%2BL66ayyCap4Dk%2Bfu2lpUnbAwxOoIDRFSf79x3e1%2FLZD1YF7YeG5ip2sVsh2l9ddiYnBBnSbcUKHRB2y8FjkQkueOyNqJKbh%2BDKml4h13E%2BE4c6Shw2%2FWwGPPt3BWow%2BAsknI4oMdnoUHUGnEKX%2BnEqMAXcxl%2Bby&X-Amz-Signature=95aa7f2b246091c7a8c377ceeb3b84abd207c3ebb0eb8bb32e97c494bc2de09f&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466XD36GWQN%2F20260303%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260303T183416Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjENr%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCuvKrs0cGk1reyj%2FA6p8yGRxAPFSvxt1r2QSysFoQ8XQIhAPuNRPM%2B7luKeSseBg5rPPjKo%2FdqY0hBsMG538Ma8bLPKogECKL%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1Igy6vIa8Hqw5biZEoBMq3AOXKcy8G9e3C0rEtPVqheMvSnH%2BedkBBwXFcxRH6RbhIHHBVyjBiGQOG9vnOaGOG4vU3%2BWI34Jma69UTU7lSy6ZFd2F1%2FqanujAPuCl8%2BJ2z50sEdZQaYK7qX40O2aQdCUFciqLu%2BGPiQBz2mi8VA%2BMbvl1CPlrNGb3YSDVNEoXqVY%2BEOWr0mXJL6NdQ7hC5Uswd9ZOuPlX%2ByZl8VZiLXc7zfNiT7uVhi5ELZ7fT8Z0RWmTOD%2FS4I9wD%2FvXwtRDnwffmdf1KUjANs0mcHS0MRqjoc6o3SsnpvGb%2B951HwNJJ%2BaIWXeBvTl5YaqXwI8L1uKWe5YTsVj9QMjpoMEJlYBrPqb%2FfynLn3C%2Bt1o8kctqPZRcQo4TCYFNUctWcqaiqMfgzuIiWTvMKZkarL4f0IqdKiNVaWtDzuShSlOnaNkTVNOROYr%2Fp2Tm%2Fa2lfSCB2RqZRw5kDsdg8Bs4xOh4JzzjviUisIK98lz6R39CnzsMqtOI09oCDmkJ9V1IJtzf3Yjp4X85u0n%2FahJYt8PitAu1Jn%2F9AYkbaYowyzDd8%2FsNAcotsEe2OjPm43WUGgkLFJAXkFudEaMdBWdDnBcYObLOP2jHIFAo98lRgskpsd4hGf7m6aoXYgjRBbPeHjCus5zNBjqkAdbs2zfLup5lH7jXWWkDcuhA1fstpcR3hFVlpSodrq0Tv846WmGmKOhmJQ0y5%2BL66ayyCap4Dk%2Bfu2lpUnbAwxOoIDRFSf79x3e1%2FLZD1YF7YeG5ip2sVsh2l9ddiYnBBnSbcUKHRB2y8FjkQkueOyNqJKbh%2BDKml4h13E%2BE4c6Shw2%2FWwGPPt3BWow%2BAsknI4oMdnoUHUGnEKX%2BnEqMAXcxl%2Bby&X-Amz-Signature=366c6fc42236d1bd0569135b396ab22a9a3713f70cc0f88a5218b201b71ce45b&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

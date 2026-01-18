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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466RTP4QW6M%2F20260118%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260118T181545Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjELf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIBqekgiFcTSj%2BAS60B%2FEy118Wdfd6e1uPSbdz%2BygN5WGAiAGEhOSoAv2%2BxZmgT5MTk4%2FYcUBAyBrKy%2FvGLXbV%2BX2%2BiqIBAiA%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMVYh2yFm54BFhOMsGKtwDfw3UxQD%2FbKeRnPIjgn6IgpPWSh3svi%2BzgsES1qJMFpvW6rLhdHrvNEOafNa7VTliXvtt1sNrUmvnwgb0PN3pthVujNV04PDfHTgXHRtpDjUcDInjsB9%2BHGxKco3nZktmwm60OSZmwRBeR4XgJ1dNHEArJiKgZbAUD%2BKlRFpBQLXLgY054sAjOut0a5RUG5daLiBmzAYyDVvJstAQ3%2FI8w68hnaSpeuCaz%2BITjNc7Aoqk9O%2BO%2B%2BtA8n1AKlIabRNZY5ncxpHByaTT5YkAL9EdntXLUlM%2B%2BwzZ7JafmGqE2lN8NbMvYzRp6Zjc7QmXlb5PMLzgqn60JMRA6ML1rw5iXpy4QGQhgEFoKHvKTIbOdbkO16zzORv0nfdeh%2FfZMTpLit4RXc5prSnohXNI0o%2BL5WRfXSBThq7Z1QsYhmsDW%2BgjBC4TD%2Bll4wFzn0Th%2Bt7KE%2B7lEfg2TRB3bXd%2FhU73PvBuckG7xy791%2FBza75BPF8%2FnkzASI%2FvlT86YUJZ0dMz1CbPIbrWMoRkmhy%2FtfWp1UAE2B7YyjXRsNNBiHvbMyRlB81qj3qnkeaQiUjQFzSVsCd9WmJAfjDYa0s2kgWZLerCWbkvMUUmqdMl9iLO3GRErRirzivhB%2FXLDjww0eOzywY6pgF3E9xWuUfAhB0EIHsCRDHv1%2FsnObQXougu1KUGMPFdFyrhyIJDjr2t5kYrrpRBI2Ht1xL6E5VdL1SCx9AYY%2Fm%2Bt9U13TkyaX1MhC1UwaG%2BBSxVdrN0glc93DyZX71MZsQn3jIY3SA5uPGGX6Aq7z39PCqXA8kVG%2BF3gQ74G%2F4apqEMVHAlcn9p2qh7xpYdQ7GqQn44U5fEd1SEo%2FV%2FltJwcef%2BRwNE&X-Amz-Signature=033abc75b871cdfe8a16b9f603a38686d0fa4a6a71b927b37e1bee38841265cc&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466RTP4QW6M%2F20260118%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260118T181545Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjELf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIBqekgiFcTSj%2BAS60B%2FEy118Wdfd6e1uPSbdz%2BygN5WGAiAGEhOSoAv2%2BxZmgT5MTk4%2FYcUBAyBrKy%2FvGLXbV%2BX2%2BiqIBAiA%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMVYh2yFm54BFhOMsGKtwDfw3UxQD%2FbKeRnPIjgn6IgpPWSh3svi%2BzgsES1qJMFpvW6rLhdHrvNEOafNa7VTliXvtt1sNrUmvnwgb0PN3pthVujNV04PDfHTgXHRtpDjUcDInjsB9%2BHGxKco3nZktmwm60OSZmwRBeR4XgJ1dNHEArJiKgZbAUD%2BKlRFpBQLXLgY054sAjOut0a5RUG5daLiBmzAYyDVvJstAQ3%2FI8w68hnaSpeuCaz%2BITjNc7Aoqk9O%2BO%2B%2BtA8n1AKlIabRNZY5ncxpHByaTT5YkAL9EdntXLUlM%2B%2BwzZ7JafmGqE2lN8NbMvYzRp6Zjc7QmXlb5PMLzgqn60JMRA6ML1rw5iXpy4QGQhgEFoKHvKTIbOdbkO16zzORv0nfdeh%2FfZMTpLit4RXc5prSnohXNI0o%2BL5WRfXSBThq7Z1QsYhmsDW%2BgjBC4TD%2Bll4wFzn0Th%2Bt7KE%2B7lEfg2TRB3bXd%2FhU73PvBuckG7xy791%2FBza75BPF8%2FnkzASI%2FvlT86YUJZ0dMz1CbPIbrWMoRkmhy%2FtfWp1UAE2B7YyjXRsNNBiHvbMyRlB81qj3qnkeaQiUjQFzSVsCd9WmJAfjDYa0s2kgWZLerCWbkvMUUmqdMl9iLO3GRErRirzivhB%2FXLDjww0eOzywY6pgF3E9xWuUfAhB0EIHsCRDHv1%2FsnObQXougu1KUGMPFdFyrhyIJDjr2t5kYrrpRBI2Ht1xL6E5VdL1SCx9AYY%2Fm%2Bt9U13TkyaX1MhC1UwaG%2BBSxVdrN0glc93DyZX71MZsQn3jIY3SA5uPGGX6Aq7z39PCqXA8kVG%2BF3gQ74G%2F4apqEMVHAlcn9p2qh7xpYdQ7GqQn44U5fEd1SEo%2FV%2FltJwcef%2BRwNE&X-Amz-Signature=0b66ffee7e52859e3ed32be75229776ba163df1456ba617e6575b4e99cafb2cf&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

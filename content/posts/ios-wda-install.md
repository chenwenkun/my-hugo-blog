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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466Z6WJAHKY%2F20260729%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260729T081809Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjELD%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIGIZa%2FsQtQeysFoevVD4ZYLKiuU4iTTQ0FtawXbmMx3xAiBpB9%2B63vwF%2FYcLryFjN%2FpVpGqnjtUFeApdci2nd5890Sr%2FAwh5EAAaDDYzNzQyMzE4MzgwNSIMjdWobH4xi2q48L1tKtwDk77azym%2FpbC7pIDw1POoyW3HQtzBiWvDRnAHPkacxsU%2BdtgyEMviEyETCH5nStlHM31bYbbf0Qg%2BrAbIE1MI5ljdt4Z%2F8jIiCZXMh1wGxj%2BdaajbkBeSic0O%2BhSDBeUYlf50eXIwcwFjHhDRQdEk%2FSpNUTv8DXwUs5gRH7iaYe2M7H8UWDfydN%2BbXi1KGsFQYsHIs8Eso03Xrgh1xvAM4T9xdsbIpo8J%2BjVXNvOVZE%2BL%2BYK%2FkkXzm6pxBdDJngPzAkOvUL%2FVmoLUxoNFm3Mx4tT%2BfRkN9XIQDfxa5FLBDnIpUGw2%2ByoXEdKcwcZV54f57X53ajgChZnG9JGWvahw62wl9%2F5lidElsUVcG9XtrbfKb%2BC2hFiyXmdheFE23amJzANG%2Bi0f%2B%2BY5l%2FjBtV6EBAccjkfzItzk9wVKjlILsJ1fRTm6j1krDImJMHrKK4bQrbf9ZMhlUaUtOqjdM8daoP1lcplggDsdW99D8G4EHns6O5Pjos29eWiel5XkADBJSS1ajOKuEJANF1byTphOtpX0e9xvq6sne1mP7w3ldzIGuU7JrrMhLKptTUaxfO9o3vwVKTNn9uVE%2Bch4zhloDlM37DbjcHq7o%2FOgVRy7o1qvyf4PH%2FAO5yuqk5Iwiuim0wY6pgHky6bZPwpiWVISSTm2tPHIw9jWc5f0lscwCvYO2FUsGLSapw%2BQW8e%2FmRFqTCZoYAyHmgirau6BgNHzgwEfFPXg6qoDLTruShTFCv1YWEpcb3CrtJuTwO%2BCB3ZtfdFa1ZWQEcYbDJDsK6tp9v%2F19VDt4I0ddp2GiQl6SSfXWFO5V6GC8d2H0IbsocWZXGVk8LgijyzkflvOglKmFI19iF7QWMCiuEXj&X-Amz-Signature=762262e4745c5131defdfbbc2e8c67688226b1bbb56473ef3c939f8ae9652e73&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466Z6WJAHKY%2F20260729%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260729T081809Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjELD%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIGIZa%2FsQtQeysFoevVD4ZYLKiuU4iTTQ0FtawXbmMx3xAiBpB9%2B63vwF%2FYcLryFjN%2FpVpGqnjtUFeApdci2nd5890Sr%2FAwh5EAAaDDYzNzQyMzE4MzgwNSIMjdWobH4xi2q48L1tKtwDk77azym%2FpbC7pIDw1POoyW3HQtzBiWvDRnAHPkacxsU%2BdtgyEMviEyETCH5nStlHM31bYbbf0Qg%2BrAbIE1MI5ljdt4Z%2F8jIiCZXMh1wGxj%2BdaajbkBeSic0O%2BhSDBeUYlf50eXIwcwFjHhDRQdEk%2FSpNUTv8DXwUs5gRH7iaYe2M7H8UWDfydN%2BbXi1KGsFQYsHIs8Eso03Xrgh1xvAM4T9xdsbIpo8J%2BjVXNvOVZE%2BL%2BYK%2FkkXzm6pxBdDJngPzAkOvUL%2FVmoLUxoNFm3Mx4tT%2BfRkN9XIQDfxa5FLBDnIpUGw2%2ByoXEdKcwcZV54f57X53ajgChZnG9JGWvahw62wl9%2F5lidElsUVcG9XtrbfKb%2BC2hFiyXmdheFE23amJzANG%2Bi0f%2B%2BY5l%2FjBtV6EBAccjkfzItzk9wVKjlILsJ1fRTm6j1krDImJMHrKK4bQrbf9ZMhlUaUtOqjdM8daoP1lcplggDsdW99D8G4EHns6O5Pjos29eWiel5XkADBJSS1ajOKuEJANF1byTphOtpX0e9xvq6sne1mP7w3ldzIGuU7JrrMhLKptTUaxfO9o3vwVKTNn9uVE%2Bch4zhloDlM37DbjcHq7o%2FOgVRy7o1qvyf4PH%2FAO5yuqk5Iwiuim0wY6pgHky6bZPwpiWVISSTm2tPHIw9jWc5f0lscwCvYO2FUsGLSapw%2BQW8e%2FmRFqTCZoYAyHmgirau6BgNHzgwEfFPXg6qoDLTruShTFCv1YWEpcb3CrtJuTwO%2BCB3ZtfdFa1ZWQEcYbDJDsK6tp9v%2F19VDt4I0ddp2GiQl6SSfXWFO5V6GC8d2H0IbsocWZXGVk8LgijyzkflvOglKmFI19iF7QWMCiuEXj&X-Amz-Signature=e2659432f73beab78418de96eec5bd509fa3a06c20b75d310eeba7a1c8629b9a&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

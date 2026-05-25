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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466VUGMLIWW%2F20260525%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260525T191420Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEKP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQC6oySkq32r2Uh8epi55QyEBBaNgg117ejFlC9V9grWZwIhAIseMQQF39IfO%2F%2FNn1JKiw9dhT4R4BhxK3uGMEdsIQmfKv8DCGsQABoMNjM3NDIzMTgzODA1IgznuXcQ0s1um8PhLQUq3AP5f0eTiV55hz9QFRoHbJOSrXiydMmpCcEVQ652%2B6CLI6RFbhs1De5NRNK5rLFP2EwDTnGY%2Bdd6JhAwlDvvzFd2MYOIT8pO6QQqpysbcE2UO5rN7do2TsIwfAwYcsv3v1E13n9yOtcUMSiAw5A81GyfKenh7OsOwqtL6mdEwXNelJYlg6MB1%2BSkLkGl88TCfqHtnbJ%2ByBBhAo3D0Mk6jhd0pe1wyd0O%2FSzvAQMfMREOej58J%2Fsz6NoV%2BGdKgBzw65VCaGACz29GkN9PzaMjXXAPyRR1xrJs0CYTViIAdPaRvu7TH%2BEg%2BDqhVKLnEn9KXljML%2B6q%2FDNkd8nAczmF8kPI1aU7Trg1q%2FUrBXC0%2F6IUu38kv1GyzsnPQOIM6Z6QJiWIP096fmiMkSYUACw1uNcmp3DsPXtYpHgDtT8BgRLq%2BGAxaVQrUj5xqVpEwUh6qFQ14E4fFTbPPa3JT7a21%2BswOhILNZrm5NxyD25GyQ7jI2ULR6OJ%2B9Gm0bpy697gQL2QwuoXbd3O9kZVKk1Xgmu7ju5QQJfD7TyEcBNw4apjHLGNnuG5Uk4raJzWifZuKnrjP8Y9MY7sI48d4DKpX7HjiWGYXacDjoQuNg%2Fh6ky%2B21Hi5i0o8BH62eZO3jC5qNLQBjqkAWy%2Fn%2B3ssdUPz7EJ7aV%2FR985aSoW%2BzKQZTIqU%2B8GmQc9FOVJF0aIObI%2F54xWqMySJvEbiwfkSKs2Y6PG8YFW7iU9eg2aTnYcje3MiV4MDJcn%2F%2FlONuOU9iB%2B8Pohp0xB3flOvOVZSI1NfsM5PtH4QU1EGKJYxb%2FH16VVV71zAR0w4T81C4q37Rwais58CEthTizk7uWCbNjaxYKbP6wHTSBtMlSG&X-Amz-Signature=e2abac0f75c98040c7399b89f0840609c1ad5fce2d695b0875a4e84451a1d6f4&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466VUGMLIWW%2F20260525%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260525T191420Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEKP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQC6oySkq32r2Uh8epi55QyEBBaNgg117ejFlC9V9grWZwIhAIseMQQF39IfO%2F%2FNn1JKiw9dhT4R4BhxK3uGMEdsIQmfKv8DCGsQABoMNjM3NDIzMTgzODA1IgznuXcQ0s1um8PhLQUq3AP5f0eTiV55hz9QFRoHbJOSrXiydMmpCcEVQ652%2B6CLI6RFbhs1De5NRNK5rLFP2EwDTnGY%2Bdd6JhAwlDvvzFd2MYOIT8pO6QQqpysbcE2UO5rN7do2TsIwfAwYcsv3v1E13n9yOtcUMSiAw5A81GyfKenh7OsOwqtL6mdEwXNelJYlg6MB1%2BSkLkGl88TCfqHtnbJ%2ByBBhAo3D0Mk6jhd0pe1wyd0O%2FSzvAQMfMREOej58J%2Fsz6NoV%2BGdKgBzw65VCaGACz29GkN9PzaMjXXAPyRR1xrJs0CYTViIAdPaRvu7TH%2BEg%2BDqhVKLnEn9KXljML%2B6q%2FDNkd8nAczmF8kPI1aU7Trg1q%2FUrBXC0%2F6IUu38kv1GyzsnPQOIM6Z6QJiWIP096fmiMkSYUACw1uNcmp3DsPXtYpHgDtT8BgRLq%2BGAxaVQrUj5xqVpEwUh6qFQ14E4fFTbPPa3JT7a21%2BswOhILNZrm5NxyD25GyQ7jI2ULR6OJ%2B9Gm0bpy697gQL2QwuoXbd3O9kZVKk1Xgmu7ju5QQJfD7TyEcBNw4apjHLGNnuG5Uk4raJzWifZuKnrjP8Y9MY7sI48d4DKpX7HjiWGYXacDjoQuNg%2Fh6ky%2B21Hi5i0o8BH62eZO3jC5qNLQBjqkAWy%2Fn%2B3ssdUPz7EJ7aV%2FR985aSoW%2BzKQZTIqU%2B8GmQc9FOVJF0aIObI%2F54xWqMySJvEbiwfkSKs2Y6PG8YFW7iU9eg2aTnYcje3MiV4MDJcn%2F%2FlONuOU9iB%2B8Pohp0xB3flOvOVZSI1NfsM5PtH4QU1EGKJYxb%2FH16VVV71zAR0w4T81C4q37Rwais58CEthTizk7uWCbNjaxYKbP6wHTSBtMlSG&X-Amz-Signature=d62828fc82e8e73af2bd754b2337e0bdba8c9f4ca2071c41a2740ae307e26ac8&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

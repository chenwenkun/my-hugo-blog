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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663N6GKLYI%2F20251106%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251106T181645Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEOL%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQDxk%2FUYnlE%2FhIwuAd1szqEi2qN6W1zkpNaLDjzSKZS8UAIhAO6eOwKbm60kHYKl41Uh6NaAfIWuB59y%2B362B3WjGG%2FtKogECKv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgwnJten9flxrMt7lLMq3ANHZ0xlOVixHVxm6Wj5ls8YzWTgkcszTMdebC7IRdJ2hhGR%2FkIixvI3N4p5KPOqnI4aGRsA0httxTToNUs84yxpZRVlzmzviQViNrLo06K2ywOsCF%2Fe1DMabiHrr%2BCNGqtox2N2ZsBHEukNzfTNOsj5LNJANlbDEKTCyYB0VmcQ94b1QhDKXHpIzSt1Pj9mrPRFYI5mb66cNcK%2BISN4bKje0e7sN9phsTVMgzJhbOBYkwzdBmJ0NepK0tU96H8SNlhsXZB8U9Lh4grnr8dn3kwGIsEZceRP3h3fzUuOs%2B2F4D%2B5Ayrty%2BjXPtRxuLi%2FK1lAg5tb4XixoUM9Wc7KAVgUB4sb9Fifm33BDo%2B15oYNQT2nVDWwqNOFpEkc2VUJxPY4GylitygdG3d9keJbwTkQmQPtgfZ2cn4XqsXhpms9L3XU%2BO8vVI90iytb%2FcXOZHr%2FMPm8rozSiUpHzVPCsRchPmDLHS15EwJOqB26urJDW4J5qnzqUZpv3Rds1rPX44xh7IdUx%2BGE7I%2FLBDkxdvn5koQXk3%2FN544b40YAFouAXs9kiMIgJDkQGvedyj2g64ei0YGhCN36Ih0%2B%2FENZyPW1EunUOKl4J314Wq7f%2ByRFwqMHV%2F902oTEaEIuhDD4tbPIBjqkAcTUysrIVtanWbCdkb0uv0vxYEbZDT3TsBrTELsSufrRiohdNkeuHmGuYu8tOQ%2BkFNRqUrZVDpyNFFgL%2BSTxKabzBafP3mEdiwEriDB%2F%2B69um1QmGNEo1KkkQaHCHrFwRygFBOeKdl11HJ3QxGlNOoaZcRSrIW3z%2BKLdicStuE4rLX8F4gEufj5a0qyAkfCJtcRkuoU3uS3IxGuSbUS10Ji9LBoE&X-Amz-Signature=e8c815c6e638be11985ccaca748b61ad33e0734b9bb9e97b5c7c5e15c69c1ab0&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663N6GKLYI%2F20251106%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251106T181645Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEOL%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQDxk%2FUYnlE%2FhIwuAd1szqEi2qN6W1zkpNaLDjzSKZS8UAIhAO6eOwKbm60kHYKl41Uh6NaAfIWuB59y%2B362B3WjGG%2FtKogECKv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgwnJten9flxrMt7lLMq3ANHZ0xlOVixHVxm6Wj5ls8YzWTgkcszTMdebC7IRdJ2hhGR%2FkIixvI3N4p5KPOqnI4aGRsA0httxTToNUs84yxpZRVlzmzviQViNrLo06K2ywOsCF%2Fe1DMabiHrr%2BCNGqtox2N2ZsBHEukNzfTNOsj5LNJANlbDEKTCyYB0VmcQ94b1QhDKXHpIzSt1Pj9mrPRFYI5mb66cNcK%2BISN4bKje0e7sN9phsTVMgzJhbOBYkwzdBmJ0NepK0tU96H8SNlhsXZB8U9Lh4grnr8dn3kwGIsEZceRP3h3fzUuOs%2B2F4D%2B5Ayrty%2BjXPtRxuLi%2FK1lAg5tb4XixoUM9Wc7KAVgUB4sb9Fifm33BDo%2B15oYNQT2nVDWwqNOFpEkc2VUJxPY4GylitygdG3d9keJbwTkQmQPtgfZ2cn4XqsXhpms9L3XU%2BO8vVI90iytb%2FcXOZHr%2FMPm8rozSiUpHzVPCsRchPmDLHS15EwJOqB26urJDW4J5qnzqUZpv3Rds1rPX44xh7IdUx%2BGE7I%2FLBDkxdvn5koQXk3%2FN544b40YAFouAXs9kiMIgJDkQGvedyj2g64ei0YGhCN36Ih0%2B%2FENZyPW1EunUOKl4J314Wq7f%2ByRFwqMHV%2F902oTEaEIuhDD4tbPIBjqkAcTUysrIVtanWbCdkb0uv0vxYEbZDT3TsBrTELsSufrRiohdNkeuHmGuYu8tOQ%2BkFNRqUrZVDpyNFFgL%2BSTxKabzBafP3mEdiwEriDB%2F%2B69um1QmGNEo1KkkQaHCHrFwRygFBOeKdl11HJ3QxGlNOoaZcRSrIW3z%2BKLdicStuE4rLX8F4gEufj5a0qyAkfCJtcRkuoU3uS3IxGuSbUS10Ji9LBoE&X-Amz-Signature=a2bd89f865594194c04abb9fa2569c2db5d1f09dde0eb037227a7ae5cbda07db&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

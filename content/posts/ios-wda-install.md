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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB46642IDDUEU%2F20251110%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251110T061849Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEDQaCXVzLXdlc3QtMiJGMEQCIC9Y5elpN3v0mu%2BryJjO14b%2FaRRLK4zHhryobYoi6URAAiA2kUOYSUjwMRj4X8rlcoXOAtBumFE8u%2BT3j3lP4lsIGyqIBAj9%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMQnXpqPZtwaLfFxMDKtwD5EcpU%2BXy8n1weorIl2zlqCQ%2BhL6lDlRRCamjM1lmsTNsnqcZkcUk97TFmKZbBHQEm9LHf%2FD5OMcH0na73HLH%2FsGtUZQODnJSlSaGIRHeLHf75Qxq49H4rZmoNxHCjTvGGEqqA3pMCl54koZLe4n%2F6CAyEgAS65kB7XHV5kXS7Wr7om19LiFxk0ZebbdcIYVxhqtkA%2F93UNOSvYgQL4iWRO%2F2qKrNDoKW5rRYyz59YImd5tgnu%2FGcXTjI3NPzOxVJQpyZutfTt5zIoX2Dn4u2AaEF%2Batg81i2t%2BRfrAny4IvL4wduYwQpIJsa%2FFUCLyQKr%2FMt9k6OfOUlKpe1wmVzpl0KMWiEdhRTjmRzysVOzBsG16Dgqm2ZzCeAkAzn%2BTxvgeizszTM2r4gGGJvBf970yWqDU3NnhO7NrO8dj8cIPqMXSNkFhlWrC5hbKSJNq9jknd3oCPB%2FMJpT%2BEAPuI5ZsuFeFEYdAtoJfKzSwwwR%2B5BG9uVbgWYj1qg2296iaGnQ0K1n4IiU8K9ghXyLXp2NI72ARWub9HgEyDtjlX%2FANCQg8iH9aJSxNDxG4jEfTd8ylfXOsjNkF5kDI8BedJSgR5U%2BYkSfWdD4JF%2BZEEBej%2BZCVkiOVEkxiBb3JYwvs3FyAY6pgH6Hn2nK9Nr30C0VzsEQ%2BKWpv4lGMNyrzZ5GB1L3i03sya9s8UhMelgvCs%2FmNsaSlLja9Uc6j9fBTN433B0cBoMKrk8fIJ92s1elP%2BDv0L%2FAhY5yYR6uOcNGRHfo1MRiMkCp1OCCRwUSKF1BeaWzomRcJ8uVi3xKe1KkZOC8ayr5YDculnrEr1SRswt5gJcaRBzQaRol92hrMhKPajzUuU4WPRePJOI&X-Amz-Signature=8feb5c2b5569b74808d50be3df49693be9178d2ee6d4a53a02d2e72d9f39131d&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB46642IDDUEU%2F20251110%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251110T061849Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEDQaCXVzLXdlc3QtMiJGMEQCIC9Y5elpN3v0mu%2BryJjO14b%2FaRRLK4zHhryobYoi6URAAiA2kUOYSUjwMRj4X8rlcoXOAtBumFE8u%2BT3j3lP4lsIGyqIBAj9%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMQnXpqPZtwaLfFxMDKtwD5EcpU%2BXy8n1weorIl2zlqCQ%2BhL6lDlRRCamjM1lmsTNsnqcZkcUk97TFmKZbBHQEm9LHf%2FD5OMcH0na73HLH%2FsGtUZQODnJSlSaGIRHeLHf75Qxq49H4rZmoNxHCjTvGGEqqA3pMCl54koZLe4n%2F6CAyEgAS65kB7XHV5kXS7Wr7om19LiFxk0ZebbdcIYVxhqtkA%2F93UNOSvYgQL4iWRO%2F2qKrNDoKW5rRYyz59YImd5tgnu%2FGcXTjI3NPzOxVJQpyZutfTt5zIoX2Dn4u2AaEF%2Batg81i2t%2BRfrAny4IvL4wduYwQpIJsa%2FFUCLyQKr%2FMt9k6OfOUlKpe1wmVzpl0KMWiEdhRTjmRzysVOzBsG16Dgqm2ZzCeAkAzn%2BTxvgeizszTM2r4gGGJvBf970yWqDU3NnhO7NrO8dj8cIPqMXSNkFhlWrC5hbKSJNq9jknd3oCPB%2FMJpT%2BEAPuI5ZsuFeFEYdAtoJfKzSwwwR%2B5BG9uVbgWYj1qg2296iaGnQ0K1n4IiU8K9ghXyLXp2NI72ARWub9HgEyDtjlX%2FANCQg8iH9aJSxNDxG4jEfTd8ylfXOsjNkF5kDI8BedJSgR5U%2BYkSfWdD4JF%2BZEEBej%2BZCVkiOVEkxiBb3JYwvs3FyAY6pgH6Hn2nK9Nr30C0VzsEQ%2BKWpv4lGMNyrzZ5GB1L3i03sya9s8UhMelgvCs%2FmNsaSlLja9Uc6j9fBTN433B0cBoMKrk8fIJ92s1elP%2BDv0L%2FAhY5yYR6uOcNGRHfo1MRiMkCp1OCCRwUSKF1BeaWzomRcJ8uVi3xKe1KkZOC8ayr5YDculnrEr1SRswt5gJcaRBzQaRol92hrMhKPajzUuU4WPRePJOI&X-Amz-Signature=dc2c5cb56d0e7037b3cc1676a5819b46f79cd8e58a967b66d5cfb2d1d9d35686&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

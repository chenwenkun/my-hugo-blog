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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466RLWTYSES%2F20260415%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260415T185933Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEOL%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQDR0mFL3aa%2BRCnuOVG8bAWAWUWyEP40V4gD11RsKaUYrwIgcwQ6PlW9okg42o5F1RcPuuqNp9PFpVOECcjp6Q%2Buwr8qiAQIqv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDLj7c2tLspLRVEvEQSrcA06PkK9IEmon8ytS%2FmP%2FSWQO7FzMTAOcWEcgPVwQMh6HVU698kxpACEx6j%2Fvm6mdhMKAUvmBtW%2BdApdtTcDl808CXgDn7DsulrUCnBERAXzYCdho1lGV2O8aR8wDHrWB%2BQyWXE3sN9aqj1ISZ8BQR5Kq2EkoiOYN7bzUQ4f4V2uIwYBzNAYsbMq73iNJgt%2FlqxkQ5Rz5elsAWvxt9f84zW640RCYjydJKCHoBKwDdqXolB7JYW783P%2B5gEIhI3qlzicjWrfVytqlA6FffdWqrdV25HY2g2%2Bdrpw9gIPLQ3fZlRHuIqdvnSBJsqq1jrADj7SwlC%2B4SsYlg%2FbFFZKOTj0UFIg9vqqi0iuuh5Vb%2BYwEYBWILl1J%2BS%2BTltisy51UCWpvEnbmb5O%2FRHB%2FIJbpp6AGa8TfPhnTr1gFfvdlYeBgpj3vem6PF23Dh52AtCeud%2FrEuIOEdzgm43H0Ll8gzuoyPiEYcZx%2BoBe%2Farzet%2BS%2F%2BR6oWG1WnB0lQ3oF5BR5YrRpPwI7VwD4M4YCEq0ZDct3sdOE%2BG4ABWDPKls0ZC3iwVZyCCAACceBxPRgXgdJhY3AHW8VbNqosR12K%2FY3o1CQPOb0dSxNNlKmkBZZ%2Bh9Kr0lRZjxoeR0tI%2Be4MPWS%2F84GOqUBFnL93w2%2F9SkHKrl7HS2mHeBvBRfxX4R%2BPLUlWnqMKEkDrLFkYf5mU6tHpXO663TnhO%2BJBSow6jCeX3iJ6dSWTJ3RxLGCGVWn%2Fh6BUKRn6XYzAC2xLJ5%2FZj615UmUUKHxHtNWZvl1nUeEvffmS8I2%2FrSE9tsa9lwFoW8PGvw4WVLelcnzdxWTR3Rj6uYPO61B5bWGkNZH9dhqgfsneUU%2FpojujRfy&X-Amz-Signature=783e013d5b3eb70b1f38645e3aa6506dea57064b91f3e0c46bea4f0a44a0286a&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466RLWTYSES%2F20260415%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260415T185933Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEOL%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQDR0mFL3aa%2BRCnuOVG8bAWAWUWyEP40V4gD11RsKaUYrwIgcwQ6PlW9okg42o5F1RcPuuqNp9PFpVOECcjp6Q%2Buwr8qiAQIqv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDLj7c2tLspLRVEvEQSrcA06PkK9IEmon8ytS%2FmP%2FSWQO7FzMTAOcWEcgPVwQMh6HVU698kxpACEx6j%2Fvm6mdhMKAUvmBtW%2BdApdtTcDl808CXgDn7DsulrUCnBERAXzYCdho1lGV2O8aR8wDHrWB%2BQyWXE3sN9aqj1ISZ8BQR5Kq2EkoiOYN7bzUQ4f4V2uIwYBzNAYsbMq73iNJgt%2FlqxkQ5Rz5elsAWvxt9f84zW640RCYjydJKCHoBKwDdqXolB7JYW783P%2B5gEIhI3qlzicjWrfVytqlA6FffdWqrdV25HY2g2%2Bdrpw9gIPLQ3fZlRHuIqdvnSBJsqq1jrADj7SwlC%2B4SsYlg%2FbFFZKOTj0UFIg9vqqi0iuuh5Vb%2BYwEYBWILl1J%2BS%2BTltisy51UCWpvEnbmb5O%2FRHB%2FIJbpp6AGa8TfPhnTr1gFfvdlYeBgpj3vem6PF23Dh52AtCeud%2FrEuIOEdzgm43H0Ll8gzuoyPiEYcZx%2BoBe%2Farzet%2BS%2F%2BR6oWG1WnB0lQ3oF5BR5YrRpPwI7VwD4M4YCEq0ZDct3sdOE%2BG4ABWDPKls0ZC3iwVZyCCAACceBxPRgXgdJhY3AHW8VbNqosR12K%2FY3o1CQPOb0dSxNNlKmkBZZ%2Bh9Kr0lRZjxoeR0tI%2Be4MPWS%2F84GOqUBFnL93w2%2F9SkHKrl7HS2mHeBvBRfxX4R%2BPLUlWnqMKEkDrLFkYf5mU6tHpXO663TnhO%2BJBSow6jCeX3iJ6dSWTJ3RxLGCGVWn%2Fh6BUKRn6XYzAC2xLJ5%2FZj615UmUUKHxHtNWZvl1nUeEvffmS8I2%2FrSE9tsa9lwFoW8PGvw4WVLelcnzdxWTR3Rj6uYPO61B5bWGkNZH9dhqgfsneUU%2FpojujRfy&X-Amz-Signature=a57629d5830d7a63e740f73b51253fe047aaa65b590b697b1d02e9aa3b9b27fe&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

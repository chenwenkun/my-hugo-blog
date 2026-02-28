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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466XGCULIJO%2F20260228%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260228T062440Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEIb%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIF4e%2BvEXxNKPbmtayToCBKPjrISdPGIg6%2B2VPKF1BO8aAiBW9QyG7YlpBIQV54IUVrQ8E80kNr1pX1HY2EMS4%2BnqQir%2FAwhOEAAaDDYzNzQyMzE4MzgwNSIMeBQsLOw2Vw3sfRVFKtwDdfR%2BCil8vkhi2uZ0nLe%2BQKgFZI%2FUWUEiNfPZrUFEkBJpJnIluJ7kI8Y7SQWID2e5G5RzgdaqRpRbPSj4Jo2SiyH2JL992A8R2stL1EpgQ24crVP78AQQ6e35pPBBBBNE7hv4gGmrHXNz2g2vcMSCe6tCQnFldskpbcZUAvzK5oYul8kICi86Caklya%2FCbQpGqhQiicUcGQEwDh7vqjalTAWQ0naaPYDy66iohos1PXNJ9My3nkX8f9r5eVR3IJeNsI5INJqOnaR1Y7Pl2ntHL4PHvgylQZRgRJO9XFGUAQPDQVfQ9Vf%2F740uwKR1oN%2BP%2FBsi81dzM90S2kbi%2FjFf9fNvnGAbhWLpavoK7wcNKsT4yfHjnkDBjJ8XtcogHvKCMvrC0HU%2BEitKelSAJ58mzY4NGyU6hejMedWLD1dpBd6Q5DRo1Z%2BZgFVIR6%2FtEUkbNRE2dc1XO1JHWOU4%2BkYMDDFVV%2BxXtECfWTNf1g%2Fd7oMSqSp0BlMl9Msf5CB9%2FRNekD5%2FBlNZtZtVeGe1bSvcCPOux20Mh%2FO8L%2FfYb1otJwnUWREDD0MxQ0nzsH5HMTGQzCQbmOxjRziH9zpvKs32lnHmygAcy1cNa0fOC1KKI3nlENp5AEU3q91x%2FfkwqfmJzQY6pgFkZK9bf3VFNCIhHAI0Z%2F6cmbyHcOh1%2B3FjmpmBBPvy%2FffudaklhWDWmDuNBPFUflbOlVZmd4rawA0CiO3HAuuPEU6HIOG6DQptOd1A8z%2B8YztMpKiHR0YvLzMN8ZyhM72HAz2TkxXi%2FX70XM0K%2BXhg5kAOWXhF1F7fy46SM7AD%2F%2Bbj1gg4TjUUV%2FQL2WNFjpqkt70KAI20pLEI7lCfljDUeB%2BWBTR9&X-Amz-Signature=024d15b78e2d33d7741f51e5c6bdde8244cafdfffef23e16f826a96db966a6fe&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466XGCULIJO%2F20260228%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260228T062440Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEIb%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIF4e%2BvEXxNKPbmtayToCBKPjrISdPGIg6%2B2VPKF1BO8aAiBW9QyG7YlpBIQV54IUVrQ8E80kNr1pX1HY2EMS4%2BnqQir%2FAwhOEAAaDDYzNzQyMzE4MzgwNSIMeBQsLOw2Vw3sfRVFKtwDdfR%2BCil8vkhi2uZ0nLe%2BQKgFZI%2FUWUEiNfPZrUFEkBJpJnIluJ7kI8Y7SQWID2e5G5RzgdaqRpRbPSj4Jo2SiyH2JL992A8R2stL1EpgQ24crVP78AQQ6e35pPBBBBNE7hv4gGmrHXNz2g2vcMSCe6tCQnFldskpbcZUAvzK5oYul8kICi86Caklya%2FCbQpGqhQiicUcGQEwDh7vqjalTAWQ0naaPYDy66iohos1PXNJ9My3nkX8f9r5eVR3IJeNsI5INJqOnaR1Y7Pl2ntHL4PHvgylQZRgRJO9XFGUAQPDQVfQ9Vf%2F740uwKR1oN%2BP%2FBsi81dzM90S2kbi%2FjFf9fNvnGAbhWLpavoK7wcNKsT4yfHjnkDBjJ8XtcogHvKCMvrC0HU%2BEitKelSAJ58mzY4NGyU6hejMedWLD1dpBd6Q5DRo1Z%2BZgFVIR6%2FtEUkbNRE2dc1XO1JHWOU4%2BkYMDDFVV%2BxXtECfWTNf1g%2Fd7oMSqSp0BlMl9Msf5CB9%2FRNekD5%2FBlNZtZtVeGe1bSvcCPOux20Mh%2FO8L%2FfYb1otJwnUWREDD0MxQ0nzsH5HMTGQzCQbmOxjRziH9zpvKs32lnHmygAcy1cNa0fOC1KKI3nlENp5AEU3q91x%2FfkwqfmJzQY6pgFkZK9bf3VFNCIhHAI0Z%2F6cmbyHcOh1%2B3FjmpmBBPvy%2FffudaklhWDWmDuNBPFUflbOlVZmd4rawA0CiO3HAuuPEU6HIOG6DQptOd1A8z%2B8YztMpKiHR0YvLzMN8ZyhM72HAz2TkxXi%2FX70XM0K%2BXhg5kAOWXhF1F7fy46SM7AD%2F%2Bbj1gg4TjUUV%2FQL2WNFjpqkt70KAI20pLEI7lCfljDUeB%2BWBTR9&X-Amz-Signature=497b406a253b513edd2c4b8ec444d4df8907c160e47de02869a29104349d8057&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466Z6IO6XS4%2F20260318%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260318T124437Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEDwaCXVzLXdlc3QtMiJGMEQCIAqSGHkzhAi6QsfRguXQyP2W9y4lVtv3q4Xw23IEw6VbAiA4mDwWpZFdCaVa7MLNRrXJBo7%2FZ4sJeuOScsPXACZzKyr%2FAwgFEAAaDDYzNzQyMzE4MzgwNSIMhPTqxP8dSJjpbpNbKtwDKkiJq6pZ7g8%2Ft96QbRq3C6Fu4SHptrFBf8ZgcODotGEjFKCN4%2FYPIoP0D5XD7HJZlYae2tGSNrbFcH%2FqIsitFarT21YlPDvvN1lUmhjMJQ2uKNqobphoVSJFc83TF%2BBBw%2BU4em3FneOhKaiSI0DvlV2EVsqNVyrBhCKoEhGtBzAorn6yVOEZGcnoltn%2BV0PmoJjK91TYGXUOAAO73C1aD%2BZvu3L8jKPb4Di25dYnIEK2D8Ab%2B3Oanr7MlFwvFqAD8DnxESapPwCMgYnjQsUuuYFF6%2B2A0rmNOcvlJ1XEp3NTkJpe3iSCWInuyte8QMIId3CsgYRYdcBAQZYIKiVqNKOLDmhJ%2FtBiEySQr2TVzBftJl0%2BumtmMUs2LM4CPexMJz6FKN0%2B5JZ%2FIPpOR6vsZVhdSgnJwOSK5ueW6l4%2BFKMLZwtKbJWZjQMJSeEbgwnpgPf3zyQ%2BdqTz3gRtEgyKAC52LKwmL3FFdvbbmrDqAdZOom7MlNBQxmhkXbzzBGKeIKGSVMwqouqsQRsYIgedN2OvO4YFvw5TGf9MdM34ER38CRiFcGw7o%2F4%2BOpiWl3KsG%2F2BXq%2B6RZjkplrJyK0NfzcH8zoSHeOu9bfvcSWlx7%2BaltFU9HOjjYfb87ow257qzQY6pgEVTC6LYMb6EePLwh3mXoBVFBrmBhvri6BdtyYHQs1WTs6VUDI9k06DTndE%2BW0wMl4oL3O4wKhqwRBzThegdeCwdy4KRFZMdzeyMgFSvqi5ocV0AMm%2FM5IM7ySb%2FFD9%2BU%2FWMYPV6o0JGQs47y8KVJm1IOjXiSJkUpVauRe4%2F2mvHQIwhAv05zIyETuhSysljtgJh4IGzOnZe7PMS14aLK6n2zeB%2F6Cy&X-Amz-Signature=22d353e376c285e44b5d67ede5f6cca7bc119a2fbe0448aad11e265b23694625&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466Z6IO6XS4%2F20260318%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260318T124437Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEDwaCXVzLXdlc3QtMiJGMEQCIAqSGHkzhAi6QsfRguXQyP2W9y4lVtv3q4Xw23IEw6VbAiA4mDwWpZFdCaVa7MLNRrXJBo7%2FZ4sJeuOScsPXACZzKyr%2FAwgFEAAaDDYzNzQyMzE4MzgwNSIMhPTqxP8dSJjpbpNbKtwDKkiJq6pZ7g8%2Ft96QbRq3C6Fu4SHptrFBf8ZgcODotGEjFKCN4%2FYPIoP0D5XD7HJZlYae2tGSNrbFcH%2FqIsitFarT21YlPDvvN1lUmhjMJQ2uKNqobphoVSJFc83TF%2BBBw%2BU4em3FneOhKaiSI0DvlV2EVsqNVyrBhCKoEhGtBzAorn6yVOEZGcnoltn%2BV0PmoJjK91TYGXUOAAO73C1aD%2BZvu3L8jKPb4Di25dYnIEK2D8Ab%2B3Oanr7MlFwvFqAD8DnxESapPwCMgYnjQsUuuYFF6%2B2A0rmNOcvlJ1XEp3NTkJpe3iSCWInuyte8QMIId3CsgYRYdcBAQZYIKiVqNKOLDmhJ%2FtBiEySQr2TVzBftJl0%2BumtmMUs2LM4CPexMJz6FKN0%2B5JZ%2FIPpOR6vsZVhdSgnJwOSK5ueW6l4%2BFKMLZwtKbJWZjQMJSeEbgwnpgPf3zyQ%2BdqTz3gRtEgyKAC52LKwmL3FFdvbbmrDqAdZOom7MlNBQxmhkXbzzBGKeIKGSVMwqouqsQRsYIgedN2OvO4YFvw5TGf9MdM34ER38CRiFcGw7o%2F4%2BOpiWl3KsG%2F2BXq%2B6RZjkplrJyK0NfzcH8zoSHeOu9bfvcSWlx7%2BaltFU9HOjjYfb87ow257qzQY6pgEVTC6LYMb6EePLwh3mXoBVFBrmBhvri6BdtyYHQs1WTs6VUDI9k06DTndE%2BW0wMl4oL3O4wKhqwRBzThegdeCwdy4KRFZMdzeyMgFSvqi5ocV0AMm%2FM5IM7ySb%2FFD9%2BU%2FWMYPV6o0JGQs47y8KVJm1IOjXiSJkUpVauRe4%2F2mvHQIwhAv05zIyETuhSysljtgJh4IGzOnZe7PMS14aLK6n2zeB%2F6Cy&X-Amz-Signature=4d97ac0f3cb4c9453d48f704dd30bbf0772f677676d2ab71cca6a6b9269008ac&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

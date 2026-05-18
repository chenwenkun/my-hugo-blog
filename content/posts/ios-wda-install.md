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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466WM2SDV7Q%2F20260518%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260518T093819Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEPH%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIE6ehCD8ZpVymgQY2%2FVeryfI8FE%2Fuko3fqQnMYxzXB8AAiAFjpASQ9RM8%2FQrr8tC8qMiJJyxemxWA%2Fuk%2F3VpLYW1GyqIBAi6%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMw9Qs4uV0snqtay%2BOKtwD%2F%2BMofUFpDmC5pPnk0pjPHWDKJ3fTJC20IdSOjxs0dKp%2FqE8%2FZxYzTeD7VmsTyL%2B3dBA4rJWzj7CatLnrPbQkaJLqtk3fNHmigfnDOSA2ljqy3FE2w%2FmNGbHYqlgQfbj9ENRbQ6xLXf45jIkRAKE00EQOhn87KCRmoZCjs%2FphcJBnhtnRchrZ%2FtFF6pK8N2vLMUtzYflIsHdkkWkIpAvig03mSkPpoacOtwlUsXy%2FEG4TkjpJy%2BBgOsrZvQojctkgQ3hhE4wkR92e5lpBMVGiYlesJ9EnPo%2BLvsA4Vq7nn5xhsPeo1mFjavK3QN0LzrvZM9ppgUDDBUP0pMEdu8ylhAXbZdA3V1M9HsZiH7y7%2B0coN8Mhw5sduTP9GuqEm9WkcehXCnGgLnQJfBVGtK9nHtf8tE5%2BceU%2BIC0%2B56gp3G4%2Fp3MJ95Ms0lWlje4r7Cl%2B9Pfc7YJaQb9v946uRyb%2FCwtG7R6%2B%2B4UuJQv0kI764eaVU7KcwDnCwRPV7xx%2BUfii%2BAdh14B%2BYFxmLKvA5esJ%2BUnSI0PoH7VNyRWWz7wHnFu%2Fv7gbnvzZZI9jfS3BsDlvjFUpiTPwBTuFgXAGnD%2F7euZPg%2Ft0KlmdfwIeo2P964Ziavj6d94%2FXn4liWkwiKKr0AY6pgGO63MM7YnzZEdpP7eQtIYNZvJ9JnsZqrFRl8cIpEErqxgbYo1JA%2FV6%2B2zFvwol9M3zPBSsMUKX9BX08Go58wFSqz%2FWN5YR58%2FL1Tn1E8TJ%2BvOW8AUcCVfGtVQ21nY1khv9czCai2AvXOI5XrWNr9NBJjDAtqjsac5uO9x4vtjFNHp35KMCXP%2BEQnkLOffXV6GrPN8qOoDqmQsCY07hufOhXUIw9239&X-Amz-Signature=2c415f1fcecca09915f6aabe7fda7e6764009f5fd359886fbf44714a22dad60e&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466WM2SDV7Q%2F20260518%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260518T093819Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEPH%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIE6ehCD8ZpVymgQY2%2FVeryfI8FE%2Fuko3fqQnMYxzXB8AAiAFjpASQ9RM8%2FQrr8tC8qMiJJyxemxWA%2Fuk%2F3VpLYW1GyqIBAi6%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMw9Qs4uV0snqtay%2BOKtwD%2F%2BMofUFpDmC5pPnk0pjPHWDKJ3fTJC20IdSOjxs0dKp%2FqE8%2FZxYzTeD7VmsTyL%2B3dBA4rJWzj7CatLnrPbQkaJLqtk3fNHmigfnDOSA2ljqy3FE2w%2FmNGbHYqlgQfbj9ENRbQ6xLXf45jIkRAKE00EQOhn87KCRmoZCjs%2FphcJBnhtnRchrZ%2FtFF6pK8N2vLMUtzYflIsHdkkWkIpAvig03mSkPpoacOtwlUsXy%2FEG4TkjpJy%2BBgOsrZvQojctkgQ3hhE4wkR92e5lpBMVGiYlesJ9EnPo%2BLvsA4Vq7nn5xhsPeo1mFjavK3QN0LzrvZM9ppgUDDBUP0pMEdu8ylhAXbZdA3V1M9HsZiH7y7%2B0coN8Mhw5sduTP9GuqEm9WkcehXCnGgLnQJfBVGtK9nHtf8tE5%2BceU%2BIC0%2B56gp3G4%2Fp3MJ95Ms0lWlje4r7Cl%2B9Pfc7YJaQb9v946uRyb%2FCwtG7R6%2B%2B4UuJQv0kI764eaVU7KcwDnCwRPV7xx%2BUfii%2BAdh14B%2BYFxmLKvA5esJ%2BUnSI0PoH7VNyRWWz7wHnFu%2Fv7gbnvzZZI9jfS3BsDlvjFUpiTPwBTuFgXAGnD%2F7euZPg%2Ft0KlmdfwIeo2P964Ziavj6d94%2FXn4liWkwiKKr0AY6pgGO63MM7YnzZEdpP7eQtIYNZvJ9JnsZqrFRl8cIpEErqxgbYo1JA%2FV6%2B2zFvwol9M3zPBSsMUKX9BX08Go58wFSqz%2FWN5YR58%2FL1Tn1E8TJ%2BvOW8AUcCVfGtVQ21nY1khv9czCai2AvXOI5XrWNr9NBJjDAtqjsac5uO9x4vtjFNHp35KMCXP%2BEQnkLOffXV6GrPN8qOoDqmQsCY07hufOhXUIw9239&X-Amz-Signature=cb635e066ea96fb0803fd50e8a7ac87c1fee4d0ceb88615a5fbceb4ec18e3970&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4666F672ELN%2F20251210%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251210T181821Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEBIaCXVzLXdlc3QtMiJHMEUCIQD4dkona8pslzAhFouEi6RXg5xfRZnfnVHvQEiPYZ6BmQIgVKS1odHEaNs%2BMwPK0y6%2BQsfbIuFgWFnmLN98ru8V%2B7gqiAQI2%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDCa%2FJ36ucC%2FoCVYxDyrcA9oH6RuLsbh0%2BYCALpUaqEGAKPKHTyfFPUkdtdqx%2B2QXlw4YqopTpJrQJuzjkYPsKOn%2FwFJAkVQZsIIms4kpoaJozQSo4IKNc1jD%2BzpmteVCN5s45odkzMGyFiZ5BeiVZW2llKdP67Hv2XbjHVDyKStH40BxgFbFe2hRHRdTHIaEDH%2BZJyflYYPQQxURqNr%2FC%2FRC5xzMA2pXkwXmXSY3bD4zJnBGL6zWXScSUm%2FYcDxm86IFp9uFMNi4iSFikVAEdfmcLyw3EiXkHtFn0W66XXoVofsh2HvMF0JN33fEuSOIoB1A6TEIKxqrlp%2BHlE0krYGtnZrtrkr3m%2FTDMvs5RZbRZdXTLG4zm8%2FeISOkjMAMn4jeWcc28SaZpe5Hu8uD20H%2BZhkllfeTpMNRVqPBE3Q03YQyijg%2FNP72EymbpXrXhxbOElnmSNDQ9hE3rur%2BtR66ubVOsORYyObekZjrIQPgE2brfxnvRSROXRbx76dTLGrjdQQ0h4aZVPjzAMGzkhSQLciECmJuV9XOGlEGB4j3JeaKemevpphMW7ihvMAP2Ti9ER2kYvc4iaaqQy9pJuTzHgQI6oAzGFyGHaViBHQLQW%2FVW6aY%2B5GX88%2B5SwJEIAQ4WcE57EWY1vm6MMzn5skGOqUB6fiaU0QJZs68Uh9nOLzUcrJPSRqH1kXoP71bCunMte2fIH%2B86lDF0FPUMYa051tap1v7t8LOidudkyNLZncT2DgyccbJ7%2BtHv0KnDHyNMXMP8RkzxEcZW2IeIr6K%2B24DMJogiV1srCOgs0alcfSARXuOxQa%2F2kr%2B8jdM8QCqsXXe0nGtecC4gcE49kWvKUG9gUWr4hLfg3P0zPcNSH7t35xG0cg8&X-Amz-Signature=3f91bd9a30b003532ea3f0c4e87502ef86e167ab170047791da91868729996b6&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4666F672ELN%2F20251210%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251210T181821Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEBIaCXVzLXdlc3QtMiJHMEUCIQD4dkona8pslzAhFouEi6RXg5xfRZnfnVHvQEiPYZ6BmQIgVKS1odHEaNs%2BMwPK0y6%2BQsfbIuFgWFnmLN98ru8V%2B7gqiAQI2%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDCa%2FJ36ucC%2FoCVYxDyrcA9oH6RuLsbh0%2BYCALpUaqEGAKPKHTyfFPUkdtdqx%2B2QXlw4YqopTpJrQJuzjkYPsKOn%2FwFJAkVQZsIIms4kpoaJozQSo4IKNc1jD%2BzpmteVCN5s45odkzMGyFiZ5BeiVZW2llKdP67Hv2XbjHVDyKStH40BxgFbFe2hRHRdTHIaEDH%2BZJyflYYPQQxURqNr%2FC%2FRC5xzMA2pXkwXmXSY3bD4zJnBGL6zWXScSUm%2FYcDxm86IFp9uFMNi4iSFikVAEdfmcLyw3EiXkHtFn0W66XXoVofsh2HvMF0JN33fEuSOIoB1A6TEIKxqrlp%2BHlE0krYGtnZrtrkr3m%2FTDMvs5RZbRZdXTLG4zm8%2FeISOkjMAMn4jeWcc28SaZpe5Hu8uD20H%2BZhkllfeTpMNRVqPBE3Q03YQyijg%2FNP72EymbpXrXhxbOElnmSNDQ9hE3rur%2BtR66ubVOsORYyObekZjrIQPgE2brfxnvRSROXRbx76dTLGrjdQQ0h4aZVPjzAMGzkhSQLciECmJuV9XOGlEGB4j3JeaKemevpphMW7ihvMAP2Ti9ER2kYvc4iaaqQy9pJuTzHgQI6oAzGFyGHaViBHQLQW%2FVW6aY%2B5GX88%2B5SwJEIAQ4WcE57EWY1vm6MMzn5skGOqUB6fiaU0QJZs68Uh9nOLzUcrJPSRqH1kXoP71bCunMte2fIH%2B86lDF0FPUMYa051tap1v7t8LOidudkyNLZncT2DgyccbJ7%2BtHv0KnDHyNMXMP8RkzxEcZW2IeIr6K%2B24DMJogiV1srCOgs0alcfSARXuOxQa%2F2kr%2B8jdM8QCqsXXe0nGtecC4gcE49kWvKUG9gUWr4hLfg3P0zPcNSH7t35xG0cg8&X-Amz-Signature=3f9dbab4468c9e4bb902d56a889140606daeb882e7b3e8c840cfeda2f31f8301&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

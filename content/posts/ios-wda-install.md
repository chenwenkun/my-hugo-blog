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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466TPWYEZPH%2F20260202%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260202T123440Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEBwaCXVzLXdlc3QtMiJGMEQCIFKQcWWfuOOi5VAl1LN9QfhVisGvtlSJ4RaMsHCTXW5tAiBdxhc4ZC8I6Eq%2BKZ3NOb8y%2BfaEG0DpbGy9LoeVj40Z4CqIBAjl%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMDTDvuXtXZW%2FTNy5VKtwDYiOntfH5sNJRCIzvfi4x4bY335IakvYTHrGyt%2BZVDXX6S3YMk7xcodxVGfkYFFzzAeADEttlsdF%2BNcSXcoL6XmemKmQjMUGuu08FV9MzK50f8w3g8qDAx5i4WCZy2XYwplFyTweoyuTN2Gy4zqUrILJfQR06qGRcfw9b91lnLJHlJpyy8QGyd2KOhxm5J7jLyl3UPjR%2Bj1AH1eNCr8JcKJOHDeYDo8L2NQiUFL%2FnJNZZHq8pNmyvDXMRzSkbZNnZCR%2Boqv4XhJBrwmfDdK3bEM0UPTh4VNHGFERA7JukdHH7yKg4CF5DnsPq%2FCcKcOiNacjMTjCz8SFxdIaoglsUMV9%2BhLpMJ34KxHigMxc%2FnetYUwlvU5%2FOjkeUKZYoX54euZiVrAAmMkbW5HWqL4Y2OUPJIIBeX9A8679tjveVakqSvaEgZc03m%2FrpmnAoGk95NFizlnWVhoVpG93JVRcimCsqEcSQCc46IrTyLckx6Q2g65kwfIw8toAGMBVRk%2BqMKrolPUCq8P%2FseJMiVsTDpw896%2FN3Qm8T7By60%2F6p4flax5Q51pyV6xjFyhfZJbyYXt9VJiINRsY5%2FxtQjNMYBxTHAoaO0Z3TZJEPvhZA0zT3CyrnSxR8CUO3sBYwvZmCzAY6pgHNXMawTd3I5Xsm5MPxpwp5FwslSuN8OfpzbvcU8QTXkihS5I0WdxWvkW%2B1bPkSWq0uZ37BCw1P81WJx4n7P3a4PBviiIaBu%2BKcexqxbh265Qanp4Lxllv1f51V5Y%2FI5f1LXUmvg36Q5fSG7jK4rgEYTsmLNtPY5a5vUGCWaQpJ9z0Z9p7P3md5OIbl9eVAHCw3zIiAvH2KZA6Id%2F324mloqMSOf0Lo&X-Amz-Signature=da847742aa6082123ca448d6be509e02a87659ad656c97586150ddb6f2a8805b&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466TPWYEZPH%2F20260202%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260202T123440Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEBwaCXVzLXdlc3QtMiJGMEQCIFKQcWWfuOOi5VAl1LN9QfhVisGvtlSJ4RaMsHCTXW5tAiBdxhc4ZC8I6Eq%2BKZ3NOb8y%2BfaEG0DpbGy9LoeVj40Z4CqIBAjl%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMDTDvuXtXZW%2FTNy5VKtwDYiOntfH5sNJRCIzvfi4x4bY335IakvYTHrGyt%2BZVDXX6S3YMk7xcodxVGfkYFFzzAeADEttlsdF%2BNcSXcoL6XmemKmQjMUGuu08FV9MzK50f8w3g8qDAx5i4WCZy2XYwplFyTweoyuTN2Gy4zqUrILJfQR06qGRcfw9b91lnLJHlJpyy8QGyd2KOhxm5J7jLyl3UPjR%2Bj1AH1eNCr8JcKJOHDeYDo8L2NQiUFL%2FnJNZZHq8pNmyvDXMRzSkbZNnZCR%2Boqv4XhJBrwmfDdK3bEM0UPTh4VNHGFERA7JukdHH7yKg4CF5DnsPq%2FCcKcOiNacjMTjCz8SFxdIaoglsUMV9%2BhLpMJ34KxHigMxc%2FnetYUwlvU5%2FOjkeUKZYoX54euZiVrAAmMkbW5HWqL4Y2OUPJIIBeX9A8679tjveVakqSvaEgZc03m%2FrpmnAoGk95NFizlnWVhoVpG93JVRcimCsqEcSQCc46IrTyLckx6Q2g65kwfIw8toAGMBVRk%2BqMKrolPUCq8P%2FseJMiVsTDpw896%2FN3Qm8T7By60%2F6p4flax5Q51pyV6xjFyhfZJbyYXt9VJiINRsY5%2FxtQjNMYBxTHAoaO0Z3TZJEPvhZA0zT3CyrnSxR8CUO3sBYwvZmCzAY6pgHNXMawTd3I5Xsm5MPxpwp5FwslSuN8OfpzbvcU8QTXkihS5I0WdxWvkW%2B1bPkSWq0uZ37BCw1P81WJx4n7P3a4PBviiIaBu%2BKcexqxbh265Qanp4Lxllv1f51V5Y%2FI5f1LXUmvg36Q5fSG7jK4rgEYTsmLNtPY5a5vUGCWaQpJ9z0Z9p7P3md5OIbl9eVAHCw3zIiAvH2KZA6Id%2F324mloqMSOf0Lo&X-Amz-Signature=08f0c7aee73a4c86d1b60b3ae81aec7c7bb992a097025499c7368982285051ee&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

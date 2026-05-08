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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4662N6UW53A%2F20260508%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260508T071438Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEP7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCI126WIN4zvYR797630P7LScCYgcB%2BtiU%2FGKuoemTcsgIhAJzFb9yx9BCtZOSLLG8rL0bwyat41JpKcZEGTEUAQYnEKogECMf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgzQvdChnJP%2Fz87q1zsq3AOWtJP3WezzzA2QtXMtxHc7kuYazKYogURpDsnFDZv2b66Zla4cp%2BaymuTke1bEwr%2BK1QNADFt0OcpnGJzmB55r6u4%2BJrLzvcZlEbqbf8fJCur0YzkWFX52mL%2FERkBnaACYHrOpcky8mq4O3ZBr%2BkVVf3YAOV2ZfiqaugX4o7zy%2BVSBWArpOXHEEJIfVBnv9UsLCyOVcZxQlQ0l%2F3O7pPgaviNJKBDIPi51kAI4wSZ8yAQHjV3BRZXxj2%2Fk6u%2Ft548GVm1TPRoTp7p8ye4hjj5tOx48Q585iNZZM0ruVk%2BSHhHM4AZRxxCpaZL345AEDuKz4NCI3e7alXb%2Fuj1TqxqpNx3lF5CdHWM9d72OyKTPDIkyHymKj90EtZBm%2BMDJWSsqjsfuABQUhWBIrzbflggHd0Il2vtXLKJ7iKJGuE8CU6s5wHzrfEu2hZvtqW8ULl8fMqVw%2F6J5yYzMmapMVuz6MK2vBf4wy0EbsTGcKJOA3vs32asrr2tJFYC0X9cqtt5MTJHWtDymDkBoaYKIc3zKu%2BO3XjOkMM5RPyj6cL5Nz4oF3vYp%2BqeQdE7CTEbVup6YVwzWaspZTfXzc68bFWgSqi0eCaYhlnlccFCSnGkv06ijuo8uU2UZsu6fgjDw%2F%2FXPBjqkAXOepQtnn6%2B%2Fj61LnDzzElDjvVxOUprXrK8T8LbOHh6bdsc7r2KhZ3wPLzUM7lXFlbutlslQSVbPNHpNvD1AJWqvW1YpCMJ0Uo4N5AG7lrLb18ll11FcKGrP1JTpvhNwVEIQfzgAuzbV40IyLbPRFivMouzGnAGNWsBOZH6Xmr%2BWbWkE8I7AJO96oHYuUABqe4qPxeqWsP3rf7kAY5z9lUuJIUDW&X-Amz-Signature=71bffd4307780e889da04a16b0fbcc367a5abe293831d77e115fa71237d36687&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4662N6UW53A%2F20260508%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260508T071438Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEP7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCI126WIN4zvYR797630P7LScCYgcB%2BtiU%2FGKuoemTcsgIhAJzFb9yx9BCtZOSLLG8rL0bwyat41JpKcZEGTEUAQYnEKogECMf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgzQvdChnJP%2Fz87q1zsq3AOWtJP3WezzzA2QtXMtxHc7kuYazKYogURpDsnFDZv2b66Zla4cp%2BaymuTke1bEwr%2BK1QNADFt0OcpnGJzmB55r6u4%2BJrLzvcZlEbqbf8fJCur0YzkWFX52mL%2FERkBnaACYHrOpcky8mq4O3ZBr%2BkVVf3YAOV2ZfiqaugX4o7zy%2BVSBWArpOXHEEJIfVBnv9UsLCyOVcZxQlQ0l%2F3O7pPgaviNJKBDIPi51kAI4wSZ8yAQHjV3BRZXxj2%2Fk6u%2Ft548GVm1TPRoTp7p8ye4hjj5tOx48Q585iNZZM0ruVk%2BSHhHM4AZRxxCpaZL345AEDuKz4NCI3e7alXb%2Fuj1TqxqpNx3lF5CdHWM9d72OyKTPDIkyHymKj90EtZBm%2BMDJWSsqjsfuABQUhWBIrzbflggHd0Il2vtXLKJ7iKJGuE8CU6s5wHzrfEu2hZvtqW8ULl8fMqVw%2F6J5yYzMmapMVuz6MK2vBf4wy0EbsTGcKJOA3vs32asrr2tJFYC0X9cqtt5MTJHWtDymDkBoaYKIc3zKu%2BO3XjOkMM5RPyj6cL5Nz4oF3vYp%2BqeQdE7CTEbVup6YVwzWaspZTfXzc68bFWgSqi0eCaYhlnlccFCSnGkv06ijuo8uU2UZsu6fgjDw%2F%2FXPBjqkAXOepQtnn6%2B%2Fj61LnDzzElDjvVxOUprXrK8T8LbOHh6bdsc7r2KhZ3wPLzUM7lXFlbutlslQSVbPNHpNvD1AJWqvW1YpCMJ0Uo4N5AG7lrLb18ll11FcKGrP1JTpvhNwVEIQfzgAuzbV40IyLbPRFivMouzGnAGNWsBOZH6Xmr%2BWbWkE8I7AJO96oHYuUABqe4qPxeqWsP3rf7kAY5z9lUuJIUDW&X-Amz-Signature=8a9cd23aa315b959348d28c6470c20d1a3f3042ecec535332ee808f3c8efc6a9&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

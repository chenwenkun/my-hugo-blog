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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663OKEDLP7%2F20260328%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260328T123159Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjECoaCXVzLXdlc3QtMiJIMEYCIQCtozVmdempEKpKcRrqaJHi4%2BtNn2uZ6kA9jkQ10HVSaQIhAKAEBAPHwkCiNCi3vLnYapJ1KpZrrcriP1b3Rs0AMJbKKogECPP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1Igw9nJgjRzp5Uv9tZo8q3APnxZjmTfgRdbTRlR0gPElKbOfFKG1MF5SSb92yv3hgCoG59kncLCdmxBPDyEpk4BseUIB7IYBDQZW9TANE3SJrnR6uM06fv8nVEGdJ9qhgDuUf6JlMdlvfgiJIU67S3juc%2F1p56kKZuBp0dQZjA0rBv%2FozFEeFgDf1JjBQMnHWpPxQ2TRDO%2FU2u9kvSxphJ3YXOByOfh9JYPeLgK8zmRzQb%2FsL4JzRjzVm2JsXyGBq7v3HwoKRxnRuDTMP2xgtYI%2BGxMc6XKaUnUukBC149rfQy7bjf32wT0KgqXLdY%2BYOR0iGnqcynP9Cac5BU1yCRtyWh1yTFp4upON8FN8R6YyXtoafIEauMHlFwj2x3bOi26ivRD0VBUVRCEBj4byumeYq%2B%2Bbjsa5orV3GYwqrzYvronilAdkrHs4fQyoEYWddv3t44gtwCbYLCrMGAw9EAyF6e1r9fREGxxIw%2FTCfdJAQrZ%2BePUyK24u3RxCeixq4cclKZq4o8ZCtMckvYhNTGcVl2h8gqISrGFw7z8uV9sLO%2BUUJFXUOUlGduGc6hBOloVy%2BhhG%2B8FaXHH6xlEtM4V%2BELFtQM2LFRhyvtQC8WgmW6%2FOCfAWAeYOMWbAbUDxj0G8e21jMCT1g8UN8oTCizJ7OBjqkAYSOv3DY%2BN6GtZrabv1C%2BG%2FTW8UEiiL40gd7P7BGg2oqwQ9N2OB9FPVx9y6RRPghTI6YBc%2BqXAFKVdfbk2B1a5cYpbT4jWwJ565%2FlR4BbodRBbbNGQ3v%2FNl9fdygr%2BKp40rc8p1lmEPxI%2FJPjqBF5EPlrSCukA%2Ffn%2BsOy8MQPte2omJ9HpIp5QQN3bjAlbvyoiqVSDeCsJ%2BvD1wcYxMUoAEN0YlW&X-Amz-Signature=e529c5c46da1f4698dfb07f8abbad57e901d19507c2c5062881d07c76203299a&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663OKEDLP7%2F20260328%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260328T123159Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjECoaCXVzLXdlc3QtMiJIMEYCIQCtozVmdempEKpKcRrqaJHi4%2BtNn2uZ6kA9jkQ10HVSaQIhAKAEBAPHwkCiNCi3vLnYapJ1KpZrrcriP1b3Rs0AMJbKKogECPP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1Igw9nJgjRzp5Uv9tZo8q3APnxZjmTfgRdbTRlR0gPElKbOfFKG1MF5SSb92yv3hgCoG59kncLCdmxBPDyEpk4BseUIB7IYBDQZW9TANE3SJrnR6uM06fv8nVEGdJ9qhgDuUf6JlMdlvfgiJIU67S3juc%2F1p56kKZuBp0dQZjA0rBv%2FozFEeFgDf1JjBQMnHWpPxQ2TRDO%2FU2u9kvSxphJ3YXOByOfh9JYPeLgK8zmRzQb%2FsL4JzRjzVm2JsXyGBq7v3HwoKRxnRuDTMP2xgtYI%2BGxMc6XKaUnUukBC149rfQy7bjf32wT0KgqXLdY%2BYOR0iGnqcynP9Cac5BU1yCRtyWh1yTFp4upON8FN8R6YyXtoafIEauMHlFwj2x3bOi26ivRD0VBUVRCEBj4byumeYq%2B%2Bbjsa5orV3GYwqrzYvronilAdkrHs4fQyoEYWddv3t44gtwCbYLCrMGAw9EAyF6e1r9fREGxxIw%2FTCfdJAQrZ%2BePUyK24u3RxCeixq4cclKZq4o8ZCtMckvYhNTGcVl2h8gqISrGFw7z8uV9sLO%2BUUJFXUOUlGduGc6hBOloVy%2BhhG%2B8FaXHH6xlEtM4V%2BELFtQM2LFRhyvtQC8WgmW6%2FOCfAWAeYOMWbAbUDxj0G8e21jMCT1g8UN8oTCizJ7OBjqkAYSOv3DY%2BN6GtZrabv1C%2BG%2FTW8UEiiL40gd7P7BGg2oqwQ9N2OB9FPVx9y6RRPghTI6YBc%2BqXAFKVdfbk2B1a5cYpbT4jWwJ565%2FlR4BbodRBbbNGQ3v%2FNl9fdygr%2BKp40rc8p1lmEPxI%2FJPjqBF5EPlrSCukA%2Ffn%2BsOy8MQPte2omJ9HpIp5QQN3bjAlbvyoiqVSDeCsJ%2BvD1wcYxMUoAEN0YlW&X-Amz-Signature=159ecb8e00ec9f001919fa36428ab00765c5dae895a9db97b2d5559963e00ddd&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

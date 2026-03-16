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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466WGRI2IGA%2F20260316%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260316T124507Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEA0aCXVzLXdlc3QtMiJHMEUCIB%2FZw8oQUY9R9pvSBX6ULrAPZqZZk%2BXm2srxRkUM9sPnAiEAvdmNaN931p%2BjU4nb%2FAkfaTyGe0IJhAcdH3wTzzMvxKAqiAQI1f%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDBh837gAX9aq2F47JircA3j%2BPcruxzjw4yoUTrlLW0ThUv37jgh0t1DLdQeu5Jl4TjsG%2BO3MVUMetLlndF6mVcR8IxaQzAla6RehJr3t%2BbK6BaOZZwRqic9PxzZurC8ZgqujvuaW%2FEm8goMoXEFgyp4qTOK%2FQSOz2LnY52j577YncRz38hLNgCubn2tuIkvQHg4Lirk5WXzEQBO7HLMnaksPj8%2Fte7T%2BMMDByj1Yagy47MoSBdGZCSBjF3pzhh6n3HKEixztQPw7myteJdAt%2BGTEs8c098wMavQSGo70DidpdEJDAecju4X372VWD0hxa3OiPX5f7YpPO81KDTsNS83JSK%2FbV21yCfr8BCpoEmurPOB72VZ68a8YsF9SBeKP0BJ2KQMostfRMCn5K1GAMYJFPKZp2AsrnrXu76NVwY4FZyH3kMeW1jobM%2BNUbO4x%2BPH4GXyV8QfgdS7hcs8LEEewzujsRqlT23ogq6Z0VzKV5ufP0eFR7ARRLu5iaIGrzPbo7Fz%2Fy0QQMz%2Ff%2FigjJU679btI0%2B9FZsodEQXxS%2BzOHOSA39zEzB%2FW3Yyjy%2Frj7ax%2B4EGcrAu1Fq2MwIcbXreXKT30AeUt8XV2PjcAUNzJjYen2kth%2BvfiZwMwYFy0sYTcIIyLVRuKWMsUMP3r380GOqUBo0juvnR4haOYngPtf%2BUvGAisF1LOaTLbORH6VQPyQBahSasuZc1HnBaFThg%2BlQ379VZL5tVGP4ETzHhxZQTspA9vQ0pkG1vA2qaaYqMEH6kCvbU0yUxuWEHsTx7UCYSAJ%2B%2Brcm6lxfeocn4KSHN0TjzUmz69tLd3AVLJZphFT9u7UiO4ACqcOca8p4EQn6LKX6ZaXFKJEhYDJD4TS28BlYPGWuCP&X-Amz-Signature=910c2621f70c720d263e7d5d04f40c14ad037c0eb4ba94bda8e1c9841f73fb62&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466WGRI2IGA%2F20260316%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260316T124507Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEA0aCXVzLXdlc3QtMiJHMEUCIB%2FZw8oQUY9R9pvSBX6ULrAPZqZZk%2BXm2srxRkUM9sPnAiEAvdmNaN931p%2BjU4nb%2FAkfaTyGe0IJhAcdH3wTzzMvxKAqiAQI1f%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDBh837gAX9aq2F47JircA3j%2BPcruxzjw4yoUTrlLW0ThUv37jgh0t1DLdQeu5Jl4TjsG%2BO3MVUMetLlndF6mVcR8IxaQzAla6RehJr3t%2BbK6BaOZZwRqic9PxzZurC8ZgqujvuaW%2FEm8goMoXEFgyp4qTOK%2FQSOz2LnY52j577YncRz38hLNgCubn2tuIkvQHg4Lirk5WXzEQBO7HLMnaksPj8%2Fte7T%2BMMDByj1Yagy47MoSBdGZCSBjF3pzhh6n3HKEixztQPw7myteJdAt%2BGTEs8c098wMavQSGo70DidpdEJDAecju4X372VWD0hxa3OiPX5f7YpPO81KDTsNS83JSK%2FbV21yCfr8BCpoEmurPOB72VZ68a8YsF9SBeKP0BJ2KQMostfRMCn5K1GAMYJFPKZp2AsrnrXu76NVwY4FZyH3kMeW1jobM%2BNUbO4x%2BPH4GXyV8QfgdS7hcs8LEEewzujsRqlT23ogq6Z0VzKV5ufP0eFR7ARRLu5iaIGrzPbo7Fz%2Fy0QQMz%2Ff%2FigjJU679btI0%2B9FZsodEQXxS%2BzOHOSA39zEzB%2FW3Yyjy%2Frj7ax%2B4EGcrAu1Fq2MwIcbXreXKT30AeUt8XV2PjcAUNzJjYen2kth%2BvfiZwMwYFy0sYTcIIyLVRuKWMsUMP3r380GOqUBo0juvnR4haOYngPtf%2BUvGAisF1LOaTLbORH6VQPyQBahSasuZc1HnBaFThg%2BlQ379VZL5tVGP4ETzHhxZQTspA9vQ0pkG1vA2qaaYqMEH6kCvbU0yUxuWEHsTx7UCYSAJ%2B%2Brcm6lxfeocn4KSHN0TjzUmz69tLd3AVLJZphFT9u7UiO4ACqcOca8p4EQn6LKX6ZaXFKJEhYDJD4TS28BlYPGWuCP&X-Amz-Signature=e827b209d85e235993c0bcc83f7119037d336e0eca6cce1c1f97d292ed602f73&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

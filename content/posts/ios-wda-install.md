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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4664OHVT4VU%2F20260325%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260325T065106Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEN%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIChfG8emYP%2BOHj2B1ms9SPT05qXbVMDOlLGYB%2FXzfevQAiAU3haVqvXru6uieloMqrJlXVjghAwQ3WrVZvIzIebByyqIBAin%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMfSU3lPJiKJ%2BKXFMKKtwD%2BVAkogfjqlBvWsGiSQUv9GGCHfiMw7zriwGUCOKLs6OwNJjUOJIptNr%2FhVyQy36btlAG2iAejXqopsMdgMpB8qJt2eWuHYjMOfzFwKiD6Bdx5KzUcKbmvuShMlhHxKbOQHbOKz58w2xfjJp02TVkJKU3pr6%2FTaZMUc47wPC3lp7KnYs7%2BipHCyZXsiHcNlK3qPMapSAmGr5TdvzZZkK1V6o2lC1alwwxTbm8Fd0Sz%2FMd4tvPNF%2BKiQGkLdwyb0hIojyxtZGJe5hXPS9ffI%2Bs7zlqPJBddWRK6o8WJyDJDQ90m0RWOyCiBc1suFBrxwx4NgPoaSsrCZPQnnjM%2B5N4wTHsjSmMCLpDio2FMxo4aAhpRTucwHkC63U69OV4gFaBFWcT16FdXYEvcULS91ucYCQAoSXMfyuM20pR%2BMFEHPzTj%2BgOQ6n7Ni%2Bg1wXzMTlv9TG7xlFgjMHuNHeCtE%2BNHbJdiGLo1JlZy9mUevXnofcA0i6KYhtMxL4UE9wvUhgLEcqIPuXNW5%2BG9PZPxY1uDIUnL7vEvDz%2F7orWXQmEc%2FGnC%2BukTBjdLn31Uop%2BRq1I27PR2DZfnzC7oSmX9VVVMiZKsm4sEHhlK08R%2B%2FRn5CT%2FK0uh4eq%2FA2cnoRUwg%2F6NzgY6pgEyBXHs0EtETHVpDQKDaklnzgkyIxBZfhOfz%2BsI8WWqrcSGeKSlXYJVG3xZhRON52YjfAUnOqx%2BvtmFSmMiFgRRgwzBquYy7y%2Fdte3cL7m6UA%2FGLRPZE5Z%2BYRIlX2DrX0DeO9TW2LfDRk5ASclhOsmKjIGZiVg2uDtTKRa7484F9EMGRt4HsYILqH3cQjQ5a0X2a1P%2FyQVq0ctjvkolR7Bzlz8ugsHY&X-Amz-Signature=9e384563ded343ccfdbb4823109ba4c501d98345f8bed245a039b75e57d2632b&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4664OHVT4VU%2F20260325%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260325T065106Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEN%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIChfG8emYP%2BOHj2B1ms9SPT05qXbVMDOlLGYB%2FXzfevQAiAU3haVqvXru6uieloMqrJlXVjghAwQ3WrVZvIzIebByyqIBAin%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMfSU3lPJiKJ%2BKXFMKKtwD%2BVAkogfjqlBvWsGiSQUv9GGCHfiMw7zriwGUCOKLs6OwNJjUOJIptNr%2FhVyQy36btlAG2iAejXqopsMdgMpB8qJt2eWuHYjMOfzFwKiD6Bdx5KzUcKbmvuShMlhHxKbOQHbOKz58w2xfjJp02TVkJKU3pr6%2FTaZMUc47wPC3lp7KnYs7%2BipHCyZXsiHcNlK3qPMapSAmGr5TdvzZZkK1V6o2lC1alwwxTbm8Fd0Sz%2FMd4tvPNF%2BKiQGkLdwyb0hIojyxtZGJe5hXPS9ffI%2Bs7zlqPJBddWRK6o8WJyDJDQ90m0RWOyCiBc1suFBrxwx4NgPoaSsrCZPQnnjM%2B5N4wTHsjSmMCLpDio2FMxo4aAhpRTucwHkC63U69OV4gFaBFWcT16FdXYEvcULS91ucYCQAoSXMfyuM20pR%2BMFEHPzTj%2BgOQ6n7Ni%2Bg1wXzMTlv9TG7xlFgjMHuNHeCtE%2BNHbJdiGLo1JlZy9mUevXnofcA0i6KYhtMxL4UE9wvUhgLEcqIPuXNW5%2BG9PZPxY1uDIUnL7vEvDz%2F7orWXQmEc%2FGnC%2BukTBjdLn31Uop%2BRq1I27PR2DZfnzC7oSmX9VVVMiZKsm4sEHhlK08R%2B%2FRn5CT%2FK0uh4eq%2FA2cnoRUwg%2F6NzgY6pgEyBXHs0EtETHVpDQKDaklnzgkyIxBZfhOfz%2BsI8WWqrcSGeKSlXYJVG3xZhRON52YjfAUnOqx%2BvtmFSmMiFgRRgwzBquYy7y%2Fdte3cL7m6UA%2FGLRPZE5Z%2BYRIlX2DrX0DeO9TW2LfDRk5ASclhOsmKjIGZiVg2uDtTKRa7484F9EMGRt4HsYILqH3cQjQ5a0X2a1P%2FyQVq0ctjvkolR7Bzlz8ugsHY&X-Amz-Signature=d90da75732d51dcb60dc274b6d7089ad48946fac9c46cc0b8237551013587b6a&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

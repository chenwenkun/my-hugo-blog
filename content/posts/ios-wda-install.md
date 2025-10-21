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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466SBRCBPQC%2F20251021%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251021T122205Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEFwaCXVzLXdlc3QtMiJGMEQCIEoqoSx8%2BaRltWM2kMZwyi4IZ12A2kkmw6olYyGZtmLJAiA%2BCooBpui%2FVA6pd5%2BcscrEZFKNwYW336KwUGNSiJWooir%2FAwgVEAAaDDYzNzQyMzE4MzgwNSIMly2B0FXzYFloIeM2KtwDAGLMAHO%2FWMxG38lDv9tXCqjwtIKA48tzE%2FWRFkAs6%2FVOdTn876b2%2BUwYQ0kkvDo0WZ01PsNpEY2wjy6kbF%2B%2BsGvEADaJKgePKah4iv2EQb8xSJl325EbKBgw6676ExlzlimKWL82lA6POOdoeTD54BKk5QD1u8VOrugWvNdkcFUgyEEqpL0wC1DMfRKYRK9p6fSDzujtTQo31YbcjaqqEGCSLXY6sg4OpxjAmqektanX1hXe5AxFm3a4hKMmQKxIFceLSN7U2L2nQXsH5EnepsUE9woAqMFJDevzjBJSVpC13QzcP0BDDbb7%2F%2FpJAAxKMEQ3ZeHEWK3FLC7nhwt4xdVsYIQuu%2FukZiEr%2BHtraPB9VdKHrl4kRFxoC32KsWRjp2I7S1l%2BFSnnimGfPsSHPeHR5B4IZRMwgNTK8qRG%2BJSlKRYESap4tWC21G9nGOCNDNqVpGVGZkF1gjL8uTX714Jc%2Fz8nJ7YaG0hVwOp8yqJti2ns6MwMOnFY%2B7aQGpeZo2Kz%2FjVPTP6k5pageJwQ9WPh6CjagEKdE8%2BI9vd4TxdJZYcDzXbsePzvgZS6DHFrGP%2BAcHslGGFEB9ddfTP5pD1T%2FbhqLXibtsKVq0aNEdD4FUi7vdNHN4L3oT0wl%2B3dxwY6pgEtAHyO4GcHaA4wOZNax7smq0G35pJDh2gONR3cppsGdoNvBs0Xgf5TeOT3Jvb7A1XdauIPS4CxvFVBCmHHgx56CKHusly2U%2Be6n4X29lsRkStW0oKHqpxJH%2Fl8XDrV08aZ4g%2FgGtRd5H47uj4aCDdaU9wGF9QAdH2jfZf1vVQ1CztbNoybZisIsUDyPoC5lAgnftlCg0XKr9g6v0B2zf5Nu%2B3NqrHq&X-Amz-Signature=5fca6b4ff2b6b4cf5e4a255161c0c2e18d03b832faedd12b28ad7bd7ed25ab8e&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466SBRCBPQC%2F20251021%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251021T122204Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEFwaCXVzLXdlc3QtMiJGMEQCIEoqoSx8%2BaRltWM2kMZwyi4IZ12A2kkmw6olYyGZtmLJAiA%2BCooBpui%2FVA6pd5%2BcscrEZFKNwYW336KwUGNSiJWooir%2FAwgVEAAaDDYzNzQyMzE4MzgwNSIMly2B0FXzYFloIeM2KtwDAGLMAHO%2FWMxG38lDv9tXCqjwtIKA48tzE%2FWRFkAs6%2FVOdTn876b2%2BUwYQ0kkvDo0WZ01PsNpEY2wjy6kbF%2B%2BsGvEADaJKgePKah4iv2EQb8xSJl325EbKBgw6676ExlzlimKWL82lA6POOdoeTD54BKk5QD1u8VOrugWvNdkcFUgyEEqpL0wC1DMfRKYRK9p6fSDzujtTQo31YbcjaqqEGCSLXY6sg4OpxjAmqektanX1hXe5AxFm3a4hKMmQKxIFceLSN7U2L2nQXsH5EnepsUE9woAqMFJDevzjBJSVpC13QzcP0BDDbb7%2F%2FpJAAxKMEQ3ZeHEWK3FLC7nhwt4xdVsYIQuu%2FukZiEr%2BHtraPB9VdKHrl4kRFxoC32KsWRjp2I7S1l%2BFSnnimGfPsSHPeHR5B4IZRMwgNTK8qRG%2BJSlKRYESap4tWC21G9nGOCNDNqVpGVGZkF1gjL8uTX714Jc%2Fz8nJ7YaG0hVwOp8yqJti2ns6MwMOnFY%2B7aQGpeZo2Kz%2FjVPTP6k5pageJwQ9WPh6CjagEKdE8%2BI9vd4TxdJZYcDzXbsePzvgZS6DHFrGP%2BAcHslGGFEB9ddfTP5pD1T%2FbhqLXibtsKVq0aNEdD4FUi7vdNHN4L3oT0wl%2B3dxwY6pgEtAHyO4GcHaA4wOZNax7smq0G35pJDh2gONR3cppsGdoNvBs0Xgf5TeOT3Jvb7A1XdauIPS4CxvFVBCmHHgx56CKHusly2U%2Be6n4X29lsRkStW0oKHqpxJH%2Fl8XDrV08aZ4g%2FgGtRd5H47uj4aCDdaU9wGF9QAdH2jfZf1vVQ1CztbNoybZisIsUDyPoC5lAgnftlCg0XKr9g6v0B2zf5Nu%2B3NqrHq&X-Amz-Signature=be5b6a85f6ec681f565b236b2e95fc67a4db5d97eacd5daa643754a1eab747b8&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

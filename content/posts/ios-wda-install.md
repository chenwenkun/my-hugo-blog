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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466QKV7COKP%2F20251006%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251006T122100Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEPP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQCPk02jjGeRiXRktUKQrd350FeLHYxqRG0yrcD6EfnGEQIgBhC9MVf5PzQ%2FtAga5Lj590DpOYsrrNg8JHUKMli2v5kqiAQIjP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDOv0V1uMLHH8REXxvyrcA8wEGq8vuFMGaQ9RVIW%2B9as27UQ4a4yi43TMHAT%2FgXWCOIe8179gw%2ByH13zABrLXNDFUWlBdbCAQbUADBzaJBViOFiXAaZCFDtAKMxZFEBBF%2F9Gg%2FrBIr6IXKHNF7gYVjVg%2BDeWvHLOoxBgOIbCJsgU%2Bh%2B%2F8I8TSrl7DehvORtxAwmMP7caaK67EBqCxweFxVyyBCxB9RimUM8p91RVSOWtlwadY5IDXuFTBmyxUqg1j0xF1FYINM4eUQMOU8x6fOe4I%2FStw26E%2BBwvZMB2b1ju6l5cceP%2F%2FOABD26ZMaeJNW9qvov41O5pEtQlbLHV7fAfapeOoEoCPDs62gVbzeyLc7YTagcHTzWonsVnd6Vmeb19FTYS%2BCK62bx%2F4%2BvfiVsRGarvnrGJImkWQZ5fVQua%2FI1oU7DaWG0F8WtfKNapGsYltXiRDIZalB0isli%2FzSDGgF1MI76OXDZT62VeXjBssef5sdvX1546Kr6PBoz7gYLkFse0RGEsoTl4Xs3EAYu9IZrj6WpmYSDQ65CCOKB81ZTN5APWSIzPGKo2gd6kNHJ6EpudqNLfueFnnj1hIR1xfuUioQc%2FZr%2BFmFX%2BlqdZqeu67%2F2elNK%2BFHRVHf4XzTvBPm7UJSqxjlPHUMJvEjscGOqUBDGwY%2F4LfYT7wv8CpjT5Rk1f3ezBLceyFgbJl0knwQnOSDUyc7E6kBogVfVk90PtQlOG%2BScGO6KOqviENGNfRLaOAa6vskVegZ8KLX6GweeYiOW606QQ6p2C1NhdB7Cax8dpZl%2B4mhl7kBB3IfE99yPNIKCPI5TjnUGcFyJBSPQy2yeXiIFCCz9OsnsIWSAwONxoYts7Ki4FsKGXTZJH4gZQzxXhz&X-Amz-Signature=dc796322318485678b7a63d8af0529a55ed2df897ec98022ddf9e5be833d9c8e&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466QKV7COKP%2F20251006%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251006T122100Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEPP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQCPk02jjGeRiXRktUKQrd350FeLHYxqRG0yrcD6EfnGEQIgBhC9MVf5PzQ%2FtAga5Lj590DpOYsrrNg8JHUKMli2v5kqiAQIjP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDOv0V1uMLHH8REXxvyrcA8wEGq8vuFMGaQ9RVIW%2B9as27UQ4a4yi43TMHAT%2FgXWCOIe8179gw%2ByH13zABrLXNDFUWlBdbCAQbUADBzaJBViOFiXAaZCFDtAKMxZFEBBF%2F9Gg%2FrBIr6IXKHNF7gYVjVg%2BDeWvHLOoxBgOIbCJsgU%2Bh%2B%2F8I8TSrl7DehvORtxAwmMP7caaK67EBqCxweFxVyyBCxB9RimUM8p91RVSOWtlwadY5IDXuFTBmyxUqg1j0xF1FYINM4eUQMOU8x6fOe4I%2FStw26E%2BBwvZMB2b1ju6l5cceP%2F%2FOABD26ZMaeJNW9qvov41O5pEtQlbLHV7fAfapeOoEoCPDs62gVbzeyLc7YTagcHTzWonsVnd6Vmeb19FTYS%2BCK62bx%2F4%2BvfiVsRGarvnrGJImkWQZ5fVQua%2FI1oU7DaWG0F8WtfKNapGsYltXiRDIZalB0isli%2FzSDGgF1MI76OXDZT62VeXjBssef5sdvX1546Kr6PBoz7gYLkFse0RGEsoTl4Xs3EAYu9IZrj6WpmYSDQ65CCOKB81ZTN5APWSIzPGKo2gd6kNHJ6EpudqNLfueFnnj1hIR1xfuUioQc%2FZr%2BFmFX%2BlqdZqeu67%2F2elNK%2BFHRVHf4XzTvBPm7UJSqxjlPHUMJvEjscGOqUBDGwY%2F4LfYT7wv8CpjT5Rk1f3ezBLceyFgbJl0knwQnOSDUyc7E6kBogVfVk90PtQlOG%2BScGO6KOqviENGNfRLaOAa6vskVegZ8KLX6GweeYiOW606QQ6p2C1NhdB7Cax8dpZl%2B4mhl7kBB3IfE99yPNIKCPI5TjnUGcFyJBSPQy2yeXiIFCCz9OsnsIWSAwONxoYts7Ki4FsKGXTZJH4gZQzxXhz&X-Amz-Signature=4e33dbca1fa77e980bd83b318963f420e89e0b9b6debd48d38bf6434abc34ba9&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

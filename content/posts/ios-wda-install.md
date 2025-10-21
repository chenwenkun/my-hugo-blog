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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466RW62BMNZ%2F20251021%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251021T181516Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEGIaCXVzLXdlc3QtMiJGMEQCIDCPWP9b3eszY%2FrlW6Gnon4KmeGRzgVE39YVvfBsKeWxAiADGk8ab55B3t7xrq5yhAC%2Bw%2BNsrVvgfNMjZ4f9hGtGGSr%2FAwgbEAAaDDYzNzQyMzE4MzgwNSIMWeWlCx5ft5SPLAHoKtwD9jkE8caJQD0sLcTYaBdCm%2BEyqbwn0%2FqGFoXH0VVIRhsuNIq4Whw6Z1lJsVMOjL35dK1ofDITUViifd186P3bQkaGyjXa0EHp5bgbLLzCWHFdgI8B4PakFbYR4O%2BE1xVTHBEIF5pfI4Y4NymKzGckHw1KpIbbYJ%2Bn4abUg8rOxrz5nV5G%2F6NSDJvzn%2FgEzReMfNuejvA1nuVdFf%2F9GWus%2Bpv2b0IEUGeZMOr5LG1fhww0iNU7il243abdP8oTgVmdsQSQAVCJ1SXYQciFfawzL5qdLxhkRPxe4FdHiXI%2BKQfcJB8Jl2fDHlfQUYYSTu0Xv6DEvM8vQwhQXsXhdiBGKe%2Fc5tXCzUkAcaEFcoRWbjYQD%2FPzDbeYaaac2PRDhUPCS6zoyicz3z8Wp06XK%2F99S3cFvVyRwNJNmfgNLOZass%2F5nFR4712U7baHn%2BoP2p35lqqmBSeHwYhU7sfxLwISe8%2Bgu4JKtRamn%2FvSTQIrUs%2F3cH1tkPDP1%2FtjffE2bJwjlWs8nrXRpoB8%2Bn%2BxnUcRzgtUYMX9nOx0L5LW7jEK9WBJBULXprsIxNrpkPuXTseO3Uy4tq38sH8bHzNBF6hWRmpyAauGFCfzdD1H%2BXzTWQkhayQSs3zy7xb2vFEwhIrfxwY6pgFcZjRFuMHJXVy0cq8qIwlHLYe51%2F2%2BCOlJDgkqL7IUEwzXwQajkkdyDbXj%2BEij84dQWiWhPzGCsrXDCifXrdrM%2BA63%2BI3tjZjmTRnPLLlfSBHNoSKQay75XqVTxEJ8bK5YJDVWSwefRrgwW7ujyeJm9E52uThRttBIqjrroptt%2BVRPY3jO4YHqUrWqm2ozPtCciBMRxUlBbBciasQdXLeC3%2BRbxqFM&X-Amz-Signature=f08847f7316ff97e12825b98c90f669ff0229ad0c077dc193f4bc723fc8b717a&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466RW62BMNZ%2F20251021%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251021T181516Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEGIaCXVzLXdlc3QtMiJGMEQCIDCPWP9b3eszY%2FrlW6Gnon4KmeGRzgVE39YVvfBsKeWxAiADGk8ab55B3t7xrq5yhAC%2Bw%2BNsrVvgfNMjZ4f9hGtGGSr%2FAwgbEAAaDDYzNzQyMzE4MzgwNSIMWeWlCx5ft5SPLAHoKtwD9jkE8caJQD0sLcTYaBdCm%2BEyqbwn0%2FqGFoXH0VVIRhsuNIq4Whw6Z1lJsVMOjL35dK1ofDITUViifd186P3bQkaGyjXa0EHp5bgbLLzCWHFdgI8B4PakFbYR4O%2BE1xVTHBEIF5pfI4Y4NymKzGckHw1KpIbbYJ%2Bn4abUg8rOxrz5nV5G%2F6NSDJvzn%2FgEzReMfNuejvA1nuVdFf%2F9GWus%2Bpv2b0IEUGeZMOr5LG1fhww0iNU7il243abdP8oTgVmdsQSQAVCJ1SXYQciFfawzL5qdLxhkRPxe4FdHiXI%2BKQfcJB8Jl2fDHlfQUYYSTu0Xv6DEvM8vQwhQXsXhdiBGKe%2Fc5tXCzUkAcaEFcoRWbjYQD%2FPzDbeYaaac2PRDhUPCS6zoyicz3z8Wp06XK%2F99S3cFvVyRwNJNmfgNLOZass%2F5nFR4712U7baHn%2BoP2p35lqqmBSeHwYhU7sfxLwISe8%2Bgu4JKtRamn%2FvSTQIrUs%2F3cH1tkPDP1%2FtjffE2bJwjlWs8nrXRpoB8%2Bn%2BxnUcRzgtUYMX9nOx0L5LW7jEK9WBJBULXprsIxNrpkPuXTseO3Uy4tq38sH8bHzNBF6hWRmpyAauGFCfzdD1H%2BXzTWQkhayQSs3zy7xb2vFEwhIrfxwY6pgFcZjRFuMHJXVy0cq8qIwlHLYe51%2F2%2BCOlJDgkqL7IUEwzXwQajkkdyDbXj%2BEij84dQWiWhPzGCsrXDCifXrdrM%2BA63%2BI3tjZjmTRnPLLlfSBHNoSKQay75XqVTxEJ8bK5YJDVWSwefRrgwW7ujyeJm9E52uThRttBIqjrroptt%2BVRPY3jO4YHqUrWqm2ozPtCciBMRxUlBbBciasQdXLeC3%2BRbxqFM&X-Amz-Signature=736f334b75033296652f17c811ed4a86eaa769bd6995ae31f51967aef4f63f9a&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

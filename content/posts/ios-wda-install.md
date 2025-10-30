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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466XPFB7IVQ%2F20251030%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251030T061659Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEC0aCXVzLXdlc3QtMiJHMEUCIQC8bhn0h%2BwM4HhICMLbMHOaHu9nmChyfrvv21092skGiAIgC868l5GHcKHG6e35LfRl%2B7LN51dWAKpr1vcWRCZqOGMqiAQI5v%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDP69ukQc%2BLACxVVTECrcA92zvDqInWjOkE%2B%2B1Sk5M%2F1QTt9s9v9gw%2BicjeMPIz%2F%2B%2FsRc3Q%2Fkd5i2ID4cTaUqluyIgcnzh5zeYAXY%2BcGRiUZxkypzCD7cwXtCERpsQ0rGBAA2yFf1ron8HTPbK9Y4A0O5izs%2Bssrlgp2YXM5smWcrLpbQK%2BqZeUanWEqhO9B2lAwcveWfd23VhskP1Ky7O1pzIoMk9HlVSYtQ0O9UWJ1vMuU%2Bifc7YLJPfyKEDKKDKJUpeLhcKc6w%2FYjVI0fDH5NRiODkJT0cfC%2BVroExr59u%2B2hG%2FTZqDh0Ki%2FgUa0iaexoSEAxQ3eR2V538Zvy3moF6eWeou%2BgpF2r8hQrbA4y2h6wv0Gd63ku%2Bj8nq8vlyn9opaXbl%2Bj1wcEoEEGvF0kpZxq5SiYWjynFyt3EEaOubS2H3FXgvMn%2BLZnUOIQUviSNz4z8hXekkXSR22t%2Fhe44TUvB6BZHDy4tCbgG0Ws5QEi8wReS6B5H0S%2FCcZntnQlz1isxeTyCNSZEM7O7XZIR3d1lWLoIq%2BIQnwiCp3lcVrYwrTY8TGnvl1kGSBQq4lStWBqgeNSZbLBrpzjGtBv%2BSOgZp4SjW7fkj4sfHt9AkemrEv06awYxO1PpxemMt9E%2Fg2%2BibyjTacmkgMJzli8gGOqUBhzJdAWPSsyQcfYEFejlbZPGaZiCc26U3VnJtCPDQZHU%2BpgTl0s4KlYh5H%2B5tVtcqfEMbwX%2Bo9gRSKW0OF9gK4pJQQbmE0wNsdAGoR8qO%2BqXGX7nTgy1B3MuAO9tCRK2pi0duEAK4RS8V3SY2SyTROobwCNK%2FIS0xWALyNfdY5A6kdS%2BXfsxosMEKHo2ocb8et6GsyZ1cMLZg9Y4p1G6Jrzy6NMpA&X-Amz-Signature=f7fd4e9ba9439dfdd0b8b659d8a4b22a7975ec4212434390e071319ddfdce5d5&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466XPFB7IVQ%2F20251030%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251030T061659Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEC0aCXVzLXdlc3QtMiJHMEUCIQC8bhn0h%2BwM4HhICMLbMHOaHu9nmChyfrvv21092skGiAIgC868l5GHcKHG6e35LfRl%2B7LN51dWAKpr1vcWRCZqOGMqiAQI5v%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDP69ukQc%2BLACxVVTECrcA92zvDqInWjOkE%2B%2B1Sk5M%2F1QTt9s9v9gw%2BicjeMPIz%2F%2B%2FsRc3Q%2Fkd5i2ID4cTaUqluyIgcnzh5zeYAXY%2BcGRiUZxkypzCD7cwXtCERpsQ0rGBAA2yFf1ron8HTPbK9Y4A0O5izs%2Bssrlgp2YXM5smWcrLpbQK%2BqZeUanWEqhO9B2lAwcveWfd23VhskP1Ky7O1pzIoMk9HlVSYtQ0O9UWJ1vMuU%2Bifc7YLJPfyKEDKKDKJUpeLhcKc6w%2FYjVI0fDH5NRiODkJT0cfC%2BVroExr59u%2B2hG%2FTZqDh0Ki%2FgUa0iaexoSEAxQ3eR2V538Zvy3moF6eWeou%2BgpF2r8hQrbA4y2h6wv0Gd63ku%2Bj8nq8vlyn9opaXbl%2Bj1wcEoEEGvF0kpZxq5SiYWjynFyt3EEaOubS2H3FXgvMn%2BLZnUOIQUviSNz4z8hXekkXSR22t%2Fhe44TUvB6BZHDy4tCbgG0Ws5QEi8wReS6B5H0S%2FCcZntnQlz1isxeTyCNSZEM7O7XZIR3d1lWLoIq%2BIQnwiCp3lcVrYwrTY8TGnvl1kGSBQq4lStWBqgeNSZbLBrpzjGtBv%2BSOgZp4SjW7fkj4sfHt9AkemrEv06awYxO1PpxemMt9E%2Fg2%2BibyjTacmkgMJzli8gGOqUBhzJdAWPSsyQcfYEFejlbZPGaZiCc26U3VnJtCPDQZHU%2BpgTl0s4KlYh5H%2B5tVtcqfEMbwX%2Bo9gRSKW0OF9gK4pJQQbmE0wNsdAGoR8qO%2BqXGX7nTgy1B3MuAO9tCRK2pi0duEAK4RS8V3SY2SyTROobwCNK%2FIS0xWALyNfdY5A6kdS%2BXfsxosMEKHo2ocb8et6GsyZ1cMLZg9Y4p1G6Jrzy6NMpA&X-Amz-Signature=8498e8ad7b8ee35053a93fed9ea7ee4529ec2c318b4b9529238c6eed4cbd9bbb&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

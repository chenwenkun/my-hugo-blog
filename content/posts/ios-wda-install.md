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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466TTLVXS4Y%2F20260616%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260616T203610Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjELT%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQCttSwZ7dqAhoxjAphMUfqAIQWqKNoX%2FarpTwzPDVlOLQIgP0y3aC0Hmdkr5MP%2Be8vJbmLzxwuMbRVRWObWefwfo5oq%2FwMIfRAAGgw2Mzc0MjMxODM4MDUiDOzhbMsGOoKt9g4gBCrcA6m85vRmIjPuqFNi9ci8UyIfkm4l1B3njQXY%2FrDeroJPDdSdkcWWfMfyoEOIUIDgJ7uG9Bb%2BQo9rPZr9FaDwEUW7MoT2dusOOGIiAg0WJrlZBZlOhL2m46e5GWNjioPoYDpfGUilzEMZUM55SYZN%2Fx3%2B2bdDqxhbTIdTLIwsZCEv5X%2FMxh8Zf0O7p19SWW%2B%2FmyVzOGalvj9hxOLiXHkog24UFcOjKPn7FGSHK%2FCseFibe8Qk%2BvU1fFA9DCjq7m5sZR8W%2FlXveYt3AB2ePjrGn4Dick5mtpGOgofM6QDoyrNA6ed5ulhMfRyRPROslB1PVTkl3V9Jqd0sjnzyM2WHLjS4KuwkC0zhCcqemhC69f70IffK1xLB2328KZSPLQ4gPLojadEO5CAi8Nai5nJpWNCKNeOFfVPCu2gevZK3S6Y6mOPckriClXZv5xpGeOnfd8dnjDZ0RJ84jhjfcWOBSyyu50KG%2FvhkhEaGZmUg1XAX9jO8c5u3jwRNFrWlgsEINgQaq9REpa7GueSKzBnjyjPL1oMORt9d04s%2B7SxYtqqsiOZha%2FWGA9iiq0n6ybX99WiV%2B%2Fryf%2BBGz478aNEEkr2pCSC64S0So8TpBOjRkG2Gvzd1GY1vJk%2FXrVQaMN3TxtEGOqUB%2BSAkZMh2RORGbcJ5Ob12nmpCQz5xOX2g5NKtdAUy766mAhwkdwE63vm%2FZryx0bKKvyH3Si2ok6CPIxhgFvEq90UOfNS9H500i562DYiLOOJzNopq76WgMJqfXRtRkSuH7R8%2FOIoADow7DEYOe9whtkC%2BszIUW6bdW9E4EZ77nuKwzyQwGY89%2BP6aluZakidwZSVwTQrK8DOAN3wGeoPN1XjKdK9M&X-Amz-Signature=47ea8749ba7bd95e190a3b26e987e9697eea1ef614665da9cb35f58fb4c6593f&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466TTLVXS4Y%2F20260616%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260616T203610Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjELT%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQCttSwZ7dqAhoxjAphMUfqAIQWqKNoX%2FarpTwzPDVlOLQIgP0y3aC0Hmdkr5MP%2Be8vJbmLzxwuMbRVRWObWefwfo5oq%2FwMIfRAAGgw2Mzc0MjMxODM4MDUiDOzhbMsGOoKt9g4gBCrcA6m85vRmIjPuqFNi9ci8UyIfkm4l1B3njQXY%2FrDeroJPDdSdkcWWfMfyoEOIUIDgJ7uG9Bb%2BQo9rPZr9FaDwEUW7MoT2dusOOGIiAg0WJrlZBZlOhL2m46e5GWNjioPoYDpfGUilzEMZUM55SYZN%2Fx3%2B2bdDqxhbTIdTLIwsZCEv5X%2FMxh8Zf0O7p19SWW%2B%2FmyVzOGalvj9hxOLiXHkog24UFcOjKPn7FGSHK%2FCseFibe8Qk%2BvU1fFA9DCjq7m5sZR8W%2FlXveYt3AB2ePjrGn4Dick5mtpGOgofM6QDoyrNA6ed5ulhMfRyRPROslB1PVTkl3V9Jqd0sjnzyM2WHLjS4KuwkC0zhCcqemhC69f70IffK1xLB2328KZSPLQ4gPLojadEO5CAi8Nai5nJpWNCKNeOFfVPCu2gevZK3S6Y6mOPckriClXZv5xpGeOnfd8dnjDZ0RJ84jhjfcWOBSyyu50KG%2FvhkhEaGZmUg1XAX9jO8c5u3jwRNFrWlgsEINgQaq9REpa7GueSKzBnjyjPL1oMORt9d04s%2B7SxYtqqsiOZha%2FWGA9iiq0n6ybX99WiV%2B%2Fryf%2BBGz478aNEEkr2pCSC64S0So8TpBOjRkG2Gvzd1GY1vJk%2FXrVQaMN3TxtEGOqUB%2BSAkZMh2RORGbcJ5Ob12nmpCQz5xOX2g5NKtdAUy766mAhwkdwE63vm%2FZryx0bKKvyH3Si2ok6CPIxhgFvEq90UOfNS9H500i562DYiLOOJzNopq76WgMJqfXRtRkSuH7R8%2FOIoADow7DEYOe9whtkC%2BszIUW6bdW9E4EZ77nuKwzyQwGY89%2BP6aluZakidwZSVwTQrK8DOAN3wGeoPN1XjKdK9M&X-Amz-Signature=f4d5cb1ee54edba4dbcaa7cf2e18cc9ab54e9a21f1e9c639772a9d5a95b67bfa&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

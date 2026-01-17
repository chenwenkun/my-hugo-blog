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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB46663DOSGRC%2F20260117%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260117T122055Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQDhWXn2f5vD8TghYDZM5W28EhwWxtElmX2fOqrWluWiDQIgGhTFxBFHr2PZR9o26rPMdCIxEzm1fndrsYFLRx7SyJ4q%2FwMIZBAAGgw2Mzc0MjMxODM4MDUiDHyplZRB9MmgUeYKhCrcAy9GTAN7n%2FIk5BIPVKWi70hjUO3QZskjhGeQT5BfJiBW6fK%2BQGXdBUyLS7tRSkoou2eQB85Mmhg1msYzSE2M51WKqkU5Ju9UWzOKJLXWq8DDBPbRpbzzpoYwFB%2B24ZXnjVmjqj8q7zH6QKWatdZBD%2FGCKg76gQRqpBE6ybg%2FoZDs2lJCgBpXCgzARXRCrGv6JZPpGplYqzP%2FVWyY67Xkl3CSXq4ZnVfa0wXGwQsHjgTtHjPuGGQg5pPrklqRD7C5DYQio5RoeWv2ZCLzgcfOLnPmaSs5UY2bGqWB557%2F%2FVSI7ZbcU3frqpX%2FW7MOpESoxbtyPNEAghrLX4LfTFT%2BhVGuPMRRTxjVl5ImrKtjJ2gdNNazpF0tfVuT40AR0tTvysh6ab7mbnmaYB3b2UrIKIXb4hFzXKB31xqwA0dhrUCKo%2FnhiGhQGusOftH17LTCx%2BBNps6lZpyEah72jit3UTnfe%2BQpzd7GAK67Zxcjeq7XowdutAWY4FDbZ3h%2F%2BFgBCuZS5eBkD7LjBZLbrQgcXD%2F8rP1%2FdhI92h2OB6F6NOy9RM505bPgAc9UirUHGoyWORKALWodhiYSK0ZeY0m%2Fiksf9Op7YkRgfXVLwQ9B5RUSvDcvMVTwOXBTvlvzMPfJrcsGOqUBEPa7wzz1lSEVQ5hN%2F7agjnngIBbZZcN%2Bp9HUcIc0%2BvsCEUo%2B7v4rbNgo0vpZnpSx2ERq7GTj2p5Shg2syc41NIBBtrb5cZmaKWjcoZBLAFxIogD6UN196kDjPPRXkH4F0%2FDO1eRxcmgnxxMs19l9RtmXhXooOCak7pMeWzijbMx4T7y%2Fl0yOgG6i1e%2BqShmSnbnQLSXkdxbOApAugZpQdeYuTmtL&X-Amz-Signature=3fe110e54bc03fa47ed5d3bcae1aa5ea3865cbca2be1171a3b332e7d2a009939&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB46663DOSGRC%2F20260117%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260117T122055Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQDhWXn2f5vD8TghYDZM5W28EhwWxtElmX2fOqrWluWiDQIgGhTFxBFHr2PZR9o26rPMdCIxEzm1fndrsYFLRx7SyJ4q%2FwMIZBAAGgw2Mzc0MjMxODM4MDUiDHyplZRB9MmgUeYKhCrcAy9GTAN7n%2FIk5BIPVKWi70hjUO3QZskjhGeQT5BfJiBW6fK%2BQGXdBUyLS7tRSkoou2eQB85Mmhg1msYzSE2M51WKqkU5Ju9UWzOKJLXWq8DDBPbRpbzzpoYwFB%2B24ZXnjVmjqj8q7zH6QKWatdZBD%2FGCKg76gQRqpBE6ybg%2FoZDs2lJCgBpXCgzARXRCrGv6JZPpGplYqzP%2FVWyY67Xkl3CSXq4ZnVfa0wXGwQsHjgTtHjPuGGQg5pPrklqRD7C5DYQio5RoeWv2ZCLzgcfOLnPmaSs5UY2bGqWB557%2F%2FVSI7ZbcU3frqpX%2FW7MOpESoxbtyPNEAghrLX4LfTFT%2BhVGuPMRRTxjVl5ImrKtjJ2gdNNazpF0tfVuT40AR0tTvysh6ab7mbnmaYB3b2UrIKIXb4hFzXKB31xqwA0dhrUCKo%2FnhiGhQGusOftH17LTCx%2BBNps6lZpyEah72jit3UTnfe%2BQpzd7GAK67Zxcjeq7XowdutAWY4FDbZ3h%2F%2BFgBCuZS5eBkD7LjBZLbrQgcXD%2F8rP1%2FdhI92h2OB6F6NOy9RM505bPgAc9UirUHGoyWORKALWodhiYSK0ZeY0m%2Fiksf9Op7YkRgfXVLwQ9B5RUSvDcvMVTwOXBTvlvzMPfJrcsGOqUBEPa7wzz1lSEVQ5hN%2F7agjnngIBbZZcN%2Bp9HUcIc0%2BvsCEUo%2B7v4rbNgo0vpZnpSx2ERq7GTj2p5Shg2syc41NIBBtrb5cZmaKWjcoZBLAFxIogD6UN196kDjPPRXkH4F0%2FDO1eRxcmgnxxMs19l9RtmXhXooOCak7pMeWzijbMx4T7y%2Fl0yOgG6i1e%2BqShmSnbnQLSXkdxbOApAugZpQdeYuTmtL&X-Amz-Signature=5dfeb4b3ea71ea776d51c6185a5722b47d63d9fe4ff15b7606473402ece7a7fc&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

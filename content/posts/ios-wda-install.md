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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466RBAOSIED%2F20251001%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251001T181533Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEIL%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIBMIufALBubWoKVlabN00TgmZWxxV65nlaki89ZsuYpZAiB1qhIDkemunqLalj2%2FA9c7WnjvcvoxyYvVCKpIED6P0Sr%2FAwgaEAAaDDYzNzQyMzE4MzgwNSIMejja9Jm5hGWwcFyVKtwDyiGE%2FdrlFRPCg7C7bxuQWQ%2FI2nM4VOCiBgJ%2B3iZMBuPY1VNPH6lUZwScFSLfOYAl%2FtdCz5kEeApRpw0%2FiBFAcIEaRCIB2FTT9YkjG5ZfKpQhSGW%2BBeK3l%2B7ycRXOo27LT30nhNRXPExnaNP3zwfPcrjNP5S%2BHYRHU0HVDj%2Fy9E1bIo6d2S1JEoQ%2B4ORr0AJvwffH4T%2FHfjPSxuj%2FNWLns8LCo1Xonrqzg7Tu0NAax1TRQx06KJ4igtDPoToy3gafyFCGs%2BpwXgRa%2Foml21TqAdpHpY199Pcb%2B8f4FVW2LWP%2BzmfPaTE2fJmJQaRboE3%2BLo0VmOJe7zLg%2Bjttq9FEs3J46sMSECGzwqezQdsLH8RR1PtG9QobNNdkH%2BYoIaspLV67exyDo%2FjnPgHkRnOpqOO%2Bh5QU3g2qThTUXby%2BWwQDrMUsBxiuVfyQTVpKqKK4Gnxx0HZjnAxFm9yXDq9cpDpItSkMLyZKy1Kyuk6gQ2lHkR%2FDEyNiK0cZCzklW%2BeygHTY0w5%2BngaDdX1GBcRMNH7S9qg1F2%2BpBMglGcBsCYJwXHDw%2BzXmHnQMWyHqvploZ3WZqNnH9e56c9GIiitLJ61xUrFfHycdiG3fi9WfTjrgUvIWoK7UeUOmdXEwqcf1xgY6pgHxZ47JI2SRoNnJ%2BtD8%2FNMbxRsKHwazbK3BL2X%2B5NXiQJQ4nY1XdxapUCRhVqjfFCD5mitY8BCIX%2BgC%2Fc8m4Xiu5%2FS0NIh6%2FBAxAcdyaFJXH7iszib1t3gPKOcWdcWVMOjWvelJPyTKd3BlKlRw6cz6V0YSQbCyjz5hkdEKaSLq3hnzVyNbx7ANoVtiFDPhcEvOTCTZJPhjeidkQlAYeUa9bNUFynee&X-Amz-Signature=7251cdd9013e72a7c168b98a1f5033c0d95224b69906d77f6ebd7511f887ee47&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466RBAOSIED%2F20251001%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251001T181533Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEIL%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIBMIufALBubWoKVlabN00TgmZWxxV65nlaki89ZsuYpZAiB1qhIDkemunqLalj2%2FA9c7WnjvcvoxyYvVCKpIED6P0Sr%2FAwgaEAAaDDYzNzQyMzE4MzgwNSIMejja9Jm5hGWwcFyVKtwDyiGE%2FdrlFRPCg7C7bxuQWQ%2FI2nM4VOCiBgJ%2B3iZMBuPY1VNPH6lUZwScFSLfOYAl%2FtdCz5kEeApRpw0%2FiBFAcIEaRCIB2FTT9YkjG5ZfKpQhSGW%2BBeK3l%2B7ycRXOo27LT30nhNRXPExnaNP3zwfPcrjNP5S%2BHYRHU0HVDj%2Fy9E1bIo6d2S1JEoQ%2B4ORr0AJvwffH4T%2FHfjPSxuj%2FNWLns8LCo1Xonrqzg7Tu0NAax1TRQx06KJ4igtDPoToy3gafyFCGs%2BpwXgRa%2Foml21TqAdpHpY199Pcb%2B8f4FVW2LWP%2BzmfPaTE2fJmJQaRboE3%2BLo0VmOJe7zLg%2Bjttq9FEs3J46sMSECGzwqezQdsLH8RR1PtG9QobNNdkH%2BYoIaspLV67exyDo%2FjnPgHkRnOpqOO%2Bh5QU3g2qThTUXby%2BWwQDrMUsBxiuVfyQTVpKqKK4Gnxx0HZjnAxFm9yXDq9cpDpItSkMLyZKy1Kyuk6gQ2lHkR%2FDEyNiK0cZCzklW%2BeygHTY0w5%2BngaDdX1GBcRMNH7S9qg1F2%2BpBMglGcBsCYJwXHDw%2BzXmHnQMWyHqvploZ3WZqNnH9e56c9GIiitLJ61xUrFfHycdiG3fi9WfTjrgUvIWoK7UeUOmdXEwqcf1xgY6pgHxZ47JI2SRoNnJ%2BtD8%2FNMbxRsKHwazbK3BL2X%2B5NXiQJQ4nY1XdxapUCRhVqjfFCD5mitY8BCIX%2BgC%2Fc8m4Xiu5%2FS0NIh6%2FBAxAcdyaFJXH7iszib1t3gPKOcWdcWVMOjWvelJPyTKd3BlKlRw6cz6V0YSQbCyjz5hkdEKaSLq3hnzVyNbx7ANoVtiFDPhcEvOTCTZJPhjeidkQlAYeUa9bNUFynee&X-Amz-Signature=e563bbda0c83709d757c28fc0b7f5fd2afc54ea28f1246db9d4bf0831f7b5b9b&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

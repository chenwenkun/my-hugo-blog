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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466QOUUEQU4%2F20260603%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260603T104124Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEHIaCXVzLXdlc3QtMiJHMEUCICGZvpjLPuglzx8utf3RKg6m6GM72JyDqsiFgQ95mSHNAiEA0McwqqO0oGVe5Y1NBH%2Bb9dlcDQP3uDOvjrJuHPg7ZO0q%2FwMIOhAAGgw2Mzc0MjMxODM4MDUiDLxyZe5gEQ1v4x09eCrcAyQzkFIrSDY1Sj5Dw0zLlr1jFNvwsi4gUpefCH5eiOv1B6zS%2BcqY%2BSzYg1PEDkSZTgTFs6w6m4Iq4%2Bqhep1f4hhxKkpDbI3fyVgyLKLkrqjOl4Fzp8LEQ1FTYE%2BBo3ZFmu2z%2F4BbZuP7dlX2Hr2oIbomYFyAAYlvnmgPygfvHYhl23HSAq7S20MkfoNp8QZsRnyPeu6p9X3kScbuO69pStSSEahW%2BoIjkaq%2BjWH90839KHFVKrcs7ainxyLkerp5zx7CRLCJwvt04v2E%2B8cKSjZEXdyS5yNtlmCCU%2Firr1pzGD5y0PofeAlF8VrWPUsRwrOeROkNMhrq5L7nwwHrRxKUXMiJBLludQHKJUKpprdQxhV1vyQp2oj%2BVqmorZIL%2Fnn3mdrv8jBulMbn25PbOhm3oKnMSzHwmyPRGNhrWvvym%2FoqVYw8FwvreUiFylbSeYAxmO6%2FusEwnZzE1YNeUDTq1uOYetmEJsPPOIdJHYmZePw9%2BgUc%2F5w80HsoDJsbqj5xXUY6RBLCwRE%2B57LSt6x03Fc3%2FyhMMUcaPt68wSwhBWPxav1JPbTwzPSNAGNCpyfCM4b1QDBJuBTEDYMz1o7TGldL685%2BbomTCHKeXx1pUkpn8FkABbG9JS5tMOLk%2F9AGOqUBQPln26ui25G42Q0EpJAaYo5Fhlf2kVpfT8zseSbdb2JWTBGXVvnjw7UY7k3xlLeE80eFFiQ%2BAV9lyIpzWBlByaUkrs1OmirZJMMX0IEEy4T1Oqtt8ic6N0BB2sxo4rlDcVIanTZTSxZXLzXnrgFZRfmjFWZ2LRgoBm6JMNyB2h5rbdpBjGali1SBFAevx%2BsmkjkTsyzXvbYfkdU%2FKUdFIdxFFBM8&X-Amz-Signature=d156629acc76863d27a0325e4017564fca4886d4d3f4e3f0f152f5267f8dfa96&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466QOUUEQU4%2F20260603%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260603T104124Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEHIaCXVzLXdlc3QtMiJHMEUCICGZvpjLPuglzx8utf3RKg6m6GM72JyDqsiFgQ95mSHNAiEA0McwqqO0oGVe5Y1NBH%2Bb9dlcDQP3uDOvjrJuHPg7ZO0q%2FwMIOhAAGgw2Mzc0MjMxODM4MDUiDLxyZe5gEQ1v4x09eCrcAyQzkFIrSDY1Sj5Dw0zLlr1jFNvwsi4gUpefCH5eiOv1B6zS%2BcqY%2BSzYg1PEDkSZTgTFs6w6m4Iq4%2Bqhep1f4hhxKkpDbI3fyVgyLKLkrqjOl4Fzp8LEQ1FTYE%2BBo3ZFmu2z%2F4BbZuP7dlX2Hr2oIbomYFyAAYlvnmgPygfvHYhl23HSAq7S20MkfoNp8QZsRnyPeu6p9X3kScbuO69pStSSEahW%2BoIjkaq%2BjWH90839KHFVKrcs7ainxyLkerp5zx7CRLCJwvt04v2E%2B8cKSjZEXdyS5yNtlmCCU%2Firr1pzGD5y0PofeAlF8VrWPUsRwrOeROkNMhrq5L7nwwHrRxKUXMiJBLludQHKJUKpprdQxhV1vyQp2oj%2BVqmorZIL%2Fnn3mdrv8jBulMbn25PbOhm3oKnMSzHwmyPRGNhrWvvym%2FoqVYw8FwvreUiFylbSeYAxmO6%2FusEwnZzE1YNeUDTq1uOYetmEJsPPOIdJHYmZePw9%2BgUc%2F5w80HsoDJsbqj5xXUY6RBLCwRE%2B57LSt6x03Fc3%2FyhMMUcaPt68wSwhBWPxav1JPbTwzPSNAGNCpyfCM4b1QDBJuBTEDYMz1o7TGldL685%2BbomTCHKeXx1pUkpn8FkABbG9JS5tMOLk%2F9AGOqUBQPln26ui25G42Q0EpJAaYo5Fhlf2kVpfT8zseSbdb2JWTBGXVvnjw7UY7k3xlLeE80eFFiQ%2BAV9lyIpzWBlByaUkrs1OmirZJMMX0IEEy4T1Oqtt8ic6N0BB2sxo4rlDcVIanTZTSxZXLzXnrgFZRfmjFWZ2LRgoBm6JMNyB2h5rbdpBjGali1SBFAevx%2BsmkjkTsyzXvbYfkdU%2FKUdFIdxFFBM8&X-Amz-Signature=864a0974613fa32d12ecc942f59a79f78df97050760aa37e3853bb3625367c7e&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

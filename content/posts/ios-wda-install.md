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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466QJ7NRG4C%2F20260424%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260424T183620Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjELv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCID8UKAvyaQw3LGNF7ZQKbQvZsgCJCbtV5fG46a0gFwEFAiEA1Z9%2BOevBEPwhYwRzl6VoJFMzyz1uWK2NttEsU%2BkC9DMqiAQIhP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDPLHVZxqFVCmZ1eAISrcA3AnEQNr%2FWIIItctxGovvuqgHPRGYyvBZ0UJnQ3oFopY11g2TgZoRlD3YCYbPpIQNbFDLoRjMloJXLgSr9cwcUgPXPGpsrFJEetV0LrsdX6e4FZ79jvjGz%2BnW2XKan%2BltGRzFPEeGp5%2FmT1htMBl5tEv7SOpaOQi7JLSPYmJ5Dk9A8JqAbdSPDlrFUK%2BJ74O%2FfG18dznMw4USpVbvb83EiBvIgmxBBf8BIEUDON4HVlleWVPLgoN1Z24PM%2BSlzJv8h38PzbvZYD%2BjguyL6OG3y42TVlMcjmPhvLQywZ%2BN%2FlrYCxndxOS2tdveblX82IHPxdDaLwUuUoIVy5UBG83PEfj5jMQBaoSW36o67Z81hsrkvrgmaVzwDk%2FgmbOMmiL3ff5YRI3CQWHyHgc6kieDpea96GAJsNT0Ibr%2F8%2Fi7AgDgt3tPtZNJN%2FaQZSst3h7lELcre%2BNg8vbo8NrhFx0Tk9kmictMsMkwnzSKhkTenLs25SdNiLU60neSB5ER1Jfx3G4Jpq0kVskDwz5cLaWRPF3q%2FO09Ww3WHYzCOp9rQ6klj7yftJH3TX5Y7OpvscISD6WI%2BswM0H4yktw4Egm57PrVyYBouN%2B4goMoQuxVj2QetNY%2BruuW83NHw4%2BMJnqrs8GOqUBR5yCWk6o3KNa6TxfgEC%2BBkSyeFJbNW%2FXwp6DYzmpE5ArasDwqJJziltgsrNZZKxqvC3YWGEsRdSTQko%2Fn%2FHpNZWy5oQKdnmZX0XzBpV63chw2wIbFVEo9oMwRoioy4nftrX08AVDvYuaFNj0110TxYDzG9knM6hkgyg%2Fyrl0G2R87CKe98a9%2FwDgSmvSuDOsNM3e2eBN0I5rc1gqbrO69QCJ1TGT&X-Amz-Signature=ccde83b1e7c22bf4b1df294f8a74d8571c0005f9842c6983badfb9b58e62dc95&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466QJ7NRG4C%2F20260424%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260424T183620Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjELv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCID8UKAvyaQw3LGNF7ZQKbQvZsgCJCbtV5fG46a0gFwEFAiEA1Z9%2BOevBEPwhYwRzl6VoJFMzyz1uWK2NttEsU%2BkC9DMqiAQIhP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDPLHVZxqFVCmZ1eAISrcA3AnEQNr%2FWIIItctxGovvuqgHPRGYyvBZ0UJnQ3oFopY11g2TgZoRlD3YCYbPpIQNbFDLoRjMloJXLgSr9cwcUgPXPGpsrFJEetV0LrsdX6e4FZ79jvjGz%2BnW2XKan%2BltGRzFPEeGp5%2FmT1htMBl5tEv7SOpaOQi7JLSPYmJ5Dk9A8JqAbdSPDlrFUK%2BJ74O%2FfG18dznMw4USpVbvb83EiBvIgmxBBf8BIEUDON4HVlleWVPLgoN1Z24PM%2BSlzJv8h38PzbvZYD%2BjguyL6OG3y42TVlMcjmPhvLQywZ%2BN%2FlrYCxndxOS2tdveblX82IHPxdDaLwUuUoIVy5UBG83PEfj5jMQBaoSW36o67Z81hsrkvrgmaVzwDk%2FgmbOMmiL3ff5YRI3CQWHyHgc6kieDpea96GAJsNT0Ibr%2F8%2Fi7AgDgt3tPtZNJN%2FaQZSst3h7lELcre%2BNg8vbo8NrhFx0Tk9kmictMsMkwnzSKhkTenLs25SdNiLU60neSB5ER1Jfx3G4Jpq0kVskDwz5cLaWRPF3q%2FO09Ww3WHYzCOp9rQ6klj7yftJH3TX5Y7OpvscISD6WI%2BswM0H4yktw4Egm57PrVyYBouN%2B4goMoQuxVj2QetNY%2BruuW83NHw4%2BMJnqrs8GOqUBR5yCWk6o3KNa6TxfgEC%2BBkSyeFJbNW%2FXwp6DYzmpE5ArasDwqJJziltgsrNZZKxqvC3YWGEsRdSTQko%2Fn%2FHpNZWy5oQKdnmZX0XzBpV63chw2wIbFVEo9oMwRoioy4nftrX08AVDvYuaFNj0110TxYDzG9knM6hkgyg%2Fyrl0G2R87CKe98a9%2FwDgSmvSuDOsNM3e2eBN0I5rc1gqbrO69QCJ1TGT&X-Amz-Signature=e6036a4c266eea196b408ac7de0d58764980edf808cfaf7f106f5561bde574ed&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

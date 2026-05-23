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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466UROF2MDU%2F20260523%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260523T185351Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEHEaCXVzLXdlc3QtMiJHMEUCIQDNMNwZL0PzbtUy%2BBp%2FwnMt5nzPYTTvhW6WPogRfLUHOQIgPjLlHfqBlxjus5sfsG2Sa5LGEtPX%2FCCsjPkG3ZmDLpsq%2FwMIOhAAGgw2Mzc0MjMxODM4MDUiDC6nuCP4r%2BGKxNbZcircA4tsi9H39MOyXMCoBKJ485Pt2Zuc7hUnqxn6mu7LIyInxoRqAB4%2FJylHqv5AlqiFJuKhPyXmBqsCQv8rjDsahessggpKwzj3bbHvFKYUEgj7hb0PO8EHzZ1Bodic%2FN%2B6WKrT0tlvrXi7vn8CKiF9sNgBUumpCFqTkgOG3BIYGn2Lg5qhr5NIJF4e8PLWNQHjWkV7LyVKBwzX%2FnaazupLEeQv7RQ%2Bartfh4HRhuO0Fnxo234nBYZi9kKws7aexWn4jYA8oSp7uD47bjCUnpTSpItPtya5pLEfIgSj9R7vj%2FsVTz4tv7OZNzTocxgPglIAdBCS4MWp6Azrw%2FKQmmNwq5VDKGKhAzjCyKoJJMzttgJ5wjm3usq86zvC0vcrUhvCDfculxxsJjsk4xZhKx91g7y2jwtVOMcNzqWd1apSb7jPgvGCAepxe7hXdPWfWJtz7t%2BLPFCaotAYUQqg%2BjjlDMClD8%2BJz9AsaK4al8S%2Fknvxy5MRCDMO6WiME0y00ozZnLhNtw8OuNe8xl4RHQQ5UR%2BKPS8nvwlrZ3YIbt0bi7Id0q7L%2FLTvmODnnEGrdpyzBGaR2ROp5pjw61aB%2Bd9YttoDapi0i7vBZbD6%2BQQPOlzt2hNrA6l2%2FgITiFWWMJGux9AGOqUBlp%2BgDfH6lUjsCdtOGJoLIUuNoahCMWNFWH%2FR6VBuAeSKg5SEnY9Y9ByFcQoqffzHIl0BVnSxowF0XHG0YV1TE2csYrLVUElLn%2BaGrB8x55xed1DR5w%2Fxv0zUx1L%2Fmsg2nmHX0Lag7UOiqH4WKAEn2P2XyOJlJ2Hz8QguZ1p9RWvD3T62b7tHUfaCUQbDndSXa14j6yzAIt%2BmhbiMeNdavGKnpr4E&X-Amz-Signature=11818e16590f332ab381e72145c4c0e3968c595045739fdbab6d1dfe029f836e&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466UROF2MDU%2F20260523%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260523T185351Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEHEaCXVzLXdlc3QtMiJHMEUCIQDNMNwZL0PzbtUy%2BBp%2FwnMt5nzPYTTvhW6WPogRfLUHOQIgPjLlHfqBlxjus5sfsG2Sa5LGEtPX%2FCCsjPkG3ZmDLpsq%2FwMIOhAAGgw2Mzc0MjMxODM4MDUiDC6nuCP4r%2BGKxNbZcircA4tsi9H39MOyXMCoBKJ485Pt2Zuc7hUnqxn6mu7LIyInxoRqAB4%2FJylHqv5AlqiFJuKhPyXmBqsCQv8rjDsahessggpKwzj3bbHvFKYUEgj7hb0PO8EHzZ1Bodic%2FN%2B6WKrT0tlvrXi7vn8CKiF9sNgBUumpCFqTkgOG3BIYGn2Lg5qhr5NIJF4e8PLWNQHjWkV7LyVKBwzX%2FnaazupLEeQv7RQ%2Bartfh4HRhuO0Fnxo234nBYZi9kKws7aexWn4jYA8oSp7uD47bjCUnpTSpItPtya5pLEfIgSj9R7vj%2FsVTz4tv7OZNzTocxgPglIAdBCS4MWp6Azrw%2FKQmmNwq5VDKGKhAzjCyKoJJMzttgJ5wjm3usq86zvC0vcrUhvCDfculxxsJjsk4xZhKx91g7y2jwtVOMcNzqWd1apSb7jPgvGCAepxe7hXdPWfWJtz7t%2BLPFCaotAYUQqg%2BjjlDMClD8%2BJz9AsaK4al8S%2Fknvxy5MRCDMO6WiME0y00ozZnLhNtw8OuNe8xl4RHQQ5UR%2BKPS8nvwlrZ3YIbt0bi7Id0q7L%2FLTvmODnnEGrdpyzBGaR2ROp5pjw61aB%2Bd9YttoDapi0i7vBZbD6%2BQQPOlzt2hNrA6l2%2FgITiFWWMJGux9AGOqUBlp%2BgDfH6lUjsCdtOGJoLIUuNoahCMWNFWH%2FR6VBuAeSKg5SEnY9Y9ByFcQoqffzHIl0BVnSxowF0XHG0YV1TE2csYrLVUElLn%2BaGrB8x55xed1DR5w%2Fxv0zUx1L%2Fmsg2nmHX0Lag7UOiqH4WKAEn2P2XyOJlJ2Hz8QguZ1p9RWvD3T62b7tHUfaCUQbDndSXa14j6yzAIt%2BmhbiMeNdavGKnpr4E&X-Amz-Signature=e698ff51011f1bccad9af37ff825830f645a0366714ccaaa76218ed08a94e9da&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

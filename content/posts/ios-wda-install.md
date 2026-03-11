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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466ZXGEAPYB%2F20260311%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260311T010622Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEIn%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIBcLjsAD3Cg4GH2zDnFaZyPj4C%2B3BBtzypdsvS9eAPNUAiBVACjshJGrTj4ZxY28TLb3G1xNq4wxEDDBMKmcLon0FSr%2FAwhSEAAaDDYzNzQyMzE4MzgwNSIMNuKumjqHLT5Xvl2LKtwDlazvxR9nKoqBWYfLrj68so03swL8%2BIb%2FtDRypC2HTUYZPWfE3z3Q6P13%2Fz1fTYNA4a2pdaUt%2BLSnSHHp3E2kmos%2BlDWrlPeMXIyz8kpVOdxb4ogHdisCcS9YcpoNoB5kCu0hFDlWfGnLLtTe72ftyDrBXrXxtQIK5IjrR0%2BQtzs%2FyTNt8tgLMcyBOf7NPWVlkIrQd4e%2BaFK4h7Pyb3Nb%2FiWZUQqNKlH%2BSexqrz%2B%2FDPNpwAqwUqCPl%2FkYqegUG2x%2FOQ%2BsS8iUr2zwtEkRpVNQJLhHlsJ%2Fih%2F5wOPqOowFpnIG3aPRtiD0%2Bpa6yGHq3BQ38uZw4WmTHF5N1suP20py0nWZuCaOw5pPtSikkR%2B3nUtdmUb1vhOx8WHOn4u0kaURC0%2Bu202MKWtEicx9wVj23bhx0mIzZBO4imJjOn2Abuma4fBFYSN74NZtu3tUD1ZPLlZbFmNu8Sm1I4wqsUR2SvK2mwjwWZDlcgEis%2F8R22GpppRNYDFlfiIHdxqV2PVbr9vBQCubpTJ%2Bti97TkIS%2BvcBowhICiQHXPXQL6KDAZuKglTnhy20F%2FCLDZg%2BD%2BDOtcbVefQ%2Fom%2Bo%2F7Qx7jRCquNPFYYdRcSAYrN%2BpDjbD4qhBwgl5ojsVR%2FyBjYwyvLCzQY6pgG%2FONnjZYCSsNDQPr7SusqWgmPhImExpqbcLGU8lki9mEDg4t1GJpI1vb0Dplc%2BK%2BrKG5qJqeAanu%2F5CqAphdrpHw4lq3DFqpk8CSbV6SGSWbmac%2FS%2BLAmEtra638bDexbtl4bjE5EWQXrLcn4pFO6nx5j5%2BUNFOy0ostJra580clzHdNXPbJlWmR8L41eK2%2FBZR2gfqNoCwbcpY6VDcvrbqZoAh3XO&X-Amz-Signature=0340a32409c743ff035b32425fe864bec85ed14dfd9ffa5c53c99310398cfc70&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466ZXGEAPYB%2F20260311%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260311T010622Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEIn%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIBcLjsAD3Cg4GH2zDnFaZyPj4C%2B3BBtzypdsvS9eAPNUAiBVACjshJGrTj4ZxY28TLb3G1xNq4wxEDDBMKmcLon0FSr%2FAwhSEAAaDDYzNzQyMzE4MzgwNSIMNuKumjqHLT5Xvl2LKtwDlazvxR9nKoqBWYfLrj68so03swL8%2BIb%2FtDRypC2HTUYZPWfE3z3Q6P13%2Fz1fTYNA4a2pdaUt%2BLSnSHHp3E2kmos%2BlDWrlPeMXIyz8kpVOdxb4ogHdisCcS9YcpoNoB5kCu0hFDlWfGnLLtTe72ftyDrBXrXxtQIK5IjrR0%2BQtzs%2FyTNt8tgLMcyBOf7NPWVlkIrQd4e%2BaFK4h7Pyb3Nb%2FiWZUQqNKlH%2BSexqrz%2B%2FDPNpwAqwUqCPl%2FkYqegUG2x%2FOQ%2BsS8iUr2zwtEkRpVNQJLhHlsJ%2Fih%2F5wOPqOowFpnIG3aPRtiD0%2Bpa6yGHq3BQ38uZw4WmTHF5N1suP20py0nWZuCaOw5pPtSikkR%2B3nUtdmUb1vhOx8WHOn4u0kaURC0%2Bu202MKWtEicx9wVj23bhx0mIzZBO4imJjOn2Abuma4fBFYSN74NZtu3tUD1ZPLlZbFmNu8Sm1I4wqsUR2SvK2mwjwWZDlcgEis%2F8R22GpppRNYDFlfiIHdxqV2PVbr9vBQCubpTJ%2Bti97TkIS%2BvcBowhICiQHXPXQL6KDAZuKglTnhy20F%2FCLDZg%2BD%2BDOtcbVefQ%2Fom%2Bo%2F7Qx7jRCquNPFYYdRcSAYrN%2BpDjbD4qhBwgl5ojsVR%2FyBjYwyvLCzQY6pgG%2FONnjZYCSsNDQPr7SusqWgmPhImExpqbcLGU8lki9mEDg4t1GJpI1vb0Dplc%2BK%2BrKG5qJqeAanu%2F5CqAphdrpHw4lq3DFqpk8CSbV6SGSWbmac%2FS%2BLAmEtra638bDexbtl4bjE5EWQXrLcn4pFO6nx5j5%2BUNFOy0ostJra580clzHdNXPbJlWmR8L41eK2%2FBZR2gfqNoCwbcpY6VDcvrbqZoAh3XO&X-Amz-Signature=ac2d714bc4386d7e5a8295297687739fbfe4e28b2e88c070a4f9cea3a701945a&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

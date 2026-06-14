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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466SXC5OX7O%2F20260614%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260614T091732Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEHgaCXVzLXdlc3QtMiJGMEQCICO5KzFcIrTkv9JvbE%2BwRf0krEo9B%2B2SGgImaV5CfkoYAiBGEyPs86zzwDRLok3qZ9x3G72BAvcmWt2uLozQk2EVUir%2FAwhBEAAaDDYzNzQyMzE4MzgwNSIMg2vyMvUT5wlRyl9pKtwDGeeZQep6EUa4KboHnONcRtlen4Tvhyqd3ceIvlDyE0s0E7sEi%2FlfZKR1uwjkkc%2BuakBIqzZcAgrUEPruOCg%2FVpi8BxOoslzu5jXENGDmaDf61StBI9XMqnBHGhB7BkjIZ4u2l5eWgzs2hZUGUKnDVTMkLTsUxwOaeepcFVn2hKandLp18POrutfERXJWDWO4G8TAxe6we2FgODgg93BWKfyjRItLyBWUI43U6FYsakrPq%2BRL871lfCjLs9rxYsLB%2FgiEW0JW5TVaumx5X7CVAwi9iX4nhAX3IIdg7%2BTEAmypOU29c4QEYw2bfprMwsYngNnercqn6zkL1fF5AUftf1opNR%2FN4cBtzvpncC1nBfgGXYxw63rWdHnbLbB7ki7zewM53mhtnSWE67we%2BkeHOCG24DYPD0h2Vs3XnJA6bO2%2B6X6KDKUqwng4jKlA%2BjomzlUvKy2WBnrNGRx5jMT6qknYb6B5xbwbrLl5y2GZw%2BNbRLPaKop43cY5uuTYQO8aAaTIqtnezEstCwZYT99GvoYjQrGkmonGwBLXSKA708sB%2FHzkS16R%2BR9M%2BN2KoBcXiFzXjLVSC0vXIJlBqL4zXdQDJfZ8ry2DZZT7FogQiogNeet%2FMt8URDSfBCIwscW50QY6pgHkmYvOPLyPiuz2L4yPXnWwPoubH8l936HYDR0wqzTjsfcTZidPQNgfS%2FYSrMDoy%2FRFEaLn9dQdTBM%2F5iz07Atw5sXBdBOEyD5%2F9mDKPHMEje%2BnpvMYTrQpo2YYv9P%2F22EPx%2BiWYJ6z1IK49IZmSGVxqTvAeZnFvo9mJ6gV5%2Be4i7cVNF%2FVBwYdCAFwO%2FjNqXmDsuJDegdc9UeizqhhLO7njKu8GMwM&X-Amz-Signature=a0d8cfcce875fc0c4b7e618506f0ae3a82fbfdc36161f668eaba87def58f7220&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466SXC5OX7O%2F20260614%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260614T091732Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEHgaCXVzLXdlc3QtMiJGMEQCICO5KzFcIrTkv9JvbE%2BwRf0krEo9B%2B2SGgImaV5CfkoYAiBGEyPs86zzwDRLok3qZ9x3G72BAvcmWt2uLozQk2EVUir%2FAwhBEAAaDDYzNzQyMzE4MzgwNSIMg2vyMvUT5wlRyl9pKtwDGeeZQep6EUa4KboHnONcRtlen4Tvhyqd3ceIvlDyE0s0E7sEi%2FlfZKR1uwjkkc%2BuakBIqzZcAgrUEPruOCg%2FVpi8BxOoslzu5jXENGDmaDf61StBI9XMqnBHGhB7BkjIZ4u2l5eWgzs2hZUGUKnDVTMkLTsUxwOaeepcFVn2hKandLp18POrutfERXJWDWO4G8TAxe6we2FgODgg93BWKfyjRItLyBWUI43U6FYsakrPq%2BRL871lfCjLs9rxYsLB%2FgiEW0JW5TVaumx5X7CVAwi9iX4nhAX3IIdg7%2BTEAmypOU29c4QEYw2bfprMwsYngNnercqn6zkL1fF5AUftf1opNR%2FN4cBtzvpncC1nBfgGXYxw63rWdHnbLbB7ki7zewM53mhtnSWE67we%2BkeHOCG24DYPD0h2Vs3XnJA6bO2%2B6X6KDKUqwng4jKlA%2BjomzlUvKy2WBnrNGRx5jMT6qknYb6B5xbwbrLl5y2GZw%2BNbRLPaKop43cY5uuTYQO8aAaTIqtnezEstCwZYT99GvoYjQrGkmonGwBLXSKA708sB%2FHzkS16R%2BR9M%2BN2KoBcXiFzXjLVSC0vXIJlBqL4zXdQDJfZ8ry2DZZT7FogQiogNeet%2FMt8URDSfBCIwscW50QY6pgHkmYvOPLyPiuz2L4yPXnWwPoubH8l936HYDR0wqzTjsfcTZidPQNgfS%2FYSrMDoy%2FRFEaLn9dQdTBM%2F5iz07Atw5sXBdBOEyD5%2F9mDKPHMEje%2BnpvMYTrQpo2YYv9P%2F22EPx%2BiWYJ6z1IK49IZmSGVxqTvAeZnFvo9mJ6gV5%2Be4i7cVNF%2FVBwYdCAFwO%2FjNqXmDsuJDegdc9UeizqhhLO7njKu8GMwM&X-Amz-Signature=6ae4eb71771effcf59fed064815bbf03842f3f3d21b96d5eb88abad7a080cf72&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

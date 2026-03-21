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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663GMD4V2B%2F20260321%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260321T182145Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEIr%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQDterUVq9mgXwRK1b1q45OBhuWeI3gzCZHEPuqLv7SLeAIhAMOjkgAnsDPlmRTZFpD5Mk4z5KA2RzNVTqbP1tgnilheKv8DCFMQABoMNjM3NDIzMTgzODA1IgyKJgtVgRaqCMbbV7oq3AMq%2BdpESg%2BJCLWdxzkf%2Bl6%2B6gAIs2qbV90NTRp44VBdocZ0m4oufppQMQ1s9LItJonHIO5yKHo3lPYknSHayaLF%2F5jv%2F33xaxdVcCHAw1m5m21tVUu7B3vAUTw4fzOwBcds8Jz7iDELtv%2BNMRdKeqVoqmFTya0Yo90Za2qGp0Ne%2BHiRj8buR%2FrHe9wSWflYSybPLQwZLzPq36X6En7o47PYRICmpNOAt%2BeH778PtfI%2FeLBk%2FdySdo55JSuwiIjsms1oyZA9CMn9le%2BxhxYn%2BkRVV9XlhJW0IDzZ4G1gLB1OZ%2FRao4qlWMFQxkWiXRO1H4Eaw0ZlG4A3LO4Y5AJ4N8clhJY3CQWQG9P4qEprW7JC4ojgJnb3iKU3eiHiUNT%2FcmqPQWTbNt1L1ZoIMn9NDP1Lyea3o6SF0aw%2BJgQC4EC8P%2BOZNXrkDDq2x6%2FbDF1vJBatyHhNcttA7iCOD%2FT%2BLKQwMKVX9Us61cpd6R%2B7HRBbMGz2t9JVs7cpBlQ8HwgcDPZDlRmg8Q8wwBdHk344nHvGBWMEkhirt3fJpefa5XzHN96h%2BmSYlbzzs9%2FOTa3Kos25AAe2Jpp8M3D6PU9mN%2BzeQtpTP6V5CyMQSbUlxr%2FWz7zvsqiInXnGWNRqHDD4vPvNBjqkAeqvlbADhUvrMv22mPK32BDmdy5tdh%2Fbok2jmFFfUB1WILRUjRwBZYt3IXKCF2eJZpXg5wFnA98tLDKxnjbnQXgUxp%2B5%2BeJvkLBf%2BaYXwaDiRfEfBUzYDsSVAEG4TWNSfhP%2B9vsCyQbyESfKnQOt%2ByphlfDxeOD%2BEV7uNnv0lpvKm%2BsxeVhl6jjq9NG%2BJXOJ9wKMaGOzwx5200HCHj3MLH8tzdSe&X-Amz-Signature=38e33e5fa981d63dcc344086515bb99a5a6d88cabafe9277ec8e8780309c108f&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663GMD4V2B%2F20260321%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260321T182145Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEIr%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQDterUVq9mgXwRK1b1q45OBhuWeI3gzCZHEPuqLv7SLeAIhAMOjkgAnsDPlmRTZFpD5Mk4z5KA2RzNVTqbP1tgnilheKv8DCFMQABoMNjM3NDIzMTgzODA1IgyKJgtVgRaqCMbbV7oq3AMq%2BdpESg%2BJCLWdxzkf%2Bl6%2B6gAIs2qbV90NTRp44VBdocZ0m4oufppQMQ1s9LItJonHIO5yKHo3lPYknSHayaLF%2F5jv%2F33xaxdVcCHAw1m5m21tVUu7B3vAUTw4fzOwBcds8Jz7iDELtv%2BNMRdKeqVoqmFTya0Yo90Za2qGp0Ne%2BHiRj8buR%2FrHe9wSWflYSybPLQwZLzPq36X6En7o47PYRICmpNOAt%2BeH778PtfI%2FeLBk%2FdySdo55JSuwiIjsms1oyZA9CMn9le%2BxhxYn%2BkRVV9XlhJW0IDzZ4G1gLB1OZ%2FRao4qlWMFQxkWiXRO1H4Eaw0ZlG4A3LO4Y5AJ4N8clhJY3CQWQG9P4qEprW7JC4ojgJnb3iKU3eiHiUNT%2FcmqPQWTbNt1L1ZoIMn9NDP1Lyea3o6SF0aw%2BJgQC4EC8P%2BOZNXrkDDq2x6%2FbDF1vJBatyHhNcttA7iCOD%2FT%2BLKQwMKVX9Us61cpd6R%2B7HRBbMGz2t9JVs7cpBlQ8HwgcDPZDlRmg8Q8wwBdHk344nHvGBWMEkhirt3fJpefa5XzHN96h%2BmSYlbzzs9%2FOTa3Kos25AAe2Jpp8M3D6PU9mN%2BzeQtpTP6V5CyMQSbUlxr%2FWz7zvsqiInXnGWNRqHDD4vPvNBjqkAeqvlbADhUvrMv22mPK32BDmdy5tdh%2Fbok2jmFFfUB1WILRUjRwBZYt3IXKCF2eJZpXg5wFnA98tLDKxnjbnQXgUxp%2B5%2BeJvkLBf%2BaYXwaDiRfEfBUzYDsSVAEG4TWNSfhP%2B9vsCyQbyESfKnQOt%2ByphlfDxeOD%2BEV7uNnv0lpvKm%2BsxeVhl6jjq9NG%2BJXOJ9wKMaGOzwx5200HCHj3MLH8tzdSe&X-Amz-Signature=008c561c5251781600a0b20356b2cce1aba164781d6f6aeb60915c66d912daae&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

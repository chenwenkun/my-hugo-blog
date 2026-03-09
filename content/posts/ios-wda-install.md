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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4664W3EM6BV%2F20260309%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260309T123635Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEGQaCXVzLXdlc3QtMiJIMEYCIQCJ78xLyfkTAjpMVdiqV96ieUsAB5G3Fy8J1J3se8yw%2BQIhAJ1uKdjqez6NLfdhy%2FcsKdwJwXPQlNIL9rxpRrWSXCcfKv8DCC0QABoMNjM3NDIzMTgzODA1IgxFoXDL6Q2lwoBaUnUq3AOHLu0xojxPArjUjw7IIeh9XiD5gVyeaWOs%2FW0ntLxkUgg8lzFabKbaMvZik8GZScysV%2BxSGYxW%2BW5ATRnQ1woi8o55AOwZm8sKSPcrqjgj9ibqV0a7rX99PeZrE5hc0ctey4Dfl0fPOhYsUNRpP%2ByX9rGpc4sXr4pEMJ676%2Ffj60dh0PrDkuamnM3ffRA322g20S0W2CQ70%2Baax7qVDLmiE2XRoanN4rdL3YUli3%2FeINQ7fkw1H55ibYMFJU39PXTfH2E8aXCArr3%2FtyRruu9Yu9w%2BK5Zu9eDTnLa79%2F6cz%2FzN8%2FArXbM%2BtK2QUVDLMOT47agdBtoMJEYc3TmgH7OdKwyByChMBM3iKD3AcXfQ423hjgbFlb1CdDKRdKk84AxUjEk%2F%2BoTW6GezG5J3SLMVRG4L1TGQj8Ha151pnUzjCM8iBVAN%2BshG%2F9JwHJWmB1uv7Gcp%2FWSzfmATGeMaNfJIwpd%2Bmq3vyNFS0SjfFBUCnmq%2F7omFp36qqvta7giN0coxQD%2FRm%2BGs5gKTiYhMbNzqy0ZrT93Dt6ZdKu8qShLzgQhn%2FEgFynJFQi3z4vVWt1gXHGggpCJi6DtfacnpWNfjIgQ%2FAWTmXP5L9NpkOxTi4tWbN2OkXRHLqpJmRzD357rNBjqkAZh7faaVSsVjSsvZJCpbrliTTTxsYqBFLx10wKFLQkB84zwjTt%2BpXXkVZGoqKv82ERtAVuQu4znGWHUZf6%2FM5NVQ6qwoWp7hMTy%2B0zI55paGmSzQ2pFMNCzJ0cjOqdQ683pK6x1e%2FO%2B%2BaOu13u%2FHHD72dpU15wTNqYog6McOgFjSUTEfTwHPa0r4VzgNr7oG89rdWSaV2VL%2Fqwajepl2P7A3Q8%2FE&X-Amz-Signature=ad24d340997d845b1a3224f41136f2c3be8429c770b0530d5b151d5a1842370e&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4664W3EM6BV%2F20260309%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260309T123635Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEGQaCXVzLXdlc3QtMiJIMEYCIQCJ78xLyfkTAjpMVdiqV96ieUsAB5G3Fy8J1J3se8yw%2BQIhAJ1uKdjqez6NLfdhy%2FcsKdwJwXPQlNIL9rxpRrWSXCcfKv8DCC0QABoMNjM3NDIzMTgzODA1IgxFoXDL6Q2lwoBaUnUq3AOHLu0xojxPArjUjw7IIeh9XiD5gVyeaWOs%2FW0ntLxkUgg8lzFabKbaMvZik8GZScysV%2BxSGYxW%2BW5ATRnQ1woi8o55AOwZm8sKSPcrqjgj9ibqV0a7rX99PeZrE5hc0ctey4Dfl0fPOhYsUNRpP%2ByX9rGpc4sXr4pEMJ676%2Ffj60dh0PrDkuamnM3ffRA322g20S0W2CQ70%2Baax7qVDLmiE2XRoanN4rdL3YUli3%2FeINQ7fkw1H55ibYMFJU39PXTfH2E8aXCArr3%2FtyRruu9Yu9w%2BK5Zu9eDTnLa79%2F6cz%2FzN8%2FArXbM%2BtK2QUVDLMOT47agdBtoMJEYc3TmgH7OdKwyByChMBM3iKD3AcXfQ423hjgbFlb1CdDKRdKk84AxUjEk%2F%2BoTW6GezG5J3SLMVRG4L1TGQj8Ha151pnUzjCM8iBVAN%2BshG%2F9JwHJWmB1uv7Gcp%2FWSzfmATGeMaNfJIwpd%2Bmq3vyNFS0SjfFBUCnmq%2F7omFp36qqvta7giN0coxQD%2FRm%2BGs5gKTiYhMbNzqy0ZrT93Dt6ZdKu8qShLzgQhn%2FEgFynJFQi3z4vVWt1gXHGggpCJi6DtfacnpWNfjIgQ%2FAWTmXP5L9NpkOxTi4tWbN2OkXRHLqpJmRzD357rNBjqkAZh7faaVSsVjSsvZJCpbrliTTTxsYqBFLx10wKFLQkB84zwjTt%2BpXXkVZGoqKv82ERtAVuQu4znGWHUZf6%2FM5NVQ6qwoWp7hMTy%2B0zI55paGmSzQ2pFMNCzJ0cjOqdQ683pK6x1e%2FO%2B%2BaOu13u%2FHHD72dpU15wTNqYog6McOgFjSUTEfTwHPa0r4VzgNr7oG89rdWSaV2VL%2Fqwajepl2P7A3Q8%2FE&X-Amz-Signature=71910ea93aaf02e787d48df5d9a3f41779763a679b0e22befafd8e1337b6f73d&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

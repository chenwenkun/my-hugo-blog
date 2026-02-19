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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4664ARZZBFF%2F20260219%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260219T064758Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEK%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCw7YlM79LgntZFkRmRRZv%2FG6qJdcG9iow00iXr8hl8%2BwIhAK4H01iPfdXKtNZqLEAQnFQUN2CjJX1wq22F5HNsDJK%2BKv8DCHgQABoMNjM3NDIzMTgzODA1IgyDnmA3PQHQ4MKRgUEq3AOiHFWZicwmZuXX0R19jq3mfwcZw3JTR%2BFd2ZkLQoWH%2FLpPmDIqT4fEfZiUfEhI4bQqR4S0HTQIbWBiPJXkfVs4CMhWTUowfHtfvl6UeOX4SsF2rzBZ2vSmKAvxXJhhGLz%2FETlPh8C3KdptsGOotLeuUZ3eMRneij%2BNckGssQCd86mCxcwKxoyDDv4rCJFzBXr2YJJMj%2BWtq%2BkhG1sLr62KeI%2BySaDWf5kH8tGB6FKUNK%2FYgmlPNWDvKSaSTq%2F2XJF2eErHly6y%2Bpp%2FPW4c5B9ml%2FoqZ3ZtQYM6fstFISayQbjb%2BUt6YeBEJ44ELand7dktSKeff5t3X59GpwGl6OqypxTsCn2Rfm11smtZu%2FXASeEzZm%2BMkjT%2For1ZK%2F5RgUSKV77TWf9vzLceGvMfdDSfHbuMTEIyr%2F2sDprBXTcuPTuFX%2FP%2FkjE3HNOW2N6k%2BXcDMyldOHu85Gt5xGvEdAmQoFHGaIgXcEG4woCTPWQolwyT5%2BhpkhwBh0ILSqRjkFJSs9pfnlZDVifbkD12IwUbxaxUcyNMcgchSzIEQ8K%2B6CO9DcVODAfRvoHOwLxVObl6ms961rK2QRCIR0Plx0Ft6c7R2M1vyxEmah0axW7yfvLP1aSx7VhQrZa4ZzDL3NrMBjqkAX25Ap8REzCaQYhkyuMeubbhfmONM78Rsg1RzMCF4CGH6Bi8sRQQu7ZfWwDAvNmTsIMfq7m0bkITPaoIeDLfPTcj%2BA5Cg%2BGeSnPMSQa8RsUKZ1HnxOvtznF39nVeIhl3VfOIccXB8Pg1E5tIOwNcm3Cy9s5Sa3zG762v7Rb9Z2hfPHFiSReWghEPdaS9TlS2OW9zoHVv1mQr0XpcBxsAGfBh50BX&X-Amz-Signature=712f57889230d59fc72af23e2f0e6d16d337904488049440097f83c546037ddf&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4664ARZZBFF%2F20260219%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260219T064758Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEK%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCw7YlM79LgntZFkRmRRZv%2FG6qJdcG9iow00iXr8hl8%2BwIhAK4H01iPfdXKtNZqLEAQnFQUN2CjJX1wq22F5HNsDJK%2BKv8DCHgQABoMNjM3NDIzMTgzODA1IgyDnmA3PQHQ4MKRgUEq3AOiHFWZicwmZuXX0R19jq3mfwcZw3JTR%2BFd2ZkLQoWH%2FLpPmDIqT4fEfZiUfEhI4bQqR4S0HTQIbWBiPJXkfVs4CMhWTUowfHtfvl6UeOX4SsF2rzBZ2vSmKAvxXJhhGLz%2FETlPh8C3KdptsGOotLeuUZ3eMRneij%2BNckGssQCd86mCxcwKxoyDDv4rCJFzBXr2YJJMj%2BWtq%2BkhG1sLr62KeI%2BySaDWf5kH8tGB6FKUNK%2FYgmlPNWDvKSaSTq%2F2XJF2eErHly6y%2Bpp%2FPW4c5B9ml%2FoqZ3ZtQYM6fstFISayQbjb%2BUt6YeBEJ44ELand7dktSKeff5t3X59GpwGl6OqypxTsCn2Rfm11smtZu%2FXASeEzZm%2BMkjT%2For1ZK%2F5RgUSKV77TWf9vzLceGvMfdDSfHbuMTEIyr%2F2sDprBXTcuPTuFX%2FP%2FkjE3HNOW2N6k%2BXcDMyldOHu85Gt5xGvEdAmQoFHGaIgXcEG4woCTPWQolwyT5%2BhpkhwBh0ILSqRjkFJSs9pfnlZDVifbkD12IwUbxaxUcyNMcgchSzIEQ8K%2B6CO9DcVODAfRvoHOwLxVObl6ms961rK2QRCIR0Plx0Ft6c7R2M1vyxEmah0axW7yfvLP1aSx7VhQrZa4ZzDL3NrMBjqkAX25Ap8REzCaQYhkyuMeubbhfmONM78Rsg1RzMCF4CGH6Bi8sRQQu7ZfWwDAvNmTsIMfq7m0bkITPaoIeDLfPTcj%2BA5Cg%2BGeSnPMSQa8RsUKZ1HnxOvtznF39nVeIhl3VfOIccXB8Pg1E5tIOwNcm3Cy9s5Sa3zG762v7Rb9Z2hfPHFiSReWghEPdaS9TlS2OW9zoHVv1mQr0XpcBxsAGfBh50BX&X-Amz-Signature=f4855cc31460ad46808500531da871fb8d48093aac704c58cbc04063d2c96d5b&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4667AJKLTYR%2F20250929%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20250929T061817Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEEMaCXVzLXdlc3QtMiJHMEUCIQDx97RcI4knSjeOzZyZUsTDg98rawLgNEsN8fReSd%2FktgIgOIv4MHH%2FA27Q2HMGN7SjYzmeoKeWYTLCHcqjL4xnufEqiAQIzP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDBFXWROXZeeBb17v0CrcAxAkNm5HRbiVgFrBY4zLXTNOet08ER8QxdAFkpNvLd4GoKoiSSnm%2Fa9sUdqvEIUVUwzf%2F6qecbcH0RKK2YUPAggg7aR%2FQNBqZ1MRILtQZs36DqkJ5q%2FOLAd8X6kp7Rs0VZAqacPUMvuUYNZTdZLfC7losYA3ADy3hrBwafQGXAlbm6ps%2BhPKGChDetDWc8AValqCJCrf1jM%2BmtnefWnrUguVLfF6tzHCC4C6mGmKhEoNgTzbSbb7oP%2FjGKGiCl4oD5R8%2BaMrIF9SHKB0JenVhRH1qpk3BrA0FknjIGs0872UMIaBn9NqDg%2FVCkSsyVCGGsYcO5Q3PiL83kv9Kc6FrwXWxXAeBX9eScSxHTqdNI4P%2Bvn6Oj8E2X3w2YXJQkl7SV9D%2FyLRz3xYBM0W8kIv2ZawelnTRa68t0HpvNfvvcIkOHP%2BVvTCqL%2F28QKJNAXFjYSojqXKr896xkRZXIV1uuUqmU1dsiTNi7WkssoeeTBgZKHAj2u6D6nMfPIn14ONxU1TJcye3vt3nauE1IQnPSZOA0fLaasTNbJI1GT2lFbe2x9cfZ7kpp6IYcCJOji50W3hHRQMoQk%2BVjnVa2g%2F7721txSzjD7N0D2Isv5OaJb4AqTMwxK5up1BRV4mMJ7f58YGOqUBNPy2jMoaqbun22QNZVgBuAQEKC4fy5GChlfMoyp8MTfuY48vbUfy6lwRlwyDEt8WLT1agV0vSmAr8ZZ2DW1O7H%2FjBF2sYchPuJXSuR4aHgXdCMoadOWZdnaWHxRIIs300MpU%2FOKNCA9okEIQgsVgwQSOFlD0d6sBulTQfOo2XOif5eREf%2BaG2L5pN%2BPBBm9QmpL697Mp%2F8celKezRKN8N7hcDpQG&X-Amz-Signature=f51305f0600ecfe3604ec5441c13e43d6f9ff928f661d6b4c55e415b273547bf&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4667AJKLTYR%2F20250929%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20250929T061817Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEEMaCXVzLXdlc3QtMiJHMEUCIQDx97RcI4knSjeOzZyZUsTDg98rawLgNEsN8fReSd%2FktgIgOIv4MHH%2FA27Q2HMGN7SjYzmeoKeWYTLCHcqjL4xnufEqiAQIzP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDBFXWROXZeeBb17v0CrcAxAkNm5HRbiVgFrBY4zLXTNOet08ER8QxdAFkpNvLd4GoKoiSSnm%2Fa9sUdqvEIUVUwzf%2F6qecbcH0RKK2YUPAggg7aR%2FQNBqZ1MRILtQZs36DqkJ5q%2FOLAd8X6kp7Rs0VZAqacPUMvuUYNZTdZLfC7losYA3ADy3hrBwafQGXAlbm6ps%2BhPKGChDetDWc8AValqCJCrf1jM%2BmtnefWnrUguVLfF6tzHCC4C6mGmKhEoNgTzbSbb7oP%2FjGKGiCl4oD5R8%2BaMrIF9SHKB0JenVhRH1qpk3BrA0FknjIGs0872UMIaBn9NqDg%2FVCkSsyVCGGsYcO5Q3PiL83kv9Kc6FrwXWxXAeBX9eScSxHTqdNI4P%2Bvn6Oj8E2X3w2YXJQkl7SV9D%2FyLRz3xYBM0W8kIv2ZawelnTRa68t0HpvNfvvcIkOHP%2BVvTCqL%2F28QKJNAXFjYSojqXKr896xkRZXIV1uuUqmU1dsiTNi7WkssoeeTBgZKHAj2u6D6nMfPIn14ONxU1TJcye3vt3nauE1IQnPSZOA0fLaasTNbJI1GT2lFbe2x9cfZ7kpp6IYcCJOji50W3hHRQMoQk%2BVjnVa2g%2F7721txSzjD7N0D2Isv5OaJb4AqTMwxK5up1BRV4mMJ7f58YGOqUBNPy2jMoaqbun22QNZVgBuAQEKC4fy5GChlfMoyp8MTfuY48vbUfy6lwRlwyDEt8WLT1agV0vSmAr8ZZ2DW1O7H%2FjBF2sYchPuJXSuR4aHgXdCMoadOWZdnaWHxRIIs300MpU%2FOKNCA9okEIQgsVgwQSOFlD0d6sBulTQfOo2XOif5eREf%2BaG2L5pN%2BPBBm9QmpL697Mp%2F8celKezRKN8N7hcDpQG&X-Amz-Signature=4715948903eb6f26535ac237addd494a23ab7243659ce64e06f2cb0b0e56d0f5&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

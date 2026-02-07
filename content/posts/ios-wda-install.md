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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4665O7242QG%2F20260207%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260207T010601Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEIj%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIHU8yTgQE67QyOD%2BbWmPvk0gdrG5nN6BEhP6GWX%2B%2BOaUAiBkLkEhzzu3SRBIHtYcLeUNN2hH4gx4hkM2VnqdTK7Hjir%2FAwhREAAaDDYzNzQyMzE4MzgwNSIMO0PZG%2F8Zk3%2Br9a0UKtwDZQy6yiKfvcCY5qv6svmuxmToIg5mFJ8pj%2F1QpUT0%2B%2Be6aCKvf0pa%2FP9xiUevB5S5VkGCKhjFP1e35%2FH%2Bqylg%2BDQYTL19%2FNU%2B%2BBQq%2Fsz6cLpQ3DQTLU0%2FB%2BaLUokBiQlWEIH603SOwRbQWTI1VvayDBscHB86gcAu6dyzk7vjAnJwQwdjSMm6Pf%2B8bETZCGC05HTbLsR1ev0zldtWRsvFPvYSo4knoVIh211UIZC9yBgUi46Xmf6ckYL4pKe0TvUEIix5IewBvZuWFF7HF%2FBrTYf1P870FwFm7uUhDcJYGILtl01hdzEP%2BrwdQf1RLwJAQCH8PbjsPnpmsYMF%2BM8oY6epnYMY4uvuusRHDjDuwlos%2Bba2hDH9yi9xokMVRY1p%2BBu0VOuR99bKZmlWp8ESnGuHIeBU54%2Fj61TajAP4L5kDuwOGWvycibjH9zZvnrN8MYHnGsSryJLVzPeGkO%2Buhoo6PCDZNKJgW40A7oT2xEfjIee7VtQh5smT96f1Tmg6PX4IM867C1EXafF4W7jF%2FpPFS90CrOt47Okv3cBGB6%2Bnuuppj4AX%2F1WmHvyhwXHJV1SKfYQS%2B8TBhHP5qS2jHzF1w4HaJFX3QdPFVWeOz1pQo6H4mbaBPvxaOlQw9oWazAY6pgFBKdNfSye6amWBQDPP15L7XKSsWJeJ%2FZ6m1IuHXCqsxi0oBeCZ1XYMfiBKQwha9V3wEyXAHN618U6oJld3tU%2F2VF9rBXJWhFSNYtWh1VKyx%2BquzQ%2B6ZR3%2FcV5VRnqcSwTZlEeziQKe4G4WuBPJSaD7XLmOXTCFu87LURWpjC435v1zAPC2IXug%2BSkDwVlOMyvLj8VruYJNX9wW8Sx8ev7w5ql1wGYX&X-Amz-Signature=0eb7bf54b02eab7bf4e16d1fe562b4d0f0ce3faacb233ab2d4ef6531a3df6bb4&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4665O7242QG%2F20260207%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260207T010601Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEIj%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIHU8yTgQE67QyOD%2BbWmPvk0gdrG5nN6BEhP6GWX%2B%2BOaUAiBkLkEhzzu3SRBIHtYcLeUNN2hH4gx4hkM2VnqdTK7Hjir%2FAwhREAAaDDYzNzQyMzE4MzgwNSIMO0PZG%2F8Zk3%2Br9a0UKtwDZQy6yiKfvcCY5qv6svmuxmToIg5mFJ8pj%2F1QpUT0%2B%2Be6aCKvf0pa%2FP9xiUevB5S5VkGCKhjFP1e35%2FH%2Bqylg%2BDQYTL19%2FNU%2B%2BBQq%2Fsz6cLpQ3DQTLU0%2FB%2BaLUokBiQlWEIH603SOwRbQWTI1VvayDBscHB86gcAu6dyzk7vjAnJwQwdjSMm6Pf%2B8bETZCGC05HTbLsR1ev0zldtWRsvFPvYSo4knoVIh211UIZC9yBgUi46Xmf6ckYL4pKe0TvUEIix5IewBvZuWFF7HF%2FBrTYf1P870FwFm7uUhDcJYGILtl01hdzEP%2BrwdQf1RLwJAQCH8PbjsPnpmsYMF%2BM8oY6epnYMY4uvuusRHDjDuwlos%2Bba2hDH9yi9xokMVRY1p%2BBu0VOuR99bKZmlWp8ESnGuHIeBU54%2Fj61TajAP4L5kDuwOGWvycibjH9zZvnrN8MYHnGsSryJLVzPeGkO%2Buhoo6PCDZNKJgW40A7oT2xEfjIee7VtQh5smT96f1Tmg6PX4IM867C1EXafF4W7jF%2FpPFS90CrOt47Okv3cBGB6%2Bnuuppj4AX%2F1WmHvyhwXHJV1SKfYQS%2B8TBhHP5qS2jHzF1w4HaJFX3QdPFVWeOz1pQo6H4mbaBPvxaOlQw9oWazAY6pgFBKdNfSye6amWBQDPP15L7XKSsWJeJ%2FZ6m1IuHXCqsxi0oBeCZ1XYMfiBKQwha9V3wEyXAHN618U6oJld3tU%2F2VF9rBXJWhFSNYtWh1VKyx%2BquzQ%2B6ZR3%2FcV5VRnqcSwTZlEeziQKe4G4WuBPJSaD7XLmOXTCFu87LURWpjC435v1zAPC2IXug%2BSkDwVlOMyvLj8VruYJNX9wW8Sx8ev7w5ql1wGYX&X-Amz-Signature=4b505ca10e8315fc6c3be4a5540fa667f66c0a3c39aa6d9817d6161f6c7fd7e3&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

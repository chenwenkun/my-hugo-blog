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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466TNZ27WNL%2F20260105%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260105T010308Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEG4aCXVzLXdlc3QtMiJGMEQCICilTuvrHEXwHx4rOJgwbgBHincz%2FqOUPQvzKFlJRNKpAiAKcfJNn%2Bv0%2F5oQz1vLEA7nmSM%2Bio%2F9549GIpimTGvPZSr%2FAwg3EAAaDDYzNzQyMzE4MzgwNSIM%2BNhDtRY5bctZJEXCKtwD6z7KK7AAt1DFVRtFDzRTdkBs0J9vWPRaBvmzWgki2MyiwV3kV5mUlHyEnq5rc2e%2B9n1J0JGLjBcjGOi3kbtnojAiiOTfY1iC20NEfk%2BorW9s%2BWMiYSWAF9suRoiQrAAGhQ5VaAgkKYuRGFTxxGIrjINbx7%2B3ZMirRPdWVitmvERYjMjKfYPhgstF7DgSdiNhqrtf9Bvd%2B6Ah6vO%2FkEo%2Bzu4h9E682rRkSrh3m8Y%2Bf5PcANC5fk8JA4FAHCq2vfHK3aEZVxcQlDDicKpJpBVVTuNtypJNAM47dA8Cwb86P43oU65B4i2k9wCJcFzqXi5FxXtzxEQ%2FxZwN1rMf9i9ZijAFDCZi9W%2F%2FXYHOwkrudR4Wzkj3WyMy883ZXE5PySus45jJxiBYcz5IgOtK4IzixEIou3M4Ci%2Bkx7esHskQUG4DWXj0D%2BFOGKqJkrYFm7ITafGlFbyMP%2FTGUQKuV1eF0K9yiw33Z0JRy1WbvE2Zlq1%2F%2BDUAlEVcBzLGfq4LY%2Bl1%2FlRR%2BokqoElmNSN%2BgXZIRWlTNz8A0twOPTQnU95lyR98ElR%2BoWNdSsJnhYV6SryhMBGdeP0WKa5f9lMbu1hzT3GVEmiYEQKqCjedA5ykw9PiPqdGP3Vl97Q%2FnpMw78XrygY6pgFU%2FD1PB9u2jQhd3ln2sBN%2FcmRdCVQBpH4gx3%2Fbujjvte2a8QmRpFeVCjhmbzbFPIe5XQ4zSZ7fEFefMuQLi44bMKHMQrmMyvgMDGQrWAu%2F7wibjbCbHy76p0hIK6f6SqsIdi04WMooRTGgTFsLqAXdXQIJpC6XfdtX0jX11UA2L7GMUDnKSqj%2F3cV7XEOlV6CxvSmb5bh1uPzam55H3rotapv2s305&X-Amz-Signature=a535d6ee84df684e5c9fe3e7636e536f29b79072d727916495a25e93bb239ffe&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466TNZ27WNL%2F20260105%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260105T010308Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEG4aCXVzLXdlc3QtMiJGMEQCICilTuvrHEXwHx4rOJgwbgBHincz%2FqOUPQvzKFlJRNKpAiAKcfJNn%2Bv0%2F5oQz1vLEA7nmSM%2Bio%2F9549GIpimTGvPZSr%2FAwg3EAAaDDYzNzQyMzE4MzgwNSIM%2BNhDtRY5bctZJEXCKtwD6z7KK7AAt1DFVRtFDzRTdkBs0J9vWPRaBvmzWgki2MyiwV3kV5mUlHyEnq5rc2e%2B9n1J0JGLjBcjGOi3kbtnojAiiOTfY1iC20NEfk%2BorW9s%2BWMiYSWAF9suRoiQrAAGhQ5VaAgkKYuRGFTxxGIrjINbx7%2B3ZMirRPdWVitmvERYjMjKfYPhgstF7DgSdiNhqrtf9Bvd%2B6Ah6vO%2FkEo%2Bzu4h9E682rRkSrh3m8Y%2Bf5PcANC5fk8JA4FAHCq2vfHK3aEZVxcQlDDicKpJpBVVTuNtypJNAM47dA8Cwb86P43oU65B4i2k9wCJcFzqXi5FxXtzxEQ%2FxZwN1rMf9i9ZijAFDCZi9W%2F%2FXYHOwkrudR4Wzkj3WyMy883ZXE5PySus45jJxiBYcz5IgOtK4IzixEIou3M4Ci%2Bkx7esHskQUG4DWXj0D%2BFOGKqJkrYFm7ITafGlFbyMP%2FTGUQKuV1eF0K9yiw33Z0JRy1WbvE2Zlq1%2F%2BDUAlEVcBzLGfq4LY%2Bl1%2FlRR%2BokqoElmNSN%2BgXZIRWlTNz8A0twOPTQnU95lyR98ElR%2BoWNdSsJnhYV6SryhMBGdeP0WKa5f9lMbu1hzT3GVEmiYEQKqCjedA5ykw9PiPqdGP3Vl97Q%2FnpMw78XrygY6pgFU%2FD1PB9u2jQhd3ln2sBN%2FcmRdCVQBpH4gx3%2Fbujjvte2a8QmRpFeVCjhmbzbFPIe5XQ4zSZ7fEFefMuQLi44bMKHMQrmMyvgMDGQrWAu%2F7wibjbCbHy76p0hIK6f6SqsIdi04WMooRTGgTFsLqAXdXQIJpC6XfdtX0jX11UA2L7GMUDnKSqj%2F3cV7XEOlV6CxvSmb5bh1uPzam55H3rotapv2s305&X-Amz-Signature=af08164716b7e6c07610a23c5f2307ed6059e8d44f562c551192e5b2285ec3d2&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

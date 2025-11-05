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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB46662XWYM65%2F20251105%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251105T061734Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEL3%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQDoPOAXXmx%2BmZkRQaxO8FmTscUZE3OA%2FHuqYUx975xgEQIgd0UvLfGOAGKdePYKYuy1Kl9ZdCVcY6ndRHIthMdGf2gqiAQIhv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDH%2FeZ%2BoWT0S4nMyH0ircA5bxSilC22K4tg%2B5nDVRXBhmr41K0me3DF%2F%2BBOWZtY9SDnH3ZuZhGDUzlitJ9AKyaOCUmOjxl10Ty7rmLIkpAAdgmnb%2BGE7hVUG5sNfRqdj%2FYujELEVS2jKQ14AUK%2B3qvNNXjb393CdT%2BM6F92EsEksMpNVGL%2BTeK0ws7ecHQYtRNnuTmqa4REnW4lCrX23nnYTV52kHP7h%2BeboZjxKgUHuHAiP5KoFcP9FtMCg%2BwlixSSMfBkZVO%2FeDHU5SNNBB1OXWva1Vpa%2BQ8maGTB5s4E1IxDOL%2BFjOWn4%2B90pHA1wl%2BZquaPCuY8s%2Bda7AsnxWPLqrZYT0vaiMb%2F1XLZQcK9JXuuWFIYDUbfrcBhVy5YYAgfwXedRwS%2BZmOwlpyLTwFn1MYZYKiZwaVPmkTEHgQOP65e6TMSrIgph7kZk5MX2G8FYVOhA0LsplMBiL6Wbm0E4%2BEyvK2NT5vatC8vYE6vgDrc2hIydQfCuqqQOaYVn8sY5WKXBPJlOS3zvhQTzUdj4abEsk8ssO4VoewqbgqU%2BI9hbZlWmcAKuOMbnMSxhsZEwDiMsa8Qen3MlFI4oVu4z0LAHdaWaN0cPUqXgaJWQPYqxsmSmvBl2dYux3f0TwW5wbSCga4f5wHbVyMPK4q8gGOqUBBY0J4FkvXfb8cPCkJQ0I1YGqEVCGnxrowCFDWW6g%2BY1KL%2F%2BbYFbKSeIljOZhqFgn2gIwDYTXrdok936lTMoox2oj2ctlfF2yhYShwjpcdsHnt9dJwfl0gH1VBpMu1gV6cxl6kJXVabkgVIWe2xH%2BKQmiXNA7qiwaH2K0XA2zmt6kjg7ktgCx3RJ0pywdSywS%2FBKq41kMdhErsn3fTAgjvmTiWwSZ&X-Amz-Signature=85741a3d744655e2a84c18ab8f13fb01116e130e8af2231f9223586fce768e67&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB46662XWYM65%2F20251105%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251105T061734Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEL3%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQDoPOAXXmx%2BmZkRQaxO8FmTscUZE3OA%2FHuqYUx975xgEQIgd0UvLfGOAGKdePYKYuy1Kl9ZdCVcY6ndRHIthMdGf2gqiAQIhv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDH%2FeZ%2BoWT0S4nMyH0ircA5bxSilC22K4tg%2B5nDVRXBhmr41K0me3DF%2F%2BBOWZtY9SDnH3ZuZhGDUzlitJ9AKyaOCUmOjxl10Ty7rmLIkpAAdgmnb%2BGE7hVUG5sNfRqdj%2FYujELEVS2jKQ14AUK%2B3qvNNXjb393CdT%2BM6F92EsEksMpNVGL%2BTeK0ws7ecHQYtRNnuTmqa4REnW4lCrX23nnYTV52kHP7h%2BeboZjxKgUHuHAiP5KoFcP9FtMCg%2BwlixSSMfBkZVO%2FeDHU5SNNBB1OXWva1Vpa%2BQ8maGTB5s4E1IxDOL%2BFjOWn4%2B90pHA1wl%2BZquaPCuY8s%2Bda7AsnxWPLqrZYT0vaiMb%2F1XLZQcK9JXuuWFIYDUbfrcBhVy5YYAgfwXedRwS%2BZmOwlpyLTwFn1MYZYKiZwaVPmkTEHgQOP65e6TMSrIgph7kZk5MX2G8FYVOhA0LsplMBiL6Wbm0E4%2BEyvK2NT5vatC8vYE6vgDrc2hIydQfCuqqQOaYVn8sY5WKXBPJlOS3zvhQTzUdj4abEsk8ssO4VoewqbgqU%2BI9hbZlWmcAKuOMbnMSxhsZEwDiMsa8Qen3MlFI4oVu4z0LAHdaWaN0cPUqXgaJWQPYqxsmSmvBl2dYux3f0TwW5wbSCga4f5wHbVyMPK4q8gGOqUBBY0J4FkvXfb8cPCkJQ0I1YGqEVCGnxrowCFDWW6g%2BY1KL%2F%2BbYFbKSeIljOZhqFgn2gIwDYTXrdok936lTMoox2oj2ctlfF2yhYShwjpcdsHnt9dJwfl0gH1VBpMu1gV6cxl6kJXVabkgVIWe2xH%2BKQmiXNA7qiwaH2K0XA2zmt6kjg7ktgCx3RJ0pywdSywS%2FBKq41kMdhErsn3fTAgjvmTiWwSZ&X-Amz-Signature=3ea541f018fb98d0ae6db60607b1c0696706cd509a7aa35d81af4e52f53a4add&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466S4GEHQNG%2F20260513%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260513T140413Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEH4aCXVzLXdlc3QtMiJGMEQCIG5ULQLHbL4%2FxoVdxXicHWNtwOUL8Ci8Udg68NFapA8zAiAHOgtlK9QIkzaf2TFpOIOJljo%2BDmMNBFiTgL7D8dwWBir%2FAwhHEAAaDDYzNzQyMzE4MzgwNSIM9PC3d55W08jsaBbbKtwDu4eGB%2FrpcVRJSnjq7G8TP15IQqav%2FykE9B8mTkGntqBYHI2tz83%2BxfgA9umGmUmbv4rLQAiC75xc%2FB8jpfZVZxSmEdTA46EyIepl9sE2BcBDM%2BdcNANs%2F4H7u95bgqukow4xeIFDJ7iIk2klSDaSMfj2qhT1fU15ny9qPHpAmboK6rNSrW2%2B9ruKH2itvbi5PzC0zv7d%2F1ljGm73OxVD0mmLalx3WN193zaDDRdRDvYBpqgYasO7SrEWGGFuVMNUh5PzGbw1XIdzmIbOHofmanx3aB%2F8lTGSmWMA740gvaYsSv%2BmSNrNiamSAGDiiXHbEpEQj2%2F1p58DkqDv758UOTbO1dbxFonNLGCv1xBeZrUvIu0oLZpJHSZXszd5GKPxutz6mdHSkU0t91IXy1Ob1yXwF964mjtyjaG3Tfwnho3PM9Dev91TauzxRWO0NXMGeI%2FwZlTVSVlCqOc9gtIA54%2BqW4OIb4aozQUvNIAjnmBXCwyGLCxOyoOmZ3TIIGIVLnR%2FORXh%2FdxyMDEnyJN3yjPeDhWUIKYJIycZOMxG8YZocHifogwtkAvygs%2Fg%2BkSzZFg4NKGggg0KV4WM3mqZ65aHMMP6b48U%2Bs62BKrDMGXkwVOpF31B%2BkST%2BMIwifqR0AY6pgFJVHvWz4CKtYt8qClbuw654IKA7IiMbuJbAeV41zyZjYWgudBUmprECxMm8Hv5SCuehmXSOQP8ueyhxEbYfGOqMjwaMjZFh5BaHgm4P4dUDTMlpG%2FJ5I7kp43Fv4zATH4x2bWpl%2FwR1apZPoAqJCCm4ekv%2FsXgYGfDeoDFqjpLhCEcWM6J75c%2B0ZpZqD3E2qQRf6c5zcxAt1l83SzvNCOgLcye%2FQKt&X-Amz-Signature=9a65514ff24000b33175a18b4aec6d014c5d54684ec93654d0d69fb8bf76fd4a&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466S4GEHQNG%2F20260513%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260513T140413Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEH4aCXVzLXdlc3QtMiJGMEQCIG5ULQLHbL4%2FxoVdxXicHWNtwOUL8Ci8Udg68NFapA8zAiAHOgtlK9QIkzaf2TFpOIOJljo%2BDmMNBFiTgL7D8dwWBir%2FAwhHEAAaDDYzNzQyMzE4MzgwNSIM9PC3d55W08jsaBbbKtwDu4eGB%2FrpcVRJSnjq7G8TP15IQqav%2FykE9B8mTkGntqBYHI2tz83%2BxfgA9umGmUmbv4rLQAiC75xc%2FB8jpfZVZxSmEdTA46EyIepl9sE2BcBDM%2BdcNANs%2F4H7u95bgqukow4xeIFDJ7iIk2klSDaSMfj2qhT1fU15ny9qPHpAmboK6rNSrW2%2B9ruKH2itvbi5PzC0zv7d%2F1ljGm73OxVD0mmLalx3WN193zaDDRdRDvYBpqgYasO7SrEWGGFuVMNUh5PzGbw1XIdzmIbOHofmanx3aB%2F8lTGSmWMA740gvaYsSv%2BmSNrNiamSAGDiiXHbEpEQj2%2F1p58DkqDv758UOTbO1dbxFonNLGCv1xBeZrUvIu0oLZpJHSZXszd5GKPxutz6mdHSkU0t91IXy1Ob1yXwF964mjtyjaG3Tfwnho3PM9Dev91TauzxRWO0NXMGeI%2FwZlTVSVlCqOc9gtIA54%2BqW4OIb4aozQUvNIAjnmBXCwyGLCxOyoOmZ3TIIGIVLnR%2FORXh%2FdxyMDEnyJN3yjPeDhWUIKYJIycZOMxG8YZocHifogwtkAvygs%2Fg%2BkSzZFg4NKGggg0KV4WM3mqZ65aHMMP6b48U%2Bs62BKrDMGXkwVOpF31B%2BkST%2BMIwifqR0AY6pgFJVHvWz4CKtYt8qClbuw654IKA7IiMbuJbAeV41zyZjYWgudBUmprECxMm8Hv5SCuehmXSOQP8ueyhxEbYfGOqMjwaMjZFh5BaHgm4P4dUDTMlpG%2FJ5I7kp43Fv4zATH4x2bWpl%2FwR1apZPoAqJCCm4ekv%2FsXgYGfDeoDFqjpLhCEcWM6J75c%2B0ZpZqD3E2qQRf6c5zcxAt1l83SzvNCOgLcye%2FQKt&X-Amz-Signature=9cd86c6c7cb69fa8cd852826291c8853d6ddabcf05895f0676e4f19e6d184aa5&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

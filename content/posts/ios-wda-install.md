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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466XTAQKAKF%2F20260402%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260402T065940Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJ%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQD85OI1WbnDUsT0es9k6uPlzqS6rcJ1Nl%2FGLBiH4xgOiwIhANymi3o%2BJqUNyHSBtRjO9Ua4E1%2FbHjZhyRzryxh%2FjhdkKv8DCGgQABoMNjM3NDIzMTgzODA1Igy2J9vowK%2BO6YHp100q3AMM4LdXgOBlZgEMtAadPWmBFaTkn%2BrIccdEngCcEexGwkTVccOhp4UrP59CHAdepUzHVnC6a4MCJHaIBrb%2FznugMl%2FcgIHyh9EtVG%2BqAYUijQs7ReDEiNG8XQr75C%2Ff6jzs0UTJTmrAOR3MnpnTXguLYL6QTX7XPFpkyUm6%2FOyae7GoMOl%2BLthW4RGU3FRgrFlSn%2FePt%2F696QmFI0gnTsSxyPl2jVQctxBrHfzJguRZOs17miBoAykJuUbPKOlvKzj0sQz7wCxLmylw3iP4v7MNLuskqawQzLEM0hZ0aabHsF90gQkh6orlDxFZeFlkMvLavesq1FtA%2BiF%2FkMJsiWg0dKyYjiCYHBoPKqWT3W9nb24qXY3VbFBwxxup2ro3%2FtJgRV1jadSIwqNY94Dht2qe1ex5liC62LA3YkUsnrR55KXdYmYZoFZZM4jvlYRTVYCJONVH5MzidQP0Lwg20yIp7nq8q1ghBibJp28Q6CHwYUlMyh7b5nP%2B9I3LSqfPH1%2FU8%2B9xQ3x4rTn92TvEXOIrpboz%2FxJYSURaTJZUsrqTtb4FTcQzNW1d8sRmYJuJMl8MkpYcP9Mj0KXdJL7SflxgFRiB%2BNBaiA25V3cQiM8BZVzlwMrwJJgLWKh46zC5nrjOBjqkAVOKOfDgDbgo9yn6hhJ8zOCFybbUtqqtw1VIaGPvQ0AiUzPB7Q71c7qiNIrylq7jfQWcbOTwh%2FnasabiuwvCHlDIv1VaaYr%2F1D2NvH%2BVKw%2BqGZsZI5X7BzIqenCxOorLuD9Ux89PNtzLr97%2F9mmHFIyzeGAG%2FNWZ9J6LpZs2D1jkSP0B70F6SbqFOwdXvbINu26YGY%2BtVDDp4BUA8%2FPTpZa3yqN0&X-Amz-Signature=7583e40bfc0dd424edfc971f1dc8277687bb1bd91de6a035b47b6c3528bb072a&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466XTAQKAKF%2F20260402%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260402T065940Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJ%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQD85OI1WbnDUsT0es9k6uPlzqS6rcJ1Nl%2FGLBiH4xgOiwIhANymi3o%2BJqUNyHSBtRjO9Ua4E1%2FbHjZhyRzryxh%2FjhdkKv8DCGgQABoMNjM3NDIzMTgzODA1Igy2J9vowK%2BO6YHp100q3AMM4LdXgOBlZgEMtAadPWmBFaTkn%2BrIccdEngCcEexGwkTVccOhp4UrP59CHAdepUzHVnC6a4MCJHaIBrb%2FznugMl%2FcgIHyh9EtVG%2BqAYUijQs7ReDEiNG8XQr75C%2Ff6jzs0UTJTmrAOR3MnpnTXguLYL6QTX7XPFpkyUm6%2FOyae7GoMOl%2BLthW4RGU3FRgrFlSn%2FePt%2F696QmFI0gnTsSxyPl2jVQctxBrHfzJguRZOs17miBoAykJuUbPKOlvKzj0sQz7wCxLmylw3iP4v7MNLuskqawQzLEM0hZ0aabHsF90gQkh6orlDxFZeFlkMvLavesq1FtA%2BiF%2FkMJsiWg0dKyYjiCYHBoPKqWT3W9nb24qXY3VbFBwxxup2ro3%2FtJgRV1jadSIwqNY94Dht2qe1ex5liC62LA3YkUsnrR55KXdYmYZoFZZM4jvlYRTVYCJONVH5MzidQP0Lwg20yIp7nq8q1ghBibJp28Q6CHwYUlMyh7b5nP%2B9I3LSqfPH1%2FU8%2B9xQ3x4rTn92TvEXOIrpboz%2FxJYSURaTJZUsrqTtb4FTcQzNW1d8sRmYJuJMl8MkpYcP9Mj0KXdJL7SflxgFRiB%2BNBaiA25V3cQiM8BZVzlwMrwJJgLWKh46zC5nrjOBjqkAVOKOfDgDbgo9yn6hhJ8zOCFybbUtqqtw1VIaGPvQ0AiUzPB7Q71c7qiNIrylq7jfQWcbOTwh%2FnasabiuwvCHlDIv1VaaYr%2F1D2NvH%2BVKw%2BqGZsZI5X7BzIqenCxOorLuD9Ux89PNtzLr97%2F9mmHFIyzeGAG%2FNWZ9J6LpZs2D1jkSP0B70F6SbqFOwdXvbINu26YGY%2BtVDDp4BUA8%2FPTpZa3yqN0&X-Amz-Signature=78b36b925e5ef0f3cea626612d6ed9502eaae72a72ddb33b740d375fd928f8e7&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

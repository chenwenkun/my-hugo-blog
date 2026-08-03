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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4662FPB4T4X%2F20260803%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260803T014834Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEB4aCXVzLXdlc3QtMiJIMEYCIQCvd8bIR06LaX%2BOvOwNmku1tsFLfUg18hW60Yn1H4nKgwIhALgGFjn6mNYmQ3ZnpT08Tn1o5h5%2FG5Zig2YgtRXJECyiKogECOf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1Igws0Hjq0As35asvPPEq3AOVS2BnvQwmdFzMkM2onDjTRaQbrjb3ZX6a90%2BBwNOCL34t8JaMmHROp4vXb%2BhpV6R3U0K0m64p5UxS0XuJNWn3Z%2B4Qz4oTK%2B4yC%2Bc6dRBjTc54j%2BY19EnAyXGn9Tvs9JH0JzTJByTNCx%2BbQVRkY7ZGyYpHc%2FKmlmAIoIPFj423z%2F%2Fw0okR2xi649Pgsz1v2M0Ya7XC2ImgnavLUHvH5KOIwBoFq39LsrGSkPF4KhCUbR1RizOmkbbfE%2FQq0j4OUESB%2BVaPKK%2FJkoSwd%2FAZcvzLDm6PffFYdlTq3ZJr%2FvxjDffboV%2BNuHC1hvEmHrV%2BD10xeuiuq8IIBCZ3djcG%2FSlxYdECVgHZU%2Bs8u1gzWfNoQPouoyqqMTFN3klVhZedCwcJSnnmfsRESFMbfnXoXj9g%2F3pONnutAfyDWC0xgpXS%2Fy2veIioy8AoHfjsjHEIccMvlKLpmPRl9wH1plBRsI%2Bk0m7vccybBUTJ6JR9GKiWU5Z%2BDYktWlX0wGn%2FAXv2cDc9gLcilrfwpss%2BAz9dXMXC2cdLlBiq3%2BQfhg6rAWxSJHhq7eD2bVT4MVCkgD8MUuleLW6QoGdtC2j%2FjDsteh5y2eU4Qf9ewH7N1tt8S9p9%2Fg5KSFpxNgu521nDBzCqgb%2FTBjqkAbUejRuSatOY0S1eQiW9C%2Bhjt9Rdo%2FE%2BOTL5vYWWBkRop0MP9Z4RjsYwyBHYNaIUAPiurvOnP5ZtTM3vCcPU4Of8zHixbgQgYkkQExlG3ph%2FQbyRJd%2BlAv4grJmufR9roCfq6706naZZzwUdCVaVozi86fuUSd7BSGGw6RRkIDvDpH8OBsq67C%2FsgSdqUON1g%2FKP%2FcSBdhYOhh4HAXHckm0FVsUA&X-Amz-Signature=33d845923fb1e150fd3c01156b42d611c348132f10e8a2751bf2ecc3aeb110c3&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4662FPB4T4X%2F20260803%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260803T014834Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEB4aCXVzLXdlc3QtMiJIMEYCIQCvd8bIR06LaX%2BOvOwNmku1tsFLfUg18hW60Yn1H4nKgwIhALgGFjn6mNYmQ3ZnpT08Tn1o5h5%2FG5Zig2YgtRXJECyiKogECOf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1Igws0Hjq0As35asvPPEq3AOVS2BnvQwmdFzMkM2onDjTRaQbrjb3ZX6a90%2BBwNOCL34t8JaMmHROp4vXb%2BhpV6R3U0K0m64p5UxS0XuJNWn3Z%2B4Qz4oTK%2B4yC%2Bc6dRBjTc54j%2BY19EnAyXGn9Tvs9JH0JzTJByTNCx%2BbQVRkY7ZGyYpHc%2FKmlmAIoIPFj423z%2F%2Fw0okR2xi649Pgsz1v2M0Ya7XC2ImgnavLUHvH5KOIwBoFq39LsrGSkPF4KhCUbR1RizOmkbbfE%2FQq0j4OUESB%2BVaPKK%2FJkoSwd%2FAZcvzLDm6PffFYdlTq3ZJr%2FvxjDffboV%2BNuHC1hvEmHrV%2BD10xeuiuq8IIBCZ3djcG%2FSlxYdECVgHZU%2Bs8u1gzWfNoQPouoyqqMTFN3klVhZedCwcJSnnmfsRESFMbfnXoXj9g%2F3pONnutAfyDWC0xgpXS%2Fy2veIioy8AoHfjsjHEIccMvlKLpmPRl9wH1plBRsI%2Bk0m7vccybBUTJ6JR9GKiWU5Z%2BDYktWlX0wGn%2FAXv2cDc9gLcilrfwpss%2BAz9dXMXC2cdLlBiq3%2BQfhg6rAWxSJHhq7eD2bVT4MVCkgD8MUuleLW6QoGdtC2j%2FjDsteh5y2eU4Qf9ewH7N1tt8S9p9%2Fg5KSFpxNgu521nDBzCqgb%2FTBjqkAbUejRuSatOY0S1eQiW9C%2Bhjt9Rdo%2FE%2BOTL5vYWWBkRop0MP9Z4RjsYwyBHYNaIUAPiurvOnP5ZtTM3vCcPU4Of8zHixbgQgYkkQExlG3ph%2FQbyRJd%2BlAv4grJmufR9roCfq6706naZZzwUdCVaVozi86fuUSd7BSGGw6RRkIDvDpH8OBsq67C%2FsgSdqUON1g%2FKP%2FcSBdhYOhh4HAXHckm0FVsUA&X-Amz-Signature=b5db89d2389d46f01ff829cb0fbd4091fb8c26a3ab988238f021ce783333e5d8&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

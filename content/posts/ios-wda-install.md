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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4664PPCBF2R%2F20260425%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260425T070135Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEMb%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIA9aAyqGnVcYZRxe7k02fyQstmT97iTAlmDYCmZkUNy2AiBd0oLIWcvoBm6pjQXNv5HxlIP55%2FHSjha7udL1FfZdSCqIBAiP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMtASQLtlvTeBqAWdPKtwDwCQEOIzOvT8Il%2FBL8JY9VyzyKHzpvS9IG%2Bqv2DYcL%2FcJ9Bm805Fii3j5y%2BkoJyD9PqPdwUKgWgI%2BuRRVmF%2BfKoyXh6vbFIcCAU6AJeDYbKcYwZBmGL1AvAPB6W%2BdBE3NLrpSQpQzOIh%2BYvTVtu9lB%2BtWkOrbVjB8yzmwhaZ9qWTRZtthc5LulAyuJQHJDXBWwVJIFCN3OPbk0Q23RbAKurnWJdv13ks25GkANzL8jBR2W0sIoTdl%2FfP3MIlhF5cV15oeC18CHppYK%2BXlc4ehcSOhq%2FNKubTwfNoSnNn8%2BWiPrNseb%2FblR64NoJFORK1pa1ACjaXMqVBQv3frM06LOmHbCBMy9q4Ai8FmyXYrqmwdaRpH9PfMIo2bxLt48fjAvM8%2BxDMsuCnsEZ8v1HSQWXRxhLlApwPjtcvn4SaMq2XfF7aeKIk2kkzCB9ytlf7QUbTpnJEXPhOSuChhALhdNBaKffOMahzy%2FoBPEmKX698XGvRVwS14yWTEwoWw9dGme5zHu3ySf6doqUU6yhEPL9DqT1Ybzt%2Fo%2B%2BYu1MI8Ee%2Fhm0WoIWMwFhkIXHZ38OGczs4BzBZLoI6CPr0HnZWI3zEq9oyp2l6A1yPoGKYfBVGZvvxqimWw3DeDrO0wnq%2BxzwY6pgHXNbPLm2ut5jqTMw0GOF8cDEeXIw3JKzgF9dSukcf57Y6w4TYjU%2FmEgltN4q6DyPDEz6XuPc%2FFvACBMzmgsqWMi%2F8mubzK1TfIHQ2n4JRQL0hWaXAeUkqn0mjQQQIIfYg5Au%2F7%2FcjTcHqjZYkj9RbsKAbYNHFljOhSfiLnNICXreemGgAuGmFp3lKHhKvpzoN%2FSnTTc%2BcIXXi%2BBMs%2Bb8sYWBv1%2Fhao&X-Amz-Signature=3640240de516012d5b4c607ca5d04297ddd19e69dd1635decf9aab8f669d7fc9&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4664PPCBF2R%2F20260425%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260425T070135Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEMb%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIA9aAyqGnVcYZRxe7k02fyQstmT97iTAlmDYCmZkUNy2AiBd0oLIWcvoBm6pjQXNv5HxlIP55%2FHSjha7udL1FfZdSCqIBAiP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMtASQLtlvTeBqAWdPKtwDwCQEOIzOvT8Il%2FBL8JY9VyzyKHzpvS9IG%2Bqv2DYcL%2FcJ9Bm805Fii3j5y%2BkoJyD9PqPdwUKgWgI%2BuRRVmF%2BfKoyXh6vbFIcCAU6AJeDYbKcYwZBmGL1AvAPB6W%2BdBE3NLrpSQpQzOIh%2BYvTVtu9lB%2BtWkOrbVjB8yzmwhaZ9qWTRZtthc5LulAyuJQHJDXBWwVJIFCN3OPbk0Q23RbAKurnWJdv13ks25GkANzL8jBR2W0sIoTdl%2FfP3MIlhF5cV15oeC18CHppYK%2BXlc4ehcSOhq%2FNKubTwfNoSnNn8%2BWiPrNseb%2FblR64NoJFORK1pa1ACjaXMqVBQv3frM06LOmHbCBMy9q4Ai8FmyXYrqmwdaRpH9PfMIo2bxLt48fjAvM8%2BxDMsuCnsEZ8v1HSQWXRxhLlApwPjtcvn4SaMq2XfF7aeKIk2kkzCB9ytlf7QUbTpnJEXPhOSuChhALhdNBaKffOMahzy%2FoBPEmKX698XGvRVwS14yWTEwoWw9dGme5zHu3ySf6doqUU6yhEPL9DqT1Ybzt%2Fo%2B%2BYu1MI8Ee%2Fhm0WoIWMwFhkIXHZ38OGczs4BzBZLoI6CPr0HnZWI3zEq9oyp2l6A1yPoGKYfBVGZvvxqimWw3DeDrO0wnq%2BxzwY6pgHXNbPLm2ut5jqTMw0GOF8cDEeXIw3JKzgF9dSukcf57Y6w4TYjU%2FmEgltN4q6DyPDEz6XuPc%2FFvACBMzmgsqWMi%2F8mubzK1TfIHQ2n4JRQL0hWaXAeUkqn0mjQQQIIfYg5Au%2F7%2FcjTcHqjZYkj9RbsKAbYNHFljOhSfiLnNICXreemGgAuGmFp3lKHhKvpzoN%2FSnTTc%2BcIXXi%2BBMs%2Bb8sYWBv1%2Fhao&X-Amz-Signature=2ff8fe87e5ff772cc85dcc95e41dee93173a738e81146518d9276ff44c96dfb5&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

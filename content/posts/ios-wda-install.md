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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466WBTA24IM%2F20260717%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260717T014344Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEIn%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQDuriXB0sKc6O1q40bo9wcgvO7AHTCzI1JY2neTXz51xAIhAKX40sVQJPLQeJMYslMuCPBsrIfiq9nT5ywqyxXVpFhsKv8DCFIQABoMNjM3NDIzMTgzODA1IgycQxuxrkko04OzlhEq3ANBFVWj2WvpK6XvO%2F6KE65grsK1W4R0qsHMzvpwGwT4fwcjSvUIooXsQmcL5PAu1miQZnS3Fr6kuvkDjbjHk6vmNE%2BOTBhajU9XeI23F9viLMtTYeu9U%2BPzNJEIPU04ueFzItUfN3mhM1L5Wr6sXSeymB5jYr2zVSzrRW3k0l%2BYd1HSZEplRVsvAAtgiuSa2T49rtkotwZpU6D2mv0IY4jTm4GZZ5gXQvVvGpOAXdCn8qsTaPrTy8GQaQIbuMQMyJOKFRUjp1y2yQTKJ66gEvcI3pxUsekuaCF06vOkEE9i9odM1GDvTGUoitYbJM%2BaUkbVtLFkHO3B8%2Fbo8gJAgVO7HJN1OJlpDO9IDntRi5ILNiQltrm%2FzlX%2F2Y0aCHYmt5%2BVXXn0w5FCdskit8TT2bKBzpYOWCTuEhxO7U2Xb%2Fdn7kENZd6cGXyi8GZsadSdZYjSHNlLDaYUb1Q%2B%2F3ZxSUa7CbsmJI4NrWxFiI7tc1tRWjaru%2BgXIo1D6dGpaNqLsB%2BaEm9WwEdiOBS3PdD0yxV2g9bYfFaLy0xkCedLhezRhdIurLctt3CwVXrkIzKTcF2Hd3pNMOFzTEkMbToYxRrb6F6IJFnRi%2BrSyLR5RIoVPyECnaFRUNACRE7uljDW8eXSBjqkAeURDvkhxQ9%2FM7hb%2BkoTM8uDanKQkxr0QghcAq%2Fl8wtLrnpq6ZK%2BIYUkIf7ApMRzRwwfUwZUCUaQB0Htd3aF7GP2Y7G4%2Bvmg0aaT2WajPfu%2BAUaWEIObihWC13N%2BvtuYms3DjmNM9VUU7iJ11Gy6qPDdQIcg%2FGpCgVHEdjWbEpUsDHCV2s3waCDs1Z%2BCDp4Y4atBL8SCQyA%2BxBqQVe3duvkyOrQS&X-Amz-Signature=d0bfc5731266619d0e802e9cd6b74509847365077a7b0cba9efed99992cfc6a7&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466WBTA24IM%2F20260717%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260717T014344Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEIn%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQDuriXB0sKc6O1q40bo9wcgvO7AHTCzI1JY2neTXz51xAIhAKX40sVQJPLQeJMYslMuCPBsrIfiq9nT5ywqyxXVpFhsKv8DCFIQABoMNjM3NDIzMTgzODA1IgycQxuxrkko04OzlhEq3ANBFVWj2WvpK6XvO%2F6KE65grsK1W4R0qsHMzvpwGwT4fwcjSvUIooXsQmcL5PAu1miQZnS3Fr6kuvkDjbjHk6vmNE%2BOTBhajU9XeI23F9viLMtTYeu9U%2BPzNJEIPU04ueFzItUfN3mhM1L5Wr6sXSeymB5jYr2zVSzrRW3k0l%2BYd1HSZEplRVsvAAtgiuSa2T49rtkotwZpU6D2mv0IY4jTm4GZZ5gXQvVvGpOAXdCn8qsTaPrTy8GQaQIbuMQMyJOKFRUjp1y2yQTKJ66gEvcI3pxUsekuaCF06vOkEE9i9odM1GDvTGUoitYbJM%2BaUkbVtLFkHO3B8%2Fbo8gJAgVO7HJN1OJlpDO9IDntRi5ILNiQltrm%2FzlX%2F2Y0aCHYmt5%2BVXXn0w5FCdskit8TT2bKBzpYOWCTuEhxO7U2Xb%2Fdn7kENZd6cGXyi8GZsadSdZYjSHNlLDaYUb1Q%2B%2F3ZxSUa7CbsmJI4NrWxFiI7tc1tRWjaru%2BgXIo1D6dGpaNqLsB%2BaEm9WwEdiOBS3PdD0yxV2g9bYfFaLy0xkCedLhezRhdIurLctt3CwVXrkIzKTcF2Hd3pNMOFzTEkMbToYxRrb6F6IJFnRi%2BrSyLR5RIoVPyECnaFRUNACRE7uljDW8eXSBjqkAeURDvkhxQ9%2FM7hb%2BkoTM8uDanKQkxr0QghcAq%2Fl8wtLrnpq6ZK%2BIYUkIf7ApMRzRwwfUwZUCUaQB0Htd3aF7GP2Y7G4%2Bvmg0aaT2WajPfu%2BAUaWEIObihWC13N%2BvtuYms3DjmNM9VUU7iJ11Gy6qPDdQIcg%2FGpCgVHEdjWbEpUsDHCV2s3waCDs1Z%2BCDp4Y4atBL8SCQyA%2BxBqQVe3duvkyOrQS&X-Amz-Signature=a9db296c3eab7deb346463740f673d2dd39f51020252060291aeb9041313f0a8&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

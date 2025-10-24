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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4662EZYQ3JZ%2F20251024%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251024T122203Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEKT%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIB5m11B1td1mudCyWUgq%2BteamU0X1U6QAIqKaD6tdBOoAiBlT%2FkSkeRi09ViAZ6zXwvbck27m7GWx0ogpRV5kRhs%2BSr%2FAwhdEAAaDDYzNzQyMzE4MzgwNSIMziwmfOnBKeo2sMUmKtwDHps9aBcReT%2FjvB8TnQOZNz3Va%2BtHqgDOfKlDGsYhzuOSrkIQ7hPVk2KTZ7SWA6627IeadAxUWOHKqbmzUq1HyTO8KCs%2B9KHv7%2FezWx9%2BA9CXlduM%2FNQpmFBjHBPWOtrI%2FvOeToC0ocaYF60HwTl0svBSyr6adkgWvM78UuV5gMpYdrTJE%2F6Sowxur%2BllItU7kXokiRQU82jcr83RgYGgVnIDwLTSLlpk%2B6U0r40bofqEIp59AE2A2O2G7R1ExlyiCC4q1uLRw6ikQ%2FUTzLbAEaKgUkb%2B3bsKA7e7RQA8HJpwcFL6YDubpFJdGfmf0HKFmzzPaPPaxOD4zkYSmio1p2Qpu%2Bxd3cAtZXILLICaGX%2F1ltMwGNA%2BCkvmM0FfwHUad%2Fe4JY6vy%2BnHDnPy6A5WpOqIOeUJnIjr6lQl%2BnL%2FcyuGQn7QkwJ30MaFtmW7afHYW6ZlFxCC6tZls%2BvHByLWKxp7HC1lICJz%2B6dQgJ2FMAMvjne5v2kxz3RYL9P6mrQTivQzYxMVg0k9ymkbt0aoUWWCKI3x%2BNzCu6oPUaOFYErzqr2iiFsyIxHdcNQ5%2Fyqc%2Bogz6DQRfjTzIi3UmLPeompdDGTNVqkEEW7P5VBESYLzUSYhdO1y%2BNwyD0Iw6tztxwY6pgHO1GC0q14eQtHhvadFO9MwtmaS5XavAM2jNIibQDPcBH1i996a3aYb2RteQ9nF61BhftnY91Gy5hE77vfRH%2Ffypu64m7ituhJwhlxF0hVRHbsenz8AvzMeUkhPwRY3e8DIN8aWFMQj7lNSmiW8SkAZ65b%2B19IaMTfAfgZePvMjnkwaKxMvchBNGSB6cUbzCiM3N2k0sROasm4vRV8lr2sCsJ2sQ8vp&X-Amz-Signature=e42b74ac83bdd73ef62ec4343b099718942f5834d8e4ecd6aa05e579a075db0d&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4662EZYQ3JZ%2F20251024%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251024T122203Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEKT%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIB5m11B1td1mudCyWUgq%2BteamU0X1U6QAIqKaD6tdBOoAiBlT%2FkSkeRi09ViAZ6zXwvbck27m7GWx0ogpRV5kRhs%2BSr%2FAwhdEAAaDDYzNzQyMzE4MzgwNSIMziwmfOnBKeo2sMUmKtwDHps9aBcReT%2FjvB8TnQOZNz3Va%2BtHqgDOfKlDGsYhzuOSrkIQ7hPVk2KTZ7SWA6627IeadAxUWOHKqbmzUq1HyTO8KCs%2B9KHv7%2FezWx9%2BA9CXlduM%2FNQpmFBjHBPWOtrI%2FvOeToC0ocaYF60HwTl0svBSyr6adkgWvM78UuV5gMpYdrTJE%2F6Sowxur%2BllItU7kXokiRQU82jcr83RgYGgVnIDwLTSLlpk%2B6U0r40bofqEIp59AE2A2O2G7R1ExlyiCC4q1uLRw6ikQ%2FUTzLbAEaKgUkb%2B3bsKA7e7RQA8HJpwcFL6YDubpFJdGfmf0HKFmzzPaPPaxOD4zkYSmio1p2Qpu%2Bxd3cAtZXILLICaGX%2F1ltMwGNA%2BCkvmM0FfwHUad%2Fe4JY6vy%2BnHDnPy6A5WpOqIOeUJnIjr6lQl%2BnL%2FcyuGQn7QkwJ30MaFtmW7afHYW6ZlFxCC6tZls%2BvHByLWKxp7HC1lICJz%2B6dQgJ2FMAMvjne5v2kxz3RYL9P6mrQTivQzYxMVg0k9ymkbt0aoUWWCKI3x%2BNzCu6oPUaOFYErzqr2iiFsyIxHdcNQ5%2Fyqc%2Bogz6DQRfjTzIi3UmLPeompdDGTNVqkEEW7P5VBESYLzUSYhdO1y%2BNwyD0Iw6tztxwY6pgHO1GC0q14eQtHhvadFO9MwtmaS5XavAM2jNIibQDPcBH1i996a3aYb2RteQ9nF61BhftnY91Gy5hE77vfRH%2Ffypu64m7ituhJwhlxF0hVRHbsenz8AvzMeUkhPwRY3e8DIN8aWFMQj7lNSmiW8SkAZ65b%2B19IaMTfAfgZePvMjnkwaKxMvchBNGSB6cUbzCiM3N2k0sROasm4vRV8lr2sCsJ2sQ8vp&X-Amz-Signature=b361518e149b3f54a79d4227e0fa04c76ff40114614f77401e598c11114235dc&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

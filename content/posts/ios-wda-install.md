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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4662MDXQIX2%2F20260613%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260613T084524Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEGAaCXVzLXdlc3QtMiJGMEQCIFwVZhzledGs6zTPgiYBwy23f0piWANReLWbJ1K%2FaIrFAiBIAelLxtRyE3EyeVHdgZqW%2FENeUXuDYpcOxatlq6ZDuCr%2FAwgpEAAaDDYzNzQyMzE4MzgwNSIMCBFcXcJyoetsKayLKtwD94iTFvSHAibBMB4xCT%2Bo%2BOr40jYAr4gpn8Rl7nRc9MHVE038GClVUZEie32dAymOj0ha1hWrodV%2FBqMs1oYrYP5DgKJWRGX1dAqNYvTsULOyzrJ9muhnYmcty8BTkxAfxMbOfOVtm3LyKP00cds1RK%2FUgP7J9j%2Bam%2FQH8cuxphBzGEu%2F%2BNjGidXrbmaX%2F4axca3F3E9Nt1OfbONYBBt9HQtc0gsha8sBFg7wWpbYyQ%2FDQJuoGG%2ByD5MpgdCld0EVs8VjniGeHYWGIpYm7ZRUxxxLtZGh4wewSSS8xcd8r8fQCLOUCQEByOdLP%2B3otofQWeroHmj6ftUjdX%2FfSQmkEyq7RN%2FSw5wzJIcN%2BSEC1BRS2TfftFfIzbH5NiNO%2Fx1ElQ7uS4BtAv7neJNwJaFxNqnu6NR5StlvRGSUm18GFbUGkSSn%2F%2Bj%2FBGy51ATFZVRyytmbAPXTJ9ZIBtiPHcYOh36f5NK8SHgqpUSXS7hWvPB4vsO7F%2B4vSFjxHk9mf%2B79MgqJ07YWzU59h83RnH9hQif5nZZmtWPuZwOcOFy9OwYrrCbIXNa4GlriahxXIEcXxgGYcQRcQnLwMCEtDvlQShXZC1NlBh%2FTUoEcmehZoDMKxuNrgdjRzH6FUvkwpaK00QY6pgFard0gC8DckP4vuWBte%2Bc%2B2AeFlM4cvlV0AnX636n1e7lOYlJKxJnj2yV0VHglFeWZgMQO4Kiinc%2B2rC%2Bjsa1jHOo8NborQ%2FJlWoyIWczHbjkKnPGwBXCmbvoppsnCkPON7ri%2B4zwGEI7C3%2Fuv9Jnr1fSbxwyjScxIOpVi0Id9lb9h%2FO%2FzSpl7y5GKoQkBjpRxhF2f04r7BdUIsrAKW7kpHulVllgQ&X-Amz-Signature=549dc4e28e2299fb0660270990a0f15eadfb3802a0f266a8b4142014965b3bdd&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4662MDXQIX2%2F20260613%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260613T084524Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEGAaCXVzLXdlc3QtMiJGMEQCIFwVZhzledGs6zTPgiYBwy23f0piWANReLWbJ1K%2FaIrFAiBIAelLxtRyE3EyeVHdgZqW%2FENeUXuDYpcOxatlq6ZDuCr%2FAwgpEAAaDDYzNzQyMzE4MzgwNSIMCBFcXcJyoetsKayLKtwD94iTFvSHAibBMB4xCT%2Bo%2BOr40jYAr4gpn8Rl7nRc9MHVE038GClVUZEie32dAymOj0ha1hWrodV%2FBqMs1oYrYP5DgKJWRGX1dAqNYvTsULOyzrJ9muhnYmcty8BTkxAfxMbOfOVtm3LyKP00cds1RK%2FUgP7J9j%2Bam%2FQH8cuxphBzGEu%2F%2BNjGidXrbmaX%2F4axca3F3E9Nt1OfbONYBBt9HQtc0gsha8sBFg7wWpbYyQ%2FDQJuoGG%2ByD5MpgdCld0EVs8VjniGeHYWGIpYm7ZRUxxxLtZGh4wewSSS8xcd8r8fQCLOUCQEByOdLP%2B3otofQWeroHmj6ftUjdX%2FfSQmkEyq7RN%2FSw5wzJIcN%2BSEC1BRS2TfftFfIzbH5NiNO%2Fx1ElQ7uS4BtAv7neJNwJaFxNqnu6NR5StlvRGSUm18GFbUGkSSn%2F%2Bj%2FBGy51ATFZVRyytmbAPXTJ9ZIBtiPHcYOh36f5NK8SHgqpUSXS7hWvPB4vsO7F%2B4vSFjxHk9mf%2B79MgqJ07YWzU59h83RnH9hQif5nZZmtWPuZwOcOFy9OwYrrCbIXNa4GlriahxXIEcXxgGYcQRcQnLwMCEtDvlQShXZC1NlBh%2FTUoEcmehZoDMKxuNrgdjRzH6FUvkwpaK00QY6pgFard0gC8DckP4vuWBte%2Bc%2B2AeFlM4cvlV0AnX636n1e7lOYlJKxJnj2yV0VHglFeWZgMQO4Kiinc%2B2rC%2Bjsa1jHOo8NborQ%2FJlWoyIWczHbjkKnPGwBXCmbvoppsnCkPON7ri%2B4zwGEI7C3%2Fuv9Jnr1fSbxwyjScxIOpVi0Id9lb9h%2FO%2FzSpl7y5GKoQkBjpRxhF2f04r7BdUIsrAKW7kpHulVllgQ&X-Amz-Signature=e76d94df6a22ad452c068a6406fd283b85f767d27c56ea1032da4786a1ea426e&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

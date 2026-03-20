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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466UQX6MQWW%2F20260320%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260320T064058Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEGcaCXVzLXdlc3QtMiJGMEQCIDWaEbaiko0yUQHaslH1WiZHE3IrepwD8y5uwyq5kEi1AiA%2B7EFPiWvDePaz5PvwiTLcnGbOYSv7h1dpGYz86lP72Cr%2FAwgwEAAaDDYzNzQyMzE4MzgwNSIMP%2BxT3Tzqn5LmdjGvKtwDWRWJTBI8E7iuKovJXsJREUkAJnNq4fyHJD%2FItaqrG%2FnSxU4qrgM16FSwMrbrN886JWbTCZZXMDM939q%2BUQkVNW0lDaGksMNQXKhTgLNDsvNp%2FUd4znsMycqqTSpDnw5mc5Vfj9jEzq5U36x%2BRX4lT9s4cQUDwFH7n7rhyyG7PmuHA3bpYqPHjZWac7eknRPY3230k3oNevoRZ3vvgOaA47p%2FEt0PN9kMj1t%2FHbeqTuSAUJ04wt0pzUrTEA8Bl8a2KHM4sSlo0ui1c%2FKTIxIQDToVSjXLJYISRWCsIldgIx0sSYEkDnOcg1LlEtFMJS0UU2t%2BwgXAASvgshFLFBjuejnhYZ16zH%2BJV5d%2FBfh0xK91GiXFh7XIc4Aseg4XjDKlZsZ3nzsrPDheEYd%2BG%2F8zbKKSEWtkUK%2FmEZ0NJO9eIqNzWU71HAiurFJL3zTVIVxknxO0zecyA4a0zgVO1o0dH24i1ozG1PtA30ZQ5FDoHG6Ebak2ghZMDsCkHi3qeNCo72RxAQaiGe62eYHkzLRmQz9yYA7e3qObOXDo4o8fMb5jSWP34y1SoLI%2B5Q8b%2BQsWgVj3C0q7GNttVLqi0CeaTll1TanIjP23taSYwpSZArJ7ftz8%2BVd%2BU3QLd6gwsdfzzQY6pgGDIF6GeJrnZiDgOHQxa%2B3Ko47hLkyC%2Fh%2FS3F5%2FJ86RqIOv8T4Mqg9HKhwNEAAE3vUcc0yg2rL8zCnuB5yj%2FcWpf92EN6R%2BZoqVVNndu7yT75vybZ4R0ZVXslLBUcGsiLToQHlpNkpyGcZoJ3NF3dAZD1WXiXGylQD%2BQ8U%2FZetz0uipiBWYfYMO3qzrs8%2FyY9p%2FcEu64d5XkmxL8PObxU5AN6ax8yXE&X-Amz-Signature=e2eafb0ea27ea578b6a756095f03868dfd73e5905543b1f1f840df4bef2af00f&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466UQX6MQWW%2F20260320%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260320T064058Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEGcaCXVzLXdlc3QtMiJGMEQCIDWaEbaiko0yUQHaslH1WiZHE3IrepwD8y5uwyq5kEi1AiA%2B7EFPiWvDePaz5PvwiTLcnGbOYSv7h1dpGYz86lP72Cr%2FAwgwEAAaDDYzNzQyMzE4MzgwNSIMP%2BxT3Tzqn5LmdjGvKtwDWRWJTBI8E7iuKovJXsJREUkAJnNq4fyHJD%2FItaqrG%2FnSxU4qrgM16FSwMrbrN886JWbTCZZXMDM939q%2BUQkVNW0lDaGksMNQXKhTgLNDsvNp%2FUd4znsMycqqTSpDnw5mc5Vfj9jEzq5U36x%2BRX4lT9s4cQUDwFH7n7rhyyG7PmuHA3bpYqPHjZWac7eknRPY3230k3oNevoRZ3vvgOaA47p%2FEt0PN9kMj1t%2FHbeqTuSAUJ04wt0pzUrTEA8Bl8a2KHM4sSlo0ui1c%2FKTIxIQDToVSjXLJYISRWCsIldgIx0sSYEkDnOcg1LlEtFMJS0UU2t%2BwgXAASvgshFLFBjuejnhYZ16zH%2BJV5d%2FBfh0xK91GiXFh7XIc4Aseg4XjDKlZsZ3nzsrPDheEYd%2BG%2F8zbKKSEWtkUK%2FmEZ0NJO9eIqNzWU71HAiurFJL3zTVIVxknxO0zecyA4a0zgVO1o0dH24i1ozG1PtA30ZQ5FDoHG6Ebak2ghZMDsCkHi3qeNCo72RxAQaiGe62eYHkzLRmQz9yYA7e3qObOXDo4o8fMb5jSWP34y1SoLI%2B5Q8b%2BQsWgVj3C0q7GNttVLqi0CeaTll1TanIjP23taSYwpSZArJ7ftz8%2BVd%2BU3QLd6gwsdfzzQY6pgGDIF6GeJrnZiDgOHQxa%2B3Ko47hLkyC%2Fh%2FS3F5%2FJ86RqIOv8T4Mqg9HKhwNEAAE3vUcc0yg2rL8zCnuB5yj%2FcWpf92EN6R%2BZoqVVNndu7yT75vybZ4R0ZVXslLBUcGsiLToQHlpNkpyGcZoJ3NF3dAZD1WXiXGylQD%2BQ8U%2FZetz0uipiBWYfYMO3qzrs8%2FyY9p%2FcEu64d5XkmxL8PObxU5AN6ax8yXE&X-Amz-Signature=9b0ec36dc8853b0f4020a9a8d48cda2478c56682351a474a53a3bac1f766b598&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

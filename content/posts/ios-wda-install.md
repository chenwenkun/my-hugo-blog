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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466SQZ2HTO6%2F20260226%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260226T010901Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEFAaCXVzLXdlc3QtMiJHMEUCIGRMrWYr%2Bck4iQC6ZELdQWXIZJCDcO%2F22LOLMyXSrGyxAiEAtr094ZbD95EbAKRxg8%2B9PJUMeqU83KscJs0idGyhtYsq%2FwMIGRAAGgw2Mzc0MjMxODM4MDUiDAfpo5jXcDFSPGmShircA7lsUwDG3JdFBiyIjVWeLPEgtp%2FgZ4ndrdLtrCMmEVuBGieBdYwiO6jj1u8LtyvEdzVrtzBnDJ7%2BhKHiNmbbiSGkw86kUL8Im1q4xLOORmZpGOk705HH7dyptMoOIBOA%2BpJgctU3NdGSJ0DO4X%2FCsVnTDmOKWX6rqq%2FgXCF2C52uo6H%2B2kRNZtSR2p9RnllDcEoaC6kFNPPS8lnvbdnb12wDYiQ83TfkTRm6rrYYdnwMnkuSHQUUBwDY47rVNZC0ja2%2Fa0i3nhsGEdW5KrrxEu93cwb3J2am5YAHbx0tAgFMefK1dItzo4GzsCMZc%2BEfwenoDWcT5dGGkY18TiwzYVgL0gt4V2eiJ%2BdzD%2Btx1c8Z2D8RBcvuTdjDWW8QkBpwtg2NdP9Gg9c9zIubVX3pIBuBViaf0AWUWlne2Ha8TrhUKUcxyEjHS7450xU74vQTwuCbDfweoIP44NSJ637P3977%2Bzrg7l35NRFZj7EllMP%2FrwzK47oPWYeMVjA%2BFCdtlJJbJx%2Fj8R9zmRgng%2FNg826onlGN7mbFwO0dKsPbvGuy8jLrgbYQKmm4iBUzQDb9rdkqeuNB2oNX9TC%2BIJ5og1rOnQHs%2Fo6rRL%2FnvAp9py6qjSnwXpY9aHb2iUDPMOmc%2FswGOqUB9yj%2B3hlJExG56i0siYUZJ%2F6S7Ue6jJ1ta2TKgbS%2B8Zc%2BqbBUhS2K%2BfQfpimxVxIvNjSpGU87S3JrZfVFS%2F3ZYuY7nbaZfnSdvRKARUt8vrVHpbKoRsuUqEqnotOMrXYxpIHmy%2ByD97a7j%2B%2FcLarptLzw8uiJIbBGTo829%2BH8D%2BhOOmN8aWoz2%2FDhk9N2PgH3PyXmuT24FIQozDkbWI0aX6QyAmNt&X-Amz-Signature=f797234807430797898d997fc054a0c8a1aa4f7904b8bd435e7de5669ebcd286&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466SQZ2HTO6%2F20260226%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260226T010901Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEFAaCXVzLXdlc3QtMiJHMEUCIGRMrWYr%2Bck4iQC6ZELdQWXIZJCDcO%2F22LOLMyXSrGyxAiEAtr094ZbD95EbAKRxg8%2B9PJUMeqU83KscJs0idGyhtYsq%2FwMIGRAAGgw2Mzc0MjMxODM4MDUiDAfpo5jXcDFSPGmShircA7lsUwDG3JdFBiyIjVWeLPEgtp%2FgZ4ndrdLtrCMmEVuBGieBdYwiO6jj1u8LtyvEdzVrtzBnDJ7%2BhKHiNmbbiSGkw86kUL8Im1q4xLOORmZpGOk705HH7dyptMoOIBOA%2BpJgctU3NdGSJ0DO4X%2FCsVnTDmOKWX6rqq%2FgXCF2C52uo6H%2B2kRNZtSR2p9RnllDcEoaC6kFNPPS8lnvbdnb12wDYiQ83TfkTRm6rrYYdnwMnkuSHQUUBwDY47rVNZC0ja2%2Fa0i3nhsGEdW5KrrxEu93cwb3J2am5YAHbx0tAgFMefK1dItzo4GzsCMZc%2BEfwenoDWcT5dGGkY18TiwzYVgL0gt4V2eiJ%2BdzD%2Btx1c8Z2D8RBcvuTdjDWW8QkBpwtg2NdP9Gg9c9zIubVX3pIBuBViaf0AWUWlne2Ha8TrhUKUcxyEjHS7450xU74vQTwuCbDfweoIP44NSJ637P3977%2Bzrg7l35NRFZj7EllMP%2FrwzK47oPWYeMVjA%2BFCdtlJJbJx%2Fj8R9zmRgng%2FNg826onlGN7mbFwO0dKsPbvGuy8jLrgbYQKmm4iBUzQDb9rdkqeuNB2oNX9TC%2BIJ5og1rOnQHs%2Fo6rRL%2FnvAp9py6qjSnwXpY9aHb2iUDPMOmc%2FswGOqUB9yj%2B3hlJExG56i0siYUZJ%2F6S7Ue6jJ1ta2TKgbS%2B8Zc%2BqbBUhS2K%2BfQfpimxVxIvNjSpGU87S3JrZfVFS%2F3ZYuY7nbaZfnSdvRKARUt8vrVHpbKoRsuUqEqnotOMrXYxpIHmy%2ByD97a7j%2B%2FcLarptLzw8uiJIbBGTo829%2BH8D%2BhOOmN8aWoz2%2FDhk9N2PgH3PyXmuT24FIQozDkbWI0aX6QyAmNt&X-Amz-Signature=74e34584f31553261a155d5a7349decdfa557b5231fa62a9c3f16ecd1a64f7bb&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

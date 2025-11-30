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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4662WBKE562%2F20251130%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251130T061656Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEBUaCXVzLXdlc3QtMiJGMEQCIFZugJDS%2B9ABbvgBRGvGLtQBOaj4ccSsGwV%2FVOJ70cAQAiBmIMbc9mA7WkspTFtu69ld8%2B4d9r1QxzdsmL3Vy5R3BCqIBAje%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMsXeCfw29Ldm13%2BqSKtwD2qo13MGpYGYfSRSzLxhD6K5pf%2Fw8GqYGkLNJwAPpf%2FB0Z3l7pjB7zSgtY9pTIVPMy%2FE23XZpRmEm6haQLAYw6Kmwx4QXmTJAGgan1Xan5vTPyYBSimhSnuh0QLLX%2B8PxsRMdqJC67Fw9DV8Ds7vTlnEIq%2BwuQhpVWClnJL3GNjyeQpCMJm8CGkfokYf%2BhS80CeR8uYr%2Fq882bKxbUSdY3i56%2F4l%2BFqCIWO6k4OVpI9VEQe9CVNXiws3a6rTWPF8HDKfGiV7guqZxoTy8Y6Fg2rg2Su3C%2BhIggvv8GNsWDazNcQ1fFb9VffR2otxKWVKOI2qaYuhba1%2BNUcvvzWXGT3AEltPl2VEnFzDlt6haEoKjW9LysFgr2cp0IGf2qbL9BHp%2FD0on%2BHG6u%2FQyoFwYZnsJMtL5CyTB%2FzV55xbBP%2FUSFndTprtsP7qd3d9cPAyr400ZrufhefvOqbGRlNewSN8c0SMtx7mryqSloPGwVCzEAyBuCQHsQ38VVjyCsEbDToDOW8StlgTJzIZ4%2BgcXYLL74LxW6F%2B8gNjaSyzBHeWPi8JXPJ3RgIsDScPAaeZG4mwccICXGKinUnfnAXT0mvJ%2F%2BV4hPvJjSQeYZTicK1UAG49gQDd7yU%2Bqr80wi52vyQY6pgHa%2FjxR91LGSwxdUom%2Bufe1a1OtDwEkUapu8q6S4DX7fCyyKFvx4%2FrdFvt5xdjpMYep0r5SsApxD82DUkHKv0SuuylCLVCEXDLEI2tv2JDNaIyK8T5bQ24I5CktaFOxNZCnTOJFDejnQSL4M%2B4X6xEuCszka%2Be4nyGFAuNKU1BgQjpRL%2Ba3isMSu5NJ43ua76OPwbG97O%2BXi2BG5z74419xxgJaADoy&X-Amz-Signature=efc608154c4025f7196a48794fd66fa51d2cc798939cd527fe94d580d7aed272&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4662WBKE562%2F20251130%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251130T061656Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEBUaCXVzLXdlc3QtMiJGMEQCIFZugJDS%2B9ABbvgBRGvGLtQBOaj4ccSsGwV%2FVOJ70cAQAiBmIMbc9mA7WkspTFtu69ld8%2B4d9r1QxzdsmL3Vy5R3BCqIBAje%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMsXeCfw29Ldm13%2BqSKtwD2qo13MGpYGYfSRSzLxhD6K5pf%2Fw8GqYGkLNJwAPpf%2FB0Z3l7pjB7zSgtY9pTIVPMy%2FE23XZpRmEm6haQLAYw6Kmwx4QXmTJAGgan1Xan5vTPyYBSimhSnuh0QLLX%2B8PxsRMdqJC67Fw9DV8Ds7vTlnEIq%2BwuQhpVWClnJL3GNjyeQpCMJm8CGkfokYf%2BhS80CeR8uYr%2Fq882bKxbUSdY3i56%2F4l%2BFqCIWO6k4OVpI9VEQe9CVNXiws3a6rTWPF8HDKfGiV7guqZxoTy8Y6Fg2rg2Su3C%2BhIggvv8GNsWDazNcQ1fFb9VffR2otxKWVKOI2qaYuhba1%2BNUcvvzWXGT3AEltPl2VEnFzDlt6haEoKjW9LysFgr2cp0IGf2qbL9BHp%2FD0on%2BHG6u%2FQyoFwYZnsJMtL5CyTB%2FzV55xbBP%2FUSFndTprtsP7qd3d9cPAyr400ZrufhefvOqbGRlNewSN8c0SMtx7mryqSloPGwVCzEAyBuCQHsQ38VVjyCsEbDToDOW8StlgTJzIZ4%2BgcXYLL74LxW6F%2B8gNjaSyzBHeWPi8JXPJ3RgIsDScPAaeZG4mwccICXGKinUnfnAXT0mvJ%2F%2BV4hPvJjSQeYZTicK1UAG49gQDd7yU%2Bqr80wi52vyQY6pgHa%2FjxR91LGSwxdUom%2Bufe1a1OtDwEkUapu8q6S4DX7fCyyKFvx4%2FrdFvt5xdjpMYep0r5SsApxD82DUkHKv0SuuylCLVCEXDLEI2tv2JDNaIyK8T5bQ24I5CktaFOxNZCnTOJFDejnQSL4M%2B4X6xEuCszka%2Be4nyGFAuNKU1BgQjpRL%2Ba3isMSu5NJ43ua76OPwbG97O%2BXi2BG5z74419xxgJaADoy&X-Amz-Signature=ba2f70f3eb38b951131dce4d931e039e6b9bd70255b9445d7eefb4fe62c6dfac&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

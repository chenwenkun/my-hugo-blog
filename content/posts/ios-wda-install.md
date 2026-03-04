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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663OAZOPVA%2F20260304%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260304T183353Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEPL%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIC1p92eTj%2FboL1UaFao8yCJ2uGP9R4q7vOmSrFGq%2BfNSAiEAtdmjz7BNUQ%2Fgtdzb1RGxJwFISX4%2B41hHlREHa22FghUqiAQIu%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDEG1ToR4sv507iYxJyrcA%2BevmI4sEJTEtTe%2BWLKTF1e%2B2LuOJirNCoY9%2FrNkVtvnpIjw860oX%2BaWshK7lkM7jMowt30Z%2Bu0qTS0N497d0l2uBSiyUekXpruKTMFVqkOt%2BG4WAWERGEPTTKx96mmE8bm7x6iTa5FUHSTf5YVQ9V%2FI%2BsgtsdXcyd4WJwhZ%2FK%2FvFfrT8gjx6O%2FJyEInpPOTeLwhfzNz2I9EayQsQh5LggNRPgxPWVsIwC9tPd4YtkDmEq8go02sNMYX%2B1qAUEYQ5fuWn3ZNMJHkqn6x3lat18BBrfe9L%2B54KWQ20CWEQZUAuQL3KU%2BlFSAy2hs53P%2FjWyS0ssPmZyZNNy7X4kfNeQDT101fka2W1G%2FIdmlYuyK%2BUvk84Cy%2B%2BvJupBBvCpn4ld2RsjHE6ojYWvvhLtQQhTUewee38Trl2XOck1mofW1y2gxxiG5EWTWTLORlLmFiiI5bMBB%2BuZ6UCVFMm58itP4sFJpMsypAFrwMgs1%2Bl%2F7z%2FjRJgqeQPuK4d6idHaET8qUfJnxSrgO3JyBIJtrZrvhn%2F1tkVR7L6cQRW%2F%2BoMnKGNnJdaOlWaTikRR%2FpAv5%2FbErNxZDVZzUiTmEXRRDYFmSnmSickeXN7iunfDZeQj4IOEnktGkHe%2F5eE8LcMN%2Fioc0GOqUBbBNaiGAtHk43NMPNI5FOve5zYXTqxuWgYb6k%2F%2FwDtxTST3Ao4%2FDQdKaKZd7OZI71SBxUmrLDF3VKwgEHT0EAA%2FW6H2jN%2Bc5%2BkoiUSTMKc2CUabMQgUcYMg8P0wW9MhYFmPm6KI3yVaT3PMnaIrJX6vvbxZF6m%2ByP7DnGyc%2FEP2eE0YZlvk4uyrX8ttGR2wynOg5YbT3%2FhezhMzkZw5kyL%2FlqbQqt&X-Amz-Signature=3530017ff8231f39011a5786d73c88cddb9b49b19fb7efa8a2861dffc5f80b30&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663OAZOPVA%2F20260304%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260304T183353Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEPL%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIC1p92eTj%2FboL1UaFao8yCJ2uGP9R4q7vOmSrFGq%2BfNSAiEAtdmjz7BNUQ%2Fgtdzb1RGxJwFISX4%2B41hHlREHa22FghUqiAQIu%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDEG1ToR4sv507iYxJyrcA%2BevmI4sEJTEtTe%2BWLKTF1e%2B2LuOJirNCoY9%2FrNkVtvnpIjw860oX%2BaWshK7lkM7jMowt30Z%2Bu0qTS0N497d0l2uBSiyUekXpruKTMFVqkOt%2BG4WAWERGEPTTKx96mmE8bm7x6iTa5FUHSTf5YVQ9V%2FI%2BsgtsdXcyd4WJwhZ%2FK%2FvFfrT8gjx6O%2FJyEInpPOTeLwhfzNz2I9EayQsQh5LggNRPgxPWVsIwC9tPd4YtkDmEq8go02sNMYX%2B1qAUEYQ5fuWn3ZNMJHkqn6x3lat18BBrfe9L%2B54KWQ20CWEQZUAuQL3KU%2BlFSAy2hs53P%2FjWyS0ssPmZyZNNy7X4kfNeQDT101fka2W1G%2FIdmlYuyK%2BUvk84Cy%2B%2BvJupBBvCpn4ld2RsjHE6ojYWvvhLtQQhTUewee38Trl2XOck1mofW1y2gxxiG5EWTWTLORlLmFiiI5bMBB%2BuZ6UCVFMm58itP4sFJpMsypAFrwMgs1%2Bl%2F7z%2FjRJgqeQPuK4d6idHaET8qUfJnxSrgO3JyBIJtrZrvhn%2F1tkVR7L6cQRW%2F%2BoMnKGNnJdaOlWaTikRR%2FpAv5%2FbErNxZDVZzUiTmEXRRDYFmSnmSickeXN7iunfDZeQj4IOEnktGkHe%2F5eE8LcMN%2Fioc0GOqUBbBNaiGAtHk43NMPNI5FOve5zYXTqxuWgYb6k%2F%2FwDtxTST3Ao4%2FDQdKaKZd7OZI71SBxUmrLDF3VKwgEHT0EAA%2FW6H2jN%2Bc5%2BkoiUSTMKc2CUabMQgUcYMg8P0wW9MhYFmPm6KI3yVaT3PMnaIrJX6vvbxZF6m%2ByP7DnGyc%2FEP2eE0YZlvk4uyrX8ttGR2wynOg5YbT3%2FhezhMzkZw5kyL%2FlqbQqt&X-Amz-Signature=0ac01805f1876b66e16fb6335476e826b77e9e83b8e29bf4d2e7bb086c502aee&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466Q4F6CUDJ%2F20260704%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260704T015310Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEFEaCXVzLXdlc3QtMiJIMEYCIQCAWrwJiALWK7MYYl1aOuaYJM2OJ9TxrEdxCd3CZXYd1QIhAKTw55GYZHiHoXOC02F5rMeYJjdumPHcujXINu1HsghGKv8DCBoQABoMNjM3NDIzMTgzODA1IgwP8XrL9nwAxcYUIEcq3ANGNlAmjp90zONGD6XPTqoyda4RwTHCcAVzFJwkTMnnFHd3mBT%2Fk%2FkQrUSPr56Di8K3UINvAnwZflgibhSV5H4asy0BS0j18OErf%2B7FaSgk8S%2FiZjFh0gS9POWP8zV5aROv1dMXsQYJrquhicpmUSeq3RpiELxzSYi4%2BBQDLBnGBhFASSlTEubSILEREkQB6E0m5ScC0TxK2s3RA0lz8tV5vHkIzYgPPVp6c21lki8YksCiPsW0%2B2gSvgiEIwi22Pk8Lo5aeR9HGCIV1gBS7z1d9Nyvg3zrpS6QT0eVDBlxwLz2ubD0yoToS97Sz%2BnhYci6bcSAEBkYgNlV3Cu7Qgdobmj6ZqSQ8zKsennWcRquEXYKVEkKl1dGtu7Ms1pU%2FPI9REKFYtN0gaE80sa8WKCDT%2BZ8kOg2PigyjHa80n8XJBuprJYB9I9c9IvKUTs15VH8V37HczGWqS8IHxC38pj6moLUsvCNsGcaMHJu%2BvijU3xT3DpitiuFu5nuj7XJUGNnOWbcMSaiEK6nkrZz%2BOsV3%2FDucvbf7XlXxMF%2BI4zWfKmK0xo4bb%2BWXSUv7D7KvVY34x%2BXETM9c4m%2Fm6M108GPWm%2BiVJptOmAJVeQ2wzxeLZcCLIjQf%2BA%2Bn0UIVzDLuKHSBjqkAY53npPWNIevk3%2FJqyLi%2Fg7tLWEzQglD9HYHyVHPJvGHKUKBQpwsMpiXtjHTd9ADBtF5aDFmn9BkipKgy1fWrd19IBVqzGJGaGY4VdBuOeEBGNoNVRiEutanfU7w5pt5QlLYZ8xfGMVXuiKK0KkjPHKlZ5TSrW71xc2mVw%2B5DZB3kEEEpIVMX5gmTK8sx8MsZl8zgOpiWz4Ulgbg1NrjiPP%2FO0%2Fz&X-Amz-Signature=3c1662066593515336f537a7238fddd6fb74c322fe44cc4f30e4e1222d48a8f7&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466Q4F6CUDJ%2F20260704%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260704T015310Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEFEaCXVzLXdlc3QtMiJIMEYCIQCAWrwJiALWK7MYYl1aOuaYJM2OJ9TxrEdxCd3CZXYd1QIhAKTw55GYZHiHoXOC02F5rMeYJjdumPHcujXINu1HsghGKv8DCBoQABoMNjM3NDIzMTgzODA1IgwP8XrL9nwAxcYUIEcq3ANGNlAmjp90zONGD6XPTqoyda4RwTHCcAVzFJwkTMnnFHd3mBT%2Fk%2FkQrUSPr56Di8K3UINvAnwZflgibhSV5H4asy0BS0j18OErf%2B7FaSgk8S%2FiZjFh0gS9POWP8zV5aROv1dMXsQYJrquhicpmUSeq3RpiELxzSYi4%2BBQDLBnGBhFASSlTEubSILEREkQB6E0m5ScC0TxK2s3RA0lz8tV5vHkIzYgPPVp6c21lki8YksCiPsW0%2B2gSvgiEIwi22Pk8Lo5aeR9HGCIV1gBS7z1d9Nyvg3zrpS6QT0eVDBlxwLz2ubD0yoToS97Sz%2BnhYci6bcSAEBkYgNlV3Cu7Qgdobmj6ZqSQ8zKsennWcRquEXYKVEkKl1dGtu7Ms1pU%2FPI9REKFYtN0gaE80sa8WKCDT%2BZ8kOg2PigyjHa80n8XJBuprJYB9I9c9IvKUTs15VH8V37HczGWqS8IHxC38pj6moLUsvCNsGcaMHJu%2BvijU3xT3DpitiuFu5nuj7XJUGNnOWbcMSaiEK6nkrZz%2BOsV3%2FDucvbf7XlXxMF%2BI4zWfKmK0xo4bb%2BWXSUv7D7KvVY34x%2BXETM9c4m%2Fm6M108GPWm%2BiVJptOmAJVeQ2wzxeLZcCLIjQf%2BA%2Bn0UIVzDLuKHSBjqkAY53npPWNIevk3%2FJqyLi%2Fg7tLWEzQglD9HYHyVHPJvGHKUKBQpwsMpiXtjHTd9ADBtF5aDFmn9BkipKgy1fWrd19IBVqzGJGaGY4VdBuOeEBGNoNVRiEutanfU7w5pt5QlLYZ8xfGMVXuiKK0KkjPHKlZ5TSrW71xc2mVw%2B5DZB3kEEEpIVMX5gmTK8sx8MsZl8zgOpiWz4Ulgbg1NrjiPP%2FO0%2Fz&X-Amz-Signature=99dd6fbb8b2eee6f7ed9b7f4d8da6a05b587851d8d594068e192b6fb8dc83350&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

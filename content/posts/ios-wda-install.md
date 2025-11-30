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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4665GOWHT7I%2F20251130%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251130T010007Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEA4aCXVzLXdlc3QtMiJIMEYCIQCO2xFtnSFW96LzPsrFtSUIQHnXb%2Fm44A7OZHsnFxI5yQIhAKoSTH3jopOw0YNygU4NfqqZaMHfRH27TrDlIZZS4A1iKogECNf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgwF4Yg8YXTNR6XKG00q3AMlMijOmCPAU2hkOS0ZEMl5wN%2FBD%2FsA0u4pjbqYt6Zt%2FwO8ceC9Mv8%2Ft9XhmXVMvYLQBFX5dCP%2Fo0qM37zuEjBtK98WUeTlZ4hbgfpk%2BNboI99i2c0dkxMV89D%2FR1qunlvnsPTqZzfu6eHRvuoLSWVbRHdNDumtPNPK5txu%2Fj1iBYW%2BQTG8U7FeRBaWMyj4%2BUUs5ilm0%2BJK3uJ8BGOV6If1SCOaDJP9zBZDP0oFsRTl6eNS91Po5CFRNgrQHKg8Prb8q4COmu7Xhe4BomYAC8Ue25f288th6hiyA0qBdkHEY0arOEiKmXvLIJNgWfAfdBzHGKVrgFxjO5rMhYZZW1ikb843Jse9SSeQbIX9fTDjNDkbpGSOMtoQ6uQdXyrc2yjd0veSNvKTn0Nu71rW6%2FHuyNfZpyDs2M2cdlWKeDrsGZqSiyINhAFzbYBd10Qwm83ghX9Cfh0uYR2J41byGmgMZUPKgmX4zzatZYZf4erRG4bRxlPObbFjisPnYi3RqEvok1vZV6yd7EAE6QRwlOT5Ym3V5VNFz%2FRvoScrRy0Kz5eAVF5b%2BztkE1BG%2F%2BWJ9NoM22rADKG%2FhqrvJRsEvdJ8Xr9rKeRtoktndOcIweUGYXPb%2BDQpIkenkUcQGTDO0a3JBjqkAcrIJJUGmvWxzjoyuu%2F0Y4OYZd2HwC1VIghMHq9%2FznRyfsvIsaSvz3rQ%2BMDzhlDMB6jWZj7YnxC7pR8C5deqKWei7AabiShnJ2y0aOm0UgMRrVqV3K%2B%2FJFfcLBshf7b6tHseE6P41QnjABqdzKNYqi3myKSZ8YwpTuE0VWclj%2BkZpgIW4%2Fp9LxoggnceL9MsOqz5vxw9M2wpArWmaZOxCA%2FJ5rsj&X-Amz-Signature=b0c641a7a34c602101a3a51974b4550db3f73fcdf890b6a43505d0fff70f7150&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4665GOWHT7I%2F20251130%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251130T010007Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEA4aCXVzLXdlc3QtMiJIMEYCIQCO2xFtnSFW96LzPsrFtSUIQHnXb%2Fm44A7OZHsnFxI5yQIhAKoSTH3jopOw0YNygU4NfqqZaMHfRH27TrDlIZZS4A1iKogECNf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgwF4Yg8YXTNR6XKG00q3AMlMijOmCPAU2hkOS0ZEMl5wN%2FBD%2FsA0u4pjbqYt6Zt%2FwO8ceC9Mv8%2Ft9XhmXVMvYLQBFX5dCP%2Fo0qM37zuEjBtK98WUeTlZ4hbgfpk%2BNboI99i2c0dkxMV89D%2FR1qunlvnsPTqZzfu6eHRvuoLSWVbRHdNDumtPNPK5txu%2Fj1iBYW%2BQTG8U7FeRBaWMyj4%2BUUs5ilm0%2BJK3uJ8BGOV6If1SCOaDJP9zBZDP0oFsRTl6eNS91Po5CFRNgrQHKg8Prb8q4COmu7Xhe4BomYAC8Ue25f288th6hiyA0qBdkHEY0arOEiKmXvLIJNgWfAfdBzHGKVrgFxjO5rMhYZZW1ikb843Jse9SSeQbIX9fTDjNDkbpGSOMtoQ6uQdXyrc2yjd0veSNvKTn0Nu71rW6%2FHuyNfZpyDs2M2cdlWKeDrsGZqSiyINhAFzbYBd10Qwm83ghX9Cfh0uYR2J41byGmgMZUPKgmX4zzatZYZf4erRG4bRxlPObbFjisPnYi3RqEvok1vZV6yd7EAE6QRwlOT5Ym3V5VNFz%2FRvoScrRy0Kz5eAVF5b%2BztkE1BG%2F%2BWJ9NoM22rADKG%2FhqrvJRsEvdJ8Xr9rKeRtoktndOcIweUGYXPb%2BDQpIkenkUcQGTDO0a3JBjqkAcrIJJUGmvWxzjoyuu%2F0Y4OYZd2HwC1VIghMHq9%2FznRyfsvIsaSvz3rQ%2BMDzhlDMB6jWZj7YnxC7pR8C5deqKWei7AabiShnJ2y0aOm0UgMRrVqV3K%2B%2FJFfcLBshf7b6tHseE6P41QnjABqdzKNYqi3myKSZ8YwpTuE0VWclj%2BkZpgIW4%2Fp9LxoggnceL9MsOqz5vxw9M2wpArWmaZOxCA%2FJ5rsj&X-Amz-Signature=788dd054579f4d46b45d35b0fff75c96fdf9e5f6884b8499afe50b438b389ee7&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

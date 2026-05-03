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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4667ELPV3YF%2F20260503%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260503T015038Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEID%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQCSM7zvdWeW2epHhvZr1hVEu6bqIevO9bc93SK61%2FehdAIgZTHhA2mNZw0CSyzUaOSx%2BU%2BDW47KbzzSQK8NLG%2BHb3kq%2FwMISRAAGgw2Mzc0MjMxODM4MDUiDPqVGGnyXfNDjihoTCrcAzHIMGQ9ySh2z9sK2fCaJNj4QVsHF0yuIpf7N0UEHQ22zIaRJa0uwseQo3XeVN%2BriidxxTBkZ9Ga8CXA0pnEF14mlKymiR51wLlMMGpMesM2s85ezcxz4Y6DqZl69a7vg%2BOoFB7Kto1VOofvq3x3mQTFX0LRnwOwfq0t0UI84syuaVKNQ7F609BkGNBXIwb2uWuZZjV%2B8cX5768rcjuqxsIUTILDHO1aoMXGTgA8Kd%2BE2CP6jlM1at5HB2MgycZEjdXQ%2Bv2S2mUL4uzjdMWIGGjzr5NJCmt%2BC7t8QTBfRowGa3OArbggrENyM2L2TPQcg3eFY3EE7Oto5vQ%2B6UIgOs5aydu%2BT9DU43oSYM6sYFBrpChLVe94Fmbls81cTWeuLx2AGoJvZyoQ7mSu1q%2Bc7fvMAiRYrhlVSogy4j%2FjD1fKz5mSDkvPIkVdeq6kJGw4DpEy6rh%2FbDc0Bit20ngYGdmzliRP6LxBETz8ItPpQXKskYCurCl%2FQEr51Shdoni8QxyWcnHPqri4nDe44CgiqDgGZ9al8SnaaO6XVCW1gxl7ANZ7HKx9yUtTSeOdIvczCiEpLRzSpMIDYNRfmbzyL%2BxbiuisttYZ9vhCIL1lkLICpzStmoSkfUImmjuYMKGn2s8GOqUB0FZepZBb1CBUDtNLMNqGkKI%2BtEXAON%2F1J7bt9HEuU9ipbynnCgdSFgEEQVXD7%2BB3%2F6mqr%2FpKJtHW5W5vpaznyMKr7VfNYy6NF0Me%2By6uQhJaMoYF807prfUYNiX58G%2BKJ9%2BOgM6EGLnBRrRPzQ52IbwEIlNzLfYoQwCIYfZqyZAJUvwXfmhNLDeGDzRtkig6Y7GO2oITqAi%2BB53oS5I8S%2FmkqcWj&X-Amz-Signature=d0db337686e07f3a9043fdb8cd5aa9cc0468d0ad0151244aceb352105a6e6c15&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4667ELPV3YF%2F20260503%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260503T015038Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEID%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQCSM7zvdWeW2epHhvZr1hVEu6bqIevO9bc93SK61%2FehdAIgZTHhA2mNZw0CSyzUaOSx%2BU%2BDW47KbzzSQK8NLG%2BHb3kq%2FwMISRAAGgw2Mzc0MjMxODM4MDUiDPqVGGnyXfNDjihoTCrcAzHIMGQ9ySh2z9sK2fCaJNj4QVsHF0yuIpf7N0UEHQ22zIaRJa0uwseQo3XeVN%2BriidxxTBkZ9Ga8CXA0pnEF14mlKymiR51wLlMMGpMesM2s85ezcxz4Y6DqZl69a7vg%2BOoFB7Kto1VOofvq3x3mQTFX0LRnwOwfq0t0UI84syuaVKNQ7F609BkGNBXIwb2uWuZZjV%2B8cX5768rcjuqxsIUTILDHO1aoMXGTgA8Kd%2BE2CP6jlM1at5HB2MgycZEjdXQ%2Bv2S2mUL4uzjdMWIGGjzr5NJCmt%2BC7t8QTBfRowGa3OArbggrENyM2L2TPQcg3eFY3EE7Oto5vQ%2B6UIgOs5aydu%2BT9DU43oSYM6sYFBrpChLVe94Fmbls81cTWeuLx2AGoJvZyoQ7mSu1q%2Bc7fvMAiRYrhlVSogy4j%2FjD1fKz5mSDkvPIkVdeq6kJGw4DpEy6rh%2FbDc0Bit20ngYGdmzliRP6LxBETz8ItPpQXKskYCurCl%2FQEr51Shdoni8QxyWcnHPqri4nDe44CgiqDgGZ9al8SnaaO6XVCW1gxl7ANZ7HKx9yUtTSeOdIvczCiEpLRzSpMIDYNRfmbzyL%2BxbiuisttYZ9vhCIL1lkLICpzStmoSkfUImmjuYMKGn2s8GOqUB0FZepZBb1CBUDtNLMNqGkKI%2BtEXAON%2F1J7bt9HEuU9ipbynnCgdSFgEEQVXD7%2BB3%2F6mqr%2FpKJtHW5W5vpaznyMKr7VfNYy6NF0Me%2By6uQhJaMoYF807prfUYNiX58G%2BKJ9%2BOgM6EGLnBRrRPzQ52IbwEIlNzLfYoQwCIYfZqyZAJUvwXfmhNLDeGDzRtkig6Y7GO2oITqAi%2BB53oS5I8S%2FmkqcWj&X-Amz-Signature=aedd26a32168fbfb4153fb058fe7a1001e3bb83db09533367e5448f382a52b64&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

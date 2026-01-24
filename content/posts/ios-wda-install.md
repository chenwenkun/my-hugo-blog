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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4667B7SKQUE%2F20260124%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260124T005656Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEDkaCXVzLXdlc3QtMiJIMEYCIQCTL5NJTxbeLSnyt3flbyPatLS0LBBaE7ExhElXVTFqMgIhALdUHq3xcG4LevyfyslSuOxFdnhIfzRKKGFvZPingynkKv8DCAIQABoMNjM3NDIzMTgzODA1Igyr9RUl9oSPIIj9X7gq3ANZVsX5QE7mgg8v%2BCTNpDzlvgT91rz5HeYUCCTBnwQcI6XET5jlODk9Dm2evQyXWI2C5FBHzpYqAr4YeGmdrkRFIwvubFDoJ9lpTdOsENpEykTBDZ3DWIrw0g%2B40Gtwu1x9OlKMDdDLLgyCE%2FjUDFvXLuz9qEN9F11oUnn%2B9aKT8cDL0o7hXgwzpBS%2BXSSmPixqRJesvYlbGGhv79AO6F%2BeGtqbBjCW3Ny7v6lFkZU%2BBD0nAUDWszn1oe99P3iT2p28zSbcZ%2Fkht3xQUZ0g8qFbNpV4DnMSj8ffvOAoRwukXEj5AvgX0mPxGc9HJEfz6Bsh3PVU%2F4AQgDSKq4YVyot0THi%2FWGj5QwZx4JX0wdLR5tifiGgzuaHrG4b6bnTbziH%2FxN1kmr8dPqWd1B1DfTn7Q3hoyp%2FQyvbC706IkyAlabunFnR%2F%2Blb%2BC0FpYQCy%2FeqN0B1j%2BeRxFQCbjEwBRyzJvYM%2FEQW%2F%2BDlI63RwRVier6fWwbTHox%2B9u7MajJHlZO%2FLlRaBhwElRhtWx7zFVCZ%2Fz9BLaaCqGZ0m8VrLPdWAhDsvld19KNpDFk70ZdL0aOsdvupmuPQRDDWUukkRwhg4Hum1tQYXqQkxVwjFf0NdGTKgW6QR9j1DW2lq4zDyq9DLBjqkAbCAJIIqKRHBk6Y4t%2FWeetQNYXO7vN5nAEQhRRhdA0FnLlWxc2YML4TpFUKJSbQAK9UNz9XIkJhIXU9uwnoGmZ3gJjcOrJ4bmMJAg22hEVMjhU4WQu3QFLJwphKHyOXwbYhci%2BtqjmuozWDBPIDMPos5MHpRfliSqIqaRP96tO0Gz0Hosv4OTTQwtwG0EQoQEbhDoadf90DDFVJO2IaKdjuEGwzA&X-Amz-Signature=b123884eedcd405c8337a4fa824cf41b2bea13d22abfece4fdfb0e77d846ed3f&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4667B7SKQUE%2F20260124%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260124T005656Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEDkaCXVzLXdlc3QtMiJIMEYCIQCTL5NJTxbeLSnyt3flbyPatLS0LBBaE7ExhElXVTFqMgIhALdUHq3xcG4LevyfyslSuOxFdnhIfzRKKGFvZPingynkKv8DCAIQABoMNjM3NDIzMTgzODA1Igyr9RUl9oSPIIj9X7gq3ANZVsX5QE7mgg8v%2BCTNpDzlvgT91rz5HeYUCCTBnwQcI6XET5jlODk9Dm2evQyXWI2C5FBHzpYqAr4YeGmdrkRFIwvubFDoJ9lpTdOsENpEykTBDZ3DWIrw0g%2B40Gtwu1x9OlKMDdDLLgyCE%2FjUDFvXLuz9qEN9F11oUnn%2B9aKT8cDL0o7hXgwzpBS%2BXSSmPixqRJesvYlbGGhv79AO6F%2BeGtqbBjCW3Ny7v6lFkZU%2BBD0nAUDWszn1oe99P3iT2p28zSbcZ%2Fkht3xQUZ0g8qFbNpV4DnMSj8ffvOAoRwukXEj5AvgX0mPxGc9HJEfz6Bsh3PVU%2F4AQgDSKq4YVyot0THi%2FWGj5QwZx4JX0wdLR5tifiGgzuaHrG4b6bnTbziH%2FxN1kmr8dPqWd1B1DfTn7Q3hoyp%2FQyvbC706IkyAlabunFnR%2F%2Blb%2BC0FpYQCy%2FeqN0B1j%2BeRxFQCbjEwBRyzJvYM%2FEQW%2F%2BDlI63RwRVier6fWwbTHox%2B9u7MajJHlZO%2FLlRaBhwElRhtWx7zFVCZ%2Fz9BLaaCqGZ0m8VrLPdWAhDsvld19KNpDFk70ZdL0aOsdvupmuPQRDDWUukkRwhg4Hum1tQYXqQkxVwjFf0NdGTKgW6QR9j1DW2lq4zDyq9DLBjqkAbCAJIIqKRHBk6Y4t%2FWeetQNYXO7vN5nAEQhRRhdA0FnLlWxc2YML4TpFUKJSbQAK9UNz9XIkJhIXU9uwnoGmZ3gJjcOrJ4bmMJAg22hEVMjhU4WQu3QFLJwphKHyOXwbYhci%2BtqjmuozWDBPIDMPos5MHpRfliSqIqaRP96tO0Gz0Hosv4OTTQwtwG0EQoQEbhDoadf90DDFVJO2IaKdjuEGwzA&X-Amz-Signature=fc92971d582d432d352a818554ee91cc105c4a19be1e120c78fc69364ef10add&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

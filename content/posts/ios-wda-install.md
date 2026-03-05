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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4662A2KCZ47%2F20260305%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260305T123619Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEAQaCXVzLXdlc3QtMiJHMEUCIAF74YztJXBMZXLq1nveCeAlG5X%2FK96eKl6G1xU%2BO%2BmpAiEA6zqJJRL2FCsIqkWhz%2Fl6EXDWLGZLagkLwN0S9P0yXaoqiAQIzf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDN3bQYr%2BAt0rDA%2FbwircAwa2FdDIwV7HKznm2HxXRLlqD285AN%2Bnsq5bUKnLDYcl344FnpST10lT%2BlVqUr0Ovo1VQGGAt0Fl42vIgt68rvU7uslXNgoT5KRGfdD9XyECK%2FPATRcS2PCn0ipSFTj7N2MPGKVgNWavkrJzbXE3KHtxhHpt4pZMXnic%2FdGu1afSqKyB3hTfm%2BoyoDOh2hJPievWMnCIp5BmaVWUMStyqqn5WjYekNY89dC%2Bbtp1uqTtKz45uoJwX3c8GD%2F%2F9u%2BnPR1rmksasUgpIxCkbnBRxm4xR08hrr%2BDu6jxLnb%2BWnhMspCQh%2BVpHyvuQWwLp%2B3Z8wrtNtdlG7UVZFpRAvrdwWtGUkKy3hhqYvgZ1B3s2qVFJ8NTCABZ96fQRtMXOWpqadzYifmXvHAAO6uQL4mjr2bvMuHBV40q9seVP9hAvCJIXs88JqyMmztIWUmVjHlcuQzR87%2BVVO6%2F7NCowdacG4ApZNK8GEo6xxAf6dFUqIlJIzcs8WJcESXJddFgtibkThLJ44L9tD8I4vmEQvPnw%2FXpyy4ho0VP2JSalZTWw%2BHfIBvv1LlRR7u6TmiSJ6Lp%2FcQQvepk6GYP0CibuM%2ByMGjmAkkojrfM1FvEXZhhzftJFX0y8CY6pgk9S3yRMM%2FTpc0GOqUBPSRLvfMniIq8ljx104MS%2FrWoORWEJu6N8lxHVrnrsvg2MKKKGSXX7c0P6UH830aqdZy47OEtwSsQQ%2B7kOrxcfJ3aGLDH8Ji%2FZp6E8Iz8EwYz9L81p9beX8Q6L5xHers%2FRJQamaak8QM676BGwGi9STm%2Fp348VQQec%2B5bZQRVSepW2NOLqEIIB90lmzUsBpzYLKCaSYmUqdvIzCDZtfqMSWOcXwas&X-Amz-Signature=1e2570076cf00464978035fc475f119753d4bb3a978148b7da56b95ca9348c5a&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4662A2KCZ47%2F20260305%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260305T123619Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEAQaCXVzLXdlc3QtMiJHMEUCIAF74YztJXBMZXLq1nveCeAlG5X%2FK96eKl6G1xU%2BO%2BmpAiEA6zqJJRL2FCsIqkWhz%2Fl6EXDWLGZLagkLwN0S9P0yXaoqiAQIzf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDN3bQYr%2BAt0rDA%2FbwircAwa2FdDIwV7HKznm2HxXRLlqD285AN%2Bnsq5bUKnLDYcl344FnpST10lT%2BlVqUr0Ovo1VQGGAt0Fl42vIgt68rvU7uslXNgoT5KRGfdD9XyECK%2FPATRcS2PCn0ipSFTj7N2MPGKVgNWavkrJzbXE3KHtxhHpt4pZMXnic%2FdGu1afSqKyB3hTfm%2BoyoDOh2hJPievWMnCIp5BmaVWUMStyqqn5WjYekNY89dC%2Bbtp1uqTtKz45uoJwX3c8GD%2F%2F9u%2BnPR1rmksasUgpIxCkbnBRxm4xR08hrr%2BDu6jxLnb%2BWnhMspCQh%2BVpHyvuQWwLp%2B3Z8wrtNtdlG7UVZFpRAvrdwWtGUkKy3hhqYvgZ1B3s2qVFJ8NTCABZ96fQRtMXOWpqadzYifmXvHAAO6uQL4mjr2bvMuHBV40q9seVP9hAvCJIXs88JqyMmztIWUmVjHlcuQzR87%2BVVO6%2F7NCowdacG4ApZNK8GEo6xxAf6dFUqIlJIzcs8WJcESXJddFgtibkThLJ44L9tD8I4vmEQvPnw%2FXpyy4ho0VP2JSalZTWw%2BHfIBvv1LlRR7u6TmiSJ6Lp%2FcQQvepk6GYP0CibuM%2ByMGjmAkkojrfM1FvEXZhhzftJFX0y8CY6pgk9S3yRMM%2FTpc0GOqUBPSRLvfMniIq8ljx104MS%2FrWoORWEJu6N8lxHVrnrsvg2MKKKGSXX7c0P6UH830aqdZy47OEtwSsQQ%2B7kOrxcfJ3aGLDH8Ji%2FZp6E8Iz8EwYz9L81p9beX8Q6L5xHers%2FRJQamaak8QM676BGwGi9STm%2Fp348VQQec%2B5bZQRVSepW2NOLqEIIB90lmzUsBpzYLKCaSYmUqdvIzCDZtfqMSWOcXwas&X-Amz-Signature=a4bd23c5d535ba3cea846ae5ef9dcf8c2e08d4fadfabbdde36be2e142381819e&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

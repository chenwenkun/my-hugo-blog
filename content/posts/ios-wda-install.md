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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466TUA3UGAV%2F20260317%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260317T184622Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjECkaCXVzLXdlc3QtMiJGMEQCIEzyPNAtIZwEZk5%2Fc8sZFjHjPZKoo4P5p8c6UMe%2B8nuAAiBX2WgQvVRQm106bbO%2FHeGBqPmi954YJQ68nK1TPGHw5CqIBAjy%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIM8pwP%2FD9U4hYukP1PKtwDlAzId3bIV52w3gTvqaW6WV3G%2FyI6vfhF6Rbk8gSGvqv24yF5QToHvHfMTZHJtiHo2GzBaFIdPg3dKR1KRZPrD6hiYygJhMt2a7Uyq1BSAJSqaR%2FQhzQW%2Bc32k%2B%2BsmT2dHz%2FU%2FT%2Fclmd75NoU2HbaZCUCx8MpLoAJkbnCzm4evX%2BkJ44qdNbinZWDkgfDU5LRMa9XwiJbyoznYT6dZGixPdQEKH0jYp%2BVJg7tP9OI20Loqchz7JYNhbENWzjVFTsjsj1wq4dXx2GsWPSy1jCQe902iHQdFPmY5QWS3B6TymlB%2BFF2jo65dFw9DyE2ypbAjqffyFS%2FgnzlCy2bjvJxgAYLdaa7P8JWaZDOMkMDZ0HiImNEwGsQi9zjf9RGpZt8uuoTucGOKHe3lKreXSj3R9GReoy8EK6PoJfuN0hnbhUwUVdZ%2FSlsOjqxAjhvV2ZIWwlJxJspA5SwMTJGBOwxddtvzg%2FiyMSTdiGwH8FLBoOZpwry%2FzysVRbzWJPpisZASxbchAq6k%2FpYg1OM3Vadj4YRt4GnK2LWUH9qMFksyyaa62c1sCqge7069mDXOlGixhs6n5Jlk5VQQnvg9Jc8aI9HKRP9OOPQh0%2BAot%2FrpoZel972GyRnwjd3hz4w7YbmzQY6pgG%2BeER1JB%2FIQAL%2FWsk7E00wJt4%2FrO9BHpeqeDk21RdjHXi3EOLBIzxVONnE1PHVwvEZhZAzEJvZZV8mxmDpquBrP0GFbQ%2Fr83K2UnOCT2ceDBLAFJVVepiDINMTCMnWCwC6a5dWumhfW0Jpr6EzKt2s04pTz5gN87n8pU2d%2BBojF%2BDTYusxBtVF4i%2FA1WzBw7Fi8eQY2TFHjJ1luXxpa2c04J1CdIT7&X-Amz-Signature=cdebea8a29bed2886db36dd6bfea5381ce612e01a9f57828f32b8d7beff5e44f&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466TUA3UGAV%2F20260317%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260317T184622Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjECkaCXVzLXdlc3QtMiJGMEQCIEzyPNAtIZwEZk5%2Fc8sZFjHjPZKoo4P5p8c6UMe%2B8nuAAiBX2WgQvVRQm106bbO%2FHeGBqPmi954YJQ68nK1TPGHw5CqIBAjy%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIM8pwP%2FD9U4hYukP1PKtwDlAzId3bIV52w3gTvqaW6WV3G%2FyI6vfhF6Rbk8gSGvqv24yF5QToHvHfMTZHJtiHo2GzBaFIdPg3dKR1KRZPrD6hiYygJhMt2a7Uyq1BSAJSqaR%2FQhzQW%2Bc32k%2B%2BsmT2dHz%2FU%2FT%2Fclmd75NoU2HbaZCUCx8MpLoAJkbnCzm4evX%2BkJ44qdNbinZWDkgfDU5LRMa9XwiJbyoznYT6dZGixPdQEKH0jYp%2BVJg7tP9OI20Loqchz7JYNhbENWzjVFTsjsj1wq4dXx2GsWPSy1jCQe902iHQdFPmY5QWS3B6TymlB%2BFF2jo65dFw9DyE2ypbAjqffyFS%2FgnzlCy2bjvJxgAYLdaa7P8JWaZDOMkMDZ0HiImNEwGsQi9zjf9RGpZt8uuoTucGOKHe3lKreXSj3R9GReoy8EK6PoJfuN0hnbhUwUVdZ%2FSlsOjqxAjhvV2ZIWwlJxJspA5SwMTJGBOwxddtvzg%2FiyMSTdiGwH8FLBoOZpwry%2FzysVRbzWJPpisZASxbchAq6k%2FpYg1OM3Vadj4YRt4GnK2LWUH9qMFksyyaa62c1sCqge7069mDXOlGixhs6n5Jlk5VQQnvg9Jc8aI9HKRP9OOPQh0%2BAot%2FrpoZel972GyRnwjd3hz4w7YbmzQY6pgG%2BeER1JB%2FIQAL%2FWsk7E00wJt4%2FrO9BHpeqeDk21RdjHXi3EOLBIzxVONnE1PHVwvEZhZAzEJvZZV8mxmDpquBrP0GFbQ%2Fr83K2UnOCT2ceDBLAFJVVepiDINMTCMnWCwC6a5dWumhfW0Jpr6EzKt2s04pTz5gN87n8pU2d%2BBojF%2BDTYusxBtVF4i%2FA1WzBw7Fi8eQY2TFHjJ1luXxpa2c04J1CdIT7&X-Amz-Signature=72d65a479da72e7de82a9da5729eb53fa3e0eaf3467c2148ed876763d14d14c8&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

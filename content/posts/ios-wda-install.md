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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466UQ42YL4Y%2F20260521%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260521T021001Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEDIaCXVzLXdlc3QtMiJHMEUCIEvd36xBHmHOeZdH%2Bzc1S0%2FIfnN7yxYqfCAZrk4HBBGHAiEAsAEhuB1cdMeb%2F1e4GTYtFSVcSF4l%2BhZMpO5iILOBjh4qiAQI%2Bv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDNZ%2B%2F9JL4Y4dCCpKUircAyv5IpxV9VIalqipLLUqNDbflNSaq6VpQcuKmUtsh1ya1nDXh13nHUXAq%2FZDeuKj1usd42q4AIktQfswPm6HIDUyPIlvWWoGKTf3b0JXlwnrpSaxq4H8yZVKta3XL7R8oSo5hbLGmdLv7gzN1omTcD2d64dUjsxfcXUqgmk3pQ0%2FzdujlndyMHIJII4zG9zD5QOvpUW5TG7NEbnPVl1Nnc67KPyCXjcg3Trg%2BkfUs494SxCgXi%2FhnLOR0TZhj37KOYKPoeuzo%2FrzNpqsHnSFrVrMH3Alnyb81ukvq2ilgMQ3NxNoniOex%2FyUElEPZIqF8rRczrLly9MyFUpXrD7MexHqwh9ZZNBPMEeFFaaDZrihbrCODFt4sVw1sGVesHV0wvdlpgS7h9nERSFrgmkwnYIHBgX3wpWsdW5MmsaROGnKDZ3jXTELF0d9t6iw%2FDctccxOHfCIEfE0%2BCKR%2FZVw82rinAsjz7e4Nti2IpJRoXrl0QLR8fFJqQlyxdHh%2Fyu%2B8M6Ncey%2F%2F28CvGPATMdNtT%2B45aZyFWIb4wXY8Fq0a7l4mXWMf6vD21po6p0Jr4c0qydk54zifNAU27IzMNwujWn4TaYfLLD%2BuwjTZn%2BT%2BsY6EB3IfYsHRjkEHzg1MKa7udAGOqUBKcnqC%2FbZb%2BKIyA7XJrq2Dcw7DtcBWQNRoSwcoxCAV69G4OMEm3l82DAUNAj2oB3j5UIpdeEPwme53UFNQUDkGW4aJJZcZ41KA271GFyc4AO1qZBfsjUr8cyP8A4m21tnWmIACrlhZzgaI9li0iTIT4poaHnnfSkD5EXe9MTkzD3YrXMENMS8qgJNBPjc3ucCVrdRl7Ie4IRzntiwz2rXxbS%2BQ7Uq&X-Amz-Signature=fc2d0351a05b49886d11994a4dcaf721c60059a68b2b5289700125450225e14e&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466UQ42YL4Y%2F20260521%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260521T021001Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEDIaCXVzLXdlc3QtMiJHMEUCIEvd36xBHmHOeZdH%2Bzc1S0%2FIfnN7yxYqfCAZrk4HBBGHAiEAsAEhuB1cdMeb%2F1e4GTYtFSVcSF4l%2BhZMpO5iILOBjh4qiAQI%2Bv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDNZ%2B%2F9JL4Y4dCCpKUircAyv5IpxV9VIalqipLLUqNDbflNSaq6VpQcuKmUtsh1ya1nDXh13nHUXAq%2FZDeuKj1usd42q4AIktQfswPm6HIDUyPIlvWWoGKTf3b0JXlwnrpSaxq4H8yZVKta3XL7R8oSo5hbLGmdLv7gzN1omTcD2d64dUjsxfcXUqgmk3pQ0%2FzdujlndyMHIJII4zG9zD5QOvpUW5TG7NEbnPVl1Nnc67KPyCXjcg3Trg%2BkfUs494SxCgXi%2FhnLOR0TZhj37KOYKPoeuzo%2FrzNpqsHnSFrVrMH3Alnyb81ukvq2ilgMQ3NxNoniOex%2FyUElEPZIqF8rRczrLly9MyFUpXrD7MexHqwh9ZZNBPMEeFFaaDZrihbrCODFt4sVw1sGVesHV0wvdlpgS7h9nERSFrgmkwnYIHBgX3wpWsdW5MmsaROGnKDZ3jXTELF0d9t6iw%2FDctccxOHfCIEfE0%2BCKR%2FZVw82rinAsjz7e4Nti2IpJRoXrl0QLR8fFJqQlyxdHh%2Fyu%2B8M6Ncey%2F%2F28CvGPATMdNtT%2B45aZyFWIb4wXY8Fq0a7l4mXWMf6vD21po6p0Jr4c0qydk54zifNAU27IzMNwujWn4TaYfLLD%2BuwjTZn%2BT%2BsY6EB3IfYsHRjkEHzg1MKa7udAGOqUBKcnqC%2FbZb%2BKIyA7XJrq2Dcw7DtcBWQNRoSwcoxCAV69G4OMEm3l82DAUNAj2oB3j5UIpdeEPwme53UFNQUDkGW4aJJZcZ41KA271GFyc4AO1qZBfsjUr8cyP8A4m21tnWmIACrlhZzgaI9li0iTIT4poaHnnfSkD5EXe9MTkzD3YrXMENMS8qgJNBPjc3ucCVrdRl7Ie4IRzntiwz2rXxbS%2BQ7Uq&X-Amz-Signature=bce7a6e0b56c03bc06252ce2c84968e7fbf62054e4469921499382191a1ebac7&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

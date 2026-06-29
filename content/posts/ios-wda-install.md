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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466SSZMWEQ5%2F20260629%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260629T194109Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEOz%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCXEnNggjE%2B8SOssP0Z%2BOpBINWwzXFkxWYy1Pty%2FyYcAAIhAMxbe2mIhUjXbT8psRGrq9U%2BqN2xOXbUcIrwBEqed4N7KogECLX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgyQSnzPsJmQZnnd9usq3APlZE2aunJwJnwKMXL5rhhM9tJoUWBH9ZM8E19Lxjs%2F5%2B1J%2B8lEV8nd1m7pCM8k%2B4iAU4LGJVg2Ul5ULUBZyqGgzgSS0WNXs7YWDdFiLq1tQphJyHyoXOeSdDkFI%2Fgl%2FoK1%2BuScgVBXz6RrhulZa3hDFGaRMvKDGG%2FuHeOhEF2rR%2BIeHLnc6Z4eKxU%2BoEAhovdUhpqi2K0Cum29cgwH6rX%2FxBfSnCI%2F31GSerB%2F2ogFpDfug7sWz1Guo6O6YfJTqAg1cOBwy4FniKAKEhA4uSjzV6Bklpx2aUT7adg%2FQKxGUR7uYjzCto7Hamzabm5hHTOSpetDSZU%2BnICwehBUyYjPqva0tVcwUdCrKbeVJ8jREnEzIFbuf2F3HgVsTzgFd%2BJ3Lhi39kucpoyI47KK9rxZBNpZ1RA1HaFqlEfN0UZkDJt19OmSleKWkrJdd7gEXE%2BNL28j8kUb4vnP7ZIVUMYnfsQpv5iNAVKaPnybucyWSNimBVkTDrYnPuQq8J0RuycNjluimJiUvyeIbWrGa1%2BDhEn4MQ6f2OV5cRCYETDHTIgKjLzbGFYZsMnGK85JFloV01Zgtclq2t744cvbRaCXPXMuwjz1%2FaUjqSB5kH8LaplO5xt0yir80MYisTCflIvSBjqkAZ2U75svnjqwppzKz88y1xHzoUVVqOtMR2LSJsRKVw01wfDIFRKz9nIoirbiTkamjnT9WoEsLJloIxp7U59DRxja1PJQIqfmOhndfRcACXP0I%2BhDiM%2F9pmUeS%2FJqiK6RAyTbDrvl5BH700AM4QgT%2FjSGhvricMGT%2BW5U%2BM6iW6rNPVV3AaKzsvsBJxlppzfNyrricNQjrDdI62%2FsGEZE%2FEtNYoFT&X-Amz-Signature=bbc98b763862904988f1ca4d2ee45748b0f3ac4600509aca915fa92139824fcd&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466SSZMWEQ5%2F20260629%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260629T194109Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEOz%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCXEnNggjE%2B8SOssP0Z%2BOpBINWwzXFkxWYy1Pty%2FyYcAAIhAMxbe2mIhUjXbT8psRGrq9U%2BqN2xOXbUcIrwBEqed4N7KogECLX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgyQSnzPsJmQZnnd9usq3APlZE2aunJwJnwKMXL5rhhM9tJoUWBH9ZM8E19Lxjs%2F5%2B1J%2B8lEV8nd1m7pCM8k%2B4iAU4LGJVg2Ul5ULUBZyqGgzgSS0WNXs7YWDdFiLq1tQphJyHyoXOeSdDkFI%2Fgl%2FoK1%2BuScgVBXz6RrhulZa3hDFGaRMvKDGG%2FuHeOhEF2rR%2BIeHLnc6Z4eKxU%2BoEAhovdUhpqi2K0Cum29cgwH6rX%2FxBfSnCI%2F31GSerB%2F2ogFpDfug7sWz1Guo6O6YfJTqAg1cOBwy4FniKAKEhA4uSjzV6Bklpx2aUT7adg%2FQKxGUR7uYjzCto7Hamzabm5hHTOSpetDSZU%2BnICwehBUyYjPqva0tVcwUdCrKbeVJ8jREnEzIFbuf2F3HgVsTzgFd%2BJ3Lhi39kucpoyI47KK9rxZBNpZ1RA1HaFqlEfN0UZkDJt19OmSleKWkrJdd7gEXE%2BNL28j8kUb4vnP7ZIVUMYnfsQpv5iNAVKaPnybucyWSNimBVkTDrYnPuQq8J0RuycNjluimJiUvyeIbWrGa1%2BDhEn4MQ6f2OV5cRCYETDHTIgKjLzbGFYZsMnGK85JFloV01Zgtclq2t744cvbRaCXPXMuwjz1%2FaUjqSB5kH8LaplO5xt0yir80MYisTCflIvSBjqkAZ2U75svnjqwppzKz88y1xHzoUVVqOtMR2LSJsRKVw01wfDIFRKz9nIoirbiTkamjnT9WoEsLJloIxp7U59DRxja1PJQIqfmOhndfRcACXP0I%2BhDiM%2F9pmUeS%2FJqiK6RAyTbDrvl5BH700AM4QgT%2FjSGhvricMGT%2BW5U%2BM6iW6rNPVV3AaKzsvsBJxlppzfNyrricNQjrDdI62%2FsGEZE%2FEtNYoFT&X-Amz-Signature=cbb122315aa2c5213741327cbb9bcf907e60c4b39012bcd9ea64aa5af9f4c34b&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

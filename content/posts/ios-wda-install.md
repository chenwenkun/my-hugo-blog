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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4664PN5PJC5%2F20251214%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251214T010101Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEGEaCXVzLXdlc3QtMiJHMEUCICfELpN3bcOiw%2Bc8kyoczSlO3ejamhb5IYl1cGswmsuHAiEA%2Bcos7XkgEwTFvLpD8kiCUmih8FyGC2eml6LZ9mS2%2FNoq%2FwMIKhAAGgw2Mzc0MjMxODM4MDUiDHJ7dwqVogcC0ak23CrcA%2FIJhoCKuUKkeJ4LZHv9FbEOYroQos2aeAwWpD8xa8bDsbB4shNrzFRBr3xFr%2Fnz%2FsUcZs%2FzExTIi%2BcDRY4jAU%2FGx%2B%2Fni6%2F2ozWjKyT0ec9NfsAZonlKLve2Gifb%2BTMlm1M1P7Df5YiEWgIJbXPS1J7Xc9QF2QejzkRzUnYbnKxZXmQ5Iyv7enW8CvsRaQautt69upkrRBqw6SHd%2FmxJKOH2Lfk1xT3KC5tQzWE8IWWQQFWG4fcEOOrwHI5VZh1AMP7KhFbfA%2BR6hSpjnYh4ytHJftF0LQ61uHy%2BTBQ1TiAzkL8m3PRZfWG%2B6ZDb7cV9SVDpxbsx5kgcRABQ5d6be8PPP23eiZ%2FGKs5q%2BCXLiU%2F6fzoD9SqZcLBB7BDSopNmBkwCE6xyfXe7YONE566cda1Y95GO6aQTI6sUJC4tJ%2BhkhGQRejSvkCiwIbsmto05ogVusGvzIqdm1O3kqteReq5pmBc7jinXm7%2BWWaSDrc88peeEwWreQPZII1OIjyZ4GPDK1jWZTd%2FdaZKnkAfRhFNr7nQsAhggHlN74WEgUQ%2BLgRnA0QleYrRNajQlL6WuZQ3qPqvPztgiQ9fXfM16XuPFDlwAtvUqTN6gHIXMFlBsbAtyABXQnRFLeFbhMK6X%2BMkGOqUB%2FB1kwM3BjtE6J92WVrS2GPoyy%2F2nXKDB6HRQakS5O4aLFTANPidmMZM%2FjViFeoUaVAXSHoGR943Tsd813tuvcQ7uDLkhStmeZueTjvgdJkuyRHiHpGGVgIcGpMa5CCT2Lul0RJT%2Fm7TjvVLfiB0jAr8juG1UpdaFO4LCyhZO9RtdLM327yi9EnkJ2lRHTQlUrORHvFabriFw%2BqB2r8z1Qru9edBW&X-Amz-Signature=459e207d29f48210561322bf04920fd0ee65d4a91c4a6fb66289156dc2fa1cf1&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4664PN5PJC5%2F20251214%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251214T010101Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEGEaCXVzLXdlc3QtMiJHMEUCICfELpN3bcOiw%2Bc8kyoczSlO3ejamhb5IYl1cGswmsuHAiEA%2Bcos7XkgEwTFvLpD8kiCUmih8FyGC2eml6LZ9mS2%2FNoq%2FwMIKhAAGgw2Mzc0MjMxODM4MDUiDHJ7dwqVogcC0ak23CrcA%2FIJhoCKuUKkeJ4LZHv9FbEOYroQos2aeAwWpD8xa8bDsbB4shNrzFRBr3xFr%2Fnz%2FsUcZs%2FzExTIi%2BcDRY4jAU%2FGx%2B%2Fni6%2F2ozWjKyT0ec9NfsAZonlKLve2Gifb%2BTMlm1M1P7Df5YiEWgIJbXPS1J7Xc9QF2QejzkRzUnYbnKxZXmQ5Iyv7enW8CvsRaQautt69upkrRBqw6SHd%2FmxJKOH2Lfk1xT3KC5tQzWE8IWWQQFWG4fcEOOrwHI5VZh1AMP7KhFbfA%2BR6hSpjnYh4ytHJftF0LQ61uHy%2BTBQ1TiAzkL8m3PRZfWG%2B6ZDb7cV9SVDpxbsx5kgcRABQ5d6be8PPP23eiZ%2FGKs5q%2BCXLiU%2F6fzoD9SqZcLBB7BDSopNmBkwCE6xyfXe7YONE566cda1Y95GO6aQTI6sUJC4tJ%2BhkhGQRejSvkCiwIbsmto05ogVusGvzIqdm1O3kqteReq5pmBc7jinXm7%2BWWaSDrc88peeEwWreQPZII1OIjyZ4GPDK1jWZTd%2FdaZKnkAfRhFNr7nQsAhggHlN74WEgUQ%2BLgRnA0QleYrRNajQlL6WuZQ3qPqvPztgiQ9fXfM16XuPFDlwAtvUqTN6gHIXMFlBsbAtyABXQnRFLeFbhMK6X%2BMkGOqUB%2FB1kwM3BjtE6J92WVrS2GPoyy%2F2nXKDB6HRQakS5O4aLFTANPidmMZM%2FjViFeoUaVAXSHoGR943Tsd813tuvcQ7uDLkhStmeZueTjvgdJkuyRHiHpGGVgIcGpMa5CCT2Lul0RJT%2Fm7TjvVLfiB0jAr8juG1UpdaFO4LCyhZO9RtdLM327yi9EnkJ2lRHTQlUrORHvFabriFw%2BqB2r8z1Qru9edBW&X-Amz-Signature=9e7eb1ee2ff1e73f31b8710c6fe086942f05a74411abfc7b2769d58cdb53611b&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

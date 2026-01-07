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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466W7XNOBAN%2F20260107%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260107T122513Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEKz%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIEC6oKvgssO%2BpatLl13sVm3oG7bH0sK7J%2BWz8E%2FMYomjAiBeYzoyrp3%2FXVuvQZ%2FZRj7NNPakRg2Hku2tf8fbm0pMwCr%2FAwh1EAAaDDYzNzQyMzE4MzgwNSIMakuVVs5UTffZxWPNKtwDcJvMLo8lt%2BwbXgtQwM5e3KKiGd3S68q4mqbyX3zqym7ECh9lx%2BbCpacDG0bKTYtmsVCe9UPSPf7FCSRggBjDPW4X%2F0ytBX5yBphHLwEjhgIUha%2F7UKxXX4%2F61VViw2LlqT%2F%2FCZ2AIUI866zo0wncfHqfj7hN7tPGQ0wclnr803h34v4dceNlf%2F6QyqTXISYkUOUevY9PqBbkDE2CMTenftFRn4rcH0UuTYVc%2FxKz7vaqOc4TJSj3ZznCJDaoQ%2BUIs0UyBnt6y0oq6GiJVblnbPYc7kC5k4QjW71XhJkGkfh4aKA%2FhscFvmX9dI%2B1byPoGlTmeeOyxPjQUou5JFlSnebIk%2B7n6wmijCvdvfovFjhCWF0u4Dk594S27TSssEiIaiVPAbC%2BLg4jn5RIHB6vgODlf8WvxER%2BRsycFCWU%2BA184bx4kJnT9YwJhvy%2FtuzYkQyYXW62ov6qQrEYUDVnaQU7cgX4h2z12aLlOPfGYrequO4uOSobJUM6txhkLA9PKxEJ1j4ZbttyNS5Xzaa3r7Jy1O%2FWmEFgrI2DYHSU0nQDLAmG83HMwRSU437i7CNUVvSITj9eVE2fS55NK7YYuvqBYmck9P05YZNdFF9voc7T6aNY6gRAg059jEYwwZ35ygY6pgHlx61LGjzflOq9Wz6kbxcd9jRw9TVdsYkPRA%2FxmGpI2YeI5kkyuGhioNoUYlEcxgeCplb8XKBHTvDMi%2BrJ1k1Or4lO6MmfwfcxnmdYmcmyUK8MCsOsPpyeAChgg7k8HQIiakQr23zUXvk4oqpOk%2FDoM%2Bbsx0ecZ7IupF0HfmUkZEpAoiRmiebICMOjKmUOXG%2F4PkGQa13bb7tF2p%2F12iD%2Fswn3ofPR&X-Amz-Signature=b66db97deccfe9ee193e0ad9b57d5a4cb62167b621ba174d95b176491da524df&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466W7XNOBAN%2F20260107%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260107T122513Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEKz%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIEC6oKvgssO%2BpatLl13sVm3oG7bH0sK7J%2BWz8E%2FMYomjAiBeYzoyrp3%2FXVuvQZ%2FZRj7NNPakRg2Hku2tf8fbm0pMwCr%2FAwh1EAAaDDYzNzQyMzE4MzgwNSIMakuVVs5UTffZxWPNKtwDcJvMLo8lt%2BwbXgtQwM5e3KKiGd3S68q4mqbyX3zqym7ECh9lx%2BbCpacDG0bKTYtmsVCe9UPSPf7FCSRggBjDPW4X%2F0ytBX5yBphHLwEjhgIUha%2F7UKxXX4%2F61VViw2LlqT%2F%2FCZ2AIUI866zo0wncfHqfj7hN7tPGQ0wclnr803h34v4dceNlf%2F6QyqTXISYkUOUevY9PqBbkDE2CMTenftFRn4rcH0UuTYVc%2FxKz7vaqOc4TJSj3ZznCJDaoQ%2BUIs0UyBnt6y0oq6GiJVblnbPYc7kC5k4QjW71XhJkGkfh4aKA%2FhscFvmX9dI%2B1byPoGlTmeeOyxPjQUou5JFlSnebIk%2B7n6wmijCvdvfovFjhCWF0u4Dk594S27TSssEiIaiVPAbC%2BLg4jn5RIHB6vgODlf8WvxER%2BRsycFCWU%2BA184bx4kJnT9YwJhvy%2FtuzYkQyYXW62ov6qQrEYUDVnaQU7cgX4h2z12aLlOPfGYrequO4uOSobJUM6txhkLA9PKxEJ1j4ZbttyNS5Xzaa3r7Jy1O%2FWmEFgrI2DYHSU0nQDLAmG83HMwRSU437i7CNUVvSITj9eVE2fS55NK7YYuvqBYmck9P05YZNdFF9voc7T6aNY6gRAg059jEYwwZ35ygY6pgHlx61LGjzflOq9Wz6kbxcd9jRw9TVdsYkPRA%2FxmGpI2YeI5kkyuGhioNoUYlEcxgeCplb8XKBHTvDMi%2BrJ1k1Or4lO6MmfwfcxnmdYmcmyUK8MCsOsPpyeAChgg7k8HQIiakQr23zUXvk4oqpOk%2FDoM%2Bbsx0ecZ7IupF0HfmUkZEpAoiRmiebICMOjKmUOXG%2F4PkGQa13bb7tF2p%2F12iD%2Fswn3ofPR&X-Amz-Signature=fbd6725486aa78610050805567517b7e925842c82e6698f74cbfcb7a2ad687a2&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

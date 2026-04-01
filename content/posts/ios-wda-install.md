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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466XXCNNWZB%2F20260401%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260401T125407Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEIz%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIGz6CuM%2F1n7%2BDR26vB4pkyBVMWq7bM%2FZdzBgaMmdL6KRAiEA522Z6UqZNy1Jg%2FLRGdnF%2BuVjkVsGRZ0nzKVjOiyS7RYq%2FwMIVRAAGgw2Mzc0MjMxODM4MDUiDHQbNtx1IGlz3pyYSircAwCVogeg4ylStzHXPv%2BCccnk%2BeQrPGgGEwEquYfvgXEwu4eSZx1Vh0RSM2J%2FkWLwViF9qu4nRZW4%2FY%2B82bMg6iC7loq3Xbwzx2qjWVDNXug92kEy67dZshOvqJDTF5ZjIcYbebmU7lpGlTjbBlLuN6yYZ%2BjOwJab5ulblMpihoKyRS8z3J7o5xB04Ic495I%2FDJ3CPRGlptwrILwX7IQs89AIRAdfz9e4vhqFr5k9XEnoHSbvvovmWhK%2FxG0uuC6XBGvHG3%2FPuZ2yB%2BUKQFY0MMtrNuad064wlk4QcPY3zMk3Nka7Ro%2FWG5WIb3P6QnGV2nQwcgoc6U%2FPHEW9zXGMNqTLQPA1XBXua3gX%2FpvJ%2BLw0ySQ1P5LdPrP4%2Bj2pu7yVF9rWRRTrjuFLXk77EvhtfV1EqfOXvkfMd%2FSxgBaivXRi716IT%2Bhtd4Zs%2BTFD%2BNFeY4975OtjPTcv%2FnnYptwOdr%2F9Ehcf7Px3vrO8ZLC8KuLf0WcDjjNyq6wsIr7tiFWGtGuV4vB21Kj%2FBJUygGEy7ld%2BdzszExQlwtl19cdqz2iiX4ZJ%2BlYzmHVY1di4Uab4XCHOkLc3cnM0bQHb8K5LzZE5taNQFdEkIoGliJnqCCSVt%2Bw68od81tzQ%2FnEQMLOTtM4GOqUB1O%2F%2BEAs1BPBy3%2F4g7Hw72NQ7YmMonsgLbU%2F%2FLVRoe3ucXRANmPa4RR2tcE%2FVv6otutDrsmAcFb8FPwkzJ0LDgFsR82n6JHKK6t%2BW5JdqOAE30qFry%2B7dVCGxC%2FJAUG1L%2FbnhI2YT9oC4MedzbAjkXn3cW7%2FLpNSi2UffnQIZcdHsz%2B9DRYhCKlfoa5%2F7048ViJlafwdYyxiaJX5TRkqYJF%2Fa1Oxw&X-Amz-Signature=cabed54dc67702d47ca2019efa4cca530852aaa14672a88855203c2bba6d6a7d&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466XXCNNWZB%2F20260401%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260401T125407Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEIz%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIGz6CuM%2F1n7%2BDR26vB4pkyBVMWq7bM%2FZdzBgaMmdL6KRAiEA522Z6UqZNy1Jg%2FLRGdnF%2BuVjkVsGRZ0nzKVjOiyS7RYq%2FwMIVRAAGgw2Mzc0MjMxODM4MDUiDHQbNtx1IGlz3pyYSircAwCVogeg4ylStzHXPv%2BCccnk%2BeQrPGgGEwEquYfvgXEwu4eSZx1Vh0RSM2J%2FkWLwViF9qu4nRZW4%2FY%2B82bMg6iC7loq3Xbwzx2qjWVDNXug92kEy67dZshOvqJDTF5ZjIcYbebmU7lpGlTjbBlLuN6yYZ%2BjOwJab5ulblMpihoKyRS8z3J7o5xB04Ic495I%2FDJ3CPRGlptwrILwX7IQs89AIRAdfz9e4vhqFr5k9XEnoHSbvvovmWhK%2FxG0uuC6XBGvHG3%2FPuZ2yB%2BUKQFY0MMtrNuad064wlk4QcPY3zMk3Nka7Ro%2FWG5WIb3P6QnGV2nQwcgoc6U%2FPHEW9zXGMNqTLQPA1XBXua3gX%2FpvJ%2BLw0ySQ1P5LdPrP4%2Bj2pu7yVF9rWRRTrjuFLXk77EvhtfV1EqfOXvkfMd%2FSxgBaivXRi716IT%2Bhtd4Zs%2BTFD%2BNFeY4975OtjPTcv%2FnnYptwOdr%2F9Ehcf7Px3vrO8ZLC8KuLf0WcDjjNyq6wsIr7tiFWGtGuV4vB21Kj%2FBJUygGEy7ld%2BdzszExQlwtl19cdqz2iiX4ZJ%2BlYzmHVY1di4Uab4XCHOkLc3cnM0bQHb8K5LzZE5taNQFdEkIoGliJnqCCSVt%2Bw68od81tzQ%2FnEQMLOTtM4GOqUB1O%2F%2BEAs1BPBy3%2F4g7Hw72NQ7YmMonsgLbU%2F%2FLVRoe3ucXRANmPa4RR2tcE%2FVv6otutDrsmAcFb8FPwkzJ0LDgFsR82n6JHKK6t%2BW5JdqOAE30qFry%2B7dVCGxC%2FJAUG1L%2FbnhI2YT9oC4MedzbAjkXn3cW7%2FLpNSi2UffnQIZcdHsz%2B9DRYhCKlfoa5%2F7048ViJlafwdYyxiaJX5TRkqYJF%2Fa1Oxw&X-Amz-Signature=ad4bbb389125359cab2171cd940f89800fc07aa337445225526ff842b2a97a03&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

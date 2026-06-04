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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466TM2TGIRU%2F20260604%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260604T195304Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJT%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIHUvl9tpGMVLpLgQllSbMJHRy1y3aTVStfZpPPkbhNLqAiBzDo4lzdYu2pY%2BtNEN3PTnr6hG%2Bt5P5o4q5YOBUVl0%2FSr%2FAwhcEAAaDDYzNzQyMzE4MzgwNSIMZHN4DyU0zi2Osm8BKtwD1u4I73ns4q%2Bj2V1b%2BTvt0tKBz4Dg1BwFgfkQVx1mX4%2FGwcvjDD5WyJvhSdZHvtFtFfPxwBwvlpep3aKalbYssYxZKQ0mDlvXn3r6NxKnBnEayGpaTVmrT37PaBze4WGawN3vcqIMYlhft9u52u2Zn480tlhz7ewVVUa4PgBkh509jwT6znto3vlseLQMYa2qQCdC%2BZ%2FKaO1VZCSeFU%2BOeIBuJDSxTc%2BF7ONe%2BAXilILG3xugHxOou6Q5kU%2BkdJ7j3%2FsgD4ttg3bkG%2BMtbHNbVi%2BrwbW0dOTuunH43SJBdvt6Nr5HdpKc%2Fe2%2Fb5Nsb%2Bp1lMBa4ZbFEAi1%2FJPduIHJdyYNa3KeB%2BFbbv6G9jSVUPScuQbi46JQq3JlRbLS9JGGdrj%2Fj2naquk0TtE2GS%2B9OrBmzzf3g58B%2FuDI4kgM2Rvl3Js23VtUiIUZrQota1wqxGYVzJKnzVwL%2FMFrJiH1EUKuYZ5kPHE0iOjDmDUtLNfvOGt3FPIMW%2BlH1R5XzXWF8saVJqkGNZftMJrH0T%2B4EFpAGtatifhkj%2FAEI735mQRpWKSk%2Flb8DhZ5WAwwgyL%2FZkO4L1mmmz%2BuRcKcr%2BLrLflvuztF%2FqG7QPzbxUz3sRL2ihcqn0r%2F4enO1PMwqKGH0QY6pgFTO98nopTmlh7het50h1qIy9%2Fe%2FwBL9pdUM5rVaunsQubb3%2B2D5LTB8oOhRWMYxunBCEHTv8DbkZs5OSmu9w%2FPts77Vz2KxTUwmoB1EbAJdxNO%2FNdxRvl93rbCxq00MvvHYIroiNmFqSTiIiBxTqHplTqB49WcMNpT6CqdIJPKk1WkL1n8xKGu2l14aWG8x7oeR%2FzHqYt454E0KrpJEP1Gk3iMssnq&X-Amz-Signature=fa7b8491fbd1f8e3ee0132a182d03f00489c29f83c18ffaab5dc4522f128bba2&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466TM2TGIRU%2F20260604%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260604T195304Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJT%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIHUvl9tpGMVLpLgQllSbMJHRy1y3aTVStfZpPPkbhNLqAiBzDo4lzdYu2pY%2BtNEN3PTnr6hG%2Bt5P5o4q5YOBUVl0%2FSr%2FAwhcEAAaDDYzNzQyMzE4MzgwNSIMZHN4DyU0zi2Osm8BKtwD1u4I73ns4q%2Bj2V1b%2BTvt0tKBz4Dg1BwFgfkQVx1mX4%2FGwcvjDD5WyJvhSdZHvtFtFfPxwBwvlpep3aKalbYssYxZKQ0mDlvXn3r6NxKnBnEayGpaTVmrT37PaBze4WGawN3vcqIMYlhft9u52u2Zn480tlhz7ewVVUa4PgBkh509jwT6znto3vlseLQMYa2qQCdC%2BZ%2FKaO1VZCSeFU%2BOeIBuJDSxTc%2BF7ONe%2BAXilILG3xugHxOou6Q5kU%2BkdJ7j3%2FsgD4ttg3bkG%2BMtbHNbVi%2BrwbW0dOTuunH43SJBdvt6Nr5HdpKc%2Fe2%2Fb5Nsb%2Bp1lMBa4ZbFEAi1%2FJPduIHJdyYNa3KeB%2BFbbv6G9jSVUPScuQbi46JQq3JlRbLS9JGGdrj%2Fj2naquk0TtE2GS%2B9OrBmzzf3g58B%2FuDI4kgM2Rvl3Js23VtUiIUZrQota1wqxGYVzJKnzVwL%2FMFrJiH1EUKuYZ5kPHE0iOjDmDUtLNfvOGt3FPIMW%2BlH1R5XzXWF8saVJqkGNZftMJrH0T%2B4EFpAGtatifhkj%2FAEI735mQRpWKSk%2Flb8DhZ5WAwwgyL%2FZkO4L1mmmz%2BuRcKcr%2BLrLflvuztF%2FqG7QPzbxUz3sRL2ihcqn0r%2F4enO1PMwqKGH0QY6pgFTO98nopTmlh7het50h1qIy9%2Fe%2FwBL9pdUM5rVaunsQubb3%2B2D5LTB8oOhRWMYxunBCEHTv8DbkZs5OSmu9w%2FPts77Vz2KxTUwmoB1EbAJdxNO%2FNdxRvl93rbCxq00MvvHYIroiNmFqSTiIiBxTqHplTqB49WcMNpT6CqdIJPKk1WkL1n8xKGu2l14aWG8x7oeR%2FzHqYt454E0KrpJEP1Gk3iMssnq&X-Amz-Signature=9fe18a8c7b27e81804e0c2bb27d661af380dc04d63e98d7843cf23369ef5825b&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

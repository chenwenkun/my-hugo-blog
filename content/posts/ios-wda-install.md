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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466V34IRTBZ%2F20251124%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251124T122234Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEIz%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCICOLmMGsqCzyeOXFuDyWkBg81ksByQpIaqVUkoiqbz4jAiEA%2BfLemedBxQKU6Hr%2FsGSdmLH86adjJFwLxbd746ss%2BJIq%2FwMIVRAAGgw2Mzc0MjMxODM4MDUiDEfglVRa5GUZIkQeeyrcAw4Bn82vcbBM%2FgZO73GtkbnwhCaipePwCGg3pnYq8P9X53S2%2F1F%2Fh%2Bo%2BOwH4faqGVhN0vGkdnr1F52z%2BmkWomVOsMCqkmllruVEFvkr%2BEqRkoy5Z0F7zl%2FiAa007dae12Tl9I1EDRm9rUYXoqtX6X9LJf6SFzOGnkxSimruxUTdCV63e3aec6N5eALCKJu%2BXPNzehv7lkhMAYrqX5fiOFxy3b6bPON5hIXxkHR4fJc%2BPZ9AQNPPwf8GUwCKwzaBMFolFPz0BVphXF1itsEwOtZWeCoNlj5dlmH%2Fuiiv%2BXW5liBmNyztguF6VLQct2TcMQimxn8D5HWye0aG39WQsZlcRQ%2B9Ttb4H6BEnb1sGeZTHDa9OgEdUKY31M8Ea00wkwJrBWDTLNXmPFH6frZ61zZ0VEWCk5Fd5sU7L24XZ2b8BvEbtkQpNrW9RoJ0TXUK5Fa%2FkYlZ%2FJ5FdIzqezosNOxvU7H9UoeFAZJnLT5vnegnDvb7N6d2C87F5jDa4UDnJXHfcEWj%2B8jxte3ZPvRpREaHGHzd7QCl3r1c%2BpscxwOVOk23TKyPNFqiM%2BQccxsOmnQnXGostPZRCiiVCCQ%2FbEtOQHsYkRnhFs2gexmacrKVOL63zh63FXlo781rtMMSYkckGOqUBhtNiixPkPzaPCQJ2G8RXxVny79CtjxQojNmJ68xW4Y4I0rRw%2Bg7oJvI0Z%2F4rwb2uEJBhC26s0he0T7VDaC%2B5nCa714JFr6REgYwGnb9CmBuriMDxsFW%2BTm%2BlLzYrUlaKx7m1Z%2BX27ZTlMFAkA9zy%2FvZEjiN9HLGSbIoA5zaUPsmxgOo4epVPwFrbQw5P0mXDv0aYx0KHstf1WpvHWL6FusRUxPC6&X-Amz-Signature=cf974c14706843c6a060112d7e803d68a9c9dd17a0f3b133bdc4b00ee3be838d&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466V34IRTBZ%2F20251124%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251124T122234Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEIz%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCICOLmMGsqCzyeOXFuDyWkBg81ksByQpIaqVUkoiqbz4jAiEA%2BfLemedBxQKU6Hr%2FsGSdmLH86adjJFwLxbd746ss%2BJIq%2FwMIVRAAGgw2Mzc0MjMxODM4MDUiDEfglVRa5GUZIkQeeyrcAw4Bn82vcbBM%2FgZO73GtkbnwhCaipePwCGg3pnYq8P9X53S2%2F1F%2Fh%2Bo%2BOwH4faqGVhN0vGkdnr1F52z%2BmkWomVOsMCqkmllruVEFvkr%2BEqRkoy5Z0F7zl%2FiAa007dae12Tl9I1EDRm9rUYXoqtX6X9LJf6SFzOGnkxSimruxUTdCV63e3aec6N5eALCKJu%2BXPNzehv7lkhMAYrqX5fiOFxy3b6bPON5hIXxkHR4fJc%2BPZ9AQNPPwf8GUwCKwzaBMFolFPz0BVphXF1itsEwOtZWeCoNlj5dlmH%2Fuiiv%2BXW5liBmNyztguF6VLQct2TcMQimxn8D5HWye0aG39WQsZlcRQ%2B9Ttb4H6BEnb1sGeZTHDa9OgEdUKY31M8Ea00wkwJrBWDTLNXmPFH6frZ61zZ0VEWCk5Fd5sU7L24XZ2b8BvEbtkQpNrW9RoJ0TXUK5Fa%2FkYlZ%2FJ5FdIzqezosNOxvU7H9UoeFAZJnLT5vnegnDvb7N6d2C87F5jDa4UDnJXHfcEWj%2B8jxte3ZPvRpREaHGHzd7QCl3r1c%2BpscxwOVOk23TKyPNFqiM%2BQccxsOmnQnXGostPZRCiiVCCQ%2FbEtOQHsYkRnhFs2gexmacrKVOL63zh63FXlo781rtMMSYkckGOqUBhtNiixPkPzaPCQJ2G8RXxVny79CtjxQojNmJ68xW4Y4I0rRw%2Bg7oJvI0Z%2F4rwb2uEJBhC26s0he0T7VDaC%2B5nCa714JFr6REgYwGnb9CmBuriMDxsFW%2BTm%2BlLzYrUlaKx7m1Z%2BX27ZTlMFAkA9zy%2FvZEjiN9HLGSbIoA5zaUPsmxgOo4epVPwFrbQw5P0mXDv0aYx0KHstf1WpvHWL6FusRUxPC6&X-Amz-Signature=010d50de84a6d8de6e876f236d1565b90d8acb44e7f08eae36486b6dd03e18fc&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

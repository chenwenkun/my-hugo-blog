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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466WJ2URXRW%2F20260604%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260604T023854Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEIL%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIBOJ%2F1lbqO0hcX5P0Tk8UEiSpHnW%2Fee1bjJ929mdRntAAiEA9%2FgEbSqS4M0Vb1SR67nLSDjhuoqVlf9P%2FYG%2F96WTfeQq%2FwMISxAAGgw2Mzc0MjMxODM4MDUiDBbFcvPWdY4IcepLpCrcA3xYjnZCIaJXusIkDT7hZFmF5AlPVqCh5ae8ROpKVUCLrHupvvDwE8bAvdUnjDp91GK12CMjXd3CWsda3MNPBUdRTOCzHMrOrKbeeBdtkUJZmuuIi9TTtlzKpacWEc7tpz65ePHRQG11PbiEtlaLTq4w761X3vn6iym%2BXmpmpIxkCmvPkFMpoJNUwb6rUQlD%2FJul4wcP5SH40KnhYw0pPCC%2F4Ix6rM4VYXrleoPaE7KhY3vkTybGUtflKkeC9Htihn1zDO7hpGCPTm8IlHmu%2BiNiSV8UoVQvkWrVwHlHI8PzbQzyTu7y2DyFutr8Iuo0FnBVphEOxCWTQfx43%2F4Q9Z0PZFrTj4ec1dIruc9pkBl3fT50vPKgTHO7iD6%2Bz209BPb8hXF%2B%2F7zNECVrVnhla2ZWdrscdKuKy77PAJLVuUImLdNBT54YZBeA5MUmMBYCcGiGsmwOAPerxnkjYtpebfqX3qWwnF3VNv%2BAWmcOPyPDDVMYAQzKz3K9GtuqkbIC1SbRfNLNPJ0K55NLewDvCren3TUIzKb1KIdr%2FOgDTbLzibPiTqK1YTHFec33ZtON5RzjIklu5%2BfXIs4PD%2BVVLiVW5x0m6izdb1nDCtjhXmvcGR5TUkzTdIBLNSgUMNOvg9EGOqUBJrpIDF1ti9zju9TkH2j0Ct7Tb03nQI5pcUxUkdroRM5pAQcGezdtXf6dNe1U06ot4yYOwSuoqBuRJ23jFWmbnTYMntZO4r2244oB03BGppEyMm3%2FCg1SrL3HKNRrhLPiY63VFAfjj3uo7GbfFknCw5t96hv5dy97FueCQxbHVVKLVBUcC%2FhHFRGbp3m7VdZIy8pCOjoEQvlkGUZIejn9nZIzn9HQ&X-Amz-Signature=3da77a8a7a0f9e7007dacf22f7b4dfee10527dfa98f40028b9297af97f2ae4a4&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466WJ2URXRW%2F20260604%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260604T023854Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEIL%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIBOJ%2F1lbqO0hcX5P0Tk8UEiSpHnW%2Fee1bjJ929mdRntAAiEA9%2FgEbSqS4M0Vb1SR67nLSDjhuoqVlf9P%2FYG%2F96WTfeQq%2FwMISxAAGgw2Mzc0MjMxODM4MDUiDBbFcvPWdY4IcepLpCrcA3xYjnZCIaJXusIkDT7hZFmF5AlPVqCh5ae8ROpKVUCLrHupvvDwE8bAvdUnjDp91GK12CMjXd3CWsda3MNPBUdRTOCzHMrOrKbeeBdtkUJZmuuIi9TTtlzKpacWEc7tpz65ePHRQG11PbiEtlaLTq4w761X3vn6iym%2BXmpmpIxkCmvPkFMpoJNUwb6rUQlD%2FJul4wcP5SH40KnhYw0pPCC%2F4Ix6rM4VYXrleoPaE7KhY3vkTybGUtflKkeC9Htihn1zDO7hpGCPTm8IlHmu%2BiNiSV8UoVQvkWrVwHlHI8PzbQzyTu7y2DyFutr8Iuo0FnBVphEOxCWTQfx43%2F4Q9Z0PZFrTj4ec1dIruc9pkBl3fT50vPKgTHO7iD6%2Bz209BPb8hXF%2B%2F7zNECVrVnhla2ZWdrscdKuKy77PAJLVuUImLdNBT54YZBeA5MUmMBYCcGiGsmwOAPerxnkjYtpebfqX3qWwnF3VNv%2BAWmcOPyPDDVMYAQzKz3K9GtuqkbIC1SbRfNLNPJ0K55NLewDvCren3TUIzKb1KIdr%2FOgDTbLzibPiTqK1YTHFec33ZtON5RzjIklu5%2BfXIs4PD%2BVVLiVW5x0m6izdb1nDCtjhXmvcGR5TUkzTdIBLNSgUMNOvg9EGOqUBJrpIDF1ti9zju9TkH2j0Ct7Tb03nQI5pcUxUkdroRM5pAQcGezdtXf6dNe1U06ot4yYOwSuoqBuRJ23jFWmbnTYMntZO4r2244oB03BGppEyMm3%2FCg1SrL3HKNRrhLPiY63VFAfjj3uo7GbfFknCw5t96hv5dy97FueCQxbHVVKLVBUcC%2FhHFRGbp3m7VdZIy8pCOjoEQvlkGUZIejn9nZIzn9HQ&X-Amz-Signature=d9bff44083cb730d20a2825bfa6a0fde20c89262d7bc8a639b7522afc72ff113&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

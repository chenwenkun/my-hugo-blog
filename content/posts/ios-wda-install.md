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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663J4SX4UL%2F20260527%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260527T021501Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEML%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQCHRFCTVCGv0ziaC8jWSRUva38Wl%2FTLwIREfSY%2FsYgNNAIgUgYv4aqMMc78sYO4%2FwhdR4IZx0pb7QQjqUHHPZnjy3MqiAQIi%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDDb9NdwgJ2q%2BSECUXyrcA9%2F3feayqTENWlGllR0B0gIx6rCAJWMIJIKNKb8OFiQpO8qra2ztSV30LdXt2MnZxxoLHPquRHuUyzu5ZnmZEaO5k5WRVDoBF22wZbpSoYytlvmgxJyrBHBXI%2F1wSZwjALhiludzEwyhQFSVP%2B2MmWGsIKDlN9BAjX%2F%2BkDpCiRvMmh2xz0ykzyGq9Q3S62XFSoujxdVY5bfR5Wgw%2BK%2F2Xa8Nq6EcJLU7ZQ8kk2P0aQT0%2B7uUYzO2we0UaQc8lnYMiKlV2cmcqrExsiQTy8lIgM105hGBEXlsSkRUPlepVj%2BzBNCRsZHzypcihyUeRFCd4iI9WM5Z3dAGRiHoo4YlCz7d9jWXIIkCH7riMmwgUzaYda%2FNwrj5Kb1lQrp%2BMfKX1KLO4%2BWHOuDz3fiaX%2FjdKJ1NXDkyBF3xbuUJ8JkXQOuu4JUmKIWZICBo6npxfweArTlBrpoUw1TFbb1dpreJB%2Fd1Prlfiy5RmyPI9C%2FZVOs4%2F9EBy7wGmxnTq50wtk6fcde0eyvtsnvSGXTXxYv%2BdhAzTFFKLKNaWYvRWQfiSMH%2BrVi4DKX5GUe2eIGkZ90Q6b6vd3gZjssjWuT2nAYSZYBMWM3r25Cm6uixN%2FpU1%2FQWqeWXiuiNHuX2VqXhMJOd2dAGOqUBku7YBObgwSGTpxtaBaasQp%2BHAKb1LBkVCQdOWuQqzfG7FVp7LO93cniHaR7c8NvYk9403uGEg7mVsll9Gu9L97yt47Xa3VeCziaiACqOpK0XluKUW%2BaWI0VgVoiKpNpzPAMJXXRuZhI8VNRjAqAxdYAA4ny9Dc4CIsunvFn4kTTbDVmUK67RsKvkidybUtQucPw13FkSRBtcX5%2BEZQXIcJZujGMz&X-Amz-Signature=e27e03791ddcade2ab87330f27d6ddc7a9a1a3ed7805856ef002b27eade1aa96&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663J4SX4UL%2F20260527%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260527T021501Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEML%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQCHRFCTVCGv0ziaC8jWSRUva38Wl%2FTLwIREfSY%2FsYgNNAIgUgYv4aqMMc78sYO4%2FwhdR4IZx0pb7QQjqUHHPZnjy3MqiAQIi%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDDb9NdwgJ2q%2BSECUXyrcA9%2F3feayqTENWlGllR0B0gIx6rCAJWMIJIKNKb8OFiQpO8qra2ztSV30LdXt2MnZxxoLHPquRHuUyzu5ZnmZEaO5k5WRVDoBF22wZbpSoYytlvmgxJyrBHBXI%2F1wSZwjALhiludzEwyhQFSVP%2B2MmWGsIKDlN9BAjX%2F%2BkDpCiRvMmh2xz0ykzyGq9Q3S62XFSoujxdVY5bfR5Wgw%2BK%2F2Xa8Nq6EcJLU7ZQ8kk2P0aQT0%2B7uUYzO2we0UaQc8lnYMiKlV2cmcqrExsiQTy8lIgM105hGBEXlsSkRUPlepVj%2BzBNCRsZHzypcihyUeRFCd4iI9WM5Z3dAGRiHoo4YlCz7d9jWXIIkCH7riMmwgUzaYda%2FNwrj5Kb1lQrp%2BMfKX1KLO4%2BWHOuDz3fiaX%2FjdKJ1NXDkyBF3xbuUJ8JkXQOuu4JUmKIWZICBo6npxfweArTlBrpoUw1TFbb1dpreJB%2Fd1Prlfiy5RmyPI9C%2FZVOs4%2F9EBy7wGmxnTq50wtk6fcde0eyvtsnvSGXTXxYv%2BdhAzTFFKLKNaWYvRWQfiSMH%2BrVi4DKX5GUe2eIGkZ90Q6b6vd3gZjssjWuT2nAYSZYBMWM3r25Cm6uixN%2FpU1%2FQWqeWXiuiNHuX2VqXhMJOd2dAGOqUBku7YBObgwSGTpxtaBaasQp%2BHAKb1LBkVCQdOWuQqzfG7FVp7LO93cniHaR7c8NvYk9403uGEg7mVsll9Gu9L97yt47Xa3VeCziaiACqOpK0XluKUW%2BaWI0VgVoiKpNpzPAMJXXRuZhI8VNRjAqAxdYAA4ny9Dc4CIsunvFn4kTTbDVmUK67RsKvkidybUtQucPw13FkSRBtcX5%2BEZQXIcJZujGMz&X-Amz-Signature=fc09e68fb52b7d83f3db3b6bf853ea5dd5783b1f31e442b20d25f6a6273c2759&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

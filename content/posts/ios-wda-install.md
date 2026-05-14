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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466XOE5NIXC%2F20260514%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260514T132905Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIAn0QgRE3SUhsC5ESstv46dkAsmVn5EbB7IOA9KzJyxAAiA1U2mIbXh98vqvtH5xouYsASyHPTCOEEidu9NX%2BzqOjSr%2FAwheEAAaDDYzNzQyMzE4MzgwNSIMZr3QSTUHUo0iEwx2KtwDHKveWrAxDi1WborWlYsON75hItPTGc3Xy%2F%2BbVopzITptOgX6w3Loolg%2FQz77IDe50jYHLupUXm1hvnS3nCb6txb6Wm5wcrU9oR0HiirESdMLYO5ou9EGW4dVnqHlqoTTybuhyZkWy%2F8sHddPNWzXElvYdLP%2Bz92%2FcrUWq9JJ6f0xPodaJBG7IqG6OOKQdpeGkJQ7HmkhOLnYNT2CRtZCEXSJJFv88C5CKhu8TWWqBncsRIjLscZah9QMv1WnbVFgWd9UD0NfLxeCafB%2F1J2cuC%2B6hnFgBabnzumx8rK52vQMPEg6dC9V7jMME5X7pC5u2itjQiPsAVdbkkHnQjQjkR8L5%2FsJ9z5bV2RZd1o0hGhUMLZjLK1gJZUwMP%2FtqlKME0I1U2wUQXX%2Ffl1zYY7WE08gEjVolGJAOmRmstav1bREOU0NYHkVH0rfHABuuxTxVNuGvOMUICfuP%2Fn11zKwFPHuLHA3%2Frfv9iL2%2FRRJDMZsHPd2c3RWzyPKgvMwwb8%2FLW6kb1U4pBdaCu5EWIs6kksGAc5UvI7NEUbhu3ZvITNrfggtleG47QLe1pVBjwfLRMgjdPLci1%2FoCqlboAp23dRyImwGRJLh%2FvS42BDyM0MeHgfcpPkK29XlRFsw8YCX0AY6pgHwUJFMFEx9tkmHFE%2BRquivlSuXehsJMMwW3ZTHEWJxCxBnTTi2SglZt%2FGLkf2bIeTvF3FRWbuAqFZJ%2BWjs0jvnGToetsS4nywousUTCO%2Flu9GO6DBSh0vJ6ikcYeS%2FW2ZcpCBjDwjQb1RkTIeBa30xMSckZtOnS%2F00VjiOB4wSj%2FzMhGP4Z%2BV9Watosmn0j02eu3Paf65HuWxNmypGBKsuNC5F7oQy&X-Amz-Signature=1d79f8be44dc4428b146721e7d7a8b9cb9343ecc842c63f23b0dbab13ade4e13&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466XOE5NIXC%2F20260514%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260514T132905Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIAn0QgRE3SUhsC5ESstv46dkAsmVn5EbB7IOA9KzJyxAAiA1U2mIbXh98vqvtH5xouYsASyHPTCOEEidu9NX%2BzqOjSr%2FAwheEAAaDDYzNzQyMzE4MzgwNSIMZr3QSTUHUo0iEwx2KtwDHKveWrAxDi1WborWlYsON75hItPTGc3Xy%2F%2BbVopzITptOgX6w3Loolg%2FQz77IDe50jYHLupUXm1hvnS3nCb6txb6Wm5wcrU9oR0HiirESdMLYO5ou9EGW4dVnqHlqoTTybuhyZkWy%2F8sHddPNWzXElvYdLP%2Bz92%2FcrUWq9JJ6f0xPodaJBG7IqG6OOKQdpeGkJQ7HmkhOLnYNT2CRtZCEXSJJFv88C5CKhu8TWWqBncsRIjLscZah9QMv1WnbVFgWd9UD0NfLxeCafB%2F1J2cuC%2B6hnFgBabnzumx8rK52vQMPEg6dC9V7jMME5X7pC5u2itjQiPsAVdbkkHnQjQjkR8L5%2FsJ9z5bV2RZd1o0hGhUMLZjLK1gJZUwMP%2FtqlKME0I1U2wUQXX%2Ffl1zYY7WE08gEjVolGJAOmRmstav1bREOU0NYHkVH0rfHABuuxTxVNuGvOMUICfuP%2Fn11zKwFPHuLHA3%2Frfv9iL2%2FRRJDMZsHPd2c3RWzyPKgvMwwb8%2FLW6kb1U4pBdaCu5EWIs6kksGAc5UvI7NEUbhu3ZvITNrfggtleG47QLe1pVBjwfLRMgjdPLci1%2FoCqlboAp23dRyImwGRJLh%2FvS42BDyM0MeHgfcpPkK29XlRFsw8YCX0AY6pgHwUJFMFEx9tkmHFE%2BRquivlSuXehsJMMwW3ZTHEWJxCxBnTTi2SglZt%2FGLkf2bIeTvF3FRWbuAqFZJ%2BWjs0jvnGToetsS4nywousUTCO%2Flu9GO6DBSh0vJ6ikcYeS%2FW2ZcpCBjDwjQb1RkTIeBa30xMSckZtOnS%2F00VjiOB4wSj%2FzMhGP4Z%2BV9Watosmn0j02eu3Paf65HuWxNmypGBKsuNC5F7oQy&X-Amz-Signature=c127d937a0aea911a2a607fe431bbf68b3cc6eacbf9c10facd44c75024cdca43&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

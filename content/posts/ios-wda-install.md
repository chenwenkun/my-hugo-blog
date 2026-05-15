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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663CNXP4AR%2F20260515%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260515T132816Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEK3%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIDWFQ%2BWMtktBqGacWYiQBnTbEdEpC2z0WwBmk5euTtp%2FAiEA3%2FoYnfLOssRrrGbrhW%2BM9aAdbJ78IZ%2B305XNZgLN18wq%2FwMIdhAAGgw2Mzc0MjMxODM4MDUiDJCjQci%2FJSjYgJwlISrcAwElnX%2BEIIxXmYK9kB9D2k22zffqTK3Z93Q6SFIqmnNpwW%2BfN%2BQdiUtJJ98IFcoNNzz9blvo4M3274ip13TLgPzwhakcOK7e5qkyc%2BNa94w7h9UhiK4%2F3Lo98I0LhE5%2FceCLk6hNQ%2Fd2oza9D2fp8BPOfYq94GOIaSwPjizgLu65TPAK6AiHNcgSchzJc6m6me826AlYoV%2BMejNBjTEY3M31Tk%2BrJAdBA7ELhXiwMwSrUfyIQHk3Y%2BP4qoiCG3puxXu2LC21gdBu1hn7yEYvszmoa3lFO88%2FrRlE2jNQKgziedxNWrsOqI8%2Ffg445G6qbKR9R8g5RX0dSXXawiPK2x%2FWqapICP4u7A2IW%2BvWb30pavG4U8Q0xgvasavsx5%2F9VNCcDhNXOUXa2zS8PNLNYFciG5jJFHe57ROeOUBNkm0BBSe%2F5tEl%2BVpyI9IG4Fq1d7t0ZZwWO7lVn9DESXFPCxMfSykod0eRKAFxDkQ7KPvKrUkaTK%2FIoFbeonE1Vw1w10QgdeWG9ZaqV3vpNL6llnPTcs3N5uEv9Q9BF4Fjhim95ZHLtR0X%2BBgUAMSJW%2FpJJ4Nx%2FQWY%2BqKhfeO7lGRRCmREenF3H70O6ZzhLc5ODXzIOOS7fMG57xxl58hOMNW5nNAGOqUBf8SToodzkWcAoWn5KuzTaTXSpzLJeGRzzSfDiTdjlbTyo7jwPU3qEb80l35VrTYBnEHpGhZVhsislo%2FMD%2BX28SEITtQIor7fG%2F15Jzb1f8TloH8Bu2gfOsu7CwSo61Viif4E9fpk7Nbp2toxxc2EdcTVQG5Edw%2Fyi6nkqLng0XSTWkHZDTVMpsAd7wNxRGYsCsL6dId3OFQBxjq%2FTSG7lTE4BmxV&X-Amz-Signature=54f2f2c1437d5672f0e9de8034e6462377eb8827b571e65cbbeabf24ec00822e&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663CNXP4AR%2F20260515%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260515T132816Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEK3%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIDWFQ%2BWMtktBqGacWYiQBnTbEdEpC2z0WwBmk5euTtp%2FAiEA3%2FoYnfLOssRrrGbrhW%2BM9aAdbJ78IZ%2B305XNZgLN18wq%2FwMIdhAAGgw2Mzc0MjMxODM4MDUiDJCjQci%2FJSjYgJwlISrcAwElnX%2BEIIxXmYK9kB9D2k22zffqTK3Z93Q6SFIqmnNpwW%2BfN%2BQdiUtJJ98IFcoNNzz9blvo4M3274ip13TLgPzwhakcOK7e5qkyc%2BNa94w7h9UhiK4%2F3Lo98I0LhE5%2FceCLk6hNQ%2Fd2oza9D2fp8BPOfYq94GOIaSwPjizgLu65TPAK6AiHNcgSchzJc6m6me826AlYoV%2BMejNBjTEY3M31Tk%2BrJAdBA7ELhXiwMwSrUfyIQHk3Y%2BP4qoiCG3puxXu2LC21gdBu1hn7yEYvszmoa3lFO88%2FrRlE2jNQKgziedxNWrsOqI8%2Ffg445G6qbKR9R8g5RX0dSXXawiPK2x%2FWqapICP4u7A2IW%2BvWb30pavG4U8Q0xgvasavsx5%2F9VNCcDhNXOUXa2zS8PNLNYFciG5jJFHe57ROeOUBNkm0BBSe%2F5tEl%2BVpyI9IG4Fq1d7t0ZZwWO7lVn9DESXFPCxMfSykod0eRKAFxDkQ7KPvKrUkaTK%2FIoFbeonE1Vw1w10QgdeWG9ZaqV3vpNL6llnPTcs3N5uEv9Q9BF4Fjhim95ZHLtR0X%2BBgUAMSJW%2FpJJ4Nx%2FQWY%2BqKhfeO7lGRRCmREenF3H70O6ZzhLc5ODXzIOOS7fMG57xxl58hOMNW5nNAGOqUBf8SToodzkWcAoWn5KuzTaTXSpzLJeGRzzSfDiTdjlbTyo7jwPU3qEb80l35VrTYBnEHpGhZVhsislo%2FMD%2BX28SEITtQIor7fG%2F15Jzb1f8TloH8Bu2gfOsu7CwSo61Viif4E9fpk7Nbp2toxxc2EdcTVQG5Edw%2Fyi6nkqLng0XSTWkHZDTVMpsAd7wNxRGYsCsL6dId3OFQBxjq%2FTSG7lTE4BmxV&X-Amz-Signature=14eb680c01bc37e6de97d59c278b108b871e58eaaac6637a7b59e15d44cbc04f&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

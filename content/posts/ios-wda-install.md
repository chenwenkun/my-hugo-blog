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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466RJAGEIZL%2F20260409%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260409T184907Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEFIaCXVzLXdlc3QtMiJIMEYCIQDoZoQEoWd6TdKyOQDSUeQRnIMHzXPY8OvFpL25yD95vQIhAL8ks2QLjOMhchlGxThannE2GF%2B6N3boG8z4hfRtaf4lKv8DCBsQABoMNjM3NDIzMTgzODA1IgxlG0Mg%2B9%2F8Aw9agU0q3AOcTkNlISPMwhY0kM6s%2FnF%2FlTE6GN1P9s%2BvkYxzaOqHbpb%2BuqjWxre8bRsIoRrEYrnuFO%2F%2Boln1%2FMJZvnvPCfKo6FLN8OHNAI7gt4vsjcETYqKX%2FDTRElI0%2B9vHRZZhKdDIUQEg4P7PBJDjb%2F0H6obqIOFpbVTYK8sGBukgkAnDuQLAX9Z7p2cEYH3w%2BaIO%2FgAqh08lloU0y10f%2B4Us3vEkBv7Gvq5Z1QOCkBQkBmXs1dR79k54jgx6J8%2Bbw%2F0rqL6Ugq3LIp%2Bk2K6DmfIqaCFcqvfJrzn8X8gAoc7KTqfrxhRSoqhMj7HQaxco%2FlUpS6Nh6aOtaxV6P6EsCGzaI0rINnMFmswkeiq9wB2Dn%2F052OIKSFiZfeZETdJm8FSjY6AtdlVuRB4ub2vlRPNVFpOffbTinCFDGpu8KdibSgS1YH6fxZeRg33e0lhHdjOruRIs7RUwyN9EPJs5KfdXspfFa%2F67ixrJQ5e1IeM71jMOG3%2Fs2KTkT14DeiNsGrtBcImbAvc0fMgFrHr5VP8WVUSOtyP30slY4BEwpTLoWjUl4WZ5Ovp%2BAJKQep6rtd6uLEGqF7s%2FNly6dZvGh0%2FpnUB7vmF9xtzEBBe%2F4M0kpxtZmGL9UBrzr8o0HW%2FH9jDSxt%2FOBjqkASG5RBmEUZQTfbi3%2Byc7BhugBk%2BXzohlcv3ZApoaGHLSrsaF6eV8NvmVEncVOImr%2F205LCF6QXJkJS7OYn8OhWtviXyeOSsnLPvszHTBk5vmF9wGcbzyJ5FxIPeblHMavxhfmdEPAuJv3ESuE0DazTcSxr98PmyAy%2BVLf%2FVTzdYpnxu7JQdDLa5hb1ofIQ8ngjbnEhZv9QQ5o7JjR9u8jzLWIGvl&X-Amz-Signature=aa40d9c59b0fd91d7408f4c697099e92794222a0db054acdc76fd72c7452887c&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466RJAGEIZL%2F20260409%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260409T184907Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEFIaCXVzLXdlc3QtMiJIMEYCIQDoZoQEoWd6TdKyOQDSUeQRnIMHzXPY8OvFpL25yD95vQIhAL8ks2QLjOMhchlGxThannE2GF%2B6N3boG8z4hfRtaf4lKv8DCBsQABoMNjM3NDIzMTgzODA1IgxlG0Mg%2B9%2F8Aw9agU0q3AOcTkNlISPMwhY0kM6s%2FnF%2FlTE6GN1P9s%2BvkYxzaOqHbpb%2BuqjWxre8bRsIoRrEYrnuFO%2F%2Boln1%2FMJZvnvPCfKo6FLN8OHNAI7gt4vsjcETYqKX%2FDTRElI0%2B9vHRZZhKdDIUQEg4P7PBJDjb%2F0H6obqIOFpbVTYK8sGBukgkAnDuQLAX9Z7p2cEYH3w%2BaIO%2FgAqh08lloU0y10f%2B4Us3vEkBv7Gvq5Z1QOCkBQkBmXs1dR79k54jgx6J8%2Bbw%2F0rqL6Ugq3LIp%2Bk2K6DmfIqaCFcqvfJrzn8X8gAoc7KTqfrxhRSoqhMj7HQaxco%2FlUpS6Nh6aOtaxV6P6EsCGzaI0rINnMFmswkeiq9wB2Dn%2F052OIKSFiZfeZETdJm8FSjY6AtdlVuRB4ub2vlRPNVFpOffbTinCFDGpu8KdibSgS1YH6fxZeRg33e0lhHdjOruRIs7RUwyN9EPJs5KfdXspfFa%2F67ixrJQ5e1IeM71jMOG3%2Fs2KTkT14DeiNsGrtBcImbAvc0fMgFrHr5VP8WVUSOtyP30slY4BEwpTLoWjUl4WZ5Ovp%2BAJKQep6rtd6uLEGqF7s%2FNly6dZvGh0%2FpnUB7vmF9xtzEBBe%2F4M0kpxtZmGL9UBrzr8o0HW%2FH9jDSxt%2FOBjqkASG5RBmEUZQTfbi3%2Byc7BhugBk%2BXzohlcv3ZApoaGHLSrsaF6eV8NvmVEncVOImr%2F205LCF6QXJkJS7OYn8OhWtviXyeOSsnLPvszHTBk5vmF9wGcbzyJ5FxIPeblHMavxhfmdEPAuJv3ESuE0DazTcSxr98PmyAy%2BVLf%2FVTzdYpnxu7JQdDLa5hb1ofIQ8ngjbnEhZv9QQ5o7JjR9u8jzLWIGvl&X-Amz-Signature=ca6df7f22eaf11024dc1655464165bbfee8bb277a6e9b3f1df55535e10adbe5c&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

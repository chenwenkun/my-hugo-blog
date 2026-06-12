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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4662GOL5LBE%2F20260612%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260612T143234Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEE0aCXVzLXdlc3QtMiJHMEUCIQDpDo7mrXlFTMj3UVBBwq2F3jJHtuaHv1s7t5sTN1pf5gIgISzXlnIom8FHw60hR1cPmTpTYVS3GigTVZmPlgS79tgq%2FwMIFhAAGgw2Mzc0MjMxODM4MDUiDG%2BKGjoIR8Ihyk9ACSrcA87MSh1yESPrYPYxcvjf3h9BvnV%2Fmmd3IdHB1lRsKyLetmBj7sgKYbF4smgHxx5ZX0y67NP7hovxU2wmXqnM28XyokafVzmxjpgDf6kiDnRLKqnGHycmiDbLuGF1UoOhTTAEOylMPrlMBWho4bG%2B2kBW1g09mBKxq8kiQ5JupB4fVPIFmJYxXQMYFKqTbGRR0IdeypxpOVGvYtrJz76tKdxoxIM2YtbvCVp65zbLG6PaBbi4sGMUVmFBIDQ2a0NJWMfGhngxK1qEygS0nhIdb5dMxrW2uJNaum4EA7vapXIfT5J1b%2FfaTnCzcpSleCeVOWbwnfZ3uVjdGx5WrptALsg82r%2F5cif4Ssx1L2BLWmfX296RW4sZeqlZhEY7hW8IxywdOyRU9PMFLJu%2BBTdJ853Uh%2BuZOg%2F894N0ZR0tCVZAdde5%2Fm2SFCGUizba7vex2b74OkrSDlM3BB0S0SkhXdCJM4QTYjpv18pEz6v24%2FG9b6tvoeS1gJ0x7QLga6tEFAgs9iIq%2FOfDOGPmZa%2FGtt96vFgaZ%2FGmD94N7huA9SC4lG5RyDkU%2FqaopR7STEOvaCLu57HtPYyFd1izsqxxu0%2B6OFM29ykl2ydzZpU1zKQR3X8dur1ri1CNinhAMNmLsNEGOqUBWZj88Ms7b6yrKXyl4tg8kSBLlG4Mi18uAKdHsvNBczzZlzGLdmQUCHxJkteSA7%2FumSgfUt9XQWgIvhEJjH0EIOzEbviTg1JV3hkaoksk2X7tRpPEXLVmGa%2FcT8jua%2B%2BEHixuNVlcEeXK6Y9RWe14d4J8nxy3n9ZkqZggjXdbYofj2ZMhAoxtboAUw3CCAFR0Y%2BR1pMC9vUyBHVCXsC%2BginSrfIXW&X-Amz-Signature=88f59e3aa4a953c0f9523bcb4456a3e3de0efc2cd0ef515ac755a4e3bc7a6748&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4662GOL5LBE%2F20260612%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260612T143234Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEE0aCXVzLXdlc3QtMiJHMEUCIQDpDo7mrXlFTMj3UVBBwq2F3jJHtuaHv1s7t5sTN1pf5gIgISzXlnIom8FHw60hR1cPmTpTYVS3GigTVZmPlgS79tgq%2FwMIFhAAGgw2Mzc0MjMxODM4MDUiDG%2BKGjoIR8Ihyk9ACSrcA87MSh1yESPrYPYxcvjf3h9BvnV%2Fmmd3IdHB1lRsKyLetmBj7sgKYbF4smgHxx5ZX0y67NP7hovxU2wmXqnM28XyokafVzmxjpgDf6kiDnRLKqnGHycmiDbLuGF1UoOhTTAEOylMPrlMBWho4bG%2B2kBW1g09mBKxq8kiQ5JupB4fVPIFmJYxXQMYFKqTbGRR0IdeypxpOVGvYtrJz76tKdxoxIM2YtbvCVp65zbLG6PaBbi4sGMUVmFBIDQ2a0NJWMfGhngxK1qEygS0nhIdb5dMxrW2uJNaum4EA7vapXIfT5J1b%2FfaTnCzcpSleCeVOWbwnfZ3uVjdGx5WrptALsg82r%2F5cif4Ssx1L2BLWmfX296RW4sZeqlZhEY7hW8IxywdOyRU9PMFLJu%2BBTdJ853Uh%2BuZOg%2F894N0ZR0tCVZAdde5%2Fm2SFCGUizba7vex2b74OkrSDlM3BB0S0SkhXdCJM4QTYjpv18pEz6v24%2FG9b6tvoeS1gJ0x7QLga6tEFAgs9iIq%2FOfDOGPmZa%2FGtt96vFgaZ%2FGmD94N7huA9SC4lG5RyDkU%2FqaopR7STEOvaCLu57HtPYyFd1izsqxxu0%2B6OFM29ykl2ydzZpU1zKQR3X8dur1ri1CNinhAMNmLsNEGOqUBWZj88Ms7b6yrKXyl4tg8kSBLlG4Mi18uAKdHsvNBczzZlzGLdmQUCHxJkteSA7%2FumSgfUt9XQWgIvhEJjH0EIOzEbviTg1JV3hkaoksk2X7tRpPEXLVmGa%2FcT8jua%2B%2BEHixuNVlcEeXK6Y9RWe14d4J8nxy3n9ZkqZggjXdbYofj2ZMhAoxtboAUw3CCAFR0Y%2BR1pMC9vUyBHVCXsC%2BginSrfIXW&X-Amz-Signature=17fdb0ebff8fe918c22ecf13ee4ec72b5b2b7396a77546a0b596cae5cccd13a5&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

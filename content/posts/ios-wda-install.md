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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466THXM6ZZA%2F20250928%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20250928T181306Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEDoaCXVzLXdlc3QtMiJHMEUCIHoulPr2bgMEzZZf0gBINqwByjQsjFBfq9y6m29pyuyMAiEA8hj1c%2BotS2nRyFi758wXjvGkTv5jreN3fQz%2BOykZRZgqiAQIw%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDNSDwmF%2Bq1Z9tULRfircAzhLE1DOe4htQJkLdJxpxmeARlCIBBacofJZvZvjOBCSiM8cUx1WyeYZYYGZCWVsos03BfkbDKZK2bB89DzO96ICH9OHzCUtWsQYzWDRq4YBs3U%2FKjYjZLp4QO9eDQYd%2BHmlfj3T%2BJfuecd3%2BKRSWFEDIFjJqMEeD8doHePg5xKFg0u2oJnyHHRHAJH6O0zI4NkLEeOUSRBYkxyhM0Z6BaFifCuBZ4c2En9GL4vjpwg86MTcVMBaWOENqVLVT6aCtvqus%2FG6h1FEI%2Br5naPpwOUS2yO%2F%2BzwNjRxHk5pIjGTXhLVg87JQ%2FFCzBDCdhufq6wEs%2BWnBRrD3Cxx8gS1DIy%2BP6r%2Fs3Bv2FTvGunzJ3w%2FrF%2BxcKJBOEVgSTIjmtl%2FCYWQl1iQZCJ5nuHLDNDlLon3TlhMDmPeBkeLkgdD7y9wW32g0U9LSOn1cwaAseePhWYyL57VOYxvWy4u7g0x8uzHuGLwwu7pRvaqSML9ZtdGhH3kzpmenu10O%2BtzinYJ%2Br9ktomKoqvaeObVkQBQnX8LAMNIDFNphquqA57zX%2Fq%2BpsqAVbnVF7rW7ffG1IeIQOefU77KCJCHayacde4PtQN1put%2BIncCTL4%2FL7b4gXPycMhraBX9uHKDMWHwYMPjt5cYGOqUBHgdhOTn9TnSHCBJmdXw%2BQoMrwNfqJWtRdno5m3PUmUz42l3C%2FV6HzUJQzkrMWr%2BZ%2FIEw2L81Jm7za9%2Bvu29lwgBZkiY5NeqIFDGgx9vLcZktBFMhXz1U1ychG55sip9hrx6yMWEM%2FFqKS89u2ToAAqB9%2FxbAbQhm8GvlXHOvHQ6DzZfXRkrwHW6UsAXUO0xS6h7cG9oSihpdM9SrUyXPeNpFYGE1&X-Amz-Signature=10363efd336d2c5467dc43bad46d0ba200f9b7b59889a7c0dc62d99ecdce1ec5&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466THXM6ZZA%2F20250928%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20250928T181306Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEDoaCXVzLXdlc3QtMiJHMEUCIHoulPr2bgMEzZZf0gBINqwByjQsjFBfq9y6m29pyuyMAiEA8hj1c%2BotS2nRyFi758wXjvGkTv5jreN3fQz%2BOykZRZgqiAQIw%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDNSDwmF%2Bq1Z9tULRfircAzhLE1DOe4htQJkLdJxpxmeARlCIBBacofJZvZvjOBCSiM8cUx1WyeYZYYGZCWVsos03BfkbDKZK2bB89DzO96ICH9OHzCUtWsQYzWDRq4YBs3U%2FKjYjZLp4QO9eDQYd%2BHmlfj3T%2BJfuecd3%2BKRSWFEDIFjJqMEeD8doHePg5xKFg0u2oJnyHHRHAJH6O0zI4NkLEeOUSRBYkxyhM0Z6BaFifCuBZ4c2En9GL4vjpwg86MTcVMBaWOENqVLVT6aCtvqus%2FG6h1FEI%2Br5naPpwOUS2yO%2F%2BzwNjRxHk5pIjGTXhLVg87JQ%2FFCzBDCdhufq6wEs%2BWnBRrD3Cxx8gS1DIy%2BP6r%2Fs3Bv2FTvGunzJ3w%2FrF%2BxcKJBOEVgSTIjmtl%2FCYWQl1iQZCJ5nuHLDNDlLon3TlhMDmPeBkeLkgdD7y9wW32g0U9LSOn1cwaAseePhWYyL57VOYxvWy4u7g0x8uzHuGLwwu7pRvaqSML9ZtdGhH3kzpmenu10O%2BtzinYJ%2Br9ktomKoqvaeObVkQBQnX8LAMNIDFNphquqA57zX%2Fq%2BpsqAVbnVF7rW7ffG1IeIQOefU77KCJCHayacde4PtQN1put%2BIncCTL4%2FL7b4gXPycMhraBX9uHKDMWHwYMPjt5cYGOqUBHgdhOTn9TnSHCBJmdXw%2BQoMrwNfqJWtRdno5m3PUmUz42l3C%2FV6HzUJQzkrMWr%2BZ%2FIEw2L81Jm7za9%2Bvu29lwgBZkiY5NeqIFDGgx9vLcZktBFMhXz1U1ychG55sip9hrx6yMWEM%2FFqKS89u2ToAAqB9%2FxbAbQhm8GvlXHOvHQ6DzZfXRkrwHW6UsAXUO0xS6h7cG9oSihpdM9SrUyXPeNpFYGE1&X-Amz-Signature=087e724da030a1a8e04c8b38fd494c917dd89e04d665504531144d017296c0d0&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

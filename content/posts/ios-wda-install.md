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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466SLBYLGH3%2F20260516%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260516T184854Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEMr%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQDbS9Xl6t75w%2Bf8%2BtJYavpMLgq9NjpCC2uAtXGdtLrk1QIhAMacypB0Xv3dufP7eXYFxsy6UL3Moz7YV3J%2FdudfLmBiKogECJP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgxrShFESU1VqGKjwc8q3AM6ei89cWsNUw16aFG47OPQ9wzTnewBydYc7h%2BMBqijF8oh3FdqkO4CwkoJIObSqqeKbkNO%2FYAycF1Nd5zOD1a%2FT%2Fa2b220nce3K9OJW7GHa6z6JcshtQFA%2BF38allPPDvrz1kmwcJU18uZ6JjAEX6WWrY1PTCwazjZXXmByoV6rgilJ3Xyp277NDvp0nVFjZRiWCU8CPAETe%2FGb4zS4Lkj5HXm9wOyjW7k7g6ZfvvPgYt1fALqU%2BfiTtzvibPdjZbr4SnCytjqXfrfqIe3w%2FLIPMgBuKh9RoQgCtKezpmvm24ZrfvKv6N%2B4DGYa0%2FJ7Zw2TdazASOaaHFJXIVcY3eyn%2Fc3NLOXPrqNo%2B%2FjgCOoJZk3DEFaYg0jPtfhK4QyNG6S%2FhETL2d7wDZiiHoV%2BuOaCOGcglF4jA%2BssQhKsfPlf%2FVrFFJUBZ7LBqtYVYrf2pZlcYl2erKUEqxMFe0ADMSJ0Kj7OcF%2F9KsEiq77AlanUIETq%2BTqagDd88PZHmW077BswNd%2Ff%2BXdSAFZ509Wpohb5Zy09hERNNIji9qaZ5%2BuOT5EwCFUZ2%2FeuVHPrO9CEcx3JIvAj5MjQu3CInzag%2BZ6ttbmenxklpJr4TMlkZK3ctx8r5DPJ8OPK46tljDu36LQBjqkAdGDVcBCAI%2BassUncnx5IH%2Fl5%2B5JMaEilF5BDVo052Xi8tu%2BcUFEvmQaU4ABjp%2FhujqnwxBQNrKBZxZMahc%2FYmjwcD1S8acI26yzrzZF7sopvxqjc%2FVpEl78pnp0LYXwZlDuQPwcZru0ctYmJfjiuCcvDzIcoLDCYetdcg5OPNG52tqD4QL1yQVWlnuMPiHb2h1jRIXy0QRyizNLRIxRkpjkjiRo&X-Amz-Signature=e40e7bc388524452cd16c102ec83ff8e9876202b25087a2274fa9b68837e6d71&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466SLBYLGH3%2F20260516%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260516T184854Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEMr%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQDbS9Xl6t75w%2Bf8%2BtJYavpMLgq9NjpCC2uAtXGdtLrk1QIhAMacypB0Xv3dufP7eXYFxsy6UL3Moz7YV3J%2FdudfLmBiKogECJP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgxrShFESU1VqGKjwc8q3AM6ei89cWsNUw16aFG47OPQ9wzTnewBydYc7h%2BMBqijF8oh3FdqkO4CwkoJIObSqqeKbkNO%2FYAycF1Nd5zOD1a%2FT%2Fa2b220nce3K9OJW7GHa6z6JcshtQFA%2BF38allPPDvrz1kmwcJU18uZ6JjAEX6WWrY1PTCwazjZXXmByoV6rgilJ3Xyp277NDvp0nVFjZRiWCU8CPAETe%2FGb4zS4Lkj5HXm9wOyjW7k7g6ZfvvPgYt1fALqU%2BfiTtzvibPdjZbr4SnCytjqXfrfqIe3w%2FLIPMgBuKh9RoQgCtKezpmvm24ZrfvKv6N%2B4DGYa0%2FJ7Zw2TdazASOaaHFJXIVcY3eyn%2Fc3NLOXPrqNo%2B%2FjgCOoJZk3DEFaYg0jPtfhK4QyNG6S%2FhETL2d7wDZiiHoV%2BuOaCOGcglF4jA%2BssQhKsfPlf%2FVrFFJUBZ7LBqtYVYrf2pZlcYl2erKUEqxMFe0ADMSJ0Kj7OcF%2F9KsEiq77AlanUIETq%2BTqagDd88PZHmW077BswNd%2Ff%2BXdSAFZ509Wpohb5Zy09hERNNIji9qaZ5%2BuOT5EwCFUZ2%2FeuVHPrO9CEcx3JIvAj5MjQu3CInzag%2BZ6ttbmenxklpJr4TMlkZK3ctx8r5DPJ8OPK46tljDu36LQBjqkAdGDVcBCAI%2BassUncnx5IH%2Fl5%2B5JMaEilF5BDVo052Xi8tu%2BcUFEvmQaU4ABjp%2FhujqnwxBQNrKBZxZMahc%2FYmjwcD1S8acI26yzrzZF7sopvxqjc%2FVpEl78pnp0LYXwZlDuQPwcZru0ctYmJfjiuCcvDzIcoLDCYetdcg5OPNG52tqD4QL1yQVWlnuMPiHb2h1jRIXy0QRyizNLRIxRkpjkjiRo&X-Amz-Signature=6cfa780dd3ca6e9f5df8b1bc99d333c71324a5e2af99a65b2bd0333db6fe6bd2&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

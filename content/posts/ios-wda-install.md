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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466765SE2M7%2F20260331%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260331T012008Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEGkaCXVzLXdlc3QtMiJHMEUCIEPsRyOMBPWe9xnE0RUi%2Fbsm7jUBWEa75cdCIslY7KM4AiEA9Tx2%2Ftto9fZ3SdPFSfuW8YmEAxG2mGhLGsa%2FAZbBl8oq%2FwMIMhAAGgw2Mzc0MjMxODM4MDUiDCCpBJ1XeOE48lOqYyrcAxbV0RiqCffytcWduaJy8GzwwoyYdSfszBemusE%2FdjIHOWARytN9vvYyfj%2FMgYCSbgAO96DljXC6KhIXCdFtsFFyL%2Ftgzscfwv9qvdPeYvlUQP3uGhNGISmX4J0PxWn1hb4LdzKrExyBAIWBIS8NqafyW3fRBIrS5pWzpIBXuGKL2PhTO8qqx8Jl7oj7wr2FdzHWrkfVitmdiReWYEAECSxnCrpL%2Bsz4oKMmYQhSHMkLbsK1qllCceH4YeTORh3eWjFEL%2BiseUioqxYjZK91aWFcN4gAA2C4rU%2Fz1AWt4DdJl2GxjDudwRRXdaO69URiWxHsRYyN7UET51wEooSmmPeMNqQRmIcaICkkTwP%2Bgy3Qh9p6bvQL3BXiPqkE8BbjiKM8nKMUL90yeI83oMrK3447Ycer3DJ%2FdiNnFQDUpEdKoN5qRASQRHBDLTz9%2BhLHra2PII72Hc4YTA1ItKz5QT7sxKe18EaV101OGr8MhItuFxdF8RrqeIdMIrvu3%2BY8onSoRl9Y3Q8NXOmoEU6Q%2FTUGLH1URoJ6xVigF7nIwJXzEupDc4DLQYHapYPcGYKi1fTS5psZKJHDKuSbR71qHxPQ1QdhJ5bPIn0yzcDoCQk%2B5u5K%2FuWwdtcDNqosMOG6rM4GOqUB%2Fb6HzZvdd%2Bzm0fS1gHLWvnEYJk4DK9xVgnrkCxI5g7p7xqa484Zfojh0f%2BFaJ8DFGrMFFaozfOcIZWlh1pblmF8%2BinrLNtrKKpMcu4A1NiUO9qy3V1XOah6zEI3EJ%2B7wHOqFfhN8y9ojCmcarqfwgTg98iVhmVYSzMyW5wm%2FKLaoPvDVg9kxCcdJjYDXGvLIX5%2F2lQuVp8tc8VeLsE%2BFUnvj7k%2FH&X-Amz-Signature=902cc21eff747455ac21bd2820bec2d614286b9d1c7f19d0bd0c7f2c9736cdcf&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466765SE2M7%2F20260331%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260331T012008Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEGkaCXVzLXdlc3QtMiJHMEUCIEPsRyOMBPWe9xnE0RUi%2Fbsm7jUBWEa75cdCIslY7KM4AiEA9Tx2%2Ftto9fZ3SdPFSfuW8YmEAxG2mGhLGsa%2FAZbBl8oq%2FwMIMhAAGgw2Mzc0MjMxODM4MDUiDCCpBJ1XeOE48lOqYyrcAxbV0RiqCffytcWduaJy8GzwwoyYdSfszBemusE%2FdjIHOWARytN9vvYyfj%2FMgYCSbgAO96DljXC6KhIXCdFtsFFyL%2Ftgzscfwv9qvdPeYvlUQP3uGhNGISmX4J0PxWn1hb4LdzKrExyBAIWBIS8NqafyW3fRBIrS5pWzpIBXuGKL2PhTO8qqx8Jl7oj7wr2FdzHWrkfVitmdiReWYEAECSxnCrpL%2Bsz4oKMmYQhSHMkLbsK1qllCceH4YeTORh3eWjFEL%2BiseUioqxYjZK91aWFcN4gAA2C4rU%2Fz1AWt4DdJl2GxjDudwRRXdaO69URiWxHsRYyN7UET51wEooSmmPeMNqQRmIcaICkkTwP%2Bgy3Qh9p6bvQL3BXiPqkE8BbjiKM8nKMUL90yeI83oMrK3447Ycer3DJ%2FdiNnFQDUpEdKoN5qRASQRHBDLTz9%2BhLHra2PII72Hc4YTA1ItKz5QT7sxKe18EaV101OGr8MhItuFxdF8RrqeIdMIrvu3%2BY8onSoRl9Y3Q8NXOmoEU6Q%2FTUGLH1URoJ6xVigF7nIwJXzEupDc4DLQYHapYPcGYKi1fTS5psZKJHDKuSbR71qHxPQ1QdhJ5bPIn0yzcDoCQk%2B5u5K%2FuWwdtcDNqosMOG6rM4GOqUB%2Fb6HzZvdd%2Bzm0fS1gHLWvnEYJk4DK9xVgnrkCxI5g7p7xqa484Zfojh0f%2BFaJ8DFGrMFFaozfOcIZWlh1pblmF8%2BinrLNtrKKpMcu4A1NiUO9qy3V1XOah6zEI3EJ%2B7wHOqFfhN8y9ojCmcarqfwgTg98iVhmVYSzMyW5wm%2FKLaoPvDVg9kxCcdJjYDXGvLIX5%2F2lQuVp8tc8VeLsE%2BFUnvj7k%2FH&X-Amz-Signature=905663341ea30059a615cbb1b6fe9e4d7883837bd4d168d7110a1d95124fe327&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

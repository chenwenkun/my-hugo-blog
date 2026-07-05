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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466TSJDPVS4%2F20260705%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260705T130556Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEHUaCXVzLXdlc3QtMiJIMEYCIQDLKgF3aJuDqk4HjYa5Wi82%2BZERjqn%2F6T6A6uC0DI60SwIhAOHvTZOK6439Fdbs6C%2B6PCqp6RQ103pJV1NXJxt%2B1qFQKv8DCD4QABoMNjM3NDIzMTgzODA1IgyWEOdNFTLryM7XIOgq3ANLoSxKFSzrLib2V11%2Fi8VhXB02Qquc5eZe9Pu9rNc1cFdVtiZv0wDlk9D3pLb8H14ZCm3OdPc31zHqPAKT2785yTrBGwsiiKRHZlnGdLvlndEo1XtRRaCivTO56BA9Ij8ySfX5JAZsO5hrzfa3a2wgZ%2FlppFIfT6K2V5M69gjW9I1BGRSUUrq6fvDdQ6PYa5v0B5t9Ds%2Brpf6RXL357PCN91%2FXJ%2FvqI8Fa2AIK%2FJFR1AVe9ww0iJH0zuxh0WFw1x3PGO8PUtGofKHQPqun56z7EAWeeWS8%2F7YG5kBwjmiMLREEpZjfI1dt00heC7Nyzz%2FNIHDUmPgl7GhjXAigDi6Cwd%2BH6s65KnUuZZR3wNyZPsHmb2mo5WI03nM8YJSmMoDfknhtWcMYV3Qmc1sGQ5767R2OE9BXadunQDp%2Bi6tf7YjQmjCmDNLuxiB8YxbVtzfygu3bD2BFIafTCgzOXNSFa1Qxs25IIxSfNFhGEo8romTk4nANVs5Qns%2BVJQuxWe6SaxPpu7HQ2LsiBmwi10tb5go1GwBmw6B1s0RANb5jMAnkDqz0oHHwle5HP4e71fS7wAJUxk5yR0BkaQ%2FybqVEuPlvQHuOOs2tcZb9D%2B%2B9KlQqJHkwoVHlFzssNTCToKnSBjqkAUM9vVYFQ5rHAY0S12IDnBnya47IJdtx5VFKMDHTArZBAHnIQoV7M7f8oHMLLF%2FR0%2B%2Fe24C%2FR%2F2lU1xWL5mMUGVJeVwBS8H8gHA59laxc29DsJUIeoebbD%2FDBMERNTg8B9EtkIXFaAHFGKtdsc68qjhq3D1DuVSEmkb0fnfmsDdoALELmRa48v63HB0nm4DFLKuhgj6OvU86qZPDxnNeAOMxg%2Bh0&X-Amz-Signature=6e2ce02cb0e49c228e7f1dfe2deffc0c4c15378563ca3c2a64c434c44739a23d&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466TSJDPVS4%2F20260705%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260705T130556Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEHUaCXVzLXdlc3QtMiJIMEYCIQDLKgF3aJuDqk4HjYa5Wi82%2BZERjqn%2F6T6A6uC0DI60SwIhAOHvTZOK6439Fdbs6C%2B6PCqp6RQ103pJV1NXJxt%2B1qFQKv8DCD4QABoMNjM3NDIzMTgzODA1IgyWEOdNFTLryM7XIOgq3ANLoSxKFSzrLib2V11%2Fi8VhXB02Qquc5eZe9Pu9rNc1cFdVtiZv0wDlk9D3pLb8H14ZCm3OdPc31zHqPAKT2785yTrBGwsiiKRHZlnGdLvlndEo1XtRRaCivTO56BA9Ij8ySfX5JAZsO5hrzfa3a2wgZ%2FlppFIfT6K2V5M69gjW9I1BGRSUUrq6fvDdQ6PYa5v0B5t9Ds%2Brpf6RXL357PCN91%2FXJ%2FvqI8Fa2AIK%2FJFR1AVe9ww0iJH0zuxh0WFw1x3PGO8PUtGofKHQPqun56z7EAWeeWS8%2F7YG5kBwjmiMLREEpZjfI1dt00heC7Nyzz%2FNIHDUmPgl7GhjXAigDi6Cwd%2BH6s65KnUuZZR3wNyZPsHmb2mo5WI03nM8YJSmMoDfknhtWcMYV3Qmc1sGQ5767R2OE9BXadunQDp%2Bi6tf7YjQmjCmDNLuxiB8YxbVtzfygu3bD2BFIafTCgzOXNSFa1Qxs25IIxSfNFhGEo8romTk4nANVs5Qns%2BVJQuxWe6SaxPpu7HQ2LsiBmwi10tb5go1GwBmw6B1s0RANb5jMAnkDqz0oHHwle5HP4e71fS7wAJUxk5yR0BkaQ%2FybqVEuPlvQHuOOs2tcZb9D%2B%2B9KlQqJHkwoVHlFzssNTCToKnSBjqkAUM9vVYFQ5rHAY0S12IDnBnya47IJdtx5VFKMDHTArZBAHnIQoV7M7f8oHMLLF%2FR0%2B%2Fe24C%2FR%2F2lU1xWL5mMUGVJeVwBS8H8gHA59laxc29DsJUIeoebbD%2FDBMERNTg8B9EtkIXFaAHFGKtdsc68qjhq3D1DuVSEmkb0fnfmsDdoALELmRa48v63HB0nm4DFLKuhgj6OvU86qZPDxnNeAOMxg%2Bh0&X-Amz-Signature=5ba8e47cfc709af04abb13ebe387b43ad1ff64c686f1b898bae22f261128a1df&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

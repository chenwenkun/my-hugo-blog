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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466WZGJALQU%2F20260223%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260223T123840Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEBQaCXVzLXdlc3QtMiJIMEYCIQCW2ERPHHeiIoBujmBtilbg9nmJX3j1DuNTd%2BhcwSKpXgIhAPurHAOXDnp32urQGDsoil1BcsgT%2FXq6sMZpWh6p8GleKogECN3%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1Igy0Ml3bCHuZnNKt40kq3AM2hs4ZZx%2Foq5dvf69Kqzi2yVU0GmJwRn%2F9IKYu39FWbwoO4t2rW6dBN1JN6s1zZih7TYOsBiO1vicHzuk4wOPBsIX1DW1XMN99X4voMZFdmJmLw%2Fsu0YHsZ35h%2FasqLaD6sqLd2dXnWWppRvPJ8ZjHukXOHme7m85coKlxzSaDY71l6pTF80WvrL2faZ8Siwh5DHIlQeLgxuYOuE7E87tW1CKDF2lAlRKWsHbSUJuzlGtdT462qmDZOw3QXYgEVtKlll0JimwgYPUhv9iuXNnA%2F6m6zlddu8cyXjh6Hmpq13Zl46iDLLuec7Ei1jvl3%2BDgkPkvaclGfo5tIKSe5v3c%2BGvl9OnX5fBngBx%2BJlRFcGoEOz3DV2F9Kx7981BdM25NnfUS8ZiYb2s0LC7zKMX7d4cRarDy0MJfBVH1OcmbjU0NxHCPXRvV7sh4gsXgg6N2Mq%2FZ3zY65VJdPlOZQnwCgmGc3MGheLZqxK5C2qQAqpPp8Pu7%2BozFMEtU7l9ML%2BEBHq40yV8XkXj4xYVLmqFS6Wf2rfqkFyzb4wgzyu9oUA8yjo%2FBjwEk%2Be1ID%2BeYhdJLlwbhWXJq7XVejRBUn%2FtKDFfX1jqlAHlTxmXwRMYXN%2Faw8rNMvRb8byN%2BGjCE%2FvDMBjqkAU2T2%2F%2F4UwfO37xdAAvUmU%2FBEaPonA8VubaRq2xJsF9JPKmmsSUS0rOLclmNxUQBmhpaSx6E0LPfvsf8smL2T%2F7d9wqaJSpZp2gbnhGaI5g3r%2BRh5GtUn1dQTjXX0t7%2BxU%2FyX3zaMlfIWVaszIGYlkn92TCUV71riuqtAWb1guksUc5hpPWDUB%2FDbHlueYhzE5xqP9ClnRDAKqPkOUqXl5SPT60g&X-Amz-Signature=3e9e293f0d135b4088e2ab1d9c4aaf7dac5c6490d7c6cc9caf4fff7de83deebb&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466WZGJALQU%2F20260223%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260223T123840Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEBQaCXVzLXdlc3QtMiJIMEYCIQCW2ERPHHeiIoBujmBtilbg9nmJX3j1DuNTd%2BhcwSKpXgIhAPurHAOXDnp32urQGDsoil1BcsgT%2FXq6sMZpWh6p8GleKogECN3%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1Igy0Ml3bCHuZnNKt40kq3AM2hs4ZZx%2Foq5dvf69Kqzi2yVU0GmJwRn%2F9IKYu39FWbwoO4t2rW6dBN1JN6s1zZih7TYOsBiO1vicHzuk4wOPBsIX1DW1XMN99X4voMZFdmJmLw%2Fsu0YHsZ35h%2FasqLaD6sqLd2dXnWWppRvPJ8ZjHukXOHme7m85coKlxzSaDY71l6pTF80WvrL2faZ8Siwh5DHIlQeLgxuYOuE7E87tW1CKDF2lAlRKWsHbSUJuzlGtdT462qmDZOw3QXYgEVtKlll0JimwgYPUhv9iuXNnA%2F6m6zlddu8cyXjh6Hmpq13Zl46iDLLuec7Ei1jvl3%2BDgkPkvaclGfo5tIKSe5v3c%2BGvl9OnX5fBngBx%2BJlRFcGoEOz3DV2F9Kx7981BdM25NnfUS8ZiYb2s0LC7zKMX7d4cRarDy0MJfBVH1OcmbjU0NxHCPXRvV7sh4gsXgg6N2Mq%2FZ3zY65VJdPlOZQnwCgmGc3MGheLZqxK5C2qQAqpPp8Pu7%2BozFMEtU7l9ML%2BEBHq40yV8XkXj4xYVLmqFS6Wf2rfqkFyzb4wgzyu9oUA8yjo%2FBjwEk%2Be1ID%2BeYhdJLlwbhWXJq7XVejRBUn%2FtKDFfX1jqlAHlTxmXwRMYXN%2Faw8rNMvRb8byN%2BGjCE%2FvDMBjqkAU2T2%2F%2F4UwfO37xdAAvUmU%2FBEaPonA8VubaRq2xJsF9JPKmmsSUS0rOLclmNxUQBmhpaSx6E0LPfvsf8smL2T%2F7d9wqaJSpZp2gbnhGaI5g3r%2BRh5GtUn1dQTjXX0t7%2BxU%2FyX3zaMlfIWVaszIGYlkn92TCUV71riuqtAWb1guksUc5hpPWDUB%2FDbHlueYhzE5xqP9ClnRDAKqPkOUqXl5SPT60g&X-Amz-Signature=632564f8279888b3a91413f8a53d5babf5d8410edef8d5c81d9764e8b0147ea1&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

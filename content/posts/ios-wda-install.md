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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4666JIPR674%2F20251203%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251203T061854Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEF4aCXVzLXdlc3QtMiJHMEUCIQD4RPTmFEgWmJ2phDImoq%2F4JZN6TMCYdiyYvshihF%2BsuQIgUBrzidWHd5iYrljSUMWZdGi5BCxIZohfhlJofUS4slIq%2FwMIJxAAGgw2Mzc0MjMxODM4MDUiDMdXJGlSUuVFSUAn9yrcA1DlBKrDzI2pBHicEVBlHVB%2FrIEVuPACzRMeMF0FTyxXh8n3IobKeqG%2BbR46QU785ZniNBrXubKvsb5KfNZrlZO56oY4qtsxixtT7bNKu8QUg7HFSueeIjm4rZjiIa6P7KvdTGAwbvYTqbPxpg68Yvwc6mka985rCzLmRYRTYziG2PbYM86vGhFRFmxho%2BqoxigtY7r4w3SVqEyGM7ZaDNfDJxz6jZpdjQA%2Bf2NMGRHP7PHP9fkpONulTN%2BtWTXrXTeeMol7Dw4RG72id2R2pQmHC%2BTmG41v9IDp%2B3O8gR5t1%2FnN7WF3ESsGM9H6naF2tFPkqnB97O4GYFSvdz6FJLDxVOxp7ytbEciK3SrHNS5UKwdDdEaHi%2F45tUPUwe81LhFdZE7vPZ0%2FaI376M1DK9WvItlSdX0q0q78GFvBbB7wIogAZhPyfWAPBrYR6RWOcqHCQuCONfEMVArnejapu2B%2FPn9s8hUB5zHpmfQgOZzwZF9kQIGLkVttloOxqgmtBbioGxQPrDn0VnSV1vHWIh4KPxukIQSXsjPY%2BzPYuNbuSgl8cEdUq9XIxbFbTXBQr5QGli9RHdwCXwHJT5uZUf6BNSzxliHpMje4attZK47IDYo6%2BMVVL3WFAc9fMJqav8kGOqUBhGikmkfQ31roPaQsYIow4LUSXLZalGLagNptv%2FZV%2FfDzgDJrItvQyHITi5K5Y6dN8uti3CDD4MkTEetar3mkLyDbynaH%2Bv9c1i5JddyfyTypr3%2BzR%2F4s1LxWXYdkmoqzCTBMM1RNcKn6WaIbk0ebfRmovAw3Hh47vnHNv3Q%2BUib1wvoDpYXRvBsM2mjiHqpUMfVMrkiysPh68qD1rQUmBnbSffx0&X-Amz-Signature=82ad584635a09c9167131d4dfdbf8e019e51898b7bde4ee5d32df52b187fa7f0&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4666JIPR674%2F20251203%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251203T061854Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEF4aCXVzLXdlc3QtMiJHMEUCIQD4RPTmFEgWmJ2phDImoq%2F4JZN6TMCYdiyYvshihF%2BsuQIgUBrzidWHd5iYrljSUMWZdGi5BCxIZohfhlJofUS4slIq%2FwMIJxAAGgw2Mzc0MjMxODM4MDUiDMdXJGlSUuVFSUAn9yrcA1DlBKrDzI2pBHicEVBlHVB%2FrIEVuPACzRMeMF0FTyxXh8n3IobKeqG%2BbR46QU785ZniNBrXubKvsb5KfNZrlZO56oY4qtsxixtT7bNKu8QUg7HFSueeIjm4rZjiIa6P7KvdTGAwbvYTqbPxpg68Yvwc6mka985rCzLmRYRTYziG2PbYM86vGhFRFmxho%2BqoxigtY7r4w3SVqEyGM7ZaDNfDJxz6jZpdjQA%2Bf2NMGRHP7PHP9fkpONulTN%2BtWTXrXTeeMol7Dw4RG72id2R2pQmHC%2BTmG41v9IDp%2B3O8gR5t1%2FnN7WF3ESsGM9H6naF2tFPkqnB97O4GYFSvdz6FJLDxVOxp7ytbEciK3SrHNS5UKwdDdEaHi%2F45tUPUwe81LhFdZE7vPZ0%2FaI376M1DK9WvItlSdX0q0q78GFvBbB7wIogAZhPyfWAPBrYR6RWOcqHCQuCONfEMVArnejapu2B%2FPn9s8hUB5zHpmfQgOZzwZF9kQIGLkVttloOxqgmtBbioGxQPrDn0VnSV1vHWIh4KPxukIQSXsjPY%2BzPYuNbuSgl8cEdUq9XIxbFbTXBQr5QGli9RHdwCXwHJT5uZUf6BNSzxliHpMje4attZK47IDYo6%2BMVVL3WFAc9fMJqav8kGOqUBhGikmkfQ31roPaQsYIow4LUSXLZalGLagNptv%2FZV%2FfDzgDJrItvQyHITi5K5Y6dN8uti3CDD4MkTEetar3mkLyDbynaH%2Bv9c1i5JddyfyTypr3%2BzR%2F4s1LxWXYdkmoqzCTBMM1RNcKn6WaIbk0ebfRmovAw3Hh47vnHNv3Q%2BUib1wvoDpYXRvBsM2mjiHqpUMfVMrkiysPh68qD1rQUmBnbSffx0&X-Amz-Signature=f45adec04e7dcda1aaeffda08c7df702b33200549a40873b9c43027cfec7c937&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

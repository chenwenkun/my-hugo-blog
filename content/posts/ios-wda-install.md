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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466U7QFBWBQ%2F20260712%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260712T125416Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEBwaCXVzLXdlc3QtMiJGMEQCIEQM0%2B9PG9j7wB%2BHHO73jBdfjuNTDMOWucHnYqdOkcVfAiAtF5h5YjgqGbkAj9w7gs7A2IJThDevx7z6V3v4YJheVCqIBAjl%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIM9kEAenBtEE7DhdxmKtwD8%2FGuw8zSZKD6OjQ1zM11MCLm5wiPrUH%2F3PhgYlG%2FDmXSQjSl9pXNnO9N0c88EnY9qP2qY%2BakV8fL698Y4117CxpZrV%2BhpXOSvrKOhGzs1ECT3Zs7zecQqg31yMm8obZJ8%2BSlMCYY9%2BvhQpxiovw2I%2FmeOz8Cv5G3bRwimo6Bxs%2BDixBpm35Ja%2BMa0wrGqtbH0PF03jSdCSKgky9KCST20i4JRxo8tOefczFkO2xi3WKhaU8QQJmfii0FYp7%2Fl7I7md%2BOr0NN4N2a0quYCPKLZdiwMQMp%2F%2Bhb5Qk%2BDtEp5dICV5Jug7ZU143naIIziaEitshlvOfeEHkk5%2FWTllOoM%2F%2BrYnhXrOj2BKroUEsY%2FKOY6fsl48ya%2BSPbsfAypPp%2FYgF5Txx21HMMTNMlb1gdrC33cz0ZRiFHMIgY6S8fUhW7%2BF3mntchyCwXh5uWF%2F4ouPs%2FlAu788nHMjNra5amFYGtlw1N6a1TiCL%2F550TBigGLtSw6iYTywxTg0CaU2pPF1rh%2BW%2BfvtmmUZ5JhQAuFNd0vVT%2Fs4%2BNCPPF9EerCImM%2BYGiLuvbvvrzM5kEPQRoiFQZndL0biI5Rq9Qcb7YKWymSHmaVA8yGPE40OUHy4HAfyw%2F%2BaXQTBwbh%2BEw%2F%2F7N0gY6pgEsh9Rg7L1GfrJEi%2BZj%2F8A8h04szEM4LR3%2Baknj%2FXZfdLnhjvrBbjqc8sb2WzbdFGwkyu577s978rOG8vHnTCvKQ3AKctnQZglVJvgejUcuedxHzYdq%2BjRcRKYnLlHi%2BoWsTz9TUOCHK1PeFUkTMnCKZ9QrYFtKeM%2BcwMDGYkJdwDLPrNLtDjPoM%2BhaOERB%2B287RD7wCIDAHrDcTXAJ7XJz8u%2FUXCJM&X-Amz-Signature=c92df22bff77656d0f530ac8c77abfd4ac205187dc308aa0c14ba41379d13eb2&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466U7QFBWBQ%2F20260712%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260712T125416Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEBwaCXVzLXdlc3QtMiJGMEQCIEQM0%2B9PG9j7wB%2BHHO73jBdfjuNTDMOWucHnYqdOkcVfAiAtF5h5YjgqGbkAj9w7gs7A2IJThDevx7z6V3v4YJheVCqIBAjl%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIM9kEAenBtEE7DhdxmKtwD8%2FGuw8zSZKD6OjQ1zM11MCLm5wiPrUH%2F3PhgYlG%2FDmXSQjSl9pXNnO9N0c88EnY9qP2qY%2BakV8fL698Y4117CxpZrV%2BhpXOSvrKOhGzs1ECT3Zs7zecQqg31yMm8obZJ8%2BSlMCYY9%2BvhQpxiovw2I%2FmeOz8Cv5G3bRwimo6Bxs%2BDixBpm35Ja%2BMa0wrGqtbH0PF03jSdCSKgky9KCST20i4JRxo8tOefczFkO2xi3WKhaU8QQJmfii0FYp7%2Fl7I7md%2BOr0NN4N2a0quYCPKLZdiwMQMp%2F%2Bhb5Qk%2BDtEp5dICV5Jug7ZU143naIIziaEitshlvOfeEHkk5%2FWTllOoM%2F%2BrYnhXrOj2BKroUEsY%2FKOY6fsl48ya%2BSPbsfAypPp%2FYgF5Txx21HMMTNMlb1gdrC33cz0ZRiFHMIgY6S8fUhW7%2BF3mntchyCwXh5uWF%2F4ouPs%2FlAu788nHMjNra5amFYGtlw1N6a1TiCL%2F550TBigGLtSw6iYTywxTg0CaU2pPF1rh%2BW%2BfvtmmUZ5JhQAuFNd0vVT%2Fs4%2BNCPPF9EerCImM%2BYGiLuvbvvrzM5kEPQRoiFQZndL0biI5Rq9Qcb7YKWymSHmaVA8yGPE40OUHy4HAfyw%2F%2BaXQTBwbh%2BEw%2F%2F7N0gY6pgEsh9Rg7L1GfrJEi%2BZj%2F8A8h04szEM4LR3%2Baknj%2FXZfdLnhjvrBbjqc8sb2WzbdFGwkyu577s978rOG8vHnTCvKQ3AKctnQZglVJvgejUcuedxHzYdq%2BjRcRKYnLlHi%2BoWsTz9TUOCHK1PeFUkTMnCKZ9QrYFtKeM%2BcwMDGYkJdwDLPrNLtDjPoM%2BhaOERB%2B287RD7wCIDAHrDcTXAJ7XJz8u%2FUXCJM&X-Amz-Signature=5dbbb7caad30cdc18640a1a32828836b14fdb4b155232af1b72ce793154453c2&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

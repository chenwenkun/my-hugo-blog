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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4664NFT72RR%2F20260118%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260118T061814Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEKz%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQDfJuNcvhsPsVMEmMYVZ%2FHbvg%2BUlTtpOw2RLtv1X6NSUQIhAIQotbGgWx8ZA06vb3peQM%2FQVbJoTzzc%2Bf3JsBbCySCWKv8DCHUQABoMNjM3NDIzMTgzODA1IgyCmWkw3uB%2BGn%2BFAnMq3AMgJ3wRPhdLiUX3ie5vzmdf8vTOEnFVf%2FjPv3u3NKH5opBM5v8MQCs1AiFA72sHfagOzh1Ua8WUkIfijX3nbFXZB9P01aUUCmyKzdiEXhRZdxju0%2BhoZlI5j9GiElJG2yb6rBwGjOOyfw5gd%2FZBsGi9BVTmHl6%2FaZ%2B%2F517Wmvnm4VNE%2F7K5l0qRPL4xvhk2nwMgUTatgoejNnEpBXpX%2FijatFgzTRO3f10SAolxPG1%2BwY%2Bw7YGGFowKcS4x44tejRx6Vq1nvh%2BzT53geRRLX1qgkTWoNpc6go0FiPBIS45%2BSYG%2BR2QTT3PIbIoFr0DKR3DidQ0Nvi%2BkKxwWUxN88bSj5j%2FN0DJDo81jci5LIs6zm0PjVL%2BiBea3wLNGu8%2B%2FIECyA3GfNvq%2BopNuCLhnywiTxxtYe9zxe2kXKpnBQ5EBdrWtyKtQd01EO3dSdS9kIa6WfP4dPoAIp13EpeqhjzzxnkTOHX6PEaw9sSm0%2FaRd07I9bKelCa8etK%2BnUkJLFscn29kqlNwjOcwYyAhlyQSecD9ptADpd%2BAumZv2TX9dcf%2B0FHmUk3O58QsQ6hMpO1T4XQFOzPrFEjxb7jaOlp%2BDrU%2FT90TFDTANCh2BRboD7I9uzlxFCeXFtMRC1DD6pbHLBjqkAbD6LGHPZ30hbAPi3Z8qk1LpESoZcZ4vjnDatZ0EQmOeNNErwnYvIFYSNPU1vE3AgEMIx4TSBLR3jN9raZJsywQbzHbB2YP1A776xYBk%2B6EkPTLo%2FKvwkiut3DTVhlavIX90GKm%2FG7d3rZbQFtHj5vY0jgfCDsdDt203U%2BaSrajUL7Jk3WDuh46oDdulie7kEIkrJQYWsP3Hu8kRUK%2Bk8eekS5i9&X-Amz-Signature=24d90d9cfa9fa0b2268eca5636430a6d0fe4843e303f56e5cf37d5927c4483ba&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4664NFT72RR%2F20260118%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260118T061814Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEKz%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQDfJuNcvhsPsVMEmMYVZ%2FHbvg%2BUlTtpOw2RLtv1X6NSUQIhAIQotbGgWx8ZA06vb3peQM%2FQVbJoTzzc%2Bf3JsBbCySCWKv8DCHUQABoMNjM3NDIzMTgzODA1IgyCmWkw3uB%2BGn%2BFAnMq3AMgJ3wRPhdLiUX3ie5vzmdf8vTOEnFVf%2FjPv3u3NKH5opBM5v8MQCs1AiFA72sHfagOzh1Ua8WUkIfijX3nbFXZB9P01aUUCmyKzdiEXhRZdxju0%2BhoZlI5j9GiElJG2yb6rBwGjOOyfw5gd%2FZBsGi9BVTmHl6%2FaZ%2B%2F517Wmvnm4VNE%2F7K5l0qRPL4xvhk2nwMgUTatgoejNnEpBXpX%2FijatFgzTRO3f10SAolxPG1%2BwY%2Bw7YGGFowKcS4x44tejRx6Vq1nvh%2BzT53geRRLX1qgkTWoNpc6go0FiPBIS45%2BSYG%2BR2QTT3PIbIoFr0DKR3DidQ0Nvi%2BkKxwWUxN88bSj5j%2FN0DJDo81jci5LIs6zm0PjVL%2BiBea3wLNGu8%2B%2FIECyA3GfNvq%2BopNuCLhnywiTxxtYe9zxe2kXKpnBQ5EBdrWtyKtQd01EO3dSdS9kIa6WfP4dPoAIp13EpeqhjzzxnkTOHX6PEaw9sSm0%2FaRd07I9bKelCa8etK%2BnUkJLFscn29kqlNwjOcwYyAhlyQSecD9ptADpd%2BAumZv2TX9dcf%2B0FHmUk3O58QsQ6hMpO1T4XQFOzPrFEjxb7jaOlp%2BDrU%2FT90TFDTANCh2BRboD7I9uzlxFCeXFtMRC1DD6pbHLBjqkAbD6LGHPZ30hbAPi3Z8qk1LpESoZcZ4vjnDatZ0EQmOeNNErwnYvIFYSNPU1vE3AgEMIx4TSBLR3jN9raZJsywQbzHbB2YP1A776xYBk%2B6EkPTLo%2FKvwkiut3DTVhlavIX90GKm%2FG7d3rZbQFtHj5vY0jgfCDsdDt203U%2BaSrajUL7Jk3WDuh46oDdulie7kEIkrJQYWsP3Hu8kRUK%2Bk8eekS5i9&X-Amz-Signature=a48cb8a93da47e07dd750d0ae8c038845a0dd89f87b0f51484c1909c5f4ae477&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466RSW72V7I%2F20251005%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251005T061408Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjENH%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQC0gM%2B7aJQ0STCVm1SisvayE5DRdSB3crF3HSqgmPfrHgIgB1aLlGPw8Pjd%2BBtrGsdGZlbQB%2BDHBdBuHZhh4zx5Ws4q%2FwMIahAAGgw2Mzc0MjMxODM4MDUiDHP1%2F4NU88kz2kclSircA%2BLO3KmclJ%2Bwj5D6inPu3e%2BKNaXqzRi326VVS4NVrXm%2BNVgbpdVLLvqk3yDhHnOgK4Lt4wuu5kt8BfbRKVhYzPeujBU9Np8uTpCcIg6F%2FZLfvJi3gsybiZa7ix3uspbuZuUFT%2B82C9%2BXGB3ZeXiAmdrUMwO87PsHrGGAgGOXR461Y%2Bw49%2FrL6MR8mBYPXfa1o6jBiYU4%2BGUGYZZ%2BFuJsDhIQhoV1GC9ReEXlSRnkmo06wlLAl2m0pVB5YDt0b%2Fy5j00p8yyLoQvdfro4kG9RdFO3HWvhJooxydzsQlHLSc3kqIC39GNBrAgVr1hX7vTXZHeUkWWaVb%2Futr5bmuupZvS784B6Nv1heyBLx4KuA6vwQ8v28%2FZTtd1LdvRPRdiQpFWMP1VuQB1izoZBCm90bQAK0eY1nSWGkDy%2BVHPT7JCIK0WDGsRWPmk%2FnNL0W3gReBGqjqnxkuIgNDm2ofUb7Sj6ShhxF627xYnVyRpg3DiaZd9%2BCUWuC%2B%2FiWGh4s8B9Z01gzvyN07g8hkIJrdkRmDC3sQ0dQKKKmgUX%2B05pqsI3lcN%2BRBy6F4UJ1UjOi5MWw1KUxul5AFQESkz9TcM8G%2B4n3cUr%2FNAMPb9jIxRRdPQ6QknEVJWVfQEhdujHMOn1hscGOqUBztSl%2BDeBwk5F3og755PJ6F3VU9caCioztoK%2FwFI%2BvKAQTOVBhRSiKv%2FtO74DtswUh7s2WeAW5BAeTAv7d7sLDW4dqHpP1l%2FKDXDn87tC%2BWUfF%2BlXmTH8Zy6S8zF75AhPlkaJ1RKUBWjaEgS4V53Xb1Cg0%2FBoIvlEaMFELRYROJG0RlBme9RiOFYWNlTVLlghfjkrRmCABV3AIUI1z3EhQgp2Nnrs&X-Amz-Signature=cd33490e5d37bc6f2f02e190c21f546912e3f780c80f04ee7d9352c452b87bbe&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466RSW72V7I%2F20251005%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251005T061408Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjENH%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQC0gM%2B7aJQ0STCVm1SisvayE5DRdSB3crF3HSqgmPfrHgIgB1aLlGPw8Pjd%2BBtrGsdGZlbQB%2BDHBdBuHZhh4zx5Ws4q%2FwMIahAAGgw2Mzc0MjMxODM4MDUiDHP1%2F4NU88kz2kclSircA%2BLO3KmclJ%2Bwj5D6inPu3e%2BKNaXqzRi326VVS4NVrXm%2BNVgbpdVLLvqk3yDhHnOgK4Lt4wuu5kt8BfbRKVhYzPeujBU9Np8uTpCcIg6F%2FZLfvJi3gsybiZa7ix3uspbuZuUFT%2B82C9%2BXGB3ZeXiAmdrUMwO87PsHrGGAgGOXR461Y%2Bw49%2FrL6MR8mBYPXfa1o6jBiYU4%2BGUGYZZ%2BFuJsDhIQhoV1GC9ReEXlSRnkmo06wlLAl2m0pVB5YDt0b%2Fy5j00p8yyLoQvdfro4kG9RdFO3HWvhJooxydzsQlHLSc3kqIC39GNBrAgVr1hX7vTXZHeUkWWaVb%2Futr5bmuupZvS784B6Nv1heyBLx4KuA6vwQ8v28%2FZTtd1LdvRPRdiQpFWMP1VuQB1izoZBCm90bQAK0eY1nSWGkDy%2BVHPT7JCIK0WDGsRWPmk%2FnNL0W3gReBGqjqnxkuIgNDm2ofUb7Sj6ShhxF627xYnVyRpg3DiaZd9%2BCUWuC%2B%2FiWGh4s8B9Z01gzvyN07g8hkIJrdkRmDC3sQ0dQKKKmgUX%2B05pqsI3lcN%2BRBy6F4UJ1UjOi5MWw1KUxul5AFQESkz9TcM8G%2B4n3cUr%2FNAMPb9jIxRRdPQ6QknEVJWVfQEhdujHMOn1hscGOqUBztSl%2BDeBwk5F3og755PJ6F3VU9caCioztoK%2FwFI%2BvKAQTOVBhRSiKv%2FtO74DtswUh7s2WeAW5BAeTAv7d7sLDW4dqHpP1l%2FKDXDn87tC%2BWUfF%2BlXmTH8Zy6S8zF75AhPlkaJ1RKUBWjaEgS4V53Xb1Cg0%2FBoIvlEaMFELRYROJG0RlBme9RiOFYWNlTVLlghfjkrRmCABV3AIUI1z3EhQgp2Nnrs&X-Amz-Signature=c53cd35334012239ef083bb6c7894ca944418d929e01e6898e56a6b4d3a6928e&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

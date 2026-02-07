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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466TJ3QYZDD%2F20260207%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260207T122541Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIH2lPX1cd97hYZU1T1oJs%2FpTdAprQwdtKLb5tjYN5ucHAiEAp5TcJgBBlpH6p2Mpdr6n2vSxi1TlehccW4hqqaK2tjgq%2FwMIXBAAGgw2Mzc0MjMxODM4MDUiDHqFZ3BCPGlHRt9S7SrcA71b6rf8JDEpLQGWSb5yBIAJ2NFhED%2FoweVDuJWKgLMtXbFrlpTLWh4ktKMl6B8wiyDwXD9RgpbNmJesOidwsaVErRxydHCbfFkxwiN04jaAVhIzEZjVYlXOJUHSGse%2Bo%2FAsxP9N7aPAtMQmutxK2P2skbT75zFDPA7Gdo6i%2FaAMgIdb1ghd3Jfr7rZM1PxfD77cZzJ3TsMvFCnNjawAE8k7XYJEvztjSq9lm9VkMEM0Nm8H9hMPDqHoXzd7anc527%2FE6ECKjwEE8T6TbjhH584LGT2W1Qo2qPrtlPCV%2B2HPnhrKIDfH4bGIonIhrBEkOy1NpLC5rkpTk7D95QoPoa5EOEeq8VqyCKskDuLSaAO%2F3yG0jayPOuVjkzLPeuozGh1eAWaFJzCC0Q6aDFGzTVnxj6wY5JA7iDRrWVUPWmUjU%2FaCIqggKotpZVPl%2BxbA2J9iFYZxIR8SjWBeGZwf2YO6wtbtlJnN%2BOm4Izx0FP%2BU3s6ZE4DGGD9ZRZFcc%2FybVPRvoYZrRsXKJk0Soz4BxJCIHtocq%2BWAAHJiWEQxlb%2FBsALbYz2LBiM7yhGRPZgEiiDzNvSXvDEXyIUi7G%2FOwuvnp1qWQ8CrcjxhGxk%2FkzArRb1Edm36ED7df%2FSvMLewnMwGOqUBN8Vb0%2BmwT9VcICVvhYQKKH12NnvbVE9I3NrcDDZucA9vw7rm9bcBqZh%2BaCRGiigCra4Tk5CPJVdaHiTWjIFGN8PnfQrbKIx%2FH8d8qjAiimczHt249M2fBYCSUU%2FU2sNXc5vRCjZFqMRWYDYzvZnStZNb1A0MtDsXxt0mRAQS%2FAToY3ceTOR7FKldsJJYfWxVN3TMqV0gvjTtQ6Dqm62c%2B3XNP2ET&X-Amz-Signature=50d7e7903e21560f4f6a3ff2c0fbdce91aedba00639dff790ba642a7a1d0d1ea&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466TJ3QYZDD%2F20260207%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260207T122541Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIH2lPX1cd97hYZU1T1oJs%2FpTdAprQwdtKLb5tjYN5ucHAiEAp5TcJgBBlpH6p2Mpdr6n2vSxi1TlehccW4hqqaK2tjgq%2FwMIXBAAGgw2Mzc0MjMxODM4MDUiDHqFZ3BCPGlHRt9S7SrcA71b6rf8JDEpLQGWSb5yBIAJ2NFhED%2FoweVDuJWKgLMtXbFrlpTLWh4ktKMl6B8wiyDwXD9RgpbNmJesOidwsaVErRxydHCbfFkxwiN04jaAVhIzEZjVYlXOJUHSGse%2Bo%2FAsxP9N7aPAtMQmutxK2P2skbT75zFDPA7Gdo6i%2FaAMgIdb1ghd3Jfr7rZM1PxfD77cZzJ3TsMvFCnNjawAE8k7XYJEvztjSq9lm9VkMEM0Nm8H9hMPDqHoXzd7anc527%2FE6ECKjwEE8T6TbjhH584LGT2W1Qo2qPrtlPCV%2B2HPnhrKIDfH4bGIonIhrBEkOy1NpLC5rkpTk7D95QoPoa5EOEeq8VqyCKskDuLSaAO%2F3yG0jayPOuVjkzLPeuozGh1eAWaFJzCC0Q6aDFGzTVnxj6wY5JA7iDRrWVUPWmUjU%2FaCIqggKotpZVPl%2BxbA2J9iFYZxIR8SjWBeGZwf2YO6wtbtlJnN%2BOm4Izx0FP%2BU3s6ZE4DGGD9ZRZFcc%2FybVPRvoYZrRsXKJk0Soz4BxJCIHtocq%2BWAAHJiWEQxlb%2FBsALbYz2LBiM7yhGRPZgEiiDzNvSXvDEXyIUi7G%2FOwuvnp1qWQ8CrcjxhGxk%2FkzArRb1Edm36ED7df%2FSvMLewnMwGOqUBN8Vb0%2BmwT9VcICVvhYQKKH12NnvbVE9I3NrcDDZucA9vw7rm9bcBqZh%2BaCRGiigCra4Tk5CPJVdaHiTWjIFGN8PnfQrbKIx%2FH8d8qjAiimczHt249M2fBYCSUU%2FU2sNXc5vRCjZFqMRWYDYzvZnStZNb1A0MtDsXxt0mRAQS%2FAToY3ceTOR7FKldsJJYfWxVN3TMqV0gvjTtQ6Dqm62c%2B3XNP2ET&X-Amz-Signature=007d269e9e5bd79dbfb5bfe7a4ec00308683abd97166d0b2eb0573b7d20a8774&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

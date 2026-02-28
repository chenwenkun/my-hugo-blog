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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4666DYUD5AH%2F20260228%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260228T010229Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEID%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCICBsL%2FdcmpnaoYsUIhulFgixZZu6Gw6k2h5nlH8G9TEWAiBBldg1NxFTL%2FZfDVWfJlag0kCNabXmfueIPmgyWKPBvyr%2FAwhJEAAaDDYzNzQyMzE4MzgwNSIM7o%2FjTHm8kQ8KPntuKtwDki3cqL9ITHnbKWxkf%2BTquaQmJHNESOOtuHB7%2BrxoCuGnrxKFh3smmN84qBIa8a97MbpBRv%2BEgkRhoAbAPb3er6i3lWdwGGfKx5bxcFDeUFXO%2BAaJuZiwjoYZmtc4WSayBsoUCaEsdy5I4%2By5e8hb7ilgNFEBVjqseZeNoAsSLPEDrzNirgXu3R2N%2BSgk5oHxJsuVw0GQXWzIRy023Ex545JDnJrZUgHCBPTxs3sxXoLrsrWl%2BrHbsww2E4cFxRSCUnzfvRoRie9PJyJNOCoEosqguwXXdbOgfkKGoFiMC90dDCPv6oyS%2BI6YlkDmHkwT%2FSiDlAsLTCBYC%2FnYQTZlvtLHbsyYxCk6LG1%2FWfFh6EJfW8OiNZIrUf9Y8ByyJbJ5NC%2BY%2FQ3dLx90xWnZKCOnFLua%2Fha8Z9W6Ix4qGmYwefXXKmARTytv1nYy9gLj01mA2f5VyZSOZH4oNH8Z0w62GdDx99bLjSqqlkudWHsMQKxSLwRD0vVEKL1MoE96GDMwgtfQLzit%2FMLBYvqsTG50yqiF5ZNkZX2f%2BexR1Qo2DwYGC%2B71lMucbXmRM7KM599G8sXhDgxe2ygqu0Se%2FvYqteR4svFgUACTULaQsDVEx5P5nY9k1fD34acLBSQwuOOIzQY6pgEA%2FqxJYtPT%2FSnjt7pZBNET9xvp46flotdwsOATyzQdqK%2Fbfr10mofged2oL5eUeqUj0hqjbz62TsA1POIg1z8dnYeL1Zps2Z0B2kC0l27FajQMNGDi9YRwJMpAD%2Bbyr0nKrPp83GUuoP0%2BEnXD7jVDjtbxTFCx7up3U3u4RfXOoQ5AVqKz9a2uOweyqkTK1sGDfqMWwKgnfAcpGWtrg7ByJgP9iXPc&X-Amz-Signature=deb6ccde87600e26d1d500ed7ff152a059bb4fd9d4928bc8eabba96e14b7e15f&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4666DYUD5AH%2F20260228%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260228T010229Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEID%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCICBsL%2FdcmpnaoYsUIhulFgixZZu6Gw6k2h5nlH8G9TEWAiBBldg1NxFTL%2FZfDVWfJlag0kCNabXmfueIPmgyWKPBvyr%2FAwhJEAAaDDYzNzQyMzE4MzgwNSIM7o%2FjTHm8kQ8KPntuKtwDki3cqL9ITHnbKWxkf%2BTquaQmJHNESOOtuHB7%2BrxoCuGnrxKFh3smmN84qBIa8a97MbpBRv%2BEgkRhoAbAPb3er6i3lWdwGGfKx5bxcFDeUFXO%2BAaJuZiwjoYZmtc4WSayBsoUCaEsdy5I4%2By5e8hb7ilgNFEBVjqseZeNoAsSLPEDrzNirgXu3R2N%2BSgk5oHxJsuVw0GQXWzIRy023Ex545JDnJrZUgHCBPTxs3sxXoLrsrWl%2BrHbsww2E4cFxRSCUnzfvRoRie9PJyJNOCoEosqguwXXdbOgfkKGoFiMC90dDCPv6oyS%2BI6YlkDmHkwT%2FSiDlAsLTCBYC%2FnYQTZlvtLHbsyYxCk6LG1%2FWfFh6EJfW8OiNZIrUf9Y8ByyJbJ5NC%2BY%2FQ3dLx90xWnZKCOnFLua%2Fha8Z9W6Ix4qGmYwefXXKmARTytv1nYy9gLj01mA2f5VyZSOZH4oNH8Z0w62GdDx99bLjSqqlkudWHsMQKxSLwRD0vVEKL1MoE96GDMwgtfQLzit%2FMLBYvqsTG50yqiF5ZNkZX2f%2BexR1Qo2DwYGC%2B71lMucbXmRM7KM599G8sXhDgxe2ygqu0Se%2FvYqteR4svFgUACTULaQsDVEx5P5nY9k1fD34acLBSQwuOOIzQY6pgEA%2FqxJYtPT%2FSnjt7pZBNET9xvp46flotdwsOATyzQdqK%2Fbfr10mofged2oL5eUeqUj0hqjbz62TsA1POIg1z8dnYeL1Zps2Z0B2kC0l27FajQMNGDi9YRwJMpAD%2Bbyr0nKrPp83GUuoP0%2BEnXD7jVDjtbxTFCx7up3U3u4RfXOoQ5AVqKz9a2uOweyqkTK1sGDfqMWwKgnfAcpGWtrg7ByJgP9iXPc&X-Amz-Signature=009cd7d2dcf3352596fd823872bd5ba7ca89e02ac0eda618df181782f1f10afb&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

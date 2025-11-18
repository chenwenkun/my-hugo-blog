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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466UC56QP6F%2F20251118%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251118T181656Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEAIaCXVzLXdlc3QtMiJIMEYCIQCiikZkYmSKocvc1Fy3saszqb0IKP1wcnGzSjF3iSWWSgIhAIT5ZPFZ5s%2BNBhHlDZMsmnNnzfOW1Unx9q3e%2F%2F%2FPR75GKogECMv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgzQ3oRzD1eJU8iZUxIq3AP52IoAuaNdaQCLM8rFGZXKrBadUP72oc3g65LYFcr6Vly%2Fwk13YQm4yM2jyRQw%2Bo3vpr6Ln%2FD2kbeIjf8a9JeL1KMS%2BmCH1a6JY6DcJmLaIAw%2BRX26s7FkE8uoI1gH71BrBtSOqTN1rX8S1%2FwtlVgo6iFhPi1rUIQzOGMN4B5O5uDhg4QlccE0FOuwVwo8mH020ozT6prVkKb7594rigA%2FDMvts6G8mPCCEyKODXRrTeOJBV0QJg8xGHbYbsV5eIYZSgxjLZNzvIVqM89YAVwYdFfHJ6XIO17QBn0GNfMtx2hYVDuqol4JAK4MWxYWFkCPj97HHTovQZTxiDCvXPDpRPr8HpCmJjXUn%2BDPv72IwXOiX11KL1PBAjo7ps6uPCf1mXCtzCcJcYZ4LXe0gSfSz14xmSB7bs%2BBu%2BTgHUE%2FwFHTushou7rtijNLGadf74E9npnAFup%2F9N%2BU8n%2B7n7jsEC%2F9GUdnH2Pl229SXEW9id0pI20pVLdzC3Bv5vcl5xHWxnDGs5GLN1tCziYOBsTF%2F3fw6YGfkIIiQFDpldBE0MGiIF6t%2B%2F%2BFPFRY6LV1auTLM%2BJ1nPfVRc8cft3GrvFixfYrFnGEYUxTQevGNnPx0wXfSsAQYr%2BajbToGTCX3fLIBjqkAYwd%2B4c3ndbRFiYIXjI8WI3GUu%2FQPeMOKzpUHxSHGHFcnLJCRrJ4FLRQPjFoDO2w6ACul7c%2Bv1%2FDACGn%2B6qdeB5KvcGIffKm%2BsluT2b5zj%2BV%2FRToRb4UFDZxLThzvE408opu8KIkB8qPsmwBxyjorpeyGCSJTC%2F%2FIiL6P6qJa591sB0cn0Q%2B54c4E5UXDVvUO5Ko5%2F%2FdQ40nJ3ib1%2BhXlLg%2F8ahg&X-Amz-Signature=5f16de516f3f48402dd0cd999aee2f22d155a8fb795fdb3b455d229dac815869&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466UC56QP6F%2F20251118%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251118T181656Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEAIaCXVzLXdlc3QtMiJIMEYCIQCiikZkYmSKocvc1Fy3saszqb0IKP1wcnGzSjF3iSWWSgIhAIT5ZPFZ5s%2BNBhHlDZMsmnNnzfOW1Unx9q3e%2F%2F%2FPR75GKogECMv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgzQ3oRzD1eJU8iZUxIq3AP52IoAuaNdaQCLM8rFGZXKrBadUP72oc3g65LYFcr6Vly%2Fwk13YQm4yM2jyRQw%2Bo3vpr6Ln%2FD2kbeIjf8a9JeL1KMS%2BmCH1a6JY6DcJmLaIAw%2BRX26s7FkE8uoI1gH71BrBtSOqTN1rX8S1%2FwtlVgo6iFhPi1rUIQzOGMN4B5O5uDhg4QlccE0FOuwVwo8mH020ozT6prVkKb7594rigA%2FDMvts6G8mPCCEyKODXRrTeOJBV0QJg8xGHbYbsV5eIYZSgxjLZNzvIVqM89YAVwYdFfHJ6XIO17QBn0GNfMtx2hYVDuqol4JAK4MWxYWFkCPj97HHTovQZTxiDCvXPDpRPr8HpCmJjXUn%2BDPv72IwXOiX11KL1PBAjo7ps6uPCf1mXCtzCcJcYZ4LXe0gSfSz14xmSB7bs%2BBu%2BTgHUE%2FwFHTushou7rtijNLGadf74E9npnAFup%2F9N%2BU8n%2B7n7jsEC%2F9GUdnH2Pl229SXEW9id0pI20pVLdzC3Bv5vcl5xHWxnDGs5GLN1tCziYOBsTF%2F3fw6YGfkIIiQFDpldBE0MGiIF6t%2B%2F%2BFPFRY6LV1auTLM%2BJ1nPfVRc8cft3GrvFixfYrFnGEYUxTQevGNnPx0wXfSsAQYr%2BajbToGTCX3fLIBjqkAYwd%2B4c3ndbRFiYIXjI8WI3GUu%2FQPeMOKzpUHxSHGHFcnLJCRrJ4FLRQPjFoDO2w6ACul7c%2Bv1%2FDACGn%2B6qdeB5KvcGIffKm%2BsluT2b5zj%2BV%2FRToRb4UFDZxLThzvE408opu8KIkB8qPsmwBxyjorpeyGCSJTC%2F%2FIiL6P6qJa591sB0cn0Q%2B54c4E5UXDVvUO5Ko5%2F%2FdQ40nJ3ib1%2BhXlLg%2F8ahg&X-Amz-Signature=d0a76f92a92b667ba7872a266dd99482250d7dd0806a9e38300add36e45aa3b5&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

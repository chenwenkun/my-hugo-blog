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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466UAO7IC67%2F20260528%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260528T200402Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEOz%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCID00%2BReM0%2FF092h%2FaZYhUmwpf782y7rTrrpFmxEVGDBhAiBBPQw51k1PASTJ8fQgR3dZygMg%2FsW7D0Mevuere44ZgSqIBAi1%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMCaoOewScuyY8LFTXKtwD2urC40ELPnV838Eb73IlaDF6ha%2FuZcMkcDJT8VN2l3qaKxeY5A%2F4vi3A%2FITXrr%2F2sgykLOs%2BmF%2BErVbwoP9XUiRXBrRs%2FJHjyk5V4hGzF6OwJ5bo%2FPkmkLLZ3dvMly%2Fws3G0%2B096EiwuAyqpB%2BM17HTGOhDf3XEDLhRUyPA3wJnQS1Xhehkx1YYFDG5qVpBtbY8P0U1J%2BjCEuHRIFrMPKorbGh%2FMvp%2FBwpKeNs4o%2FEqxXMHRzhM5S%2FiaAEYRf9w1ISMs5jGOI8Z8yqRJijsrtCyOOL8qdUCPWEBeh53pYvsle44bb1D1KTm3m2M8c%2FKiy8VY2Gc8HNegnnNmf1rk4MhhNprd2BJsGDIpWxc30gjUc%2FdvwfEhgTSCsyy%2F3qPnn6OITQnPnW%2BCTk43bF8a1CSzBoV%2FbBQ%2B6cFheq1NKE0GN4KNipA1hO334RIOOEawHlyq58ojLL5ETs9iOXfFbsExFmfc7KwDLCSDJ3EKysbGC3ikio0qU8%2F7tYGfmklnzEInOsD6n7tY1KSMZuWrzoOjmKF%2BanLDihpBljBNiLkk6qveb2b2Acao7GiHIjv7kKC89o4I6twFbtbHUp5x3nasVhEbaPVBc8i9gUyANHIbGHzz9jU8BVXR8qowpbXi0AY6pgHKdH9W31wfWeRwp4Sz%2F7vgqSpJTXjiPfCstIqHY%2BudywpfcFAQ5HMpt1esoQ2Xr3A3zvONGOVS8SbFB%2BJNLojNFHdtRuxFADsX1J0WS7Ze3G0MohOYKr0MRY9VYkY%2B4FV4c7fRxY4f01NhoHBLVoCTk8%2FVEXD9ei%2BL8fp42mmCe%2B8%2FD1vMzF0e6s%2FkoqqmNTdPES7tkYwlW5drTxfankgYcHwZShBH&X-Amz-Signature=800cb2f7d9ace5e0ed463ddc5625c671e5127cfc0b3c9307cfd8d096496bf47c&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466UAO7IC67%2F20260528%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260528T200402Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEOz%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCID00%2BReM0%2FF092h%2FaZYhUmwpf782y7rTrrpFmxEVGDBhAiBBPQw51k1PASTJ8fQgR3dZygMg%2FsW7D0Mevuere44ZgSqIBAi1%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMCaoOewScuyY8LFTXKtwD2urC40ELPnV838Eb73IlaDF6ha%2FuZcMkcDJT8VN2l3qaKxeY5A%2F4vi3A%2FITXrr%2F2sgykLOs%2BmF%2BErVbwoP9XUiRXBrRs%2FJHjyk5V4hGzF6OwJ5bo%2FPkmkLLZ3dvMly%2Fws3G0%2B096EiwuAyqpB%2BM17HTGOhDf3XEDLhRUyPA3wJnQS1Xhehkx1YYFDG5qVpBtbY8P0U1J%2BjCEuHRIFrMPKorbGh%2FMvp%2FBwpKeNs4o%2FEqxXMHRzhM5S%2FiaAEYRf9w1ISMs5jGOI8Z8yqRJijsrtCyOOL8qdUCPWEBeh53pYvsle44bb1D1KTm3m2M8c%2FKiy8VY2Gc8HNegnnNmf1rk4MhhNprd2BJsGDIpWxc30gjUc%2FdvwfEhgTSCsyy%2F3qPnn6OITQnPnW%2BCTk43bF8a1CSzBoV%2FbBQ%2B6cFheq1NKE0GN4KNipA1hO334RIOOEawHlyq58ojLL5ETs9iOXfFbsExFmfc7KwDLCSDJ3EKysbGC3ikio0qU8%2F7tYGfmklnzEInOsD6n7tY1KSMZuWrzoOjmKF%2BanLDihpBljBNiLkk6qveb2b2Acao7GiHIjv7kKC89o4I6twFbtbHUp5x3nasVhEbaPVBc8i9gUyANHIbGHzz9jU8BVXR8qowpbXi0AY6pgHKdH9W31wfWeRwp4Sz%2F7vgqSpJTXjiPfCstIqHY%2BudywpfcFAQ5HMpt1esoQ2Xr3A3zvONGOVS8SbFB%2BJNLojNFHdtRuxFADsX1J0WS7Ze3G0MohOYKr0MRY9VYkY%2B4FV4c7fRxY4f01NhoHBLVoCTk8%2FVEXD9ei%2BL8fp42mmCe%2B8%2FD1vMzF0e6s%2FkoqqmNTdPES7tkYwlW5drTxfankgYcHwZShBH&X-Amz-Signature=d5205dad23cf98f96418b9ef1f4086d4d2881555c3a3b2302a3af89677395ca5&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

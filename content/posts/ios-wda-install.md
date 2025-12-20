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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466QUIXW34J%2F20251220%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251220T122011Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEPz%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIFK1xmRYja5LnSfigQ2Q2FUCR5%2Bu4k8N8IRCMog0QiyzAiAQECJ0gypwWUXRZmbRSwgIqeXZk9tzNwgdLTQ9MZtlbyqIBAjF%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIM2Z1ZN4FFPKBJARKuKtwDXfI%2BIhijsnbz6I52cRf%2BYpXp7VinBBkR9e7g64pAWq1tYciERi88PKCXq3uSLGS7V20cwjQ0mTGDldrS5eLroF%2Fh6fUcNpxVYJNnthUKYYJlNTnsRLDKoZsIOOwDVN6nmR8eJUGd4Vzp78bfzQV4tZrpreQmiaYy8L1h7J5O9RXTtdaxXGxh9aTQq%2BOxs0wo19n66v33JS%2Fx5%2BioILR7gMA0d52pzyMuK4eaVRI4CNbehDveqDrxPFEgiGCNFwc5QzcOB87vV7N%2F2Umifn%2F3eo2%2Fa7DeSPARP5opB5EVMzsUg1%2Fxt8LcSCLNFs%2BKFdgNUMULfcyGymX6MkiF6Eq3kCZuNTzn0WZzZmpmPV%2F3A9SoUEEuj4sItq2LCqR32SO59KPRV2YaQaMsm%2FmaxFzujU%2By%2BU2WDXdM9fegs%2FyHSvhyxrEzT4Mj%2Br0Ioy6UhDU78xDVSxiIvIiJUVN7Ns4Di1NhsyuL04ovvLdGVmx%2FKtptX5vtF8QQqipJVC7s6HBaHCboMzCQoc4WT%2FxkAPgsYOoTGAJE%2BTnMELcxPtW3tjaGt1nSTHPWX2NXh%2BO0WYr522G16PRvRxfi2uqYSUfP4fgJGNqJLEHji1aeDU3Ra1LTHH4OMwr1aOc56TQwkZCaygY6pgHQFEyGmkjph3xhK%2BHcSdvPEvSTd6Wy5eofhroP%2BzYPJJg6tHKHU4sL1vPhRzajlTrYEP8BY2LiDIL8VXB0uGBppwpzKdQA7QqmCvlbAVxwepIQfi9m9e3SrdbEl7akU7a9737qcL%2BgBMtYKmDARq5FHcIjWusP7XSeosBCzZ%2B5lNP2z2jq0Nm3L2uxSLRslzJkEh0dhps82BN%2FlCdxoOl6R6GWLRtf&X-Amz-Signature=21f8e0c4670147359557b4e62598047ab290e726cf9a3724cd4571b892df8847&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466QUIXW34J%2F20251220%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251220T122011Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEPz%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIFK1xmRYja5LnSfigQ2Q2FUCR5%2Bu4k8N8IRCMog0QiyzAiAQECJ0gypwWUXRZmbRSwgIqeXZk9tzNwgdLTQ9MZtlbyqIBAjF%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIM2Z1ZN4FFPKBJARKuKtwDXfI%2BIhijsnbz6I52cRf%2BYpXp7VinBBkR9e7g64pAWq1tYciERi88PKCXq3uSLGS7V20cwjQ0mTGDldrS5eLroF%2Fh6fUcNpxVYJNnthUKYYJlNTnsRLDKoZsIOOwDVN6nmR8eJUGd4Vzp78bfzQV4tZrpreQmiaYy8L1h7J5O9RXTtdaxXGxh9aTQq%2BOxs0wo19n66v33JS%2Fx5%2BioILR7gMA0d52pzyMuK4eaVRI4CNbehDveqDrxPFEgiGCNFwc5QzcOB87vV7N%2F2Umifn%2F3eo2%2Fa7DeSPARP5opB5EVMzsUg1%2Fxt8LcSCLNFs%2BKFdgNUMULfcyGymX6MkiF6Eq3kCZuNTzn0WZzZmpmPV%2F3A9SoUEEuj4sItq2LCqR32SO59KPRV2YaQaMsm%2FmaxFzujU%2By%2BU2WDXdM9fegs%2FyHSvhyxrEzT4Mj%2Br0Ioy6UhDU78xDVSxiIvIiJUVN7Ns4Di1NhsyuL04ovvLdGVmx%2FKtptX5vtF8QQqipJVC7s6HBaHCboMzCQoc4WT%2FxkAPgsYOoTGAJE%2BTnMELcxPtW3tjaGt1nSTHPWX2NXh%2BO0WYr522G16PRvRxfi2uqYSUfP4fgJGNqJLEHji1aeDU3Ra1LTHH4OMwr1aOc56TQwkZCaygY6pgHQFEyGmkjph3xhK%2BHcSdvPEvSTd6Wy5eofhroP%2BzYPJJg6tHKHU4sL1vPhRzajlTrYEP8BY2LiDIL8VXB0uGBppwpzKdQA7QqmCvlbAVxwepIQfi9m9e3SrdbEl7akU7a9737qcL%2BgBMtYKmDARq5FHcIjWusP7XSeosBCzZ%2B5lNP2z2jq0Nm3L2uxSLRslzJkEh0dhps82BN%2FlCdxoOl6R6GWLRtf&X-Amz-Signature=3cb4af455e3cdb7b4fa6ecf649c64b3ae457b33d28c20a0fad2cf82d701065a8&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4662PUAGADL%2F20260301%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260301T122612Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEKH%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIH5J5LfsrpKXjQywaIq8%2B%2FLLf0tDXvZeJOKbquCAGAR5AiEAyosNrUNv32znSUloCSkkvRjUIb15DVBiKUJsdHwIV7sq%2FwMIahAAGgw2Mzc0MjMxODM4MDUiDGnc3VW4ddONFGq3yCrcA7CeRpGTZ5W6UOir0pi6hoPOx78aNfCSQJTwO5%2BRu0QKld8nVVokaBO%2BieG0lCeujk%2B6rBf84PbD%2FBxnkoPiWvFPKDaY0Y1V6fFasOqWh2miDwWFnKMurBoJA8y0Dpngf6TfqsVelTummGO88tlMbf7RWFlhnpTm77jR0SHXLvB8v5S3qFfwWg7S%2FHRWmMkzHi%2B5WS14cjyoNOzjAtsvVL2l6%2B4WIUIfjYSTb6K1vpYN2Cy9ELKJ6dW7qmNhhyB5vH6vaDUZ2aLkZdXZhY2XHwhnPkfvHF0i%2FpzM3JTXyEaxuqjZIe5oJnlszTgQoiJNJFgpj3ISKGoQfePTCOu0RSF2D2g2pDj0cBWyIPo%2FDZ57HKjywXLJFwP%2FYtrmxdVH%2FKDB%2FknvW6mMpr64hmbAYbIxO6QGuMvKBvsQ0iNNXPZVFo4ucYimLEtjbBBSq%2FPF5VwXGbXvvNFs1zpjVIHiGexVq1JWlVPkvKVxR8pMfgebP0x2xlmYySxh5YQvFf5mPuUGH5kONw6FwkkpiXtkBgcgN6EENFOXxr2AEFC40%2FaxjdEANnA2ahBa%2FCEM7thrag0zKy1Eu%2Ftfhaj8UZJZdxVvuS58nu3twyBw2fObQ0EwBX564eK%2BF5dUp6EhMKfxj80GOqUB4O5RgkZV75sadYNC3cnvKtbrQpf8dy13tcxVlu76K6FkiyFEeHasbAfd77nAf0Is68JKFvnnFupe3YfTqUTX%2FJDocHuSXOWgw%2FnZeWKuyoXEV09nOXE5mmnUu4AV5NSR%2BfiCOx%2BH7oPuO9kn1CrK0Adv%2FbrlFW9ks6kTmF2E%2BhTR%2F8S35%2FGxXd5jX832d3hMg97u19atsHAJmi4SdMbpYDElwD5C&X-Amz-Signature=8f53ae7fb38f69fc026918a18f55eff9a8d21b797c1a90959b68d2e55d3c6d9b&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4662PUAGADL%2F20260301%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260301T122612Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEKH%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIH5J5LfsrpKXjQywaIq8%2B%2FLLf0tDXvZeJOKbquCAGAR5AiEAyosNrUNv32znSUloCSkkvRjUIb15DVBiKUJsdHwIV7sq%2FwMIahAAGgw2Mzc0MjMxODM4MDUiDGnc3VW4ddONFGq3yCrcA7CeRpGTZ5W6UOir0pi6hoPOx78aNfCSQJTwO5%2BRu0QKld8nVVokaBO%2BieG0lCeujk%2B6rBf84PbD%2FBxnkoPiWvFPKDaY0Y1V6fFasOqWh2miDwWFnKMurBoJA8y0Dpngf6TfqsVelTummGO88tlMbf7RWFlhnpTm77jR0SHXLvB8v5S3qFfwWg7S%2FHRWmMkzHi%2B5WS14cjyoNOzjAtsvVL2l6%2B4WIUIfjYSTb6K1vpYN2Cy9ELKJ6dW7qmNhhyB5vH6vaDUZ2aLkZdXZhY2XHwhnPkfvHF0i%2FpzM3JTXyEaxuqjZIe5oJnlszTgQoiJNJFgpj3ISKGoQfePTCOu0RSF2D2g2pDj0cBWyIPo%2FDZ57HKjywXLJFwP%2FYtrmxdVH%2FKDB%2FknvW6mMpr64hmbAYbIxO6QGuMvKBvsQ0iNNXPZVFo4ucYimLEtjbBBSq%2FPF5VwXGbXvvNFs1zpjVIHiGexVq1JWlVPkvKVxR8pMfgebP0x2xlmYySxh5YQvFf5mPuUGH5kONw6FwkkpiXtkBgcgN6EENFOXxr2AEFC40%2FaxjdEANnA2ahBa%2FCEM7thrag0zKy1Eu%2Ftfhaj8UZJZdxVvuS58nu3twyBw2fObQ0EwBX564eK%2BF5dUp6EhMKfxj80GOqUB4O5RgkZV75sadYNC3cnvKtbrQpf8dy13tcxVlu76K6FkiyFEeHasbAfd77nAf0Is68JKFvnnFupe3YfTqUTX%2FJDocHuSXOWgw%2FnZeWKuyoXEV09nOXE5mmnUu4AV5NSR%2BfiCOx%2BH7oPuO9kn1CrK0Adv%2FbrlFW9ks6kTmF2E%2BhTR%2F8S35%2FGxXd5jX832d3hMg97u19atsHAJmi4SdMbpYDElwD5C&X-Amz-Signature=8d540bba6f22754e7e243b810ec719987eca7b4a6ee4993e942154741ee95c34&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4664ELQFMOZ%2F20251217%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251217T061857Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEK7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQD0pBs2sJN%2BEAd0KXmt0saAU0XjnHUvkMp5i9S4TnlOFgIgUwPMgYzPhCZlI6S9pMpXfctfS20Fd8ttbuABaBV9TGIq%2FwMIdxAAGgw2Mzc0MjMxODM4MDUiDPQDnWtUPJ97XtvS8yrcA60t65O9wDQ3wqBmysZ6SRDSlWKAC2T5H95IE9ckfsz9Yqg7qQBvkYIrOxkhaCI97lWMSDYRrNNjZGP1VsuKH22XK5DD1TNq00y%2BCYlDQq9v0WsUReJngMa%2BDhpU7GHsFq6zMLBxgNEfunzXQBgfAmuXKzMjiMPjTeyOM6jPhdY0dgVp8DAwt6UXjFOzXvMbQ%2FEdIrms6YB1UYpxr%2BFnbAsJRYxOPU5B4FPRLe9se90rGNWz32%2FHUsQtTXhNHxYJknTVJAn8LNXb8bUPnHi%2BfVNdh4RxOiCEwUlo%2FUrN8eB%2BmfdVoXlqQg4QZ7bE%2Fu94KIV2EQX5dxid2Sobh3kQecde%2BhD93%2B70PhewphaQJb4rCcMPYqUHKGvYtF%2BdNazh%2BGVEzkrJnpJQYRypvModLWbo8VzddSYTa%2FT2BtyCKSMwClVlj2iKN4yaRBLGn%2Bvq8SL0CxbwIDv669UvrBGjATUs0diVT2Nurt8PnUty1%2FlAylY2wtxR0f2N0iB1npDI2kl3wN5RupVwEDVZL3%2F0bzm6OvQ8DwqSASgrf9zISuazwnjLC3Xh0nd0tzpHKFbnR8XZ9gXO2lsFlJsj6KMGRruLX1UEn7Vl7ZDnu92JLJnSwJVVkDpzuhrgxdiaMOGCicoGOqUBIos9Tokw89%2BV4SjIHBPFDK7%2BlhSOf2FH%2FRuGr43YCQLf7dD9bd2%2BDGUbeG7yx87atgX45vb4195ktYpYQVCkxvfbsIno36RE1IcVFM%2FUUi5B%2BYnvCSv4eygjxOpj64FIVtedS5ZKH8R0pePuB60PF%2B6qMfzB%2Bvw4vrwpcsJn6fkIAWIxl0iU2Skiv3nVk8xsQvugQq9HrapvDTQ7sMpjZYuDaea2&X-Amz-Signature=07469b65324dff618e175de7cfc54caba5f0c3b697f86cec248ab6a4d012557d&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4664ELQFMOZ%2F20251217%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251217T061857Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEK7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQD0pBs2sJN%2BEAd0KXmt0saAU0XjnHUvkMp5i9S4TnlOFgIgUwPMgYzPhCZlI6S9pMpXfctfS20Fd8ttbuABaBV9TGIq%2FwMIdxAAGgw2Mzc0MjMxODM4MDUiDPQDnWtUPJ97XtvS8yrcA60t65O9wDQ3wqBmysZ6SRDSlWKAC2T5H95IE9ckfsz9Yqg7qQBvkYIrOxkhaCI97lWMSDYRrNNjZGP1VsuKH22XK5DD1TNq00y%2BCYlDQq9v0WsUReJngMa%2BDhpU7GHsFq6zMLBxgNEfunzXQBgfAmuXKzMjiMPjTeyOM6jPhdY0dgVp8DAwt6UXjFOzXvMbQ%2FEdIrms6YB1UYpxr%2BFnbAsJRYxOPU5B4FPRLe9se90rGNWz32%2FHUsQtTXhNHxYJknTVJAn8LNXb8bUPnHi%2BfVNdh4RxOiCEwUlo%2FUrN8eB%2BmfdVoXlqQg4QZ7bE%2Fu94KIV2EQX5dxid2Sobh3kQecde%2BhD93%2B70PhewphaQJb4rCcMPYqUHKGvYtF%2BdNazh%2BGVEzkrJnpJQYRypvModLWbo8VzddSYTa%2FT2BtyCKSMwClVlj2iKN4yaRBLGn%2Bvq8SL0CxbwIDv669UvrBGjATUs0diVT2Nurt8PnUty1%2FlAylY2wtxR0f2N0iB1npDI2kl3wN5RupVwEDVZL3%2F0bzm6OvQ8DwqSASgrf9zISuazwnjLC3Xh0nd0tzpHKFbnR8XZ9gXO2lsFlJsj6KMGRruLX1UEn7Vl7ZDnu92JLJnSwJVVkDpzuhrgxdiaMOGCicoGOqUBIos9Tokw89%2BV4SjIHBPFDK7%2BlhSOf2FH%2FRuGr43YCQLf7dD9bd2%2BDGUbeG7yx87atgX45vb4195ktYpYQVCkxvfbsIno36RE1IcVFM%2FUUi5B%2BYnvCSv4eygjxOpj64FIVtedS5ZKH8R0pePuB60PF%2B6qMfzB%2Bvw4vrwpcsJn6fkIAWIxl0iU2Skiv3nVk8xsQvugQq9HrapvDTQ7sMpjZYuDaea2&X-Amz-Signature=d29955d3de8b635bcac07906d735862a06e227d061fa626053bd9bb051cf0c9c&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

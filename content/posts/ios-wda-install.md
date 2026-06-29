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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466WA7T5IM7%2F20260629%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260629T101950Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEOL%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQCMqKa0Mii4v3v2RPAu958F7l9%2Fdxiq0im%2BrRrgqWXMnAIgU6CdLA0uM41SxZ6imli1EQSfeCuw3BkCnFb8UvioOaUqiAQIq%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDMGs79DoaEVJFSBu6yrcA6tm1fB2GX4RCrMu%2F2im0Rp%2BFExQySUfhIqkS%2FoAkowaD26MmlI2xdX51F5u5TujZYdxdR9W%2Fa5PbxNE0hCExp7p4CvLwQK7g0dtvDUr5%2BwDWj%2FWlrvkLVNYCmUeLPaC39KOn75Oh%2Frb01p5mkMQJQLfALE%2BZIoPGPXJuYHnsPmMGG21XTz6k49ewmKsi6y%2Fig5enDFUIVgSM4OZqZy3%2BXwdcWbZpHZCh4Vmk7jqRUuroNkuBpnQ%2FYDvi6k8gbzcOtcrIbFM0v0e%2F2XhqvjKkt%2BZ2F1IRzK%2FT9TsMa72jGB9SxhgYGRiyHIj4U4PB9Ut74QCcVsL64qIAKASgnXWVwAqgUtPXpIHdTZsgqgBdEavjisuVw87vddorwj0IhoKpuK%2FbN3c9ADyOxSFRCj0n66oqn761g6RnkLdLvfDlOkN%2FLzaEXXPqS6j4Gp%2FwQzI8enXAFSMKjwOm3r%2FvwUGzdPLJYlE9mMYPJ8NpgBSWnYJbDKEEkxlrM%2BT1a3fWWJMYuPSlQXzyhJ8WBO8XxUtBeeCb7YXAahEEAREsv1kdx0Cwm7PEPSBAJ7KkOVVNMZGs3yhzQphfJnUXHBOOgSledCMjPacDyRZb8koypLt8TDFRZ9PkGbE1ZfVdgULMID6iNIGOqUBBBPTXepD5g5biGFTBsFP4taWIb4ojOdhbWCtbu9daulQ9TuShM%2FlVSnSTUopUJXUozy7Hsi9K6gv7c%2B2i9RoembKkQTtap4ZrdwIXkw5Y%2FXwKF3DQkN97sZ8MD%2BDwkLwziLrtBOxnVd16jTM4ivcqKBCBF8zMxbL42nHxc3v0K%2B5RYSnCYCPFEXK8l91Rp465bjfVdiIFwgiEqyTtQPlTebcCJcY&X-Amz-Signature=4824bdcb530b137bbc6bd183f81e4376181d889aefa76faee88c984eb57d59d1&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466WA7T5IM7%2F20260629%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260629T101950Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEOL%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQCMqKa0Mii4v3v2RPAu958F7l9%2Fdxiq0im%2BrRrgqWXMnAIgU6CdLA0uM41SxZ6imli1EQSfeCuw3BkCnFb8UvioOaUqiAQIq%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDMGs79DoaEVJFSBu6yrcA6tm1fB2GX4RCrMu%2F2im0Rp%2BFExQySUfhIqkS%2FoAkowaD26MmlI2xdX51F5u5TujZYdxdR9W%2Fa5PbxNE0hCExp7p4CvLwQK7g0dtvDUr5%2BwDWj%2FWlrvkLVNYCmUeLPaC39KOn75Oh%2Frb01p5mkMQJQLfALE%2BZIoPGPXJuYHnsPmMGG21XTz6k49ewmKsi6y%2Fig5enDFUIVgSM4OZqZy3%2BXwdcWbZpHZCh4Vmk7jqRUuroNkuBpnQ%2FYDvi6k8gbzcOtcrIbFM0v0e%2F2XhqvjKkt%2BZ2F1IRzK%2FT9TsMa72jGB9SxhgYGRiyHIj4U4PB9Ut74QCcVsL64qIAKASgnXWVwAqgUtPXpIHdTZsgqgBdEavjisuVw87vddorwj0IhoKpuK%2FbN3c9ADyOxSFRCj0n66oqn761g6RnkLdLvfDlOkN%2FLzaEXXPqS6j4Gp%2FwQzI8enXAFSMKjwOm3r%2FvwUGzdPLJYlE9mMYPJ8NpgBSWnYJbDKEEkxlrM%2BT1a3fWWJMYuPSlQXzyhJ8WBO8XxUtBeeCb7YXAahEEAREsv1kdx0Cwm7PEPSBAJ7KkOVVNMZGs3yhzQphfJnUXHBOOgSledCMjPacDyRZb8koypLt8TDFRZ9PkGbE1ZfVdgULMID6iNIGOqUBBBPTXepD5g5biGFTBsFP4taWIb4ojOdhbWCtbu9daulQ9TuShM%2FlVSnSTUopUJXUozy7Hsi9K6gv7c%2B2i9RoembKkQTtap4ZrdwIXkw5Y%2FXwKF3DQkN97sZ8MD%2BDwkLwziLrtBOxnVd16jTM4ivcqKBCBF8zMxbL42nHxc3v0K%2B5RYSnCYCPFEXK8l91Rp465bjfVdiIFwgiEqyTtQPlTebcCJcY&X-Amz-Signature=a6bbb8fb690f8b1cb33a1c22e360986efa28a5a8e2eaef323a1e67025e6dc720&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

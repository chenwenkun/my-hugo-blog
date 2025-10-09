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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466WKDQGUT5%2F20251009%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251009T181530Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEEEaCXVzLXdlc3QtMiJIMEYCIQCegdE%2BU7LeA0ZjdtSHuGeZoP%2BCpFAdvps4%2BzyYjXwU4QIhAIBG30sw9WKfFMysA3DSRGWx4yG8Omx3yDBXHPMCCPbqKogECNr%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1Igz5sLu1qSB%2B7Ot4P6cq3AMlf7wkY2zayJk%2FnD7TMnJwm9g353ocsTg6UpeRxwpu3L3BS74sCQ6%2Bt7UMbmPEmyiTn3cbs%2B2Jn1L4MEz2Ll620UjSUU9RFs52PYp2gOGi%2BwIT4BmFI7YKTDlVtyPBNo%2Bn8P9mGTxaJF94xSqcyIttB8D2mcFQ5jzY4jccHJiMMA2SYJk3ekq9dPmClwI05btJp9Klji4nGUx5qgF4cEt%2Fi5KCOelebjxG04AO%2FeBbHCVyqzfuonTQadAybSjnbgBSakXWmaIKxHWv2vQ8yu4%2BL96XkknXNjSSwUz1SywbN7nzaXpadXBraaXFlWfZQFNb5G42DNa4NkE7ezf0rKaq4%2F%2B8tznBFYtOprDavj0ty4kZh5YG%2FWxZ%2FV69GSoYRFGGG%2BGv2wAYT0xWamLV2UHpSJ1q58E7AEex9CT6BzJv62kATlPTIV7cDwkj00sHDuP7n9KfKYZG%2BfEbxLA738luz1lNjqqOFi0iuX9ZlNgQB9Osxti4WiIA2xVv6egGaxedzZ%2BlfWQmF0mM%2FPvup1AHa3KsCwePBENGP4yTg0t6IMQ%2FlmPQbZkZkULc4LUrcLQGQGiMT5JqhwWITKyktsYHdFQ3q%2FgVO2qxmLMuI7vr1oJFhrO7HK5IUR65AzCC1Z%2FHBjqkAUuzJX31yd7WXRlXGqPhUaVvluChi9eXBg3JyseA4oXGA7dpK8CV2%2BE7Vp%2BqFQDODRbC0FXwxnirMAfD7O4U4VpAqdqWLAVls5TnAHqnJF6LC8a8U9m3K2O%2F%2Be7z7edswd%2BIOcC72TR725rIHj4pFJTalsza04dDGuBFlrGF6jhD8Ctk1tEcYQ053HneuhujNfETghJLJ57kOFWW7VgtbP6Rtk5u&X-Amz-Signature=82cb6d4b7077ccd1719547f2710ef00f27dd0ee2332ebb10573eb65e0f3bc3b2&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466WKDQGUT5%2F20251009%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251009T181530Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEEEaCXVzLXdlc3QtMiJIMEYCIQCegdE%2BU7LeA0ZjdtSHuGeZoP%2BCpFAdvps4%2BzyYjXwU4QIhAIBG30sw9WKfFMysA3DSRGWx4yG8Omx3yDBXHPMCCPbqKogECNr%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1Igz5sLu1qSB%2B7Ot4P6cq3AMlf7wkY2zayJk%2FnD7TMnJwm9g353ocsTg6UpeRxwpu3L3BS74sCQ6%2Bt7UMbmPEmyiTn3cbs%2B2Jn1L4MEz2Ll620UjSUU9RFs52PYp2gOGi%2BwIT4BmFI7YKTDlVtyPBNo%2Bn8P9mGTxaJF94xSqcyIttB8D2mcFQ5jzY4jccHJiMMA2SYJk3ekq9dPmClwI05btJp9Klji4nGUx5qgF4cEt%2Fi5KCOelebjxG04AO%2FeBbHCVyqzfuonTQadAybSjnbgBSakXWmaIKxHWv2vQ8yu4%2BL96XkknXNjSSwUz1SywbN7nzaXpadXBraaXFlWfZQFNb5G42DNa4NkE7ezf0rKaq4%2F%2B8tznBFYtOprDavj0ty4kZh5YG%2FWxZ%2FV69GSoYRFGGG%2BGv2wAYT0xWamLV2UHpSJ1q58E7AEex9CT6BzJv62kATlPTIV7cDwkj00sHDuP7n9KfKYZG%2BfEbxLA738luz1lNjqqOFi0iuX9ZlNgQB9Osxti4WiIA2xVv6egGaxedzZ%2BlfWQmF0mM%2FPvup1AHa3KsCwePBENGP4yTg0t6IMQ%2FlmPQbZkZkULc4LUrcLQGQGiMT5JqhwWITKyktsYHdFQ3q%2FgVO2qxmLMuI7vr1oJFhrO7HK5IUR65AzCC1Z%2FHBjqkAUuzJX31yd7WXRlXGqPhUaVvluChi9eXBg3JyseA4oXGA7dpK8CV2%2BE7Vp%2BqFQDODRbC0FXwxnirMAfD7O4U4VpAqdqWLAVls5TnAHqnJF6LC8a8U9m3K2O%2F%2Be7z7edswd%2BIOcC72TR725rIHj4pFJTalsza04dDGuBFlrGF6jhD8Ctk1tEcYQ053HneuhujNfETghJLJ57kOFWW7VgtbP6Rtk5u&X-Amz-Signature=6d153b369120af820c1560014d3c59d29d6cc46ee16bff198a712e05c5429341&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

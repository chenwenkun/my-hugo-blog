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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466RU3COOS6%2F20260117%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260117T181556Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEKD%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIB0KN868aYeKO1vaQb38bCh7esd36OkoLeChGEs2TNoUAiBOkVrsrW0b3F%2BLxl4IhQItYRkUgqvegNPmCrAzLnO7VCr%2FAwhpEAAaDDYzNzQyMzE4MzgwNSIMQ7dE7QcST%2BO%2B21yGKtwDOsZLvAFHsgl7xfpF0cV6sUXfXAh9hOov3npej8uTDdFB7g6PKbD8%2B1fUUT5dxFDDqX9kI53AalZT1qsrcUBdFRFFDDvmLGDvJRkoB0BSWjZl8HzHrBRkf0O%2BwQi2NPX9D2L4LLk3mdvR3QSsQJNLMLnlm4Ktecz0vMywblMhlDKFxk18MA9Bp9uNriaLuyysKaiUa1S52ieHPAeqSIENh%2FOTievw8D2SnAgQ9vRaTwrOSNn46vkqkyBzyxs41nQVHeVxGS2N9skZxHpsvsSPhdCRHeWFcL1ChfQQnW3HEF4A55ppM9QPoBUVAauIHDGCOMmTkzu6KY1RdnNyQt4%2FwdiJa2p6qFkUB3qT0xYf1fcwWwyYkINJyvcYQELzQaZ6ecseW7rlWbI11d5aAR5GHI2WRcAQ%2FKgwZ3I1FXhF757gAg5%2BnDL6NHS8Mhl9nLzTEY2nf%2BOhY38BEuxD5iDe7Y2B9r%2B%2Bsq4IzFpZEMDoWXCbGNcSDdfy%2BHiFiOVMfcxL05N9b3aO4pXAhxGEQnvnXsNT62W00CKKJPQy6CIxpaGv3P5toQFYdKKJcloeCQsDf0pOwDbelb8BhP3xwQO0pr4Rl4r2bwYw0MwK6Qg1f871DGDGGdaM8YDjAE8wyemuywY6pgFxVOTUE09aj6ZgogJMV1R8joR6MEBSlLrKMazS7yzpYKTuBvxZncJ0pTT1uPP%2FoBv9u69h0PVcVxMRX1a%2B5TkaRos0WodEPBCAR5Rwnf8eeCDkhSHOOTrKqlW4q%2BSEISXq%2BGLGrTa4AD9vbk5uWdQZiNlf1EeJWrCyUt6boFWZshMqvP7RIxnc92gLWaVjH91W%2BDW5OmgQKvpr%2F1JkNNxyj7LhIDaD&X-Amz-Signature=44036f66b94858449705b81c6120ab9bc4e122aaa66dc349e75d24d936cec7c7&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466RU3COOS6%2F20260117%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260117T181556Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEKD%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIB0KN868aYeKO1vaQb38bCh7esd36OkoLeChGEs2TNoUAiBOkVrsrW0b3F%2BLxl4IhQItYRkUgqvegNPmCrAzLnO7VCr%2FAwhpEAAaDDYzNzQyMzE4MzgwNSIMQ7dE7QcST%2BO%2B21yGKtwDOsZLvAFHsgl7xfpF0cV6sUXfXAh9hOov3npej8uTDdFB7g6PKbD8%2B1fUUT5dxFDDqX9kI53AalZT1qsrcUBdFRFFDDvmLGDvJRkoB0BSWjZl8HzHrBRkf0O%2BwQi2NPX9D2L4LLk3mdvR3QSsQJNLMLnlm4Ktecz0vMywblMhlDKFxk18MA9Bp9uNriaLuyysKaiUa1S52ieHPAeqSIENh%2FOTievw8D2SnAgQ9vRaTwrOSNn46vkqkyBzyxs41nQVHeVxGS2N9skZxHpsvsSPhdCRHeWFcL1ChfQQnW3HEF4A55ppM9QPoBUVAauIHDGCOMmTkzu6KY1RdnNyQt4%2FwdiJa2p6qFkUB3qT0xYf1fcwWwyYkINJyvcYQELzQaZ6ecseW7rlWbI11d5aAR5GHI2WRcAQ%2FKgwZ3I1FXhF757gAg5%2BnDL6NHS8Mhl9nLzTEY2nf%2BOhY38BEuxD5iDe7Y2B9r%2B%2Bsq4IzFpZEMDoWXCbGNcSDdfy%2BHiFiOVMfcxL05N9b3aO4pXAhxGEQnvnXsNT62W00CKKJPQy6CIxpaGv3P5toQFYdKKJcloeCQsDf0pOwDbelb8BhP3xwQO0pr4Rl4r2bwYw0MwK6Qg1f871DGDGGdaM8YDjAE8wyemuywY6pgFxVOTUE09aj6ZgogJMV1R8joR6MEBSlLrKMazS7yzpYKTuBvxZncJ0pTT1uPP%2FoBv9u69h0PVcVxMRX1a%2B5TkaRos0WodEPBCAR5Rwnf8eeCDkhSHOOTrKqlW4q%2BSEISXq%2BGLGrTa4AD9vbk5uWdQZiNlf1EeJWrCyUt6boFWZshMqvP7RIxnc92gLWaVjH91W%2BDW5OmgQKvpr%2F1JkNNxyj7LhIDaD&X-Amz-Signature=5277786052f4b620beb9f76dec163067cc6240a2b97cf5a7240cb69b18b2ee30&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

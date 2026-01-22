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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466VK6SRXTT%2F20260122%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260122T181826Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEBoaCXVzLXdlc3QtMiJIMEYCIQCN2GHubd2bdEYptw8rxD1%2FG1if2M%2BftyxJp9DnOiTGBgIhAIISZIu2DhtlAdFoUBT5GgFLOKeaEnWunzsm7iEgEU36KogECOP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1Igy80NfVpChG9OPTL7Aq3AM0obEpBQBJ9syl4XtcQjtZfZ30sEXr3fP38HTyNDCw%2BrbTWIOfJd47YMANaqVCWneSMg9e%2FcMZgVTzKL1dWBIDHaZIRrKXDNwj23xhOqW4jA1EEXqqXqxbTq3s7YDwWWZAq8SFN8%2BsHe%2FQbcfTJuYcVaMIaUKdBRof%2Bsn7FU28D%2F2dvnyZhwIAjc07Un4oGlfTeyT1PNmiDxERL7nDoO%2FZHAsnwP6FL2Yd74AtgvhOc4HIvYEhER1IhdhRGhPGeSE2knC%2BjhQQLoaTnzPpEbCoA6fwfg4TBAARPrW%2Fx49bKWCYrW1GMoo97lznnyXo3mqJ%2FlVaJA2WXTSg22caam21MZ1vCjZ4lo8BUD07EDfeqodJP3yQ9CwHfwAmKiMPXhzCw0rRw7a1Hg756OhlYiVFIVp9pPB%2BnWIfK5rAmq3%2BAH%2FTSWaZhu%2B2%2FgKrB%2BfThe09WFnFx2BsW%2FuOgZJ2ibLVpnkjLfsniMGvEQvAhfeA%2FCfOs6Uwf4QTi2hNoVRNvSmlL9CQDI%2BhBaN3oGLtUdqfWxYRBmHdc1sMkeXZZBwWqYFjeh9IYOPgJ6U0XpmNK8a0ts8O5WO9Ixbbil7ZVJyppft5BRBi%2Bb3%2BayQ9X1AZtApC95%2BKgDtk2J4QvjCyusnLBjqkAaMfWJAiPvR%2BRIEqHUCKVEdhnu%2F%2F%2BjsAz0jY6TVKS7wuZtxgz896DfOk6mLebmhWXsRNEeHSL7yzyWKQS9vhwMRX4psKIZyC%2FmXa4EYCFFEAe24oNUNCqhOGMqIXJB0ZuKRncYIT18UJKFu4pxl%2F5HZIK9dBmQ6pQHm%2Bf02vhk4answVtY4VPEzkNOg3vR2%2F5imv%2FHlNN2jT1OCPdk2oQ7drKlie&X-Amz-Signature=5522dfd26b04c5f7b97424220e0436990ee401404c69ad0ce2e68eb73bc83afb&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466VK6SRXTT%2F20260122%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260122T181826Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEBoaCXVzLXdlc3QtMiJIMEYCIQCN2GHubd2bdEYptw8rxD1%2FG1if2M%2BftyxJp9DnOiTGBgIhAIISZIu2DhtlAdFoUBT5GgFLOKeaEnWunzsm7iEgEU36KogECOP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1Igy80NfVpChG9OPTL7Aq3AM0obEpBQBJ9syl4XtcQjtZfZ30sEXr3fP38HTyNDCw%2BrbTWIOfJd47YMANaqVCWneSMg9e%2FcMZgVTzKL1dWBIDHaZIRrKXDNwj23xhOqW4jA1EEXqqXqxbTq3s7YDwWWZAq8SFN8%2BsHe%2FQbcfTJuYcVaMIaUKdBRof%2Bsn7FU28D%2F2dvnyZhwIAjc07Un4oGlfTeyT1PNmiDxERL7nDoO%2FZHAsnwP6FL2Yd74AtgvhOc4HIvYEhER1IhdhRGhPGeSE2knC%2BjhQQLoaTnzPpEbCoA6fwfg4TBAARPrW%2Fx49bKWCYrW1GMoo97lznnyXo3mqJ%2FlVaJA2WXTSg22caam21MZ1vCjZ4lo8BUD07EDfeqodJP3yQ9CwHfwAmKiMPXhzCw0rRw7a1Hg756OhlYiVFIVp9pPB%2BnWIfK5rAmq3%2BAH%2FTSWaZhu%2B2%2FgKrB%2BfThe09WFnFx2BsW%2FuOgZJ2ibLVpnkjLfsniMGvEQvAhfeA%2FCfOs6Uwf4QTi2hNoVRNvSmlL9CQDI%2BhBaN3oGLtUdqfWxYRBmHdc1sMkeXZZBwWqYFjeh9IYOPgJ6U0XpmNK8a0ts8O5WO9Ixbbil7ZVJyppft5BRBi%2Bb3%2BayQ9X1AZtApC95%2BKgDtk2J4QvjCyusnLBjqkAaMfWJAiPvR%2BRIEqHUCKVEdhnu%2F%2F%2BjsAz0jY6TVKS7wuZtxgz896DfOk6mLebmhWXsRNEeHSL7yzyWKQS9vhwMRX4psKIZyC%2FmXa4EYCFFEAe24oNUNCqhOGMqIXJB0ZuKRncYIT18UJKFu4pxl%2F5HZIK9dBmQ6pQHm%2Bf02vhk4answVtY4VPEzkNOg3vR2%2F5imv%2FHlNN2jT1OCPdk2oQ7drKlie&X-Amz-Signature=4d2098be0d7ba92b5e2d5a1dd03ae0bbb9c20db6769d7cf4106a843497260aad&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

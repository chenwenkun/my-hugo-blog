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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4664TNHWN3F%2F20260225%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260225T065111Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjED4aCXVzLXdlc3QtMiJHMEUCIQDZbXcR2RsenbkpNEnNA404C3EZXXlRogqz81MR02CtUAIgIe2EagKyg6siVyDC%2FTHbWapkUmdaZVE8kRq2GfTVz3Uq%2FwMIBxAAGgw2Mzc0MjMxODM4MDUiDJdEvpDyo3Z6%2BDf6xircA20EP1cQNobAV9xrCjxpvjk6NALMnIq9VyQIZUONdfew8fTJKMBk%2FRX4J1DagMJKeysac%2BhuyLVH3n7eZtdBk8YDWUky%2BJFOQiafuVNbUcCaetq7Kao5F4gxbi1yZf8Hf5Bk25oxkVmkSLooC0yHOymbw7euM%2F%2Fyf8jk2tenEor7JyKN3OpVd4eGeGaC038zkXplNvOTjwdUS0sQ6j%2BsWv%2FstZ7dv5XeJ9IiRfsYDsKaX8dcqEV41oB5ZbEOJvCve%2FJtY0aNibLWUfnvRwOi0RuZq0RXLKj9Zqcy8oQXT%2FJpIfQAOVzNEH3eGT6xaKQFAFK7aurwkvZxtcL8azFqmUmbJbXH4Em4vwmAb8Ynm6aS9izR1tNBbzQeiRCsF9Snwom99v8kL5aYG7kC1I6TBSf2wB3v4wLA9BL144MJOqk6spqvgFwaz64MIecw5WRFldJ%2FGe4ALHq2TIgAJWvJ3sT6asd%2BRG9jEBCbfbJ5c9%2BmnUTUOmJYBGeSHeCLT2KplpUdQ%2BJX0EkuLYr8dpk5qcrITiMJdMRJjYc7mYhHO0cMtDG6A0OPWBZyq0bycE02sDOK5zYqRXTehMbeI9C8izT49TynOWAiTxCRQ62Wn539vwpQNiVd6X4uu7PlMOeg%2BswGOqUBvc4W4%2FH1CddUGsVFhG2%2F%2FjT5HV7cXf%2BVscI6Sst8P7Fzn2z8%2BV9guoarojWcuk%2F%2FWSwUApKqlI4%2BMk9EE07nZcv0%2FZ%2BRxO0cOspYcI7osssr3odANJmD3Pi8Q7WYb%2Fp%2FSstuYzIQM70ksQBIuBbWAFpXre7JbPnXXqmud09VVg3XUWuzo2yxSulayliX0biVIFb4OnubdPPgoTcEoVB9b%2F3cMS4u&X-Amz-Signature=53e7e16fa23e466bc5f4322ef129734ce086f49bdddb26c0be01e5b4169ab637&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4664TNHWN3F%2F20260225%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260225T065111Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjED4aCXVzLXdlc3QtMiJHMEUCIQDZbXcR2RsenbkpNEnNA404C3EZXXlRogqz81MR02CtUAIgIe2EagKyg6siVyDC%2FTHbWapkUmdaZVE8kRq2GfTVz3Uq%2FwMIBxAAGgw2Mzc0MjMxODM4MDUiDJdEvpDyo3Z6%2BDf6xircA20EP1cQNobAV9xrCjxpvjk6NALMnIq9VyQIZUONdfew8fTJKMBk%2FRX4J1DagMJKeysac%2BhuyLVH3n7eZtdBk8YDWUky%2BJFOQiafuVNbUcCaetq7Kao5F4gxbi1yZf8Hf5Bk25oxkVmkSLooC0yHOymbw7euM%2F%2Fyf8jk2tenEor7JyKN3OpVd4eGeGaC038zkXplNvOTjwdUS0sQ6j%2BsWv%2FstZ7dv5XeJ9IiRfsYDsKaX8dcqEV41oB5ZbEOJvCve%2FJtY0aNibLWUfnvRwOi0RuZq0RXLKj9Zqcy8oQXT%2FJpIfQAOVzNEH3eGT6xaKQFAFK7aurwkvZxtcL8azFqmUmbJbXH4Em4vwmAb8Ynm6aS9izR1tNBbzQeiRCsF9Snwom99v8kL5aYG7kC1I6TBSf2wB3v4wLA9BL144MJOqk6spqvgFwaz64MIecw5WRFldJ%2FGe4ALHq2TIgAJWvJ3sT6asd%2BRG9jEBCbfbJ5c9%2BmnUTUOmJYBGeSHeCLT2KplpUdQ%2BJX0EkuLYr8dpk5qcrITiMJdMRJjYc7mYhHO0cMtDG6A0OPWBZyq0bycE02sDOK5zYqRXTehMbeI9C8izT49TynOWAiTxCRQ62Wn539vwpQNiVd6X4uu7PlMOeg%2BswGOqUBvc4W4%2FH1CddUGsVFhG2%2F%2FjT5HV7cXf%2BVscI6Sst8P7Fzn2z8%2BV9guoarojWcuk%2F%2FWSwUApKqlI4%2BMk9EE07nZcv0%2FZ%2BRxO0cOspYcI7osssr3odANJmD3Pi8Q7WYb%2Fp%2FSstuYzIQM70ksQBIuBbWAFpXre7JbPnXXqmud09VVg3XUWuzo2yxSulayliX0biVIFb4OnubdPPgoTcEoVB9b%2F3cMS4u&X-Amz-Signature=956c54cdf2d9a0f0c76b6394bf5b66e679f3c128bf99ad78b5e960ea9c1aef55&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

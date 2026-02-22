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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4664KSZTTFE%2F20260222%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260222T122603Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEPf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIAG1kJ86N5NImlNrwXBSwQCDSPevnMCLj3lJ9myb2AcZAiBmC4ZxW8GFVptqJhxvexvMqLSNhZYBnIDXCgu9%2FFG1GiqIBAjA%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMoGlgzpqwvNNJuTYiKtwDzzy5H1r2H3wWGn78NtxfTuB0jlcgKWkm%2FmF89g7B%2BCR8%2FJkuU9g9Jougo%2ByTPPwOg%2FeJ7kGKRxQ2jeI32tx02fuojxapOeofXLLcwx%2BKlP2gBGOicLBXNGo79JJbRoR%2FoEyUXlygVv5Z5Qkb8EAhpi6u1JZKFaDHFvCBPExcZpvNWVWc4sClI2h%2FYqZMkD8mSHsufhkMvT2ncHgXlBJo73nQQ5itM5ADG6DpYCAtfOIMBXotPO7yK1EClvQOrHCUQcPz1nKzRF5HWJA5f9yHqlk6%2FC40pMC8jPMkSRWNaT%2Bp5NJ0%2F3MGo%2FJBpCFwUDTyyTp%2BIe%2BxlVtiIlbId1Sb2X%2Bv2CC8FuQ9H5nurRBJ%2Fc5a6MKN%2BOgUzuT6TsDokeizrdciGmjx3gOGON7gazDvuUS%2Fq5CTJqGVZbxyK9O8n6WbCC1QwFWKptnFEEcjoYTO2%2BKK3eEg04aaG1SdSMBA1Gl9nYFA3RlfqJoCWBslHu7XBaVlr9qjxtQVYpkK11Ze%2BnIK4D%2BcpRS2EzgN%2FUU3Ip4OXGqS3tjUzU%2BvDOq8SZhRGvi5uqnj45jqWdqLK9Ouyy00RZIb1l%2BI6btyhdTiValg1cm2hwE8RtAbZaSmfdm64vVUnGoU5e3VbpEw2cXqzAY6pgFeKuTJr4NvXrkm22vRLRXsiLMD9soc4UZ87vmcvnr4J6dOg5pZvLcdNgRzG8LDZn99KGoOiG7WmAzY8iupgnhiH3PSvnlGOeggPy9z0SbGUeVPN0cN875OA%2F8ztVVrKagIBaawE6LSszIUfQa3JvdzJc4RX2oEpe42YF8ZQ9L2zGRimoAunNBVnhv4kFWaFIQPl%2Fx3vSnHT5JAg7ZwLCh5nNXQsTth&X-Amz-Signature=e9270bdc8897a23c30d727d64eca86b7f2cbb2b0ca408425364a0f6442c2d5c0&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4664KSZTTFE%2F20260222%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260222T122603Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEPf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIAG1kJ86N5NImlNrwXBSwQCDSPevnMCLj3lJ9myb2AcZAiBmC4ZxW8GFVptqJhxvexvMqLSNhZYBnIDXCgu9%2FFG1GiqIBAjA%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMoGlgzpqwvNNJuTYiKtwDzzy5H1r2H3wWGn78NtxfTuB0jlcgKWkm%2FmF89g7B%2BCR8%2FJkuU9g9Jougo%2ByTPPwOg%2FeJ7kGKRxQ2jeI32tx02fuojxapOeofXLLcwx%2BKlP2gBGOicLBXNGo79JJbRoR%2FoEyUXlygVv5Z5Qkb8EAhpi6u1JZKFaDHFvCBPExcZpvNWVWc4sClI2h%2FYqZMkD8mSHsufhkMvT2ncHgXlBJo73nQQ5itM5ADG6DpYCAtfOIMBXotPO7yK1EClvQOrHCUQcPz1nKzRF5HWJA5f9yHqlk6%2FC40pMC8jPMkSRWNaT%2Bp5NJ0%2F3MGo%2FJBpCFwUDTyyTp%2BIe%2BxlVtiIlbId1Sb2X%2Bv2CC8FuQ9H5nurRBJ%2Fc5a6MKN%2BOgUzuT6TsDokeizrdciGmjx3gOGON7gazDvuUS%2Fq5CTJqGVZbxyK9O8n6WbCC1QwFWKptnFEEcjoYTO2%2BKK3eEg04aaG1SdSMBA1Gl9nYFA3RlfqJoCWBslHu7XBaVlr9qjxtQVYpkK11Ze%2BnIK4D%2BcpRS2EzgN%2FUU3Ip4OXGqS3tjUzU%2BvDOq8SZhRGvi5uqnj45jqWdqLK9Ouyy00RZIb1l%2BI6btyhdTiValg1cm2hwE8RtAbZaSmfdm64vVUnGoU5e3VbpEw2cXqzAY6pgFeKuTJr4NvXrkm22vRLRXsiLMD9soc4UZ87vmcvnr4J6dOg5pZvLcdNgRzG8LDZn99KGoOiG7WmAzY8iupgnhiH3PSvnlGOeggPy9z0SbGUeVPN0cN875OA%2F8ztVVrKagIBaawE6LSszIUfQa3JvdzJc4RX2oEpe42YF8ZQ9L2zGRimoAunNBVnhv4kFWaFIQPl%2Fx3vSnHT5JAg7ZwLCh5nNXQsTth&X-Amz-Signature=c9a2fbb86487d14000e4b9460d7d12aa847068201248b87f58bc18a6bd256fc4&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466VUCFOCEP%2F20260630%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260630T135354Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEPv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIE7J1erQYJHfF4L9qcuayrLNezymOCDJBgdi5jOcNeR%2BAiB%2B9lbGC7KKqC67Gp6xHLgjfZByBnUhRFoWGih%2B8dwxjCqIBAjE%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMyL9iJ8GsWKpF3k0pKtwD7q%2ByKvpg%2Bz%2F42Jm57%2FBuDDUgxN%2BQTxBfB6xrq1nfpO%2B79H9p2rg9lOWFi5ZHoyaSSkvStfLraB3c9uW64r7mb9ppgGM%2Bj5xJrbPSzcTK6t%2F9shS4Vp28q9NbsTISN8c6PPteRp545npudjTjvBe2PtT5HYh0IeG6pIRSe31i33zyce3MEJjo6COSs58ggN%2BgrCjaPU1Fjcnye6BYJcs4aUrl2BHyddtnbR%2FNtldTYvfAm0tHrZOlnlZ6Wht1pola5GEoi6542H1P%2BA8%2FhLKwhSCAOrtCcrspBdo0ZARaevFNMGguPRvOhTXb4CThp6QnUxW8TL3k5FjHe4848cEFKEuK0Di0a8MJwVhHR7e9NOeQKS3RDlA0GfJMxYa5kLMsDQnW2YZPZeDczVCmIZ1VZFp6GPaxbeWuyUZc%2F7g49IXy3EC4IDfthuUZ57TXNqeWZtaQzTMtTToUIFlY3474Dc2m3paV2LFHbDNYSnLwUGyTTKEbQKqOIEXNvukFE6svoag4lvOe2dXk6YuVtijkbwBwiKJg2h%2BS1CA7kaQfxy633bIqKoQiZQbwR0sycoV0wDKFvta2LVhFqOKt3eGvNp45MoWU1XOaLFjeobE8riNgncheYLWt5GV%2Bw1swjLmO0gY6pgGEFF2Sl1Fe7f24TDpHTuPimVGE%2FfywA2tt87MlyVsFscC1DIy9ak6lgQDh5xZglN%2BCzeb3i5IR6z5tiFUKR7T29sEAroeaTAXnHRis%2BIbqxTm%2Fpe2xa91zVjjzwHlRakuhxHA%2FtkMUc%2FEbTnQ8wSZAU%2FtK976zTu2VNYfxMTsFPFSON3VYKkdRIu3G83NdQMHFjtQx%2FwhDT2YidOqpcFpcEfa1g6xg&X-Amz-Signature=acaa3bf3395395bb1c85b13a79dac1c7324e20e819bfa250eb348781ccf4a137&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466VUCFOCEP%2F20260630%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260630T135354Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEPv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIE7J1erQYJHfF4L9qcuayrLNezymOCDJBgdi5jOcNeR%2BAiB%2B9lbGC7KKqC67Gp6xHLgjfZByBnUhRFoWGih%2B8dwxjCqIBAjE%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMyL9iJ8GsWKpF3k0pKtwD7q%2ByKvpg%2Bz%2F42Jm57%2FBuDDUgxN%2BQTxBfB6xrq1nfpO%2B79H9p2rg9lOWFi5ZHoyaSSkvStfLraB3c9uW64r7mb9ppgGM%2Bj5xJrbPSzcTK6t%2F9shS4Vp28q9NbsTISN8c6PPteRp545npudjTjvBe2PtT5HYh0IeG6pIRSe31i33zyce3MEJjo6COSs58ggN%2BgrCjaPU1Fjcnye6BYJcs4aUrl2BHyddtnbR%2FNtldTYvfAm0tHrZOlnlZ6Wht1pola5GEoi6542H1P%2BA8%2FhLKwhSCAOrtCcrspBdo0ZARaevFNMGguPRvOhTXb4CThp6QnUxW8TL3k5FjHe4848cEFKEuK0Di0a8MJwVhHR7e9NOeQKS3RDlA0GfJMxYa5kLMsDQnW2YZPZeDczVCmIZ1VZFp6GPaxbeWuyUZc%2F7g49IXy3EC4IDfthuUZ57TXNqeWZtaQzTMtTToUIFlY3474Dc2m3paV2LFHbDNYSnLwUGyTTKEbQKqOIEXNvukFE6svoag4lvOe2dXk6YuVtijkbwBwiKJg2h%2BS1CA7kaQfxy633bIqKoQiZQbwR0sycoV0wDKFvta2LVhFqOKt3eGvNp45MoWU1XOaLFjeobE8riNgncheYLWt5GV%2Bw1swjLmO0gY6pgGEFF2Sl1Fe7f24TDpHTuPimVGE%2FfywA2tt87MlyVsFscC1DIy9ak6lgQDh5xZglN%2BCzeb3i5IR6z5tiFUKR7T29sEAroeaTAXnHRis%2BIbqxTm%2Fpe2xa91zVjjzwHlRakuhxHA%2FtkMUc%2FEbTnQ8wSZAU%2FtK976zTu2VNYfxMTsFPFSON3VYKkdRIu3G83NdQMHFjtQx%2FwhDT2YidOqpcFpcEfa1g6xg&X-Amz-Signature=2411ef637dd0f783bc12a07c2a027f6805e4b4b16fcbeb64961e45239c799787&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

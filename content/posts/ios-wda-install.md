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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466YPK7Z5LR%2F20260621%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260621T093409Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEB4aCXVzLXdlc3QtMiJIMEYCIQDdKUY6UsXho6TBoJ%2FiKedxEG8GECQfIRR2Hao4pyzx1QIhAIm0J%2BTxr5FNGQjUlUwCgvVBb1NEzIm7DYD6A7QUeOlTKogECOf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgybVNF9w1qAvTPcI9wq3AMp6ccyMDyaO2U3m2Jxkxp7s6hBhx18XODeK9S%2FotQMS2MT13pys8iE0pG%2FXlaYmbHGMtNFcUM9tBy%2BYyjU%2FXPZCP2BbufpFJ9%2B%2FRTxPdXzTYbKt6WkUUWf3%2Fpy5884Lf3xSzwrI%2B3imo0auOWUUAJvzOHdY9KhGrP1PQtlA8HZQ256XBnLyviCsg14t%2BPwzBVk34jFXjeN7KpodecLR%2Bn90xsmhueAiuh7YAaa6%2BwfkQvF4UHfHFbVC1Wd9YxIuxDiaR5oUCbPJtlnF2MtsvLfe2%2FtbcPA0V5mqrbADAB4nD%2BIoTVZdE3Fq7nj7JSZSwKF%2F%2BI%2Bl0eB3Qtj2z0D3mPUAIk5PmcHSLNpSxGw251g5aBOyGoqaYZi5dxKl7rDxLNC8QxNe4crqYJ42TZT9paDBrpcBfNeO8rNzE4INhQRV4KCCn3FreZz%2FNzeyiL9EglAfRePqBs6PlIUG7MML50jcdu02acUG6AY5LY%2F2kXuhrBiNTsZukrTrxTtvnmEv%2By6%2Bs9ISRaai1%2BzX416fBvbTGsUBF8Wf2lV7SkPWdG4hglT7fm2OAAIRorF5p0uJ690CaIurWuR737Y5LnGC%2FbuLNqII29b0L3D3H4%2FebLYgPrcmm44zYeGBdn%2ByjC2gd7RBjqkAehnC0lDbuGfhp4D6N%2Fwnt1juXriZVH21qBErfJS%2FlYBkiD9ZiihG3sQTbB3H3oMZThyTK9DGYPx5q1a20A4i2KYuQ25sclkY3F68NAVkpU3wgFynR2R7tm7wxFvmoFr8h9gtS825NH5I05los5KxkfzONdCr5hWa%2BHolnIwiwAo3MxZOs83HbSMveD%2B3LE5FUtddwbcsG9bihotIX7ckhRRg72c&X-Amz-Signature=81ceb1f7003ab54d998721fe01e60eaf9d293370a6c5d1892f2ce145dce8ee1c&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466YPK7Z5LR%2F20260621%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260621T093409Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEB4aCXVzLXdlc3QtMiJIMEYCIQDdKUY6UsXho6TBoJ%2FiKedxEG8GECQfIRR2Hao4pyzx1QIhAIm0J%2BTxr5FNGQjUlUwCgvVBb1NEzIm7DYD6A7QUeOlTKogECOf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgybVNF9w1qAvTPcI9wq3AMp6ccyMDyaO2U3m2Jxkxp7s6hBhx18XODeK9S%2FotQMS2MT13pys8iE0pG%2FXlaYmbHGMtNFcUM9tBy%2BYyjU%2FXPZCP2BbufpFJ9%2B%2FRTxPdXzTYbKt6WkUUWf3%2Fpy5884Lf3xSzwrI%2B3imo0auOWUUAJvzOHdY9KhGrP1PQtlA8HZQ256XBnLyviCsg14t%2BPwzBVk34jFXjeN7KpodecLR%2Bn90xsmhueAiuh7YAaa6%2BwfkQvF4UHfHFbVC1Wd9YxIuxDiaR5oUCbPJtlnF2MtsvLfe2%2FtbcPA0V5mqrbADAB4nD%2BIoTVZdE3Fq7nj7JSZSwKF%2F%2BI%2Bl0eB3Qtj2z0D3mPUAIk5PmcHSLNpSxGw251g5aBOyGoqaYZi5dxKl7rDxLNC8QxNe4crqYJ42TZT9paDBrpcBfNeO8rNzE4INhQRV4KCCn3FreZz%2FNzeyiL9EglAfRePqBs6PlIUG7MML50jcdu02acUG6AY5LY%2F2kXuhrBiNTsZukrTrxTtvnmEv%2By6%2Bs9ISRaai1%2BzX416fBvbTGsUBF8Wf2lV7SkPWdG4hglT7fm2OAAIRorF5p0uJ690CaIurWuR737Y5LnGC%2FbuLNqII29b0L3D3H4%2FebLYgPrcmm44zYeGBdn%2ByjC2gd7RBjqkAehnC0lDbuGfhp4D6N%2Fwnt1juXriZVH21qBErfJS%2FlYBkiD9ZiihG3sQTbB3H3oMZThyTK9DGYPx5q1a20A4i2KYuQ25sclkY3F68NAVkpU3wgFynR2R7tm7wxFvmoFr8h9gtS825NH5I05los5KxkfzONdCr5hWa%2BHolnIwiwAo3MxZOs83HbSMveD%2B3LE5FUtddwbcsG9bihotIX7ckhRRg72c&X-Amz-Signature=ee7f75802a32ba3df1bb8964a7b2212eba632576d7e6253ea8c1e1cde55f28ca&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

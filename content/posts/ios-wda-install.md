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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4666KNKOTWK%2F20260417%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260417T184237Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEBMaCXVzLXdlc3QtMiJGMEQCICvudDxcPacFupOKgTmnjlazLrUtZmYbFHGkmPFMxQGZAiApOT71tpxnJ2MXTKXbV134Ojj2ID0EfKDbw%2FMpDx71TyqIBAjc%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMeXsZle0VBRuxqYMaKtwDDqqpK91Jvd7iNBbvC2Xljm17x8RjUQxrbGE9B7UV5tQcUX7Q9q%2FXJvKLga35imVnAIOAblo7DJe8etYKd1TmXVuHWKEEUsJXi6uNge1%2BQFXcKaL9w1hle7Ac9erNSzRL3ilZBPIbOectGiAOIeN%2Bs3DB91D9CA2aEy%2BHR4fxi7kCzi2XjEoAo3mO1id2vBZXLSZxnbXOummc9g2%2FqZygE63Nv8o2u0E6HPDMwW3USBR%2BBQGfiSyrp3aL0LLHDPZ3yoqlGsZoHRlPekrmMHq0JJS8UvOvR%2FU13JidDl4OU20aiKFU4cduH8qIH25TGsvpezbcUXDKFCecVYlOr9ymWYNuUJ3y4SuQpmaL2dXXiWeymGr%2BNnJTSjcZCJBOt1X6xmAjVXi%2ByQZOy1Xa2vRstrOQSZ9hY4qp5wWGnqEB5nG6ZSP3LM8q3BgIhRFmZc6p%2BvtqatVpRpam9E8iULPZXI1S11FODsXhHbi0QGn%2BGIIcxEx2r3dFqGvOOTOLMvfbLZ5Es8yovUwsEYMm4Z%2F3XqxGOWx%2F37xXa3fADmu7OK4OpNB%2BPTCb6YsELpIAKXPIFeh1hQTEIuAhZeD9VRADcIfhW3IhK34IC5KiviVH0qCczWQ0Q4Y3nnBui7ww6%2FiJzwY6pgFNQZgCb559ilbv9495V1kMSDO11bRaL%2B%2F9DyJvO%2BX9En62AOsZYiXdWHAxNHdlaz4KMqcN2zmYVBf2U0OWSzL%2FEpnuLJEYR00vdg39gsFaLOUVC2TuGnld1zgND%2F0Wrf576GqvsVvx7%2BqmL1vbRtftCGqDDzkZTxArPIrho2USk1MedT%2FVeX%2BZV1I51ck8bu4vWJwx6vuijnQePvh1cpDxBzosCTif&X-Amz-Signature=b53df91bc04e88714bff47d26da7df71a351960f53e50ab226c0e57418e2ef42&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4666KNKOTWK%2F20260417%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260417T184237Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEBMaCXVzLXdlc3QtMiJGMEQCICvudDxcPacFupOKgTmnjlazLrUtZmYbFHGkmPFMxQGZAiApOT71tpxnJ2MXTKXbV134Ojj2ID0EfKDbw%2FMpDx71TyqIBAjc%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMeXsZle0VBRuxqYMaKtwDDqqpK91Jvd7iNBbvC2Xljm17x8RjUQxrbGE9B7UV5tQcUX7Q9q%2FXJvKLga35imVnAIOAblo7DJe8etYKd1TmXVuHWKEEUsJXi6uNge1%2BQFXcKaL9w1hle7Ac9erNSzRL3ilZBPIbOectGiAOIeN%2Bs3DB91D9CA2aEy%2BHR4fxi7kCzi2XjEoAo3mO1id2vBZXLSZxnbXOummc9g2%2FqZygE63Nv8o2u0E6HPDMwW3USBR%2BBQGfiSyrp3aL0LLHDPZ3yoqlGsZoHRlPekrmMHq0JJS8UvOvR%2FU13JidDl4OU20aiKFU4cduH8qIH25TGsvpezbcUXDKFCecVYlOr9ymWYNuUJ3y4SuQpmaL2dXXiWeymGr%2BNnJTSjcZCJBOt1X6xmAjVXi%2ByQZOy1Xa2vRstrOQSZ9hY4qp5wWGnqEB5nG6ZSP3LM8q3BgIhRFmZc6p%2BvtqatVpRpam9E8iULPZXI1S11FODsXhHbi0QGn%2BGIIcxEx2r3dFqGvOOTOLMvfbLZ5Es8yovUwsEYMm4Z%2F3XqxGOWx%2F37xXa3fADmu7OK4OpNB%2BPTCb6YsELpIAKXPIFeh1hQTEIuAhZeD9VRADcIfhW3IhK34IC5KiviVH0qCczWQ0Q4Y3nnBui7ww6%2FiJzwY6pgFNQZgCb559ilbv9495V1kMSDO11bRaL%2B%2F9DyJvO%2BX9En62AOsZYiXdWHAxNHdlaz4KMqcN2zmYVBf2U0OWSzL%2FEpnuLJEYR00vdg39gsFaLOUVC2TuGnld1zgND%2F0Wrf576GqvsVvx7%2BqmL1vbRtftCGqDDzkZTxArPIrho2USk1MedT%2FVeX%2BZV1I51ck8bu4vWJwx6vuijnQePvh1cpDxBzosCTif&X-Amz-Signature=7e300d91d9f4e0a65855f3fea88b2d639088bc159992b139ed78590b37f3dce8&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

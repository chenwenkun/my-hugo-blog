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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466YC7DBHDL%2F20251112%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251112T061735Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEGYaCXVzLXdlc3QtMiJIMEYCIQCpAoYNUrXkzDi%2BSnQNUzmeRnqGvZBu2NXyRT2QEgqa4AIhAK%2F%2BxCORFHtRYH7ClEKyRhS0q92mTHsl%2Be9jhdrJxupPKv8DCC8QABoMNjM3NDIzMTgzODA1IgxMxxXdBRDKkmxQ9gAq3ANwJt5dAO1sAVma5c9C4sTf4PX%2BXPzAXWWvcGzMaXZJY9dHCpPar%2Bp2crVWY5i39bsTDZdzhJQQI6BblOlh8U1qm%2FnGIMYOzO66CrYEUPrxLwu%2FJYczX%2BKE37PMsr2ZiyvQqPPyAZQg8IafvyO%2FeD7IM1qaEF5AYOMnkNLvwQaifxH7B%2FcI21%2Bsk3l8T8bfbwEGXC0EIFiWBGEOQIcBfPPuPvjNgAxAiiDrHLFWE33MpfzXhRR0mwT22gAYXBDbGJ6kV5vH2a4aR6FkyOLPqdZmnyFe4DYdO%2Ff9Ha%2BsGazXi%2Fuhum4e1SyBaVt%2Byxo4h8%2BTAMSVDv3zGIkM2uUPYonm7hfZqHE1UFUINeuVPc8Xi4dnQX5IaFUEkEW8YRtc0edLg5Q0Pdb5DJ9A2%2FAxR4wcaaPnf5bl7uGVAV4XGwGzU2AbDBh9axbCyT4pY4Dri0gbTSHNaW0JQM7ix%2BBRVUAfMpmuedpx5%2FLAuL3fJ1zKtgE%2Bxp9FpTUqjlGLSAVE%2BoN2G69I%2BOC%2F4bbuaZfPUi3mQX6Z%2FrNXesgkR%2FwG9QeyBebKzMlaNJkNBVvnbfAIvsBjPn%2B1hl9Yy%2BRyaXgeVtTI53Pw%2B5diiw298EDSWveIJFlco0z%2Bi4C%2F44ji3DD1xtDIBjqkAbiMECjIv52jf4UzZ5DR7lDEFX4k%2FDDb%2FiykPQYv%2FLamwv%2FwbVw5RjlqC4xX6%2B%2FIzbYj9CPb89xne%2B4wsO7NOGFTOSK7t9OB6rYztfWiqUKsobHSr8CIj50Od2NM%2BhrEQmiHa9gL%2BHCIeHVPf6p9AcafEUc54hLoHELx5eTfbGyzTWGiyegsid%2BPrlwt%2F8I5NvnGpDB%2BeW1BsNWUh6f3vkPt1b3O&X-Amz-Signature=0fae9991525241b2f43b5957657eb5f93c4a44ff4fbfc6ef796ccfdcec5c7ad8&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466YC7DBHDL%2F20251112%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251112T061735Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEGYaCXVzLXdlc3QtMiJIMEYCIQCpAoYNUrXkzDi%2BSnQNUzmeRnqGvZBu2NXyRT2QEgqa4AIhAK%2F%2BxCORFHtRYH7ClEKyRhS0q92mTHsl%2Be9jhdrJxupPKv8DCC8QABoMNjM3NDIzMTgzODA1IgxMxxXdBRDKkmxQ9gAq3ANwJt5dAO1sAVma5c9C4sTf4PX%2BXPzAXWWvcGzMaXZJY9dHCpPar%2Bp2crVWY5i39bsTDZdzhJQQI6BblOlh8U1qm%2FnGIMYOzO66CrYEUPrxLwu%2FJYczX%2BKE37PMsr2ZiyvQqPPyAZQg8IafvyO%2FeD7IM1qaEF5AYOMnkNLvwQaifxH7B%2FcI21%2Bsk3l8T8bfbwEGXC0EIFiWBGEOQIcBfPPuPvjNgAxAiiDrHLFWE33MpfzXhRR0mwT22gAYXBDbGJ6kV5vH2a4aR6FkyOLPqdZmnyFe4DYdO%2Ff9Ha%2BsGazXi%2Fuhum4e1SyBaVt%2Byxo4h8%2BTAMSVDv3zGIkM2uUPYonm7hfZqHE1UFUINeuVPc8Xi4dnQX5IaFUEkEW8YRtc0edLg5Q0Pdb5DJ9A2%2FAxR4wcaaPnf5bl7uGVAV4XGwGzU2AbDBh9axbCyT4pY4Dri0gbTSHNaW0JQM7ix%2BBRVUAfMpmuedpx5%2FLAuL3fJ1zKtgE%2Bxp9FpTUqjlGLSAVE%2BoN2G69I%2BOC%2F4bbuaZfPUi3mQX6Z%2FrNXesgkR%2FwG9QeyBebKzMlaNJkNBVvnbfAIvsBjPn%2B1hl9Yy%2BRyaXgeVtTI53Pw%2B5diiw298EDSWveIJFlco0z%2Bi4C%2F44ji3DD1xtDIBjqkAbiMECjIv52jf4UzZ5DR7lDEFX4k%2FDDb%2FiykPQYv%2FLamwv%2FwbVw5RjlqC4xX6%2B%2FIzbYj9CPb89xne%2B4wsO7NOGFTOSK7t9OB6rYztfWiqUKsobHSr8CIj50Od2NM%2BhrEQmiHa9gL%2BHCIeHVPf6p9AcafEUc54hLoHELx5eTfbGyzTWGiyegsid%2BPrlwt%2F8I5NvnGpDB%2BeW1BsNWUh6f3vkPt1b3O&X-Amz-Signature=11297faf4047ecb8d901600fb8745e571862fdd44cfa33602d4f60013957fece&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

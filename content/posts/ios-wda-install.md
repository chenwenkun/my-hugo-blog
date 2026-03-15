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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB46677BQU5HU%2F20260315%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260315T064309Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEOn%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIFUcoNKwS%2BUHaT6VDssyfUMi77PNa4rg57Aza9RvzOiUAiEAmM2i%2BEhpcTjzXH2AXjufUch1ORpTfbfMN5V7Dp9r0yEqiAQIsv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDLPEBwm3mVe0PZ8XdyrcA9tItLTAs1yAvQ7wsUjVhbVffYM5AFgiS9F5gWZPTJb7JcSPpCsrDnxIKSkY9I7BZ0I1k3RUabGpOgXvBXih8y%2FyONgjKSkbKoJm2iW46rDstmJ7rwCC0%2FuN1ddz%2Bw1mX1USw%2FRZgLpWI6WSYmDh0lCfNZtl1MT3AIls8kw526kfOOWcerLY5fyu9%2BeDmGD%2BnoxhiwVTiFLFR9xZBblMQDGh78D7HswmIQ7lVDfE%2FNaL7%2BZXxG8XveZARcLrtXtdZ9LrcGMw1KEXAKC2WVIGa0XlDTSSQbISgZquH3054RjY%2BSYDBA%2F8CxwudJQbg06EfcrQVL0UBftvptHqhqZ9JZZDANRtkACz3WkVGYx3%2BqaxpoGulXtxDokvBeN3BJ%2Bc%2BH4lRrVUxgv6tGCQv8t18DHZyM0fFtPyHA8MRaQ9FvMdZ5CvIKo18HaPy2urkFMvljBqN0xEQboJ0MCFNC8KM2lDb%2FQSSI%2BIOWv%2BoZGJzVxFZAK3cGH2ZGFZlym0Zab2rzcDa%2FPHqIImgi5QQ5%2F5kH7yIlspDwTZ7IAFKKu9THdBqJ0elQq3f6QTUvTOJJnOLYmTeXQT1FhMsVRFCR2qzNoS5GQpnSiY9AHwYyeqKRpQmocO8R5hG6mdl1g2MIWQ2M0GOqUBqYSPkYsRY%2BdIt0PSMEr71VWA17%2Bo3hs1kOtLSBLXis1%2FIR1cIPSqwxD93OAU3XHbQ0IYIWNxh81oTGlGKmx3wA9GbzEhmvkPl2w3ARkITrDrHeUFuYcvuMt%2BZCg0di0FPEy3iqRg0VN7bXJHvSdekVYElEIxfTSKy95%2B3qPlATnULRW7SsZ5zhjG9RLE07Eosm5ptSUAfmumw8AB8YxY5vFqiUGw&X-Amz-Signature=41be10fe2c7ebb88a0521c1cccec57ee89b76d93b1ec708be27040a0262760b4&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB46677BQU5HU%2F20260315%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260315T064309Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEOn%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIFUcoNKwS%2BUHaT6VDssyfUMi77PNa4rg57Aza9RvzOiUAiEAmM2i%2BEhpcTjzXH2AXjufUch1ORpTfbfMN5V7Dp9r0yEqiAQIsv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDLPEBwm3mVe0PZ8XdyrcA9tItLTAs1yAvQ7wsUjVhbVffYM5AFgiS9F5gWZPTJb7JcSPpCsrDnxIKSkY9I7BZ0I1k3RUabGpOgXvBXih8y%2FyONgjKSkbKoJm2iW46rDstmJ7rwCC0%2FuN1ddz%2Bw1mX1USw%2FRZgLpWI6WSYmDh0lCfNZtl1MT3AIls8kw526kfOOWcerLY5fyu9%2BeDmGD%2BnoxhiwVTiFLFR9xZBblMQDGh78D7HswmIQ7lVDfE%2FNaL7%2BZXxG8XveZARcLrtXtdZ9LrcGMw1KEXAKC2WVIGa0XlDTSSQbISgZquH3054RjY%2BSYDBA%2F8CxwudJQbg06EfcrQVL0UBftvptHqhqZ9JZZDANRtkACz3WkVGYx3%2BqaxpoGulXtxDokvBeN3BJ%2Bc%2BH4lRrVUxgv6tGCQv8t18DHZyM0fFtPyHA8MRaQ9FvMdZ5CvIKo18HaPy2urkFMvljBqN0xEQboJ0MCFNC8KM2lDb%2FQSSI%2BIOWv%2BoZGJzVxFZAK3cGH2ZGFZlym0Zab2rzcDa%2FPHqIImgi5QQ5%2F5kH7yIlspDwTZ7IAFKKu9THdBqJ0elQq3f6QTUvTOJJnOLYmTeXQT1FhMsVRFCR2qzNoS5GQpnSiY9AHwYyeqKRpQmocO8R5hG6mdl1g2MIWQ2M0GOqUBqYSPkYsRY%2BdIt0PSMEr71VWA17%2Bo3hs1kOtLSBLXis1%2FIR1cIPSqwxD93OAU3XHbQ0IYIWNxh81oTGlGKmx3wA9GbzEhmvkPl2w3ARkITrDrHeUFuYcvuMt%2BZCg0di0FPEy3iqRg0VN7bXJHvSdekVYElEIxfTSKy95%2B3qPlATnULRW7SsZ5zhjG9RLE07Eosm5ptSUAfmumw8AB8YxY5vFqiUGw&X-Amz-Signature=dcdd29e5f2e6635d853f1cb1c9ba456104f3a107a8b59f5bd4f9b52897f69649&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

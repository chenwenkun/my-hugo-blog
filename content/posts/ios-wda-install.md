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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466WIGLOJ7K%2F20260517%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260517T125432Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjENz%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIB7BeTHy0ZF2KrQ5ddPUa7bAosgPFUzBBKK%2FAiXFjsKiAiADlr2xZ8rCXhMNR1w5X89I7uqYYSYfy4OZ%2Bw78EFBnnCqIBAil%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMmdbXwvR4OS0bZkBaKtwD0wRziHc1WAAgBABuFnFyNfG%2FwFTOI0sbFfMroR29uBM5MIeeCUNqgLLQlfYZXx22v9%2FEtlH8QT726YY5Ad3MOjjgSX7iXWjBG7chciL50ArWXEli8OkVqRcyBGAXBmfW8t7UzD3PVXL8KDfPVW4aaaifqXcWuWODfFH%2BGKw1fkUMADiHLDi3ilU2WP9kKICEToad2kp6Z2CP9%2BfMhzMgFF0xRwY1kyo7GyGvX%2BbqwNAedJHJUVW78xi8hfwlQmUcHvmTeIa7d0L0SxBN3x4ea%2F4JY6%2BG%2FnoXlknfV%2BcuDepQ3MxfmUs8IHic2ezV02lK50SYr7LwfqaQzxqeOYgG7Sl17dBzux9tx%2BCu%2BL1Hl0WO7EqVpaTMI0PMBGr7dl8pawzj%2FFDA1olcO4rNCnbmLq%2BiO5GK3m8LNpjwSIZ%2BcWqxmbXgDv0Fjvnnm4srwKlO1pupdWt0Cb7ONFdMgwIWgzph09VtmLBcYPAP1F6n%2B%2BYqLWIp5Zh94yO3fNOchWTdnpcjXt44FuX59UWRkLt%2BECb2OAWDtFA5V7NOsYbmQwd1a8NvsHfmV3sU7Mqs4IpuTmmEe6gPnvcgN5lzmZsJZBz0CC7OcsSFQWklCk61xeArqeZi3c9xyqVplG4w0sqm0AY6pgHFRzSJTXiOzO8rxibg0vVey%2FyjMDwKOibw7E%2FK7vcTPiPkjSE75Xg2duMoUghpZj04gLCoRplputN2fje%2F8CRRj7cdoh1RZ5M3wu%2Bavbf8VAKLd4VVeLXwuepaOcOilcMNNuWbSy3BxRKP1sxLVoP3ZVQaYbfyOoTc3pfqmtY0TGsYjptLiXcvZMliDYF3YN%2BpALPS5miWKO0kXmUSawi%2BPv5NQBiW&X-Amz-Signature=4244f5643778cdfa2a05efa33b1d65d806550b25812996539ce0a33305239ff0&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466WIGLOJ7K%2F20260517%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260517T125432Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjENz%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIB7BeTHy0ZF2KrQ5ddPUa7bAosgPFUzBBKK%2FAiXFjsKiAiADlr2xZ8rCXhMNR1w5X89I7uqYYSYfy4OZ%2Bw78EFBnnCqIBAil%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMmdbXwvR4OS0bZkBaKtwD0wRziHc1WAAgBABuFnFyNfG%2FwFTOI0sbFfMroR29uBM5MIeeCUNqgLLQlfYZXx22v9%2FEtlH8QT726YY5Ad3MOjjgSX7iXWjBG7chciL50ArWXEli8OkVqRcyBGAXBmfW8t7UzD3PVXL8KDfPVW4aaaifqXcWuWODfFH%2BGKw1fkUMADiHLDi3ilU2WP9kKICEToad2kp6Z2CP9%2BfMhzMgFF0xRwY1kyo7GyGvX%2BbqwNAedJHJUVW78xi8hfwlQmUcHvmTeIa7d0L0SxBN3x4ea%2F4JY6%2BG%2FnoXlknfV%2BcuDepQ3MxfmUs8IHic2ezV02lK50SYr7LwfqaQzxqeOYgG7Sl17dBzux9tx%2BCu%2BL1Hl0WO7EqVpaTMI0PMBGr7dl8pawzj%2FFDA1olcO4rNCnbmLq%2BiO5GK3m8LNpjwSIZ%2BcWqxmbXgDv0Fjvnnm4srwKlO1pupdWt0Cb7ONFdMgwIWgzph09VtmLBcYPAP1F6n%2B%2BYqLWIp5Zh94yO3fNOchWTdnpcjXt44FuX59UWRkLt%2BECb2OAWDtFA5V7NOsYbmQwd1a8NvsHfmV3sU7Mqs4IpuTmmEe6gPnvcgN5lzmZsJZBz0CC7OcsSFQWklCk61xeArqeZi3c9xyqVplG4w0sqm0AY6pgHFRzSJTXiOzO8rxibg0vVey%2FyjMDwKOibw7E%2FK7vcTPiPkjSE75Xg2duMoUghpZj04gLCoRplputN2fje%2F8CRRj7cdoh1RZ5M3wu%2Bavbf8VAKLd4VVeLXwuepaOcOilcMNNuWbSy3BxRKP1sxLVoP3ZVQaYbfyOoTc3pfqmtY0TGsYjptLiXcvZMliDYF3YN%2BpALPS5miWKO0kXmUSawi%2BPv5NQBiW&X-Amz-Signature=65b520e51fdadb89ae2c872ab3c6cfc4734105241f605c74b771aec88ec63cdc&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

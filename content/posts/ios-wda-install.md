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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466WABARZNR%2F20260209%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260209T011356Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjELn%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIHuNU32v6IXsV%2Fjf4yDoF7Lkwxq1%2FX8O640Ve3xr%2BNTEAiEAkgTd%2FX9DXphR%2BTsJz9zKezRR5Ck14VWpl5KO1urubZoqiAQIgv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDNtzl6AeSFiypZm70SrcA%2F7ibPcd0CNFZxve9%2FdCL0rM3beTz%2BmaJIAfdYaY2KBUnlPl7DEiW5A4s0vndR1Pf31RAKoronXp6OiVE7rwCRtK%2Ff%2FyXMysrwewbk%2BhHwetboyCbtKckOsSHKTiCl%2BAna%2BCgjnKw3mk1jFS9DQlwmraynZPiLRNbGbVIUOmmzRBD5E1ivOntOUz2UYObvWhr5FeR2qC3TTYUuzLn0yNRNpKhyyjR95ns%2FUT8PVwGz04x7tEtqQ5UuADLGrN%2BvlthTZ%2BEOUFQoWnGO%2BwJNCxqb9f75TWwGVYV83%2BIe6qaVutmMSmaC5y67mUH4X1uVOzmuYVCdPle5ML9IBSZv%2BAerjcJs85RRgfsiVozG6lZajsXg59h6TagbPRMphnKFeRA4u3kp0ScWf%2FFwnD14oztcpBJxLzGBmSxwsmLvLnChgYl14cQG%2B1gBn8Hyp2wNYQD1kV5StJs%2BkddvVVfmtRGkY7E5Unr7O7K0JENnyhIsXOkCEKCl5Jvn%2F6RkbUo02m6pFXKhl%2F7k14gd2iCitYaJ5nH1ffL0Nr%2BnEdbjDYAv7yvMqd9CpSC2X1%2BB14Li07zVbsC%2BSU4FOJNPGvXItN0%2FD0gu5wVVrPQVsSJvjhDUT964o2L2qMoCzd23cjMJTWpMwGOqUBjoM8AHs7ZLMSkcsvefknBpZWugWyAhEaB8JxHtZ08rPPitvCQxh22YgNuEZI1D1pIvz8OLe23Ho3XZDDBfBpT4Ry0KKbqGtmnLQ88zH%2FV7y0Hg8zDWcr6oa8PTQu7wyASKEw39NMs%2BM4fUNnN7lH%2FoE2SHIcv20AGgxBjsPc4thU5xBm3zJ8HYXI0XcZjS%2FaPB44TocXq%2FtVCsgUk8VxKTVlxaHp&X-Amz-Signature=13ee0280a6fe086983bdf15e25de6f1f35b0b737b9edab660d03590b57e41c13&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466WABARZNR%2F20260209%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260209T011356Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjELn%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIHuNU32v6IXsV%2Fjf4yDoF7Lkwxq1%2FX8O640Ve3xr%2BNTEAiEAkgTd%2FX9DXphR%2BTsJz9zKezRR5Ck14VWpl5KO1urubZoqiAQIgv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDNtzl6AeSFiypZm70SrcA%2F7ibPcd0CNFZxve9%2FdCL0rM3beTz%2BmaJIAfdYaY2KBUnlPl7DEiW5A4s0vndR1Pf31RAKoronXp6OiVE7rwCRtK%2Ff%2FyXMysrwewbk%2BhHwetboyCbtKckOsSHKTiCl%2BAna%2BCgjnKw3mk1jFS9DQlwmraynZPiLRNbGbVIUOmmzRBD5E1ivOntOUz2UYObvWhr5FeR2qC3TTYUuzLn0yNRNpKhyyjR95ns%2FUT8PVwGz04x7tEtqQ5UuADLGrN%2BvlthTZ%2BEOUFQoWnGO%2BwJNCxqb9f75TWwGVYV83%2BIe6qaVutmMSmaC5y67mUH4X1uVOzmuYVCdPle5ML9IBSZv%2BAerjcJs85RRgfsiVozG6lZajsXg59h6TagbPRMphnKFeRA4u3kp0ScWf%2FFwnD14oztcpBJxLzGBmSxwsmLvLnChgYl14cQG%2B1gBn8Hyp2wNYQD1kV5StJs%2BkddvVVfmtRGkY7E5Unr7O7K0JENnyhIsXOkCEKCl5Jvn%2F6RkbUo02m6pFXKhl%2F7k14gd2iCitYaJ5nH1ffL0Nr%2BnEdbjDYAv7yvMqd9CpSC2X1%2BB14Li07zVbsC%2BSU4FOJNPGvXItN0%2FD0gu5wVVrPQVsSJvjhDUT964o2L2qMoCzd23cjMJTWpMwGOqUBjoM8AHs7ZLMSkcsvefknBpZWugWyAhEaB8JxHtZ08rPPitvCQxh22YgNuEZI1D1pIvz8OLe23Ho3XZDDBfBpT4Ry0KKbqGtmnLQ88zH%2FV7y0Hg8zDWcr6oa8PTQu7wyASKEw39NMs%2BM4fUNnN7lH%2FoE2SHIcv20AGgxBjsPc4thU5xBm3zJ8HYXI0XcZjS%2FaPB44TocXq%2FtVCsgUk8VxKTVlxaHp&X-Amz-Signature=ad00daaa175a0d85d260b1d1a05f66825c32598e6a05f63c09f96a91fc60197c&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

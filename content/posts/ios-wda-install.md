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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466UQTPDDRX%2F20251207%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251207T121927Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEML%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIBuhvV8ggGqBBcSMV9vejj4Vef%2Fai5cHDd0sH%2B%2B5eN3GAiBvzxE0ZosO6TyadxTR%2BKFxGS04bZY3BMGzNYyPtRarKSqIBAiL%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMkRRs88FC%2F3wKi1Z%2BKtwD5b40wCHxr4ew%2FMD5xcuHPa3%2B0Pv336IFPbedqhwBENWQ%2B%2BcgKvQU0mIyf2j5xDCs8bOV%2BRKbv02ewv6GhNyQ%2Bi7nZWofXd4QWldGPbgVYsYIffXj0pT%2FTozfaPdgan2ed6V4A32e55fP2Sd1F5oam%2F3BQvQRlHF8wClUxNEDoMoKITRzqGlfc2LYLiVO9ns9L8H3g8PPY%2Bizr67eSzsk83YccvEEO0I7CyhJZkMGK3HDM%2Bda9OMfZEMOXLwzGBcBK%2FbIThXsUgfyG4eeJVRvXEoq1t5e95yRLfyycCa0kQxkDdCJgdtC2lCi0Fm0lX8w5l8EdAUGVTuyUVtOU66RXWB%2B1qoyIKP0Fkpm3xyHZk0WoyVNmUhs9TGQl%2BkyTE6DYicPTCE7cypLGwlM2m8hKxYCaWzfze8Wcz9%2BkOx13JjEQW90wMLy218eVjslQBQ%2BO4jAn08qwY91K40CfspkD0fuefwop83NQliGGMlrG6zKmkRt9h%2BOcK78AZTxZdl8b9N5mCbo7RzZWEiO0hBqmuLaPBR2RRS0zXfClUGop%2BCfVL0bqs07jjV7%2FHlgCiSNwlJA%2FEHBSlLX9PTH5eSmZC1%2BFMCFrtjzbpWY%2F7ZLEvM9ytWGE5LhlrxUnEowrJnVyQY6pgFX0TQaJU4KN%2BT7ZbrpC1bfOYNryuPBKrTHeKi3WZL0FEcYTVMeSkk3ys6wv4T5Y6hDTuYnhy2AW0loxcvwVFYs%2FhLS%2B%2FX68n68fEMmvW%2BiebHHrrxAi2xchE0IkroWvWoQWMYvEppd7rS8R7kSaCptfSSjiZdpdxrQxKqnD5w%2FV0bIAdr80tcSVDkUOhQaZj5cqZbw%2BvUbj6mKHiplMNROjBKaHsJr&X-Amz-Signature=583242a61c94aa94b184d55024129a8f56b15956795b4e76ff194663007b3be1&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466UQTPDDRX%2F20251207%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251207T121927Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEML%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIBuhvV8ggGqBBcSMV9vejj4Vef%2Fai5cHDd0sH%2B%2B5eN3GAiBvzxE0ZosO6TyadxTR%2BKFxGS04bZY3BMGzNYyPtRarKSqIBAiL%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMkRRs88FC%2F3wKi1Z%2BKtwD5b40wCHxr4ew%2FMD5xcuHPa3%2B0Pv336IFPbedqhwBENWQ%2B%2BcgKvQU0mIyf2j5xDCs8bOV%2BRKbv02ewv6GhNyQ%2Bi7nZWofXd4QWldGPbgVYsYIffXj0pT%2FTozfaPdgan2ed6V4A32e55fP2Sd1F5oam%2F3BQvQRlHF8wClUxNEDoMoKITRzqGlfc2LYLiVO9ns9L8H3g8PPY%2Bizr67eSzsk83YccvEEO0I7CyhJZkMGK3HDM%2Bda9OMfZEMOXLwzGBcBK%2FbIThXsUgfyG4eeJVRvXEoq1t5e95yRLfyycCa0kQxkDdCJgdtC2lCi0Fm0lX8w5l8EdAUGVTuyUVtOU66RXWB%2B1qoyIKP0Fkpm3xyHZk0WoyVNmUhs9TGQl%2BkyTE6DYicPTCE7cypLGwlM2m8hKxYCaWzfze8Wcz9%2BkOx13JjEQW90wMLy218eVjslQBQ%2BO4jAn08qwY91K40CfspkD0fuefwop83NQliGGMlrG6zKmkRt9h%2BOcK78AZTxZdl8b9N5mCbo7RzZWEiO0hBqmuLaPBR2RRS0zXfClUGop%2BCfVL0bqs07jjV7%2FHlgCiSNwlJA%2FEHBSlLX9PTH5eSmZC1%2BFMCFrtjzbpWY%2F7ZLEvM9ytWGE5LhlrxUnEowrJnVyQY6pgFX0TQaJU4KN%2BT7ZbrpC1bfOYNryuPBKrTHeKi3WZL0FEcYTVMeSkk3ys6wv4T5Y6hDTuYnhy2AW0loxcvwVFYs%2FhLS%2B%2FX68n68fEMmvW%2BiebHHrrxAi2xchE0IkroWvWoQWMYvEppd7rS8R7kSaCptfSSjiZdpdxrQxKqnD5w%2FV0bIAdr80tcSVDkUOhQaZj5cqZbw%2BvUbj6mKHiplMNROjBKaHsJr&X-Amz-Signature=07c1be9b9c03f5e79e589552ac69b2e37b5b7e330c8bae4c266ae3f2c8641932&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
